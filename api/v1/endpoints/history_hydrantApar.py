from fastapi import APIRouter, HTTPException, Query
from typing import List

from schemas.history_hydrantApar import (
    HistoryHydrantAparInDB,
    HistoryHydrantAparCreate,
    HistoryHydrantAparUpdate
)
from crud.history_hydrantApar import crud_history_hydrantApar
from crud.hydrantApar import crud_hydrantApar


router = APIRouter(
    prefix="/history_hydrantApar",
    tags=["History Hydrant & APAR"]
)

@router.get("/", response_model=List[HistoryHydrantAparInDB])
def read_history(skip: int = 0, limit: int = Query(100, le=100)):
    return crud_history_hydrantApar.get_multi(skip=skip, limit=limit)

@router.get("/by-no/{no}", response_model=List[HistoryHydrantAparInDB])
def read_history_by_no(no: str):
    return crud_history_hydrantApar.get_by_no(no)

@router.get("/last/{no}", response_model=HistoryHydrantAparInDB)
def read_last_history(no: str):
    history = crud_history_hydrantApar.get_last_history(no)
    if not history:
        raise HTTPException(status_code=404, detail="History not found")
    return history

@router.post("/", response_model=HistoryHydrantAparInDB)
def create_history(history: HistoryHydrantAparCreate):
    # cek apakah no ada di tabel utama
    parent = crud_hydrantApar.get_by_no(history.no)
    if not parent:
        raise HTTPException(
            status_code=400,
            detail="No tidak ditemukan di tabel hydrant_apar"
        )

    return crud_history_hydrantApar.create(obj_in=history)

@router.put("/{history_id}", response_model=HistoryHydrantAparInDB)
def update_history(history_id: int, history: HistoryHydrantAparUpdate):
    db_obj = crud_history_hydrantApar.get(history_id)
    if not db_obj:
        raise HTTPException(status_code=404, detail="History not found")

    return crud_history_hydrantApar.update(
        db_obj=db_obj,
        obj_in=history
    )

@router.delete("/{history_id}", response_model=HistoryHydrantAparInDB)
def delete_history(history_id: int):
    db_obj = crud_history_hydrantApar.get(history_id)
    if not db_obj:
        raise HTTPException(status_code=404, detail="History not found")

    return crud_history_hydrantApar.remove(id=history_id)