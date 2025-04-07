import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Window 2.3
import "../themes"
import "../components"
import "../windows"

Item {
    id: root
    property int titleBarHeight: Theme.currentTheme.appearance.dialogTitleBarHeight
    property alias title: titleLabel.text
    property alias icon: iconLabel.source
    property alias backgroundColor: rectBk.color

    // 自定义属性
    property bool titleEnabled: true

    height: titleBarHeight
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    clip: true
    z: 999

    property var window: null
    function toggleMaximized(mode) {
        if(mode===0){
            if (window.visibility === Window.Maximized) {
                window.showNormal();
            } else {
                window.showMaximized();
            }
        }else if(mode===1){
            window.showMinimized()
        }else if(mode===2){
            window.close()
        }else if(mode===4){
            return window.visibility
        }
        return 0;

    }

    Rectangle{
        id:rectBk
        anchors.fill: parent
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            anchors.leftMargin: 48
            anchors.margins: Utils.windowDragArea
            propagateComposedEvents: true
            acceptedButtons: Qt.LeftButton
            property point clickPos: "0,0"

            onPressed: clickPos = Qt.point(mouseX, mouseY)
            onDoubleClicked: toggleMaximized(0)
            onPositionChanged: (mouse) => {
                //鼠标偏移量
                let delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

                window.setX(window.x+delta.x)
                window.setY(window.y+delta.y)
            }
        }
    }

    // 窗口按钮 / Window Controls
    Row{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 0
        CtrlBtn {
            mode: 1
        }
        CtrlBtn {
            mode: 0
            // icon: (toggleMaximized(4) === Window.Maximized)? "\ueb95" : "\ue1aa"

        }
        CtrlBtn {
            mode: 2
        }
    }

    // 窗口标题 / Window Title
    Row {
        id: titleRow
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 16
        spacing: 16
        visible: root.titleEnabled

        //图标
        IconWidget {
            id: iconLabel
            size: 16
            // icon: "\uf12a"
            anchors.verticalCenter: parent.verticalCenter
        }

        //标题
        Text {
            id: titleLabel
            anchors.verticalCenter:  parent.verticalCenter

            typography: Typography.Caption
            text: qsTr("Fluent TitleBar")
        }
    }

    // MouseArea {
    //     width: root.height
    //     height: root.height
    //     // z: 1
    // }
}