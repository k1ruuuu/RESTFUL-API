from typing import Optional, Dict, Any
from crud.user import crud_user
from core.security import verify_password, get_password_hash

class UserService:
    """Service untuk logika bisnis terkait user"""
    
    @staticmethod
    def authenticate_user(username: str, password: str) -> Optional[Dict[str, Any]]:
        """Autentikasi user"""
        user = crud_user.get_by_username(username)
        if not user:
            return None
        
        # TODO: Implement proper password verification with hashing
        # For now, simple string comparison
        if user.get("password") != password:
            return None
        
        # Remove password from response
        user.pop("password", None)
        return user
    
    @staticmethod
    def create_user(user_data: Dict[str, Any]) -> Dict[str, Any]:
        """Membuat user baru dengan validasi"""
        # Cek username sudah ada
        existing = crud_user.get_by_username(user_data.get("username", ""))
        if existing:
            raise ValueError("Username already exists")
        
        # Hash password sebelum disimpan
        if "password" in user_data:
            # TODO: Enable password hashing
            # user_data["password"] = get_password_hash(user_data["password"])
            pass  # For now, keep plain password
        
        # Set default role jika tidak ada
        if "role" not in user_data:
            user_data["role"] = "user"
        
        return crud_user.create(user_data)
    
    @staticmethod
    def update_user(user_id: int, update_data: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Update user dengan validasi"""
        # Cek user exists
        user = crud_user.get(user_id)
        if not user:
            return None
        
        # Jika update username, cek tidak conflict dengan user lain
        if "username" in update_data and update_data["username"] != user.get("username"):
            existing = crud_user.get_by_username(update_data["username"])
            if existing:
                raise ValueError("Username already taken by another user")
        
        # Hash password jika diupdate
        if "password" in update_data and update_data["password"]:
            # TODO: Enable password hashing
            # update_data["password"] = get_password_hash(update_data["password"])
            pass  # For now, keep plain password
        
        return crud_user.update(user_id, update_data)
    
    @staticmethod
    def get_user_profile(user_id: int) -> Optional[Dict[str, Any]]:
        """Mendapatkan profile user tanpa password"""
        user = crud_user.get(user_id)
        if user:
            user.pop("password", None)
            return user
        return None
    
    @staticmethod
    def get_users_with_stats(skip: int = 0, limit: int = 100) -> Dict[str, Any]:
        """Mendapatkan users dengan statistik"""
        users = crud_user.get_multi(skip=skip, limit=limit)
        
        # Remove passwords
        for user in users:
            user.pop("password", None)
        
        # Hitung statistik
        total_users = len(users)
        admin_count = sum(1 for user in users if user.get("role") == "admin")
        user_count = total_users - admin_count
        
        return {
            "users": users,
            "stats": {
                "total": total_users,
                "admins": admin_count,
                "regular_users": user_count
            }
        }
    
    @staticmethod
    def change_password(user_id: int, old_password: str, new_password: str) -> bool:
        """Ganti password user"""
        user = crud_user.get(user_id)
        if not user:
            return False
        
        # Verify old password
        # TODO: Implement proper password verification with hashing
        if user.get("password") != old_password:
            return False
        
        # Update with new password
        # TODO: Hash new password
        # hashed_password = get_password_hash(new_password)
        update_data = {"password": new_password}
        updated = crud_user.update(user_id, update_data)
        
        return updated is not None

user_service = UserService()