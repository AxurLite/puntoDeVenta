
-- Creacion de base de datos
CREATE DATABASE IF NOT EXISTS B_ABARROTES;
CREATE USER IF NOT EXISTS P_VENTA@localhost IDENTIFIED BY 'venta1234';
GRANT CREATE ON B_ABARROTES.* TO P_VENTA@localhost;
FLUSH PRIVILEGES;
SHOW GRANTS FOR P_VENTA@localhost;
GRANT CREATE ON B_ABARROTES.* TO P_VENTA@localhost;
GRANT ALL PRIVILEGES ON B_ABARROTES.* TO P_VENTA@localhost;

-- Ejecutar despues de correr el programa por primera vez

USE B_ABARROTES;

INSERT INTO `b_abarrotes`.`puesto` (`idPuesto`, `descripcionPuesto`, `fechaCreacion`, `nombrePuesto`) VALUES ('ADM', 'Administrador', '2023-10-29', 'Vendedor');
INSERT INTO `b_abarrotes`.`puesto` (`idPuesto`, `descripcionPuesto`, `fechaCreacion`, `nombrePuesto`) VALUES ('VEN', 'Vendedor', '2023-10-29', 'Administrador');
INSERT INTO `b_abarrotes`.`puesto` (`idPuesto`, `descripcionPuesto`, `fechaCreacion`, `nombrePuesto`) VALUES ('GEN', 'Gerente', '2023-10-29', 'Gerente');

