import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects  // 图形库
import RinUI

FluentPage {
    // title: "test"
    horizontalPadding: 0

    contentHeader: Item {
        width: parent.width
        height: Math.max(window.height * 0.35, 200)

        Image {
            id: banner
            anchors.fill: parent
            source: "../assets/banner.png"
            fillMode: Image.PreserveAspectCrop
            verticalAlignment: Image.AlignTop

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: banner.width
                    height: banner.height

                    // 渐变效果
                    gradient: Gradient {
                        GradientStop { position: 0.7; color: "white" }  // 不透明
                        GradientStop { position: 1.0; color: "transparent" }  // 完全透明
                    }
                }
            }
        }

        Column {
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 56
                topMargin: 24
            }
            spacing: 8

            Text {
                color: "#fff"
                typography: Typography.BodyLarge
                text: qsTr("A Fluent Design-like UI library for Qt Quick")
            }

            Text {
                color: "#fff"
                typography: Typography.TitleLarge
                text: qsTr("RinUI Gallery")
            }
        }
    }
}
