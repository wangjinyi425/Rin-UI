import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Window 2.3
import "../themes"
import "../components"


Base {
    id: root
    interactive: true  // 是否可以交互
    property int mode: 0  //0:max 1:min 2:close
    property alias icon: icon.icon

    //关闭 最大化 最小化按钮
    function toggleControl(mode) {
        if (mode === 0) {
            if (window.visibility === Window.Maximized) {
                window.showNormal();
            } else {
                window.showMaximized();
            }
        } else if (mode===1) {
            window.showMinimized();
        } else if (mode===2) {
            window.close();
        }
    }

    width: 48
    height: parent.height


    // 背景 / Background
    Rectangle {
        id: background
        anchors.fill: parent
        color: mode === 2 ? Theme.currentTheme.colors.captionCloseColor : Theme.currentTheme.colors.subtleSecondaryColor
        opacity: 0

        Behavior on opacity { NumberAnimation { duration: 100; easing.type: Easing.InOutQuad } }
    }


    // 按钮图标
    IconWidget {
        id: icon
        icon: mode === 0 ? "\ue1aa" : mode === 1 ? "\uebd0" : mode === 2 ? "\uf369" : "○"
        size: 16
        anchors.centerIn: parent
    }

    // 鼠标区域 / MouseArea
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: enabled
        hoverEnabled: true
        onClicked: {
            toggleControl(mode)
        }
    }

    states: [
        State {
        name: "disabledCtrl"
            when: !enabled
            PropertyChanges {  // 禁用时禁止改变属性
                target: icon;
                opacity: 0.3614
            }
            PropertyChanges {  // 禁用时禁止改变属性
                target: root;
            }
        },
        State {
            name: "pressedCtrl"
            when: mouseArea.pressed
            PropertyChanges {
                target: background;
                opacity: 0.8
            }
            PropertyChanges {
                target: icon;
                opacity: 0.6063
                color: root.mode === 2 ? Theme.currentTheme.colors.captionCloseTextColor : textColor
            }
        },
        State {
            name: "hoveredCtrl"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: background;
                opacity: 1
            }
            PropertyChanges {
                target: icon;
                opacity: 0.6063
                color: root.mode === 2 ? Theme.currentTheme.colors.captionCloseTextColor : textColor
            }
        }
    ]
}