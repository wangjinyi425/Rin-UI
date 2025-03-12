import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

ScrollView {
    id: scrollViewer
    // clip: true
    // color: "transparent"

   ScrollBar {
        id: vbar
        hoverEnabled: true
        active: hovered || pressed
        orientation: Qt.Vertical
        size: frame.height / content.height
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    ScrollBar {
        id: hbar
        hoverEnabled: true
        active: hovered || pressed
        orientation: Qt.Horizontal
        size: frame.width / content.width
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }


    // color: Theme.currentTheme.colors.textColor
    // // 主题切换动画 / Color Animation
    // Behavior on color {
    //     ColorAnimation {
    //         duration: 250
    //         easing.type: Easing.OutQuart
    //     }
    // }
    //
    // Component.onCompleted: {
    //     if (labelType === "display") {
    //         label.font.pixelSize = Theme.currentTheme.typography.displaySize
    //         label.font.bold = true
    //     } else if (labelType === "titleLarge") {
    //         label.font.pixelSize = Theme.currentTheme.typography.titleLargeSize
    //         label.font.bold = true
    //     } else if (labelType === "title") {
    //         label.font.pixelSize = Theme.currentTheme.typography.titleSize
    //         label.font.bold = true
    //     } else if (labelType === "subtitle") {
    //         label.font.pixelSize = Theme.currentTheme.typography.subtitleSize
    //         label.font.bold = true
    //     } else if (labelType === "body") {
    //         label.font.pixelSize = Theme.currentTheme.typography.bodySize
    //     } else if (labelType === "bodyLarge") {
    //         label.font.pixelSize = Theme.currentTheme.typography.bodyLargeSize
    //         label.font.bold = true
    //     } else if (labelType === "caption") {
    //         label.font.pixelSize = Theme.currentTheme.typography.captionSize
    //     }
    // }
}