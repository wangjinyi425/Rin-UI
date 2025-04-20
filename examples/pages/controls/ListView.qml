import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI
import "../../components"

ControlPage {
    id: page
    title: "ListView"

    Text {
        Layout.fillWidth: true
        typography: Typography.Body
        text: qsTr(
            "The ListView lets know you show a collection of items in a list that scrolls vertically. "
        )
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            typography: Typography.BodyStrong
                text: "Basic ListView with Simple DataTemplate"
        }
        Frame {
            width: parent.width
            Column {
                spacing: 4
                Text {
                    text: "This is a basic ListView that has the full source code below (coming soon). \n" +
                        "Other samples on this page display only the additional markup needed customize " +
                        "the ListView like this one."
                }

                ListView {
                    id: listView
                    width: 350
                    height: 400

                    model: [
                        qsTr("Aikiyo Fuuka"),  // 风香
                        qsTr("Hayase Yuuka"),  // 邮箱
                        qsTr("Hanaoka Yuzu"),  // 柚子
                        qsTr("Kuromi Serika"),  // 芹香
                        qsTr("Kurosaki Koyuki"),  // 小雪
                        qsTr("Kuda Izuna"),  // 泉奈
                        qsTr("Okusora Ayane"),  // 绫音
                        qsTr("Saiba Midori"),  // 绿
                        qsTr("Saiba Momoi"),  // 桃
                        qsTr("Shiromi Iori"),  // 伊织
                        qsTr("Shishidou Nonomi"),  // 野宫
                        qsTr("Sunaookami Shiroko"),  // 白子😋
                        qsTr("Tendou Aris"),  // aris
                        qsTr("Ushio Noa"),  // 诺亚
                        qsTr("Yutori Natsu")  // 夏
                    ]
                }
            }
        }
    }
}
