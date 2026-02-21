DROP DATABASE IF EXISTS empresa;

CREATE DATABASE empresa;

USE empresa;

CREATE TABLE empleados
(
	DNI VARCHAR(9),
    nombre VARCHAR(10) NOT NULL,
    apellido1 VARCHAR(10) NOT NULL,
    apellido2 VARCHAR(10), 
    direcc1 VARCHAR(20),
    direcc2 VARCHAR(20),
    ciudad VARCHAR(20),
    cod_postal DECIMAL(5,0),
    sexo CHAR,
    fecha_nac DATE,
    CONSTRAINT PK_empleados PRIMARY KEY (DNI),
    CONSTRAINT CK_empleados_sexo CHECK (sexo='H' OR sexo='M')
);

CREATE TABLE universidades
(
	univ_cod INT,
    nombre_univ VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20),
    municipio VARCHAR(20),
    cod_postal DECIMAL(5,0),
    CONSTRAINT PK_universidades PRIMARY KEY (univ_cod)
);

CREATE TABLE trabajos
(
	trabajo_cod INT,
    nombre_trab VARCHAR(20) NOT NULL,
    salario_min DECIMAL(6,2) NOT NULL,
    salario_max DECIMAL(6,2) NOT NULL,
    CONSTRAINT PK_trabajos PRIMARY KEY (trabajo_cod),
    CONSTRAINT UQ_trabajos_nombre UNIQUE (nombre_trab)
);

CREATE TABLE departamentos
(
	dpto_cod INT,
    nombre_dpto VARCHAR(10) NOT NULL,
    dpto_padre INT,
    presupuesto INT NOT NULL,
    pres_actual INT,
    CONSTRAINT PK_departamentos PRIMARY KEY (dpto_cod),
    CONSTRAINT UQ_departamentos_nombre UNIQUE (nombre_dpto),
    CONSTRAINT FK_departamentos_dpto_padres FOREIGN KEY (dpto_padre) REFERENCES departamentos(dpto_cod)
);

CREATE TABLE estudios
(
	empleado_DNI VARCHAR(9),
    universidad int,
    anio DECIMAL (4,0),
    grado VARCHAR(20),
    especialidad VARCHAR(10),
    CONSTRAINT PK_estudios PRIMARY KEY (empleado_DNI, grado, especialidad),
    CONSTRAINT FK_estudios_empleado_DNI FOREIGN KEY (empleado_DNI) REFERENCES empleados(DNI),
    CONSTRAINT FK_estudios_universidad FOREIGN KEY (universidad) REFERENCES universidades(univ_cod)
);

CREATE TABLE historial_laboral
(
	empleado_DNI VARCHAR(9),
    trabajo_cod INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    dpto_cod INT,
    supervisor_DNI VARCHAR(9),
    CONSTRAINT PK_historial_laboral PRIMARY KEY (empleado_DNI, trabajo_cod, fecha_inicio),
    CONSTRAINT FK_historial_laboral_empleado_DNI FOREIGN KEY (empleado_DNI) REFERENCES empleados(DNI),
    CONSTRAINT FK_historial_laboral_trabajo_cod FOREIGN KEY (trabajo_cod) REFERENCES trabajos(trabajo_cod),
    CONSTRAINT FK_historial_laboral_dpto_cod FOREIGN KEY (dpto_cod) REFERENCES departamentos(dpto_cod),
    CONSTRAINT FK_historial_laboral_supervisor_DNI FOREIGN KEY (supervisor_DNI) REFERENCES empleados(DNI)
);
