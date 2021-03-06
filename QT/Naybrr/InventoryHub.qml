import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper
import Naybrr 1.0

Item {
    property alias btnReturn: btnReturn
    property alias listView: listView
    property int uId: -1
    width: 400
    height: 400

    function refreshList(){
        listModel.clear()
        let callback = function (data) {
            for (var i = 0; i < data.length; i++) {
                listModel.append(data[i])
            }
        }
        RequestHelper.getUserInventory(callback, uId)
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
                id: listModel
            }

            Component.onCompleted: refreshList()

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
                        let itemView = Qt.createComponent("UpdateItem.qml")

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
    }
}
