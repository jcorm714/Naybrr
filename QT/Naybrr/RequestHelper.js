function openRequest(method, url, callback){

    let xhr = new XMLHttpRequest();
    let data;
    xhr.open(method, url)
    xhr.send()

    xhr.onload = function(event){
        if(xhr.status !== 200){
            console.log("invalid or no data returned")
            data = []
        } else {
            callback(JSON.parse(xhr.response))
        }
    }

    xhr.onerror = function(event){
        console.error("request failed")
        data = []
    }
}

/********************************************************
*
*   Below are wrappers for calling different APIs,
*   each of them has a specific url it attends to
*   so any changes to stuff like parameters gets made there
*/


//retreives a list of items from the database
//TODO: add parameters to filter by search and zipcode
function getItemList(callback){
    let url = "http://localhost:8080/items"
    openRequest("GET", url,  callback)
}

//gets a singular item from the database
function getItem(callback){
    let url = "http://localhost:8080/oneitem"
    openRequest("GET", url, callback)
}
function getUsers(callback){
    let url = "http://localhost:8080/users";
    openRequest("GET", url, callback)
}


function login(callback, user, password){
    let url = `https://naybrr.herokuapp.com/login?function=login&username=${user}&password=${password}`;
    console.log("attemping to login....")
    console.log("request for:  ", url)
    openRequest("GET", encodeURI(url), callback);
}

function registerUser(callback, user)
{   let addr2 = (user.addr2.length) ? user.addr2 : "nil"
    let url = `https://naybrr.herokuapp.com/new?function=new_user&`
          url += `username=${user.username}&email=${user.email}&password=${user.password}`
          url += `&line1=${user.addr1}&line2=${addr2}`
          url += `&city=${user.city}&state=${user.state}&zip=${user.zip}`
    console.log("Attempting to register")
    console.log("Requesting for: "  +  encodeURI(url));
    openRequest("GET", url, callback);

}

function insertItem(callback, nItem){
    let url = `https://naybrr.herokuapp.com/newItem?function=add_item&accountId=${nItem.accId}`
        url += `&itemName=${nItem.name}&Price=${nItem.price}&quantity=${nItem.quantity}&imgPath=${nItem.imgPath}&description=${nItem.desc}`
    console.log("Attempting to upload item")
    console.log("Reguesting for: ", url);

    openRequest("GET", url, callback);

}

