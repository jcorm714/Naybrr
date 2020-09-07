import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper
import Naybrr 1.0

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

    function make_pretty_decimal(x){
      let y = ((x * 100) + 0.5)/100
      y = y.toString()
      let deciIdx = y.indexOf(".")
      return  y.substr(0, deciIdx + 3)

    }

    ListView {
        id: listView
        anchors.fill: parent
        model: ListModel {
            id: listModel
        }
        Component.onCompleted:{
            RequestHelper.getItemList(function(data){
                for(let i =0; i < data.length; i++){
                    console.log(data[i]);
                    listModel.append(data[i])
                }

            })
        }

        delegate: ItemDelegate {
            x: 5
            width: parent.width
            height: 40
            onClicked: {
                RequestHelper.getItem(function(data){
                    let itemView = Qt.createComponent("DetailedItem.qml")

                    let propertyValues = {
                        "db_id": data["db_id"],
                        "imgPath": data["imPath"],
                        "itemName": data["name"],
                        "itemQuantity": "Quantity: " + data["quantity"],
                        "itemDesc": data["desc"],
                        "itemPrice": "$" + data["price"]
                    }
                    let obj = itemView.createObject(stackView, propertyValues)
                    //               obj.btnReturn.onClicked = function(){ stackView.pop()}
                    //               obj.btnPurchase.onClicked = function() {console.log("Purchased Item");}
                    stackView.push(obj)

                })

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

        NaybrrItem {
            id: itemRef
        }
    }
}
