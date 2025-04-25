import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"
import "../../components"


Menu {
    id: root

    property bool hasIcons: false  // 标记是否有图标
    implicitWidth: Math.max(contentItem.implicitWidth, 80)
    implicitHeight: contentItem.implicitHeight
    // x: (parent.width - root.width) / 2
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
        implicitWidth: 80
        implicitHeight: 36
        radius: Theme.currentTheme.appearance.windowRadius
        color: Theme.currentTheme.colors.backgroundAcrylicColor
        border.color: Theme.currentTheme.colors.flyoutBorderColor

        layer.enabled: true
        layer.effect: Shadow {
            id: shadow
            style: "flyout"
            source: background
        }
    }

    delegate: MenuItem { }

    contentItem: Flickable {
        id: flickable
        clip: true
        anchors.fill: parent
        // contentWidth: width
        // contentHeight: column.implicitHeight
        implicitWidth: column.implicitWidth
        implicitHeight: column.implicitHeight
        // interactive: column.implicitHeight > height

        Column {
            id: column
            topPadding: 5
            bottomPadding: 5
            Repeater {
                model: root.contentModel  // 默认的 Menu 内容
                delegate: root.delegate
            }
        }

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            policy: ScrollBar.AsNeeded
            visible: false  // 初始隐藏，在 enter 动画中显现
        }
    }
}