--- Introducción ====================================================================
--DQL: SELECT
----Según ciertos autores, SELECT pertenece a DML
----DML: SELECT , INSERT , DELETE , UPDATE

--Comandos útiles de teclado
----control + k  + control + c = comento
----control + k  + control + u = descomento
----control + r = mostrar/ocultar ventana de resultados

--Para tener información de una columna
----ALT + F1 + sombrear nombre de columna elegida (AGENCIAS)
----O, ejecutar: SP_HELP 'AGENCIAS'

-- ====================================================================
-- CONSULTA NO NOMINAL
SELECT * FROM AGENCIAS
SELECT TOP 10 * FROM AGENCIAS
SELECT TOP 30 PERCENT * FROM AGENCIAS

-- CONSULTA NOMINAL
-- Contiene nombre de columnas
SELECT
	AGENCIA,
	FechaApertura
FROM AGENCIAS

SELECT TOP 10 AGENCIA, FechaApertura FROM AGENCIAS

-- ====================================================================
--SELECT POR COLUMNAS
---- Select con todas las columnas (Con Management)
---- Clic derecho en tabla, Script Table as, SELECT TO, Clipboard
SELECT [AGENCIA]
      ,[GERENTE_REGIONAL]
      ,[GERENTE_AGENCIA]
      ,[FechaApertura]
FROM [dbo].[AGENCIAS]

---- Select con todas las columnas (Con multicursor)
---- SHIFT + ALT + Flecha hacia abajo
SELECT
	AGENCIA
	,GERENTE_REGIONAL
	,GERENTE_AGENCIA
	,FechaApertura
FROM OFERTAS

-- ====================================================================
--LOS ALIAS
---- Alias en tablas
SELECT A.AGENCIA, A.FechaApertura FROM AGENCIAS AS A
SELECT B.AGENCIA, B.FechaApertura FROM AGENCIAS B --Se puede omitir AS, si esta bien estructurado
SELECT TB_1.AGENCIA, TB_1.FechaApertura FROM AGENCIAS TB_1
SELECT [TB 2].AGENCIA, [TB 2].FechaApertura FROM AGENCIAS [TB 2]

---- Alias en columnas
PRINT 'HOLA MUNDO'  --Funcionamiento tipico

SELECT 'HOLA MUNDO' --Funciona en formato tabla, pero no dice nombre de columna
SELECT 'HOLA MUNDO' AS MENSAJE
SELECT 'HOLA MUNDO' [% INDICADORES DE MORA DE CONTENCIÓN] --Se puede omitir AS, si esta bien estructurado

---- Alias en tablas y columnas
SELECT A.AGENCIA, A.GERENTE_AGENCIA [GERENTE ZONAL DE AGENCIAS] 
FROM AGENCIAS AS A

SELECT COUNT(*) AS [CANTIDAD DE REGISTROS] 
FROM AGENCIAS
