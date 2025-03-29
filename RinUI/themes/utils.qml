pragma Singleton
import QtQuick 2.15
import "../themes"

QtObject {
    property string fontSource: Qt.resolvedUrl("../assets/fonts/" + Theme.currentTheme.typography.fontIcon)
    property color primaryColor: "#605ed2" // 默认主题色
    property int windowDragArea: 5 // 窗口可拖动范围 (px)

    property bool backdropEnabled: false // 是否启用背景特效
    property int animationSpeed: 250 // 动画速度 (ms)
    property int animationSpeedFaster: 120 // 动画速度 (ms)
    property int appearanceSpeed: 175 // 界面切换速度 (ms)
    property int animationSpeedMiddle: 450 // 动画速度 (ms)
}
