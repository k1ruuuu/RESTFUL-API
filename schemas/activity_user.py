from pydantic import BaseModel, Field
from typing import Optional
import datetime

class ActivityBase(BaseModel):
    username: str
    aktivitas: str
    waktu: datetime.datetime

class ActivityCreate(ActivityBase):
    pass

class ActivityInDB(ActivityBase):
    id: int
    
    class Config:
        from_attributes = True