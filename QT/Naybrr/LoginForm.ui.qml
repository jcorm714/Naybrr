import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    height: 400
    property alias btnLogin: btnLogin
    property alias btnRegister: btnRegister
    property alias txtUsername: txtUsername
    property alias txtPassword: txtPassword
    property alias lblOut: lblOut

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

    Text {
        id: lblOut
        x: 171
        y: 258
        text: qsTr("")
        font.pixelSize: 12
    }
}
