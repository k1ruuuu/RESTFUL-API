from fastapi import APIRouter, Depends, HTTPException, status, Request
from fastapi.security import OAuth2PasswordBearer
from datetime import datetime, timedelta
from core.config import settings
from typing import Optional
from pydantic import BaseModel
from jose import JWTError, jwt

from schemas.auth import LoginRequest
from crud.user import crud_user
from core.security import create_access_token
from services.login_activity_service import login_activity_service
from core.database import db  # <-- TAMBAHKAN IMPORT INI
from collections import Counter  # <-- TAMBAHKAN IMPORT INI

router = APIRouter(prefix="/auth", tags=["authentication"])

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/v1/auth/login")

# ==================== DEPENDENCY FUNCTIONS ====================

async def get_current_user(token: str = Depends(oauth2_scheme)):
    """Get current user from JWT token"""
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    
    try:
        payload = jwt.decode(
            token, 
            settings.SECRET_KEY, 
            algorithms=[settings.ALGORITHM]
        )
        username: str = payload.get("sub")
        
        if username is None:
            raise credentials_exception
        
        # Ambil data user dari database berdasarkan username
        user = crud_user.get_by_username(username)
        if not user:
            raise credentials_exception
        
        # Return data dari database, BUKAN dari payload
        return {
            "id": user["id"],
            "username": user["username"],
            "name": user.get("name", ""),
            "role": user.get("role", "user")
        }
    except JWTError:
        raise credentials_exception

def get_current_admin(current_user: dict = Depends(get_current_user)):
    """Ensure user is admin"""
    if current_user.get("role") != "admin":
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Admin privileges required"
        )
    return current_user

# ==================== MODEL SCHEMA ====================

class RefreshTokenRequest(BaseModel):
    refresh_token: str

class LoginResponse(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"
    user_id: int
    username: str
    name: str
    role: str

# ==================== ENDPOINTS ====================

@router.post("/login", response_model=LoginResponse)
async def login(login_data: LoginRequest, request: Request):
    """Login endpoint dengan pencatatan aktivitas"""
    
    # Cek apakah IP sudah diblokir karena terlalu banyak gagal login
    client_ip = request.client.host if request.client else None
    if client_ip:
        failed_attempts = login_activity_service.get_failed_login_attempts(
            username=login_data.username,
            days=1
        )
        if len(failed_attempts) >= 5:  # Maksimal 5 gagal dalam 1 hari
            raise HTTPException(
                status_code=status.HTTP_429_TOO_MANY_REQUESTS,
                detail="Terlalu banyak percobaan login gagal. Coba lagi nanti."
            )
    
    # Autentikasi user
    user = crud_user.authenticate(login_data.username, login_data.password)
    
    if not user:
        # Catat failed login attempt
        login_activity_service.record_login(
            request=request,
            user_id=0,
            username=login_data.username,
            status="failed"
        )
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Username atau password salah",
            headers={"WWW-Authenticate": "Bearer"},
        )
    
    # Buat access token (15 menit)
    access_token_expires = timedelta(minutes=15)
    access_token = create_access_token(
        data={"sub": user["username"], "user_id": user["id"], "role": user["role"]},
        expires_delta=access_token_expires
    )
    
    # Buat refresh token (7 hari)
    refresh_token_expires = timedelta(days=7)
    refresh_token = create_access_token(
        data={"sub": user["username"], "type": "refresh"},
        expires_delta=refresh_token_expires
    )
    
    # Simpan refresh token ke database
    expired_at = datetime.utcnow() + refresh_token_expires
    crud_user.update_refresh_token(
        user["id"], 
        refresh_token, 
        expired_at
    )
    
    # Generate session ID (gunakan refresh_token sebagai session identifier)
    session_id = refresh_token[:50]  # Ambil 50 karakter pertama sebagai session_id
    
    # Catat successful login
    login_activity_service.record_login(
        request=request,
        user_id=user["id"],
        username=user["username"],
        status="success",
        session_id=session_id
    )
    
    return LoginResponse(
        access_token=access_token,
        refresh_token=refresh_token,
        token_type="bearer",
        user_id=user["id"],
        username=user["username"],
        name=user.get("name", ""),
        role=user["role"]
    )

@router.post("/refresh")
async def refresh_token(refresh_data: RefreshTokenRequest, request: Request):
    """Refresh access token menggunakan refresh token"""
    try:
        payload = jwt.decode(
            refresh_data.refresh_token, 
            settings.SECRET_KEY, 
            algorithms=[settings.ALGORITHM]
        )
        
        username = payload.get("sub")
        token_type = payload.get("type")
        
        if username is None or token_type != "refresh":
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Invalid refresh token"
            )
        
        # Cek refresh token di database
        user = crud_user.get_by_username(username)
        if not user or user.get("refresh_token") != refresh_data.refresh_token:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Refresh token tidak valid"
            )
        
        # Cek expired
        if datetime.utcnow() > user.get("refresh_token_expired"):
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Refresh token expired"
            )
        
        # Buat access token baru
        access_token_expires = timedelta(minutes=15)
        access_token = create_access_token(
            data={"sub": user["username"], "user_id": user["id"], "role": user["role"]},
            expires_delta=access_token_expires
        )
        
        # Catat refresh token activity (opsional)
        session_id = refresh_data.refresh_token[:50]
        login_activity_service.record_login(
            request=request,
            user_id=user["id"],
            username=user["username"],
            status="success",
            session_id=session_id
        )
        
        return {
            "access_token": access_token,
            "token_type": "bearer"
        }
        
    except JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid refresh token"
        )

@router.post("/logout")
async def logout(
    request: Request,
    current_user: dict = Depends(get_current_user)
):
    """Logout endpoint - hapus refresh token dan catat logout"""
    
    # Hapus refresh token dari database
    crud_user.update_refresh_token(current_user["id"], None, None)
    
    # Catat logout
    session_id = request.headers.get("x-session-id") or request.cookies.get("session_id")
    if session_id:
        login_activity_service.record_logout(session_id)
    
    return {"message": "Logout berhasil"}

@router.get("/me")
async def get_current_user_info(
    current_user: dict = Depends(get_current_user)
):
    """Get current user info"""
    # Ambil last login info
    last_login = login_activity_service.get_user_last_login(current_user["id"])
    
    return {
        "id": current_user["id"],
        "username": current_user["username"],
        "name": current_user["name"],
        "role": current_user["role"],
        "last_login": last_login["login_time"] if last_login else None,
        "last_ip": last_login["ip_address"] if last_login else None
    }

# ==================== ADMIN ENDPOINTS UNTUK LOGIN ACTIVITY ====================

@router.get("/admin/login-history")
async def get_all_login_history(
    current_user: dict = Depends(get_current_admin),
    limit: int = 100,
    status_filter: Optional[str] = None
):
    """Get all login history (admin only)"""
    try:
        with db.get_cursor() as cursor:
            query = """
                SELECT la.*, u.name as user_name, u.role as user_role
                FROM login_activity la
                JOIN users u ON la.user_id = u.id
                WHERE 1=1
            """
            params = []
            
            if status_filter:
                query += " AND la.status = %s"
                params.append(status_filter)
            
            query += " ORDER BY la.login_time DESC LIMIT %s"
            params.append(limit)
            
            cursor.execute(query, params)
            history = cursor.fetchall()
        
        return {
            "total": len(history),
            "history": history
        }
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error fetching login history: {str(e)}"
        )

@router.get("/admin/active-sessions")
async def get_active_sessions(
    current_user: dict = Depends(get_current_admin)
):
    """Get all active sessions (admin only)"""
    sessions = login_activity_service.get_active_sessions()
    
    return {
        "total_active_sessions": len(sessions),
        "sessions": sessions
    }

@router.get("/admin/login-stats")
async def get_login_statistics(
    current_user: dict = Depends(get_current_admin)
):
    """Get login statistics (admin only)"""
    stats = login_activity_service.get_login_statistics()
    
    # Tambahkan informasi tambahan
    stats.update({
        "as_of": datetime.now().isoformat(),
        "generated_by": current_user["username"]
    })
    
    return stats

@router.get("/admin/user-login-history/{user_id}")
async def get_user_login_history(
    user_id: int,
    current_user: dict = Depends(get_current_admin),
    days: int = 30,
    limit: int = 50
):
    """Get specific user's login history (admin only)"""
    history = login_activity_service.get_user_history(
        user_id=user_id,
        days=days,
        limit=limit
    )
    
    return {
        "user_id": user_id,
        "total_logins": len(history),
        "history": history
    }

@router.delete("/admin/cleanup-logs")
async def cleanup_old_logs(
    current_user: dict = Depends(get_current_admin),
    days: int = 90
):
    """Clean up old login records (admin only)"""
    deleted = login_activity_service.cleanup_old_logs(days)
    
    return {
        "message": f"Berhasil menghapus {deleted} record login yang lebih dari {days} hari",
        "deleted_count": deleted,
        "retention_days": days
    }

@router.get("/admin/failed-attempts")
async def get_failed_attempts(
    current_user: dict = Depends(get_current_admin),
    username: Optional[str] = None,
    days: int = 7
):
    """Get failed login attempts (admin only)"""
    failed_attempts = login_activity_service.get_failed_login_attempts(
        username=username,
        days=days
    )
    
    # Group by username untuk analisis
    from collections import Counter
    username_counts = Counter([attempt["username"] for attempt in failed_attempts])
    
    return {
        "total_failed": len(failed_attempts),
        "period_days": days,
        "unique_usernames": len(username_counts),
        "top_failed_usernames": [
            {"username": u, "attempts": c} 
            for u, c in username_counts.most_common(10)
        ],
        "failed_attempts": failed_attempts
    }