from pydantic import BaseModel


class SubjectBase(BaseModel):
    name: str


class Subject(SubjectBase):
    id: int

    class Config:
        orm_mode = True
