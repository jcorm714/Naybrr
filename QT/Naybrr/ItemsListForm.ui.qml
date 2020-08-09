import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    height: 400
    property alias listView: listView
    ListView {
        id: listView
        anchors.fill: parent
    }
}
