<?php
require_once '../../includes/funciones.php';
incluirTemplate("headerIframe");
?>

<main>
    <h1>Borrar</h1>

    <form>

        <fieldset>
            <legend>Información usuario</legend>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" placeholder="Juan">

            <label for="apellidoPaterno">Apellido paterno:</label>
            <input type="text" id="apellidoPaterno" placeholder="Roblez">

            <label for="apellidoMaterno">Apellido materno:</label>
            <input type="text" id="apellidoMaterno" placeholder="Peréz">

            <label for="rol">Rol:</label>

            <label for="imagen">Imagen:</label>
            <input type="file" id="imagen" accept="image/jpeg , image/png">

        </fieldset>
        <input type="submit" value="Crear usuario" >
    </form>
</main>
<?php
incluirTemplate("footer");
?>
