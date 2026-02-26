from datetime import datetime, timedelta
from typing import Optional, Dict, Any
from jose import JWTError, jwt
from passlib.context import CryptContext
from fastapi import HTTPException, status
from core.config import settings
import traceback


# Password hashing
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
print(f"✅ pwd_context initialized with schemes: {pwd_context.schemes()}")

# JWT settings (akan digunakan nanti)
SECRET_KEY = "d3nah-app-010226-smkbpp"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """Verifikasi password dengan debug detail"""
    print(f"\n🔐 verify_password() called")
    print(f"   Plain password: '{plain_password}'")
    print(f"   Hashed password: '{hashed_password[:30]}...'")
    print(f"   Hashed length: {len(hashed_password)}")
    
    try:
        # Cek jika hash kosong
        if not hashed_password:
            print(f"❌ ERROR: Hashed password is empty!")
            return False
        
        # Cek jika hash bukan string bcrypt
        if not hashed_password.startswith('$2'):
            print(f"⚠️  WARNING: Hash doesn't start with '$2' (not bcrypt)")
            print(f"   Hash prefix: {hashed_password[:10]}")
        
        # Coba verify
        print(f"   Calling pwd_context.verify()...")
        result = pwd_context.verify(plain_password, hashed_password)
        print(f"   pwd_context.verify() returned: {result}")
        
        return result
        
    except Exception as e:
        print(f"🔥 ERROR in verify_password: {type(e).__name__}: {e}")
        print(f"🔥 ERROR details:")
        traceback.print_exc()
        return False

def get_password_hash(password: str) -> str:
    """Hash password"""
    print(f"\n🔐 get_password_hash() called for: '{password}'")
    
    try:
        hash_result = pwd_context.hash(password)
        print(f"✅ Hash created: {hash_result[:30]}...")
        print(f"   Length: {len(hash_result)}")
        return hash_result
    except Exception as e:
        print(f"🔥 ERROR in get_password_hash: {e}")
        traceback.print_exc()
        return ""


def create_access_token(data: dict, expires_delta: Optional[timedelta] = None):
    """Buat JWT token (akan digunakan nanti)"""
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

def verify_token(token: str):
    """Verifikasi JWT token (akan digunakan nanti)"""
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        return payload
    except JWTError:
        return None

def validate_user_role(user_role: str, required_role: str) -> bool:
    """Validasi role user"""
    role_hierarchy = {
        "user": ["user"],
        "admin": ["admin", "user"]
    }
    
    if required_role not in role_hierarchy:
        return False
    
    return user_role in role_hierarchy[required_role]