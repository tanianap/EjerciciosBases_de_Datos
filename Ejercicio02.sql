DROP DATABASE IF EXISTS instituto;

CREATE DATABASE instituto;

USE instituto;

CREATE TABLE alumno (
	numeMatri INT,
    nombreAlu VARCHAR(15),
    CONSTRAINT PK_alumno PRIMARY KEY (numeMatri)
);

CREATE TABLE profesor (
	codigoPro INT,
    nombrePro VARCHAR(15),
    CONSTRAINT PK_profesor PRIMARY KEY (codigoPro)
);

CREATE TABLE Modulo (
	codigoMod INT,
    nombreMod VARCHAR(75),
    codigoPro INT,
    CONSTRAINT PK_modulo PRIMARY KEY (codigoMod),
    CONSTRAINT FK_modulo_codigo_profesor FOREIGN KEY (codigoPro)  REFERENCES profesor(codigoPro)
);

CREATE TABLE matricula (
	numerMatri INT,
    codigoMod INT,
    nota DECIMAL(2,2),
    CONSTRAINT PK_matricula PRIMARY KEY (numerMatri, codigoMod),
    CONSTRAINT FK_matricula_alumno FOREIGN KEY (numerMatri) REFERENCES alumno (numeMatri),
    CONSTRAINT FK_matricula_modulo FOREIGN KEY (codigoMod) REFERENCES modulo (codigoMod)
);