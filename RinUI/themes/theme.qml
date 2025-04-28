pragma Singleton
import QtQuick 2.15
// import "../themes"

Item {
    id: themeManager

    property var currentTheme: null

    // 初始化时设置默认主题
    Component.onCompleted: {
        if (typeof ThemeManager === "undefined") {
            currentTheme = Qt.createQmlObject("import '../themes'; Light {}", themeManager)
        } else {
            Utils.primaryColor = getThemeColor()
            setTheme(ThemeManager.get_theme_name())
        }
    }

    function isThemeMgrInitialized() {
        return typeof ThemeManager!== "undefined"
    }

    function setBackdropEffect(effect) {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            return -1
        }
        ThemeManager.apply_backdrop_effect(effect)
    }

    function sendDragWindowEvent(window) {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            return -1
        }
        ThemeManager.dragWindowEvent(ThemeManager.getWindowId(window))
    }

    function getBackdropEffect() {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            return -1
        }
        return ThemeManager.get_backdrop_effect()
    }

    function getThemeColor() {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            return -1
        }
        return ThemeManager.get_theme_color()
    }

    function getTheme() {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            return -1
        }
        return ThemeManager.get_theme_name()
    }

    // 本来打算写多主题支持的（）

    function toggleMode() {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            return -1
        }
        var mode = ThemeManager.get_theme()
        if (!currentTheme.isDark) {
            mode = "Dark"
        } else {
            mode = "Light"
        }
        setTheme(mode)
    }

    // 切换主题
    function setTheme(mode) {
        if (!isThemeMgrInitialized()) {
            console.error("ThemeManager is not defined.")
            currentTheme = Qt.createQmlObject("import '../themes'; Light {}", themeManager)
            return
        }

        // Call Python backend to toggle theme
        ThemeManager.toggle_theme(mode)

        // Get the actual theme name
        var themeName = ThemeManager.get_theme_name()
        if (themeName === "Auto") {
            // Get the actual theme applied (Light or Dark)
            themeName = ThemeManager.get_theme()
        }
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