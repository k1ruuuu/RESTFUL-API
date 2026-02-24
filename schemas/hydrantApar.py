from pydantic import BaseModel, Field, ConfigDict
from typing import Optional, Literal
from datetime import datetime

ProteksiType = Literal["Hydrant", "APAR"]
StatusType = Literal["Aktif", "Tidak Aktif", "Dalam Perbaikan"]

class HydrantAparBase(BaseModel):
    model_config = ConfigDict(
        from_attributes=True,
        populate_by_name=True
    )

    no: str
    proteksi: ProteksiType = Field(alias="Proteksi")
    lantai: str = Field(alias="Lantai")
    gedung: str = Field(alias="Gedung")
    kapasitas: Optional[int] = Field(default=None, alias="Kapasitas")
    tekanan: Optional[int] = Field(default=None, alias="Tekanan")
    keterangan: Optional[str] = Field(default=None, alias="Keterangan")
    status: Optional[StatusType] = Field(default="Aktif", alias="Status")

class HydrantAparCreate(HydrantAparBase):
    pass

class HydrantAparUpdate(BaseModel):
    no: Optional[str] = None
    proteksi: Optional[ProteksiType] = None
    lantai: Optional[str] = None
    gedung: Optional[str] = None
    kapasitas: Optional[int] = None
    tekanan: Optional[int] = None
    keterangan: Optional[str] = None
    status: Optional[StatusType] = None

class HydrantAparInDB(HydrantAparBase):
    id: int
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None