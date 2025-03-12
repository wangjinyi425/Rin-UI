
import QtQuick 2.15
import "../themes"

QtObject {
    property string name: "light"

    // Colors //
    property QtObject colors: QtObject {
        // Controls
        property color controlColor: Qt.rgba(255, 255, 255, 0.7)
        property color controlSecondaryColor: Qt.rgba(0, 0, 0, 0.0241)
        property color controlTertiaryColor: Qt.rgba(0, 0, 0, 0.0578)
        property color controlQuaternaryColor: Qt.rgba(0, 0, 0, 0.0924)

        property color controlBorderColor: Qt.rgba(0, 0, 0, 0.06)
        property color controlBorderStrongColor: Qt.rgba(0, 0, 0, 0.6063)
        property color controlBorderAccentColor: Qt.rgba(255, 255, 255, 0.3)

        // Background
        property color backgroundColor: "#F0F4F9"
        property color backgroundAcrylicColor: "#FCFCFC"

        // Text
        property color textColor: "#1b1b1b"
        property color textAccentColor: Colors.primaryColor
        property color textOnAccentColor: "#ffffff"
        property color textSelectedColor: "#ffffff"

        property color primaryColor: Colors.primaryColor
        property color disabledColor: "#000000"
    }

    // Appearance //
    property QtObject appearance: QtObject {
        property int buttonRadius: 7
        property int borderWidth: 1
        property real borderFactor: 0.9
        property real borderOnAccentFactor: 1.08
    }

    // Shadows //
    property var shadows: {
        "dialog": {
            "color": Qt.rgba(0, 0, 0, 0.37),  // 模糊颜色
            "blur": 64  // 模糊半径
        },
        "tooltip": {
            "color": Qt.rgba(0, 0, 0, 0.14),
            "blur": 8
        },
        "cardRest": {
            "color": Qt.rgba(0, 0, 0, 0.04),
            "blur": 4
        },
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
