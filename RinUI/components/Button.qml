import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

ButtonBase {
    id: root
    interactive: true  // 启用 MouseArea
    property string buttonType: "standard"  // primary, standard, transparent


    function updateStyle() {
        // 禁用状态
        console.log("updateStyle")
        if (!enabled) {
            if (buttonType === "primary") {
                root.opacity = 0.2169
                backgroundColor = Theme.currentTheme.colors.disabledColor
            } else if (buttonType === "transparent") {
                root.opacity = 0.3614
            } else {
                root.opacity = 0.4
                backgroundColor = Theme.currentTheme.colors.controlColor
            }
        } else {
            root.opacity = 1.0
            // Enabled
            if (buttonType === "primary") {
                backgroundColor = Theme.currentTheme.colors.primaryColor
                textColor = Theme.currentTheme.colors.textOnAccentColor
                borderColor = Theme.currentTheme.colors.controlBorderAccentColor
                borderTransparency = Theme.currentTheme.appearance.borderOnAccentFactor
            } else if (buttonType === "transparent") {
                backgroundColor = "transparent"
                textColor = Theme.currentTheme.colors.textColor
                borderColor = "transparent"
            } else {
                backgroundColor = Theme.currentTheme.colors.controlColor
                textColor = Theme.currentTheme.colors.textColor
                borderColor = Theme.currentTheme.colors.controlBorderColor
                borderTransparency = Theme.currentTheme.appearance.borderFactor
            }
        }
    }

    // 动画
    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
}