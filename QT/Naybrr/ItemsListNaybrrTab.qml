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
    property alias listModel: listModel
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
    Item{
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
                    function createPage(comp, props){
                        if(comp.status === Component.Ready){
                            let obj = comp.createObject(stackView,props)
                            stackView.push(obj);
                        } else if (comp.status === Component.Error){
                            console.log("Error has occurred")
                            console.log(comp.errorString())
                        }
                    }

                    let callback = function (data) {
                        let itemView = Qt.createComponent("DetailedItem.qml")

                        let propertyValues = {
                            "db_id": data["itemid"],
                            "imgPath": data["imagepath"],
                            "itemName": data["itemname"],
                            "itemQuantity": "Quantity: " + data["quantity"],
                            "itemDesc": data["description"],
                            "itemPrice": data["price"]
                        }
                        if(itemView.status === Component.Ready){
                            createPage(itemView, propertyValues)
                        } else {
                            itemView.statusChanged.connect(createPage(itemView, propertyValues))
                        }


                    }

                    RequestHelper.findItem(callback, itemid)
                }

                Row {
                    id: row1

                    Text {
                        text: itemname

                        font.bold: true
                    }
                    Text {
                        text: description

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



        NaybrrItem {
            id: itemRef
        }
    }
}
