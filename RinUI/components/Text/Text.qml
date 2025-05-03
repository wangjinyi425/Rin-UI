import QtQuick
import QtQuick.Controls
import "../../themes"
import "../../utils"

Text {
    id: label
    property int typography: Typography.Body

    color: targetColor
    property color targetColor: Theme.currentTheme.colors.textColor  // 目标颜色，用于切换动画
    wrapMode: Text.WordWrap

    // 主题切换动画  TODO: 会坠机
    // Behavior on color {
    //     ColorAnimation {
    //         duration: Utils.appearanceSpeed
    //         easing.type: Easing.OutQuart
    //     }
    // }

    font.pixelSize: {
        switch (typography) {
            case Typography.Display: return Theme.currentTheme.typography.displaySize;
            case Typography.TitleLarge: return Theme.currentTheme.typography.titleLargeSize;
            case Typography.Title: return Theme.currentTheme.typography.titleSize;
            case Typography.Subtitle: return Theme.currentTheme.typography.subtitleSize;
            case Typography.Body: return Theme.currentTheme.typography.bodySize;
            case Typography.BodyStrong: return Theme.currentTheme.typography.bodyStrongSize;
            case Typography.BodyLarge: return Theme.currentTheme.typography.bodyLargeSize;
            case Typography.Caption: return Theme.currentTheme.typography.captionSize;
            default: return Theme.currentTheme.typography.bodySize;
        }
    }

    font.family: Utils.fontFamily

    font.bold: typography === Typography.Display ||
               typography === Typography.TitleLarge ||
               typography === Typography.Title ||
               typography === Typography.Subtitle ||
               typography === Typography.BodyLarge ||
               typography === Typography.BodyStrong
}
