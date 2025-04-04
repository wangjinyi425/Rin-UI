import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic 2.15
import "../themes"

TextField {
    id: root

    property real borderFactor: Theme.currentTheme.appearance.borderFactor
    selectByMouse: true

    // 背景 / Background //
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: Theme.currentTheme.appearance.buttonRadius
        color: Theme.currentTheme.colors.controlColor
        clip: true
        border.width: Theme.currentTheme.appearance.borderWidth
        border.color: Theme.currentTheme.colors.controlBorderColor

        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: background.width
                height: background.height
                radius: background.radius
            }
        }

        // 底部指示器 / indicator //
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            radius: 999
            height: root.activeFocus ? Theme.currentTheme.appearance.borderWidth * 2 : Theme.currentTheme.appearance.borderWidth
            color: root.activeFocus ? Theme.currentTheme.colors.primaryColor : Theme.currentTheme.colors.textControlBorderColor

            Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
            Behavior on height { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
        }
    }


    // 字体 / Font //
    font.pixelSize: Theme.currentTheme.typography.bodySize

    selectionColor: Theme.currentTheme.colors.primaryColor
    color: Theme.currentTheme.colors.textColor
    placeholderTextColor: Theme.currentTheme.colors.textSecondaryColor

    leftPadding: 12
    rightPadding: 12
    topPadding: 5
    bottomPadding: 7

    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {  // 禁用时禁止改变属性
                target: root;
                opacity: 0.4
            }
        },
        State {
            name: "pressed&focused"
            when: activeFocus
            PropertyChanges {
                target: background;
                color: Theme.currentTheme.colors.controlInputActiveColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                color: Theme.currentTheme.colors.controlSecondaryColor
            }
        }
    ]
}