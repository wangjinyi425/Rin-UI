
import QtQuick 2.15
import "../themes"

QtObject {
    property string name: "dark"

    // Colors //
    property QtObject colors: QtObject {
        // Controls
        property color controlColor: Qt.rgba(255, 255, 255, 0.065)
        property color controlSecondaryColor: Qt.rgba(255, 255, 255, 0.1)
        property color controlTertiaryColor: Qt.rgba(255, 255, 255, 0.0419)
        property color controlQuaternaryColor: Qt.rgba(255, 255, 255, 0.0698)

        property color controlBorderColor: Qt.rgba(255, 255, 255, 0.09)
        property color controlBorderStrongColor: Qt.rgba(255, 255, 255, 0.6047)
        property color controlBorderAccentColor: Qt.rgba(255, 255, 255, 0.08)

        // Background
        property color backgroundColor: "#202020"
        property color backgroundAcrylicColor: "#2C2C2C"

        // Text
        property color textColor: "#ffffff"
        property color textAccentColor: Qt.color(Colors.primaryColor).lighter(1.2)
        property color textOnAccentColor: "#000000"
        property color textSelectedColor: "#000000"

        property color primaryColor: Qt.color(Colors.primaryColor).lighter(1.2)
        property color disabledColor: "#ffffff"
    }

    // Appearance //
    property QtObject appearance: QtObject {
        property int buttonRadius: 7
        property int borderWidth: 1
        property real borderFactor: 1.2
        property real borderOnAccentFactor: 1.08
    }

    // Shadows //
    property var shadows: {
        "dialog": {
            "color": Qt.rgba(0, 0, 0, 0.37),  // 模糊颜色
            "blur": 64  // 模糊半径
        },
        "tooltip": {
            "color": Qt.rgba(0, 0, 0, 0.26),
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
