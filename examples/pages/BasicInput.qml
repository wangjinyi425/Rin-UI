import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI
import "../components"

FluentPage {
    title: "Basic Input"

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("Buttons")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("The Button Control provides a Click event to respond to user input.")
        }

        ControlShowcase {
            width: parent.width

            showcase: [
                Text {
                    text: "Enable Button"
                },
                Switch {
                    id: disableSwitch
                    checked: true
                }
            ]

            Text {
                text: "Button"
            }
            Row {
                width: parent.width
                spacing: 4
                Button {
                    text: "Button"
                    enabled: disableSwitch.checked
                }
                Button {
                    highlighted: true
                    text: "Button On Accent"
                    enabled: disableSwitch.checked
                }
            }
            Text {
                text: "With Icon"
            }
            Row {
                width: parent.width
                spacing: 4
                Button {
                    text: "Button"
                    icon.name: "ic_fluent_alert_20_regular"
                    enabled: disableSwitch.checked

                    Tooltip {
                        text: "icon.name: \"ic_fluent_alert_20_regular\""
                        visible: parent.hovered
                    }
                }
                Button {
                    text: "Button"
                    icon.source: Qt.resolvedUrl("../assets/banner.png")
                    enabled: disableSwitch.checked

                    Tooltip {
                        text: "icon.source: Qt.resolvedUrl(\"../assets/banner.png\")"
                        visible: parent.hovered
                    }
                }
                Button {
                    highlighted: true
                    icon.name: "ic_fluent_alert_20_regular"
                    text: "Button On Accent"
                    enabled: disableSwitch.checked
                    Tooltip {
                        text: "icon.name: \"ic_fluent_alert_20_regular\""
                        visible: parent.hovered
                    }
                }
            }
            Text {
                text: "Flat"
            }
            Row {
                width: parent.width
                spacing: 4
                Button {
                    text: "Button"
                    flat: true
                    enabled: disableSwitch.checked
                }
                Button {
                    highlighted: true
                    flat: true
                    icon.name: "ic_fluent_alert_20_regular"
                    text: "Button On Accent"
                    enabled: disableSwitch.checked
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("ComboBox")
        }
        Text {
            width: parent.width
            typography: Typography.Body
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

        Text {
            typography: Typography.Subtitle
            text: qsTr("Radio Button")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("Use RadioButtons to let a user choose between mutually exclusive, "+
            "related options. Generally contained within a RadioButtons group control.")
        }

        ControlShowcase {
            width: parent.width

            Column {
                spacing: 4
                RadioButton {
                    text: "Option 1"
                    enabled: disableSwitch_4.checked
                }
                RadioButton {
                    text: "Option 2"
                    enabled: disableSwitch_4.checked
                }
                RadioButton {
                    text: "Option 3"
                    enabled: disableSwitch_4.checked
                }
            }

            showcase: [
                Text {
                    text: "Enable Radio Buttons"
                },
                Switch {
                    id: disableSwitch_4
                    checked: true
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("CheckBox")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("CheckBox controls let the user select a combination of binary options."+
             "In contrast, RadioButton controls allow the user to select from mutually exclusive options.")
        }

        ControlShowcase {
            width: parent.width

            Column {
                spacing: 4
                CheckBox {
                    text: "Option 1"
                    enabled: disableSwitch_3.checked
                }
                CheckBox {
                    text: "Option 2"
                    enabled: disableSwitch_3.checked
                }
                CheckBox {
                    text: "Option 3"
                    enabled: disableSwitch_3.checked
                }
            }

            showcase: [
                Text {
                    text: "Enable Check Boxes"
                },
                Switch {
                    id: disableSwitch_3
                    checked: true
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("Switch")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("Use Switch controls to present users with exactly 2 mutually exclusive options.")
        }

        ControlShowcase {
            width: parent.width
            height: 100

            Row {
                width: parent.width
                spacing: 4
                Switch {
                    enabled: disableSwitch_2.checked
                }
                Switch {
                    enabled: disableSwitch_2.checked
                }
            }

            showcase: [
                Text {
                    text: "Enable Switch"
                },
                Switch {
                    id: disableSwitch_2
                    checked: true
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("Slider")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("Use a Slider when you want your users to be able to set defined, contiguous values or a range of discrete values.")
        }

        Frame {
            width: parent.width

            Row {
                width: parent.width
                spacing: 4
                Slider {
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 25
                    orientation: Qt.Vertical
                }

                Column {
                    Slider {
                        from: 0
                        to: 500
                        stepSize: 5
                        value: 250
                        width: 200
                    }
                    Slider {
                        from: 0
                        to: 300
                        stepSize: 20
                        width: 250
                        tickmarksEnabled: true
                    }
                }
            }
        }
    }
}
