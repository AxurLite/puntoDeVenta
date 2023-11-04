package com.empresa.puntodeventa;

import com.empresa.puntodeventa.service.UploadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PuntoDeVentaApplication implements CommandLineRunner {

    @Autowired
    UploadFileService uploadFileService;

    public static void main(String[] args) {
        SpringApplication.run(PuntoDeVentaApplication.class, args);
    }

    /**
     * Elimina el directorio imagenes asi como sus contenidos para la
     * inicialización del programa.
     */
    @Override
    public void run(String... args) throws Exception {

//        uploadFileService.deleteAll();
        uploadFileService.init();
    }
}
