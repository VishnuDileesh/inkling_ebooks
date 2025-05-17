from fastapi import FastAPI

from app.api.v1 import books
from app.core.config import settings

app = FastAPI(title="Inkling Ebooks", version="1.0.0")

app.include_router(books, prefix="/api/v1", tags=["Books"])


@app.get("/", tags=["Health Check"])
def read_root():
    return {"status": "ok", "message": "Inkling Ebooks API is up!"}
