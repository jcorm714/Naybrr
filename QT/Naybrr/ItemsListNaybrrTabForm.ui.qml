import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    height: 400
    property alias listView: listView
    property alias stackView: stackView
    property alias btnPleaseJustWork: btnPleaseJustWork

    StackView {
        id: stackView
        anchors.topMargin: 60
        anchors.fill: parent
        initialItem: itemsList
    }
    Item {
        id: itemsList
        Button {
            id: btnPleaseJustWork
            x: 16
            y: 14
            width: 363
            height: 40
            text: qsTr("Return")
            enabled: true
            visible: true
            wheelEnabled: true
        }
        ListView {
            id: listView
            anchors.fill: parent
        }
    }
}
