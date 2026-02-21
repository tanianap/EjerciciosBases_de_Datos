-- Ejercicio 1 - Base de Datos Academia

CREATE DATABASE academia;

USE academia;

CREATE TABLE departamentos
(
	dnume NUMERIC(3) NOT NULL,
    dnombre VARCHAR(15),
    dedificio NUMERIC(1),
    ddire VARCHAR(20),
    CONSTRAINT PK_departamentos PRIMARY KEY (dnume)
);

CREATE TABLE estudiantes
(
	esnume NUMERIC(2) NOT NULL,
    esnombre VARCHAR(15),
    esapelli VARCHAR(25),
    esdomi VARCHAR(10),
    esedad NUMERIC(2),
    CONSTRAINT PK_estudiantes PRIMARY KEY (esnume)
);

CREATE TABLE profesores
(
	pnume NUMERIC(2) NOT NULL,
    prnombre VARCHAR(25),
    pdomi VARCHAR(10),
    pedepar NUMERIC(3),
    CONSTRAINT PK_profesores PRIMARY KEY (pnume),
    CONSTRAINT FK_profesores_departamentos FOREIGN KEY (pedepar) REFERENCES departamentos (dnume)
);

CREATE TABLE cursos
(
	cnume VARCHAR(3) NOT NULL,
    cnombre VARCHAR(25),
    cdescrip VARCHAR(10),
    ccredito NUMERIC(2),
    ctarifa NUMERIC(3),
    cprofe NUMERIC(2),
    cdia VARCHAR(9),
    chora VARCHAR(5),
    CONSTRAINT PK_cursos PRIMARY KEY (cnume),
    CONSTRAINT FK_cursos_profesores FOREIGN KEY (cprofe) REFERENCES profesores (pnume)
);

CREATE TABLE clases 
(
	clnume VARCHAR(3) NOT NULL,
    clcurso VARCHAR(3) NOT NULL,
    cledificio NUMERIC(1),
    CONSTRAINT PK_clases PRIMARY KEY (clnume,clcurso),
    CONSTRAINT FK_clases_cursos FOREIGN KEY (clcurso) REFERENCES cursos (cnume)
);

CREATE TABLE matriculas
(
	manues NUMERIC(2) NOT NULL,
    manucu VARCHAR(3) NOT NULL,
    CONSTRAINT PK_matriculas PRIMARY KEY (manues,manucu),
    CONSTRAINT FK_matriculas_estudiantes FOREIGN KEY (manues) REFERENCES estudiantes (esnume),
    CONSTRAINT FK_matriculas_cursos FOREIGN KEY (manucu) REFERENCES cursos (cnume)
);
    
    