import unittest
from custom_exceptions import ItemAlreadyExists
from custom_exceptions import IncompleteData
from memory_book_model import MemoryBookModel


class MemoryBookModelCreateTestCase(unittest.TestCase):
    def setUp(self):
        # A data store with existing data
        self.data_store = [
            {'title': 'The Eye of the World', 'author': 'Robert Jordan'},
            {'title': 'The Hobbit', 'author': 'J.R.R. Tolkien'},
            {'title': 'The Caves of Steel', 'author': 'Isaac Asimov'}
        ]
        self.data_layer = MemoryBookModel(self.data_store)

        # Some extra books for testing
        self.book_witcher = {'title': 'The Last Wish', 'author': 'Andrzej Sapkowski'}
        self.book_hobbit = {'title': 'The Hobbit', 'author': 'J.R.R. Tolkien'}
        self.book_hunt = {'title': 'The Great Hunt', 'author': 'Robert Jordan'}
        self.book_youth_asimov = {'title': 'Youth', 'author': 'Isaac Asimov'}
        self.book_youth_tolstoy = {'title': 'Youth', 'author': 'Leo Tolstoy'}

    def tearDown(self):
        self.data_store = []

    def test_insert(self):
        self.data_layer.create(self.book_witcher)
        self.assertIn(self.book_witcher, self.data_store)

    def test_insert_duplicate(self):
        with self.assertRaises(ItemAlreadyExists):
            self.data_layer.create(self.book_hobbit)

    def test_insert_existing_author(self):
        self.data_layer.create(self.book_hunt)
        self.assertIn(self.book_hunt, self.data_store)

    def test_existing_title_different_author(self):
        self.data_layer.create(self.book_youth_asimov)
        self.data_layer.create(self.book_youth_tolstoy)
        self.assertIn(self.book_youth_tolstoy, self.data_store)

    def test_missing_title(self):
        with self.assertRaises(IncompleteData):
            self.data_layer.create({'title': '', 'author': 'William Gibson'})

    def test_blank_title(self):
        with self.assertRaises(IncompleteData):
            self.data_layer.create({'title': '           ', 'author': 'William Gibson'})

    def test_missing_author(self):
        with self.assertRaises(IncompleteData):
            self.data_layer.create({'title': 'Neuromancer', 'author': ''})

    def test_blank_author(self):
        with self.assertRaises(IncompleteData):
            self.data_layer.create({'title': 'Neuromancer', 'author': '               '})


class MemoryBookModelReadTestCase(unittest.TestCase):
    def setUp(self):
        # A data store with existing data
        self.data_store = [
            {'title': 'The Eye of the World', 'author': 'Robert Jordan'},
            {'title': 'The Hobbit', 'author': 'J.R.R. Tolkien'},
            {'title': 'The Caves of Steel', 'author': 'Isaac Asimov'}
        ]
        self.data_layer = MemoryBookModel(self.data_store)




if __name__ == '__main__':
    unittest.main()
