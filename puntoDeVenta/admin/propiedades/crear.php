<?php
require_once '../../includes/funciones.php';
incluirTemplate('headerIframe');
incluirTemplate("error");
//Conexion a base de datos
require_once INCLUDES_URL . "/config/database.php";
$db = conectarDB();

//Consulta de vendedores

$queryGetVendedores = "SELECT * FROM puesto";

$result = mysqli_query($db, $queryGetVendedores);

//Arreglo con mensaje de errores.
$errors = [];

$nombreCompleto = "";
$apellidoPaterno = "";
$apellidoMaterno = "";
$nombreUsuario = "";
$contrasena = "";
$idPuesto = "";
$correoElectronico = "";

$calleNumero = "";
$colonia = "";
$codigoPostal = "";
$municipioAlcaldia = "";
$estado = "";
$pais = "";

//TODO visibilidad de SUPERGLOBAL $_POST
//    echo "<pre>";
//    var_dump($_POST);
//    echo "</pre>";
//    echo "<pre>";
//    var_dump($_FILES);
//    echo "</pre>";

//TODO TEST SANITIZER
// $var= filter_var($var,FILTER_SANITIZE_EMAIL);


//Ejecución pos-formulario.
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $nombreCompleto = mysqli_real_escape_string($db, strtoupper($_POST["nombreCompleto"]));
    $apellidoPaterno = mysqli_real_escape_string($db, strtoupper($_POST["apellidoPaterno"]));
    $apellidoMaterno = mysqli_real_escape_string($db, strtoupper($_POST["apellidoMaterno"]));
    $nombreUsuario = mysqli_real_escape_string($db, $_POST["nombreUsuario"]);
    $contrasena = mysqli_real_escape_string($db, $_POST["contrasena"]);
    $idPuesto = mysqli_real_escape_string($db, $_POST["idPuesto"]);
    $correoElectronico = mysqli_real_escape_string($db, strtoupper($_POST["correoElectronico"]));

    $calleNumero = mysqli_real_escape_string($db, strtoupper($_POST["calleNumero"]));
    $colonia = mysqli_real_escape_string($db, strtoupper($_POST["colonia"]));
    $codigoPostal = mysqli_real_escape_string($db, strtoupper($_POST["codigoPostal"]));
    $municipioAlcaldia = mysqli_real_escape_string($db, strtoupper($_POST["municipioAlcaldia"]));
    $estado = mysqli_real_escape_string($db, strtoupper($_POST["estado"]));
    $pais = mysqli_real_escape_string($db, strtoupper($_POST["pais"]));

    $fechaCreacion = mysqli_real_escape_string($db, date("Y-m-d"));
    $imagen = $_FILES['imagen'];

//TODO visibilidad de SUPERGLOBAL $_FILE
//    echo "<pre>";
//    var_dump($imagen['size']);
//    echo "</pre>";


    //TODO cambiar 'ADMINISTRADOR por $idPuesto'
    $querySetUserData = "CALL AgregarUsuario('$nombreUsuario','$nombreCompleto','$apellidoMaterno','$apellidoPaterno','$contrasena','$calleNumero','$colonia'
    ,'$codigoPostal','$municipioAlcaldia','$estado','$pais','Administrador','$correoElectronico')";

    var_dump($querySetUserData);


//Errores
    if (!$nombreCompleto) {
        $errors[] = "Debes ingresar tu nombre completo.";
    }
    if (!$apellidoPaterno) {
        $errors[] = "Debes ingresar tu apellido paterno.";
    }
    if (!$apellidoMaterno) {
        $errors[] = "Debes ingresar tu apellido materno.";
    }
    if (!$nombreUsuario) {
        $errors[] = "Debes ingresar tu nombre de usuario.";
    }
    if (!$contrasena) {
        $errors[] = "Debes ingresar tu constraseña.";
    }
    if (!$correoElectronico) {
        $errors[] = "Debes ingresar tu correo electronico valido.";
    }
    if (!$idPuesto) {
        $errors[] = "Seleciona un puesto para el usuario.";
    }
    if (!$imagen['name'] || $imagen['error']) {
        $errors[] = "La imagen de usuario es requerida.";
    }
    if (!$calleNumero) {
        $errors[] = "Debes ingresar la información de tu domicilio.";
    }
    if (!$colonia) {
        $errors[] = "Debes ingresar el nombre tu colonia.";
    }
    if (!$codigoPostal) {
        $errors[] = "Debes ingresar tu código postal.";
    }
    if (!$municipioAlcaldia) {
        $errors[] = "Debes ingresar tu alcaldia.";
    }
    if (!$estado) {
        $errors[] = "Debes ingresar tu estado de residencia.";
    }
    if (!$pais) {
        $errors[] = "Debes ingresar tu pais de residencia.";
    }
    if (!$idPuesto) {
        $errors[] = "Seleciona un puesto para el usuario.";
    }
    if ($imagen['size'] > 2000000) {
        $errors[] = "El tamaño de la imagen no puede ser mayor a 2 MB.";
    }


    if (empty($errors)) {
        $insert = mysqli_query($db, $querySetUserData);

        if ($insert) {

            //TODO Cambiar redirección despues de completar la creacion
            header("Location: ../../index.php");

        }
    } else {

        foreach ($errors as $error) {
            echo "<pre>";
            echo $error;
            echo "</pre>";

        }
    }


}
?>

<main>
    <form method="POST" action="crear.php" enctype="multipart/form-data" class="formulario">
        <fieldset>
            <legend>Información usuario</legend>
            <div class="contenedor-campos">
                <div class="campos">
                    <label for="nombreCompleto">Nombre(s):</label>
                    <input type="text" id="nombreCompleto" name="nombreCompleto" value=<?php echo $nombreCompleto ?>>
                </div>
                <div class="campos">
                    <label for="apellidoPaterno">Apellido paterno:</label>
                    <input type="text" id="apellidoPaterno" name="apellidoPaterno" value=<?php echo $apellidoPaterno ?>>
                </div>
                <div class="campos">
                    <label for="apellidoMaterno">Apellido materno:</label>
                    <input type="text" id="apellidoMaterno" name="apellidoMaterno" value=<?php echo $apellidoMaterno ?>>
                </div>
                <div class="campos">
                    <label for="edad">Edad:</label>
                    <input type="text" id="edad" name="edad">
                </div>
                <div class="campos">
                    <label for="celular">Celular:</label>
                    <input type="tel" id="celular" name="celular">
                </div>
                <div class="campos">
                    <label for="telefono">Telefono de emergencia:</label>
                    <input type="tel" id="telefono" name="telefono">
                </div>
                <div class="campos correo">
                    <label for="correoElectronico">Correo electronico:</label>
                    <input type="email"  id="correoElectronico" name="correoElectronico" placeholder="email@email.com"
                           value=<?php echo $correoElectronico ?>>
                </div>
            </div>
        </fieldset>

        <fieldset>
                <legend>Información de domicilio</legend>
            <div class="contenedor-campos">
                <div class="campos">
                    <label for="calleNumero">Calle y número exterior:</label>
                    <input type="text" id="calleNumero" name="calleNumero" value=<?php echo $calleNumero ?>>
                </div>
                <div class="campos">
                    <label for="colonia">Colonia:</label>
                    <input type="text" id="colonia" name="colonia" value=<?php echo $colonia ?>>
                </div>
                <div class="campos">
                    <label for="codigoPostal">Código postal:</label>
                    <input type="text" id="codigoPostal" name="codigoPostal" value=<?php echo $codigoPostal ?>>
                </div>
                <div class="campos">
                    <label for="municipioAlcaldia">Alcaldía:</label>
                    <input type="text" id="municipioAlcaldia" name="municipioAlcaldia" value=<?php echo $municipioAlcaldia ?>>
                </div>
                <div class="campos">
                    <label for="estado">Estado:</label>
                    <input type="text" id="estado" name="estado" value=<?php echo $estado ?>>
                </div>
                <div class="campos">
                    <label for="pais">País:</label>
                    <input type="text" id="pais" name="pais" value=<?php echo $pais ?>>
                </div>
            </div>


        </fieldset>

        <fieldset>
            <legend>Información de puesto</legend>
                    <div class="campos">
                        <label for="nombreUsuario">Nombre de usuario:</label>
                        <input type="text" id="nombreUsuario" name="nombreUsuario" value=<?php echo $nombreUsuario ?>>
                    </div>
                    <div class="campos">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" id="contrasena" name="contrasena">
                    </div>
                    <div class="campos">
                        <label>Puesto</label>

                        <select name="idPuesto">
                            <option>--Selecionar--</option>
                            <?php
                            while ($resultGetPuestos = mysqli_fetch_assoc($result)) { ?>
                                <option <?php echo $idPuesto === $resultGetPuestos['idPuesto'] ? 'selected' : ''; ?>

                                        value=<?php echo $resultGetPuestos['idPuesto'] ?>> <?php echo $resultGetPuestos['nombrePuesto'] ?> </option>

                            <?php } ?>

                        </select>
                    </div>
                    <div class="campos">
                        <label for="imagen">Imagen:</label>
                        <input type="file" id="imagen" accept="image/jpeg , image/png" name="imagen">
                    </div>
        </fieldset>

    <div class="input">
        <input type="submit" value="Crear usuario">
    </div>
    </form>
</main>
