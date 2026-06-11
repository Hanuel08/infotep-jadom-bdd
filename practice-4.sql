DROP DATABASE IF EXISTS Practica4;

CREATE DATABASE IF NOT EXISTS Practica4;

USE Practica4;

CREATE TABLE Pais(
	id_pais INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(60) NOT NULL UNIQUE,
	estado CHAR(1) NOT NULL DEFAULT "I",
		CONSTRAINT check_estado CHECK(estado IN("A", "I"))
);


CREATE TABLE Empleado(
	id_empleado INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(60) NOT NULL,
	apellido VARCHAR(60) NOT NULL,
	cedula CHAR(11) UNIQUE NOT NULL,
	telefono CHAR(10) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	email VARCHAR(100) NOT NULL,
	genero CHAR(1) NOT NULL,
		CONSTRAINT check_genero CHECK(genero IN("M", "F")),
	condicion CHAR(1) NOT NULL,
		CONSTRAINT check_condicion CHECK(condicion IN("A", "L", "V", "S")),
	estado_civil CHAR(1) NOT NULL,
		CONSTRAINT check_estado_civil CHECK(estado_civil IN("C", "S", "D", "V")),
	fecha_ingreso DATETIME NOT NULL DEFAULT NOW(),
	id_pais INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pais)
		REFERENCES Pais(id_pais)
);


DESCRIBE Pais;

DESCRIBE Empleado;


INSERT INTO Pais (nombre, estado)
	VALUES
	('Republica Dominicana', 'A'),
	('Mexico', 'A'),
	('Colombia', 'A');



INSERT INTO Empleado (nombre, apellido, cedula, telefono, fecha_nacimiento, email, genero, condicion, estado_civil, id_pais)
	VALUES
	('Juan', 'Perez', '00112345678', '8095551111', '1995-05-10', 'juan.perez@gmail.com', 'M', 'S', 'S', 1),
	('Maria', 'Rodriguez', '00223456789', '8295552222', '1998-08-15', 'maria.rodriguez@gmail.com', 'F', 'L', 'S', 2),
	('Carlos', 'Gomez', '00334567890', '8495553333', '1992-12-20', 'carlos.gomez@gmail.com', 'M', 'A', 'C', 3);



SELECT * FROM Empleado;


SELECT id_pais, nombre FROM Pais;


SELECT id_empleado, nombre, apellido, cedula FROM Empleado;
