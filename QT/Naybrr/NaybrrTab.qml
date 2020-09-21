import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper

Item {
    width: 400
    height: 400
    property alias stack: stack
    property alias listModel: listModel
    StackView {
        id: stack
        anchors.fill: parent

        ListView {
            id: listView
            contentWidth: 0
            anchors.fill: parent

            model: ListModel {
                id: listModel
            }

            delegate: ItemDelegate {
                x: 5
                width: 400
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

                    let callback = function(data){
                        let itemsList = Qt.createComponent("ItemsListNaybrrTab.qml")
                        let propertyValues = {
                            accId: accountid
                        }

                        if(itemsList.status === Component.Ready){
                            createPage(itemsList, propertyValues)
                        } else {
                            itemsList.statusChanged.connect(createPage(itemsList, propertyValues))
                        }


                    }

                    RequestHelper.getUserInventory(callback, accountid)

                }

                Row {
                    id: row1
                    Text {
                        text: username
                        font.bold: true
                    }

                    spacing: 10
                }
            }
        }
    }
}
