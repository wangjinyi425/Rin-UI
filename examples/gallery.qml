import QtQuick 2.15
import QtQuick.Controls 2.15
import "../RinUI"

FluentWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Gallery")

    Column {
        spacing: 10
        padding: 10
        width: parent.width
        height: parent.height

        TextLabel {
            labelType: "title"
            text: "Gallery"
        }

        TextLabel {
            labelType: "body"
            text: "测试测试"
        }

        TextLabel {
            labelType: "bodyLarge"
            text: "PushButton 按钮"
        }

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

        Row {
            spacing: 10

            ToggleSwitch {

            }
        }
    }
}