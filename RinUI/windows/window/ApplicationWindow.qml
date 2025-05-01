import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../windows"

FluentWindowBase {
    id: baseWindow
    frameless: false
    default property alias content: baseWindow.data
}