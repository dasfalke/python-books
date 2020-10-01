from custom_exceptions import ItemAlreadyExists
from custom_exceptions import IncompleteData


class MemoryBookModel:
    def __init__(self, data_store):
        self.data_store = data_store

    def create(self, book):
        if book['title'].strip() == '' or book['author'].strip() == '':
            raise IncompleteData()
        elif book in self.data_store:
            raise ItemAlreadyExists()
        else:
            self.data_store.append(book)

    # Read

    # Read All
