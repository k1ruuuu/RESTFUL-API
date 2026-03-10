from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime


class MaintenBase(BaseModel):
    status: bool = Field(..., description="False = Normal, True = Maintenance aktif")
    message: str = Field(
        default="Kami sedang melakukan pembaruan sistem. Mohon tunggu sebentar dan coba kembali.",
        max_length=500,
        description="Pesan yang ditampilkan saat maintenance"
    )


class MaintenUpdate(BaseModel):
    """Schema untuk PUT /mainten/1 — semua field opsional"""
    status: Optional[bool] = None
    message: Optional[str] = Field(None, max_length=500)


class MaintenInDB(MaintenBase):
    id: int
    updated_by: Optional[str] = None
    updated_at: datetime
    created_at: datetime

    class Config:
        from_attributes = True


class MaintenResponse(BaseModel):
    """Response ringan untuk polling frontend"""
    id: int
    status: bool
    message: str
    updated_at: datetime

    class Config:
        from_attributes = True