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

    openRequest("GET", encodeURI(url), callback);

}

function getUserInventory(callback, userId){
    let url = `https://naybrr.herokuapp.com/neighbor?function=neighbor&accountId=${userId}`
    console.log("Attempting to retreive user inventory")
    console.log("Requesting for: " , url)
    openRequest("GET", encodeURI(url), callback)
}

function findItem(callback, itemId){
    let url =  `https://naybrr.herokuapp.com/item?function=find_item&itemId=${itemId}`
    console.log("Attempting to find item")
    console.log("Requesting for: ", url)
    openRequest("GET", encodeURI(url), callback)
}

function deleteItem(callback, itemId){
    let url= `https://naybrr.herokuapp.com/delete?function=delete_item&itemId=${itemId}`
    console.log("Attemting to delete item")
    console.log("Requesting for: ", url);
    openRequest("GET", encodeURI(url), callback)
}

function updateItem(callback, nItem){
    let url = `https://naybrr.herokuapp.com/updateItem?function=update_item&itemId=${nItem.dbId}&accountId=${nItem.accId}&`
    url += `itemName=${nItem.name}&Price=${nItem.price}&quantity=${nItem.quantity}&`
    url += `imgPath=${nItem.imgPath}&description=${nItem.desc}`
    console.log("Attempting to update item")
    console.log("Requsting for: ", url);
    console.log("Encoded URL: ", encodeURI(url))
    openRequest("GET", encodeURI(url), callback)

}

function findItems(callback, name, zip, accId){
    let url = `https://naybrr.herokuapp.com/search?function=search_item&accountId=${accId}&search=${name}&zip=${zip}`
    console.log("trying to find items")
    console.log("Requesting For: ", url);
    console.log("Encoded URL: ", encodeURI(url));
    openRequest("GET", encodeURI(url), callback);

}

function getZipcodeForUserId(callback, accId){
    let url = `https://naybrr.herokuapp.com/zipcode?function=find_zip&accountId=${accId}`
    console.log("trying to get zipcode")
    console.log("Requesting for: ", url);
    console.log("EncodedURL: ", encodeURI(url));
    openRequest("GET", encodeURI(url), callback);
}

