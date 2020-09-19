import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 400
    property alias btnBack: btnBack
    property alias txtUsername: txtUsername
    property alias txtPassword: txtPassword
    property alias txtPasswordConfirm: txtPasswordConfirm
    property alias txtEmail: txtEmail
    property alias txtAddr1: txtAddr1
    property alias txtAddr2: txtAddr2
    property alias txtCity: txtCity
    property alias cbState: cbState
    property alias txtZip: txtZip
    property alias btnSubmit: btnSubmit
    property alias lblErrors: lblErrors

    TextField {
        id: txtUsername
        x: 18
        y: 39
        width: 161
        height: 40
        placeholderText: qsTr("Username")
    }

    TextField {
        id: txtPassword
        x: 185
        y: 39
        width: 178
        height: 40
        placeholderText: qsTr("Password")
        echoMode: TextInput.Password
    }

    TextField {
        id: txtPasswordConfirm
        x: 185
        y: 85
        width: 178
        height: 40
        text: ""
        font.bold: false
        placeholderText: qsTr("Confirm Password")
        echoMode: TextInput.Password
    }

    TextField {
        id: txtEmail
        x: 18
        y: 85
        width: 161
        height: 40
        placeholderText: qsTr("Email")
    }

    TextField {
        id: txtAddr1
        x: 18
        y: 131
        width: 161
        height: 40
        placeholderText: qsTr("Address Line 1")
    }

    TextField {
        id: txtAddr2
        x: 185
        y: 131
        width: 178
        height: 40
        placeholderText: qsTr("Address Line 2")
    }

    TextField {
        id: txtCity
        x: 18
        y: 180
        width: 161
        height: 40
        text: ""
        placeholderText: qsTr("City")
    }

    ComboBox {
        id: cbState
        x: 185
        y: 180
        width: 178
        height: 40
        editable: true
        model: ListModel {
            id: us_states
            ListElement {
                text: "---Choose State---"
            }
            ListElement {
                text: "AL"
            }
            ListElement {
                text: "AK"
            }
            ListElement {
                text: "AZ"
            }
            ListElement {
                text: "AR"
            }
            ListElement {
                text: "CA"
            }
            ListElement {
                text: "CO"
            }
            ListElement {
                text: "CT"
            }
            ListElement {
                text: "DE"
            }
            ListElement {
                text: "FL"
            }
            ListElement {
                text: "GA"
            }
            ListElement {
                text: "HI"
            }
            ListElement {
                text: "ID"
            }
            ListElement {
                text: "IL"
            }
            ListElement {
                text: "IN"
            }
            ListElement {
                text: "IA"
            }
            ListElement {
                text: "KS"
            }
            ListElement {
                text: "KY"
            }
            ListElement {
                text: "LA"
            }
            ListElement {
                text: "ME"
            }
            ListElement {
                text: "MD"
            }
            ListElement {
                text: "MA"
            }
            ListElement {
                text: "MI"
            }
            ListElement {
                text: "MN"
            }
            ListElement {
                text: "MS"
            }
            ListElement {
                text: "MO"
            }
            ListElement {
                text: "MT"
            }
            ListElement {
                text: "NE"
            }
            ListElement {
                text: "NV"
            }
            ListElement {
                text: "NH"
            }
            ListElement {
                text: "NJ"
            }
            ListElement {
                text: "NM"
            }
            ListElement {
                text: "NY"
            }
            ListElement {
                text: "NC"
            }
            ListElement {
                text: "ND"
            }
            ListElement {
                text: "OH"
            }
            ListElement {
                text: "OK"
            }
            ListElement {
                text: "OR"
            }
            ListElement {
                text: "PA"
            }
            ListElement {
                text: "RI"
            }
            ListElement {
                text: "SC"
            }
            ListElement {
                text: "SD"
            }
            ListElement {
                text: "TN"
            }
            ListElement {
                text: "TX"
            }
            ListElement {
                text: "UT"
            }
            ListElement {
                text: "VT"
            }
            ListElement {
                text: "VA"
            }
            ListElement {
                text: "WA"
            }
            ListElement {
                text: "WV"
            }
            ListElement {
                text: "WI"
            }
            ListElement {
                text: "WY"
            }
        }
    }

    TextField {
        id: txtZip
        x: 18
        y: 226
        width: 345
        height: 40
        placeholderText: qsTr("Zipcode")
    }

    Button {
        id: btnSubmit
        x: 189
        y: 280
        width: 174
        height: 40
        text: qsTr("Submit")
    }

    Button {
        id: btnBack
        x: 18
        y: 280
        width: 162
        height: 40
        text: qsTr("Back")
    }

    Text {
        id: lblErrors
        x: 18
        y: 336
        width: 345
        height: 48
        font.pixelSize: 12
    }
}
