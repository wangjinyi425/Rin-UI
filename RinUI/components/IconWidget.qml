import QtQuick 2.15
import "../themes"

Item {
    property string icon: "\uf103"
    property alias color: textLabel.color
    property string fontSource: Qt.resolvedUrl("../assets/fonts/" + Theme.currentTheme.typography.fontIcon)
    property int size: 12

    // 匹配尺寸
    implicitWidth: textLabel.implicitWidth
    implicitHeight: textLabel.implicitHeight

    // 主题切换动画 / Color Animation
    Behavior on color {
        ColorAnimation {
            duration: 250
            easing.type: Easing.OutQuart
        }
    }

    FontLoader {
        id: iconFont
        source: fontSource
    }

    Component.onCompleted: console.log("Font Source:", iconFont.name, "Status:", iconFont.status)

    TextLabel {
        id: textLabel
        text: icon
        font.family: iconFont.name
        font.pixelSize: size
    }
}
