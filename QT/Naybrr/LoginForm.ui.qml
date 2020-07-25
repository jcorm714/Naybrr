import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    height: 400
    property alias btnRegister: btnRegister

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent
    }

    TextField {
        id: txtUsername
        x: 100
        y: 85
        placeholderText: qsTr("Username")
    }

    TextField {
        id: txtPassword
        x: 100
        y: 136
        placeholderText: qsTr("Password")
        echoMode: TextInput.Password
    }

    Button {
        id: btnRegister
        x: 100
        y: 194
        text: qsTr("Register")
    }

    Button {
        id: btnLogin
        x: 206
        y: 194
        text: qsTr("Login")
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:397;anchors_width:402}
}
##^##*/
