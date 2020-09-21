import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper

Item {
    id: element
    width: 400

    transformOrigin: Item.Center
    property int uId: -1
    property string activeUserZip: getZip()
    property alias element: element
    property alias swipeView: swipeView
    property alias tabBar: tabBar
    property alias maSettings: maSettings
    property alias txtSearch: txtSearch




    function getZip() {
        let callback = function(data){
            console.log("Zipcode found: ", data["zip"])
            activeUserZip = data["zip"]
        }

        RequestHelper.getZipcodeForUserId(callback, uId)
    }

    SwipeView {
        id: swipeView
        x: 14
        y: 65
        width: 368
        height: 378
        currentIndex: tabBar.currentIndex

        ItemsList {
            id: itemsList
        }
        NaybrrTab { id: naybrrTab}
        CartItems { id: cartItems}
    }

    function searchItems(){
        itemsList.listModel.clear()
        let searchText = txtSearch.text;
        let callback = function(data){
            for(let i = 0; i < data.length; i++){
                itemsList.listModel.append(data[i])
            }
        }

        RequestHelper.findItems(callback, searchText, activeUserZip, uId)
    }

    function searchNaybrrs(){
        naybrrTab.listModel.clear();
        let searchText = txtSearch.text
        let callback = function(data){
            for(let i = 0; i < data.length; i++){
                itemsList.listModel.append(data[i])
            }
        }
    }

    TextField {
        id: txtSearch
        x: 59
        y: 19
        width: 323
        height: 40
        placeholderText: qsTr("Search")
        onTextChanged: function(){
            console.log("text changed... " , txtSearch.text)
            console.log(swipeView.children[0].id);
            switch(swipeView.currentIndex){
                //itemsTab
                case 0:
                    searchItems()
                    break;


                //naybrrTab
                case 1:
                    break;
                default:
                    break;
            }
        }
    }

    TabBar {
        id: tabBar
        anchors.bottom: parent.bottom
        x: 19
        y: 462
        width: 358
        height: 40
        position: TabBar.Footer
        contentWidth: 0
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Items")
        }
        TabButton {
            text: qsTr("Naybrrs")
        }
        TabButton {
            text: qsTr("Cart")
        }
    }

    Image {
        id: image
        x: 8
        y: 19
        width: 45
        height: 41
        source: "open-menu.svg"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: maSettings
            anchors.fill: parent
        }
    }
}
