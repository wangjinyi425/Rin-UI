import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"


Frame {
    id: root
    property bool frameless: false
    property bool hoverable: true  // 悬浮特效
    property bool hover: false

    clip: true

    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: Theme.currentTheme.appearance.cardRadius
        color: Theme.currentTheme.colors.cardColor
        border.width: Theme.currentTheme.appearance.borderWidth
        border.color: Qt.alpha(Theme.currentTheme.colors.controlQuaternaryColor, 0.0578)
        opacity: root.hover? 0.7 : 1
        visible: !root.frameless

        // mouse area / hover区域
        MouseArea {
            anchors.fill: parent
            hoverEnabled: root.hoverable
            onEntered: root.hover = true
            onExited: root.hover = false
        }

        Behavior on opacity { NumberAnimation { duration: Utils.animationSpeedFaster; easing.type: Easing.OutQuad } }
        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuad } }
    }
}