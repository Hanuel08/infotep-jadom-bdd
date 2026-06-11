# 1
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN estado = "A" THEN "Activo"
	END AS estado
		FROM Clientes
		WHERE YEAR(fecha_nacimiento) = 1998 AND MONTH(fecha_nacimiento) = 04 AND DAY(fecha_nacimiento) = 13;



# 2
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN estado = "A" THEN "Activo"
	END AS estado
		FROM Clientes
  WHERE YEAR(fecha_nacimiento) = 2002 AND MONTH(fecha_nacimiento) = 10 AND genero = "F";



# 3
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN estado = "A" THEN "Activo"
	END AS estado
		FROM Clientes
		WHERE YEAR(fecha_nacimiento) IN(1987, 1992);



# 4
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN estado = "A" THEN "Activo"
	END AS estado
		FROM Clientes
		WHERE MONTH(fecha_nacimiento) = 12 AND DAY(fecha_nacimiento) IN(25, 31);



# 5
SELECT 
	id_cliente AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN estado = "A" THEN "Activo"
	END AS estado
		FROM Clientes
		WHERE id_cliente IN(1, 7);



# 6
SELECT 
	id_empleado AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN condicion = "A" THEN "Activo"
		WHEN condicion = "S" THEN "Suspendido"
		WHEN condicion = "L" THEN "Licencia"
		WHEN condicion = "V" THEN "Vacaciones"
	END AS condicion
		FROM Empleados
		WHERE id_empleado_supervisor IS NULL;



# 7
SELECT 
	id_empleado AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN condicion = "A" THEN "Activo"
		WHEN condicion = "S" THEN "Suspendido"
		WHEN condicion = "L" THEN "Licencia"
		WHEN condicion = "V" THEN "Vacaciones"
	END AS condicion
		FROM Empleados
		WHERE YEAR(fecha_nacimiento) > 1999;



# 8
SELECT 
	id_empleado AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN condicion = "A" THEN "Activo"
		WHEN condicion = "S" THEN "Suspendido"
		WHEN condicion = "L" THEN "Licencia"
		WHEN condicion = "V" THEN "Vacaciones"
	END AS condicion
		FROM Empleados
		WHERE id_empleado BETWEEN 19 AND 31 AND YEAR(fecha_nacimiento) <= 1972;



# 9
SELECT COUNT(*) AS cantidad FROM Empleados WHERE condicion != "A";



# 10
SELECT 
	id_empleado AS id, 
	nombre, 
	apellido, 
	cod_tipo_documento AS tipo, 
	cod_documento AS documento, 
	fecha_nacimiento, 
	CASE 
		WHEN genero = "M" THEN "Masculino"
		ELSE "Femenino"
	END AS genero,
	CASE 
		WHEN condicion = "A" THEN "Activo"
		WHEN condicion = "S" THEN "Suspendido"
		WHEN condicion = "L" THEN "Licencia"
		WHEN condicion = "V" THEN "Vacaciones"
	END AS condicion
		FROM Empleados
		WHERE id_empleado BETWEEN 19 AND 31 AND YEAR(fecha_nacimiento) <= 1972;
