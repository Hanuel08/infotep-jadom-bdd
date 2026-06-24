CREATE DATABASE Practica_Final;

USE Practica_Final;


CREATE TABLE Pais(
	id_pais INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(60) UNIQUE NOT NULL,
	estado CHAR(1) NOT NULL,
		CONSTRAINT check_pais_estado CHECK(estado IN("A", "I"))
);

DESCRIBE Pais;


CREATE TABLE Departamento(
	id_departamento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(60) UNIQUE NOT NULL,
	estado CHAR(1) NOT NULL,
		CONSTRAINT check_departamento_estado CHECK(estado IN("A", "I"))
);

DESCRIBE Departamento;

CREATE TABLE Empleado(
	id_empleado INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(60) NOT NULL,
	apellido VARCHAR(60) NOT NULL,
	cedula CHAR(11) UNIQUE NOT NULL,
	telefono CHAR(10) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	id_supervisor INT UNSIGNED,
	genero CHAR(1) NOT NULL,
		CONSTRAINT check_empleado_genero CHECK(genero IN("M", "F")),
	id_pais INT UNSIGNED NOT NULL,
	condicion CHAR(1) NOT NULL,
		CONSTRAINT check_empleado_condicion CHECK(condicion IN("A", "L", "V", "S")),
	estado_civil CHAR(1) NOT NULL,
		CONSTRAINT check_empleado_estado_civil CHECK(estado_civil IN("C", "S", "D", "V")),
	fecha_ingreso DATETIME NOT NULL DEFAULT NOW(),
	fecha_salida DATE,
	salario DECIMAL(7, 2) NOT NULL,
	id_departamento INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_supervisor)
		REFERENCES Empleado(id_empleado),
	FOREIGN KEY (id_pais)
		REFERENCES Pais(id_pais),
	FOREIGN KEY (id_departamento)
		REFERENCES Departamento(id_departamento)
);

DESCRIBE Empleado;


CREATE TABLE Usuario(
	id_usuario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_empleado INT UNSIGNED NOT NULL, 
	usuario VARCHAR(60) UNIQUE NOT NULL,
	pwd VARBINARY(128) NOT NULL,
	FOREIGN KEY (id_empleado)
		REFERENCES Empleado(id_empleado)
);

DESCRIBE Usuario;



INSERT INTO Pais (nombre, estado)
	VALUES
	('Republica Dominicana', 'A'),
	('Mexico', 'A'),
	('Colombia', 'A');



INSERT INTO Departamento (nombre, estado)
	VALUES
	('Recursos Humanos', 'A'),
	('Tecnologia', 'A'),
	('Contabilidad', 'A');



INSERT INTO Empleado (
    nombre,
    apellido,
    cedula,
    telefono,
    fecha_nacimiento,
    email,
    id_supervisor,
    genero,
    id_pais,
    condicion,
    estado_civil,
    salario,
    id_departamento
)
VALUES
(
    'Juan',
    'Perez',
    '00112345678',
    '8095551111',
    '1990-05-15',
    'juan.perez@empresa.com',
    NULL,
    'M',
    1,
    'A',
    'S',
    35000.00,
    1
),
(
    'Maria',
    'Gomez',
    '00212345678',
    '8095552222',
    '1992-08-20',
    'maria.gomez@empresa.com',
    1,
    'F',
    2,
    'A',
    'C',
    45000.00,
    2
),
(
    'Carlos',
    'Rodriguez',
    '00312345678',
    '8095553333',
    '1988-11-10',
    'carlos.rodriguez@empresa.com',
    1,
    'M',
    3,
    'V',
    'D',
    40000.00,
    3
);


INSERT INTO Usuario (id_empleado, usuario, pwd)
	VALUES
	(
	    1,
	    'jperez',
	    SHA2('Juan123', 512)
	),
	(
	    2,
	    'mgomez',
	    SHA2('Maria123', 512)
	),
	(
	    3,
	    'crodriguez',
	    SHA2('Carlos123', 512)
	);



SELECT DATE(NOW());

SELECT YEAR(NOW());


# V1
DELIMITER //

CREATE FUNCTION f_calcular_edad(fecha_nacimiento DATE)
	RETURNS INT
	BEGIN
		DECLARE age INT;
		
		SET age = YEAR(NOW()) - YEAR(fecha_nacimiento);
		
		IF MONTH(NOW()) >= MONTH(fecha_nacimiento) AND DAY(NOW()) > DAY(fecha_nacimiento) THEN
			SET age = age - 1;
		END IF;
		
		RETURN age;
	END
	
//



# V2
DELIMITER //

CREATE FUNCTION f_calcular_edad(fecha_nacimiento DATE)
	RETURNS INT
	BEGIN
		DECLARE age INT;
		
		SET age = YEAR(NOW()) - YEAR(fecha_nacimiento);
		
		IF (MONTH(NOW()) > MONTH(fecha_nacimiento)) OR (MONTH(NOW()) = MONTH(fecha_nacimiento) AND DAY(NOW()) > DAY(fecha_nacimiento)) THEN
			SET age = age - 1;
		END IF;
		
		RETURN age;
	END
	
//


SHOW FUNCTION STATUS;

DROP FUNCTION f_calcular_edad;


-- SELECT f_calcular_edad("1988-11-10");
-- 
-- SELECT f_calcular_edad("2000-06-21");



SELECT 
	e.nombre,
    e.apellido,
    e.cedula,
    e.telefono,
    f_calcular_edad(e.fecha_nacimiento) AS edad,
    e.email,
    e2.nombre AS supervisor,
    e.genero,
    p.nombre AS pais,
    e.condicion,
    e.estado_civil,
    e.salario,
    d.nombre AS departamento
		FROM Empleado e
		LEFT JOIN Departamento d
			ON e.id_departamento = d.id_departamento
		LEFT JOIN Pais p
			ON e.id_pais = p.id_pais
		LEFT JOIN Empleado e2
			ON e.id_supervisor = e2.id_empleado;




CREATE VIEW v_empleado AS 
	SELECT 
	e.nombre,
    e.apellido,
    e.cedula,
    e.telefono,
    f_calcular_edad(e.fecha_nacimiento) AS edad,
    e.email,
    e2.nombre AS supervisor,
    e.genero,
    p.nombre AS pais,
    e.condicion,
    e.estado_civil,
    e.salario,
    d.nombre AS departamento
		FROM Empleado e
		LEFT JOIN Departamento d
			ON e.id_departamento = d.id_departamento
		LEFT JOIN Pais p
			ON e.id_pais = p.id_pais
		LEFT JOIN Empleado e2
			ON e.id_supervisor = e2.id_empleado;



SELECT * FROM v_empleado;