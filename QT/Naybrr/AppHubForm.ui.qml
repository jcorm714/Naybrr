import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400

    transformOrigin: Item.Center
    property alias element: element
    property alias swipeView: swipeView
    property alias tabBar: tabBar
    property alias maSettings: maSettings
    property alias txtSearch: txtSearch

    SwipeView {
        id: swipeView
        x: 14
        y: 65
        width: 368
        height: 378
        currentIndex: tabBar.currentIndex

        ItemsList {}
        NaybrrTab {}
        CartItems {}
    }

    TextField {
        id: txtSearch
        x: 59
        y: 19
        width: 323
        height: 40
        placeholderText: qsTr("Search")
    }

    TabBar {
        id: tabBar
        anchors.bottom: parent.bottom
        x: 19
        y: 462
        width: 358
        height: 40
        position: TabBar.Footer
        contentWidth: 0
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Items")
        }
        TabButton {
            text: qsTr("Naybrrs")
        }
        TabButton {
            text: qsTr("Cart")
        }
    }

    Image {
        id: image
        x: 8
        y: 19
        width: 45
        height: 41
        source: "open-menu.svg"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: maSettings
            anchors.fill: parent
        }
    }
}



