<?php
/**
 * Created by PhpStorm.
 * User: Paulo
 * Date: 15/03/2018
 * Time: 10:41 PM
 */
include("Util.php");
if(!isset($_POST["Input"]))
    return;
$output = Find($_POST["Input"]);
if($output!="") {
        echo "Se ha hallado";
    else
        echo "no encontrado"$Find;
    };
    ?>