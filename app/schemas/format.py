from pydantic import BaseModel, ConfigDict


class FormatBase(BaseModel):
    mime_type: str
    url: str


class Format(FormatBase):
    id: int

    model_config = ConfigDict(from_attributes=True)
