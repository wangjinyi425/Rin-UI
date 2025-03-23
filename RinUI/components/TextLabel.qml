import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"

Text {
    property string labelType: ""  // display, titleLarge, title, subtitle, body, bodyLarge, caption
    id: label

    color: Theme.currentTheme.colors.textColor

    // 主题切换动画 / Color Animation
    Behavior on color {
        ColorAnimation {
            duration: Utils.appearanceSpeed
            easing.type: Easing.OutQuart
        }
    }

    // 动态绑定
    font.pixelSize: {
        switch (labelType) {
            case "display": return Theme.currentTheme.typography.displaySize;
            case "titleLarge": return Theme.currentTheme.typography.titleLargeSize;
            case "title": return Theme.currentTheme.typography.titleSize;
            case "subtitle": return Theme.currentTheme.typography.subtitleSize;
            case "body": return Theme.currentTheme.typography.bodySize;
            case "bodyLarge": return Theme.currentTheme.typography.bodyLargeSize;
            case "caption": return Theme.currentTheme.typography.captionSize;
            default: return Theme.currentTheme.typography.bodySize;
        }
    }

    font.bold: labelType === "display" || labelType === "titleLarge" || labelType === "title" || labelType === "bodyLarge"
}