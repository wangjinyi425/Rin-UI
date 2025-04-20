import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../components"

ListView {
    id: root
    property string textRole: ""  // 文字role

    property bool keyboardNavigation: false

    // 自动检测模型类型
    readonly property string modelType: {
        if (!model) return "null";
        if (Array.isArray(model)) return "array";
        if (model instanceof ListModel) return "listmodel";
        if (typeof model === "object" && "count" in model) return "listmodel-like";
        return "unknown";
    }

    clip: true

    // 垂直滚动条 / Vertical ScrollBar //
    ScrollBar.vertical: ScrollBar {
        id: scrollBar
        policy: ScrollBar.AsNeeded
    }

    delegate: ItemDelegate {
        id: delegate
        width: listView.width
        height: text.implicitHeight + 20  // 自适应
        highlighted: ListView.isCurrentItem  // 当前项高亮
        focusPolicy: Qt.StrongFocus

        // accessibility
        FocusIndicator {
            control: parent
        }

        background: Rectangle {
            id: itemBg
            anchors.fill: parent
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 3
            radius: Theme.currentTheme.appearance.buttonRadius
            color: pressed
                ? Theme.currentTheme.colors.subtleTertiaryColor
                : (highlighted || hovered)
                    ? Theme.currentTheme.colors.subtleSecondaryColor
                    : Theme.currentTheme.colors.subtleColor

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 11
                anchors.rightMargin: 11
                anchors.topMargin: 6
                anchors.bottomMargin: 8
                Column {
                    Text {
                        id: text
                        verticalAlignment: Text.AlignVCenter
                        typography: Typography.Body
                        wrapMode: Text.Wrap
                        text: {
                            switch (root.modelType) {
                                case "array": return modelData;
                                case "listmodel":
                                case "listmodel-like":
                                    return model[root.textRole] || modelData || "";
                                default: return "";
                            }
                        }
                    }
                }
            }

            // 选择指示器
            Indicator {
                currentItemHeight: root.currentItem.height
                visible: highlighted
            }

            Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type:Easing.InOutQuart } }
        }

        onClicked: {
            root.currentIndex = index
        }
    }
}