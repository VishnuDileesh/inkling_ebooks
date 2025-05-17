from pydantic import BaseModel


class BookshelfBase(BaseModel):
    name: str


class Bookshelf(BookshelfBase):
    id: int

    class Config:
        orm_mode = True
