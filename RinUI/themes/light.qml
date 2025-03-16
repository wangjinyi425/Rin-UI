
import QtQuick 2.15
import "../themes"

QtObject {
    property string name: "light"

    // Colors //
    property QtObject colors: QtObject {
        // Controls
        property color controlColor: Qt.alpha("#ffffff", 0.7)
        property color controlSecondaryColor: Qt.alpha("#000000", 0.0241)
        property color controlTertiaryColor: Qt.alpha("#000000", 0.0578)
        property color controlQuaternaryColor: Qt.alpha("#000000", 0.0924)

        property color controlBorderColor: Qt.alpha("#000000", 0.06)
        property color controlBorderStrongColor: Qt.alpha("#000000", 0.6063)
        property color controlBorderAccentColor: Qt.alpha("#000000", 0.3)

        // Background
        property color backgroundColor: "#F0F4F9"
        property color windowBorderColor: Qt.alpha("#757575", 0.0924)
        property color backgroundAcrylicColor: "#F9F9F9"
        property color subtleColor: "transparent"
        property color subtleSecondaryColor: Qt.alpha("#000000", 0.0373)
        property color subtleTertiaryColor: Qt.alpha("#000000", 0.0241)
        property color captionCloseColor: systemCirticalColor
        property color captionCloseTextColor: "#ffffff"

        // Text
        property color textColor: "#1b1b1b"
        property color textSecondaryColor: Qt.alpha("#000000", 0.6063)
        property color textAccentColor: Utils.primaryColor
        property color textOnAccentColor: "#ffffff"
        property color textSelectedColor: "#ffffff"

        property color primaryColor: Utils.primaryColor
        property color disabledColor: "#000000"

        // System Colors
        property color systemAttentionColor: "#005fb7"
        property color systemSuccessColor: "#0f7b0f"
        property color systemCautionColor: "#9d5d00"
        property color systemCirticalColor: "#c42b1c"
        property color systemNeutralColor: "#8d8d8d"

        property color systemAttentionBackgroundColor: Qt.alpha("#f6f6f6", 0.1)
        property color systemSuccessBackgroundColor: "#dff6dd"
        property color systemCautionBackgroundColor: "#fff4ce"
        property color systemCirticalBackgroundColor: "#fde7e9"
        property color systemNeutralBackgroundColor: Qt.alpha("#000000", 0.0241)
    }

    // Appearance //
    property QtObject appearance: QtObject {
        property int buttonRadius: 7
        property int borderWidth: 1
        property real borderFactor: 0.9
        property real borderOnAccentFactor: 1.08

        property int dialogTitleBarHeight: 32
        property int windowTitleBarHeight: 48
        property int windowRadius: 7
        property int windowButtonWidth: 46
    }

    // Shadows //
    property var shadows: {
        "dialog": {
            "color": Qt.rgba(0, 0, 0, 0.37),  // 模糊颜色
            "blur": 64,  // 模糊度
            "offsetY": 32
        },
        "tooltip": {
            "color": Qt.alpha("#000000", 0.14),
            "blur": 8,
            "offsetY": 4
        },
        "cardRest": {
            "color": Qt.rgba(0, 0, 0, 0.04),
            "blur": 4,
            "offsetY": 2
        },
        "flyout": {
            "color": Qt.alpha("#000000", 0.14),
            "blur": 16,
            "offsetY": 8
        },
    }

    // Typography //
    property QtObject typography: QtObject {
        property string fontFamily: "Microsoft YaHei"
        property string fontIcon: "FluentSystemIcons-Regular.ttf"  // 字体图标路径 / font icon (put it in the "assets/fonts" folder)
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
