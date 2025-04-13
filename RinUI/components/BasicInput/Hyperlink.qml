import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"
import "../../components"


Button {
    id: root
    property string openUrl: root.openUrl
    flat: true
    highlighted: true
    // underline: !root.hovered

    onClicked: {
        Qt.openUrlExternally(openUrl)
    }
}