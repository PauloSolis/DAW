<?php
/**
 * Created by PhpStorm.
 * User: Paulo
 * Date: 15/03/2018
 * Time: 10:42 PM
 */

function Session(){
    $servername = localhost;
    $username = Edgar;
    $password =  hola;
    $dbname = Lab20;
    $connection = mysqli_connect($servername, $username, $password, $dbname);
    if(!$Session)
        die(La conexi�n no se pudo establecer . mysqli_connect_error());
    return $connection;
}
function disconnect($Session){
    mysqli_close($Session);

}

function disconnectDB($mysql){
    mysqli_close($Session);
}


?>