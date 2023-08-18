-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema b_abarrotes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `b_abarrotes` ;

-- -----------------------------------------------------
-- Schema b_abarrotes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `b_abarrotes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
SHOW WARNINGS;
USE `b_abarrotes` ;

-- -----------------------------------------------------
-- Table `direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `direccion` (
  `idDireccion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `calleNumero` VARCHAR(150) NULL DEFAULT NULL,
  `colonia` VARCHAR(80) NULL DEFAULT NULL,
  `codigoPostal` VARCHAR(10) NULL DEFAULT NULL,
  `municipioAlcaldia` VARCHAR(80) NULL DEFAULT NULL,
  `estado` VARCHAR(80) NULL DEFAULT NULL,
  `pais` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `correo_electronico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `correo_electronico` (
  `idCorreo` VARCHAR(500) NOT NULL,
  `correoElectronico` VARCHAR(150) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaModificacion` DATE NOT NULL,
  PRIMARY KEY (`idCorreo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa` (
  `idEmpresa` INT NOT NULL,
  `nombreEmpresa` VARCHAR(150) NOT NULL,
  `id_Direccion` INT UNSIGNED NULL DEFAULT NULL,
  `numTelefonico` INT NULL DEFAULT NULL,
  `id_Correo` VARCHAR(500) NULL DEFAULT NULL,
  `RFC` VARCHAR(30) NULL DEFAULT NULL,
  `sitioWeb` VARCHAR(100) NULL DEFAULT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `idEmpresa` INT NOT NULL,
  `sitioWeb` VARCHAR(100) NULL DEFAULT NULL,
  `contactoProveedor` VARCHAR(50) NULL DEFAULT NULL,
  `idCorreo` VARCHAR(500) NULL DEFAULT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas` (
  `idOperacionf` INT NOT NULL,
  `factura` VARCHAR(150) NOT NULL,
  `fechaCaptura` DATE NOT NULL,
  `idProveedor` INT NULL DEFAULT NULL,
  `monto` FLOAT NOT NULL,
  PRIMARY KEY (`idOperacionf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `marcasproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marcasproducto` (
  `idMarcaProducto` VARCHAR(10) NOT NULL,
  `nombreMarca` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idMarcaProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` VARCHAR(10) NOT NULL,
  `idMarcaProducto` VARCHAR(10) NULL DEFAULT NULL,
  `unidadProducto` VARCHAR(10) NULL DEFAULT NULL,
  `precioVenta` FLOAT NOT NULL,
  `precioCompra` FLOAT NOT NULL,
  `IVA` VARCHAR(10) NULL DEFAULT NULL,
  `nivelOrden` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `adminproductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adminproductos` (
  `idMovimiento` VARCHAR(10) NOT NULL,
  `idProducto` VARCHAR(10) NOT NULL,
  `fechaMovimiento` DATE NOT NULL,
  `tipoTransaccion` VARCHAR(50) NOT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `precioTransaccion` FLOAT NOT NULL,
  `idOperacionf` INT NULL DEFAULT NULL,
  `IVA` VARCHAR(10) NULL DEFAULT NULL,
  `existenciasProductos` INT NOT NULL,
  PRIMARY KEY (`idMovimiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pventa` (
  `idPuntoVenta` INT NOT NULL,
  `nombrePuntoventa` VARCHAR(100) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idPuntoVenta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puesto` (
  `idPuesto` VARCHAR(10) NOT NULL,
  `nombrePuesto` VARCHAR(150) NOT NULL,
  `descripcionPuesto` VARCHAR(250) NULL DEFAULT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` INT NOT NULL,
  `nombreUsuario` VARCHAR(150) NOT NULL,
  `nombreCompleto` VARCHAR(80) NOT NULL,
  `apellidoMaterno` VARCHAR(80) NULL DEFAULT NULL,
  `apellidoPaterno` VARCHAR(80) NULL DEFAULT NULL,
  `contrasena` VARCHAR(80) NULL DEFAULT NULL,
  `idDireccion` INT UNSIGNED NULL DEFAULT NULL,
  `idCorreo` VARCHAR(500) NULL DEFAULT NULL,
  `idPuesto` VARCHAR(10) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE UNIQUE INDEX `contrasena` ON `usuario` (`contrasena` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ticket` (
  `idTicket` VARCHAR(150) NOT NULL,
  `numTicket` VARCHAR(150) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `idPuntoVenta` INT NULL DEFAULT NULL,
  `montoTotal` FLOAT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idTicket`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dventa` (
  `idTicket` VARCHAR(150) NOT NULL,
  `idProducto` VARCHAR(10) NOT NULL,
  `precioProducto` FLOAT NULL DEFAULT NULL,
  `descProducto` FLOAT NULL DEFAULT NULL,
  `IVA` VARCHAR(10) NULL DEFAULT NULL,
  `descIVA` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idTicket`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `provedoresproductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provedoresproductos` (
  `idProveedor` INT NOT NULL,
  `idProducto` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
USE `b_abarrotes` ;

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
SHOW WARNINGS;

-- -----------------------------------------------------
-- procedure EliminarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `b_abarrotes`$$
CREATE DEFINER=`P_VENTA`@`localhost` PROCEDURE `EliminarUsuario`(
    IN idUsuario1 int )
BEGIN 
	DECLARE idCorreo1 VARCHAR(500);
    delete from usuario where idUsuario = idUsuario1;
    delete from direccion where idDireccion = idUsuario1;
    set idCorreo1 = CONCAT('C',idUsuario1);
    delete from correo_electronico where idCorreo = idCorreo1;
END$$

DELIMITER ;
SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
