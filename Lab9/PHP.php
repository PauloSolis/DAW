<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" rel="stylesheet" type="text/css">
    <link href="palette.css" rel="stylesheet" type="text/css">

</head>
<div class="dark-primary-color">
    <div class="top-bar">
        <div class="top-bar-left">
            <ul class="menu">
                <li class="menu-text">Blog</li>
                <li><a  href="#Formulario">Formulario</a></li>
                <li><a href="#Pregunta">Pregunta</a></li>
                <li><a href="#Me">PHP</a></li>
            </ul>
        </div>
    </div>
</div>


<header >
    <div class="callout large primary">
        <div class="text-center">
            <h1>Desarrollo de aplicaciones web</h1>
            <h2 >Laboratorio 9</h2>
        </div>
    </div>
</header>

<article class="grid-container">
    <div class="grid-x align-center">
        <div class="cell medium-8">
            <h3 id="Formulario"> Formularios</h3>
            <form>
                <p>
                    <label>Hora y fecha:
                        <input type="datetime-local">
                    </label>
                </p>
                <p>
                    <label>Correo:
                        <input placeholder="tuCorreo@mail.com" required="" type="email">
                    </label>
                </p>
                <p>
                    <label>Contraseña:
                        <input placeholder="Pass" required="" type="password">
                    </label>
                </p>
            </form>
        </div>
        <br>
        <br>
        <br>
        <div>
            <h2 id="Me">PHP</h2><br>

            <form action="PHP.php" method="post"    >
                Ingresa Número <input type="text" name="Hola"><br>
                <input type="submit">
            </form>
        </div>
    </div>



<?php
/**
 * Created by PhpStorm.
 * User: Paulo
 * Date: 07/02/2018
 * Time: 08:34 AM
 */

 function prom($Adios){
    $arrlenght = count($Adios);
    $promedio=0;

    for($x=0; $x<$arrlenght; $x++ ){
        $promedio += $Adios[$x];

    }
        $promedio = $promedio/$arrlenght;
        return $promedio;


 }

 function media($Adios){
     $arrlenght = count($Adios);
     sort($Adios);
     $ordenado=$Adios;


     if($arrlenght%2==0){
        $aux =  $arrlenght/2;
        $media = ($ordenado[$aux]+ $ordenado[$aux+1])/2;
     }else {
         $aux = $arrlenght/2;
         $media= $ordenado[$aux];


     }
        return $media;


 }


 function Imprimir($Nombre, $Adios){
     echo "<ul>".$Nombre;
     $arrlenght = count($Adios);
     for ($i=0; $arrlenght>$i; $i++){
         echo "<li>".$Adios[$i]."</li>";
     }

     echo "</ul>";


 }
 function lista($Adios){
     $arrlenght = count($Adios);

    echo "<ul>";
     /*for($i=0; $arrlenght>$i; $i++){
         echo "<li>$Adios[$i]</li>";



     }*/
    //echo"</ul>";
    //echo"<br><br>";
    //echo"<ul>";
     echo"<li>Promedio:".prom($Adios)."</li>";
     echo"<li>Media:".media($Adios)."</li>";
     echo "</ul>";

     sort($Adios);
     $aux=$Adios;
     Imprimir("Menor a mayor",$aux);

     rsort($Adios);
     $aux = $Adios;
     Imprimir("Mayor a menor ", $aux );


 }

 function cuadrado($Num){
    echo "<table border='1'> ";
        echo "<tr>";
          echo"<th>Numero al cuadrado</th>";
          echo"<th>  Numero al cubo</th>";
        echo"</tr>";


            for($i=1; $i<$Num+1; $i++){
                echo"<tr></tr><td>".$i**2;echo"</td>";
                echo"<td>".$i**3;echo"</td></tr>";

            }


     echo"</tr>";
     echo"</table>";




 }
if(count($_POST)>0){
     $Adiosu= explode(",", str_replace(" ", "",$_POST["Hola"]));
     $aux=end($Adiosu);
     Imprimir("Arreglo Inicial",$Adiosu);
     "<br>";
     "<br>";
     lista($Adiosu);
     cuadrado($aux);




}
 ?>

</article>
<footer>Hecho con PHPStorm y foundation A01207593</footer>
</html>



