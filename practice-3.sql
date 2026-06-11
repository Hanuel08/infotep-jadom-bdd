
DROP DATABASE IF EXISTS Practica3;

CREATE DATABASE Practica3;

USE Practica3;

CREATE TABLE Producto(
	id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(60) NOT NULL,
	precio INT NOT NULL,
	existencia INT NOT NULL DEFAULT 0,
	estado CHAR(1) NOT NULL
);


DESCRIBE Producto;


# I = Inactivo, P = Publico, 
INSERT INTO Producto(nombre, precio, existencia, estado)
	VALUES
	("Laptop", 38000, 3, "I"),
	("Tablet", 18500, 27, "P"),
	("Smartphone", 10000, 45, "P");


SELECT * FROM Producto;

SELECT id_producto, nombre, precio FROM Producto;

UPDATE Producto SET nombre = "PC" WHERE id_producto = 1;

UPDATE Producto SET nombre = "Impresora", precio = 26750 WHERE id_producto = 2;

DELETE FROM Producto WHERE id_producto = 3;