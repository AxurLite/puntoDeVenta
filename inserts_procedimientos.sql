insert into PUESTO values ('VEN','Vendedor','Vendedor de productos',sysdate());
insert into PUESTO values ('ADM','Administrador','Administrador de productos',sysdate());
insert into PUESTO values ('GER','Gerente','Gerente de la tienda',sysdate());

DELIMITER //
CREATE PROCEDURE AgregarUsuario(
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
    
    set idCorreo1 = CONCAT('C',id_direccion);
    
    INSERT INTO CORREO_ELECTRONICO (idCorreo,correoElectronico,fechaCreacion,fechaModificacion)
    VALUES (idCorreo1,correoElectronico1,SYSDATE(),SYSDATE());
    
    SELECT idPuesto INTO puesto1 from PUESTO where nombrePuesto = nombrePuesto1;
    
    INSERT INTO USUARIO (nombreUsuario,nombreCompleto,apellidoMaterno,apellidoPaterno,contrasena,idDireccion
    ,idCorreo,idPuesto,fechaCreacion) VALUES (nombreUsuario1,nombreCompleto1,apellidoMaterno1,apellidoPaterno1,contrasena1,id_direccion1,
    idCorreo1,puesto1,sysdate());
END //
DELIMITER ;