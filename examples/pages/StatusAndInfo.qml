import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI
import "../components"

FluentPage {
    title: "Status & Info"

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("ProgressBar")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr("The ProgressBar has two different visual representations:\n" +
                "Indeterminate - shows that a task is ongoing, but doesn't block user interaction.\n" +
                "Determinate - shows how much progress has been made on a known amount of work.")
        }

        ControlShowcase {
            width: parent.width

            Column {
                padding: 36
                spacing: 4

                Text {
                    text: qsTr("Determinate")
                }
                ProgressBar {
                    from: 0
                    to: 100
                    value: progressSlider.value
                    state: stateComboBox.model.get(stateComboBox.currentIndex).state
                }

                Text {
                    text: qsTr("Indeterminate")
                }
                ProgressBar {
                    indeterminate: true
                    state: stateComboBox.model.get(stateComboBox.currentIndex).state
                }
            }

            showcase: [
                Text {
                    text: "Progress"
                },
                Slider {
                    id: progressSlider
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                },
                Text {
                    text: "State"
                },
                ComboBox {
                    id: stateComboBox
                    model: ListModel {
                        ListElement { text: "Running"; state: ProgressBar.States.Running }
                        ListElement { text: "Paused"; state: ProgressBar.States.Paused }
                        ListElement { text: "Error"; state: ProgressBar.States.Error }
                    }
                    textRole: "text"
                    currentIndex: 0
                }
            ]
        }
    }

    // Tooltip //
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
