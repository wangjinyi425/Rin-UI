import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

ProgressBar {
    id: control

    // 胶囊形状参数
    property real capsuleRadius: height / 2  // 自动计算圆角
    property color backgroundColor: Theme.currentTheme.colors.controlColor
    property color progressColor: Theme.currentTheme.colors.primaryColor

    // 尺寸规范
    implicitWidth: 200
    implicitHeight: 8

    // 背景轨道
    background: Rectangle {
        width: parent.width
        height: parent.height
        radius: capsuleRadius
        color: backgroundColor.darker(1.1)
    }

    // 进度指示
    contentItem: Rectangle {
        width: control.visualPosition * parent.width
        height: parent.height
        radius: capsuleRadius  // 关键：与背景相同圆角
        color: progressColor

        // 进度动画
        Behavior on width {
            NumberAnimation {
                duration: Theme.currentTheme.animation.durationMedium
                easing.type: Easing.OutCubic
            }
        }

        // 进度圆角修正（防止右侧凹陷）
        Rectangle {
            visible: width < parent.width
            anchors.right: parent.right
            width: height
            height: parent.height
            color: parent.color
        }
    }
}