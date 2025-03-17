pragma Singleton
import QtQuick 2.15

QtObject {
    property color primaryColor: "#605ed2" // 默认主题色
    property int windowDragArea: 10 // 窗口可拖动范围 (px)

    property bool backdropEnabled: false // 是否启用背景特效
}
