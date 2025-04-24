import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../components"

Popup {
    id: flyout
    property string text: "Flyout"
    property int position: 0  // 位置
    property alias buttonBox: buttonLayout.data  // 按钮列表
    property string image: ""  // 图片
    property real maximumWidth: 350  // 最大宽度

    property real posX: {
        switch (position) {
            case Position.Top:
            case Position.Bottom:
                return (parent.width - flyout.width) / 2
            case Position.Left:
                return - flyout.width - 5
            case Position.Right:
                return parent.width + 5
            default:
                return (parent.width - flyout.width) / 2
        }
    }

    property real posY: {
        switch (position) {
            case Position.Top:
                return -flyout.height - 5
            case Position.Bottom:
                return parent.height + 5
            case Position.Left:
            case Position.Right:
                return (parent.height - flyout.height) / 2
            default:
                return -flyout.height + 5  // 默认顶部
        }
    }

    padding: 16

    // 坐标

    contentItem: ColumnLayout {
        spacing: 0

        Image {
            id: flyoutImg
            Layout.fillWidth: true
            Layout.maximumWidth: maximumWidth
            Layout.margins: -flyout.padding + 2
            Layout.bottomMargin: 0
            Layout.preferredHeight: width * (sourceSize.height / sourceSize.width)
            fillMode: Image.PreserveAspectCrop
            source: flyout.image
            visible: flyout.image !== ""

            layer.enabled: true
            layer.smooth: true
            layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: flyoutImg.width
                height: flyoutImg.height
                radius: background.radius
                color: "black"

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: background.radius
                    color: "black"
                }
            }
        }
        }

        Item {
            height: 16
            visible: flyoutImg.visible
        }

        Text {
            id: flyoutText
            Layout.fillWidth: true
            Layout.maximumWidth: maximumWidth
            typography: Typography.Body
            text: flyout.text
        }

        Item {
            height: 16
            visible: buttonLayout.children.length > 0
        }

        RowLayout {
            Layout.fillWidth: true
            id: buttonLayout
            spacing: 8
        }
    }

    background: Rectangle {
        id: background
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
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
                target: flyout
                property: "opacity"
                from: 0
                to: 1
                duration: Utils.appearanceSpeed
                easing.type: Easing.OutQuint
            }
            NumberAnimation {
                target: flyout
                property: "y"
                from: posY + (position === Position.Top ? 15 : position === Position.Bottom ? -15 : 0)
                to: posY
                duration: Utils.animationSpeedMiddle * 1.25
                easing.type: Easing.OutQuint
            }
            NumberAnimation {
                target: flyout
                property: "x"
                from: posX + (position === Position.Left ? 15 : position === Position.Right ? -15 : 0)
                to: posX
                duration: Utils.animationSpeedMiddle * 1.25
                easing.type: Easing.OutQuint
            }
        }
    }
    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: flyout
                property: "opacity"
                from: 1
                to: 0
                duration: Utils.animationSpeed
                easing.type: Easing.OutQuint
            }
        }
    }
}
