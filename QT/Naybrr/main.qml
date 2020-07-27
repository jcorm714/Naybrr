import QtQuick 2.12
import QtQuick.Controls 2.5
import Naybrr 1.0
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: login

    }

    User{
        id: tempUser
    }


    Component{
        id: login
        LoginForm {





            //returns true if the login/password are valid
            function validateLogin(){
                let uname = txtUsername.text;
                let pass = txtUsername.text;

                //the login function is defined in user.cpp
                return tempUser.login(uname,pass);

            }

            btnLogin.onClicked: {

                let isValid = validateLogin();
                lblOut.text = (isValid)? "success": "incorrect login";
            }


            btnRegister.onClicked: {
                stackView.push(registration)
            }

        }
    }

    Component{
        id: registration

        RegistrationForm{
            function validateRegister() {
                let username = txtUsername.text
                let password = txtPassword.text
                let passwordConfirm = txtPassword.text
                let email = txtEmail.text
                let addr1 = txtAddr1.text
                let addr2 = txtAddr2.text
                let state = cbState.CurrentText
                let zip = txtZip.text

                let errormsg = "";
                if(!username.length){
                    errormsg += "Username required "
                }
                if(!password.length){
                    errormsg += "Passwored required "
                }
                if(passwordConfirm !== password){
                    errormsg += "Passwords Must Match "
                }

                //matches emails found the regex online lol
                let re = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/gm
                if(!re.test(email)){
                    errormsg += "Email is invalid "
                }

                if(state === "---Choose State---"){
                    errormsg += "State required"
                }

                if(!zip.length){
                    errormsg += "Zipcode required"
                }

                return errormsg

            }

            function create_user(){
                let u = txtUsername.text
                let p = txtPassword.text

                let e = txtEmail.text
                let a = txtAddr1.text
                let a2 = txtAddr2.text
                let c = txtCity.text
                let s = cbState.CurrentText
                let z = txtZip.text
                let user = Qt.createComponent(User)
                user.username = u;
                user.password = p;
                user.email = e;
                user.addr1 = a;
                user.addr2 = a2;
                user.city = c;
                user.state = s
                user.zip = z;
                console.log(user);
                return user;

            }



                btnBack.onClicked: {
                    stackView.pop()
                }
                btnSubmit.onClicked: {
                    let errorMsg = validateRegister()
                    let hasErrors = (errorMsg.length > 0)
                    if(hasErrors){
                        lblErrors.text = errorMsg
                    } else {
                        let u = create_user()
                        tempUser.registerUser(u.username, u.password, u.email, u.addr1, u.addr2, u.city, u.state, u.zip)
                        stackView.pop()
                    }
                }
        }
    }

}
