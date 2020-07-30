import QtQuick 2.4
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15

Item {
    id: element
    width: 400
    transformOrigin: Item.Center
    property alias element: element

    TextField {
        id: txtSearch
        x: 14
        y: 19
        width: 368
        height: 40
        placeholderText: qsTr("Search")
    }

    SwipeView {
        id: swipeView
        x: 14
        y: 65
        width: 368
        height: 407
    }
}
