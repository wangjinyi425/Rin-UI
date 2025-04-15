import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI
import "../components"

FluentPage {
    id: page
    title: "Menus & Toolbars"


    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.Subtitle
            text: qsTr("Menu")
        }
        Text {
            width: parent.width
            typography: Typography.Body
            text: qsTr(
                "A Menu displays lightweight UI that is light dismissed by clicking or tapping off of it." +
                 "Use it to let the user choose from a contextual list of simple commands or options."
            )
        }

        Text {
            typography: Typography.BodyStrong
                text: "A Menu with MenuItems and MenuSeparator."
        }
        Frame {
            width: parent.width
            Button {
                text: qsTr("Show Menu")
                onClicked: menu.open()
                Menu {
                    id: menu
                    MenuItem {
                        // icon.name: "ic_fluent_clipboard_brush_20_regular"
                        text: "New..."
                    }
                    MenuItem {
                        text: "Open..."
                    }
                    MenuItem {
                        text: "Save"
                    }
                    MenuSeparator { }
                    Menu {
                        title: "More ..."
                        MenuItem {
                            text: "Exit"
                        }
                    }
                }
            }
        }
        Text {
            typography: Typography.BodyStrong
                text: "A Menu with checkable MenuItems."
        }
        Frame {
            width: parent.width
            Button {
                text: qsTr("Filter")
                onClicked: menu_checkable.open()
                Menu {
                    id: menu_checkable
                    MenuItem {
                        // icon.name: "ic_fluent_clipboard_brush_20_regular"
                        text: "By Nameddddddddddddddd"
                        checkable: true
                        checked: true
                    }
                    MenuItem {
                        text: "By Date"
                        checkable: true
                    }
                    MenuItem {
                        text: "By Type"
                        checkable: true
                    }
                }
            }
        }
    }
}
