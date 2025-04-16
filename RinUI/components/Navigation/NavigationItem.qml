import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"
import "../../components"

Item {
    id: navigationItems
    property var itemData
    property int subItemIndex: -1
    readonly property bool subItem: itemData.subItems && itemData.subItems.length > 0
    readonly property int itemIndex: index
    property var currentPage
    property bool highlighted: navigationBar.currentIndex === index && (subItemIndex === -1 || collapsed)

    property bool collapsed: true  // 是否折叠

    height: 40 + (!collapsed ? subItemsColumn.height : 0)
    width: parent ? parent.width : 200

    Button {
        id: itemBtn
        // anchors.fill: parent
        width: parent.width
        height: 37
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        clip: true
        flat: true
        background.opacity: navigationItems.highlighted ? 1 : hovered ? 1 : 0

        Row {
            id: left
            spacing: 16
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 11
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

        // 提示
        Tooltip {
            visible: navigationBar.collapsed && itemBtn.hovered
            delay: 500
            text: itemData.title
        }

        Indicator {
            id: indicator
            y: (itemBtn.height + 3) / 2 - indicator.height / 2 - 2
            currentItemHeight: itemBtn.height + 3
            opacity: highlighted ? 1 : 0
            width: 3

            Behavior on opacity {
                NumberAnimation {
                    duration: Utils.animationSpeed
                    easing.type: Easing.InQuint
                }
            }
        }

        // 展开按钮
        ToolButton {
            id: expandBtn
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height
            height: parent.height
            hoverable: false
            size: 14
            icon.name: "ic_fluent_chevron_down_20_filled"

            transform: Rotation {
                angle: collapsed ? 0 : 180 ; origin.x: 37/2; origin.y: 37/2
                Behavior on angle { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
            }

            visible: subItem && !navigationBar.collapsed
            opacity: 0.7

            onClicked: { collapsed = !collapsed }
        }

        onClicked: {
            if (itemData.page && currentPage) {
                navigationItems.subItemIndex = -1
                navigationBar.currentIndex = index
                currentPage.safePush(Qt.resolvedUrl(itemData.page))
            }
            if (subItem ) {
                collapsed = !collapsed
            }
        }
    }

    // 动画 / Animation //
    Behavior on height { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }


    // 递归处理子项
    Column {
        id: subItemsColumn
        opacity: !collapsed && subItem
        spacing: 2
        anchors.top: itemBtn.bottom
        width: parent.width
        anchors.topMargin: 1
        anchors.leftMargin: 16
        Behavior on opacity { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }

        Repeater {
            id: subItemsRepeater
            model: itemData.subItems
            delegate: NavigationSubItem {
                itemData: modelData
                parentIndex: itemIndex
                currentPage: navigationItems.currentPage
            }
        }

        Item {
            width: parent.width
            height: 1
        }
    }
}
