pragma Singleton
import QtQuick 2.15
import "../themes"

Item {
    id: themeManager

    property var currentTheme: null

    // 初始化时设置默认主题
    Component.onCompleted: {
        if (typeof ThemeManager === "undefined") {
            currentTheme = Qt.createQmlObject("import '../themes'; Light {}", themeManager)
        } else {
            Utils.primaryColor = getThemeColor()
            setTheme(ThemeManager.get_theme())
        }
    }

    function setBackdropEffect(effect) {
        if (typeof ThemeManager === "undefined") {
            console.error("ThemeManager is not defined.")
            return -1
        }
        ThemeManager.apply_backdrop_effect(effect)
    }

    function getBackdropEffect() {
        if (typeof ThemeManager === "undefined") {
            console.error("ThemeManager is not defined.")
            return -1
        }
        return ThemeManager.get_backdrop_effect()
    }

    function getThemeColor() {
        if (typeof ThemeManager === "undefined") {
            console.error("ThemeManager is not defined.")
            return -1
        }
        return ThemeManager.get_theme_color()
    }

    // 切换主题
    function setTheme(mode) {
        if (typeof ThemeManager === "undefined") {
            console.error("ThemeManager is not defined.")
            currentTheme = Qt.createQmlObject("import '../themes'; Light {}", themeManager)
            return
        }

        // 调用 Python 后端的 ThemeManager 切换主题
        ThemeManager.toggle_theme(mode)

        // 根据 mode 动态创建主题对象
        var themeName = ThemeManager.get_theme_name()
        load_qml(themeName)
        return 0;
    }

    function load_qml(themeName) {
        if (themeName) {
            let themeObject = Qt.createQmlObject("import '../themes'; " + themeName + " {}", themeManager)
            let mode = ThemeManager.get_theme()
            if (themeObject) {
                currentTheme = themeObject
                console.log("Switched to", mode, "mode")
            } else {
                console.error("Failed to create theme object for mode:", mode)
            }
        } else {
            console.error("Invalid theme mode:", mode)
        }
    }

    // 监听系统主题变化
    Connections {
        target: ThemeManager
        function onThemeChanged(theme) {
            load_qml(theme)
        }
        function onBackdropChanged(effect) {
            Utils.backdropEnabled = effect !== "none";
        }
    }
}