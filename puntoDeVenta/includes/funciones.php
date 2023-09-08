<?php

require "app.php";

function incluirTemplate(string $nombre): void
{
    include TEMPLATES_URL . "/{$nombre}.php";
}


