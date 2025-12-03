from pydantic import BaseModel, Field
from typing import Optional

class FakultasBase(BaseModel):
    no: int
    fk: str
    subUnit: str
    ruangan: str
    lantai: int
    gedung: str

class FKEkonomiBisnisBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKEkonomiBisnisCreate(FKEkonomiBisnisBase):
    pass

class FKEkonomiBisnisUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKEkonomiBisnisInDB(FKEkonomiBisnisBase):
    id: int
    
    class Config:
        from_attributes = True

# Schema untuk fakultas lainnya (bisa dibuat terpisah)
# class FakultasSyariahBase(FakultasBase):
#     pass

# class FakultasDakwahBase(FakultasBase):
#     pass

# # ... dan seterusnya untuk fakultas lainnya