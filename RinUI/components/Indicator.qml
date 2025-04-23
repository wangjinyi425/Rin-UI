import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"


Rectangle {
    id: indicator

    property int currentItemHeight: 38

    implicitWidth: 3
    implicitHeight: currentItemHeight - 23
    radius: 10
    color: Theme.currentTheme.colors.primaryColor

    y: (parent.height - height) / 2

    onVisibleChanged: {
        if (visible) {
            enterAnimation.start()
        }
    }

    // 动画 / Animation //
    ParallelAnimation {
        id: enterAnimation
        PropertyAnimation {
            target: indicator
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: Utils.animationSpeed
            easing.type: Easing.OutQuad
        }

        PropertyAnimation {
            target: indicator
            property: "height"
            from: 0
            to: indicator.implicitHeight
            duration: Utils.animationSpeed
            easing.type: Easing.OutQuint
        }

        PropertyAnimation {
            target: indicator
            property: "y"
            from: parent.height / 2
            to: (parent.height - indicator.implicitHeight) / 2
            duration: Utils.animationSpeed
            easing.type: Easing.OutQuint
        }
    }
}