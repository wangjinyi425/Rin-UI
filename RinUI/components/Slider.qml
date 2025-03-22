import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

// thanks JerryQAQ

Slider {
    id: root
    // 尺寸属性
    property real handleSize: Theme.currentTheme.appearance.sliderHandleSize  // 手柄基础尺寸
    property real borderWidth: 3   // 边框宽度
    property real trackHeight: 4
    property bool showTooltip: true
    property color primaryColor: Theme.currentTheme.colors.primaryColor

    // 自适应高度和宽度
    implicitHeight: orientation === Qt.Horizontal ? 32 : 150
    implicitWidth: orientation === Qt.Horizontal ? 150 : 32


    // Background / 背景 //
    background: Rectangle {
        anchors.centerIn: parent
        width: root.orientation === Qt.Horizontal ? parent.width - 2 : trackHeight
        height: root.orientation === Qt.Horizontal ? trackHeight : parent.height - 2
        radius: 99
        clip: true
        color: Theme.currentTheme.colors.controlStrongColor

        Behavior on color {
            ColorAnimation {
                duration: Utils.appearanceSpeed
                easing.type: Easing.OutQuart
            }
        }

        // track
        Rectangle {
            width: root.orientation === Qt.Horizontal ? root.visualPosition * parent.width : trackHeight
            height: root.orientation === Qt.Horizontal ? trackHeight : (1 - root.visualPosition) * parent.height
            anchors.bottom: root.orientation === Qt.Vertical ? parent.bottom : undefined
            radius: 99
            color: Theme.currentTheme.colors.primaryColor

            Behavior on width {
                NumberAnimation {
                    duration: Utils.animationSpeedFaster
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on color {
                ColorAnimation {
                    duration: Utils.appearanceSpeed
                    easing.type: Easing.OutQuart
                }
            }
            Behavior on height {
                NumberAnimation {
                    duration: Utils.animationSpeedFaster
                    easing.type: Easing.OutCubic
                }
            }
        }
    }


    // 手柄 / Handle //
    handle: Item {
        id: handle
        property bool hovered: false
        width: handleSize + 2
        height: handleSize + 2

        // 动态调整手柄位置：根据 orientation 切换 x/y 轴逻辑
        x: root.orientation === Qt.Horizontal
           ? root.visualPosition * (parent.width - width)  // 横向：x 受 visualPosition 控制
           : (parent.width - width) / 2  // 竖向
        y: root.orientation === Qt.Vertical
           ? (root.visualPosition) * (parent.height - height)  // 竖向：y 受 visualPosition 控制
           : (parent.height - height) / 2  // 横向


        Tooltip {
            text: root.value.toString()
            visible: root.showTooltip ? (handle.hovered || root.pressed)  : false
            delay: 150
        }

        // MouseArea
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: handle.hovered = true
            onExited: handle.hovered = false
        }

        // border
        Rectangle {
            anchors.fill: parent
            radius: width / 2
            color: Theme.currentTheme.colors.controlQuaternaryColor
        }

        // border middle(?)
        Rectangle {
            anchors.centerIn: parent
            width: handleSize
            height: handleSize
            radius: width / 2
            color: Theme.currentTheme.colors.controlSolidColor

            Behavior on color {
                ColorAnimation {
                    duration: Utils.appearanceSpeed
                    easing.type: Easing.OutQuart
                }
            }
        }

        // dot 主题色圆点
        Rectangle {
            id: dot
            anchors.centerIn: parent
            // 取偶数
            width: Math.round(handleSize * 0.55) & ~1
            height: Math.round(handleSize * 0.55) & ~1
            radius: width / 2

            // 悬停
            scale: root.pressed ? 0.83 :
                handle.hovered ? 1.16 : 1.0
            color: root.pressed ? Qt.alpha(Theme.currentTheme.colors.primaryColor, 0.8) :
                handle.hovered ? Qt.alpha(Theme.currentTheme.colors.primaryColor, 0.9) : Theme.currentTheme.colors.primaryColor

            // 动画
            Behavior on color {
                ColorAnimation {
                    duration: Utils.appearanceSpeed
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on scale {
                NumberAnimation {
                    duration: Utils.animationSpeed
                    easing.type: Easing.OutBack
                }
            }
        }

        Behavior on x {
            NumberAnimation {
                duration: Utils.animationSpeedFaster
                easing.type: Easing.OutCubic
            }
        }
        Behavior on y {
            NumberAnimation {
                duration: Utils.animationSpeedFaster
                easing.type: Easing.OutCubic
            }
        }
    }


    // 状态管理
    states: [
        State {
            name: "disabled"
            when: !root.enabled
            PropertyChanges {
                target: handle
                color: Theme.currentTheme.colors.textDisabled
                opacity: 0.6
            }
        }
    ]
}
