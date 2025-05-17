from pydantic import BaseModel


class AuthorBase(BaseModel):
    name: str
    birth_year: int | None = None
    death_year: int | None = None


class Author(AuthorBase):
    id: int

    class Config:
        orm_mode = True
