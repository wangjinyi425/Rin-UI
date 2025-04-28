import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI
import "../../components"

ControlPage {
    title: qsTr("TimePicker")

    // intro
    Text {
        Layout.fillWidth: true
        text: qsTr(
            "Use a TimePicker to let users set a time in your app, for example to set a reminder. The TimePicker " +
            "displays three controls for hours, minutes, and AM/PM. These controls are easy to use with " +
            "touch or mouse, and they can be styled and configured in several different ways. "
        )
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.BodyStrong
            text: qsTr("A simple SpinBox.")
        }
        ControlShowcase {
            width: parent.width
            TimePicker {}

            showcase: [
                CheckBox {
                    id: spinSwitch
                    text: qsTr("Disable SpinBox")
                }
            ]
        }
    }
}
