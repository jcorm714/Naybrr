import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper

NaybrrTabForm{
    id: naybrrTab
    Component {
        id: items
            ItemsListNaybrrTab{
            }

    }
    stack.initialItem: naybrrTab
    listView.delegate: ItemDelegate {
        x: 5
        width: 400
        height: 40

        onClicked: stack.push(items);
        Row {
            id: row1
            Text {
                text: user_id
                font.bold: true
            }

            Text {
                text: username
                font.bold: true
            }



            spacing: 10
        }
    }
    listView.model: ListModel {
        id: listModel
    }
    Component.onCompleted: {
        RequestHelper.getUsers(function(data){
            for(let i =0; i < data.length; i++){
                console.log(data[i]);
                listModel.append(data[i])
            }

        })
    }
}
