import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../windows"
import "../components"

Window {
    id: baseWindow
    visible: true
    width: 800
    height: 600
    minimumWidth: 400
    minimumHeight: 300
    flags: Qt.FramelessWindowHint | Qt.Window

    color: "transparent"


     // 最大化样式
    onVisibilityChanged: {
        if (baseWindow.visibility === Window.Maximized) {
            background.radius = 0
            background.border.width = 0
        } else {
            background.radius = Theme.currentTheme.appearance.windowRadius
            background.border.width = 1
        }
    }


    //改变鼠标形状
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: {
            const p = Qt.point(mouseX, mouseY)
            const b = Utils.windowDragArea
            if (p.x < b && p.y < b) return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y >= height - b) return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y < b) return Qt.SizeBDiagCursor
            if (p.x < b && p.y >= height - b) return Qt.SizeBDiagCursor
            if (p.x < b || p.x >= width - b) return Qt.SizeHorCursor
            if (p.y < b || p.y >= height - b) return Qt.SizeVerCursor
        }
        acceptedButtons: Qt.NoButton
    }


    // 主体 / 忠诚！
    Rectangle {
        id: background
        anchors.fill: parent
        color: Utils.backdropEnabled ? "transparent" : Theme.currentTheme.colors.backgroundColor
        border.color: Theme.currentTheme.colors.windowBorderColor
        layer.enabled: true  // 启用透明渲染
        border.width: 1
        radius: Theme.currentTheme.appearance.windowRadius
        clip: true

        TitleBar {
            id: titleBar
            window: baseWindow
            title: baseWindow.title
            height: Theme.currentTheme.appearance.windowTitleBarHeight
        }

        Shadow {}

        Behavior on color {
            ColorAnimation {
                duration: Utils.backdropEnabled ? 0 : 150
            }
        }
    }


    DragHandler {
        id: resizeHandler
        grabPermissions: TapHandler.TakeOverForbidden
        target: null
        onActiveChanged: if (active) {
            const p = resizeHandler.centroid.position
            const b = Utils.windowDragArea + 10
            let e = 0;
            if (p.x < b) { e |= Qt.LeftEdge }
            if (p.x >= width - b) { e |= Qt.RightEdge }
            if (p.y < b) { e |= Qt.TopEdge }
            if (p.y >= height - b) { e |= Qt.BottomEdge }
            baseWindow.startSystemResize(e);
        }
    }
}
