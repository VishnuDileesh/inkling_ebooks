from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "Inkling Ebooks API"
    DB_URL: str
    ENV: str = "development"

    class Config:
        env_file = ".env"

settings = Settings()
