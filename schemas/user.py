from pydantic import BaseModel, Field
from typing import Optional

VALID_ROLES_PATTERN = "^(admin|user|developer)$"

class UserBase(BaseModel):
    username: str = Field(..., min_length=3, max_length=50)
    name: str = Field(..., min_length=2, max_length=100)
    role: str = Field(..., pattern=VALID_ROLES_PATTERN)

class UserCreate(UserBase):
    password: str = Field(..., min_length=6)

class UserUpdate(BaseModel):
    username: Optional[str] = Field(None, min_length=3, max_length=50)
    name: Optional[str] = Field(None, min_length=2, max_length=100)
    password: Optional[str] = Field(None, min_length=6)
    role: Optional[str] = Field(None, pattern=VALID_ROLES_PATTERN)

class UserInDB(UserBase):
    id: int

    class Config:
        from_attributes = True