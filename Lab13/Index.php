<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" rel="stylesheet" type="text/css">
    <link href="palette.css" rel="stylesheet" type="text/css">

</head>
<?php   require '_header.html';?>
    <article class="grid-container">
        <div class="grid-x align-center">
            <div class="cell medium-8">
                <?php require 'Professional_Development_Workshop_Registration_Form_80568782744874_source.html';?>
            </div>
            <br>
            <br>
            <br>
            <div>
                <h2 id="Me">PHP</h2><br>

                <form action="PHP.php" method="post">
                    Ingresa Número <input type="text" name="Hola"><br>
                    <input type="submit">
                </form>
            </div>
            <h3>preguntas</h3>
            <p>¿Por qué es una buena práctica separar el controlador de la vista?. <br> para tener una mejor organización y sea
            más fácil de ver.</p>
            <p>Aparte de los arreglos $_POST y $_GET, ¿qué otros arreglos están predefinidos en php y cuál es su función?
                Explora las funciones de php, y describe 2 que no hayas visto en otro lenguaje y que llamen tu atención.</p>
               <p> ¿Qué es XSS y cómo se puede prevenir?<br> Es una inyección de datos que pueden modificar toda la página, con los proyectos
                    OWASP ESAPI
            </p>
        </div>

</article>
<?php require '_footer.html';?>

</html>
