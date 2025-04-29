import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../components"

Popup {
    id: popup
    property int position: Position.Bottom
    property real posX: {
        switch (position) {
            case Position.Top:
            case Position.Bottom:
                return (parent.width - popup.width) / 2
            case Position.Left:
                return - popup.width - 5
            case Position.Right:
                return parent.width + 5
            default:
                return (parent.width - popup.width) / 2
        }
    }

    property real posY: {
        switch (position) {
            case Position.Top:
                return -popup.height - 5
            case Position.Bottom:
                return parent.height + 5
            case Position.Left:
            case Position.Center:
            case Position.Right:
                return (parent.height - popup.height) / 2
            default:
                return -popup.height + 5  // 默认顶部
        }
    }

    background: Rectangle {
        id: background
        anchors.fill: parent
        y: -6

        radius: Theme.currentTheme.appearance.windowRadius
        color: Theme.currentTheme.colors.backgroundAcrylicColor
        border.color: Theme.currentTheme.colors.flyoutBorderColor

        Behavior on color {
            ColorAnimation {
                duration: Utils.appearanceSpeed
                easing.type: Easing.OutQuart
            }
        }

        layer.enabled: true
        layer.effect: Shadow {
            style: "flyout"
            source: background
        }
    }

    // 动画 / Animation //
    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: popup
                property: "opacity"
                from: 0
                to: 1
                duration: Utils.appearanceSpeed
                easing.type: Easing.OutQuint
            }
            NumberAnimation {
                target: popup
                property: "y"
                from: posY + (position !== Position.Center
                    ? (position === Position.Top ? 15 : position === Position.Bottom ? -15 : 0) : 0)
                to: posY
                duration: Utils.animationSpeedMiddle * 1.25
                easing.type: Easing.OutQuint
            }
            NumberAnimation {
                target: popup
                property: "x"
                from: posX + (position !== Position.Center
                    ? (position === Position.Left ? 15 : position === Position.Right ? -15 : 0) : 0)
                to: posX
                duration: Utils.animationSpeedMiddle * 1.25
                easing.type: Easing.OutQuint
            }
        }
    }
    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: popup
                property: "opacity"
                from: 1
                to: 0
                duration: Utils.animationSpeed
                easing.type: Easing.OutQuint
            }
        }
    }
}
