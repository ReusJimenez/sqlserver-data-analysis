DROP TABLE empleados;
SELECT * FROM all_tables where owner ='ROBERTO';
CREATE TABLE empleados(
  documento CHAR(8),
  nombre VARCHAR2(20),
  apellido VARCHAR2(20),
  sueldo NUMBER(6,2),
  fechaingreso DATE
);

INSERT INTO empleados VALUES('22222222', 'Juan', 'Perez', 300, TO_DATE('10/10/1980', 'DD/MM/YYYY'));
INSERT INTO empleados VALUES('22333333', 'Luis', 'Lopez', 300, TO_DATE('12/05/1998', 'DD/MM/YYYY'));
INSERT INTO empleados VALUES('22444444', 'Marta', 'Perez', 500, TO_DATE('25/08/1990', 'DD/MM/YYYY'));
INSERT INTO empleados VALUES('22555555', 'Susana', 'Garcia', 400, TO_DATE('05/05/2000', 'DD/MM/YYYY'));
INSERT INTO empleados VALUES('22666666', 'Jose Maria', 'Morales', 400, TO_DATE('24/10/2005', 'DD/MM/YYYY'));

-- 3. Procedimiento para aumentar sueldo según la antiguedad en la empresa
CREATE OR REPLACE PROCEDURE pa_empleados_aumentarsueldo(ayear IN NUMBER, aporcentaje IN NUMBER)
AS
BEGIN
  UPDATE empleados SET sueldo = sueldo + (sueldo * aporcentaje / 100)
  WHERE (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fechaingreso)) > ayear; -- diferencia entre año actual y año de ingreso > ayear
END;
/

-- 4. Ejecute el procedimiento creado anteriormente.
EXECUTE pa_empleados_aumentarsueldo(10, 20);
SELECT * FROM empleados;

-- 6. Ejecute el procedimiento creado anteriormente, enviando otros valores como parámetros (por ejemplo, 8 y 10)
EXECUTE pa_empleados_aumentarsueldo(8, 10);
SELECT * FROM empleados;

-- 8. Ejecute el procedimiento almacenado "pa_empleados_aumentarsueldo" sin parámetros
EXECUTE pa_empleados_aumentarsueldo; -- error

-- 9. Procedimiento para ingresar nuevos empleados
CREATE OR REPLACE PROCEDURE pa_empleados_ingresar(adocumento IN CHAR, anombre IN VARCHAR2, aapellido IN VARCHAR2)
AS
BEGIN
  INSERT INTO empleados VALUES(adocumento, anombre, aapellido, NULL, NULL);
END;
/

-- 10. Ejecute el procedimiento creado anteriormente y verifique si se ha ingresado en "empleados" un nuevo registro
EXECUTE pa_empleados_ingresar('30000000', 'Ana', 'Acosta');
SELECT * FROM empleados;

-- 11. Reemplazar procedimiento para ingresar empleados con valores por defecto
CREATE OR REPLACE PROCEDURE pa_empleados_ingresar(adocumento IN CHAR DEFAULT NULL, afecha IN DATE DEFAULT SYSDATE)
AS
BEGIN
  INSERT INTO empleados VALUES(adocumento, NULL, NULL, NULL, afecha);
END;
/

-- 12. Ejecute el procedimiento creado anteriormente enviándole valores para los 2 parámetros y verifique si se ha ingresado un nuevo registro
EXECUTE pa_empleados_ingresar('32222222', TO_DATE('10/10/2007', 'DD/MM/YYYY'));
SELECT * FROM empleados;

-- 13. Ejecute el procedimiento creado anteriormente enviando solamente la fecha de ingreso
EXECUTE pa_empleados_ingresar ('15/12/2000'); -- muestra un mensaje de error indicando que el valor es muy grande, ya que DOCUMENTO admite 8 caracteres.
EXECUTE pa_empleados_ingresar (TO_DATE('15/12/2000', 'DD/MM/YYYY')); -- 2da opcion, coloca la fecha en DOCUMENTO...

-- 14. Procedimiento para eliminar empleado por documento
CREATE OR REPLACE PROCEDURE pa_empleado_eliminar(adocumento IN VARCHAR2)
AS
BEGIN
  DELETE FROM empleados WHERE documento = adocumento;
END;
/

-- 15. Elimine un empleado empleando el procedimiento del punto anterior
EXECUTE pa_empleado_eliminar('30000000');
SELECT * FROM empleados;




/*
// EJEMPLO DE CLASE
drop table libros;
drop table tabla1;

CREATE TABLE libros(
  titulo VARCHAR2(40),
  autor VARCHAR2(30),
  editorial VARCHAR2(20),
  precio NUMBER(5,2)
);

INSERT INTO libros VALUES ('Uno','Richard Bach','Planeta',15);
INSERT INTO libros VALUES ('Ilusiones','Richard Bach','Planeta',12);
INSERT INTO libros VALUES ('El aleph','Borges','Emece',25);
INSERT INTO libros VALUES ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
INSERT INTO libros VALUES ('Matematica estas ahi','Paenza','Nuevo siglo',18);
INSERT INTO libros VALUES ('Puente al infinito','Bach Richard','Sudamericana',14);
INSERT INTO libros VALUES ('Antología','J. L. Borges','Paidos',24);
INSERT INTO libros VALUES ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
INSERT INTO libros VALUES ('Cervantes y el quijote','Borges- Casares','Planeta',34);

CREATE TABLE tabla1( 
  titulo VARCHAR2(40),
  precio NUMBER(6,2)
);

-- procedimiento
CREATE OR REPLACE PROCEDURE pa_autorlibro(atitulo IN VARCHAR2)
AS
  vautor VARCHAR2(20);
BEGIN
  SELECT autor INTO vautor FROM libros WHERE titulo = atitulo; -- guarda en la variable local vautor el autor que coincide el titulo con el atitulo pasado como parametro
  INSERT INTO tabla1
  SELECT titulo, precio
  FROM libros
  WHERE autor = vautor;
END;
/
 
EXEC pa_autorlibro('Uno');

SELECT * FROM tabla1;
*/