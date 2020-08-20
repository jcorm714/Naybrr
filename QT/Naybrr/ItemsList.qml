import QtQuick 2.4
import QtQuick.Controls 2.15
import Naybrr 1.0
import Items 1.0

ItemsListForm {
    NaybrrItem {
        id: itemRef
    }
    stackView.initialItem: itemsList

    ItemsModel {
        id: itemModel
    }

    ListView {
        id: itemsList
        model: itemModel
        delegate: ItemDelegate {
            x: 5
            width: parent.width
            height: 40
            onClicked: {
                let i = itemRef.findItemInDB(model.db_id)
                let itemView = Qt.createComponent("DetailedItem.qml")
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
                stackView.push(obj)
            }

            Row {
                id: row1

                Text {
                    text: model.name

                    font.bold: true
                }
                Text {
                    text: model.description

                    font.bold: true
                }
                Text {
                    text: model.price

                    font.bold: true
                }
                spacing: 10
            }
        }
    }

    function make_pretty_decimal(x) {
        let y = ((x * 100) + 0.5) / 100
        y = y.toString()
        let deciIdx = y.indexOf(".")
        return y.substr(0, deciIdx + 3)
    }
}
