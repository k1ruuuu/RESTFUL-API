from fastapi import APIRouter, HTTPException, Query
from typing import List
from schemas.fakultas import (
    FKTarbiyahInDB, 
    FKTarbiyahCreate,
    FKTarbiyahUpdate
)
from crud.fakultas import crud_fk_tarbiyah

router = APIRouter(prefix="/fk_tarbiyah", tags=["fakultas tarbiyah"])

@router.get("/", response_model=List[FKTarbiyahInDB])
async def get_all(
    skip: int = 0,
    limit: int = 100,
    gedung: str = None,
    lantai: int = None
):
    """Mendapatkan semua data fakultas tarbiyah"""
    filters = {}
    if gedung:
        filters["gedung"] = gedung
    if lantai:
        filters["lantai"] = lantai
    
    data = crud_fk_tarbiyah.get_multi(skip=skip, limit=limit, filters=filters)
    return data

@router.get("/{id}", response_model=FKTarbiyahInDB)
async def get_by_id(id: int):
    """Mendapatkan data berdasarkan ID"""
    data = crud_fk_tarbiyah.get(id)
    if not data:
        raise HTTPException(status_code=404, detail="Data not found")
    return data

@router.get("/no/{no}", response_model=FKTarbiyahInDB)
async def get_by_no(no: int):
    """Mendapatkan data berdasarkan nomor"""
    data = crud_fk_tarbiyah.get_by_no(no)
    if not data:
        raise HTTPException(status_code=404, detail="Data not found")
    return data

@router.post("/", response_model=FKTarbiyahInDB)
async def create_data(data_in: FKTarbiyahCreate):
    """Membuat data baru"""
    # Cek duplikasi nomor
    existing = crud_fk_tarbiyah.get_by_no(data_in.no)
    if existing:
        raise HTTPException(status_code=400, detail="Nomor already exists")
    
    data = crud_fk_tarbiyah.create(data_in)
    return data

@router.put("/{id}", response_model=FKTarbiyahInDB)
async def update_data(id: int, data_in: FKTarbiyahUpdate):
    """Update data"""
    data = crud_fk_tarbiyah.get(id)
    if not data:
        raise HTTPException(status_code=404, detail="Data not found")
    
    # Cek jika no diupdate, pastikan tidak duplikat
    if data_in.no and data_in.no != data["no"]:
        existing = crud_fk_tarbiyah.get_by_no(data_in.no)
        if existing:
            raise HTTPException(status_code=400, detail="Nomor already exists")
    
    updated_data = crud_fk_tarbiyah.update(id, data_in)
    if not updated_data:
        raise HTTPException(status_code=400, detail="Update failed")
    
    return updated_data

@router.delete("/{id}")
async def delete_data(id: int):
    """Hapus data"""
    success = crud_fk_tarbiyah.delete(id)
    if not success:
        raise HTTPException(status_code=404, detail="Data not found")
    
    return {"message": "Data deleted successfully"}