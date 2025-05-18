from pydantic import BaseModel, ConfigDict


class AuthorBase(BaseModel):
    name: str
    birth_year: int | None = None
    death_year: int | None = None


class Author(AuthorBase):
    id: int

    model_config = ConfigDict(from_attributes=True)
