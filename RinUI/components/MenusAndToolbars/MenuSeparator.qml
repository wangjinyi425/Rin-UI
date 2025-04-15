import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../themes"
import "../../components"


MenuSeparator {
    id: root

    contentItem: Rectangle {
        implicitHeight: 1
        color: Theme.currentTheme.colors.dividerBorderColor
    }
}