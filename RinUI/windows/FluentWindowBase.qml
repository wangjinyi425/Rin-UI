import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"

ApplicationWindow {
    id: baseWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("Fluent Window")

    color: Theme.currentTheme.colors.backgroundColor

    Behavior on color {
        ColorAnimation {
            duration: 250
            easing.type: Easing.OutQuart
        }
    }
}
