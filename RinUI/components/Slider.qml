import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

Slider {
    id: root
    // 主题属性
    property real controlRadius: Theme.currentTheme.appearance.controlRadius
    property color trackColor: Theme.currentTheme.colors.controlColor.darker(1.1)
    property color progressColor: Theme.currentTheme.colors.primaryColor

    // 尺寸属性
    property real handleSize: 24  // 手柄基础尺寸
    property real borderWidth: 3   // 边框宽度
    property real trackHeight: 4

    // 颜色属性
    property color outlineColor: Qt.rgba(129/255, 130/255, 133/255, 1)
    property color primaryColor: Theme.currentTheme.colors.primaryColor

    // 轨道背景
    background: Rectangle {
        width: parent.width
        height: trackHeight
        radius: controlRadius
        color: outlineColor

        // 进度指示
        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            radius: controlRadius
            color: primaryColor
            Behavior on width {
                NumberAnimation {
                    duration: Theme.currentTheme.animation.durationMedium
                    easing.type: Easing.OutCubic
                }
            }
        }
    }

    // 手柄组件
    handle: Item {
        id: handle
        x: root.visualPosition * (parent.width - handleSize)
        y: (parent.height - handleSize) / 2
        width: 20
        height: 20

        // 轮廓层 (129,130,133)
        Rectangle {
            anchors.fill: parent
            radius: width / 2
            color: outlineColor
        }

        // 白色中间层
        Rectangle {
            anchors.centerIn: parent
            width: handleSize - 4  // 留出2px轮廓
            height: width
            radius: width / 2
            color: "white"
        }

        // 主色核心 (80%大小)
        Rectangle {
            anchors.centerIn: parent
            width: handleSize * 0.3
            height: handleSize * 0.3  // 保持内层椭圆比例
            radius: width / 2
            color: root.pressed ? Qt.darker(progressColor, 1.2) :
                   root.hovered ? Qt.lighter(progressColor, 1.1) : progressColor

            Behavior on color {
                ColorAnimation { duration: 150 }
            }
        }

        // 悬停动画
        scale: root.hovered ? 1.15 : 1.0
        Behavior on scale {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutBack
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
