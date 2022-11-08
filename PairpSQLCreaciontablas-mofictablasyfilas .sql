-- EJERCICIO DIA 1 CREACION DE TABLAS --

CREATE SCHEMA `tienda_zapatillas`;

USE `tienda_zapatillas`;

CREATE TABLE tabla_zapatillas (

id_zapatilla INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
modelo VARCHAR(45) NOT NULL ,
color VARCHAR(45) NOT NULL
);

CREATE TABLE tabla_clientes (

id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL ,
numero_telefono INT(9) NOT NULL , 
email  VARCHAR(45) NOT NULL , 
direccion VARCHAR(45) NOT NULL , 
ciudad VARCHAR(45) DEFAULT NULL , 
provincia VARCHAR(45) NOT NULL , 
pais VARCHAR(45) NOT NULL , 
codigo_postal INT(45) NOT NULL
);

CREATE TABLE tabla_empleados (
id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL , 
tienda VARCHAR(45) NOT NULL , 
salario INT DEFAULT NULL , 
fecha_incorporacion DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS `tabla_facturas` (
id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero_factura INT(45) NOT NULL ,
fecha DATE NOT NULL ,
id_zapatilla INT NOT NULL ,
id_empleado INT NOT NULL ,
id_cliente INT NOT NULL , 
CONSTRAINT fk_tabla_facturas_tabla_zapatillas
FOREIGN KEY (id_zapatilla)
REFERENCES tabla_zapatillas (id_zapatilla),
CONSTRAINT fk_tabla_facturas_tabla_empleado
FOREIGN KEY (id_empleado)
REFERENCES tabla_empleados (id_empleado),
CONSTRAINT fk_tabla_facturas_tabla_cliente
FOREIGN KEY (id_cliente)
REFERENCES tabla_clientes (id_cliente)
);


-- EJERCICIO DÍA 2 ALTERACION DE TABLAS -- 

USE tienda_zapatillas ;
 
ALTER TABLE tabla_zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL;

ALTER TABLE tabla_zapatillas
ADD COLUMN talla INT NOT NULL;

ALTER TABLE tabla_empleados
MODIFY COLUMN salario FLOAT NOT NULL; 

 ALTER TABLE tabla_clientes
 DROP COLUMN pais;
 
 ALTER TABLE tabla_clientes
 MODIFY COLUMN codigo_postal INT(5);
 
 
ALTER TABLE tabla_facturas
ADD COLUMN total FLOAT;



-- EJERCICIO DIA 3 INSERT TABLA --

USE tienda_zapatillas;

INSERT INTO tabla_zapatillas (modelo, color, marca, talla)
VALUES ('XQYUN', 'negro', 'Nike', 42);
INSERT INTO tabla_zapatillas (modelo, color, marca, talla)
VALUES ('UOPMN', 'rosas', 'Nike', 39);
INSERT INTO tabla_zapatillas (modelo, color, marca, talla)
VALUES ('OPNYT', 'verdes', 'Adidas', 35);

-- AQUI DESHABILITO LA SEGURIDAD DE UPDATE
SET SQL_SAFE_UPDATES=0;

UPDATE tabla_zapatillas
SET color = 'amarillas'
WHERE color = 'rosas';

INSERT INTO tabla_empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Laura', 'Alcobendas', 25987, '2010-9-3');
INSERT INTO tabla_empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Maria', 'Sevilla', 0, '2001-4-11');
INSERT INTO tabla_empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Ester', 'Oviedo', 30165.98, '2000-11-29');


DELETE FROM tabla_empleados
WHERE tienda = 'Alcobendas'
LIMIT 1;

UPDATE tabla_empleados
SET id_empleado = 3
WHERE id_empleado = 6;

