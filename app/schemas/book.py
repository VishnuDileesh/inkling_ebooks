from typing import List, Optional

from pydantic import BaseModel, ConfigDict

from .author import Author
from .bookshelf import Bookshelf
from .format import Format
from .language import Language
from .subject import Subject


class BookBase(BaseModel):
    title: Optional[str] = None
    gutenberg_id: int
    download_count: Optional[int] = 0
    media_type: str


class Book(BookBase):
    id: int
    authors: List[Author] = []
    bookshelves: List[Bookshelf] = []
    languages: List[Language] = []
    subjects: List[Subject] = []
    formats: List[Format] = []

    model_config = ConfigDict(from_attributes=True)
