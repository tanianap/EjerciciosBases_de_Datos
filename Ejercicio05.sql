DROP DATABASE IF EXISTS pubs;

CREATE DATABASE pubs;

USE pubs;


CREATE TABLE localidad (
    cod_localidad INT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Localidad PRIMARY KEY (cod_localidad)
);

CREATE TABLE empleado (
    dni_empleado VARCHAR(9),
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    CONSTRAINT PK_Empleado PRIMARY KEY (dni_empleado)
);

CREATE TABLE pub (
    cod_pub VARCHAR(10),
    nombre VARCHAR(50) NOT NULL,
    licencia_fiscal VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(5) NOT NULL,
    cod_localidad INT NOT NULL,
    CONSTRAINT PK_Pub PRIMARY KEY (cod_pub),
    CONSTRAINT FK_Pub_Localidad FOREIGN KEY (cod_localidad) REFERENCES Localidad(cod_localidad),
    CONSTRAINT CHK_Pub_Horario CHECK (horario IN ('HOR1','HOR2','HOR3'))
);

CREATE TABLE Titular (
    dni_titular VARCHAR(9),
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    cod_pub VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Titular PRIMARY KEY (dni_titular),
    CONSTRAINT FK_Titular_Pub FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub)
);

CREATE TABLE Existencias (
    cod_articulo VARCHAR(10),
    nombre VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    cod_pub VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Existencias PRIMARY KEY (cod_articulo),
    CONSTRAINT FK_Existencias_Pub FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub),
    CONSTRAINT CHK_Existencias_Precio CHECK (precio > 0)
);

CREATE TABLE Pub_empleado (
    cod_pub VARCHAR(10) NOT NULL,
    dni_empleado VARCHAR(9) NOT NULL,
    funcion VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Pub_Empleado PRIMARY KEY (cod_pub, dni_empleado, funcion),
    CONSTRAINT FK_PubEmpleado_Pub FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub),
    CONSTRAINT FK_PubEmpleado_Empleado FOREIGN KEY (dni_empleado) REFERENCES Empleado(dni_empleado),
    CONSTRAINT CHK_PubEmpleado_Funcion CHECK (funcion IN ('CAMARERO','SEGURIDAD','LIMPIEZA'))
);