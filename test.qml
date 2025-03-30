import QtQuick
import QtQuick.Controls
import QtQuick.Window
import RinUI

FluentWindowBase {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        id: helloWorld
        text: Theme.currentTheme.name
    }

    ComboBox {
            property var data: ["Light", "Dark", "Auto"]
            model: ["Light", "Dark", "Use system setting"]
            currentIndex: data.indexOf(Theme.getTheme())
            onCurrentIndexChanged: {
                Theme.setTheme(data[currentIndex])
            }
        }
}
