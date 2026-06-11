# 📚 Curso de Bases de Datos - INFOTEP

Este repositorio contiene los materiales, prácticas, investigaciones y scripts de base de datos desarrollados durante el curso de Bases de Datos de **INFOTEP** (Facilitador: JADOM).

El repositorio está organizado por módulos de aprendizaje y contiene scripts SQL correspondientes a las tareas prácticas asignadas en clase, utilizando una base de datos principal de préstamos y bases de datos personalizadas para prácticas específicas.

---

## 📂 Estructura del Proyecto

El proyecto está estructurado de la siguiente manera:

*   **📂 [modulo-1](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/modulo-1)**: Contiene investigaciones teóricas, diagramas de diseño de base de datos (`draw.io`) y guías de configuración de herramientas como SQL Workbench en formatos `.docx` y `.pdf`.
*   **📂 [modulo-2](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/modulo-2)**: Contiene los resultados de instalaciones, asignaciones de investigación adicionales y los enunciados oficiales de las prácticas (`practica-1` a `practica-4`) en formatos `.docx` y `.pdf`.
*   **📄 [prestamo.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/prestamo.sql)**: Script de creación y semilla de la base de datos principal de **Préstamos** proporcionada por el docente.
*   **📄 [practice-1.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-1.sql)**: Resolución de la Práctica 1.
*   **📄 [practice-2.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-2.sql)**: Resolución de la Práctica 2.
*   **📄 [practice-3.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-3.sql)**: Resolución de la Práctica 3.
*   **📄 [practice-4.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-4.sql)**: Resolución de la Práctica 4.
*   **📄 [notes.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/notes.sql)**: Notas y apuntes rápidos de sintaxis SQL útiles del curso.

---

## 🗄️ Base de Datos Principal: `PRESTAMO`

El archivo **[prestamo.sql](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/prestamo.sql)** inicializa la base de datos `PRESTAMO`, la cual simula el funcionamiento de una entidad financiera que otorga créditos a clientes, manejando sucursales, empleados, cobros y el detalle de cuotas/mora de cada préstamo.

### Esquema de Tablas
1.  **`Clientes`**: Información personal y de contacto del cliente.
2.  **`Roles`**: Roles del sistema (`ADMINISTRADOR`, `ESTANDAR`).
3.  **`Sucursales`**: Sedes físicas de la entidad.
4.  **`Paises`**: Catálogo de países con códigos ISO.
5.  **`Departamentos`**: Áreas de la empresa (Tecnología, Administración, Finanzas, etc.).
6.  **`tipo_telefono`**: Clasificación de números (`MOVIL`, `HOGAR`, `TRABAJO`).
7.  **`Empleados`**: Datos personales de los trabajadores y su supervisor directo.
8.  **`telefono`**: Teléfonos asociados a los empleados.
9.  **`Usuarios`**: Credenciales de acceso de los empleados al sistema.
10. **`Prestamos`**: Cabecera de los préstamos, montos prestados, totales, intereses y estado general (`PR` - Registrado, `PP` - Pagado).
11. **`DetallePagos`**: Cuotas de amortización detalladas con fechas de vencimiento, pagos realizados, mora y estado (`CR` - Registrada, `CP` - Pagada, `CA` - Atrasada).

### Función Helper Incluida
*   `fn_calcular_edad(fecha_nacimiento)`: Calcula la edad de una persona basándose en su fecha de nacimiento y la fecha actual (`NOW()`).

---

## 📝 Descripción de los Scripts de Prácticas

A continuación se detalla el contenido y propósito de cada script de práctica en el orden correspondiente:

### 1. 📄 [Práctica 1](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-1.sql)
Enfocada en consultas básicas de selección (`SELECT`), ordenamiento (`ORDER BY`), límites (`LIMIT`) y filtrado (`WHERE`) de la tabla `Clientes`:
*   Obtención de clientes de mayor y menor edad ordenados por fecha de nacimiento.
*   Búsqueda exacta por fechas de nacimiento (`1994-12-25`).
*   Consultas por identificadores individuales o grupos (`IN(...)`).
*   Búsqueda de clientes de un género específico.
*   Búsqueda con comodines de patrones en nombres y apellidos (`LIKE '%DAVID%'` / `LIKE '%SANTANA%'`).

### 2. 📄 [Práctica 2](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-2.sql)
Centrada en el formateo condicional de datos utilizando expresiones lógicas `CASE WHEN`, búsquedas combinadas y funciones de agregación:
*   Mapeo de géneros de formato corto ('M'/'F') a nombres completos ('Masculino'/'Femenino').
*   Mapeo de estados ('A', 'S', 'L', 'V') a descripciones legibles ('Activo', 'Suspendido', 'Licencia', 'Vacaciones') para los empleados.
*   Filtrado de empleados que no poseen supervisor (`IS NULL`).
*   Rango de IDs de empleados nacidos antes de cierto año utilizando operadores lógicos combinados (`BETWEEN`, `AND`, `YEAR()`).
*   Uso de funciones agregadas como `COUNT(*)` para contar empleados bajo condiciones específicas.

### 3. 📄 [Práctica 3](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-3.sql)
Práctica de operaciones de definición y manipulación de datos (CRUD) creando un esquema aislado:
*   Creación de la base de datos `Practica3`.
*   Creación de la tabla `Producto` con auto-incremento, valores por defecto e identificador primario.
*   Inserción masiva de productos (`Laptop`, `Tablet`, `Smartphone`).
*   Actualizaciones específicas de campos (`UPDATE`) de manera individual o múltiple por ID.
*   Eliminación física de registros (`DELETE`).

### 4. 📄 [Práctica 4](file:///home/hanuel/main/personal/courses/programming/infotep-jadom/practice-4.sql)
Práctica avanzada de diseño DDL y establecimiento de relaciones de integridad referencial (Claves Foráneas):
*   Creación de la base de datos `Practica4`.
*   Diseño de la tabla `Pais` con restricciones de valores únicos (`UNIQUE`) y valores de verificación (`CHECK`).
*   Diseño de la tabla `Empleado` conectada mediante una clave foránea (`FOREIGN KEY`) a `Pais`.
*   Definición de restricciones `CHECK` personalizadas en el género, condiciones de empleo y estado civil.
*   Inserción de datos de prueba respetando la integridad referencial.
*   Validación final mediante consultas que muestran la correcta inserción y relación de los datos.

---

## 🛠️ Tecnologías Utilizadas
*   **Gestor de Base de Datos**: MySQL / MariaDB.
*   **Editor/IDE**: SQL Workbench u otros clientes de base de datos compatibles con MySQL.
