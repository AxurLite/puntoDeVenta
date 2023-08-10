<?php
require_once '../../includes/funciones.php';
error_reporting(E_ALL);
ini_set("display_errors",1);
function customErrorHandler($errno,$errstr,$errfile,$errline){
    echo "Error [$errno] $errstr - $errfile:$errline";
}
set_error_handler("customErrorHandler");

incluirTemplate("headerIframe");

function conectarDB(): mysqli
{
    $db = mysqli_connect('localhost', 'P_VENTA', 'venta1234', 'B_ABARROTES');

    if (!$db) {
        echo "No se pudo realizar la conexion a la base de datos";
        exit;
    }

    return $db;
}

$db = conectarDB();


if ($_SERVER["REQUEST_METHOD"] === "POST") {


    $nombreCompleto = $_POST["nombreCompleto"];
    $apellidoPaterno = $_POST["apellidoPaterno"];
    $apellidoMaterno = $_POST["apellidoMaterno"];
    $nombreUsuario = $_POST["nombreUsuario"];
    $contrasena = $_POST["contrasena"];
    $idPuesto = $_POST["idPuesto"];
    $correoElectronico = $_POST["correoElectronico"];
    $fechaCreacion = date("Y-m-d");

    $query = "INSERT INTO usuario (nombreCompleto,apellidoPaterno,apellidoMaterno,nombreUsuario,contrasena,idPuesto,fechaCreacion) 
                VALUES ('$nombreCompleto','$apellidoPaterno','$apellidoMaterno','$nombreUsuario','$contrasena','$idPuesto','$fechaCreacion')";
    var_dump($query);
    $errores = [];

    if (!$nombreCompleto) {
        $errores[] = "Debes ingresar tu nombre completo.";
    }
    if (!$apellidoPaterno) {
        $errores[] = "Debes ingresar tu apellido paterno.";
    }
    if (!$apellidoMaterno) {
        $errores[] = "Debes ingresar tu apellido materno.";
    }
    if (!$nombreUsuario) {
        $errores[] = "Debes ingresar tu nombre de usuario.";
    }
    if (!$contrasena) {
        $errores[] = "Debes ingresar tu constraseña.";
    }
    if (!$correoElectronico) {
        $errores[] = "Debes ingresar tu correo electronico.";
    }
    if (!$idPuesto) {
        $errores[] = "Seleciona un puesto para el usuario.";
    }

    if (empty($errores)) {
        $insert = mysqli_query($db, $query);

        if ($insert) {
            echo "Insert Correcto en base de datos";
        }
    } else {

        foreach ($errores as $error) {
            echo "<pre>";
            echo $error;
            echo "</pre>";

        }
    }


}


?>



<main>
    <h1>Crear nuevo usuario</h1>
    <form method="POST" action="../propiedades/crear.php">

        <fieldset>
            <legend>Información usuario</legend>

            <label for="nombreCompleto">Nombre(s):</label>
            <input type="text" id="nombreCompleto" name="nombreCompleto">

            <label for="apellidoPaterno">Apellido paterno:</label>
            <input type="text" id="apellidoPaterno" name="apellidoPaterno">

            <label for="apellidoMaterno">Apellido materno:</label>
            <input type="text" id="apellidoMaterno" name="apellidoMaterno">

            <label for="nombreUsuario">Nombre de usuario:</label>
            <input type="text" id="nombreUsuario" name="nombreUsuario">

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena">

            <label for="correoElectronico">Correo electronico:</label>
            <input type="email" id="correoElectronico" name="correoElectronico" placeholder="email@email.com">

            <legend>Puesto</legend>

            <select name="idPuesto">
                <option>--Selecionar--</option>
                <option value="1">Administrador</option>
                <option value="2">Gerente</option>
                <option value="3">Vendedor</option>
            </select>

            <label for="imagen">Imagen:</label>
            <input type="file" id="imagen" accept="image/jpeg , image/png">

        </fieldset>

        <input type="submit" value="Crear usuario">
    </form>
</main>
<?php
incluirTemplate("footer");
?>