import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"
import "../../components"


ItemDelegate {
    id: root
    property var itemData
    property int parentIndex: -1
    property var currentPage
    highlighted: navigationItems.subItemIndex === index
    height: 40

    width: parent ? parent.width : 200

    background: Rectangle {
        id: itemBg
        anchors.fill: parent
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        clip: true
        radius: Theme.currentTheme.appearance.buttonRadius / 2
        color: pressed
            ? Theme.currentTheme.colors.subtleTertiaryColor
            : (root.highlighted || root.hovered)
                ? Theme.currentTheme.colors.subtleSecondaryColor
                : Theme.currentTheme.colors.subtleColor

        Row {
            id: left
            spacing: 16
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 11 + 34
            anchors.topMargin: 6
            anchors.bottomMargin: 8

            IconWidget {
                id: icon
                anchors.verticalCenter: parent.verticalCenter
                size: itemData.icon || itemData.source ? 19 : 0
                icon: itemData.icon || ""
                source: itemData.source || ""
            }

            Text {
                id: text
                anchors.verticalCenter: parent.verticalCenter
                typography: Typography.Body
                text: itemData.title
                clip: true
                opacity: navigationBar.collapsed ? 0 : 1
                wrapMode: Text.NoWrap
                horizontalAlignment: Text.AlignLeft

                Behavior on x {
                    NumberAnimation {
                        duration: Utils.appearanceSpeed
                        easing.type: Easing.InOutQuint
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: Utils.appearanceSpeed
                    }
                }
            }
        }

        Tooltip {
            visible: navigationBar.collapsed && root.hovered
            delay: 500
            text: itemData.title
        }

        Indicator {
            id: indicator
            y: root.height / 2 - indicator.height / 2 -2
            currentItemHeight: root.height
            opacity: navigationItems.subItemIndex === index ? 1 : 0
            width: 3

            Behavior on y {
                NumberAnimation {
                    duration: Utils.animationSpeedMiddle / 1.2
                    easing.type: Easing.InOutQuint
                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: Utils.animationSpeed
                    easing.type: Easing.InQuint
                }
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: Utils.appearanceSpeed
                easing.type: Easing.InOutQuart
            }
        }
    }

    onClicked: {
        if (itemData.page && currentPage) {
            navigationBar.lastIndex.append({ index: navigationBar.currentIndex })
            navigationBar.currentIndex = parentIndex
            navigationItems.subItemIndex = index
            currentPage.safePush(Qt.resolvedUrl(itemData.page))
        }
    }
}
