import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"


Rectangle {
    id: indicator
    width: 3
    height: 16
    radius: 10
    color: Theme.currentTheme.colors.primaryColor

    y: (parent.height - height) / 2
}