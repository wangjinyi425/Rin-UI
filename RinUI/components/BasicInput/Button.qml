import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../components"

Button {
    id: root
    property color primaryColor: Theme.currentTheme.colors.primaryColor
    property color backgroundColor: flat ? Theme.currentTheme.colors.subtleSecondaryColor :
        highlighted ? primaryColor : Theme.currentTheme.colors.controlColor
    // default property alias icon.source: icon.source
    property bool hoverable: true  // 是否可悬停
    property bool accessibliityIndicator: true  // 是否显示辅助提示

    // accessibility
    FocusIndicator {
        control: parent
        opacity: accessibliityIndicator
    }

    padding: 6
    topPadding: 5
    bottomPadding: 7

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: backgroundColor
        radius: Theme.currentTheme.appearance.buttonRadius

        border.width: Theme.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
        border.color: flat ? "transparent" :
            enabled ? highlighted ? primaryColor : Theme.currentTheme.colors.controlBorderColor :
            highlighted ? Theme.currentTheme.colors.disabledColor : Theme.currentTheme.colors.controlBorderColor

        // 裁切
        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: background.width
                height: background.height
                radius: background.radius
            }
        }

        // 底部border
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: Theme.currentTheme.appearance.borderWidth

            color: flat ? "transparent" :
                enabled ? highlighted ? Theme.currentTheme.colors.controlAccentBottomBorderColor
                        : Theme.currentTheme.colors.controlBottomBorderColor
                    : "transparent"
        }

        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
        opacity: flat && !hovered || !hoverable ? 0 : 1
    }

    implicitWidth: Math.max(iconWidget.width + text.width + 26, 32)
    implicitHeight: Math.max(text.height + 12, 32)

    contentItem: Item {
        anchors.fill: parent

        Row {
            spacing: 8
            anchors.centerIn: parent
            IconWidget {
                id: iconWidget
                size: icon || source ? text.font.pixelSize * 1.25 : 0  // 图标大小 / Icon Size
                icon: root.icon.name
                source: root.icon.source
                y: 1
                color: icon.color ? icon.color : highlighted ? flat ?
                    enabled ? Theme.currentTheme.colors.textAccentColor : Theme.currentTheme.colors.textColor :
                    Theme.currentTheme.colors.textOnAccentColor : Theme.currentTheme.colors.textColor
            }
            Text {
                id: text
                typography: Typography.Body
                text: root.text
                color: highlighted ? flat ? Theme.currentTheme.colors.textAccentColor :
                    Theme.currentTheme.colors.textOnAccentColor : Theme.currentTheme.colors.textColor
            }
        }
    }

    Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }

    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                opacity: 0.4
                backgroundColor: highlighted ? Theme.currentTheme.colors.disabledColor : Theme.currentTheme.colors.controlColor
            }
            PropertyChanges {
                target: text
                color: flat ? Theme.currentTheme.colors.disabledColor : text.color
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: root;
                opacity: !highlighted && !flat ? 0.7 : 0.65
                backgroundColor:  !highlighted && !flat ? Theme.currentTheme.colors.controlTertiaryColor : backgroundColor
            }
        },
        State {
            name: "hovered"
            when: hovered && hoverable
            PropertyChanges {
                target: root;
                opacity: !highlighted && !flat ? 1 : 0.875
                backgroundColor: !highlighted && !flat? Theme.currentTheme.colors.controlSecondaryColor : backgroundColor
            }
        }
    ]
}