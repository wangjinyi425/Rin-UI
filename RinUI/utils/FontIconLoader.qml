pragma Singleton
import QtQuick 2.15


Item {
    property string name: fontLoader.name
    FontLoader {
        id: fontLoader
        source: Qt.resolvedUrl("../assets/fonts/FluentSystemIcons-Resizable.ttf")
    }

    Component.onCompleted: console.log("Font Source:", fontLoader.name, "Status:", fontLoader.status)
}