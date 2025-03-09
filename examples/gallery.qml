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

        Flow {
            spacing: 10
            width: parent.width  // width
            // anchors.centerIn: parent

            PushButton {
                id: btn_1
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
                enabled: true
                buttonType: "standard"
                text: "Push Button"
            }
            PushButton {
                text: "Disabled"
                enabled: false
            }
        }

        Row {
            spacing: 10

            ToggleSwitch {
                checked: true
                onCheckedChanged: {
                    if (checked) {
                        btn_1.enabled = true
                        console.log("Switch is on")
                    } else {
                        btn_1.enabled = false
                        console.log("Switch is off")
                    }
                }
            }
        }
    }
}