import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../windows"
import "../components"

ApplicationWindow {
    id: baseWindow
    visible: true
    title: qsTr("Fluent Window Base")
    width: 800
    height: 600
    minimumWidth: 400
    minimumHeight: 300
    property int hwnd: 0

    flags: frameless ? Qt.FramelessWindowHint | Qt.Window | Qt.WindowMinimizeButtonHint | Qt.WindowMaximizeButtonHint | Qt.WindowCloseButtonHint :
        Qt.Window
    color: frameless ? "transparent" : Theme.currentTheme.colors.backgroundColor

    // 自定义属性
    property var icon: "../assets/img/default_app_icon.png"  // 图标
    property alias titleEnabled: titleBar.titleEnabled
    property int titleBarHeight: Theme.currentTheme.appearance.dialogTitleBarHeight
    property bool frameless: true  // 是否无边框


    // 直接添加子项
    property alias framelessMenuBar: menuBarArea.children  // 无边框模式时菜单栏
    default property alias content: contentArea.children
    property alias floatLayer: floatLayer

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

    FloatLayer {
        id: floatLayer
        anchors.topMargin: titleBarHeight
        z: 998
    }

    // 布局
    ColumnLayout {
        anchors.fill: parent
        // anchors.topMargin: Utils.windowDragArea
        anchors.bottomMargin: Utils.windowDragArea
        anchors.leftMargin: Utils.windowDragArea
        anchors.rightMargin: Utils.windowDragArea
        spacing: 0

        // 顶部边距
        Item {
            Layout.preferredHeight: frameless ? titleBar.height : 0
            Layout.fillWidth: true
        }

        // menubar
        Item {
            id: menuBarArea
            Layout.fillWidth: true
        }

        // 主体内容区域
        Item {
            id: contentArea
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    // 标题栏
    TitleBar {
        id: titleBar
        window: baseWindow
        icon: baseWindow.icon
        title: baseWindow.title
        Layout.fillWidth: true
        height: baseWindow.titleBarHeight
        visible: frameless
    }


    // 背景样式
    background: Rectangle {
        id: background
        anchors.fill: parent
        color: Utils.backdropEnabled ? "transparent" : Theme.currentTheme.colors.backgroundColor
        border.color: Theme.currentTheme.colors.windowBorderColor
        layer.enabled: true  // 启用透明渲染
        border.width: 1
        radius: Theme.currentTheme.appearance.windowRadius
        z: -1
        clip: true
        visible: frameless

        // Shadow {}

        Behavior on color {
            ColorAnimation {
                duration: Utils.backdropEnabled ? 0 : 150
            }
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: Utils.appearanceSpeed
        }
    }


    //改变鼠标形状
    MouseArea {
        anchors.fill: parent
        hoverEnabled: baseWindow.visibility !== Window.Maximized
        z: -1
        cursorShape: {
            if (!baseWindow.frameless) {
                return
            }
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

    DragHandler {
        id: resizeHandler
        grabPermissions: TapHandler.TakeOverForbidden
        target: null
        onActiveChanged: if (active && baseWindow.visibility !== Window.Maximized) {
            const p = resizeHandler.centroid.position
            const b = Utils.windowDragArea + 10
            let e = 0;
            if (p.x < b) e |= Qt.LeftEdge
            if (p.x >= width - b) e |= Qt.RightEdge
            if (p.y < b) e |= Qt.TopEdge
            if (p.y >= height - b) e |= Qt.BottomEdge
            baseWindow.startSystemResize(e)
        }
    }
}
