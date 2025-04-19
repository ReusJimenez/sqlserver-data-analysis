-- Creaci�n de las tablas
CREATE TABLE departamento (
    id_departamento NUMBER PRIMARY KEY,
    nombre_departamento VARCHAR2(100),
    ubicacion VARCHAR2(100),
    descripcion VARCHAR2(255)
);

CREATE TABLE empleados (
    id_empleado NUMBER PRIMARY KEY,
    nombre_empleado VARCHAR2(100),
    apellido_empleado VARCHAR2(100),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE,
    departamento_id NUMBER,
    CONSTRAINT fk_departamento_empleados FOREIGN KEY (departamento_id) REFERENCES departamento(id_departamento)
);

-- Inserci�n de datos
INSERT INTO departamento VALUES (1, 'Ventas', 'Edificio A', 'Departamento de ventas');
INSERT INTO departamento VALUES (2, 'Recursos Humanos', 'Edificio B', 'Departamento de recursos humanos');
INSERT INTO departamento VALUES (3, 'Desarrollo', 'Edificio C', 'Departamento de desarrollo de software');

INSERT INTO empleados VALUES (1, 'Juan', 'P�rez', 50000.00, TO_DATE('01-01-2022', 'DD-MM-YYYY'), 1);
INSERT INTO empleados VALUES (2, 'Ana', 'G�mez', 60000.00, TO_DATE('15-02-2021', 'DD-MM-YYYY'), 2);
INSERT INTO empleados VALUES (3, 'Carlos', 'Mart�nez', 55000.00, TO_DATE('10-03-2020', 'DD-MM-YYYY'), 1);
INSERT INTO empleados VALUES (4, 'Mar�a', 'L�pez', 48000.00, TO_DATE('05-06-2022', 'DD-MM-YYYY'), 3);
INSERT INTO empleados VALUES (5, 'Pedro', 'S�nchez', 52000.00, TO_DATE('20-09-2021', 'DD-MM-YYYY'), 2);
INSERT INTO empleados VALUES (6, 'Laura', 'D�az', 53000.00, TO_DATE('12-11-2020', 'DD-MM-YYYY'), 1);
INSERT INTO empleados VALUES (7, 'Miguel', 'Rodr�guez', 57000.00, TO_DATE('03-04-2022', 'DD-MM-YYYY'), 3);
INSERT INTO empleados VALUES (8, 'Sara', 'Fern�ndez', 49000.00, TO_DATE('18-07-2021', 'DD-MM-YYYY'), 2);
INSERT INTO empleados VALUES (9, 'Javier', 'Garc�a', 62000.00, TO_DATE('25-10-2020', 'DD-MM-YYYY'), 1);
INSERT INTO empleados VALUES (10, 'Carmen', 'Hern�ndez', 58000.00, TO_DATE('08-12-2022', 'DD-MM-YYYY'), 3);
INSERT INTO empleados VALUES (11, 'Daniel', 'Jim�nez', 55000.00, TO_DATE('15-03-2021', 'DD-MM-YYYY'), 2);

-- Describir la estructura de las tablas
DESCRIBE departamento;
DESCRIBE empleados;

-- Eliminar tablas
DROP TABLE departamento;
DROP TABLE empleados;

-- Modificar la tabla empleados: a�adir una columna llamada email
ALTER TABLE empleados ADD email VARCHAR2(255);

-- Modificar la tabla empleados: cambiar la longitud de la columna email
ALTER TABLE empleados MODIFY email VARCHAR2(100); -- MODIFY

-- Modificar la tabla empleados: eliminar la columna email
ALTER TABLE empleados DROP COLUMN email;

-- Renombrar una tabla
ALTER TABLE Empleados RENAME TO Empleados_Nuevos;


--
ALTER TABLE Empleados ADD CONSTRAINT pk_empleados PRIMARY KEY (ID);

ALTER TABLE Empleados DROP CONSTRAINT pk_empleados;

ALTER TABLE DetallesCompra ADD CONSTRAINT fk_compra_empleado FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID);


-- Mostrar las tablas en la base de datos BD_pruebas (equivalente a SHOW TABLES en MySQL)
SELECT * FROM all_tables;
SELECT * FROM all_tables WHERE owner ='ROBERTO';

-- Visualizamos todos los objetos que son procedimientos almacenados
SELECT * FROM user_objects WHERE object_type='PROCEDURE'; 

-- Visualizamos los procedimientos almacenados que empiencen con PA
SELECT * FROM user_procedures WHERE object_name like 'PA_%';

-- Consultas SELECT
SELECT nombre_empleado, salario FROM empleados;
SELECT * FROM empleados WHERE salario > 55000;
SELECT * FROM empleados WHERE nombre_empleado LIKE 'C%';
SELECT * FROM empleados WHERE nombre_empleado LIKE 'A__';
SELECT * FROM empleados WHERE salario BETWEEN 55000 AND 62000;

-- INSERT, UPDATE y DELETE (requerir�n ajustes)
INSERT INTO empleados (id_empleado, nombre_empleado, apellido_empleado, salario)
VALUES (12, 'Juanita', 'Gonz�lez', 40000.00);

UPDATE empleados SET fecha_contratacion = TO_DATE('05-02-2022', 'DD-MM-YYYY'), departamento_id = 2
WHERE id_empleado = 12;

DELETE FROM empleados WHERE id_empleado = 12;
DELETE FROM empleados WHERE nombre_empleado LIKE 'J%';
DELETE FROM empleados WHERE nombre_empleado LIKE 'J%' AND id_empleado = 12;

-- GROUP BY
SELECT departamento_id, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento_id;

-- HAVING
SELECT departamento_id, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento_id
HAVING AVG(salario) >= 55000;

-- ORDER BY
SELECT departamento_id, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento_id
ORDER BY salario_promedio DESC;


-- Funciones SQL para Manipular Cadenas
-- TO_CHAR(): convierte otros tipos de datos, como fechas o n�meros, en cadenas de caracteres
SELECT TO_CHAR(123.45) FROM dual; -- Resultado: '123.45' (cadena de caracteres)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual; -- Resultado: '2024-01-07' (cadena que representa la fecha actual en el formato especificado)
-- TO_DATE(): Convierte una cadena de caracteres en un valor de fecha.
SELECT TO_DATE('2023-01-15', 'YYYY-MM-DD') FROM dual; -- Resultado: 15/01/2023 (dependiendo del formato de fecha de tu sistema)
-- CONCAT(): Combina dos o más cadenas en una sola.
SELECT CONCAT('Hola ', 'Mundo') FROM dual; -- Resultado: Hola Mundo
-- SUBSTR(): Devuelve una parte de una cadena, basada en una posici�n inicial y una longitud.
SELECT SUBSTR('OpenAI', 1, 4) FROM dual; -- Resultado: Open
-- UPPER() y LOWER(): Convierten una cadena a may�sculas o min�sculas, respectivamente.
SELECT UPPER('hola') FROM dual; -- Resultado: HOLA
SELECT LOWER('HOLA') FROM dual; -- Resultado: hola
-- ROUND(): Redondea un n�mero a un n�mero espec�fico de decimales.
SELECT ROUND(123.4567, 2) FROM dual; -- Resultado: 123.46
-- COALESCE(): Devuelve el primer valor no nulo en una lista de argumentos.
SELECT COALESCE(NULL, 'Valor por defecto') FROM dual; -- Resultado: Valor por defecto


-- Procedimiento almacenado sin par�metros:
CREATE OR REPLACE PROCEDURE pa_EmpleadosDepartamentoSinParametros
AS
BEGIN
  UPDATE empleados SET salario = salario + (salario*0.10);
END;
/

-- ejecutar procedimiento almacenado
EXEC pa_EmpleadosDepartamentoSinParametros;

-- eliminar procedimiento almacenado
DROP PROCEDURE pa_EmpleadosDepartamentoSinParametros;


-- Procedimiento almacenado con par�metros:
CREATE OR REPLACE PROCEDURE pa_AumentarSalarioPorDepartamento(departamento_id NUMBER, aumento DECIMAL)
AS
BEGIN
  UPDATE empleados SET salario = salario + aumento
  WHERE id_departamento = departamento_id from departamento, empleados;
END;
/

EXEC pa_AumentarSalarioPorDepartamento(1, 5000.00);


-- Funciones
-- Funciones Escalares
CREATE OR REPLACE FUNCTION suma(a NUMBER, b NUMBER) 
RETURN NUMBER 
IS
    resultado NUMBER;
BEGIN
    resultado := a + b;
    RETURN resultado;
END suma;

-- Llamar a una funci�n
SELECT suma(10, 20) AS resultado_suma FROM dual;

-- Eliminaci�n de funciones
DROP FUNCTION suma;


-- Funciones con Consultas
CREATE OR REPLACE FUNCTION contar_empleados(dept_id NUMBER) 
RETURN NUMBER 
IS
    total_empleados NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total_empleados
    FROM empleados
    WHERE departamento_id = dept_id;

    RETURN total_empleados;
END contar_empleados;

SELECT contar_empleados(1) AS total_empleados FROM dual;


-- Funciones con Cursores
CREATE OR REPLACE FUNCTION obtener_empleados(dept_id NUMBER) 
RETURN SYS_REFCURSOR 
IS
    empleados_cursor SYS_REFCURSOR;
BEGIN
    OPEN empleados_cursor FOR
    SELECT *
    FROM empleados
    WHERE departamento_id = dept_id;

    RETURN empleados_cursor;
END obtener_empleados;

-- Usando una sentencia an�nima PL/SQL para trabajar con el cursor retornado
SET SERVEROUTPUT ON
DECLARE
    empleados_cursor SYS_REFCURSOR;
    emp_id empleados.id%TYPE;
    emp_name empleados.nombre%TYPE;
BEGIN
    empleados_cursor := obtener_empleados(2);
    LOOP
        FETCH empleados_cursor INTO emp_id, emp_name;
        EXIT WHEN empleados_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || emp_id || ', Nombre: ' || emp_name);
    END LOOP;
    CLOSE empleados_cursor;
END;


-- Funciones con Manipulaci�n de Cadenas
CREATE OR REPLACE FUNCTION concatenar_cadenas(a VARCHAR2, b VARCHAR2) 
RETURN VARCHAR2 
IS
    cadena_concatenada VARCHAR2(100);
BEGIN
    cadena_concatenada := a || ' ' || b;
    RETURN cadena_concatenada;
END concatenar_cadenas;

SELECT concatenar_cadenas('Hola', 'Mundo') AS cadena_concatenada FROM dual;

