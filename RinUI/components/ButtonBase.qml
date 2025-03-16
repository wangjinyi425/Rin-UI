import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

Base {
    id: buttonBase
    property int borderWidth: Theme.currentTheme.appearance.borderWidth
    property alias text: buttonText.text  // 文本内容

    // Size //
    implicitWidth : buttonText.width + 96
    implicitHeight: buttonText.height + 12

    // Border //
    // 背景 / Background
    Rectangle {
        id: border
        anchors.fill: parent
        radius: controlRadius
        layer.enabled: true  // 单独渲染
        gradient: Gradient {
            GradientStop { position: 0.91; color: backgroundColor.lighter(borderTransparency) }
            GradientStop { position: 1; color: backgroundColor.darker(1.4) }
        }

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.margins: Theme.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
            color: backgroundColor
            radius: controlRadius
        }
    }

    // Text //
    TextLabel {
        id: buttonText
        labelType: "body"
        anchors.centerIn: parent
        color: root.textColor
    }
}