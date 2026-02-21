DROP DATABASE IF EXISTS entradas;

CREATE DATABASE entradas;

USE entradas;

CREATE TABLE recintos
( 
	cod_recinto INT,
    nombre VARCHAR(10) NOT NULL,
    direccion VARCHAR(10) NOT NULL,
    ciudad VARCHAR(10) NOT NULL,
    telefono VARCHAR(9),
    horario VARCHAR(10),
    CONSTRAINT PK_recintos PRIMARY KEY (cod_recinto)
);

CREATE TABLE espectadores
(
	dni_cliente VARCHAR(9),
    nombre VARCHAR(10),
    direccion VARCHAR(10),
    telefono VARCHAR(9),
    ciudad VARCHAR(10),
    ntarjeta INT NOT NULL,
    CONSTRAINT PK_espectadores PRIMARY KEY (dni_cliente)
);

CREATE TABLE zonas_recintos
(
	cod_recinto INT,
    zona VARCHAR(10) NOT NULL,
    capacidad INT NOT NULL,
    CONSTRAINT PK_zonas_recintos PRIMARY KEY (cod_recinto, zona)
);

CREATE TABLE espectaculos
(
	cod_espectaculo INT,
    nombre VARCHAR(10) NOT NULL,
    tipo VARCHAR(10),
    fecha_inicial DATE NOT NULL,
    fecha_final DATE,
    interprete VARCHAR(20),
    cod_recinto INT,
    CONSTRAINT PK_espectaculos PRIMARY KEY (cod_espectaculo),
    CONSTRAINT FK_espectaculos_cod_recinto FOREIGN KEY (cod_recinto) REFERENCES recintos (cod_recinto)
);
    
CREATE TABLE representaciones
(
	cod_espectaculo INT,
    fecha DATE NOT NULL,
    hora VARCHAR(10),
    CONSTRAINT PK_representaciones PRIMARY KEY (cod_espectaculo, hora),
    CONSTRAINT FK_representaciones_cod_espectaculo FOREIGN KEY (cod_espectaculo) REFERENCES espectaculos (cod_espectaculo)
);

CREATE TABLE precios_espectaculos
( 
	cod_espectaculo INT,
    cod_recinto INT,
    zona VARCHAR(10),
    precio DECIMAL (5,2) DEFAULT 0,
    CONSTRAINT PK_precios_espectaculos PRIMARY KEY (cod_espectaculo, cod_recinto, zona),
    CONSTRAINT FK_precios_espectaculos_cod_espectaculo FOREIGN KEY (cod_espectaculo) REFERENCES espectaculos (cod_espectaculo),
    CONSTRAINT FK_precios_espectaculos_zonas_recintos FOREIGN KEY (cod_recinto, zona) REFERENCES zonas_recintos(cod_recinto, zona)
);

CREATE TABLE asientos
(
	cod_recinto INT,
    zona VARCHAR(10),
    fila INT,
    numero INT,
    CONSTRAINT PK_asientos PRIMARY KEY (cod_recinto, zona, fila, numero),
    CONSTRAINT FK_asientos FOREIGN KEY (cod_recinto, zona) REFERENCES zonas_recintos(cod_recinto, zona)
);

CREATE TABLE entradas
(
	cod_espectaculo INT,
    fecha DATE,
    hora VARCHAR(10),
    cod_recinto INT,
    fila INT,
    numero INT,
    zona VARCHAR(10),
    DNI_cliente VARCHAR(9),
    CONSTRAINT PK_entradas PRIMARY KEY (cod_espectaculo, fecha, hora, cod_recinto, fila, numero, zona),
    CONSTRAINT FK_entradas_espectadores FOREIGN KEY (DNI_cliente) REFERENCES espectadores(DNI_cliente),
	CONSTRAINT FK_entradas_representaciones FOREIGN KEY (cod_espectaculo, hora) REFERENCES representaciones(cod_espectaculo, hora),
    CONSTRAINT FK_entradas_asiento FOREIGN KEY (cod_recinto, zona, fila, numero) REFERENCES asientos(cod_recinto, zona, fila, numero)
);