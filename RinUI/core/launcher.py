import os
import sys
from PySide6.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout
from PySide6.QtQml import QQmlApplicationEngine
from .theme import ThemeManager


class TestWindow(QWidget):
    def __init__(self, theme_manager):
        super().__init__()
        layout = QVBoxLayout()
        self.setLayout(layout)
        self.setWindowTitle("Test Window")
        btn = QPushButton("Hello World")
        btn.clicked.connect(
            lambda: theme_manager.toggle_theme("Light" if theme_manager.current_theme == "Dark" else "Dark")
        )
        self.layout().addWidget(btn)
        self.resize(400, 300)


class QmlApplication:
    def __init__(self, qml_path: str = "main.qml"):
        """
        创建基于 RinUI 的 QML 应用程序。
        :param qml_path: str, QML 文件路径
        """
        self.app = QApplication([])
        self.engine = QQmlApplicationEngine()
        self.theme_manager = ThemeManager()
        self.qml_path = qml_path

        # Rin UI setup
        ui_module_path = os.path.abspath("../../RinUI")
        self.engine.addImportPath(ui_module_path)

        self._setup_application()

    def _setup_application(self):
        """
        Setup
        """
        self.engine.rootContext().setContextProperty("ThemeManager", self.theme_manager)
        self.app.aboutToQuit.connect(self.theme_manager.clean_up)  # clean up theme mgr when exit
        self.engine.load(self.qml_path)

        if not self.engine.rootObjects():
            sys.exit(-1)

        self.root_window = self.engine.rootObjects()[0]

        if sys.platform == "win32":
            self._apply_windows_effects()

    def _apply_windows_effects(self):
        """应用 Windows DWM 效果"""
        self.theme_manager.set_window(self.root_window)
        self.theme_manager.apply_backdrop_effect(self.theme_manager.get_backdrop_effect())
        self.theme_manager.apply_window_effects()

    def run(self):
        """
        Run the application
        """
        sys.exit(self.app.exec())


if __name__ == "__main__":
    app = QmlApplication("../../examples/gallery.qml")
    app.run()
