import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper
import Naybrr 1.0

Item {
    id: element
    width: 400
    height: 400
    property int accId: -1
    property alias listView: listView
    property alias listModel: listModel

    function refresh(){
        listModel.clear()
        let callback = function (data) {
            if (data.length) {
                listModel.clear()
                for (let i = 0; i < data.length; i++) {
                    listModel.append(data[i])
                }
            }
        }
        RequestHelper.getUserInventory(callback, accId)
    }

    Button {
        id: btnReturn
        x: 25
        y: 25
        text: "Return"
        onClicked: stackView.pop()
    }

    Button {
        id: btnRefresh
        x: 225
        y: 25
        text: "Refresh"
        onClicked: refresh()
    }
    Item {
        x: 14
        y: 100
        width: 368
        height: 378

        ListView {
            x: 25
            y: 100
            id: listView
            anchors.fill: parent
            Component.onCompleted: refresh()
            model: ListModel {
                id: listModel
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
                    anchors.fill: parent
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
