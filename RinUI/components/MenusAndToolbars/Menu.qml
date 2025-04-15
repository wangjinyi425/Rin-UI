import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"
import "../../components"


Menu {
    id: root

    property bool hasIcons: false  // 标记是否有图标
    implicitWidth: Math.max(contentItem.childrenRect.width, 120)
    x: (parent.width - root.width) / 2
    // y: parent.height + 5

    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "opacity"
                from: 0
                to: 1
                duration: 70
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: root
                property: "height"
                from: 0
                to: root.implicitHeight
                duration: Utils.animationSpeed
                easing.type: Easing.OutQuint
            }
            NumberAnimation {
                target: root
                property: "y"
                from: 0
                to: root.parent.height + 5
                duration: Utils.animationSpeedMiddle
                easing.type: Easing.OutQuint
                onRunningChanged: {
                    scrollBar.visible = true;
                }
            }
        }
    }
    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.InOutQuart
            }
        }
    }

    spacing: 5
    topPadding: 5
    bottomPadding: 5

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 36
        radius: Theme.currentTheme.appearance.windowRadius
        color: Theme.currentTheme.colors.backgroundAcrylicColor
        border.color: Theme.currentTheme.colors.flyoutBorderColor

        Shadow {
            id: shadow
            style: "flyout"
        }
    }

    delegate: MenuItem { }
}