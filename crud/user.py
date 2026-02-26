# crud/user.py
from typing import Optional, Dict, Any
from crud.base import CRUDBase
from core.security import verify_password, get_password_hash
from core.database import db
import traceback
import datetime
import logging

logger = logging.getLogger(__name__)

class CRUDUser(CRUDBase):
    def __init__(self):
        super().__init__("users")

    def get(self, user_id: int) -> Optional[Dict[str, Any]]:
        """Get user by ID"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
                    result = cursor.fetchone()
                    
                    if result:
                        if hasattr(result, 'items'):
                            result = dict(result)
                        return result
                    return None
        except Exception as e:
            logger.error(f"Error in get: {e}")
            return None

    def create(self, obj_in: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Create a new user"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    cursor.execute(
                        "SELECT id FROM users WHERE username = %s",
                        (obj_in.get("username"),)
                    )
                    existing = cursor.fetchone()
                    
                    if existing:
                        raise ValueError("Username already exists")
                    
                    query = """
                        INSERT INTO users (username, name, password, role, created_at)
                        VALUES (%s, %s, %s, %s, NOW())
                    """
                    params = (
                        obj_in.get("username"),
                        obj_in.get("name"),
                        obj_in.get("password"),
                        obj_in.get("role", "user")
                    )
                    
                    cursor.execute(query, params)
                    user_id = cursor.lastrowid
                    conn.commit()
                    
                    new_user = self.get(user_id)
                    return new_user
                    
        except ValueError as e:
            raise
        except Exception as e:
            logger.error(f"Database error in create: {e}")
            raise

    def get_by_username(self, username: str) -> Optional[Dict[str, Any]]:
        """Get user by username"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    cursor.execute(
                        "SELECT * FROM users WHERE username = %s",
                        (username,)
                    )
                    user = cursor.fetchone()
                    
                    if user:
                        if hasattr(user, 'items'):
                            user = dict(user)
                        return user
                    return None
                    
        except Exception as e:
            logger.error(f"Error in get_by_username: {e}")
            return None

    def get_multi(self, skip: int = 0, limit: int = 100) -> list:
        """Get multiple users"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    cursor.execute(
                        "SELECT * FROM users ORDER BY id LIMIT %s OFFSET %s",
                        (limit, skip)
                    )
                    results = cursor.fetchall()
                    
                    users = []
                    for row in results:
                        if hasattr(row, 'items'):
                            users.append(dict(row))
                        else:
                            users.append(row)
                    
                    return users
        except Exception as e:
            logger.error(f"Error in get_multi: {e}")
            return []

    def update(self, user_id: int, obj_in: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Update user"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    set_clause = ", ".join([f"{key} = %s" for key in obj_in.keys()])
                    values = list(obj_in.values())
                    values.append(user_id)
                    
                    query = f"UPDATE users SET {set_clause} WHERE id = %s"
                    
                    cursor.execute(query, values)
                    
                    if cursor.rowcount == 0:
                        return None
                    
                    return self.get(user_id)
        except Exception as e:
            logger.error(f"Error in update: {e}")
            return None

    def delete(self, user_id: int) -> bool:
        """Delete user"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    cursor.execute("DELETE FROM users WHERE id = %s", (user_id,))
                    return cursor.rowcount > 0
        except Exception as e:
            logger.error(f"Error in delete: {e}")
            return False

    def authenticate(self, username: str, password: str) -> Optional[Dict[str, Any]]:
        """Authenticate user"""
        try:
            user = self.get_by_username(username)
            
            if not user:
                return None
            
            stored_password = user.get("password")
            
            if not stored_password:
                return None
            
            is_valid = verify_password(password, stored_password)
            
            if is_valid:
                return user
            else:
                return None
                
        except Exception as e:
            logger.error(f"Error in authenticate: {e}")
            return None

    def update_refresh_token(self, user_id: int, refresh_token: Optional[str], expired_at: Optional[datetime.datetime]) -> Optional[Dict[str, Any]]:
        """Update refresh token"""
        try:
            with db.get_connection() as conn:
                with db.get_cursor(conn) as cursor:
                    query = f"""
                        UPDATE {self.table_name} 
                        SET refresh_token = %s, refresh_token_expires = %s 
                        WHERE id = %s
                    """
                    cursor.execute(query, (refresh_token, expired_at, user_id))
                    
                    if cursor.rowcount > 0:
                        return self.get(user_id)
                    else:
                        return None
                    
        except Exception as e:
            logger.error(f"Error updating refresh token: {e}")
            return None

crud_user = CRUDUser()