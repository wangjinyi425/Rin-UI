import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../components"
import "../../windows"


RowLayout {
    // 外观 / Appearance //
    property bool appLayerEnabled: true  // 应用层背景
    property alias navExpandWidth: navigationBar.expandWidth  // 导航栏宽度
    property alias navMinimumExpandWidth: navigationBar.minimumExpandWidth  // 导航栏保持展开时窗口的最小宽度

    property alias navigationItems: navigationBar.navigationItems  // 导航栏item
    property string defaultPage: ""  // 默认索引项
    property var lastPages: []  // 上个页面索引
    property int pushEnterFromY: height
    property var window: parent  // 窗口对象

    id: navigationView
    anchors.fill: parent

    Connections {
        target: window
        function onWidthChanged() {
            navigationBar.collapsed = navigationBar.isNotOverMinimumWidth()  // 判断窗口是否小于最小宽度
        }
    }

    NavigationBar {
        id: navigationBar
        windowTitle: window.title
        windowIcon: window.icon
        windowWidth: window.width
        stackView: stackView
        z: 999
        Layout.fillHeight: true
    }

    // 主体内容区域
    Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
        // clip: true

        Rectangle {
            id: appLayer
            width: parent.width + Utils.windowDragArea + radius
            height: parent.height + Utils.windowDragArea + radius
            color: Theme.currentTheme.colors.layerColor
            border.color: Theme.currentTheme.colors.cardBorderColor
            border.width: 1
            opacity: window.appLayerEnabled
            radius: Theme.currentTheme.appearance.windowRadius
        }


        StackView {
            id: stackView
            anchors.fill: parent
            anchors.leftMargin: 1
            anchors.topMargin: 1


            // 切换动画 / Page Transition //
            pushEnter : Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: Utils.animationSpeed
                    easing.type: Easing.InOutQuad
                }

                PropertyAnimation {
                    property: "y"
                    from: pushEnterFromY
                    to: 0
                    duration: Utils.animationSpeedMiddle
                    easing.type: Easing.OutQuint
                }
            }

            pushExit : Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: Utils.animationSpeed
                    easing.type: Easing.InOutQuad
                }
            }

            popExit : Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: Utils.animationSpeed
                    easing.type: Easing.InOutQuad
                }

                PropertyAnimation {
                    property: "y"
                    from: 0
                    to: pushEnterFromY
                    duration: Utils.animationSpeedMiddle
                    easing.type: Easing.InOutQuint
                }
            }

            popEnter : Transition {
                SequentialAnimation {
                    PauseAnimation {  // 延时 200ms
                        duration: Utils.animationSpeed
                    }
                    PropertyAnimation {
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: Utils.appearanceSpeed
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            initialItem: Item {}

        }

        // 导航切换逻辑
        // Connections {
        //     target: navigationBar
        //     function onCurrentIndexChanged() {
        //         let index = navigationBar.currentIndex
        //         let page = navigationItems[index].page
        //         console.log("Pushing Page:", page, "Index:", index)
        //         if (stackView.depth === 0 || stackView.currentItem.objectName !== page) {
        //             checkPage(page)
        //         }
        //     }
        // }


        Component.onCompleted: {
            if (navigationItems.length > 0) {
                if (defaultPage !== "") {
                    safePush(defaultPage, false)
                } else {
                    safePush(navigationItems[0].page, false)  // 推送默认页面
                }  // 推送页面
            }
        }
    }

    function safePop() {
        console.log("Popping Page; Depth:", stackView.depth)
        if (navigationBar.lastPages.length > 1) {
            navigationBar.currentPage = navigationBar.lastPages.pop()  // Retrieve and remove the last page
            navigationBar.lastPages = navigationBar.lastPages  // refresh
            stackView.pop()
        } else {
            console.log("Can't pop: only root page left")
        }
    }

    function safePush(page, reload) {
        // 无效检测
        if (!(typeof page === "object" || typeof page === "string" || page instanceof Component)) {
            console.error("Invalid page:", page)
            return
        }

        // 重复检测
        if (navigationBar.currentPage === page && !reload) {
            console.log("Page already loaded:", page)
            return
        }

        navigationBar.lastPages.push(navigationBar.currentPage)  // 记录当前页面
        navigationBar.lastPages = navigationBar.lastPages  // refresh
        navigationBar.currentPage = page.toString()

        if (page instanceof Component) {
            // let obj = page.createObject(stackView)
            stackView.push(page)

        } else if (typeof page === "object" || typeof page === "string" ) {
            let component = Qt.createComponent(page)  // 页面转控件

            if (component.status === Component.Ready) {
                console.log("Depth:", stackView.depth)
                stackView.push(component)

            } else if (component.status === Component.Error) {
                console.error("Failed to load:", page, component.errorString())
                stackView.push("ErrorPage.qml", {
                    errorMessage: component.errorString(),  // 传参
                    page: page,
                })
            }
        }
    }

    function findPageByKey(key) {
        const item = menuItems.find(i => i.key === key);
        return item ? item.page : null;
    }
}
