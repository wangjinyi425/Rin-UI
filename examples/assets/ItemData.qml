pragma Singleton
import QtQuick 2.15
import RinUI

QtObject {
    // filter
    function getRecentlyAddedItems() {
        return allControls
            .filter(item => item.added)
            // .sort((a, b) => (a.order ?? 0) - (b.order ?? 0));
    }
    function getRecentlyUpdatedItems() {
        return allControls
            .filter(item => item.updated)
            // .sort((a, b) => (a.order ?? 0) - (b.order ?? 0));
    }

    function getItemsByType(type) {
        return allControls
            .filter(item => item.type === type)
            // .sort((a, b) => (a.order ?? 0) - (b.order ?? 0));
    }

    property var recentlyAddedItems: getRecentlyAddedItems()
    property var recentlyUpdatedItems: getRecentlyUpdatedItems()


    // data / 控件数据 //

    property var allControls: [
        {
            icon: Qt.resolvedUrl("controls/Button.png"),
            title: qsTr("Button"),
            type: "basicInput",
            desc: qsTr("A Control that responds to user input and raise a Click event."),
            page: Qt.resolvedUrl("../pages/controls/Button.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/CheckBox.png"),
            title: qsTr("CheckBox"),
            type: "basicInput",
            desc: qsTr("A Control that user can be select or clear."),
            page: Qt.resolvedUrl("../pages/controls/CheckBox.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/ComboBox.png"),
            title: qsTr("ComboBox"),
            type: "basicInput",
            desc: qsTr("A drop-down list of items a user can select from."),
            page: Qt.resolvedUrl("../pages/controls/ComboBox.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/ContentDialog.png"),
            title: qsTr("Dialog"),
            type: "dialogs&flyouts",
            desc: qsTr("A dialog box that can be customized to contain any QML content."),
            page: Qt.resolvedUrl("../pages/controls/Dialog.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/Flyout.png"),
            title: qsTr("Flyout"),
            type: "dialogs&flyouts",
            desc: qsTr("Shows contextual information and enables user interaction."),
            page: Qt.resolvedUrl("../pages/controls/Flyout.qml"),
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/HyperlinkButton.png"),
            title: qsTr("Hyperlink"),
            type: "basicInput",
            desc: qsTr("A button that appears as a hyperlink text, and can navigate to a URL or handle a click event."),
            page: Qt.resolvedUrl("../pages/controls/Hyperlink.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/IconElement.png"),
            title: qsTr("IconWidget"),
            type: "styles",
            desc: qsTr("Represents icon controls that use different image types as its content."),
            page: Qt.resolvedUrl("../pages/controls/IconWidget.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/InfoBar.png"),
            title: qsTr("InfoBar"),
            type: "status&info",
            desc: qsTr("An inline message to display app-wide status change information."),
            page: Qt.resolvedUrl("../pages/controls/InfoBar.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/ListView.png"),
            title: qsTr("ListView"),
            type: "collections",
            desc: qsTr("A control that presents a collection of items in a vertical list."),
            page: Qt.resolvedUrl("../pages/controls/ListView.qml"),
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/MenuFlyout.png"),
            title: qsTr("Menu"),
            type: "menus&toolbars",
            desc: qsTr("Shows a contextual list of simple commands or options."),
            page: Qt.resolvedUrl("../pages/controls/Menu.qml"),
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/MenuBar.png"),
            title: qsTr("MenuBar"),
            type: "menus&toolbars",
            desc: qsTr("A classic menu, allowing the display of MenuBarItem containing Menu."),
            page: Qt.resolvedUrl("../pages/controls/MenuBar.qml"),
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/NavigationView.png"),
            title: qsTr("NavigationView"),
            type: "navigation",
            desc: qsTr("Common vertical layout for top-level areas of your app via a collapsible navigation menu."),
            page: Qt.resolvedUrl("../pages/controls/NavigationView.qml"),
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/ProgressBar.png"),
            title: qsTr("ProgressBar"),
            type: "status&info",
            desc: qsTr("Shows the apps progress on a task, or that the app is performing ongoing work that doesn't block user interaction."),
            page: Qt.resolvedUrl("../pages/controls/ProgressBar.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/RadioButton.png"),
            title: qsTr("RadioButton"),
            type: "basicInput",
            desc: qsTr("A control that allows a user to select a single option from a group of options."),
            page: Qt.resolvedUrl("../pages/controls/RadioButton.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/Slider.png"),
            title: qsTr("Slider"),
            type: "basicInput",
            desc: qsTr("A control that lets the user select from a range of values by moving a Thumb control along a track."),
            page: Qt.resolvedUrl("../pages/controls/Slider.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/NumberBox.png"),
            title: qsTr("SpinBox"),
            type: "text",
            desc: qsTr("A text control used for numeric input and evaluation of algebraic equations."),
            page: Qt.resolvedUrl("../pages/controls/SpinBox.qml"),
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/ToggleSwitch.png"),
            title: qsTr("Switch"),
            type: "basicInput",
            desc: qsTr("A switch that can toggled between 2 states."),
            page: Qt.resolvedUrl("../pages/controls/Switch.qml"),
        },
        // TODO: TableView
        // {
        //     icon: Qt.resolvedUrl("controls/VariableSizedWrapGrid.png"),
        //     title: qsTr("TableView"),
        //     type: "collections",
        //     desc: qsTr("The DataGrid control provides a flexible way " +
        //         "to display a collection of data in rows and " +
        //         "columns."),
        //     page: Qt.resolvedUrl("../pages/controls/TableView.qml"),
        //     added: true,
        // },
        {
            icon: Qt.resolvedUrl("controls/TextBox.png"),
            title: qsTr("TextField"),
            type: "text",
            desc: qsTr("A single-line or multi-line plain text field."),
            page: Qt.resolvedUrl("../pages/controls/TextField.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/TimePicker.png"),
            title: qsTr("TimePicker"),
            type: "date&time",
            desc: qsTr("A configurable control that lets a user pick a time value."),
            page: Qt.resolvedUrl("../pages/controls/TimePicker.qml"),
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/TitleBar.png"),
            title: qsTr("TitleBar"),
            type: "windowing",
            desc: qsTr("An example showing a custom UIElement used as the titlebar for the app's window."),
            page: Qt.resolvedUrl("../pages/controls/TitleBar.qml"),
        },
        {
            icon: Qt.resolvedUrl("controls/ToolTip.png"),
            title: qsTr("ToolTip"),
            type: "status&info",
            desc: qsTr("Display information for an element in a pop-up window."),
            page: Qt.resolvedUrl("../pages/controls/ToolTip.qml"),
        },
    ]
}