import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI
import "../components"

FluentPage {
    id: page
    title: "Dialogs & Flyouts"

    // dialog //
    Dialog {
        id: basicDialog
        title: qsTr("This is a dialog")
        modal: true
        Text {
            Layout.fillWidth: true
            text: qsTr("This a dialog with basic content. \nMeow")
        }
        onAccepted: {
            floatLayer.createInfoBar({text: "Accepted"})
            cuteText.text = "Wow! You accepted! ヾ(≧▽≦*)o"
        }
        onRejected: {
            floatLayer.createInfoBar({text: "Rejected"})
            cuteText.text = "Hmm... You rejected ╥﹏╥"
        }
        standardButtons: Dialog.Ok | Dialog.Cancel
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("Dialog")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr(
                "Use a ContentDialog to show relavant information or to provide a modal dialog experience "+
                "that can show any XAML content."
            )
        }

        Text {
            typography: Typography.BodyStrong
                text: "A basic content dialog with content."
        }
        Frame {
            width: parent.width
            Row {
                spacing: 8
                Button {
                    text: qsTr("Show Dialog")
                    onClicked: basicDialog.open()
                }
                Text {
                    id: cuteText
                    verticalAlignment: Qt.AlignVCenter
                    text: qsTr("← Nyaa~ Click this Button ~UwU~")
                }
            }
        }
    }
}
