DROP DATABASE IF EXISTS centro_educativo;

CREATE DATABASE centro_educativo;

USE centro_educativo;

CREATE TABLE profesores
(
	nombrePro VARCHAR(10) UNIQUE,
    apellido1Pro VARCHAR(15),
    apellido2Pro VARCHAR(15),
    nifPro VARCHAR(9),
    direPro VARCHAR(30),
    tituloPro VARCHAR(30),
    salario DECIMAL(6,2) NOT NULL,
    CONSTRAINT PK_nifPro PRIMARY KEY(nifPro)
);

CREATE TABLE cursos
(
	nombreCur VARCHAR(10) UNIQUE,
    codigoCur NUMERIC(5) PRIMARY KEY,
    nifProfe VARCHAR(9),
    maxAlu NUMERIC(3),
    fechaIni DATE,
	fechaFin DATE,
    numHoTo NUMERIC(3) NOT NULL,
    CONSTRAINT FL_ FOREIGN KEY (nifProfe) REFERENCES profesores (nifPro) ON DELETE CASCADE,
    CONSTRAINT CK_curso_fecha CHECK (fechaFin > fechaIni)
);

CREATE TABLE alumnos
(
	nombreAlu VARCHAR(10),
    apellido1Alu VARCHAR(15),
    apellido2Alu VARCHAR(15),
    nifAlu VARCHAR(9) PRIMARY KEY,
    direccionAlu VARCHAR(30),
	sexoAlu VARCHAR(1),
    fechaNacAlu DATE,
    cursoAlu NUMERIC(5),
    CONSTRAINT FK_cursoAlu_Cursos FOREIGN KEY (cursoAlu) REFERENCES cursos (codigoCur),
    CONSTRAINT alu_sec_CK CHECK (sexoAlu IN ('H','M'))
);