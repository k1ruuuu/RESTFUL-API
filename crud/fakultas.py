from crud.base import CRUDBase
from schemas.fakultas import FKEkonomiBisnisCreate, FKEkonomiBisnisUpdate
from schemas.fakultas import FKSyariahCreate, FKSyariahUpdate
from schemas.fakultas import FKTarbiyahCreate, FKTarbiyahUpdate
from schemas.fakultas import FKTeknikCreate, FKTeknikUpdate
from schemas.fakultas import FKHukumCreate, FKHukumUpdate
from schemas.fakultas import FKFikomCreate, FKFikomUpdate

class CRUDFakultasEkonomi(CRUDBase):
    def __init__(self):
        super().__init__("fk_ekonomi")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)

class CRUDSyariah(CRUDBase):
    def __init__(self):
        super().__init__("fk_syariah")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)

class CRUDFakultasTarbiyah(CRUDBase):
    def __init__(self):
        super().__init__("fk_tarbiyah")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)


class CRUDFakultasTeknik(CRUDBase):
    def __init__(self):
        super().__init__("fk_teknik")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)

class CRUDFakultasHukum(CRUDBase):
    def __init__(self):
        super().__init__("fk_hukum")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)

class CRUDFakultasFikom(CRUDBase):
    def __init__(self):
        super().__init__("fk_fikom")
    
    def get_by_no(self, no: int):
        return self.search_by_field("no", no)

crud_fk_ekonomi = CRUDFakultasEkonomi()
crud_fk_syariah = CRUDSyariah()
crud_fk_tarbiyah = CRUDFakultasTarbiyah()
crud_fk_teknik = CRUDFakultasTeknik()
crud_fk_hukum = CRUDFakultasHukum()
crud_fk_fikom = CRUDFakultasFikom()


# Buat class serupa untuk fakultas lainnya