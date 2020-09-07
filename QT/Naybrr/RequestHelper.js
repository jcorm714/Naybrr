
function getItemList(processData){
    let xhr = new XMLHttpRequest();
    let data;
    xhr.open("GET","http://localhost:8080/items")
    xhr.send()

    xhr.onload = function(event){
        if(xhr.status !== 200){
            console.log("invalide or no data returned")
            data = []
        } else {
            processData(JSON.parse(xhr.response))
        }
    }

    xhr.onerror = function(event){
        console.error("request failed")
        data = []
    }

    return data
}
