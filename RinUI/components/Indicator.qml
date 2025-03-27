import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"


Rectangle {
    id: indicator

    property int currentItemHeight: 38

    implicitWidth: 3
    implicitHeight: currentItemHeight - 23
    radius: 10
    color: Theme.currentTheme.colors.primaryColor

    y: (parent.height - height) / 2
}