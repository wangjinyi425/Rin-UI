import QtQuick 2.15
import QtQuick.Controls 2.15
import "../RinUI"

FluentWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Gallery")

    Row {
        spacing: 10
        // anchors.centerIn: parent

        PushButton {
            // text: "Fluent 按钮"
            buttonType: "primary"
            text: "切换主题"
            onClicked: {
                if (Theme.currentTheme.name === "light") {
                    Theme.setTheme("dark")
                } else {
                    Theme.setTheme("light")
                }
            }
        }
        PushButton {
            // text: "Fluent 按钮"
            buttonType: "standard"
            text: "Fluent Button"
        }
    }
}