<?php
    function conectDb(){
        $ENV = "dev";

        if($ENV == "dev"){
            $mysql = mysqli_connect("localhost", "root", "WarMachineIsCool", "database" );

        else if($ENV == "prod" ){
            $servername="localhost";
            $usernamme = "root";
            $password = "WarMachineIsCool";
            $dbname = "database";
        }

        return $mysql;
    }

    function disconnect($mysql){
        mysqli_close($mysql);

    }

    function getData(){
        $db= connect();
        if($db != null){

            $sql = "SELECT name, Debt, date, city FROM Deudores";

            result = mysqli_query($db, $sql);
            closedisconnect($db);
            return $result;

        }


?>