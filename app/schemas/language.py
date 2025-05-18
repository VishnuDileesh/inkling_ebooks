from pydantic import BaseModel, ConfigDict


class LanguageBase(BaseModel):
    code: str


class Language(LanguageBase):
    id: int

    model_config = ConfigDict(from_attributes=True)
