<?php
require_once '../../includes/funciones.php';
require_once INCLUDES_URL . "/config/database.php";
incluirTemplate("headerIframe");
incluirTemplate("error");
//Conexion a base de datos
$conexion = new connector;
$db = $conexion->conectarDB(); // Obtener la conexión a la base de datos

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

    var_dump(mysqli_fetch_assoc(mysqli_query($db, $query)));

}


?>


<main>
    <table class="usuarios"
    <thead>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>Usuario</th>
        <th>Correo</th>
        <th>Acciones</th>
    </tr>
    </thead>

    <tbody>
    <tr>
        <td>1</td>
        <td>Juan</td>
        <td>Ortega Ramirez</td>
        <td>JUANRAM</td>
        <td>JUANRAM@GMAI.COM</td>
        <td>
            <a href="#" class="boton-amarillo">Actualizar</a>
            <a href="#" class="boton-rojo">Eliminar</a>
        </td>
    </tr>
    </tbody>
</main>