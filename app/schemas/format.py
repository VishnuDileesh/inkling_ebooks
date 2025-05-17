from pydantic import BaseModel


class FormatBase(BaseModel):
    mime_type: str
    url: str


class Format(FormatBase):
    id: int

    class Config:
        orm_mode = True
