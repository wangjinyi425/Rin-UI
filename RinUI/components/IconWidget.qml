import QtQuick 2.15
import "../components"
import "../themes"
import "../assets/fonts/FluentSystemIcons_Index.js" as Icons


Item {
    property string icon: ""  // 可以是字体图标（如 "\uf103"）或图片路径（如 "icons/image.png"）
    property alias color: text.color
    property string fontSource: Qt.resolvedUrl("../assets/fonts/" + Theme.currentTheme.typography.fontIcon)
    property int size: 12

    // 计算是否是字体图标
    property bool isFontIcon: icon.length === 1  // 判断是否为单字符（字体图标通常是单个字符）

    // 匹配尺寸
    implicitWidth: size
    implicitHeight: size

    // 主题切换动画
    Behavior on color {
        ColorAnimation {
            duration: 250
            easing.type: Easing.OutQuart
        }
    }

    visible: icon !== ""

    FontLoader {
        id: iconFont
        source: fontSource
    }

    Component.onCompleted: console.log("Font Source:", iconFont.name, "Status:", iconFont.status)

    Text {
        id: text
        anchors.centerIn: parent
        // text: isFontIcon ? icon : ""  // 仅当 `icon` 是单字符时显示
        text: isFontIcon ? icon : String.fromCharCode(Icons.FluentIcons[icon])  // 显示 FluentSystemIcons 字体图标
        font.family: iconFont.name
        font.pixelSize: size
    }

    Image {
        id: iconImage
        anchors.centerIn: parent
        source: isFontIcon ? "" : icon  // 仅当 `icon` 不是字体图标时加载图片
        width: size
        height: size
        fillMode: Image.PreserveAspectFit  // 适配图片大小
        visible: !isFontIcon  // 仅当 `icon` 是图片路径时可见
    }
}
