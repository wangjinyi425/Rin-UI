pragma Singleton
import QtQuick 2.15
import "../assets/fonts/FluentSystemIcons-Index.js" as Icons
import "../themes"
import "../utils"

QtObject {
    property string fontFamily: "Segoe UI" // 默认字体
    property string iconFontFamily: FontIconLoader.name
    property string fontIconSource: Qt.resolvedUrl("../assets/fonts/FluentSystemIcons-Resizable.ttf")  // 字体图标路径
    property var fontIconIndex: Icons.FluentIcons // 字体图标索引

    property color primaryColor: "#605ed2" // 默认主题色
    property int windowDragArea: 5 // 窗口可拖动范围 (px)
    property int dialogMaximumWidth: 600 // 对话框最大宽度 (px)
    property int dialogMinimumWidth: 320 // 对话框最小宽度 (px)

    property bool backdropEnabled: false // 是否启用背景特效
    property int animationSpeed: 250 // 动画速度 (ms)
    property int animationSpeedFaster: 120 // 动画速度 (ms)
    property int appearanceSpeed: 175 // 界面切换速度 (ms)
    property int animationSpeedMiddle: 450 // 动画速度 (ms)
    property int progressBarAnimationSpeed: 1550 // 进度条动画速度 (ms)

    function loadFontIconIndex() {
        Qt.include("assets/fonts/FluentSystemIcons-Index.js");
    }
}
