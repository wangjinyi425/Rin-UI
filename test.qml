import QtQuick
import QtQuick.Controls
import QtQuick.Window
import RinUI

FluentWindowBase {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Flow {
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
        Button {
            text: qsTr("Click me")
            onClicked: {
                floatLayer.infoBarCreate({
                    title: "Hello World",
                    text: "This is a test.",
                    severity: Severity.Warning,
                    position: Position.TopLeft,
                })
            }
        }
        Button {
            text: qsTr("Click me")
            onClicked: {
                floatLayer.infoBarCreate({
                    title: "Hello World",
                    text: "This is a test.",
                    severity: Severity.Info,
                    position: Position.Top,
                })
            }
        }
        Button {
            text: qsTr("Click me")
            onClicked: {
                floatLayer.infoBarCreate({
                    title: "Hello World",
                    text: "This is a test.",
                    severity: Severity.Success,
                    position: Position.TopRight,
                })
            }
        }
    }
}
