import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components"

Base {
    id: buttonBase
    property int borderWidth: Theme.currentTheme.appearance.borderWidth
    property alias text: buttonText.text  // 文本内容

    // Size //
    width: buttonText.width + 96
    height: buttonText.height + 14

    // Border //
    Rectangle {
        id: border
        radius: Theme.currentTheme.appearance.buttonRadius  // 圆角半径
        visible: true

        Rectangle {
            id: background
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