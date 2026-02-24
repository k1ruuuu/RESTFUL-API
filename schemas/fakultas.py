from pydantic import BaseModel, Field
from typing import Optional

# Fakultas Base
class FakultasBase(BaseModel):
    no: int
    fk: str
    subUnit: str
    ruangan: str
    lantai: int
    gedung: str

# FK Ekonomi & Bisnis
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

# FK Syariah
class FKSyariahBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKSyariahCreate(FKSyariahBase):
    pass

class FKSyariahUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKSyariahInDB(FKSyariahBase):
    id: int
    
    class Config:
        from_attributes = True

# FK Tarbiyah
class FKTarbiyahBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKTarbiyahCreate(FKTarbiyahBase):
    pass

class FKTarbiyahUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKTarbiyahInDB(FKTarbiyahBase):
    id: int
    
    class Config:
        from_attributes = True

# FK Teknik
class FKTeknikBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKTeknikCreate(FKTeknikBase):
    pass

class FKTeknikUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKTeknikInDB(FKTeknikBase):
    id: int
    
    class Config:
        from_attributes = True

# FK Hukum
class FKHukumBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKHukumCreate(FKHukumBase):
    pass

class FKHukumUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKHukumInDB(FKHukumBase):
    id: int
    
    class Config:
        from_attributes = True

# FK Fikom
class FKFikomBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKFikomCreate(FKFikomBase):
    pass

class FKFikomUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKFikomInDB(FKFikomBase):
    id: int
    
    class Config:
        from_attributes = True

# UNIV
class FKUnivBase(FakultasBase):
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKUnivCreate(FKUnivBase):
    pass

class FKUnivUpdate(BaseModel):
    no: Optional[int] = None
    fk: Optional[str] = None
    subUnit: Optional[str] = None
    ruangan: Optional[str] = None
    lantai: Optional[int] = None
    gedung: Optional[str] = None
    ukuranR: Optional[int] = None
    ket: Optional[str] = None

class FKUnivInDB(FKUnivBase):
    id: int
    
    class Config:
        from_attributes = True