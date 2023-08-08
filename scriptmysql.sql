CREATE DATABASE B_ABARROTES;
CREATE USER P_VENTA@localhost IDENTIFIED BY 'venta1234';
GRANT CREATE ON B_ABARROTES.* TO P_VENTA@localhost;
FLUSH privileges;
SHOW GRANTS FOR P_VENTA@localhost;
GRANT CREATE ON B_ABARROTES.* TO P_VENTA@localhost;
GRANT ALL privileges ON B_ABARROTES.* TO P_VENTA@localhost;

CREATE TABLE DIRECCION (
idDireccion int unsigned auto_increment primary key,
calleNumero varchar(150),
colonia varchar(80),
codigoPostal varchar(10),
municipioAlcaldia varchar(80),
estado varchar(80),
pais varchar(50));

CREATE TABLE CORREO_ELECTRONICO (
idCorreo varchar(500) primary key,
correoElectronico varchar(150) not null,
fechaCreacion date not null,
fechaModificacion date not null);

CREATE TABLE EMPRESA(
idUsuario int not null primary key comment 'SSNN',
nombreEmpresa varchar(150) not null,
id_Direccion int unsigned ,
numTelefonico int,
id_Correo varchar(500) unique,
RFC varchar(30) ,
sitioWeb varchar(100) ,
fechaCreacion date not null,
foreign key (id_Direccion) references direccion(idDireccion) ,
foreign key (id_Correo) references correo_electronico(idCorreo) on delete cascade
);

CREATE TABLE PUESTO(
idPuesto varchar(10) not null primary key ,
nombrePuesto varchar(150) not null,
descripcionPuesto varchar(250) ,
fechaCreacion date not null
);

CREATE TABLE USUARIO(
idUsuario int not null primary key comment 'SSNN',
nombreUsuario varchar(150) not null,
nombreCompleto varchar(80) not null,
apellidoMaterno varchar(80) ,
apellidoPaternoo varchar(80) ,
contrasena varchar(80) unique,
idDireccion int unsigned ,
idCorreo varchar(500) unique,
idPuesto varchar(10) not null ,
fechaCreacion date not null,
foreign key (idDireccion) references direccion(idDireccion) ,
foreign key (idPuesto) references puesto(idPuesto) ,
foreign key (idCorreo) references correo_electronico(idCorreo) on delete cascade
);

--Segunda parte de creacion de tablas

ALTER TABLE EMPRESA CHANGE idUsuario idEmpresa int;

CREATE TABLE PROVEEDOR(
idProveedor int auto_increment primary key ,
idEmpresa int not null ,
sitioWeb varchar(100) ,
contactoProveedor varchar(50),
idCorreo varchar(500) unique,
fechaCreacion date not null,
foreign key (idEmpresa) references Empresa(idEmpresa) ,
foreign key (idCorreo) references correo_electronico(idCorreo) on delete cascade
);

CREATE TABLE FACTURAS(
idOperacionf int primary key ,
factura varchar(150) NOT NULL,
fechaCaptura date not null,
idProveedor int ,
monto float not null,
foreign key (idProveedor) references PROVEEDOR(idProveedor) on delete cascade
);

CREATE TABLE MARCASPRODUCTO(
idMarcaProducto varchar(10) primary key,
nombreMarca varchar(100)
);

CREATE TABLE PRODUCTO(
idProducto varchar(10) primary key,
idMarcaProducto varchar(10) ,
unidadProducto varchar(10) ,
precioVenta float not null,
precioCompra float not null,
IVA varchar(10),
nivelOrden varchar(10),
foreign key (idMarcaProducto) references MARCASPRODUCTO(idMarcaProducto) on delete cascade
);