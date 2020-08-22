import QtQuick 2.4
import QtQuick.Controls 2.15

NaybrrTabForm{
    id: naybrrTab
    Component {
        id: items

            ItemsListNaybrrTab{



            }



    }
    stack.initialItem: naybrrTab

    listView.delegate: ItemDelegate {
        x: 5
        width: 400
        height: 40

        onClicked: stack.push(items);
        Row {
            id: row1
            Text {
                text: user
                font.bold: true
            }

            Text {
                text: name
                font.bold: true
            }



            spacing: 10
        }
    }
    listView.model: ListModel {
        ListElement {
            user: "User1"
            name: "Item1"
        }

        ListElement {
            user: "User1"
            name: "Item1"
        }

        ListElement {
            user: "User1"
            name: "Item1"
        }

        ListElement {
            user: "User1"
            name: "Item1"
        }
    }
}
