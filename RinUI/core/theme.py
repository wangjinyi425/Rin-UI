from PySide6.QtCore import QObject, Signal, Slot


# 主题管理器 / ThemeManager
class ThemeManager(QObject):
    themeChanged = Signal(str)

    def __init__(self):
        super().__init__()
        self.theme_dict = {
            "light": "Light",
            "dark": "Dark"
        }
        self._current_theme = "light"  # 默认为 light 主题
        print(f"ThemeManager initialized, Default theme: {self.get_theme()}")

    @Slot(str)
    def toggle_theme(self, theme: str):
        """ 切换主题 """
        if theme not in self.theme_dict.keys():
            print(f"Invalid theme: {theme}")
            return

        if self._current_theme != theme:
            print(f"Switching to \"{theme}\" theme")
            self._current_theme = theme
            self.themeChanged.emit(self._current_theme)

    @Slot(result=str)
    def get_theme(self):
        """ 获取当前主题 """
        return self._current_theme

    @Slot(result=str)
    def get_theme_name(self):
        """ 获取当前主题实例 """
        return self.theme_dict[self._current_theme]
