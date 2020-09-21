import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper

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
    stack.initialItem: naybrrTab
    listView.delegate: ItemDelegate {
        x: 5
        width: 400
        height: 40

        onClicked: stack.push(items)
        Row {
            id: row1
            Text {
                text: username
                font.bold: true
            }

            spacing: 10
        }
    }
    listView.model: ListModel {
        id: listModel
    }

}
