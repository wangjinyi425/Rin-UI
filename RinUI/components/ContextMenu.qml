import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"


Popup {
    id: contextMenu

    // 选中信号 / Signal //
    signal itemSelected(int index)

    property alias model: listView.model
    property alias currentIndex: listView.currentIndex
    property int maxHeight: 166  // 最大高度

    implicitWidth: 100
    implicitHeight: Math.min(listView.contentHeight + 6, maxHeight)
    y: Math.round((parent.height - height) / 2)
    height: implicitHeight  // 保持隐式绑定
    closePolicy: Popup.CloseOnPressOutside

    // 内容 / ListView //
    contentItem: ListView {
        id: listView
        clip: true
        spacing: 0
        anchors.fill: parent  // 清除边距
        anchors.topMargin: 2
        anchors.bottomMargin: 2

        // 垂直滚动条 / Vertical ScrollBar //
        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            policy: ScrollBar.AsNeeded
        }

        // 选择器 / Selection //
        delegate: ItemDelegate {
            width: listView.width
            height: text.implicitHeight + 21  // 自适应
            highlighted: ListView.isCurrentItem  // 当前项高亮

            background: Rectangle {
                id: itemBg
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                radius: Theme.currentTheme.appearance.buttonRadius / 2
                color: pressed
                    ? Theme.currentTheme.colors.subtleTertiaryColor
                    : (highlighted || hovered)
                        ? Theme.currentTheme.colors.subtleSecondaryColor
                        : Theme.currentTheme.colors.subtleColor

                TextLabel {
                    id: text
                    anchors.fill: parent
                    anchors.leftMargin: 11
                    anchors.rightMargin: 11
                    anchors.topMargin: 6
                    anchors.bottomMargin: 8
                    verticalAlignment: Text.AlignVCenter

                    labelType: "body"
                    wrapMode: Text.Wrap
                    text: modelData
                }

                // 选择指示器
                Indicator {
                    visible: highlighted
                }

                Behavior on color { ColorAnimation { duration: 200; easing.type:Easing.InOutQuart } }
            }

            onClicked: {
                listView.currentIndex = index
                contextMenu.itemSelected(index)
                contextMenu.close()
            }
        }

        // 通过状态绑定同步 animHeight 和实际 height
        states: State {
            when: contextMenu.opened
            PropertyChanges {
                target: contextMenu
                height: contextMenu.implicitHeight
            }
        }
    }

    // 背景 / Background //
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: controlRadius
        color: Theme.currentTheme.colors.backgroundAcrylicColor
        border.color: Theme.currentTheme.colors.controlBorderColor

        // 阴影 / Shadow //
        Shadow {
            id: shadow
            style: "flyout"
        }
    }

    // 按钮 / Button //


    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: contextMenu
                property: "opacity"
                from: 0
                to: 1
                duration: 70
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: shadow
                property: "opacity"
                from: 0
                to: 1
                duration: 600
                easing.type: Easing.InOutCubic
            }
            NumberAnimation {
                target: scrollBar
                property: "opacity"
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutCubic
            }
            NumberAnimation {
                target: contextMenu
                property: "height"
                from: 46
                to: contextMenu.implicitHeight
                duration: 450
                easing.type: Easing.OutQuint
                onRunningChanged: {
                    console.log("Transition finished");
                    scrollBar.visible = true;
                }
            }
        }
    }
    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: contextMenu
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.InOutQuart
            }
        }
    }
}