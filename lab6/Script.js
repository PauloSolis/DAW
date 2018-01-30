var padre = document.getElementById("Father1");
var hijo = document.getElementById("pregunta1");

padre.addEventListener("click", function() {

    padre.style.backgroundColor = "black";
    padre.style.color   = "white";
}, true);

hijo.addEventListener("click", function () {
    hijo.style.backgroundColor="red";
    hijo.style.color= "gray";
}, true);

var padre2 = document.getElementById("Father2");
    padre2.addEventListener("mouseenter",function () {
    padre2.style.color="blue";
});

var padre2 = document.getElementById("Father2");
    padre2.addEventListener("mouseleave",function () {
    padre2.style.color="black";
});

var padre3 = document.getElementById("Father3");
padre3.addEventListener("mouseover", function () {

    setInterval(function(){
        if (padre3.style.visibility === "hidden") {
            padre3.style.visibility = "visible";
        } else {
            padre3.style.visibility = "hidden";
        }


    }, 300);





});



