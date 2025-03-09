import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

Base {
    id: buttonBase
    property int borderWidth: Theme.currentTheme.appearance.borderWidth

    // Border //
    Rectangle {
        id: border
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "transparent"  // 透明背景
        border.color: root.borderColor
        border.width: borderWidth  // 边框宽度
        radius: Theme.currentTheme.appearance.buttonRadius * 1.1  // 圆角半径
    }
}