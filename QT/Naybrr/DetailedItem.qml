import QtQuick 2.4
import QtQuick.Controls 2.15
import Naybrr 1.0
Item {
    width: 400
    height: 400

    property string imgPath: ""
    property string itemName: ""
    property string itemQuantity: "Quantity: 0"
    property string itemDesc: ""
    property string itemPrice: "$4.99"
    property var funcPurchase: null
    property var funcReturn: null
    property int db_id: -1

    NaybrrItem{
        id:itemDB
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent
    }

    Image {
        id: imgItem
        x: 0
        y: 14
        width: 193
        height: 161
        source: imgPath
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: lblItemName
        x: 199
        y: 14
        width: 177
        height: 48
        text: qsTr(itemName)
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 36
    }

    Button {
        id: btnPurchase
        x: 199
        y: 100
        width: 177
        height: 75
        text: qsTr("Purchase")
        onClicked: function(){
                  // let item = itemDB.findItemInDB(db_id)
                    console.log("item")
        }
    }

    Text {
        id: lblDesc
        x: 20
        y: 199
        width: 356
        height: 130
        text: qsTr(itemDesc)
        wrapMode: Text.WordWrap
        font.pixelSize: 24
    }

    Button {
        id: btnReturn
        x: 20
        y: 335
        width: 356
        height: 40
        text: qsTr("Return")
        onClicked: stackView.pop()
    }
    Text {
        id: lblQuantity
        x: 277
        y: 68
        width: 99
        height: 26
        text: qsTr(itemQuantity)
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
    }

    Text {
        id: lblPrice
        x: 199
        y: 71
        width: 67
        height: 21
        text: qsTr(itemPrice)
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
    }
}



