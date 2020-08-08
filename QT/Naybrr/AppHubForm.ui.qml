import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    transformOrigin: Item.Center
    property alias element: element
    property alias swipeView: swipeView

    SwipeView {
        id: swipeView
        x: 14
        y: 65
        width: 368
        height: 378
    }

    TextField {
        id: txtSearch
        x: 14
        y: 19
        width: 368
        height: 40
        placeholderText: qsTr("Search")
    }

    TabBar {
        id: tabBar
        x: 19
        y: 462
        width: 358
        height: 0
    }
}
