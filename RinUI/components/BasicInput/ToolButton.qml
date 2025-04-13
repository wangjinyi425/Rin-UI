import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../components"

Button {
    id: toolBtn
    flat: true
    property alias size: iconWidget.size

    contentItem: IconWidget {
        id: iconWidget
        width: parent.width
        height: parent.height
        size: 14
        icon: toolBtn.icon.name ? toolBtn.icon.name : toolBtn.text
        color: highlighted ? flat ? Theme.currentTheme.colors.textAccentColor :
            Theme.currentTheme.colors.textOnAccentColor : Theme.currentTheme.colors.textColor
    }
}