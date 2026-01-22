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
    DB_PASSWORD: str = "" # wdymnL0L@!!
    DB_NAME: str = "denah"
    
    # CORS Settings
    CORS_ORIGINS: List[str] = ["*"]
    
    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings()