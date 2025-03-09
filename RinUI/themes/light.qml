
import QtQuick 2.15
import "../themes"

QtObject {
    property string name: "light"

    // Colors //
    property QtObject colors: QtObject {
        // Controls
        property color controlColor: Qt.rgba(255, 255, 255, 0.7)
        property color controlBorderColor: Qt.rgba(0, 0, 0, 0.06)
        property color controlBorderAccentColor: Qt.rgba(255, 255, 255, 0.3)

        // Background
        property color backgroundColor: "#F0F4F9"

        // Text
        property color textColor: "#1b1b1b"
        property color textAccentColor: Colors.primaryColor
        property color textOnAccentColor: "#ffffff"
        property color textSelectedColor: "#ffffff"

        property color primaryColor: Colors.primaryColor
    }

    // Appearance //
    property QtObject appearance: QtObject {
        property int buttonRadius: 7
        property int borderWidth: 2
    }

    // Typography //
    property QtObject typography: QtObject {
        property string fontFamily: "Microsoft YaHei"
        // Font Sizes
        property int displaySize: 68
        property int titleLargeSize: 40
        property int titleSize: 28
        property int subtitleSize: 20
        property int bodyLargeSize: 18
        property int bodySize: 14
        property int captionSize: 12
    }
}
