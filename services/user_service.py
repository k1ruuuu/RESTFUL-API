# services/user_service.py
from typing import Optional, Dict, Any
from crud.user import crud_user
from core.security import verify_password, get_password_hash
from core.database import db
import traceback
import logging

logger = logging.getLogger(__name__)

class UserService:
    """Service untuk logika bisnis terkait user"""
    
    @staticmethod
    def authenticate_user(username: str, password: str) -> Optional[Dict[str, Any]]:
        """Autentikasi user"""
        user = crud_user.get_by_username(username)
        if not user:
            return None
        
        if not verify_password(password, user.get("password", "")):
            return None
        
        user.pop("password", None)
        return user
    
    @staticmethod
    def create_user(user_data: Dict[str, Any]) -> Dict[str, Any]:
        """Membuat user baru dengan validasi"""
        print(f"\n{'='*50}")
        print(f"🚀 SERVICE.create_user STARTED")
        print(f"📦 Input data: { {k:v for k,v in user_data.items() if k != 'password'} }")
        print(f"{'='*50}")
        
        try:
            # STEP 1: Cek username
            print(f"\n📌 STEP 1: Checking username: '{user_data.get('username')}'")
            existing = crud_user.get_by_username(user_data.get("username", ""))
            if existing:
                print(f"❌ Username already exists!")
                print(f"   Existing user: {existing.get('id')} - {existing.get('username')}")
                raise ValueError("Username already exists")
            print(f"✅ Username available")
            
            # STEP 2: Hash password
            print(f"\n📌 STEP 2: Hashing password...")
            if "password" in user_data:
                original = user_data["password"]
                print(f"   Original password length: {len(original)}")
                user_data["password"] = get_password_hash(user_data["password"])
                print(f"✅ Password hashed: {user_data['password'][:30]}...")
                print(f"   Hashed length: {len(user_data['password'])}")
            
            # STEP 3: Set default role
            print(f"\n📌 STEP 3: Setting role...")
            if "role" not in user_data:
                user_data["role"] = "user"
                print(f"✅ Default role set: user")
            else:
                print(f"✅ Role provided: {user_data['role']}")
            
            # STEP 4: Call CRUD create
            print(f"\n📌 STEP 4: Calling crud_user.create...")
            print(f"   Data being sent to CRUD: { {k:v for k,v in user_data.items() if k != 'password'} }")
            
            new_user = crud_user.create(user_data)
            
            # STEP 5: Check result
            print(f"\n📌 STEP 5: Checking result...")
            if not new_user:
                print(f"❌ crud_user.create returned None!")
                raise Exception("Failed to create user - CRUD returned None")
            
            print(f"✅ User created successfully!")
            print(f"   ID: {new_user.get('id')}")
            print(f"   Username: {new_user.get('username')}")
            print(f"   Name: {new_user.get('name')}")
            print(f"   Role: {new_user.get('role')}")
            
            # Remove password
            if "password" in new_user:
                del new_user["password"]
            
            print(f"\n{'='*50}")
            print(f"✅ SERVICE.create_user COMPLETED")
            print(f"{'='*50}")
            
            return new_user
            
        except ValueError as e:
            print(f"\n❌ Validation error: {e}")
            print(f"{'='*50}")
            raise
        except Exception as e:
            print(f"\n🔥 UNEXPECTED ERROR in create_user:")
            print(f"   Error type: {type(e).__name__}")
            print(f"   Error message: {str(e)}")
            import traceback
            traceback.print_exc()
            print(f"{'='*50}")
            raise Exception(f"Failed to create user: {str(e)}")
    
    @staticmethod
    def update_user(user_id: int, update_data: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Update user dengan validasi"""
        print(f"\n📋 SERVICE.update_user(user_id={user_id}) called")
        
        # Cek user exists
        user = crud_user.get(user_id)
        if not user:
            print(f"❌ User {user_id} not found")
            return None
        
        # Jika update username, cek tidak conflict dengan user lain
        if "username" in update_data and update_data["username"] != user.get("username"):
            print(f"   Checking if new username '{update_data['username']}' exists...")
            existing = crud_user.get_by_username(update_data["username"])
            if existing:
                print(f"❌ Username already taken by another user")
                raise ValueError("Username already taken by another user")
        
        # Hash password jika diupdate
        if "password" in update_data and update_data["password"]:
            print(f"   Hashing new password...")
            update_data["password"] = get_password_hash(update_data["password"])
        
        # Update user
        print(f"   Calling crud_user.update...")
        updated_user = crud_user.update(user_id, update_data)
        
        # Hapus password dari response
        if updated_user and "password" in updated_user:
            updated_user.pop("password")
        
        if updated_user:
            print(f"✅ User {user_id} updated successfully")
        else:
            print(f"❌ Failed to update user {user_id}")
        
        return updated_user
    
    @staticmethod
    def get_user_profile(user_id: int) -> Optional[Dict[str, Any]]:
        """Mendapatkan profile user tanpa password"""
        user = crud_user.get(user_id)
        if user:
            user.pop("password", None)
            return user
        return None
    
    @staticmethod
    def get_all_users(skip: int = 0, limit: int = 100) -> Dict[str, Any]:
        """Mendapatkan semua users"""
        users = crud_user.get_multi(skip=skip, limit=limit)
        
        # Remove passwords
        for user in users:
            user.pop("password", None)
        
        return {
            "users": users,
            "total": len(users)
        }
    
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
        
        # Hitung role distribution
        role_distribution = {}
        for user in users:
            role = user.get("role", "user")
            role_distribution[role] = role_distribution.get(role, 0) + 1
        
        return {
            "users": users,
            "stats": {
                "total": total_users,
                "admins": admin_count,
                "regular_users": user_count,
                "role_distribution": role_distribution
            }
        }
    
    @staticmethod
    def change_password(user_id: int, old_password: str, new_password: str) -> bool:
        """Ganti password user"""
        user = crud_user.get(user_id)
        if not user:
            return False
        
        # Verify old password dengan bcrypt
        if not verify_password(old_password, user.get("password", "")):
            return False
        
        # Update with new password (hashed)
        hashed_password = get_password_hash(new_password)
        update_data = {"password": hashed_password}
        updated = crud_user.update(user_id, update_data)
        
        return updated is not None
    
    @staticmethod
    def delete_user(user_id: int) -> bool:
        """Hapus user"""
        return crud_user.delete(user_id)

user_service = UserService()