import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    property alias btnReturn: btnReturn
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
        text: "Proin neque orci, dapibus quis orci a, auctor lobortis felis. Duis molestie vehicula eros. Sed quis pellentesque enim. Nam eget ipsum lacus. Morbi eget augue justo. Nulla et velit quis ipsum ullamcorper mollis eu quis felis. Sed bibendum ligula non euismod mattis. Donec mollis commodo nulla, ut maximus lacus eleifend quis. Nulla eget neque ac lectus luctus finibus a vitae risus. Nulla ultrices consectetur ante. Duis eget ex pretium, hendrerit ligula vitae, tristique orci."
        wrapMode: Text.WordWrap
        verticalAlignment: Text.AlignTop
        placeholderText: qsTr("Text Area")
    }

    Button {
        id: btnImage
        x: 24
        y: 220
        text: qsTr("Image")
    }

    Text {
        id: lblFilePath
        x: 157
        y: 233
        width: 208
        height: 15
        font.pixelSize: 12
    }
}
