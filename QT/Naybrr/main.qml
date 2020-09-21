import QtQuick 2.12
import QtQuick.Controls 2.5
import "RequestHelper.js" as RequestHelper
import Naybrr 1.0

ApplicationWindow {
    property int activeUserId: -1;
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: login
    }

    Component {
        id: login
        LoginForm {

            btnLogin.onClicked: {
                let uname = txtUsername.text
                let pass = txtPassword.text
                let callback = function(data){
                    if(data["accountid"] > 0){
                        stackView.push(appHub)
                        activeUserId = data["accountid"]

                    } else {
                        lblOut.text = "incorrect login";
                    }
                }
                pass = Util.hashPassword(pass)
                RequestHelper.login(callback, uname, pass)
            }

            btnRegister.onClicked: {
                stackView.push(registration)
            }
        }
    }

    Component {
        id: registration

        RegistrationForm {
            function validateRegister() {
                let username = txtUsername.text
                let password = txtPassword.text
                let passwordConfirm = txtPassword.text
                let email = txtEmail.text
                let addr1 = txtAddr1.text
                let addr2 = txtAddr2.text
                let state = cbState.currentText
                let zip = txtZip.text


                let errormsg = ""
                if (!username.length) {
                    errormsg += "Username required "
                }
                if (!password.length) {
                    errormsg += "Passwored required "
                }
                if (passwordConfirm !== password) {
                    errormsg += "Passwords Must Match "
                }

                //matches emails found the regex online lol
                let re = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/gm
                if (!re.test(email)) {
                    errormsg += "Email is invalid "
                }

                if (state === "---Choose State---") {
                    errormsg += "State required"
                }

                if (!zip.length) {
                    errormsg += "Zipcode required"
                }

                return errormsg
            }

            function create_user() {
                let u = txtUsername.text
                let p = txtPassword.text

                let e = txtEmail.text
                let a = txtAddr1.text
                let a2 = txtAddr2.text
                let c = txtCity.text
                let s = cbState.currentText
                let z = txtZip.text
                let user = Qt.createComponent(User)
                user.username = u
                user.password = p
                user.email = e
                user.addr1 = a
                user.addr2 = a2
                user.city = c
                user.state = s
                user.zip = z
                console.log(user)
                return user
            }

            btnBack.onClicked: {
                stackView.pop()
            }
            btnSubmit.onClicked: {
                let errorMsg = validateRegister()
                let hasErrors = (errorMsg.length > 0)
                if (hasErrors) {
                    lblErrors.text = errorMsg
                } else {
                    let u = create_user()
                    u.password = Util.hashPassword(u.password);
                    let callback = function(data){
                        console.log("user: ", data["accountid"])
                        if(data["username"].length > 0)
                        {
                            stackView.pop();
                        } else {
                            console.log("an error registering occurred")
                        }

                    }

                    RequestHelper.registerUser(callback, u)

                }
            }
        }
    }

    Component {

        id: settings
        UserSettingsForm {

            function create_user() {
                //let u = txtUsername.text
                let p = txtNewPassword.text

                //let e = txtEmail.text
                let a = txtAddr1.text
                let a2 = txtAddr2.text
                let c = txtCity.text
                let s = cbState.CurrentText
                let z = txtZip.text
                let user = Qt.createComponent(User)
                user.username = "test"
                user.password = p
                user.email = "email@net.com"
                user.addr1 = a
                user.addr2 = a2
                user.city = c
                user.state = s
                user.zip = z
                console.log(user)
                return user
            }
            btnBack.onClicked: stackView.pop()
            btnSubmit.onClicked: {
                let u = create_user()
                tempUser.updateUser(1, u.username, u.password, u.email,
                                    u.addr1, u.addr2, u.city, u.state, u.zip)
                stackView.pop()
            }
        }
    }

    Component {
        id: inventory
        InventoryHub{
            btnReturn.onClicked: stackView.pop()
            uId: activeUserId
        }
    }

    Component{
        id: addItem
        AddItem{
            uId: activeUserId
            btnReturn.onClicked: stackView.pop()
        }
    }

    Component {
        id: appHub
        AppHub{
            uId: activeUserId
            Drawer{
                id: drawer
                width: 0.4 * window.width;
                height: parent.height
                x: 5
                y:10

                ListView {
                    id: listView
                    anchors.fill: parent

                    model: ListModel {

                            ListElement {
                                name: "Settings"

                            }
                            ListElement {
                                name: "Inventory"

                            }

                            ListElement{
                                name: "Add Item"
                            }

                            ListElement {
                                name: "Log out"

                            }
                            ListElement {
                                name: "Clear Cart"
                            }
                        }
                    delegate: ItemDelegate{
                        x: 5
                        width: parent.width
                        height: 40
                        onClicked: function() {

                                switch(name){
                                    case "Settings":
                                        stackView.push(settings)
                                       break;
                                    case "Inventory":
                                        stackView.push(inventory)
                                        break;
                                    case "Add Item":
                                        stackView.push(addItem)
                                        break;
                                    case "Log out":
                                        stackView.pop();
                                        break;
                                    case "Clear Cart":
                                        Cart.dropCreateDatabase();
                                        break;




                                }
                            drawer.close()

                        }

                        Row {
                            id: row1


                            Text {
                                text: name

                                font.bold: true

                            }
                        }
                    }
                }

            }
            maSettings.onClicked: drawer.open()
        }



    }
}
