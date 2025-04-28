import QtQuick
import QtQuick.Controls
import QtQuick.Window
import RinUI


ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("New")
            }
            MenuItem {
                text: qsTr("Open")
            }
            MenuItem {
                text: qsTr("Save")
            }
            MenuSeparator {}
            MenuItem {
                text: qsTr("Exit")
                onClicked: Qt.quit()
            }
        }
        Menu {
            title: qsTr("Edit")
            MenuItem {
                text: qsTr("Undo")
            }
            MenuItem {
                text: qsTr("Redo")
            }
            MenuSeparator {}
            MenuItem {
                text: qsTr("Cut")
            }
            MenuItem {
                text: qsTr("Copy")
            }
            MenuItem {
                text: qsTr("Paste")
            }
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 16
        spacing: 4
        Button {
            highlighted: true
            text: qsTr("Click me!")
            onClicked: dialog.open()

            Dialog {
                id: dialog
                modal: true
                title: qsTr("Dialog")
                Text {
                    text: qsTr("This is a dialog.")
                }
                onAccepted: {
                    Theme.toggleMode()
                }
                standardButtons: Dialog.Ok | Dialog.Cancel
            }
        }
        Button {
            text: qsTr("Button")
        }
    }
}