--- SELECT y condicionales ==========================================================

--EJEMPLO COMPLETO DE "THE BIG 6 STATEMENTS IN SQL"
SELECT SEXO , COUNT(*) CANT
FROM CLIENTES
WHERE NOMBRE IS NOT NULL
GROUP BY SEXO
HAVING COUNT(*) > 16000
ORDER BY CANT DESC

--DELETE, INSERT = actualización a nivel de disco
--UPDATE = actualiza pero hace 2 comandos, hace DELETE e INSERT
--Es importante saberlo porque implica mas procesamiento y tiempo
--Por ende, según que circunstancias, puede ser mejor hacer un nuevo campo, solo INSERT

-- ====================================================================
-- DELETE
SELECT * FROM CLIENTES
WHERE NUMDOC = '01544354' AND id = 320081 AND telefono='959343148'

DELETE FROM CLIENTES
WHERE NUMDOC = '01544354' AND id = 320081

--sin FROM, bueno en este caso, pero no para tablas cruzadas
DELETE CLIENTES 
WHERE NUMDOC = '01544354' AND id = 320081

--con alias
DELETE A
FROM CLIENTES A
WHERE NUMDOC = '01544354' AND id = 320081

-- ====================================================================
--Como Analista de datos...
--"Es importante que para hacer DELETE, sepas que vas a eliminar"

--Ejemplo: Decidiré la eliminación siguiente:
DELETE FROM CLIENTES
WHERE nombre='Marcelo'

--A partir de haber analizado esto:
--CUANTOS CLIENTES TIENEN COMO NOMBRE MARCELO?
SELECT COUNT(*) AS cantidad_clientes --omitir el AS no afecta
FROM CLIENTES 
WHERE NOMBRE = 'Marcelo' --usar LIKE o =, es indiferente en este caso

-- ====================================================================
-- INSERT
CREATE TABLE ALUMNOS_G19 (NOMBRE VARCHAR(50), APELLIDO VARCHAR(100), EMAIL VARCHAR(100))
SELECT * FROM ALUMNOS_G19

--A TRAVES DE UNA CONSULTA
INSERT INTO ALUMNOS_G19 (NOMBRE, APELLIDO)
SELECT NOMBRE, apellidoPaterno FROM CLIENTES
WHERE NOMBRE IS NOT NULL

--CON VALORES MANUALES
--NOMINAL, TIENE TARGET (se especifica las columnas, seleccionando las necesarias o cambiando el orden)
INSERT INTO ALUMNOS_G19 (nombre, apellido)
VALUES 
('NIXON3', 'LLANOS'), 
('NIXON4', 'LLANOS')

--NO NOMINAL
INSERT INTO ALUMNOS_G19 
VALUES 
('REUS1', 'JIMENEZ', 'reusjimenez@gmail.com'), 
('REUS2', 'JIMENEZ', 'reusjimenez@gmail.com')

-- ====================================================================
--Como Analista de datos...
--"Es importante que para hacer UPDATE, sepas que vas a actualizar"

--Ejemplo en tabla:
SELECT * FROM ALUMNOS_G19
WHERE EMAIL IS NULL

UPDATE ALUMNOS_G19 
SET EMAIL = 'generico@gmail.com'
WHERE EMAIL IS NULL

--Ejemplo en registro:
SELECT * FROM ALUMNOS_G19
WHERE nombre = 'REUS' AND apellido = 'JIMENEZ'

UPDATE ALUMNOS_G19
SET 
email = 'reus_actualizado@gmail.com',
nombre = 'REUS'
WHERE nombre = 'REUS1' AND apellido = 'JIMENEZ'

-- ====================================================================
--OPERADORES DE COMPARACIÓN
SELECT COUNT(*) FROM OFERTAS
WHERE LINEA > 1000

SELECT COUNT(*) FROM OFERTAS
WHERE LINEA < 1000

SELECT COUNT(*) FROM OFERTAS
WHERE LINEA = 1000

SELECT COUNT(*) FROM OFERTAS
WHERE LINEA != 1000 -- También se puede con <>

--BETWEEN
SELECT COUNT(*) FROM OFERTAS
WHERE LINEA >= 1000 AND LINEA <= 5000 --bueno, pero estando asi, mejor BETWEEN por lectura, optimizacion es lo mismo

SELECT COUNT(*) FROM OFERTAS
WHERE LINEA BETWEEN 1000 AND 5000 --incluye los limites, los igual que basicamente

--IN
SELECT * FROM AGENCIAS
WHERE AGENCIA IN ('AG. AREQUIPA','AG. CAJAMARCA','AG. CUSCO')

SELECT * FROM AGENCIAS
WHERE AGENCIA IN (
	SELECT AGENCIA FROM COLABORADORES 
	WHERE CODIGO_TRABAJADOR = '10001'
)

--LIKE
---- % = PORCENTAJE, NO TIENE UN LARGO DEFINIDO
---- _ = GUION BAJO, TIENE UN LARGO DEFINIDO

SELECT * FROM CLIENTES
WHERE NOMBRE LIKE 'CLA%'

SELECT * FROM CLIENTES
WHERE NOMBRE LIKE '%DIA'

SELECT * FROM CLIENTES
WHERE NOMBRE LIKE 'CL%IA'

SELECT * FROM CLIENTES
WHERE NOMBRE LIKE 'CLA____'

SELECT * FROM CLIENTES
WHERE NOMBRE LIKE '____DIA'

SELECT * FROM CLIENTES
WHERE NOMBRE LIKE 'CL___IA'

--Ejemplo de uso: 
--búsqueda de placas, se tiene una parte de la placa y se sabe el limite de caracteres

--OJOOOOOOOOOOOOOOOO
--Pendiente de buscar las REGULAR EXPRESIÓN

-- ====================================================================
--IS NULL

SELECT * FROM OFERTAS
WHERE LINEA = NULL --No existe

SELECT * FROM OFERTAS
WHERE LINEA IS NULL --Correcto

--- identifica si el valor es nulo y cambia el valor por uno especifico
SELECT 'HOLA MUNDO' + ISNULL(NULL,' QUE TAL')

--- cambia de valor a null si encuentra un valor especifico
SELECT 'HOLA MUNDO' + NULLIF('HOLA' ,'HOLA' )
SELECT 'HOLA MUNDO' + NULL

SELECT top  1
	'el producto es:' +   nullif (codigo_producto,'PLD')
FROM OFERTAS
where  codigo_producto  != 'pld'

SELECT top  1
	'el producto es:' + nullif (codigo_producto,'PLD')
FROM OFERTAS
where  codigo_producto  = 'pld'

--Ejemplo de uso:
select 1000/nullif(0,0)
--Se muestra NULL, en vez de error, porque dividir entre 0 da error

-- ====================================================================
--concat
--convierte todo lo null como si fuera un vacio

select concat(
	'hola mundo',
	null
)

select concat(
	'hola mundo',
	cast(1 as varchar)
)

-- ====================================================================
--OPERADORES LÓGICOS (operaciones entre condiciones AND OR NOT)

--CONDICIÓN 1 AND CONDICIÓN 2 
--CONDICIÓN 1 OR CONDICIÓN 2
--NOT (CONDICIÓN 1)

SELECT TOP 100 * FROM OFERTAS
WHERE LINEA <5000 AND tasa > 20

SELECT TOP 100 * FROM OFERTAS
WHERE LINEA <5000 OR tasa > 20

SELECT TOP 100 * FROM OFERTAS
WHERE NOT(LINEA = 5000)

--OJO: para OR, tener cuidado de si se hará varios ...OR es recomendable usar ()
SELECT TOP 100 * FROM OFERTAS
WHERE (LINEA <5000 OR tasa > 20) 
