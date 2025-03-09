pragma Singleton
import QtQuick 2.15
import "../themes"

Item { // 将 QtObject 改为 Item 以支持子元素
    id: themeManager

    property var currentTheme: null

    function setTheme(mode) {
        ThemeManager.toggle_theme(mode)  // 切换主题于 Python 后端

        // 根据 mode 动态创建主题对象
        var themeName = ThemeManager.get_theme_name(mode)

        if (themeName) {
            var themeObject = Qt.createQmlObject("import '../themes'; " + themeName + " {}", themeManager)
            if (themeObject) {
                currentTheme = themeObject
                console.log("Switched to", mode, "mode")
            } else {
                console.error("Failed to create theme object for mode:", mode)
            }
        } else {
            console.error("Invalid theme mode:", mode)  // invalid
        }
    }

    Component.onCompleted: {
        setTheme("light") // 初始化默认主题
    }
}