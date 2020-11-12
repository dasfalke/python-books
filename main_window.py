"""
Project: python-books
File: main_window.py
"""
from PySide2.QtSql import QSqlDatabase, QSqlTableModel
from PySide2.QtWidgets import QApplication, QMainWindow, QTableView

# temp db connection
db = QSqlDatabase("QSQLITE")
db.setDatabaseName("books.db")
db.open()

class MainWindow(QMainWindow):
    """
    Class responsible for displaying primary interface.
    """
    def __init__(self):
        super().__init__()

        self.table = QTableView()
        self.model = QSqlTableModel(db=db)
        self.table.setModel(self.model)
        self.model.setTable("hello")
        self.model.select()
        self.setCentralWidget(self.table)


app = QApplication([])
window = MainWindow()
window.show()
app.exec_()
