import QtQuick 2.4
import QtQuick.Controls 2.15
import "RequestHelper.js" as RequestHelper
import Naybrr 1.0

Item {
    id: settingsPage
    width: 400
    height: 400
    property int uId: -1
    property string uEmail: ""
    property string username: ""
    property string userId: ""
    property string password: ""
    property string email: ""
    property string addr1: ""
    property string addr2: ""
    property string city:  ""
    property string state: ""
    property string zip: ""

    Component.onCompleted: {
        let callback = function(data){
            txtAddr1.text = data["line1"]
            txtAddr2.text = data["line2"]
            txtCity.text = data["city"]
            let state =  data["state"]
            let i = cbState.find(state, Qt.MatchExactly)
            cbState.currentIndex = i;
            username = data["username"]
            txtZip.text = data["zip"]
            uEmail = data["email"]
        }

        RequestHelper.getUserDetailsFromId(callback, uId)
    }

    TextField {
        id: txtPassword
        x: 18
        y: 39
        width: 345
        height: 40
        placeholderText: qsTr("New Password")
        text:password
        echoMode: TextInput.Password
    }

    TextField {
        id: txtPasswordConfirm
        x: 18
        y: 83
        width: 345
        height: 40
        text: password
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
        text: addr1
    }

    TextField {
        id: txtAddr2
        x: 185
        y: 126
        width: 178
        height: 40
        text: addr2
        placeholderText: qsTr("Address Line 2")
    }

    TextField {
        id: txtCity
        x: 18
        y: 170
        width: 161
        height: 40
        text: city
        placeholderText: qsTr("City")
    }

    ComboBox {
        id: cbState
        x: 185
        y: 170
        width: 178
        height: 40
        editable: true
        editText: state
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
        y: 213
        width: 345
        height: 40
        placeholderText: qsTr("Zipcode")
        text: zip
    }

    Button {
        id: btnSubmit
        x: 189
        y: 312
        width: 174
        height: 40
        text: qsTr("Submit")
        onClicked: submit()
    }

    Button {
        id: btnBack
        x: 18
        y: 312
        width: 162
        height: 40
        text: qsTr("Back")
        onClicked: stackView.pop()
    }


    Text {
        id: lblErrors
        x: 18
        y: 400
        width: 345
        height: 26
        font.pixelSize: 12
    }

    TextField {
        id: txtPasswordSubmit
        x: 18
        y: 358
        width: 345
        height: 40
        text: ""
        placeholderText: qsTr("Enter Password to Confirm changes")
        font.bold: false
        echoMode: TextInput.Password
    }


    function create_user() {

        let p =""
        if(txtPassword.text.length)
        {
            p = Util.hashPassword(txtPassword.text)
        }
        let e = uEmail
        let a = txtAddr1.text
        let a2 = txtAddr2.text
        let c = txtCity.text
        let s = cbState.currentText
        let z = txtZip.text
        let user = Qt.createComponent(User)
        let id = uId;
        user.password = p
        user.email = e
        user.addr1 = a
        user.addr2 = a2
        user.city = c
        user.state = s
        user.zip = z
        user.uId = uId;
        console.log(user)
        return user
    }

    function submit(){
        let errors = validate()
        if(errors.length > 0){
            lblErrors.text = errors;
            return;
        }

        function loginCallback(data) {
            if(data["accountid"] > 0){
                let updateCallback = function(result){
                    if(result["success"]){
                        stackView.pop()
                    }


                }


                let u = create_user()
                RequestHelper.updateUser(updateCallback, u)

            }
        }

        let pass = Util.hashPassword(txtPasswordSubmit.text)
        RequestHelper.login(loginCallback, username,  pass)


    }

    function validate() {


        let addr1 = txtAddr1.text
        let addr2 = txtAddr2.text
        let state = cbState.currentText
        let zip = txtZip.text
        let passwordSubmit = txtPasswordSubmit.text


        let errormsg = ""

        if(!passwordSubmit){
            errormsg += "Password required to update settings"
        }
        if(password.length){
            if (passwordConfirm !== password) {
                errormsg += "Passwords Must Match "
            }
        }

        if (state === "---Choose State---") {
            errormsg += "State required"
        }

        if (!zip.length) {
            errormsg += "Zipcode required"
        }

        return errormsg
    }
}
