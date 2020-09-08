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
