<?php

class connector
{
    function conectarDB(): mysqli
    {
        $db = mysqli_connect('localhost', 'P_VENTA', 'venta1234', 'B_ABARROTES');

        if (!$db) {
            echo "No se pudo realizar la conexión a la base de datos";
            exit;
        }

        return $db;
    }
}


