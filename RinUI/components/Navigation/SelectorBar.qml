import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../components"
import "../../themes"


RowLayout {
    id: root
    property var model: []
    property int currentIndex: -1
    property bool enabled: true
    // 自动检测模型类型
    readonly property string modelType: {
        if (!model) return "null";
        if (Array.isArray(model) && typeof model[0] === "object") return "array-with-role";
        if (Array.isArray(model)) return "array";
        if (model instanceof ListModel) return "listmodel";
        if (typeof model === "object" && "count" in model) return "listmodel-like";
        return "unknown";
    }

    implicitHeight: 40
    spacing: 0

    Repeater {
        model: root.model
        delegate: Button {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 40
            flat: true

            background: Item {}

            text: {
                switch (root.modelType) {
                    case "array": return modelData;
                    case "array-with-role": return modelData["text"] || modelData || "";
                    case "listmodel":
                    case "listmodel-like":
                        return model["text"] || modelData || "";
                    default: return "";
                }
            }
            icon.name: root.modelType === "array-with-role" ? modelData["icon"] : ""
            icon.source: root.modelType === "array-with-role" ? modelData["source"] : ""

            onClicked: root.currentIndex = index
            enabled: root.enabled

            Indicator {
                orientation: Qt.Horizontal
                visible: index === root.currentIndex
            }
        }
    }
}