DROP DATABASE IF EXISTS restaurante;

CREATE DATABASE restaurante;

USE restaurante;

CREATE TABLE clientes 
(
	id_cliente VARCHAR(10),
    nom_clie VARCHAR(30),
    direccion VARCHAR(30),
    localidad VARCHAR(30),
    telefono NUMERIC(9) NOT NULL,
    CONSTRAINT PK_Clientes_Id_Cliente PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_Clientes_Telefono UNIQUE (telefono)
);

CREATE TABLE pedidos
(
	id_pedido VARCHAR(10),
    id_cliente VARCHAR(10),
    fecha DATE,
    importe DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Pedidos_Id_Pedido PRIMARY KEY (id_pedido)
);

CREATE TABLE platos
(
	id_plato VARCHAR(10),
    desc_plato VARCHAR(100),
    ingredientes VARCHAR(100),
    precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Platos_Id_Plato PRIMARY KEY (id_plato)
);


CREATE TABLE detalle_pedido
(
	id_pedido VARCHAR(10),
    id_plato VARCHAR(10),
    num_platos NUMERIC(2) NOT NULL,
    CONSTRAINT PK_Detalle_Pedidos PRIMARY KEY (id_pedido, id_plato),
    CONSTRAINT FK_Id_Pedido_Pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT FK_Id_Plato_pedidos FOREIGN KEY (id_plato) REFERENCES platos(id_plato)
);

ALTER TABLE clientes ADD c_postal NUMERIC(5);

ALTER TABLE pedidos ADD CONSTRAINT FK_Pedidos_Id_Cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE clientes CHANGE c_postal codigo_postal NUMERIC(5);

ALTER TABLE platos ADD CONSTRAINT CK_Precio_Plato CHECK(precio BETWEEN 1 AND 1000);