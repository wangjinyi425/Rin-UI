import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../themes"
import "../components"

ToolTip {
    id: tooltip
    timeout: -1  // 显示时长
    text: "Tooltip"

    // 公共属性 / Common Properties
    property color backgroundColor: Theme.currentTheme.colors.backgroundAcrylicColor
    property color borderColor: Theme.currentTheme.colors.controlBorderColor
    property color textColor: Theme.currentTheme.colors.textColor
    property real controlRadius: Theme.currentTheme.appearance.buttonRadius

    function updateStyle() {
        backgroundColor = Theme.currentTheme.colors.backgroundAcrylicColor
        borderColor = Theme.currentTheme.colors.controlBorderColor
        textColor = Theme.currentTheme.colors.textColor
        controlRadius = Theme.currentTheme.appearance.buttonRadius
    }

    // 主题切换 / Theme Switching
    Connections {
        target: Theme
        onCurrentThemeChanged: updateStyle()
    }

    Component.onCompleted: updateStyle()


    // 颜色动画 / Color Animation
    Behavior on backgroundColor { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
    Behavior on textColor { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
    Behavior on borderColor { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }

    property string tipText: text  // 传递 tip 文字

    contentItem: TextLabel {
        id: tooltipText
        anchors.centerIn: background
        labelType: "caption"
        text: tipText
    }

    background: Rectangle {
        id: background
        width: tooltipText.width + 20
        height: tooltipText.height + 13
        anchors.horizontalCenter: parent.horizontalCenter
        y: -6

        radius: controlRadius
        color: backgroundColor
        border.color: borderColor
        Shadow {style: "tooltip"}
    }

    // 动画 / Animation //
    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: tooltip
                property: "opacity"
                from: 0
                to: 1
                duration: 250
                easing.type: Easing.InOutQuart
            }
        }
    }
    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: tooltip
                property: "opacity"
                from: 1
                to: 0
                duration: 300
                easing.type: Easing.InOutQuart
            }
        }
    }
}
