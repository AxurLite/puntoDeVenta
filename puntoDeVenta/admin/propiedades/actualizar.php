

<main>
    <h1>Actualizar</h1>


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
            <select>
                <option value="1">Administrador</option>
                <option value="2">Gerente</option>
                <option value="3">Vendedor</option>
            </select>

            <label for="imagen">Imagen:</label>
            <input type="file" id="imagen" accept="image/jpeg , image/png">

        </fieldset>
        <input type="submit" value="Crear usuario" >
    </form>
</main>
