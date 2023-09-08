<?php
require_once '../../includes/funciones.php';
//TODO visibilidad de SUPERGLOBAL $_GET
//Mensaje de confirmación

$resultado = $_GET['resultado'];

?>
    <p class="boton-verde">
        <?php if ($resultado == 1) {
            echo "Usuario creado correctamente";
        } ?>
    </p>


<?php