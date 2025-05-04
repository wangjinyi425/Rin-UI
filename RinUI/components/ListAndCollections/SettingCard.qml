import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI


// 自定义控件演示 / Custom control demonstration //
Frame {
    id: frame
    default property alias content: rightContent.data
    // property alias showcase: showcaseContainer.data
    property string title
    property alias icon: icon.icon
    property alias source: icon.source
    property alias iconSize: icon.size
    property string description

    leftPadding: 15
    rightPadding: 15
    topPadding: 13
    bottomPadding: 13
    // implicitHeight: 62

    RowLayout {
        anchors.fill: parent
        spacing: 16

        RowLayout {
            id: leftContent
            Layout.maximumWidth: parent.width * 0.6
            Layout.fillHeight: true
            spacing: 16

            IconWidget {
                id: icon
                size: 20
            }
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 0
                Text {
                    id: titleLabel
                    Layout.fillWidth: true
                    typography: Typography.Body
                    text: title
                    maximumLineCount: 2  // 限制最多两行
                    elide: Text.ElideRight  // 超过限制时用省略号
                    visible: title.length > 0
                }

                Text {
                    id: discriptionLabel
                    Layout.fillWidth: true
                    typography: Typography.Caption
                    text: description
                    color: Theme.currentTheme.colors.textSecondaryColor
                    wrapMode: Text.Wrap  // 启用换行
                    maximumLineCount: 3
                    elide: Text.ElideRight
                    visible: description.length > 0
                }
            }
            visible: !(!titleLabel.visible && !discriptionLabel.visible)
        }
        RowLayout {
            id: rightContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignRight
            spacing: 16
        }
    }
}