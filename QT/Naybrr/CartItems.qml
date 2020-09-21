import QtQuick 2.4
import QtQuick.Controls 2.15
import Naybrr 1.0
import "RequestHelper.js" as RequestHelper
Item {
    width: 400
    height: 400

    function refeshList(){
        listModel.clear()
        let items = Cart.getItemIdsInCart()
        let callback = function(data){
            if(data !== null){
                listModel.append(data)
            }
        }

        for(let i = 0; i < items.length; i++){
            console.log(items[i])
            RequestHelper.findItem(callback, items[i])
        }
    }
    function make_pretty_decimal(x){
      let y = ((x * 100) + 0.5)/100
      y = y.toString()
      let deciIdx = y.indexOf(".")
      return  y.substr(0, deciIdx + 3)

    }

    Button {
        id: btnPurchase
        x: 23
        y: 37
        text: "Purchase"
    }

    Button {
        id: btnRefresh
        x: 123
        y: 37
        text: "Refresh"
        onClicked: refeshList();
    }


    ListView {
        id: listView
        x: 23
        y: 102
        width: 353
        height: 243
        model: ListModel {
            id: listModel

        }

        Component.onCompleted: {
            refeshList();
        }

        delegate: Item {
            x: 5
            width: 80
            height: 60
            Row {
                id: row1
                spacing: 10
                Text {
                    text: itemname
                    font.bold: true
                    anchors.left: parent.Left
                    anchors.baseline: parent.baseline
                }
                Text{
                    text: price
                    font.bold: true
                    anchors.verticalCenter: parent.Center
                    anchors.baseline:  parent.baseline

                }
                Button{
                    id:btnDelete
                    text: "Remove"
                    onClicked: {

                        Cart.removeItemFromCart(itemid);
                        refeshList();
                    }
                    anchors.right: parent.Right
                    anchors.baseline: parent.baseline

                }
            }
        }
    }


}
