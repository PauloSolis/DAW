function loadDoc() {
    var xhttp = new XMLHttpRequest();
    var Input = "";
    xhttp.onreadystatechange = function() {
        if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
            document.getElementById("Hola").innerHTML = this.responseText;
        }
    };
    xhttp.open("POST", "Lab19.php", true);
    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhttp.send("Hola="+ encodeURIComponent(document.write("Hola").value));
}