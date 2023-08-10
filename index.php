<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Punto de Venta</title>
    <link href="css/normalize.css" rel="stylesheet">
    <link rel="preload" href="css/login/login.css" as="style"/>
    <link href="css/login/login.css" rel="stylesheet"/>
</head>
<body>
    <div class="Contenedor">
        <h1>Login</h1>
        <form id="Forma" name="Forma" method="post" autocomplete="off">
            <div class="Elemento">
                <label for="usuario">Usuario</label>
                <input type="text" id="usuario" name="usuario" required="true"/>
            </div>
            <div class="Elemento">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required="true"/>
            </div>
            <div class="Elemento">
            <input type="submit" value="Enviar">
            </div>
        </form>
    </div>
</body>
</html>