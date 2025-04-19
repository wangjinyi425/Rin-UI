import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

FluentPage {
    id: fluentPage

    header: Item {
        id: container
        height: headerRow.height + 44

        ColumnLayout {
            id: headerRow
            width: Math.min(fluentPage.width - fluentPage.horizontalPadding * 2, fluentPage.wrapperWidth)  // 限制最大宽度
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 12
            anchors.bottom: parent.bottom

            Text {
                // anchors.left: parent.left
                // anchors.bottom: parent.bottom
                height: parent.height
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                typography: Typography.Title
                text: fluentPage.title
                visible: fluentPage.title !== ""  // 标题
            }

            // 拓展区域 //
            RowLayout {
                Button {
                    icon.name: "ic_fluent_document_20_regular"
                    text: qsTr("Documentation")
                }
                Button {
                    icon.name: "ic_fluent_code_20_regular"
                    text: qsTr("Source")
                }

                Item {
                    Layout.fillWidth: true
                }

                spacing: 4
                ToolButton {
                    icon.name: "ic_fluent_person_feedback_20_regular"
                }
                ToolButton {
                    icon.name: "ic_fluent_dark_theme_20_regular"
                }
            }
        }
    }
}
