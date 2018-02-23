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

</article>
<?php require '_footer.html';?>

</html>
