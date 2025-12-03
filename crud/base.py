from typing import Any, Dict, Generic, List, Optional, Type, TypeVar, Union
from core.database import db

ModelType = TypeVar("ModelType")
CreateSchemaType = TypeVar("CreateSchemaType")
UpdateSchemaType = TypeVar("UpdateSchemaType")

class CRUDBase(Generic[ModelType, CreateSchemaType, UpdateSchemaType]):
    def __init__(self, table_name: str):
        self.table_name = table_name
    
    def get(self, id: int) -> Optional[Dict[str, Any]]:
        with db.get_cursor() as cursor:
            query = f"SELECT * FROM {self.table_name} WHERE id = %s"
            cursor.execute(query, (id,))
            return cursor.fetchone()
    
    def get_multi(
        self, 
        skip: int = 0, 
        limit: int = 100,
        filters: Optional[Dict] = None
    ) -> List[Dict[str, Any]]:
        with db.get_cursor() as cursor:
            query = f"SELECT * FROM {self.table_name}"
            params = []
            
            if filters:
                where_clauses = []
                for key, value in filters.items():
                    where_clauses.append(f"{key} = %s")
                    params.append(value)
                if where_clauses:
                    query += " WHERE " + " AND ".join(where_clauses)
            
            query += " LIMIT %s OFFSET %s"
            params.extend([limit, skip])
            
            cursor.execute(query, params)
            return cursor.fetchall()
    
    def create(self, obj_in: CreateSchemaType) -> Dict[str, Any]:
        obj_in_dict = obj_in.dict()
        columns = ", ".join(obj_in_dict.keys())
        placeholders = ", ".join(["%s"] * len(obj_in_dict))
        
        with db.get_cursor() as cursor:
            query = f"INSERT INTO {self.table_name} ({columns}) VALUES ({placeholders})"
            cursor.execute(query, list(obj_in_dict.values()))
            
            # Get the inserted record
            last_id = cursor.lastrowid
            return self.get(last_id)
    
    def update(self, id: int, obj_in: UpdateSchemaType) -> Optional[Dict[str, Any]]:
        obj_in_dict = obj_in.dict(exclude_unset=True)
        
        if not obj_in_dict:
            return None
        
        set_clause = ", ".join([f"{key} = %s" for key in obj_in_dict.keys()])
        
        with db.get_cursor() as cursor:
            query = f"UPDATE {self.table_name} SET {set_clause} WHERE id = %s"
            params = list(obj_in_dict.values()) + [id]
            cursor.execute(query, params)
            
            return self.get(id)
    
    def delete(self, id: int) -> bool:
        with db.get_cursor() as cursor:
            query = f"DELETE FROM {self.table_name} WHERE id = %s"
            cursor.execute(query, (id,))
            return cursor.rowcount > 0
    
    def search_by_field(self, field: str, value: Any) -> Optional[Dict[str, Any]]:
        with db.get_cursor() as cursor:
            query = f"SELECT * FROM {self.table_name} WHERE {field} = %s"
            cursor.execute(query, (value,))
            return cursor.fetchone()