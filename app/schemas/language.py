from pydantic import BaseModel


class LanguageBase(BaseModel):
    code: str


class Language(LanguageBase):
    id: int

    class Config:
        orm_mode = True
