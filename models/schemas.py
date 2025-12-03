# from pydantic import BaseModel, Field
# from typing import Optional
# from datetime import datetime

# class UserBase(BaseModel):
#     username: str = Field(..., min_length=3, max_length=50)
#     name: str = Field(..., min_length=2, max_length=100)
#     role: str = Field(..., pattern="^(admin|user)$")

# class UserCreate(UserBase):
#     password: str = Field(..., min_length=6)

# class UserUpdate(BaseModel):
#     username: Optional[str] = Field(None, min_length=3, max_length=50)
#     name: Optional[str] = Field(None, min_length=2, max_length=100)
#     password: Optional[str] = Field(None, min_length=6)
#     role: Optional[str] = Field(None, pattern="^(admin|user)$")

# class UserInDB(UserBase):
#     id: int
#     created_at: Optional[datetime] = None
    
#     class Config:
#         from_attributes = True

# # Base schema untuk semua fakultas
# class FakultasBase(BaseModel):
#     no: int
#     fk: str
#     subUnit: str
#     ruangan: str
#     lantai: int
#     gedung: str

# # Schema untuk setiap fakultas
# class FKEkonomiBisnisBase(FakultasBase):
#     ukuranR: Optional[int] = None
#     ket: Optional[str] = None

# class FakultasSyariahBase(FakultasBase):
#     pass

# class FakultasDakwahBase(FakultasBase):
#     pass

# class FakultasTarbiyahBase(FakultasBase):
#     pass

# class FakultasHukumBase(FakultasBase):
#     pass

# class FakultasPsikologiBase(FakultasBase):
#     pass

# class FakultasMipaBase(FakultasBase):
#     pass

# class FakultasTeknikBase(FakultasBase):
#     pass

# class FakultasIKBase(FakultasBase):
#     pass

# class FakultasKedokteranBase(FakultasBase):
#     pass

# # Response schemas dengan ID
# class FakultasResponse(FakultasBase):
#     id: int
#     created_at: Optional[datetime] = None
    
#     class Config:
#         from_attributes = True

# class FKEkonomiResponse(FKEkonomiBisnisBase):
#     id: int
#     created_at: Optional[datetime] = None
    
#     class Config:
#         from_attributes = True

# # Auth schemas (akan digunakan nanti)
# class Token(BaseModel):
#     access_token: str
#     token_type: str

# class TokenData(BaseModel):
#     username: Optional[str] = None