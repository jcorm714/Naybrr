import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    height: 400
    property alias listView: listView
    property alias stackView: stackView
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: listView
    }

    ListView {
        id: listView
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/

