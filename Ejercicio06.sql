USE concesionario;

-- Eliminar TODAS las claves ajenas 
ALTER TABLE ventas DROP FOREIGN KEY FK_ventas_coches;
ALTER TABLE ventas DROP FOREIGN KEY FK_ventas_clientes;
ALTER TABLE ventas DROP FOREIGN KEY FK_ventas_concesionarios;
ALTER TABLE coches DROP FOREIGN KEY FK_coches_marcas;

-- 2. Modificar la tabla Concesionarios
ALTER TABLE concesionarios  MODIFY cifconcesi VARCHAR(10), 
CHANGE COLUMN ciudadcon ciudad VARCHAR(50);

-- 3. Modificar la tabla Coches
ALTER TABLE coches MODIFY codcoche INT(5);

-- 4. Modificar la tabla Ventas
ALTER TABLE ventas MODIFY cifconcesi VARCHAR(10), 
MODIFY codcoche INT(5);

-- 5. Crear o Re-crear la tabla Distribucion
DROP TABLE IF EXISTS distribucion;
CREATE TABLE distribucion (
    cifconcesi VARCHAR(10),
    codcoche INT(5),
    cantidad INT(5),
    CONSTRAINT PK_distribucion PRIMARY KEY (cifconcesi, codcoche),
    CONSTRAINT FK_distribucion_concesionarios FOREIGN KEY (cifconcesi) REFERENCES concesionarios(cifconcesi),
    CONSTRAINT FK_distribucion_coches FOREIGN KEY (codcoche) REFERENCES coches(codcoche)
);

-- 6. Restaurar el resto de relaciones
ALTER TABLE coches ADD CONSTRAINT FK_coches_marcas FOREIGN KEY (codmarca) REFERENCES marcas(codmarca);

ALTER TABLE ventas ADD CONSTRAINT FK_ventas_clientes FOREIGN KEY (dnicli) REFERENCES cliente(dnicli),
ADD CONSTRAINT FK_ventas_coches FOREIGN KEY (codcoche) REFERENCES coches(codcoche),
ADD CONSTRAINT FK_ventas_concesionarios FOREIGN KEY (cifconcesi) REFERENCES concesionarios(cifconcesi);