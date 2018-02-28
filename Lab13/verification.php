<?php
session_start();

if(isset($_SESSION["usuario"])){
    include("_header.html");
    $user = $_SESSION["usuario"];
    include("_logged_view.html");
    include("_cuestionario.html");
    include("_footer.html");
}
else if($_POST["usuario"] == "TuPastor" && $_POST["password"]=="123Tamarindo"){
    unset($_SESSION["error"]);
    $_SESSION["usuario"] = $_POST["usuario"];
    $user = $_SESSION["usuario"];
    include("_header.html");
    include("_footer.html");
}
else if($_POST["usuario"] != "TuPastor" || $_POST["password"] != "123Tamarindo"){
    $_SESSION["error"] = "Lo siento, tus datos son incorrectos";
    header("location: index.php");
}
?>