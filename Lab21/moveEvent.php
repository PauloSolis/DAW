<?php
// Documento necesario para la conexión con la base de datos
require_once('newConnection.php');
    
function moveEvents($myStart,$myEnd){
    // Hacer la conexión con la base de datos
    $bdd = connect();
    // Obtener valor de la fecha del nuevo modal
    $currentStart = $myStart;
    $currentEnd = $myEnd;
    // Establecer los días de clase
    $dayOne = "Monday";
    $dayTwo = "Thursday";
    // Sacar la id del evento añadido
    $finalId = getIdEvent($bdd);
    // Especificación del query SQL
    $sql = "SELECT * FROM actividad";
    $sth = $bdd->query($sql);
    
    while($row = mysqli_fetch_array($sth, MYSQLI_BOTH)) {
        // Obtener los valores de cada evento
        $start = $row["fechaInicio"];
        $end = $row["fechaFin"];
        $idActividad = $row["idActividad"];
        // Checar que actividad se van a mover
        if(($start > $currentStart) == true){
            // Modificar la fecha
            $updatedStart = date_create($start);
            $updatedEnd = date_create($end);
            // Obtener el día en el que está el evento y saber si es lunes o jueves
            $day = date_format($updatedStart, 'l');
            // Si es igual a lunes
            if(strcmp($day, $dayOne) === 0) {
                // Recorrer los días necesarios para la siguiente clase
                date_modify($updatedStart, "+3 days");
                date_modify($updatedEnd, "+3 days");
                
                // Updatear inicio fecha
                $start_db = date_format($updatedStart, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaInicio = '$start_db' WHERE id = $idActividad ";
                // Guardar fecha inicio updateada
                saveMoves($bdd,$sql);
                
                // Updatear fin fecha
                $end_db = date_format($updatedEnd, 'Y-m-d H:i:s');
                $sql = "UPDATE events SET end = '$end_db' WHERE id = $idActividad ";
                // Guardar fecha updateada
                saveMoves($bdd,$sql);
            }
            // Si es igual a jueves
            else if(strcmp($day, $dayTwo) === 0) {
                // Recorrer los días necesarios para la siguiente clase
                date_modify($updatedStart, "+4 days");
                date_modify($updatedEnd, "+4 days");
                
                // Updatear inicio fecha
                $start_db = date_format($updatedStart, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaInicio = '$start_db' WHERE id = $idActividad ";
                // Guardar fecha updateada
                saveMoves($bdd,$sql);

                // Updatear fin fecha
                $end_db = date_format($updatedEnd, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaFin = '$end_db' WHERE id = $idActividad ";
                // Guardar fecha updateada
                saveMoves($bdd,$sql);
            }
        }
        else if((($start == $currentStart) == true) && $id != $finalId){
            // Modificar la fecha
            $updatedStart = date_create($start);
            $updatedEnd = date_create($end);
            // Obtener el día en el que está el evento y saber si es lunes o jueves
            $day = date_format($updatedStart, 'l');
            // Si es igual a lunes
            if(strcmp($day, $dayOne) === 0) {
                // Recorrer los días necesarios para la siguiente clase
                date_modify($updatedStart, "+3 days");
                date_modify($updatedEnd, "+3 days");
                
                // Updatear inicio fecha
                $start_db = date_format($updatedStart, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaInicio = '$start_db' WHERE id = $idActividad ";
                // Guardar fecha inicio updateada
                saveMoves($bdd,$sql);
                
                // Updatear fin fecha
                $end_db = date_format($updatedEnd, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaFin = '$end_db' WHERE id = $idActividad ";
                // Guardar fecha updateada
                saveMoves($bdd,$sql);
            }
            // Si es igual a jueves
            else if(strcmp($day, $dayTwo) === 0) {
                // Recorrer los días necesarios para la siguiente clase
                date_modify($updatedStart, "+4 days");
                date_modify($updatedEnd, "+4 days");
                
                // Updatear inicio fecha
                $start_db = date_format($updatedStart, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaInicio  = '$start_db' WHERE id = $idActividad ";
                // Guardar fecha updateada
                saveMoves($bdd,$sql);

                // Updatear fin fecha
                $end_db = date_format($updatedEnd, 'Y-m-d H:i:s');
                $sql = "UPDATE actividad SET fechaFin = '$end_db' WHERE id = $idActividad ";
                // Guardar fecha updateada
                saveMoves($bdd,$sql);
            }
        }
    }
    // No borrar ya que es importante, sino no funciona lo de mover todos los actividad
    mysqli_free_result($sth); 
    // Cerrar conexión a base de datos
    disconnect($bdd);
}
function saveMoves($bdd,$sql){
    $query = $bdd->prepare( $sql );
    if ($query == false){
        print_r($bdd->errorInfo());
        die ('Error al preparar');
    }
    $sth = $query->execute();
    if ($sth == false) {
        print_r($query->errorInfo());
        die ('Error al ejecutar');
    }
}
function getIdEvent($db){
    // Especificación del SQL query
    $query_2='SELECT * FROM actividad ORDER BY idActividad DESC LIMIT 1';
     // Ejecución del query, regresa el identificador del grupo
    $result = $db->query($query_2);
    $row = mysqli_fetch_array($result, MYSQLI_BOTH);

    return $row["id"];
}
?>
