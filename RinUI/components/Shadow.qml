import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"

Repeater {
    id: shadowRepeater
    property string style: "cardRest"
    property int blurRadius: Theme.currentTheme.shadows[style].blur
    property int offsetY: Theme.currentTheme.shadows[style].offsetY
    property real intensity: 1.5          // 阴影强度系数
    property real spreadRatio: 1.1         // 阴影扩散系数
    readonly property color shadowColor: Theme.currentTheme.shadows[style].color

    model: Math.max(blurRadius, 8) // 保证最小8层渲染

    Rectangle {
        anchors {
            fill: parent
            margins: -index * spreadRatio  // 非线性扩散
            topMargin: -index * spreadRatio + (offsetY) // 动态偏移分配
        }

        color: "transparent"
        radius: controlRadius + (index * spreadRatio) // 优化半径增长曲线
        border.width: 1
        border.color: shadowColor

        // 非线性透明度衰减
        opacity: (0.03 * (blurRadius - index + 1)) * shadowRepeater.opacity

        z: -999
    }
}