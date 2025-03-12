import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"

// thanks for deepseek's idea(?)

// 阴影层（通过多个半透明矩形叠加）
Repeater {
    property string style: "cardRest"  // 样式
    property int blurRadius: Theme.currentTheme.shadows[style].blur  // 模糊半径


        model: 12  // 迭代数
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            opacity: 0.01 * (5-index+1)
            anchors.margins: -index
            radius: controlRadius+index
            border.width: index
            y: index * 2
            border.color: Theme.currentTheme.shadows[style].color
        }
    }