from fastapi import APIRouter
from api.v1.endpoints import users, fk_ekonomi, fk_syariah, fk_tarbiyah, fk_teknik, fk_hukum, fk_fikom, health, hydrantApar, history_hydrantApar, auth

api_router = APIRouter()

api_router.include_router(users.router)
api_router.include_router(fk_ekonomi.router)
api_router.include_router(fk_syariah.router)
api_router.include_router(fk_tarbiyah.router)
api_router.include_router(fk_teknik.router)
api_router.include_router(fk_hukum.router)
api_router.include_router(fk_fikom.router)
api_router.include_router(health.router)
api_router.include_router(hydrantApar.router)
api_router.include_router(history_hydrantApar.router)
api_router.include_router(auth.router)