import QtQuick 2.4
import QtQuick.Controls 2.15
import Naybrr 1.0
import QtQuick.Dialogs 1.2
import "RequestHelper.js" as RequestHelper


Item {
    property alias btnReturn: btnReturn
    property int uId: -1
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
    }

    Button {
        id: btnSubmit
        x: 253
        y: 324
        text: "Submit"
        checkable: true
        onClicked: {
            let callback = function(data){
                console.log(data)
                btnReturn.clicked()
            }

            let valid = validate()
            if(valid){
                let item = create_item()
                RequestHelper.insertItem(callback, item)
            }
        }
    }

    TextField {
        id: txtName
        x: 24
        y: 34
        width: 157
        height: 40
        placeholderText: qsTr("Name")
    }

    TextField {
        id: txtPrice
        x: 224
        y: 34
        width: 157
        height: 40
        placeholderText: qsTr("Price")
    }

    TextArea {
        id: txtDesc
        x: 24
        y: 97
        width: 357
        height: 92
        wrapMode: Text.WordWrap
        verticalAlignment: Text.AlignTop
        placeholderText: qsTr("Description")
    }


    TextField {
        id: txtImgpath
        x: 24
        y: 220
        placeholderText: qStr("Image Link")
        height: 40
        width: 157

    }

    FileDialog{
        id: fileDialog
        title: "Please choose a file"
        onAccepted: {
            console.log("file: " , fileDialog.fileUrls)
            lblFilePath.text = fileDialog.fileUrl

        }
        onRejected:
        {
            console.log("quit")
        }
    }

    Text {
        id: lblFilePath
        x: 157
        y: 233
        width: 208
        height: 15
        font.pixelSize: 12
    }

    Text{
        id: lblErrors
        x: 25
        y: 380
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
        return item;
    }
}
