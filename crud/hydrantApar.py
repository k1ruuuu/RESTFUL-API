from crud.base import CRUDBase
from schemas.hydrantApar import HydrantAparCreate, HydrantAparUpdate

class CRUDHydrantApar(CRUDBase):
    def __init__(self):
        super().__init__("hydrant_apar")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)


crud_hydrantApar = CRUDHydrantApar()