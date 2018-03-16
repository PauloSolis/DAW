<?php
/**
 * Created by PhpStorm.
 * User: Paulo
 * Date: 15/03/2018
 * Time: 10:49 PM
 */

    session_start();
    require_once("Util.php");
    if(isset($_SESSION["user"]) ) {
        include("_header.html");
        include("_navbar.html");
        $user = $_SESSION["IDusuario"];
        include("Lab20.html");

        include("footer.html");
    }else if (login($_POST["IDusuario"], $_POST["password"]) ) {
        unset($_SESSION["error"]);
        $_SESSION["user"] = $_POST["IDusuario"];
        $user = $_SESSION["IDusuario"];
        include("_header.html");
        include("_navbar.html");
        include("Lab20.html");
        include("_footer.html");
    }else{
        $_SESSION["error"] = "Usuario y/o contraseña incorrectos";
        header("location: Lab20.php");
    }
?>