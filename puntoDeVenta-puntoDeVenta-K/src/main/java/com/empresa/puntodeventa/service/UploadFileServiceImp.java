package com.empresa.puntodeventa.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class UploadFileServiceImp implements UploadFileService {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    private final static String UPLOAD_FOLDER = "imagenes";

    @Override
    public Resource load(String filename) throws MalformedURLException {

        Path pathFoto = getPath(filename);
        logger.info("Path foto : " + pathFoto);
        Resource resource;

        resource = new UrlResource(pathFoto.toUri());
        if (!resource.exists() || !resource.isReadable()) {
            throw new RuntimeException("Error , no se ha podido cargar la imagen : " + pathFoto.toString());
        }
        return resource;
    }

    @Override
    public String copy(MultipartFile filename) throws IOException {

        String uniqueFilename = UUID.randomUUID().toString() + "_" + filename.getOriginalFilename();
        Path rootPath = getPath(uniqueFilename);
        logger.info("RootPath : " + rootPath);
        Files.copy(filename.getInputStream(), rootPath);

        return uniqueFilename;
    }

    @Override
    public boolean delete(String filename) {

        Path rootPath = getPath(filename);
        File archivo = rootPath.toFile();

        if (archivo.exists() && archivo.canRead()) {
            if (archivo.delete()) {
                return true;
            }
        }
        return false;
    }

    public Path getPath(String filename) {
        return Paths.get(UPLOAD_FOLDER).resolve(filename).toAbsolutePath();
    }


    @Override
    public void deleteAll() {
        FileSystemUtils.deleteRecursively(Paths.get(UPLOAD_FOLDER).toFile());

    }

    @Override
    public void init() throws IOException {
        Files.createDirectories((Paths.get(UPLOAD_FOLDER)));
    }
}
