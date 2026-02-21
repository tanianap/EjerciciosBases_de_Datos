DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARSET utf8mb4;
USE ventas;

CREATE TABLE comercial (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    ciudad VARCHAR(100),
comision FLOAT
);

CREATE TABLE cliente (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    primer_apellido VARCHAR(15) NOT NULL,
    ciudad VARCHAR(100),
    categoria INT(10),
    id_comercial INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

describe cliente;

-- Modificar el nombre de la tabla cliente para que su longitud sea 100 y not null
ALTER TABLE cliente MODIFY nombre VARCHAR(100) NOT NULL;

-- Podemos utilizar describe cliente

-- Cambiar el nombre de la columna
ALTER TABLE cliente CHANGE primer_apellido apellido1 VARCHAR(100) NOT NULL;

-- Añadir una nueva columna
ALTER TABLE cliente ADD apellido2 VARCHAR(100) AFTER apellido1;

-- Eliminar la columna categoria
ALTER TABLE cliente DROP COLUMN categoria;

-- Modificar la columna comision
ALTER TABLE comercial ALTER comision SET DEFAULT 10;
describe comercial;