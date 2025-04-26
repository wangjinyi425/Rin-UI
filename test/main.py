import sys

from PySide6.QtWidgets import QApplication
from RinUI import RinUIWindow, BackdropEffect, Theme


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = RinUIWindow("test1.qml")
    window.setBackdropEffect(BackdropEffect.Mica)
    sys.exit(app.exec())
