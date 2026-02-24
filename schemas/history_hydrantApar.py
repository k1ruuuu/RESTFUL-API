from pydantic import BaseModel, Field, ConfigDict
from typing import Optional, Literal
from datetime import date, datetime

ProteksiType = Literal["Hydrant", "APAR"]
KondisiType = Literal["Baik", "Perlu Perbaikan", "Rusak"]

class HistoryHydrantAparBase(BaseModel):
    model_config = ConfigDict(
        from_attributes=True,
        populate_by_name=True
    )

    no: str
    proteksi: ProteksiType = Field(alias="Proteksi")

    tanggal_pengisian: Optional[date] = Field(
        default=None,
        alias="Tanggal_Pengisian"
    )

    tanggal_pengecekan: date = Field(
        alias="Tanggal_Pengecekan"
    )

    kapasitas: Optional[str] = Field(default=None, alias="Kapasitas")
    tekanan: Optional[str] = Field(default=None, alias="Tekanan")

    expired_date: Optional[date] = Field(
        default=None,
        alias="Expired_Date"
    )

    keterangan: Optional[str] = Field(default=None, alias="Keterangan")
    pemeriksa: Optional[str] = Field(default=None, alias="Pemeriksa")

    kondisi: Optional[KondisiType] = Field(
        default="Baik",
        alias="Kondisi"
    )

class HistoryHydrantAparCreate(HistoryHydrantAparBase):
    pass

class HistoryHydrantAparUpdate(BaseModel):
    no: Optional[str] = None
    proteksi: Optional[ProteksiType] = None
    tanggal_pengisian: Optional[date] = None
    tanggal_pengecekan: Optional[date] = None
    kapasitas: Optional[str] = None
    tekanan: Optional[str] = None
    expired_date: Optional[date] = None
    keterangan: Optional[str] = None
    pemeriksa: Optional[str] = None
    kondisi: Optional[KondisiType] = None

class HistoryHydrantAparInDB(HistoryHydrantAparBase):
    id: int
    created_at: Optional[datetime] = None