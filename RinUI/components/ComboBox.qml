import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../themes"
import "../components"


ComboBox {
    id: root

    // 属性 / Properties
    property real borderFactor: Theme.currentTheme.appearance.borderFactor
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
        id: border
        anchors.fill: parent
        radius: controlRadius
        layer.enabled: true  // 单独渲染
        gradient: Gradient {
            GradientStop { position: 0.91; color: Theme.currentTheme.colors.controlColor.lighter(borderFactor) }
            GradientStop { position: 1; color: Theme.currentTheme.colors.controlColor.darker(1.4) }
        }

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.margins: Theme.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
            color: Theme.currentTheme.colors.controlColor
            radius: controlRadius

            Behavior on color { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
        }
    }

    // 指示器 / Indicator //
    indicator: IconWidget {
        anchors.right: parent.right
        anchors.rightMargin: 11  // 右边距
        anchors.verticalCenter: parent.verticalCenter
        icon: "\uf2a2"
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

        onItemSelected: handleItemSelected(index)
        function handleItemSelected(index) {
            root.currentIndex = index
        }
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
                opacity: 0.65
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: root;
                opacity: 0.875
            }
        }
    ]
}