from RinUI.core.launcher import QmlApplication


class Gallery(QmlApplication):
    def __init__(self):
        super().__init__("gallery.qml")


if __name__ == '__main__':
    app = Gallery()
    app.run()
    # app = QGuiApplication([])

    # 创建 QML 引擎
    # engine = QQmlApplicationEngine()
    # # engine.addImportPath(str(Path(__file__).parent.parent / "RinUI"))
    # print(engine.importPathList())
    #
    # # 加载 QML 文件
    # engine.load("gallery.qml")
    #
    #
    # # 启动应用
    # app.exec()
    # create_qml_app("gallery.qml")
