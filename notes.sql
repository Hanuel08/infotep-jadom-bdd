
# version corta del CASE WHEN
SELECT genero WHEN "F" THEN "Femenino" WHEN "M" THEN "Masculino" AS genero
	FROM Empleados;


SELECT * FROM Empleados;

SELECT COUNT(*) FROM Empleados;

SELECT COUNT(id_empleado_supervisor) FROM Empleados;


# agrupando usando el CASE WHEN para nombrar columnas
SELECT 
	CASE WHEN genero = "F" THEN "Femenino"
	ELSE "Masculino"
	END AS genero,
	COUNT(genero) AS cantidad
	FROM Empleados GROUP BY genero;



# para usar expresiones regulares
CREATE TABLE Estudiante(
	telefono CHAR(10) CHECK(telefono RIKE '[8][024][9][0-9]{7}')
)