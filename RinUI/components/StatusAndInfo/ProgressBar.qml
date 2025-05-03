import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import Qt5Compat.GraphicalEffects 1.0
import "../../themes"
import "../../components"

ProgressBar {
    id: root

    property color backgroundColor: indeterminate
        ? "transparent"
        : Theme.currentTheme.colors.controlBorderStrongColor
    property color primaryColor: Theme.currentTheme.colors.primaryColor
    property int radius: 99
    property int state: ProgressBar.Running
    enum State {
        Running,
        Paused,
        Error
    }

    // 尺寸规范
    implicitWidth: 200
    implicitHeight: 3
    value: 0

    // 背景轨道
    background: Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 1
        radius: root.radius
        color: backgroundColor
        Text {
            text: root.state
        }
    }

    // 遮罩
    layer.enabled: true
    layer.smooth: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: root.width
            height: root.height
            radius: root.radius
        }
    }

    // 进度指示
    contentItem: Rectangle {
        id: indicator
        height: parent.height
        radius: root.radius
        color: root.state === 1 ? Theme.currentTheme.colors.systemCautionColor :
            root.state === 2 ? Theme.currentTheme.colors.systemCriticalColor :
            Theme.currentTheme.colors.primaryColor

        width: indeterminate ? state === 0 ? root.width / 3 : parent.width : root.visualPosition * parent.width
        x: indeterminate ? -indicator.width : 0

        NumberAnimation {
            target: indicator

            property: "x"
            from: -indicator.width
            to: root.width
            duration: Utils.progressBarAnimationSpeed
            loops: Animation.Infinite
            easing.type: Easing.InOutQuart

            running: indeterminate && state === 0
        }

        // 进度动画
        Behavior on width {
            enabled: !indeterminate
            NumberAnimation {
                duration: Utils.animationSpeed  // 175
                easing.type: Easing.OutCubic
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: Utils.animationSpeed
                easing.type: Easing.OutCubic
            }
        }
    }

    // 归位动画
    SequentialAnimation {
        running: indeterminate && state !== 0
        NumberAnimation {
            target: indicator
            property: "width"
            from: indicator.width
            to: root.width / 10
            duration: Utils.animationSpeedFaster
            easing.type: Easing.InQuart
        }
        NumberAnimation {
            target: indicator
            property: "width"
            from: 0
            to: root.width
            duration: Utils.animationSpeedMiddle
            easing.type: Easing.OutQuint
        }
    }

    onStateChanged: {
        if (state !== 0 && indeterminate) {
            indicator.x = 0
        } else if (state === 0 && indeterminate) {
            indicator.width = root.width / 3
        }
    }

    Component.onCompleted: {
        if (!indeterminate) {
            indicator.width = root.visualPosition * root.width
        } else {
            indicator.width = state === 0 ? root.width / 3 : parent.width
        }
    }
}