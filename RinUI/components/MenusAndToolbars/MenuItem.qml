import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../themes"
import "../../components"


MenuItem {
    id: root
    implicitWidth: {
        const rowWidth = row.implicitWidth + row.x;
        const leftMargin = 16;
        const arrowWidth = arrow.visible ? arrow.width + 16 : 0;
        const rightMargin = 16;
        return leftMargin + rowWidth + arrowWidth + rightMargin;
    }
    implicitHeight: Math.max(implicitContentHeight + topPadding + bottomPadding,
                             34)

    property var parentMenu: undefined

    // accessibility
    FocusIndicator {
        control: parent
        anchors.margins: 5
        anchors.topMargin: 0
        anchors.bottomMargin: 0
    }

    arrow: IconWidget {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.margins: 16
        color: Theme.currentTheme.colors.textSecondaryColor
        visible: root.subMenu
        icon: "ic_fluent_chevron_right_20_regular"
        size: 12
    }

    indicator: IconWidget {
        id: indicator
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.margins: 18
        icon: "ic_fluent_checkmark_20_filled"
        size: 16
        visible: root.checked
    }

    // 内容 / Content //
    contentItem: Item {
        implicitWidth: row.implicitWidth
        Row {
            id: row
            spacing: 8
            anchors.verticalCenter: parent.verticalCenter
            // anchors.left: parent.left
            x: 16 + (checkable ? indicator.width + 8 : 0)
            IconWidget {
                id: iconWidget
                y: 1
                size: icon || source ? text.font.pixelSize * 1.25 : 0  // 图标大小 / Icon Size
                icon: root.icon.name
                source: root.icon.source
            }
            Text {
                id: text
                typography: Typography.Body
                text: root.text
                wrapMode: Text.NoWrap
            }
            Text {
                id: shortcutText
                typography: Typography.Caption
                text: root.action ? root.action.shortcut : ""
                wrapMode: Text.NoWrap
                color: Theme.currentTheme.colors.textSecondaryColor
                anchors.verticalCenter: parent.verticalCenter
                visible: text
            }
        }
    }

    // 背景 / Background //
    background: Rectangle {
        anchors.fill: parent
        anchors.margins: 5
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        radius: Theme.currentTheme.appearance.buttonRadius
        color: enabled ? pressed ? Theme.currentTheme.colors.subtleTertiaryColor
            : hovered
            ? Theme.currentTheme.colors.subtleSecondaryColor
            : "transparent" : "transparent"

        Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuart } }
    }
}