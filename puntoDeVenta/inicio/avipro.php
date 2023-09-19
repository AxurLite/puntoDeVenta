<?php
include "../includes/funciones.php";

incluirTemplate("headerIframe");
?>

<main>
    <div class="cen">
        <table class="tabla">
            <caption >Actividades</caption>
            <tr>
                <th class="der">Avisos Importantes</th>
                <th class="izq">Promociones a ofrecer</th>
            </tr>
            <tr>
                <td class="der">su ptm hoy tienes que recordar hacer limpieza</td>
                <td class="izq">su ptm hoy hay Chevez 2x1 en todas las marcas</td>

            </tr>

            <tr>
                <td class="der">su ptm hoy tienes que recordar hacer limpieza</td>
                <td class="izq">su ptm hoy hay Chevez 2x1 en todas las marcas</td>
            </tr>
            <tr>
                <td class="der">su ptm hoy tienes que recordar hacer limpieza</td>
                <td class="izq">su ptm hoy hay Chevez 2x1 en todas las marcas</td>
            </tr>
            <tr>
                <td class="der">su ptm hoy tienes que recordar hacer limpieza</td>
                <td class="izq">su ptm hoy hay Chevez 2x1 en todas las marcas</td>
            </tr>
            <tr>
                <td class="der">su ptm hoy tienes que recordar hacer limpieza</td>
                <td class="izq">su ptm hoy hay Chevez 2x1 en todas las marcas</td>
            </tr>
        </table>
    </div>

    <form method="POST" action="avipro.php" enctype="multipart/form-data" class="formulario">
        <fieldset>
            <legend>Mensajes</legend>
            <div class="contenedor-campos ">
                <div class="campos">
                    <label>Avisos:</label>
                    <textarea></textarea>
                </div>
                <div class="campos">
                    <label>Promociones:</label>
                    <textarea></textarea>
                </div>
            </div>
        </fieldset>
        <div class="input">
            <input type="submit" value="Crear Avisos">
        </div>
    </form>
</main>

</body>