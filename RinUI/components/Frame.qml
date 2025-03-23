import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"


Frame {
    id: root
    property bool frameless: false

    clip: true

    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: Theme.currentTheme.appearance.cardRadius
        color: Theme.currentTheme.colors.cardColor
        border.width: Theme.currentTheme.appearance.borderWidth
        border.color: Theme.currentTheme.colors.controlQuaternaryColor
        visible: !root.frameless
    }
}