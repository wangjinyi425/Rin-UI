import ctypes
import time

from PySide6.QtCore import QObject, Signal, Slot, QThread
from .config import DEFAULT_CONFIG, ConfigCenter, PATH
import sys
import darkdetect

def check_darkdetect_support():
    return sys.platform == "win32" and sys.getwindowsversion().major >= 10


ACCENT_STATES = {
    "acrylic": 3,
    "mica": 2,
    "tabbed": 4,
    "none": 0
}


class ThemeListener(QThread):
    """
    监听系统颜色模式
    """
    themeChanged = Signal(str)

    def run(self):
        last_theme = darkdetect.theme()
        while True:
            current_theme = darkdetect.theme()
            if current_theme != last_theme:
                last_theme = current_theme
                self.themeChanged.emit(current_theme)
                print(f"Theme changed: {current_theme}")
            time.sleep(1)

    def stop(self):
        self.terminate()


class ThemeManager(QObject):
    themeChanged = Signal(str)
    backdropChanged = Signal(str)
    windows = []  # 窗口句柄们（
    _instance = None

    # DWM 常量保持不变
    DWMWA_USE_IMMERSIVE_DARK_MODE = 20
    DWMWA_WINDOW_CORNER_PREFERENCE = 33
    DWMWA_NCRENDERING_POLICY = 2
    DWMNCRENDERINGPOLICY_ENABLED = 2
    DWMWA_SYSTEMBACKDROP_TYPE = 38

    # 圆角
    DWMWCP_DEFAULT = 0
    DWMWCP_DONOTROUND = 1
    DWMWCP_ROUND = 2
    DWMWCP_ROUNDSMALL = 3

    def clean_up(self):
        """
        清理资源并停止主题监听。
        """
        if self.listener:
            self.config.save_config()
            print("Save config.")
            self.listener.stop()
            self.listener.wait()  # 等待线程结束
            print("Theme listener stopped.")

    def __new__(cls, *args, **kwargs):
        """
        单例管理，共享主题状态
        :param args:
        :param kwargs:
        """
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self):
        if hasattr(self, "_initialized") and self._initialized:
            return
        self._initialized = True
        super().__init__()
        self.theme_dict = {
            "Light": 0,
            "Dark": 1
        }

        self.listener = None  # 监听线程
        self.current_theme = DEFAULT_CONFIG["theme"]["current_theme"]  # 当前主题
        self.is_darkdetect_supported = check_darkdetect_support()

        self.config = ConfigCenter(PATH, "rin_ui.json")  # 配置中心
        self.config.load_config(DEFAULT_CONFIG)  # 加载配置

        try:
            self.current_theme = self.config["theme"]["current_theme"]
        except Exception as e:
            print(f"Failed to load config because of {e}, using default config")

        # self.hwnd = None  # 窗口句柄

        self.start_listener()

    def start_listener(self):
        if not self.is_darkdetect_supported:
            print("darkdetect not supported on this platform")
            return
        self.listener = ThemeListener()
        self.listener.themeChanged.connect(self._handle_system_theme)
        self.listener.start()

    def set_window(self, window):  # 绑定窗口句柄
        hwnd = int(window.winId())
        self.windows.append(hwnd)
        print(f"Window handle set: {hwnd}")

    def _handle_system_theme(self, system_theme):
        if self.current_theme == "Auto":
            self._update_window_theme()
            self.themeChanged.emit(self._actual_theme())
        else:
            # 保持当前背景效果不变
            self._update_window_theme()

    @Slot(str)
    def apply_backdrop_effect(self, effect_type):
        """
        应用背景效果
        :param effect_type: str, 背景效果类型（acrylic, mica, tabbed, none）
        """
        self._update_window_theme()
        if sys.platform != "win32" or not self.windows:
            return -2  # 非 windows或未绑定窗口
        self.backdropChanged.emit(effect_type)

        accent_state = ACCENT_STATES.get(effect_type, 0)

        for hwnd in self.windows:
            ctypes.windll.dwmapi.DwmSetWindowAttribute(
                hwnd,
                self.DWMWA_SYSTEMBACKDROP_TYPE,
                ctypes.byref(ctypes.c_int(accent_state)),
                ctypes.sizeof(ctypes.c_int)
            )

        self.config["backdrop_effect"] = effect_type
        print(f"Applied \"{effect_type.strip().capitalize()}\" effect")

    def apply_window_effects(self):  # 启用圆角阴影
        if sys.platform != "win32" or not self.windows:
            return

        dwm = ctypes.windll.dwmapi

        # 启用非客户端渲染策略（让窗口边框具备阴影）
        ncrp = ctypes.c_int(self.DWMNCRENDERINGPOLICY_ENABLED)
        for hwnd in self.windows:
            dwm.DwmSetWindowAttribute(
                hwnd,
                self.DWMWA_NCRENDERING_POLICY,
                ctypes.byref(ncrp),
                ctypes.sizeof(ncrp)
            )

            # 启用圆角效果
            corner_preference = ctypes.c_int(self.DWMWCP_ROUND)
            dwm.DwmSetWindowAttribute(
                hwnd,
                self.DWMWA_WINDOW_CORNER_PREFERENCE,
                ctypes.byref(corner_preference),
                ctypes.sizeof(corner_preference)
            )
        print("Enabled Rounded and Shadows")

    def _update_window_theme(self):  # 更新窗口的颜色模式
        if sys.platform != "win32" or not self.windows:
            return
        actual_theme = self._actual_theme()
        for hwnd in self.windows:
            ctypes.windll.dwmapi.DwmSetWindowAttribute(
                hwnd,
                self.DWMWA_USE_IMMERSIVE_DARK_MODE,
                ctypes.byref(ctypes.c_int(self.theme_dict[actual_theme])),
                ctypes.sizeof(ctypes.c_int)
            )
        print(f"Window theme updated to {actual_theme}")

    def _actual_theme(self):
        """实际应用的主题"""
        if self.current_theme == "Auto":
            return darkdetect.theme() if self.is_darkdetect_supported else "Light"
        return self.current_theme

    @Slot(str)
    def toggle_theme(self, theme: str):  # 切换主题
        if theme not in ["Auto", "Light", "Dark"]:  # 三状态
            return
        if self.current_theme != theme:
            print(f"Switching to '{theme}' theme")
            self.current_theme = theme
            self.config["theme"]["current_theme"] = theme
            self._update_window_theme()
            self.themeChanged.emit(self._actual_theme())

    @Slot(result=str)
    def get_theme(self):
        return self._actual_theme()

    @Slot(result=str)
    def get_theme_name(self):
        """获取当前主题名称"""
        return self.current_theme

    @Slot(str)
    def receive(self, message):
        print(message)

    @Slot(result=str)
    def get_backdrop_effect(self):
        """获取当前背景效果"""
        return self.config["backdrop_effect"]
        # if sys.platform != "win32" or not self.hwnd:
        #     return "none"
        #
        # effect_type = ctypes.c_int()
        # result = ctypes.windll.dwmapi.DwmGetWindowAttribute(
        #     self.hwnd,
        #     self.DWMWA_SYSTEMBACKDROP_TYPE,
        #     ctypes.byref(effect_type),
        #     ctypes.sizeof(effect_type)
        # )
        #
        # if result != 0:  # 获取失败时返回 "none"
        #     return "none"
        #
        # return ACCENT_STATES.get(effect_type.value, "none")

    @Slot(result=str)
    def get_theme_color(self):
        """获取当前主题颜色"""
        return self.config["theme_color"]

    @Slot(result=str)
    def set_theme_color(self, color):
        """设置当前主题颜色"""
        self.config["theme_color"] = color
        self.config.save_config()
