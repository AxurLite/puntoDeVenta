<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

function customErrorHandler($errno, $errstr, $errfile, $errline): void
{
    echo "Error [$errno] $errstr - $errfile:$errline";
}

set_error_handler("customErrorHandler");
?>