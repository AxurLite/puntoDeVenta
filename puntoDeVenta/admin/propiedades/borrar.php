<?php
require_once '../../includes/funciones.php';
incluirTemplate('headerIframe');
incluirTemplate("error");
//Conexion a base de datos
require_once INCLUDES_URL . "/config/database.php";
$db = conectarDB();
$queryGetVendedores = "SELECT * FROM puesto";
$result = mysqli_query($db, $queryGetVendedores);

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nombreUsuario = $_POST["nombreUsuario"];
    $nombreCompleto = $_POST["nombreCompleto"];
    $apellidoPaterno = $_POST["apellidoPaterno"];
    $apellidoMaterno = $_POST["apellidoMaterno"];
    $correoElectronico = $_POST["correoElectronico"];
    $idPuesto = $_POST["idPuesto"];
    $errors = [];


    $query = "SELECT * FROM usuario WHERE nombreUsuario LIKE '$nombreUsuario' 
                         OR nombreCompleto LIKE '$nombreCompleto' 
                         OR apellidoPaterno LIKE '$apellidoPaterno'
                         OR apellidoMaterno LIKE  '$apellidoMaterno'";


    var_dump(mysqli_fetch_assoc(mysqli_query($db,$query)));

}


?>


<main>
    <h1>Baja de usuario</h1>


    <form method="POST" action="borrar.php">

        <fieldset>
            <legend>Datos de busqueda</legend>

            <label for="nombreCompleto">Nombre(s):</label>
            <input type="text" id="nombreCompleto" name="nombreCompleto">

            <label for="apellidoPaterno">Apellido paterno:</label>
            <input type="text" id="apellidoPaterno" name="apellidoPaterno">

            <label for="apellidoMaterno">Apellido materno:</label>
            <input type="text" id="apellidoMaterno" name="apellidoMaterno">

            <label for="nombreUsuario">Nombre de usuario:</label>
            <input type="text" id="nombreUsuario" name="nombreUsuario">

            <label for="correoElectronico">Correo electronico:</label>
            <input type="email" id="correoElectronico" name="correoElectronico">

            <legend>Puesto</legend>

            <select name="idPuesto">
                <option>--Selecionar--</option>
                <?php
                while ($resultGetPuestos = mysqli_fetch_assoc($result)) { ?>
                    <option value=<?php echo $resultGetPuestos['idPuesto'] ?>> <?php echo $resultGetPuestos['nombrePuesto'] ?> </option>

                <?php } ?>

            </select>

        </fieldset>

        <input type="submit" value="Dar de baja">
    </form>
</main>