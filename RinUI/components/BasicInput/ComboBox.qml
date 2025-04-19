import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../components"


ComboBox {
    id: root

    // 属性 / Properties
    property real controlRadius: Theme.currentTheme.appearance.buttonRadius
    property alias maxHeight: menu.maxHeight
    property string headerText: ""

    implicitWidth: contentItem.implicitWidth + 77
    implicitHeight: contentItem.implicitHeight + 12

    // accessibility
    FocusIndicator {
        Indicator {
            id: focusIndicator
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.verticalCenter: parent.verticalCenter
        }
        anchors.margins: -1
        control: parent
    }


    // 背景 / Background //
    background: Rectangle {
        id: background
        anchors.fill: parent
        color: Theme.currentTheme.colors.controlColor
        radius: Theme.currentTheme.appearance.buttonRadius

        border.width: Theme.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
        border.color: Theme.currentTheme.colors.controlBorderColor

        // 裁切
        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: background.width
                height: background.height
                radius: background.radius
            }
        }

        // 底部border
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: Theme.currentTheme.appearance.borderWidth

            color: Theme.currentTheme.colors.controlBottomBorderColor
        }

        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
        opacity: flat && !hovered ? 0 : 1
    }

    // 指示器 / Indicator //
    indicator: IconWidget {
        anchors.right: parent.right
        anchors.rightMargin: 11  // 右边距
        anchors.verticalCenter: parent.verticalCenter
        icon: "ic_fluent_chevron_down_20_regular"
        size: 16
        color: Theme.currentTheme.colors.textSecondaryColor
    }

    // Text //
    contentItem: Text {
        id: text
        typography: Typography.Body
        anchors.left: parent.left
        anchors.leftMargin: 11  // 左边距为 11
        verticalAlignment: Text.AlignVCenter
        height: parent.height
        text: root.displayText
    }

    // 弹出菜单 / Menu //
    popup: ContextMenu {
        id: menu
        width: root.width
        model: root.model
        currentIndex: root.currentIndex

        function handleItemSelected(index) {
            root.currentIndex = index
            return true
        }
        onItemSelected: handleItemSelected(index)
    }

    // 动画
    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
    Behavior on implicitWidth { NumberAnimation { duration: 100; easing.type: Easing.InOutQuart } }


    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {  // 禁用时禁止改变属性
                target: root;
                opacity: 0.4
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: root;
                opacity: 0.7
            }
            PropertyChanges {
                target: background;
                color: Theme.currentTheme.colors.controlTertiaryColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                opacity: 1
                color: Theme.currentTheme.colors.controlSecondaryColor
            }
        }
    ]
}