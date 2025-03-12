import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"


Base {
    id: root
    property bool checked: false  // Switch State
    property bool enabled: true  // Switch Enabled
    property int paddingHr: 3  // Horizontal Padding

    property color handleColor: Theme.currentTheme.colors.controlBorderStrongColor

    // 监听点击
    onCheckedChanged: updateStyle()

    function updateStyle() {
        if (checked) {
            // checked style
            backgroundColor = Theme.currentTheme.colors.primaryColor
            textColor = Theme.currentTheme.colors.textOnAccentColor
            borderColor = Theme.currentTheme.colors.primaryColor
            handleColor = Theme.currentTheme.colors.textOnAccentColor

        } else {
            backgroundColor = Theme.currentTheme.colors.controlSecondaryColor
            textColor = Theme.currentTheme.colors.textColor
            borderColor = Theme.currentTheme.colors.controlBorderStrongColor
            handleColor = Theme.currentTheme.colors.controlBorderStrongColor
        }
    }

    width: 40
    height: 20

    // 背景 / Background
    Rectangle {
        id: background
        anchors.fill: parent
        width: root.width
        height: root.height
        radius: height / 2  // 逆天了
        color: backgroundColor

        // 边框 / Border
        border.color: borderColor // 我是Rinlit，v我50，请我吃kfc
        border.width: Theme.currentTheme.appearance.borderWidth

        // 小圆点 / Handle()
        Rectangle {
            id: handle
            width: 12
            height: 12
            anchors.verticalCenter: parent.verticalCenter
            radius: height / 2
            color: handleColor

            // 坐标 / pos
            x: root.checked ? parent.width - width - paddingHr : paddingHr
            Behavior on x { NumberAnimation { duration: 250; easing.type: Easing.OutQuart } }
            Behavior on color { ColorAnimation { duration: 250; easing.type: Easing.OutQuart } }
        }
    }

    // TextLabel {
    //     id: switchText
    //     labelType: "body"
    //     anchors.centerIn: parent
    //     color: root.textColor
    // }

    // 打交互 Bushi / MouseArea
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        preventStealing: true  // 修复被父控件拦截事件从而无法拖动

        property real pressX: 0  // 记录按下时的 X 坐标
        onPressed: (mouse) => {
            pressX = mouse.x
        }

        // 点击更改
        onClicked: {
            root.checked = !root.checked
            clicked()
        }

        // 拖动判断结果
        onReleased: {
            root.checked = handle.x + handle.width / 2 > parent.width / 2  // 满足则为true
            clicked()
        }


        // Handle跟随鼠标 / drag
        onPositionChanged: (mouse) => {
            if (pressed) {
                let offset = mouse.x - pressX
                let newX = root.checked ? parent.width - handle.width - paddingHr + offset  // X
                                        : paddingHr + offset
                if (root.checked) {
                    newX = Math.max(0, Math.min(parent.width - handle.width - paddingHr, newX))
                } else {
                    newX = Math.max(paddingHr, Math.min(parent.width - handle.width, newX))
                }
                handle.x = newX
            }
        }
    }

    // 状态变化
    states: [
        State {
            name: "pressedSwitch"
            when: mouseArea.pressed
            PropertyChanges {
                target: handle;
                root.paddingHr: 2
                width: 17
                height: 14
            }
            PropertyChanges {
                target: background
                opacity: 0.8
            }
        },
        State {
            name: "hoveredSwitch"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: handle;
                root.paddingHr: 2
                width: 14
                height: 14
            }
            PropertyChanges {
                target: background
                opacity: 0.9
            }
        }
    ]

    // 动画
    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
}