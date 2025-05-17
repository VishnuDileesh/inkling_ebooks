from fastapi import FastAPI

from app.api.v1.books import router as books_router

app = FastAPI(title="Inkling Ebooks", version="1.0.0")

app.include_router(books_router, prefix="/api/v1", tags=["Books"])


@app.get("/", tags=["Health Check"])
def read_root():
    return {"status": "ok", "message": "Inkling Ebooks API is up!"}
