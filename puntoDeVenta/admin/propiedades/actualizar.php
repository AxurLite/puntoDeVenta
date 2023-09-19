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

        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-search" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"
        id="menu6">
            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
            <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
            <path d="M21 21l-6 -6" />
        </svg>

    <div class="lupahi" id="des6">
    <form class="formulario">
    <fieldset>
        <legend>Filtros</legend>
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
            <div class="campos ">
                <label for="correoElectronico">Correo electronico:</label>
                <input type="email"  id="correoElectronico" name="correoElectronico" placeholder="email@email.com"
                       value=<?php echo $correoElectronico ?>>
            </div>
        </div>
    </fieldset>

    <div class="input">
        <input type="submit" value="Buscar">
    </div>
    </form>
    </div>






    <div class="cen">
    <table class="tabla">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>Usuario</th>
        <th>Correo</th>
        <th>Acciones</th>
    </tr>
    <tr>
        <td>1</td>
        <td>JUAN ALEJANDRO</td>
        <td>ESCUTIA GARCIA</td>
        <td>JUANITO</td>
        <td>HOLASUPTM@GMAIL.COM</td>
        <td>
            <div class="edit">
            <a href="#" class="boton-amarillo">Actualizar</a>
            <a href="#" class="boton-rojo">Eliminar</a>
            </div>
        </td>
    </tr>

        <td>1</td>
        <td>JUAN ALEJANDRO</td>
        <td>ESCUTIA GARCIA</td>
        <td>JUANITO</td>
        <td>HOLASUPTM@GMAIL.COM</td>
        <td>
            <div class="edit">
                <a href="#" class="boton-amarillo">Actualizar</a>
                <a href="#" class="boton-rojo">Eliminar</a>
            </div>
        </td>
        </tr>

        <td>1</td>
        <td>JUAN ALEJANDRO</td>
        <td>ESCUTIA GARCIA</td>
        <td>JUANITO</td>
        <td>HOLASUPTM@GMAIL.COM</td>
        <td>
            <div class="edit">
                <a href="#" class="boton-amarillo">Actualizar</a>
                <a href="#" class="boton-rojo">Eliminar</a>
            </div>
        </td>
        </tr>

        <td>1</td>
        <td>JUAN ALEJANDRO</td>
        <td>ESCUTIA GARCIA</td>
        <td>JUANITO</td>
        <td>HOLASUPTM@GMAIL.COM</td>
        <td>
            <div class="edit">
                <a href="#" class="boton-amarillo">Actualizar</a>
                <a href="#" class="boton-rojo">Eliminar</a>
            </div>
        </td>
        </tr>
    </table>



    <script>
        document.getElementById("menu6").onclick = function() {
            myFuction6()
        };

        function myFuction6() {
            document.getElementById("des6").classList.toggle("show");
        }
    </script>



</main>

