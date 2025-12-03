from crud.base import CRUDBase
from schemas.fakultas import FKEkonomiBisnisCreate, FKEkonomiBisnisUpdate

class CRUDFakultasEkonomi(CRUDBase):
    def __init__(self):
        super().__init__("fk_ekonomi")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)

crud_fk_ekonomi = CRUDFakultasEkonomi()

# Buat class serupa untuk fakultas lainnya