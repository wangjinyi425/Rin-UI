import sys

from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from .theme import ThemeManager


# 创建应用程序实例
def create_qml_app(qml_path: str = "main.qml"):
    """
    创建基于 RinUI 的 QML 应用程序
    :param qml_path: QML 文件路径
    :return: None
    """
    app = QApplication([])
    engine = QQmlApplicationEngine()

    # 设置主题管理器
    theme_manager = ThemeManager()
    engine.rootContext().setContextProperty("ThemeManager", theme_manager)

    engine.load(qml_path)
    if not engine.rootObjects():
        sys.exit(-1)

    app.exec()  # 启动应用程序


if __name__ == "__main__":
    create_qml_app("../../examples/gallery.qml")
