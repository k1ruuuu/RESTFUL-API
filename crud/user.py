from typing import Optional, Dict, Any
from crud.base import CRUDBase
from schemas.user import UserCreate, UserUpdate

class CRUDUser(CRUDBase):
    def __init__(self):
        super().__init__("users")
    
    def get_by_username(self, username: str) -> Optional[Dict[str, Any]]:
        return self.search_by_field("username", username)
    
    def authenticate(self, username: str, password: str) -> Optional[Dict[str, Any]]:
        user = self.get_by_username(username)
        if user and user.get("password") == password:
            return user
        return None

crud_user = CRUDUser()