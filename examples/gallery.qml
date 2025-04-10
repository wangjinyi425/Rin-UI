import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

FluentWindow {
    id: window
    visible: true
    title: qsTr("Gallery")
    width: 1200
    height: 700

    // 加载页面
    Component.onCompleted: {
        navItems.append({
            title: "Home",
            page: Qt.resolvedUrl("pages/Home.qml"),
            icon: "ic_fluent_home_20_regular"
        });
        navItems.append({
            title: "Basic Input",
            page: Qt.resolvedUrl("pages/BasicInput.qml"),
            icon: "ic_fluent_checkbox_checked_20_regular"
        });
        navItems.append({
            title: "Dialogs & Flyouts",
            page: Qt.resolvedUrl("pages/DialogsAndFlyouts.qml"),
            icon: "ic_fluent_chat_20_regular"
        });
        navItems.append({
            title: "Status & Info",
            page: Qt.resolvedUrl("pages/StatusAndInfo.qml"),
            icon: "ic_fluent_chat_multiple_minus_20_regular"
        });
        navItems.append({
            title: "Text & Typography",
            page: Qt.resolvedUrl("pages/Text.qml"),
            icon: "ic_fluent_text_font_20_regular"
        });
        navItems.append({
            title: "Error Interface Test",
            page: Qt.resolvedUrl("unexist/page"),
            icon: null
        });
        navItems.append({
            title: "Settings",
            page: Qt.resolvedUrl("pages/Settings.qml"),
            icon: "ic_fluent_settings_20_regular"
        });
    }


    // FluentPage {
    //     id: contentArea
    //     title: qsTr("Gallery")
    //     spacing: 10
    //
    //     TextLabel {
    //         labelType: "body"
    //         color:Theme.currentTheme.colors.primaryColor
    //         text: "测试测试"
    //     }
    //
    //     TextLabel {
    //         labelType: "bodyLarge"
    //         text: "Button 按钮"
    //     }
    //
    //     IconWidget {
    //         size: 48
    //         icon: "\ueb95"
    //     }
    //
    //     Flow {
    //         Layout.fillWidth: true
    //         spacing: 10
    //
    //         Button {
    //             id: btn_1
    //             buttonType: "primary"
    //             text: "切换主题"
    //             onClicked: {
    //                 if (Theme.currentTheme.name === "Light") {
    //                     Theme.setTheme("Dark")
    //                 } else {
    //                     Theme.setTheme("Light")
    //                 }
    //             }
    //         }
    //         Button {
    //             enabled: true
    //             buttonType: "standard"
    //             text: "Push Button"
    //         }
    //         Button {
    //             enabled: true
    //             buttonType: "standard"
    //             icon: "\uf103"
    //             text: "hello!"
    //         }
    //         ToolButton {
    //             enabled: true
    //             icon: "\uf103"
    //         }
    //         Button {
    //             id: btn_2
    //             enabled: true
    //             buttonType: "standard"
    //             text: "Hover to see Tooltip"
    //
    //             Tooltip {
    //                 parent: btn_2
    //                 delay: 500
    //                 visible: btn_2.hovered
    //                 text: "This is a tooltip"
    //             }
    //
    //         }
    //         Button {
    //             text: "Disabled"
    //             enabled: false
    //         }
    //         Button {
    //             enabled: true
    //             compact: true
    //             text: "Push Button"
    //         }
    //         Button {
    //             enabled: true
    //             buttonType: "transparent"
    //             compact: true
    //             text: "Transparent Button"
    //         }
    //         HyperlinkButton {
    //             text: "HyperLink Button"
    //             openUrl: "https://baidu.com"
    //         }
    //     }
    //
    //     TextLabel {
    //         labelType: "bodyLarge"
    //         text: "Switch 按钮"
    //     }
    //
    //     Row {
    //         spacing: 10
    //
    //         ToggleSwitch {
    //             checked: true
    //             onCheckedChanged: {
    //                 if (checked) {
    //                     btn_1.enabled = true
    //                     switch_1.enabled = true
    //                     console.log("Switch is on")
    //                 } else {
    //                     btn_1.enabled = false
    //                     switch_1.enabled = false
    //                     console.log("Switch is off")
    //                 }
    //             }
    //         }
    //         ToggleSwitch {
    //             id: switch_1
    //             checked: true
    //         }
    //     }
    //
    //     TextLabel {
    //         labelType: "bodyLarge"
    //         text: "ComboBox 下拉"
    //     }
    //
    //     Row {
    //         spacing: 10
    //
    //         ComboBox {
    //             property var data: ["mica", "acrylic", "tabbed", "none"]
    //             model: ["Mica", "Acrylic", "Tabbed", "None"]
    //             currentIndex: data.indexOf(Theme.getBackdropEffect())
    //             onCurrentIndexChanged: {
    //                 Theme.setBackdropEffect(data[currentIndex])
    //             }
    //         }
    //         // ComboBox {
    //         //     editable: true
    //         //     model: ["Editable", "Item 1", "Item 2", "Item 3"]
    //         // }
    //         ComboBox {
    //             headerText: "With header"
    //             model: ["Item 1", "Item 2", "Item 3", "Item 3", "Item 3", "Item 3", "Item 3"]
    //         }
    //     }
    //     TextLabel {
    //         labelType: "bodyLarge"
    //         text: "Slider 滑动条"
    //     }
    //     Frame {
    //         Layout.fillWidth: true
    //         ColumnLayout {
    //             Slider {
    //                 from: 0
    //                 to: 100
    //                 stepSize: 1
    //             }
    //             Slider {
    //                 orientation: Qt.Vertical  // vertical
    //                 from: 0
    //                 to: 100
    //                 stepSize: 10  // step size
    //                 snapMode: Slider.SnapAlways  // snap to tick
    //                 tickmarksEnabled: true // show tickmarks on qt6 ww
    //             }
    //         }
    //     }
    //     TextLabel {
    //         labelType: "bodyLarge"
    //         text: "TextField 输入框"
    //     }
    //     TextField {
    //         text: "Hello World"
    //     }
    // }
}