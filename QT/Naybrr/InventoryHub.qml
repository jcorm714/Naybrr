import QtQuick 2.4
import QtQuick.Controls 2.15
import Naybrr 1.0


Item {
    property alias btnReturn: btnReturn
    property alias listView: listView
    width: 400
    height: 400

    NaybrrItem{
        id: itemRef
    }


    StackView {
        id: stack
        anchors.fill: parent

        Button {
            id: btnReturn
            x: 150
            y: 22
            text: qsTr("Return")
        }

        ListView {
            id: listView
            x: 23
            y: 85
            width: 354
            height: 293

            model: ListModel {

                ListElement {
                    db_id: 0
                    name: "Salt"
                    desc: "Lorem Ipsum"
                    price: "$4.99"
                }
                ListElement {
                    db_id: 1
                    name: "Second"
                    desc: "Lorem Ipsum"
                    price: "$4.99"
                }
                ListElement {
                    db_id: 2
                    name: "Third"
                    desc: "Lorem Ipsum"
                    price: "$4.99"
                }
            }

            delegate: ItemDelegate {
                x: 5
                width: parent.width
                height: 40
                onClicked: {
                    function make_pretty_decimal(x){
                      let y = ((x * 100) + 0.5)/100
                      y = y.toString()
                      let deciIdx = y.indexOf(".")
                      return  y.substr(0, deciIdx + 3)

                    }
                    let i = itemRef.findItemInDB(db_id)
                    let itemView = Qt.createComponent("UpdateItem.qml")
                    console.log(i.name, i.quantity, i.desc, i.price)
                    let propertyValues = {
                        "imgPath": i.imagePath,
                        "itemName": i.name,
                        "itemQuantity": "Quantity: " + i.quantity,
                        "itemDesc": i.desc,
                        "itemPrice": "$" + make_pretty_decimal(i.price)
                    }
                    let obj = itemView.createObject(stackView, propertyValues)
                    //               obj.btnReturn.onClicked = function(){ stackView.pop()}
                    //               obj.btnPurchase.onClicked = function() {console.log("Purchased Item");}
                    stack.push(obj)
                }

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

    }
}
