import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../components"
import "../windows"

// 内容层 / Content Area
Page {
    id: fluentPage
    default property alias content: container.data


    // 头部 / Header //
    header: Item {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.leftMargin: 24
        anchors.rightMargin: 24
        // anchors.topMargin: 8
        height: 36

        TextLabel {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            labelType: "title"
            text: "Gallery"
            visible: fluentPage.title !== ""  // 标题
        }
    }


    background: Item {}

    Flickable {
        anchors.fill: parent
        clip: true
        ScrollBar.vertical: ScrollBar {}
        contentHeight: container.height

        ColumnLayout {
            id: container
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 24
            anchors.rightMargin: 24
        }
    }

    anchors.fill: parent
}
