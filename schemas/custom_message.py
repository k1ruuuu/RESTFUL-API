from pydantic import BaseModel, Field, validator
from typing import Optional, Literal
from datetime import datetime

# Role target yang valid (disesuaikan dengan frontend: viewer → user)
TargetRole = Literal["all", "admin", "user"]


class CustomMessageCreate(BaseModel):
    from_name: str = Field(..., max_length=100, description="Nama/username pengirim")
    target_role: Optional[TargetRole] = Field(
        None,
        description="Target berdasarkan role. NULL jika target username tertentu"
    )
    target_username: Optional[str] = Field(
        None,
        max_length=100,
        description="Target username spesifik. NULL jika target semua/role"
    )
    message: str = Field(..., description="Isi pesan")

    @validator("target_role", "target_username")
    def validate_target(cls, v, values):
        """Pastikan salah satu dari target_role atau target_username diisi"""
        return v

    @validator("target_username")
    def check_target_not_both_none(cls, target_username, values):
        target_role = values.get("target_role")
        if target_role is None and target_username is None:
            raise ValueError("Salah satu dari target_role atau target_username harus diisi")
        if target_role is not None and target_username is not None:
            raise ValueError("Tidak bisa mengisi target_role dan target_username sekaligus")
        return target_username


class CustomMessageMarkRead(BaseModel):
    message_id: int


class CustomMessageInDB(CustomMessageCreate):
    id: int
    is_read: bool = False
    read_at: Optional[datetime] = None
    created_at: datetime

    class Config:
        from_attributes = True


class CustomMessageUnreadResponse(BaseModel):
    """Response untuk GET /custom_message/unread — satu pesan belum dibaca"""
    id: int
    from_name: str
    message: str
    created_at: datetime

    class Config:
        from_attributes = True