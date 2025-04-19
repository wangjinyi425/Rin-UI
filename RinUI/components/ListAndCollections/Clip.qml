import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI


Button {
    id: root
    background: Frame {
        anchors.fill: parent
        color: root.backgroundColor
        opacity: 1
    }
}