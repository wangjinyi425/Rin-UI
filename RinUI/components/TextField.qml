import QtQuick 2.15
import QtQuick.Controls.Basic 2.15

TextField {
    id: root

    property real borderFactor: Theme.currentTheme.appearance.borderFactor
    selectByMouse: true

    // 背景 / Background //


    // 字体 / Font //
    font.pixelSize: Theme.currentTheme.typography.bodySize

    // 状态变化
    // states: [
    //     State {
    //     name: "disabled"
    //         when: !enabled
    //         PropertyChanges {  // 禁用时禁止改变属性
    //             target: root;
    //             opacity: 0.4
    //         }
    //     },
    //     State {
    //         name: "pressed"
    //         when: pressed
    //         PropertyChanges {
    //             target: root;
    //             opacity: 0.65
    //         }
    //     },
    //     State {
    //         name: "hovered"
    //         when: hovered
    //         PropertyChanges {
    //             target: root;
    //             opacity: 0.875
    //         }
    //     }
    // ]
}