"""
Project: python-books
File: main_window.py
"""
from PySide2.QtCore import Qt
from PySide2.QtWidgets import QApplication, QMainWindow, QLabel

class MainWindow(QMainWindow):
    """
    Class responsible for displaying primary interface.
    """
    def __init__(self):
        super().__init__()
        self.setWindowTitle("python-books")
        label = QLabel("Hello Qt5!")
        label.setAlignment(Qt.AlignCenter)
        self.setCentralWidget(label)

app = QApplication([])
window = MainWindow()
window.show()
app.exec_()
