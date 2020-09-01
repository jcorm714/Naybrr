import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: settingsPage
    width: 400
    height: 400
    property alias txtNewPassword: txtNewPassword

    property alias btnBack: btnBack
    property alias txtPasswordConfirm: txtPasswordConfirm
    property alias txtAddr1: txtAddr1
    property alias txtAddr2: txtAddr2
    property alias txtCity: txtCity
    property alias cbState: cbState
    property alias txtZip: txtZip
    property alias btnSubmit: btnSubmit
    property alias lblErrors: lblErrors

    TextField {
        id: txtNewPassword
        x: 18
        y: 39
        width: 345
        height: 40
        placeholderText: qsTr("New Password")
        echoMode: TextInput.Password
    }

    TextField {
        id: txtPasswordConfirm
        x: 18
        y: 83
        width: 345
        height: 40
        text: ""
        font.bold: false
        placeholderText: qsTr("Confirm Password")
        echoMode: TextInput.Password
    }

    TextField {
        id: txtAddr1
        x: 18
        y: 126
        width: 161
        height: 40
        placeholderText: qsTr("Address Line 1")
    }

    TextField {
        id: txtAddr2
        x: 185
        y: 126
        width: 178
        height: 40
        placeholderText: qsTr("Address Line 2")
    }

    TextField {
        id: txtCity
        x: 18
        y: 170
        width: 161
        height: 40
        text: ""
        placeholderText: qsTr("City")
    }

    ComboBox {
        id: cbState
        x: 185
        y: 170
        width: 178
        height: 40
        editable: true
        model: ListModel {
            id: us_states
            ListElement {
                text: "---Choose State---"
            }
            ListElement {
                text: "Alabama"
            }
            ListElement {
                text: "Alaska"
            }
            ListElement {
                text: "Arizona"
            }
            ListElement {
                text: "Arkansas"
            }
            ListElement {
                text: "California"
            }
            ListElement {
                text: "Colorado"
            }
            ListElement {
                text: "Connecticut"
            }
            ListElement {
                text: "Delaware"
            }
            ListElement {
                text: "Florida"
            }
            ListElement {
                text: "Georgia"
            }
            ListElement {
                text: "Hawaii"
            }
            ListElement {
                text: "Idaho"
            }
            ListElement {
                text: "Illinois"
            }
            ListElement {
                text: "Indiana"
            }
            ListElement {
                text: "Iowa"
            }
            ListElement {
                text: "Kansas"
            }
            ListElement {
                text: "Kentucky"
            }
            ListElement {
                text: "Louisiana"
            }
            ListElement {
                text: "Maine"
            }
            ListElement {
                text: "Maryland"
            }
            ListElement {
                text: "Massachusetts"
            }
            ListElement {
                text: "Michigan"
            }
            ListElement {
                text: "Minnesota"
            }
            ListElement {
                text: "Mississippi"
            }
            ListElement {
                text: "Missouri"
            }
            ListElement {
                text: "Montana"
            }
            ListElement {
                text: "Nebraska"
            }
            ListElement {
                text: "Nevada"
            }
            ListElement {
                text: "New Hampshire"
            }
            ListElement {
                text: "New Jersey"
            }
            ListElement {
                text: "New Mexico"
            }
            ListElement {
                text: "New York"
            }
            ListElement {
                text: "North Carolina"
            }
            ListElement {
                text: "North Dakota"
            }
            ListElement {
                text: "Ohio"
            }
            ListElement {
                text: "Oklahoma"
            }
            ListElement {
                text: "Oregon"
            }
            ListElement {
                text: "Pennsylvania"
            }
            ListElement {
                text: "Rhode Island"
            }
            ListElement {
                text: "South Carolina"
            }
            ListElement {
                text: "South Dakota"
            }
            ListElement {
                text: "Tennessee"
            }
            ListElement {
                text: "Texas"
            }
            ListElement {
                text: "Utah"
            }
            ListElement {
                text: "Vermont"
            }
            ListElement {
                text: "Virginia"
            }
            ListElement {
                text: "Washington"
            }
            ListElement {
                text: "West Virginia"
            }
            ListElement {
                text: "Wisconsin"
            }
            ListElement {
                text: "Wyoming"
            }
        }
    }

    TextField {
        id: txtZip
        x: 18
        y: 213
        width: 345
        height: 40
        placeholderText: qsTr("Zipcode")
    }

    Button {
        id: btnSubmit
        x: 189
        y: 312
        width: 174
        height: 40
        text: qsTr("Submit")
    }

    Button {
        id: btnBack
        x: 18
        y: 312
        width: 162
        height: 40
        text: qsTr("Back")
    }

    Text {
        id: lblErrors
        x: 18
        y: 358
        width: 345
        height: 26
        font.pixelSize: 12
    }

    TextField {
        id: txtPassword
        x: 18
        y: 256
        width: 345
        height: 40
        text: ""
        placeholderText: qsTr("Confirm Password")
        font.bold: false
        echoMode: TextInput.Password
    }
}
