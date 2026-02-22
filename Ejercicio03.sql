DROP DATABASE IF EXISTS videoclub;

CREATE DATABASE videoclub;

USE videoclub;

CREATE TABLE pelicula (
    titulo VARCHAR(50),
    nacionalidad VARCHAR(20),
    nombreProductora VARCHAR(50),
    fecha DATE,
    directorDNI CHAR(9)
);

CREATE TABLE director (
    DNI CHAR(9),
    nombre VARCHAR(25),
    nacionalidad VARCHAR(20)
);

CREATE TABLE actor (
    nombre VARCHAR(50),
    nacionalidad VARCHAR(20),
    sexo CHAR(1)
);

CREATE TABLE pelicula_actor (
    titulo VARCHAR(100),
    actorNombre VARCHAR(25),
    participacion VARCHAR(20)
);

CREATE TABLE ejemplares (
    numero_ejemplar INT,
    titulo VARCHAR(50),
    estado VARCHAR(40)
);

CREATE TABLE socio (
    DNI CHAR(9),
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    avalDNI CHAR(9)
);

CREATE TABLE alquiler (
    ejemplar INT,
    titulo VARCHAR(50),
    socioDNI CHAR(9),
    fecha_prestamo DATE,
    fecha_devolucion DATE
);

-- AÑADIR PK Y FK A LAS TABLAS

 -- Añadir PK Pelicula
ALTER TABLE pelicula
ADD CONSTRAINT PK_Pelicula PRIMARY KEY (titulo, directorDNI);

-- Añadir PK Director
ALTER TABLE director ADD CONSTRAINT PK_Director PRIMARY KEY (DNI);

-- Añadir PK Actor
ALTER TABLE actor ADD CONSTRAINT PK_actor PRIMARY KEY (nombre);

-- Añadir FK Pelicula y Actor
ALTER TABLE	pelicula_actor ADD CONSTRAINT PK_pelicula_actor PRIMARY KEY (titulo, actorNombre),
ADD CONSTRAINT FK_pelicula_actor_pelicula FOREIGN KEY (titulo, actorNombre) REFERENCES pelicula(titulo, directorDNI),
ADD CONSTRAINT FK_pelicula_actor_actor FOREIGN KEY (actorNombre) REFERENCES actor(nombre);

-- Añadir PK y FK Ejemplares
ALTER TABLE ejemplares
ADD CONSTRAINT PK_ejemplares PRIMARY KEY (numero_ejemplar, titulo),
ADD CONSTRAINT FK_ejemplares_pelicula FOREIGN KEY (titulo) REFERENCES pelicula(titulo);

-- Añadir PK y FK Socio
ALTER TABLE socio
ADD CONSTRAINT PK_socio PRIMARY KEY (DNI),
ADD CONSTRAINT FK_socio_aval FOREIGN KEY (avalDNI) REFERENCES socio(DNI);

-- Añadir PK y FK Alquiler
ALTER TABLE alquiler
ADD CONSTRAINT PK_alquiler PRIMARY KEY (ejemplar, titulo, socioDNI),
ADD CONSTRAINT FK_alquiler_ejemplar FOREIGN KEY (ejemplar, titulo) REFERENCES ejemplares(numero_ejemplar, titulo),
ADD CONSTRAINT FK_alquiler_socio FOREIGN KEY (socioDNI) REFERENCES socio(DNI);

-- Fecha de nacimiento del socio
ALTER TABLE socio ADD fechanac DATE;

-- Importe en alquiler
ALTER TABLE alquiler ADD importe DECIMAL(8,2) NOT NULL;

-- Dinero generado en película
ALTER TABLE pelicula ADD dineroGenerado DECIMAL(10,2) NOT NULL;

-- Restringir que Fecha_devolución ≥ Fecha_prestamo
ALTER TABLE alquiler ADD CONSTRAINT CHK_Fecha CHECK (fecha_devolucion >= fecha_prestamo);