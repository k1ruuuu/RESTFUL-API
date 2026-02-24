from fastapi import APIRouter, HTTPException, Query
from typing import List
from schemas.hydrantApar import (
    HydrantAparInDB,
    HydrantAparCreate,
    HydrantAparUpdate
)
from crud.hydrantApar import crud_hydrantApar

router = APIRouter(prefix="/hydrantApar", tags=["hydrant dan apar"])

@router.get("/", response_model=List[HydrantAparInDB])
def read_hydrant_apar(skip: int = 0, limit: int = Query(100, le=100)):
    hydrant_apars = crud_hydrantApar.get_multi(skip=skip, limit=limit)
    return hydrant_apars

@router.post("/", response_model=HydrantAparInDB)
def create_hydrant_apar(hydrant_apar: HydrantAparCreate):
    db_hydrant_apar = crud_hydrantApar.create(obj_in=hydrant_apar)
    return db_hydrant_apar

@router.put("/{hydrant_apar_id}", response_model=HydrantAparInDB)
def update_hydrant_apar(hydrant_apar_id: int, hydrant_apar: HydrantAparUpdate):
    db_hydrant_apar = crud_hydrantApar.get(hydrant_apar_id)
    if not db_hydrant_apar:
        raise HTTPException(status_code=404, detail="HydrantApar not found")
    updated_hydrant_apar = crud_hydrantApar.update(db_obj=db_hydrant_apar, obj_in=hydrant_apar)
    return updated_hydrant_apar

@router.delete("/{hydrant_apar_id}", response_model=HydrantAparInDB)
def delete_hydrant_apar(hydrant_apar_id: int):
    db_hydrant_apar = crud_hydrantApar.get(hydrant_apar_id)
    if not db_hydrant_apar:
        raise HTTPException(status_code=404, detail="HydrantApar not found")
    deleted_hydrant_apar = crud_hydrantApar.remove(id=hydrant_apar_id)
    return deleted_hydrant_apar