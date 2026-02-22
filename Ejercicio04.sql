USE CentroEducativo;


-- 1. Crea un nuevo atributo llamado Edad de tipo numérico en la tabla ALUMNOS.
ALTER TABLE alumnos ADD edad NUMERIC;

-- 2. Modifica el campo que has creado anteriormente para que la edad del alumno/a esté comprendida entre 14 y 65 años.
ALTER TABLE alumnos ADD CONSTRAINT CHK_edad CHECK (edad BETWEEN 14 AND 65);

-- 3. Modifica el campo Número de horas del CURSO de manera que solo pueda haber cursos con 30, 40 o 60 horas.
ALTER TABLE cursos ADD CONSTRAINT CHK_num_horas CHECK (numHoTo IN (30, 40, 60));

-- 4. No podemos añadir un curso si su número máximo de alumnos es inferior a 15.
ALTER TABLE cursos ADD CONSTRAINT CHK_max_alu CHECK (maxAlu >= 15);

-- 5. Elimina la restricción que controla los valores que puede tomar el atributo Sexo.
ALTER TABLE alumnos DROP CONSTRAINT alu_sex_CK;

-- 6. Elimina la columna Dirección de la tabla PROFESORES.
ALTER TABLE profesores DROP COLUMN direPro;

-- 7. Cambia la clave primaria de la tabla PROFESORES por Nombre y Apellidos.
ALTER TABLE profesores DROP CONSTRAINT PK_nifPro;

ALTER TABLE profesores
ADD CONSTRAINT PK_profesores_nombre_apellidos PRIMARY KEY (nombrePro, apellido1Pro, apellido2Pro);

-- 8. Renombra la tabla PROFESORES por TUTORES.
ALTER TABLE profesores RENAME TO tutores;

-- 9. Elimina la tabla ALUMNOS.
DROP TABLE alumnos;