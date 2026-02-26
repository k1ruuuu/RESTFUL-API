# core/config.py
import os
from typing import List
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    # API Settings
    APP_NAME: str = "API Denah"
    VERSION: str = "v1.0.0-beta"
    DEBUG: bool = True
    HOST: str = "127.0.0.1"
    PORT: int = 9000
    
    # Database Settings
    DB_HOST: str = "localhost"
    DB_USER: str = "root"
    DB_PASSWORD: str = ""  # wdymnL0L@!!
    DB_NAME: str = "denah"
    
    # JWT Settings - INI YANG PENTING!
    SECRET_KEY: str = "d3nah-app-010226-smkbpp"  # Harus sama dengan di security.py
    ALGORITHM: str = "HS256"  # Harus sama dengan di security.py
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 60
    
    # CORS Settings
    CORS_ORIGINS: List[str] = ["*"]
    
    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings()