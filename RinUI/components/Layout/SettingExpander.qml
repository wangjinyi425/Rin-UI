import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../components"


// expander
Expander {
    id: root
    property alias content: rightContent.data
    // property alias showcase: showcaseContainer.data
    property string title: "Title"
    property alias icon: icon.icon
    property alias source: icon.source
    property alias iconSize: icon.size
    property string description: "A description of the setting"

    contentPadding: 0
    contentSpacing: 0

    header: RowLayout {
        Layout.margins: 13
        Layout.leftMargin: 0
        spacing: 16

        RowLayout {
            id: leftContent
            Layout.maximumWidth: parent.width * 0.6
            spacing: 16

            IconWidget {
                id: icon
                size: 20
            }
            Column {
                Layout.fillWidth: true
                spacing: 0
                Text {
                    width: parent.width
                    typography: Typography.Body
                    text: title
                    maximumLineCount: 2  // 限制最多两行
                    elide: Text.ElideRight  // 超过限制时用省略号
                }

                Text {
                    width: parent.width
                    typography: Typography.Caption
                    text: description
                    color: Theme.currentTheme.colors.textSecondaryColor
                    wrapMode: Text.Wrap  // 启用换行
                    maximumLineCount: 3
                    elide: Text.ElideRight
                }
            }
        }
        RowLayout {
            id: rightContent
            Layout.fillHeight: true
            Item { Layout.fillWidth: true }
            Layout.alignment: Qt.AlignRight
            spacing: 16
        }
    }
}