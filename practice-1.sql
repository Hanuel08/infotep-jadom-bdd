-- CREATE TABLE Clientes(
-- 	id_cliente INT AUTO_INCREMENT,
-- 	nombre VARCHAR(40) NOT NULL,
-- 	apellido VARCHAR(40) NOT NULL ,
-- 	cod_tipo_documento CHAR(1) NOT NULL,
-- 	cod_documento CHAR(16) NOT NULL,
-- 	telefono CHAR(10) NOT NULL,
-- 	fecha_nacimiento DATE NOT NULL,
-- 	genero CHAR(1) NOT NULL, 
-- 	direccion VARCHAR(100) NOT NULL,
-- 	estado CHAR(1) DEFAULT 'A', 
-- 	CONSTRAINT CK_Clientes_cod_tipo_documento CHECK (cod_tipo_documento IN ('C','P')),
-- 	CONSTRAINT CK_Clientes_documento CHECK (cod_tipo_documento != 'C' OR (cod_tipo_documento = 'C' AND cod_documento NOT LIKE '%[^0-9]%' AND LENGTH(cod_documento) = 11)),
-- 	CONSTRAINT CK_Clientes_telefono CHECK (telefono RLIKE '[8][024][9][0-9]{7}'),
-- 	CONSTRAINT CK_Clientes_genero CHECK (genero IN ('M','F')),
-- 	CONSTRAINT CK_Clientes_estado CHECK (estado IN ('A','I')),
-- 	CONSTRAINT UQ_Clientes_cod_documento UNIQUE (cod_documento),
-- 	CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente)
-- );


SELECT * FROM Clientes;

# 1
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes 
		ORDER BY fecha_nacimiento ASC
		LIMIT 3;


# 2
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes 
		ORDER BY fecha_nacimiento DESC
		LIMIT 3;


# 3
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE YEAR(fecha_nacimiento) = 1994 AND MONTH(fecha_nacimiento) = 12 AND DAY(fecha_nacimiento) = 25;


# 4
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE fecha_nacimiento IN("1994-12-25");


# 5
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE id_cliente = 18;


# 6
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE id_cliente IN(2, 9, 52);


# 7
SELECT 
	 id_cliente AS id, 
	 nombre, 
	 apellido, 
	 cod_tipo_documento AS tipo, 
	 cod_documento AS documento, 
	 fecha_nacimiento, 
	 genero, 
	 estado 
		FROM Clientes
		WHERE cod_documento IN("40214521463");


# 8
SELECT 
	 id_cliente AS id, 
	 nombre, 
	 apellido, 
	 cod_tipo_documento AS tipo, 
	 cod_documento AS documento, 
	 fecha_nacimiento, 
	 genero, 
	 estado 
	  	FROM Clientes
		WHERE genero = "F";


# 9
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE nombre LIKE("%DAVID%");


# 10
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE apellido LIKE("%SANTANA%");


# 11
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	genero, 
	estado 
		FROM Clientes
		WHERE nombre LIKE("%DAVID%") AND id_cliente != 59;
