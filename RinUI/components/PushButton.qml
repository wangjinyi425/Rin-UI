import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

ButtonBase {
    id: root
    interactive: true  // 启用 MouseArea
    property string buttonType: "standard"  // primary, standard

    // 主题切换
    Connections {
        target: Theme
        onCurrentThemeChanged: updateStyle()
    }

    Component.onCompleted: updateStyle()

    function updateStyle() {
        if (buttonType === "primary") {
            backgroundColor = Theme.currentTheme.colors.primaryColor
            textColor = Theme.currentTheme.colors.textOnAccentColor
            borderColor = Theme.currentTheme.colors.controlBorderAccentColor
            borderTransparency = Theme.currentTheme.appearance.borderOnAccentFactor
        } else {
            backgroundColor = Theme.currentTheme.colors.controlColor
            textColor = Theme.currentTheme.colors.textColor
            borderColor = Theme.currentTheme.colors.controlBorderColor
            borderTransparency = Theme.currentTheme.appearance.borderFactor
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()  // 点击信号
    }

    // 状态变化
    states: [
        State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges {
                target: root;
                opacity: 0.7
            }
        },
        State {
            name: "hovered"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: root;
                opacity: 0.9
            }
        }
    ]

    // 动画
    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
}