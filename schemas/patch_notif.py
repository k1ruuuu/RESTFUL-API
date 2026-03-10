from pydantic import BaseModel, Field, HttpUrl
from typing import Optional
from datetime import datetime


class PatchNotifCreate(BaseModel):
    title: str = Field(..., max_length=200, description="Judul notifikasi, contoh: Update v2.3.1")
    subtitle: Optional[str] = Field(None, max_length=300, description="Sub judul")
    message: str = Field(..., description="Isi deskripsi perubahan")
    bug_url: Optional[str] = Field(None, max_length=500, description="Link report bug")
    is_active: bool = Field(default=True, description="True = tampil ke user")


class PatchNotifUpdate(BaseModel):
    title: Optional[str] = Field(None, max_length=200)
    subtitle: Optional[str] = Field(None, max_length=300)
    message: Optional[str] = None
    bug_url: Optional[str] = Field(None, max_length=500)
    is_active: Optional[bool] = None


class PatchNotifInDB(PatchNotifCreate):
    id: int
    created_by: Optional[str] = None
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True


class PatchNotifActiveResponse(BaseModel):
    """Response untuk GET /patch_notif/active — hanya field yang dibutuhkan frontend"""
    id: int
    title: str
    subtitle: Optional[str] = None
    message: str
    bug_url: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True