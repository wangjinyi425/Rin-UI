import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../RinUI"

FluentPage {
    title: "Basic Input"

    Column {
        Layout.fillWidth: true
        spacing: 4

        TextLabel {
            labelType: "subtitle"
            text: qsTr("Buttons")
        }
        TextLabel {
            width: parent.width
            labelType: "body"
            text: qsTr("The Button Control provides a Click event to respond to user input.")
        }

        Frame {
            width: parent.width

            Row {
                width: parent.width
                spacing: 4
                Button {
                    text: "Button"
                }
                Button {
                    buttonType: "primary"
                    text: "Button"
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        TextLabel {
            labelType: "subtitle"
            text: qsTr("ComboBox")
        }
        TextLabel {
            width: parent.width
            labelType: "body"
            text: qsTr("Use a ComboBox when you need to conserve on-screen space and when users select only one option at a time.")
        }

        Frame {
            width: parent.width

            Row {
                width: parent.width
                spacing: 4
                ComboBox {
                    model: ["Option 1", "Option 2", "Option 3", "Option 4"]
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        TextLabel {
            labelType: "subtitle"
            text: qsTr("ToggleSwitch")
        }
        TextLabel {
            width: parent.width
            labelType: "body"
            text: qsTr("Use ToggleSwitch controls to present users with exactly 2 mutually exclusive options.")
        }

        Frame {
            width: parent.width

            Row {
                width: parent.width
                spacing: 4
                ToggleSwitch {

                }
            }
        }
    }
}
