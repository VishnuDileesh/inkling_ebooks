from pydantic import BaseModel, ConfigDict


class BookshelfBase(BaseModel):
    name: str


class Bookshelf(BookshelfBase):
    id: int

    model_config = ConfigDict(from_attributes=True)
