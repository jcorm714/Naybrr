import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 400
    property alias stack: stack
    property alias listView: listView
    StackView {
        id: stack
        anchors.fill: parent
    }

    ListView {
        id: listView
        contentWidth: 0
        anchors.fill: parent
    }
}
