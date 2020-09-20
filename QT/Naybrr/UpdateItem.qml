import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper
import Naybrr 1.0

Item {
    property alias btnReturn: btnReturn
    property alias btnSubmit: btnSubmit
    property alias txtName: txtName
    property alias txtDesc: txtDesc
    property alias txtPrice: txtPrice

    property string imgPath: ""
    property string itemName: ""
    property string itemQuantity: "Quantity: 0"
    property string itemDesc: ""
    property string itemPrice: "$4.99"
    property int db_id: -1

    width: 400
    height: 400

    Pane {
        id: pane
        x: 25
        y: 89
        width: 356
        height: 110
    }

    Button {
        id: btnReturn
        x: 24
        y: 324
        text: qsTr("Return")
        onClicked: stackView.pop()
    }

    Button {
        id: btnSubmit
        x: 253
        y: 324
        text: "Submit"
        checkable: true
        onClicked: function(){
            let valid = validate()
            if(valid){
                let callback = function(data){
                    if(data["success"])
                    {
                        stackView.pop()
                    }
                }
                let item = create_item();
                RequestHelper.updateItem(callback, item)
            }
        }
    }

    Button {
        id: btnDelete
        x: 113
        y: 324
        text: "Delete"
        checkable: true
        onClicked: {
            let callback = function(){
                stackView.pop()
            }

            RequestHelper.deleteItem(callback, db_id);
        }
    }

    TextField {
        id: txtName
        x: 24
        y: 34
        width: 157
        height: 40
        placeholderText: qsTr("Name")
        text: itemName
    }

    TextField {
        id: txtPrice
        x: 224
        y: 34
        width: 157
        height: 40
        text: itemPrice
        placeholderText: qsTr("Price")
    }

    TextArea {
        id: txtDesc
        x: 24
        y: 97
        width: 357
        height: 92
        text: itemDesc
        wrapMode: Text.WordWrap
        verticalAlignment: Text.AlignTop
        placeholderText: qsTr("Text Area")
    }


    Text{
        id: lblErrors
        x: 25
        y: 380
    }

    TextField {
        id: txtImgpath
        x: 24
        y: 220
        placeholderText: qsTr("Image Link")
        height: 40
        width: 157
        text:  imgPath

    }

    function  validate(){
        let errors = ""
        if(!txtName.length) errors += "Name is required ";
        if(!txtDesc.length) errors += "Description is required";
        if(!txtPrice.length) errors += "Price is required"

        if(errors.length){
            lblErrors.text = errors
            return false
        }
        return true;
    }

    function create_item(){
        let item = Qt.createComponent(NaybrrItem)
        item.name = txtName.text
        item.accId = activeUserId
        item.desc = txtDesc.text
        item.price = txtPrice.text
        item.quantity = 1
        item.imgPath = txtImgpath.text
        item.dbId = db_id
        return item;
    }
}
