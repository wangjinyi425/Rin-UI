import sys

from PySide6.QtWidgets import QApplication
from RinUI import RinUIWindow, BackdropEffect, Theme


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = RinUIWindow("test1.qml")
    window.setBackdropEffect(BackdropEffect.Mica)
    window.setTheme(Theme.Auto)
    window.show()
    sys.exit(app.exec())
