
import QtQuick 2.15
import "../themes"

QtObject {
    property string name: "Dark"

    // Colors //
    property QtObject colors: QtObject {
        // Controls
        property color controlColor: Qt.alpha("#ffffff", 0.065)
        property color controlSecondaryColor: Qt.alpha("#ffffff", 0.1)
        property color controlTertiaryColor: Qt.alpha("#ffffff", 0.0419)
        property color controlQuaternaryColor: Qt.alpha("#ffffff", 0.0698)
        property color controlStrongColor: Qt.alpha("#ffffff", 0.5442)

        property color controlBorderColor: Qt.alpha("#ffffff", 0.09)
        property color controlBorderStrongColor: Qt.alpha("#ffffff", 0.6047)
        property color controlBorderAccentColor: Qt.alpha("#ffffff", 0.08)

        property color controlSolidColor: "#454545"

        // Card
        property color cardColor: Qt.alpha("#ffffff", 0.0512)
        property color cardSecondaryColor: Qt.alpha("#ffffff", 0.0326)
        property color cardTertiaryColor: Qt.alpha("#ffffff", 0.0698)
        property color cardBorderColor: Qt.alpha("#000000", 0.1)

        // Background
        property color backgroundColor: "#202020"
        property color windowBorderColor: Qt.alpha("#757575", 0.0698)
        property color backgroundAcrylicColor: "#2c2c2c"
        property color subtleColor: "transparent"
        property color subtleSecondaryColor: Qt.alpha("#ffffff", 0.0605)
        property color subtleTertiaryColor: Qt.alpha("#ffffff", 0.0419)
        property color captionCloseColor: systemCirticalColor
        property color captionCloseTextColor: "#ffffff"

        // Layer
        property color layerColor: Qt.alpha("#3A3A3A", 0.3)

        // Text
        property color textColor: "#ffffff"
        property color textSecondaryColor: Qt.alpha("#ffffff", 0.6047)
        property color textAccentColor: primaryColor
        property color textOnAccentColor: "#000000"
        property color textSelectedColor: "#000000"

        property color primaryColor: Qt.color(Utils.primaryColor).lighter(1.6).darker(1.2)
        property color disabledColor: "#ffffff"

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
        property real borderFactor: 1.2
        property real borderOnAccentFactor: 1.08
        property int cardRadius: 3

        property int dialogTitleBarHeight: 32
        property int windowTitleBarHeight: 48
        property int windowRadius: 7
        property int windowButtonWidth: 46

        property int scrollBarMinWidth: 2
        property int scrollBarWidth: 6
        property int scrollBarPadding: 3

        property int sliderHandleSize: 20
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
        property string fontIconDict: "FluentSystemIcons-Regular.json"
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