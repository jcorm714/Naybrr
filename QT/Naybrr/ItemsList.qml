import QtQuick 2.4
import QtQuick.Controls 2.15
ItemsListForm {

    listView.model: ListModel {
        ListElement {
            name: "Salt"
            desc: "Lorem Ipsum"
            price: "$4.99"
        }
        ListElement {
            name: "Salt"
            desc: "Lorem Ipsum"
            price: "$4.99"
        }
        ListElement {
            name: "Salt"
            desc: "Lorem Ipsum"
            price: "$4.99"
        }
    }
    listView.delegate: ItemDelegate {
        x: 5
        width: parent.width
        height: 40
        onClicked: console.log(name, desc, price)
        Row {
            id: row1


            Text {
                text: name

                font.bold: true

            }
            Text {
                text: desc

                font.bold: true
            }
            Text {
                text: price

                font.bold: true
            }
            spacing: 10



        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

