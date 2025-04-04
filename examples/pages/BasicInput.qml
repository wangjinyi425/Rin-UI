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
                ToggleSwitch {
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
                    icon.name: Qt.resolvedUrl("../assets/banner.png")
                    enabled: disableSwitch.checked

                    Tooltip {
                        text: "icon.name: Qt.resolvedUrl(\"../assets/banner.png\")"
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
            text: qsTr("TextField")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("Use a TextField to let a user enter simple text input in your app.")
        }

        Frame {
            width: parent.width

            Row {
                width: parent.width
                spacing: 4
                TextField {
                    placeholderText: "A simple TextField."
                }
                TextField {
                    placeholderText: "A simple TextField."
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("ToggleSwitch")
        }
        Text {
            width: parent.width
            typography: Typography.Body
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
