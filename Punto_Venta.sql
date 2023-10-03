-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema b_abarrotes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema b_abarrotes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `b_abarrotes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `b_abarrotes` ;

-- -----------------------------------------------------
-- Table `b_abarrotes`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`direccion` (
  `idDireccion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `calleNumero` VARCHAR(150) NULL DEFAULT NULL,
  `colonia` VARCHAR(80) NULL DEFAULT NULL,
  `codigoPostal` VARCHAR(10) NULL DEFAULT NULL,
  `municipioAlcaldia` VARCHAR(80) NULL DEFAULT NULL,
  `estado` VARCHAR(80) NULL DEFAULT NULL,
  `pais` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`correoelectronico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`correoelectronico` (
  `idCorreo` VARCHAR(500) NOT NULL,
  `correoElectronico` VARCHAR(150) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaModificacion` DATE NOT NULL,
  PRIMARY KEY (`idCorreo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`empresa` (
  `idEmpresa` INT NOT NULL,
  `nombreEmpresa` VARCHAR(150) NOT NULL,
  `id_Direccion` INT UNSIGNED NULL DEFAULT NULL,
  `numTelefonico` INT NULL DEFAULT NULL,
  `id_Correo` VARCHAR(500) NULL DEFAULT NULL,
  `RFC` VARCHAR(30) NULL DEFAULT NULL,
  `sitioWeb` VARCHAR(100) NULL DEFAULT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  INDEX `id_Direccion` (`id_Direccion` ASC) VISIBLE,
  INDEX `id_Correo` (`id_Correo` ASC) VISIBLE,
  CONSTRAINT `empresa_ibfk_1`
    FOREIGN KEY (`id_Direccion`)
    REFERENCES `b_abarrotes`.`direccion` (`idDireccion`),
  CONSTRAINT `empresa_ibfk_2`
    FOREIGN KEY (`id_Correo`)
    REFERENCES `b_abarrotes`.`correoelectronico` (`idCorreo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `idEmpresa` INT NOT NULL,
  `sitioWeb` VARCHAR(100) NULL DEFAULT NULL,
  `contactoProveedor` VARCHAR(50) NULL DEFAULT NULL,
  `idCorreo` VARCHAR(500) NULL DEFAULT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `idEmpresa` (`idEmpresa` ASC) VISIBLE,
  INDEX `idCorreo` (`idCorreo` ASC) VISIBLE,
  CONSTRAINT `proveedor_ibfk_1`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `b_abarrotes`.`empresa` (`idEmpresa`),
  CONSTRAINT `proveedor_ibfk_2`
    FOREIGN KEY (`idCorreo`)
    REFERENCES `b_abarrotes`.`correoelectronico` (`idCorreo`)
    ON DELETE CASCADE,
  CONSTRAINT `proveedor_ibfk_3`
    FOREIGN KEY (`idCorreo`)
    REFERENCES `b_abarrotes`.`correoelectronico` (`idCorreo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`facturas` (
  `idOperacionf` INT NOT NULL,
  `factura` VARCHAR(150) NOT NULL,
  `fechaCaptura` DATE NOT NULL,
  `idProveedor` INT NULL DEFAULT NULL,
  `monto` FLOAT NOT NULL,
  PRIMARY KEY (`idOperacionf`),
  INDEX `idProveedor` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `facturas_ibfk_1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `b_abarrotes`.`proveedor` (`idProveedor`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`marcasproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`marcasproducto` (
  `idMarcaProducto` VARCHAR(10) NOT NULL,
  `nombreMarca` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idMarcaProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`producto` (
  `idProducto` VARCHAR(10) NOT NULL,
  `idMarcaProducto` VARCHAR(10) NULL DEFAULT NULL,
  `unidadProducto` VARCHAR(10) NULL DEFAULT NULL,
  `precioVenta` FLOAT NOT NULL,
  `precioCompra` FLOAT NOT NULL,
  `IVA` VARCHAR(10) NULL DEFAULT NULL,
  `nivelOrden` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `idMarcaProducto` (`idMarcaProducto` ASC) VISIBLE,
  CONSTRAINT `producto_ibfk_1`
    FOREIGN KEY (`idMarcaProducto`)
    REFERENCES `b_abarrotes`.`marcasproducto` (`idMarcaProducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`adminproductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`adminproductos` (
  `idMovimiento` VARCHAR(10) NOT NULL,
  `idProducto` VARCHAR(10) NOT NULL,
  `fechaMovimiento` DATE NOT NULL,
  `tipoTransaccion` VARCHAR(50) NOT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `precioTransaccion` FLOAT NOT NULL,
  `idOperacionf` INT NULL DEFAULT NULL,
  `IVA` VARCHAR(10) NULL DEFAULT NULL,
  `existenciasProductos` INT NOT NULL,
  PRIMARY KEY (`idMovimiento`),
  INDEX `idOperacionf` (`idOperacionf` ASC) VISIBLE,
  INDEX `idProducto` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `adminproductos_ibfk_1`
    FOREIGN KEY (`idOperacionf`)
    REFERENCES `b_abarrotes`.`facturas` (`idOperacionf`),
  CONSTRAINT `adminproductos_ibfk_2`
    FOREIGN KEY (`idProducto`)
    REFERENCES `b_abarrotes`.`producto` (`idProducto`)
    ON DELETE CASCADE,
  CONSTRAINT `adminproductos_ibfk_3`
    FOREIGN KEY (`idProducto`)
    REFERENCES `b_abarrotes`.`producto` (`idProducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`pventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`pventa` (
  `idPuntoVenta` INT NOT NULL,
  `nombrePuntoventa` VARCHAR(100) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idPuntoVenta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`puesto` (
  `idPuesto` VARCHAR(10) NOT NULL,
  `nombrePuesto` VARCHAR(150) NOT NULL,
  `descripcionPuesto` VARCHAR(250) NULL DEFAULT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`usuario` (
  `idUsuario` INT NOT NULL DEFAULT '1',
  `nombreUsuario` VARCHAR(150) NOT NULL,
  `nombreCompleto` VARCHAR(80) NOT NULL,
  `apellidoMaterno` VARCHAR(80) NULL DEFAULT NULL,
  `apellidoPaterno` VARCHAR(80) NULL DEFAULT NULL,
  `contrasena` VARCHAR(80) NULL DEFAULT NULL,
  `idDireccion` INT UNSIGNED NULL DEFAULT NULL,
  `idCorreo` VARCHAR(500) NULL DEFAULT NULL,
  `idPuesto` VARCHAR(10) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaNacimiento` DATE NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `contrasena` (`contrasena` ASC) VISIBLE,
  INDEX `idDireccion` (`idDireccion` ASC) VISIBLE,
  INDEX `idPuesto` (`idPuesto` ASC) VISIBLE,
  INDEX `idCorreo` (`idCorreo` ASC) VISIBLE,
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`idDireccion`)
    REFERENCES `b_abarrotes`.`direccion` (`idDireccion`),
  CONSTRAINT `usuario_ibfk_2`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `b_abarrotes`.`puesto` (`idPuesto`),
  CONSTRAINT `usuario_ibfk_3`
    FOREIGN KEY (`idCorreo`)
    REFERENCES `b_abarrotes`.`correoelectronico` (`idCorreo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`ticket` (
  `idTicket` VARCHAR(150) NOT NULL,
  `numTicket` VARCHAR(150) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `idPuntoVenta` INT NULL DEFAULT NULL,
  `montoTotal` FLOAT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `idPuntoVenta` (`idPuntoVenta` ASC) VISIBLE,
  INDEX `idUsuario` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `ticket_ibfk_1`
    FOREIGN KEY (`idPuntoVenta`)
    REFERENCES `b_abarrotes`.`pventa` (`idPuntoVenta`),
  CONSTRAINT `ticket_ibfk_2`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `b_abarrotes`.`usuario` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`dventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`dventa` (
  `idTicket` VARCHAR(150) NOT NULL,
  `idProducto` VARCHAR(10) NOT NULL,
  `precioProducto` FLOAT NULL DEFAULT NULL,
  `descProducto` FLOAT NULL DEFAULT NULL,
  `IVA` VARCHAR(10) NULL DEFAULT NULL,
  `descIVA` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `idProducto` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `dventa_ibfk_1`
    FOREIGN KEY (`idTicket`)
    REFERENCES `b_abarrotes`.`ticket` (`idTicket`),
  CONSTRAINT `dventa_ibfk_2`
    FOREIGN KEY (`idProducto`)
    REFERENCES `b_abarrotes`.`producto` (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`provedoresproductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`provedoresproductos` (
  `idProveedor` INT NOT NULL,
  `idProducto` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `idProducto` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `provedoresproductos_ibfk_1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `b_abarrotes`.`proveedor` (`idProveedor`),
  CONSTRAINT `provedoresproductos_ibfk_2`
    FOREIGN KEY (`idProducto`)
    REFERENCES `b_abarrotes`.`producto` (`idProducto`),
  CONSTRAINT `provedoresproductos_ibfk_3`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `b_abarrotes`.`proveedor` (`idProveedor`),
  CONSTRAINT `provedoresproductos_ibfk_4`
    FOREIGN KEY (`idProducto`)
    REFERENCES `b_abarrotes`.`producto` (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b_abarrotes`.`telefonocon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`telefonocon` (
  `idContacto` VARCHAR(15) NOT NULL,
  `nombreContacto` VARCHAR(150) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `prioridad` VARCHAR(10) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idContacto`),
  INDEX `idUsuario` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `telefonocon_ibfk_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `b_abarrotes`.`usuario` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `b_abarrotes` ;

-- -----------------------------------------------------
-- Placeholder table for view `b_abarrotes`.`mostrar_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b_abarrotes`.`mostrar_usuario` (`ID_USUARIO` INT, `NOMBREUSUARIO` INT, `NOMBRE` INT, `APELLIDOPATERNO` INT, `APELLIDOMATERNO` INT, `NOMBRE_PUESTO` INT, `CALLENUMERO` INT, `COLONIA` INT, `MUNICIPIOALCALDIA` INT, `ESTADO` INT, `CP` INT, `PAIS` INT, `CORREO_ELECTRONICO` INT, `FECHA_NACIMIENTO` INT, `TELEFONO` INT, `NOMBRE_CONTACTO` INT, `TELEFONO_CONTACTO` INT);

-- -----------------------------------------------------
-- procedure AgregarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `b_abarrotes`$$
CREATE DEFINER=`P_VENTA`@`localhost` PROCEDURE `AgregarUsuario`(
    IN nombreUsuario1 varchar(150),
	IN nombreCompleto1 varchar(80),
	IN apellidoMaterno1 varchar(80),
	IN apellidoPaterno1 varchar(80),
    IN contrasena1 varchar(80),
    IN calleNumero1 varchar(150),
	IN colonia1 varchar(80),
	IN codigoPostal1 varchar(10),
	IN municipioAlcaldia1 varchar(80),
	IN estado1 varchar(80),
	IN pais1 varchar(50),
    IN nombrePuesto1 varchar(150),
    IN correoElectronico1 varchar(150)
)
BEGIN 
	DECLARE id_direccion1 INT;
    
    DECLARE idCorreo1 VARCHAR(150);
    
    DECLARE puesto1 varchar(10);
    
	INSERT INTO DIRECCION (calleNumero,colonia,codigoPostal,municipioAlcaldia,estado,pais)
	VALUES (calleNumero1,colonia1,codigoPostal1,municipioAlcaldia1,estado1,pais1);
    
    set id_direccion1 = LAST_INSERT_ID();
    
    set idCorreo1 = CONCAT('C',id_direccion1);
    
    INSERT INTO CORREO_ELECTRONICO (idCorreo,correoElectronico,fechaCreacion,fechaModificacion)
	VALUES (idCorreo1,correoElectronico1,SYSDATE(),SYSDATE());
    
    SELECT idPuesto INTO puesto1 from PUESTO where nombrePuesto = nombrePuesto1;
    
    INSERT INTO USUARIO (idUsuario,nombreUsuario,nombreCompleto,apellidoMaterno,apellidoPaterno,contrasena,idDireccion
    ,idCorreo,idPuesto,fechaCreacion) VALUES (id_direccion1,nombreUsuario1,nombreCompleto1,apellidoMaterno1,apellidoPaterno1,contrasena1,id_direccion1,
    idCorreo1,puesto1,sysdate());
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AgregarUsuarioconID
-- -----------------------------------------------------

DELIMITER $$
USE `b_abarrotes`$$
CREATE DEFINER=`P_VENTA`@`localhost` PROCEDURE `AgregarUsuarioconID`(
    IN nombreUsuario1 varchar(150),
	IN nombreCompleto1 varchar(80),	
	IN apellidoPaterno1 varchar(80),
    IN apellidoMaterno1 varchar(80),
    IN contrasena1 varchar(80),
    IN calleNumero1 varchar(150),
	IN colonia1 varchar(80),
	IN codigoPostal1 varchar(10),
	IN municipioAlcaldia1 varchar(80),
	IN estado1 varchar(80),
	IN pais1 varchar(50),
    IN idpuesto1 varchar(10),
    IN correoElectronico1 varchar(150),
    IN fecha_nacimiento1 date ,
    IN telefono1 varchar(15),
    IN telefonoemer varchar(15),
    IN nombreemer varchar(200)
)
BEGIN 
	DECLARE id_direccion1 INT;
    DECLARE idCorreo1 VARCHAR(150);  
    DECLARE idContacto1 VARCHAR(15);
	INSERT INTO DIRECCION (calleNumero,colonia,codigoPostal,municipioAlcaldia,estado,pais)
	VALUES (calleNumero1,colonia1,codigoPostal1,municipioAlcaldia1,estado1,pais1);
    
    set id_direccion1 = LAST_INSERT_ID();
    set idCorreo1 = CONCAT('C',id_direccion1);
    set idContacto1 = CONCAT('C',id_direccion1);
    
    INSERT INTO CORREOELECTRONICO (idCorreo,correoElectronico,fechaCreacion,fechaModificacion)
	VALUES (idCorreo1,correoElectronico1,SYSDATE(),SYSDATE());  
	INSERT INTO USUARIO (idUsuario,nombreUsuario,nombreCompleto,apellidoMaterno,apellidoPaterno,contrasena,idDireccion
    ,idCorreo,idPuesto,fechaCreacion,fechaNacimiento,telefono) VALUES (id_direccion1,nombreUsuario1,nombreCompleto1,apellidoMaterno1,apellidoPaterno1,contrasena1,id_direccion1,
    idCorreo1,idpuesto1,sysdate(),fecha_nacimiento1,telefono1);
	INSERT INTO TELEFONOCON (idContacto,nombreContacto,telefono,fechaCreacion,prioridad
    ,idUsuario)
	VALUES (idContacto1,nombreemer,telefonoemer,SYSDATE(),'P',LAST_INSERT_ID()); 
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure EliminarTodosDatos
-- -----------------------------------------------------

DELIMITER $$
USE `b_abarrotes`$$
CREATE DEFINER=`P_VENTA`@`localhost` PROCEDURE `EliminarTodosDatos`(

)
BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE FROM TELEFONOCON;
DELETE FROM CORREOELECTRONICO;
DELETE FROM DIRECCION;
DELETE FROM USUARIO ;
SET SQL_SAFE_UPDATES = 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure EliminarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `b_abarrotes`$$
CREATE DEFINER=`P_VENTA`@`localhost` PROCEDURE `EliminarUsuario`(
    IN idUsuario1 int )
BEGIN 
	DECLARE idCorreo1 VARCHAR(500);
    DECLARE idDireccion1 int;
    select idCorreo,idDireccion into idCorreo1,idDireccion1
	from usuario where idUsuario = idUsuario1;
    delete from usuario where idUsuario = idUsuario1;
    delete from direccion where idDireccion = idDireccion1;
    delete from correo_electronico where idCorreo = idCorreo1;
    delete from telefonocon where idContacto = idCorreo1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `b_abarrotes`.`mostrar_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `b_abarrotes`.`mostrar_usuario`;
USE `b_abarrotes`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`P_VENTA`@`localhost` SQL SECURITY DEFINER VIEW `b_abarrotes`.`mostrar_usuario` AS select `us`.`idUsuario` AS `ID_USUARIO`,`us`.`nombreUsuario` AS `NOMBREUSUARIO`,`us`.`nombreCompleto` AS `NOMBRE`,`us`.`apellidoPaterno` AS `APELLIDOPATERNO`,`us`.`apellidoMaterno` AS `APELLIDOMATERNO`,`pue`.`nombrePuesto` AS `NOMBRE_PUESTO`,`dir`.`calleNumero` AS `CALLENUMERO`,`dir`.`colonia` AS `COLONIA`,`dir`.`municipioAlcaldia` AS `MUNICIPIOALCALDIA`,`dir`.`estado` AS `ESTADO`,`dir`.`codigoPostal` AS `CP`,`dir`.`pais` AS `PAIS`,`corr`.`correoElectronico` AS `CORREO_ELECTRONICO`,`us`.`fechaNacimiento` AS `FECHA_NACIMIENTO`,`us`.`telefono` AS `TELEFONO`,`telc`.`nombreContacto` AS `NOMBRE_CONTACTO`,`telc`.`telefono` AS `TELEFONO_CONTACTO` from ((((`b_abarrotes`.`usuario` `us` join `b_abarrotes`.`direccion` `dir`) join `b_abarrotes`.`telefonocon` `telc`) join `b_abarrotes`.`correoelectronico` `corr`) join `b_abarrotes`.`puesto` `pue`) where ((`us`.`idDireccion` = `dir`.`idDireccion`) and (`us`.`idCorreo` = `corr`.`idCorreo`) and (`us`.`idUsuario` = `telc`.`idUsuario`) and (`us`.`idPuesto` = `pue`.`idPuesto`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
