import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"
import "../windows"

// 内容层 / Content Area
ScrollView {
    id: contentArea
    property int titleBarHeight: Theme.currentTheme.appearance.windowTitleBarHeight
    property bool borderVisible: false

    anchors.fill: parent
    anchors.margins: 8
    anchors.topMargin: titleBarHeight

    contentWidth: contentArea.width  // 内容宽度 / Content width

    Component.onCompleted: {
        if (borderVisible) {
            contentArea.border.color = Theme.currentTheme.appearance.borderColor
            contentArea.border.width = 1
        }
    }
}
