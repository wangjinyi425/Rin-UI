import os
import sys

from PySide6.QtCore import QCoreApplication
from PySide6.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout
from PySide6.QtQml import QQmlApplicationEngine
from .theme import ThemeManager


class TestWindow(QWidget):
    def __init__(self, theme_manager):
        super().__init__()
        layout = QVBoxLayout()
        self.setLayout(layout)
        self.setWindowTitle("Test Window")
        btn = QPushButton(theme_manager.current_theme)
        btn.clicked.connect(
            lambda: theme_manager.toggle_theme("Light" if theme_manager.current_theme == "Dark" else "Dark")
        )
        self.layout().addWidget(btn)
        self.resize(400, 300)


class RinUIWindow:
    def __init__(self, qml_path: str = "main.qml"):
        """
        创建基于 RinUI 的 QML 应用程序。
        :param qml_path: str, QML 文件路径
        """
        self.engine = QQmlApplicationEngine()
        self.theme_manager = ThemeManager()
        self.qml_path = qml_path

        self._setup_application()

        # 退出清理
        app_instance = QCoreApplication.instance()
        if app_instance:
            app_instance.aboutToQuit.connect(self.theme_manager.clean_up)

    def _setup_application(self):
        """Setup"""
        # RInUI 模块
        ui_module_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../"))  # 修复路径错误
        print(f"UI Module Path: {ui_module_path}")

        if os.path.exists(ui_module_path):
            self.engine.addImportPath(ui_module_path)
        else:
            raise FileNotFoundError(f"Cannot find RinUI module: {ui_module_path}")

        # 主题管理器

        self.engine.rootContext().setContextProperty("ThemeManager", self.theme_manager)
        try:
            self.engine.load(self.qml_path)
        except Exception as e:
            print(f"Cannot Load QML file: {e}")

        if not self.engine.rootObjects():
            raise RuntimeError(f"Error loading QML file: {self.qml_path}")

        # 窗口设置

        self.root_window = self.engine.rootObjects()[0]

        if sys.platform == "win32":
            self._apply_windows_effects()

    def _apply_windows_effects(self):
        """应用 Windows DWM 效果"""
        self.theme_manager.set_window(self.root_window)
        self.theme_manager.apply_backdrop_effect(self.theme_manager.get_backdrop_effect())
        self.theme_manager.apply_window_effects()


if __name__ == "__main__":
    # 新用法，应该更规范了捏
    app = QApplication(sys.argv)
    example = RinUIWindow("../../examples/gallery.qml")
    sys.exit(app.exec())
