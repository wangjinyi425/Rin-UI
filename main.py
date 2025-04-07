import sys

from PySide6.QtWidgets import QApplication
import RinUI


class Gallery(RinUI.RinUIWindow):
    def __init__(self):
        super().__init__("examples/gallery.qml")


if __name__ == '__main__':
    """
    多窗口测试
    """
    print(RinUI.__file__, RinUI.PATH)
    app = QApplication(sys.argv)
    # gallery = Gallery()
    test = RinUI.RinUIWindow("test.qml")
    app.exec()
