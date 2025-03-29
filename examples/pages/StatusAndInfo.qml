import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

FluentPage {
    title: "Status & Info"

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("Tooltip")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("A Tooltip shows more information about a UI element.")
        }

        Frame {
            width: parent.width

            Button {
                text: qsTr("Button with a simple Tooltip")

                Tooltip {
                    parent: parent
                    delay: 500
                    visible: parent.hovered
                    text: "This is a tooltip"
                }
            }
        }
    }
}
