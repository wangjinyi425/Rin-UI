import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

FluentPage {
    title: "Settings"
    spacing: 3

    Text {
        typography: Typography.BodyStrong
        text: "Appearances"
    }

    SettingCard {
        Layout.fillWidth: true
        title: qsTr("App Theme")
        description: qsTr("Select which app theme to display")
        icon: "ic_fluent_paint_brush_20_regular"

        content: ComboBox {
            property var data: ["Light", "Dark", "Auto"]
            model: ["Light", "Dark", "Use system setting"]
            currentIndex: data.indexOf(Theme.getTheme())
            onCurrentIndexChanged: {
                Theme.setTheme(data[currentIndex])
            }
        }
        // content: Row {
        //     Button {
        //         id: btn_1
        //         text: "切换主题"
        //         onClicked: {
        //             Theme.setTheme("Dark")
        //         }
        //     }
        //     Button {
        //         id: btn_2
        //         text: "切换主题2"
        //         onClicked: {
        //             Theme.setTheme("Light")
        //         }
        //     }
        // }
    }

    SettingCard {
        Layout.fillWidth: true
        title: qsTr("Window Backdrop Effect")
        description: qsTr("Adjust the appearance of the window background (Only available on Windows platform, some styles may only support on Windows 11)")
        icon: "ic_fluent_square_hint_sparkles_20_regular"

        content: ComboBox {
            property var data: ["mica", "acrylic", "tabbed", "none"]
            model: ["Mica", "Acrylic", "Tabbed", "None"]
            currentIndex: data.indexOf(Theme.getBackdropEffect())
            onCurrentIndexChanged: {
                Theme.setBackdropEffect(data[currentIndex])
            }
        }
    }
}
