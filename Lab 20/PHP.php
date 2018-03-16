<?php
session_start();
if(isset($_SESSION["user"]) ) {
    header("location: login.php");
} else {
    include("_header.html");
    include("_navbar.html");
    include("_login.html");
    include("_scripts.html");
    include("_footer.html");
}
?>
