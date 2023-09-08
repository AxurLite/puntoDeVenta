<?php

function cargarImagen($db, $query, $imagen): void
{
//Validacion dir imagenes
    $carpetaImagenes = '../../includes/imagenes';

    if (!is_dir($carpetaImagenes)) {
        mkdir($carpetaImagenes);
    }

//Generar nombre unico

    $nombreImagen = md5(uniqid(rand(), true));

//Subir imagen

    move_uploaded_file($imagen['tmp_name'], $carpetaImagenes . "/$nombreImagen.jpg");

    $insert = mysqli_query($db, $query);
    if ($insert) {

//TODO Cambiar redirección despues de completar la creacion
        header("Location: index.php?resultado=1");

    }
}