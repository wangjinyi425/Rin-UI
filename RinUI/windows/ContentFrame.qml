import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../windows"

// 内容层 / Content Area
Item {
    id: contentArea
    property int titleBarHeight: Theme.currentTheme.appearance.windowTitleBarHeight
    property bool borderVisible: false

    width: parent.width
    height: parent.height - titleBarHeight
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.margins: 8

    Component.onCompleted: {
        if (borderVisible) {
            contentArea.border.color = Theme.currentTheme.appearance.borderColor
            contentArea.border.width = 1
        }
    }
}
