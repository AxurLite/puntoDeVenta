
<div class="texto">
    <nav>
        <a href="../inicio/avipro.php" target="Inicio" id="link">Inicio</a>
        <div class="secciones" id="menu">
            <div class="Sub">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor"
                     class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/>
                </svg>
                <a>Administrador</a>
            </div>
            <div class="Despegable" id="des">
                <a href="../admin/propiedades/crear.php" target="Inicio">Crear Usuarios</a>
                <a href="../admin/propiedades/actualizar.php" target="Inicio">Baja de Usuarios</a>
                <a href="../admin/propiedades/index.php" target="Inicio">Config global</a>
            </div>
        </div>


        <div class="secciones" id="menu2">
            <div class="Sub">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor"
                     class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z"/>
                </svg>
                <a>Inventario</a>
            </div>

            <div class="Despegable" id="des2">
                <a href="#" target="Inicio">Alta</a>
                <a href="#" target="Inicio">Baja </a>
                <a href="#" target="Inicio">Actualizar</a>
                <a href="#" target="Inicio">Existencias</a>
            </div>
        </div>


        <div class="secciones" id="menu3">
            <div class="Sub">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z"/>
                </svg>
                <a>Ventas</a>
            </div>

            <div class="Despegable" id="des3">
                <a href="#" target="Inicio">Ventas</a>
                <a href="#" target="Inicio">Acceso a Caja</a>
                <a href="#" target="Inicio">Cierre parcial</a>
            </div>
        </div>


        <div class="secciones" id="menu4">
            <div class="Sub">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6a7.5 7.5 0 107.5 7.5h-7.5V6z"/>
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 10.5H21A7.5 7.5 0 0013.5 3v7.5z"/>
                </svg>
                <a>Informes</a>
            </div>

            <div class="Despegable" id="des4">
                <a href="#" target="Inicio">Cierre Total</a>
                <a href="#" target="Inicio">Reportes <br>de ventas</a>
                <a href="#" target="Inicio">Registros <br>de gastos</a>
                <a href="#" target="Inicio">Reportes <br>de ganancias</a>
            </div>
        </div>


    </nav>


    <span>
        <main>
            <iframe src="../inicio/avipro.php" name="Inicio"></iframe>
        </main>
    </span>
</div>



<script>

    document.getElementById("menu").onclick = function() {
        myFuction()
    };
    document.getElementById("menu2").onclick = function() {
        myFuction2()
    };
    document.getElementById("menu3").onclick = function() {
        myFuction3()
    };
    document.getElementById("menu4").onclick = function() {
        myFuction4()
    };
    document.getElementById("menu5").onclick = function() {
        myFuction5()
    };


    function myFuction() {
        document.getElementById("des").classList.toggle("show");
    }

    function myFuction2() {
        document.getElementById("des2").classList.toggle("show");
    }

    function myFuction3() {
        document.getElementById("des3").classList.toggle("show");
    }

    function myFuction4() {
        document.getElementById("des4").classList.toggle("show");
    }

    function myFuction5() {
        document.getElementById("des5").classList.toggle("show2");
    }

</script>