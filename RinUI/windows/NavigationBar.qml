import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"
import "../themes"


Item {
    id: navigationBar
    implicitWidth: 300
    height: parent.height

    property var navModel: ListModel {
        // ListElement { title: "Home"; icon: null; page: "Home.qml"; key: "home" }
    }
    property alias currentIndex: listView.currentIndex
    property bool titleBarEnabled: true
    property alias windowTitle: titleLabel.text
    property alias windowIcon: iconLabel.icon
    property var stackView: parent.stackView
    property var lastIndex: []  // 记录的索引

    Row {
        id: title
        anchors.left: parent.left
        anchors.bottom: parent.top
        height: titleBarHeight
        spacing: 16
        visible: navigationBar.titleBarEnabled

        Component.onCompleted: {
            console.log(titleBarHeight)
        }

        // 返回按钮
        ToolButton {
            anchors.verticalCenter: parent.verticalCenter
            icon.name: "\uf15b"
            onClicked: stackView.safePop()
            width: 40
            height: 40
            // enabled: navigationBar.lastIndex.length > 0

            Tooltip {
                parent: parent
                delay: 500
                visible: parent.hovered
                text: qsTr("Back")
            }
        }

        //图标
        IconWidget {
            id: iconLabel
            size: 16
            icon: "\uf12a"
            anchors.verticalCenter: parent.verticalCenter
        }

        //标题
        Text {
            id: titleLabel
            anchors.verticalCenter:  parent.verticalCenter

            typography: Typography.Caption
            // text: title
        }
    }

    ListView {
        id: listView
        clip: true
        spacing: 0
        anchors.fill: parent
        model: navModel
        currentIndex: -1

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }

        delegate: ItemDelegate {
            id: delegateItem
            width: listView.width
            height: 40
            highlighted: ListView.isCurrentItem

            background: Rectangle {
                id: itemBg
                anchors.fill: parent
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                clip: true
                radius: Theme.currentTheme.appearance.buttonRadius / 2
                color: pressed
                    ? Theme.currentTheme.colors.subtleTertiaryColor
                    : (highlighted || hovered)
                        ? Theme.currentTheme.colors.subtleSecondaryColor
                        : Theme.currentTheme.colors.subtleColor

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
                        size: 16
                        icon: ! model.icon ? "\ue8a1" : model.icon
                    }

                    Text {
                        id: text
                        anchors.verticalCenter: parent.verticalCenter
                        typography: Typography.Body
                        text: model.title
                    }
                }


                // 指示器
                Indicator {
                    id: indicator
                    y: listView.currentIndex >= 0
                        ? listView.currentItem.y - (delegateItem.height) * index + height / 2
                        : 0
                    currentItemHeight: listView.currentItem.height
                    opacity: highlighted

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

                Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type:Easing.InOutQuart } }
            }

            onClicked: {
                navigationBar.lastIndex.push(listView.currentIndex)
                listView.currentIndex = index
                navigationBar.currentIndex = index
            }
        }
    }
}
