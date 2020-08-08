import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 400
    ListView {
        id: listView
        anchors.fill: parent
        model: ListModel {
            ListElement {
                name: "test"
                desc: "Lorem Ipsum"
                price: "$5.99"
            }
            ListElement {
                name: "test"
                desc: "Lorem Ipsum"
                price: "$5.99"
            }
            ListElement {
                name: "test"
                desc: "Lorem Ipsum"
                price: "$5.99"
            }
            ListElement {
                name: "test"
                desc: "Lorem Ipsum"
                price: "$5.99"
            }
        }
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1

                Text {
                    text: name
                    anchors.LeftAnchor: parent.Left
                    font.bold: true
                }
                Text {
                    text: desc
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Text {
                    text: price
                    anchors.right: parent.Right
                    font.bold: true
                }
                spacing: 10
            }
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:160;anchors_width:110;anchors_x:145;anchors_y:108}
}
##^##*/

