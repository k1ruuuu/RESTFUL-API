# api/v1/endpoints/users.py
from fastapi import APIRouter, Depends, HTTPException, Query, status
from typing import List, Optional
from schemas.user import UserInDB, UserCreate, UserUpdate
from crud.user import crud_user
from services.user_service import user_service
from api.v1.endpoints.auth import get_current_admin, get_current_user
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)


router = APIRouter(prefix="/users", tags=["users"])

# Public endpoints (untuk user yang sudah login)
@router.get("/me", response_model=UserInDB)
async def get_current_user_info(
    current_user: dict = Depends(get_current_user)
):
    """Get current user profile"""
    return user_service.get_user_profile(current_user["id"])

@router.put("/me", response_model=UserInDB)
async def update_current_user(
    user_in: UserUpdate,
    current_user: dict = Depends(get_current_user)
):
    """Update current user profile"""
    try:
        # Hanya update field yang diizinkan untuk user biasa
        update_data = {}
        if user_in.name is not None:
            update_data["name"] = user_in.name
        if user_in.password is not None:
            update_data["password"] = user_in.password
        
        updated_user = user_service.update_user(current_user["id"], update_data)
        if not updated_user:
            raise HTTPException(status_code=404, detail="User not found")
        
        return updated_user
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.post("/me/change-password")
async def change_my_password(
    old_password: str,
    new_password: str,
    current_user: dict = Depends(get_current_user)
):
    """Change current user password"""
    success = user_service.change_password(current_user["id"], old_password, new_password)
    if not success:
        raise HTTPException(
            status_code=400,
            detail="Old password is incorrect or user not found"
        )
    
    return {"message": "Password changed successfully"}

# Admin endpoints
@router.get("/", response_model=List[UserInDB])
async def get_all_users(
    current_user: dict = Depends(get_current_admin),
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=1000),
    include_stats: bool = Query(False, description="Include statistics")
):
    """Mendapatkan semua user (admin only)"""
    if include_stats:
        result = user_service.get_users_with_stats(skip=skip, limit=limit)
        return result["users"]
    else:
        users = crud_user.get_multi(skip=skip, limit=limit)
        # Remove passwords
        for user in users:
            user.pop("password", None)
        return users

@router.get("/stats")
async def get_user_statistics(
    current_user: dict = Depends(get_current_admin)
):
    """Get user statistics (admin only)"""
    result = user_service.get_users_with_stats()
    return {
        "stats": result["stats"],
        "total_users": result["stats"]["total"]
    }

@router.get("/{user_id}", response_model=UserInDB)
async def get_user(
    user_id: int,
    current_user: dict = Depends(get_current_admin)
):
    """Mendapatkan user berdasarkan ID (admin only)"""
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    
    user.pop("password", None)
    return user

@router.post("/", response_model=UserInDB, status_code=status.HTTP_201_CREATED)
async def create_user(
    user_in: UserCreate,
    current_user: dict = Depends(get_current_admin)
):
    logger.debug("="*50)
    logger.debug("CREATE USER REQUEST RECEIVED")
    logger.debug(f"Current user (admin): {current_user.get('username')}")
    logger.debug(f"Request body: {user_in.dict()}")
    logger.debug("="*50)

    try:
        # Log sebelum create
        logger.debug("Calling user_service.create_user...")
        
        new_user = user_service.create_user(user_in.dict())
        
        logger.debug(f"User created successfully: {new_user.get('username')}")
        return new_user
        
    except ValueError as e:
        logger.error(f"ValueError: {str(e)}")
        raise HTTPException(status_code=400, detail=str(e))
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}", exc_info=True)
        raise HTTPException(status_code=500, detail=f"Internal server error: {str(e)}")

    """Membuat user baru (admin only)"""
    try:
        new_user = user_service.create_user(user_in.dict())
        return new_user
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/{user_id}", response_model=UserInDB)
async def update_user(
    user_id: int,
    user_in: UserUpdate,
    current_user: dict = Depends(get_current_admin)
):
    """Update user (admin only)"""
    try:
        # Cek user exists
        user = crud_user.get(user_id)
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        # Filter out None values
        update_data = {k: v for k, v in user_in.dict().items() if v is not None}
        
        updated_user = user_service.update_user(user_id, update_data)
        if not updated_user:
            raise HTTPException(status_code=400, detail="Update failed")
        
        return updated_user
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{user_id}")
async def delete_user(
    user_id: int,
    current_user: dict = Depends(get_current_admin)
):
    """Hapus user (admin only)"""
    # Cek user exists
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    
    # Cek jangan hapus diri sendiri
    if user_id == current_user["id"]:
        raise HTTPException(status_code=400, detail="Cannot delete your own account")
    
    success = user_service.delete_user(user_id)
    if not success:
        raise HTTPException(status_code=400, detail="Delete failed")
    
    return {"message": "User deleted successfully"}

@router.post("/{user_id}/reset-password")
async def reset_user_password(
    user_id: int,
    new_password: str,
    current_user: dict = Depends(get_current_admin)
):
    """Reset password user (admin only)"""
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    
    # Hash password baru
    from core.security import get_password_hash
    hashed_password = get_password_hash(new_password)
    
    updated = crud_user.update(user_id, {"password": hashed_password})
    if not updated:
        raise HTTPException(status_code=400, detail="Failed to reset password")
    
    return {"message": "Password reset successfully"}