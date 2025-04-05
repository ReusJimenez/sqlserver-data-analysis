--- SESION 4 =======================================================================
--- FUNCIONES DE FECHA

--- TIPOS DE DATOS

--- NUMERICO: INT , NUMERIC , DECIMAL , FLOAT , BIGINT , SMALLINT 
--- TEXTO:  VARCHAR , NVARCHAR , CHAR 
--- FECHA:  DATE , DATETIME


--- GETDATE()------------------------------------------------------------------------------------------------
SELECT GETDATE()  --- DATETIME, devuelve DATE-fecha y TIME-hora
SELECT GETDATE() - 1 --- ES LA RESTA DE DIAS, es bueno porque es simple

--- uso de CAST (OBTENEMOS EL DATE, no DATETIME)
select cast( GETDATE()  as date)  --- conversion simple
select cast ('20250311' as date) --- es un numero pero es compatible porque hace date lo hace 2025-03-11

--- uso de convert
select convert( date ,   '20250311' , 112 )  --- conversion con formato
--- para esto se usa una tabla de conversion que se busca en google: 112 o 12 (yyyymmdd), ...


--- DATEADD(tipo de intervalo, numero, fecha)----------------------------------------------------------------
select  DATEADD(day , 1, GETDATE())
select  DATEADD(dd , +1, '20250311') --es preferible este porque despues se usar mas dd, mm, ...

select  DATEADD(month , +1, GETDATE())
select  DATEADD(mm , +1, '20250311')
select  DATEADD(mm , -1, '20250331') --NOTA: aqui le reste un mes (resto 31 dias), pero como el mes anterior es febrero, lo lleva al 28 como ultimo dia 
select  DATEADD(mm , +1, '20250228') --NOTA: aqui le sume un mes (sumo 28 dias), pero como el mes actual es febrero, lo lleva al 28 como ultimo dia

select  DATEADD(year ,+1, GETDATE())
select  DATEADD(yy , +1, '20250311')

select  DATEADD(day ,-1, GETDATE())
select  DATEADD(dd , -1, '20250311')

select  DATEADD(month , -1, GETDATE())
select  DATEADD(mm , -1, '20250311')


select  DATEADD(HOUR , +1, GETDATE())
select  DATEADD(HH , +1, '20250311') --en este caso es preferible getdate(), sino seria colocar '2025-03-11 00:00:00', muy especifico o tedioso

select  DATEADD(MINUTE , +1, GETDATE())
select  DATEADD(MM , 1, '20250311') --en este caso es preferible getdate(), sino seria colocar '2025-03-11 00:00:00', muy especifico o tedioso


--- DATEDIFF(tipo de intervalo, fecha 1, fecha 2)------------------------------------------------------------
select datediff(YEAR , '19870201', GETDATE())
select datediff(MONTH , '19870201', GETDATE())
select datediff(dd , '19870201', GETDATE())
---select datediff(dd , GETDATE(), '20250311')---en este caso da en negativo, esta mal en resumen


--- DATEPART(tipo de intervalo, fecha)------------------------------------------------------------
select YEAR(GETDATE())
select MONTH(GETDATE())
select DAY(GETDATE())

--- es necesario el dateparte para cuestiones de HOUR, MINUTE, SECOND, MILLISECOND, ...
--- tambien puedes usarlo con YEAR, MONTH, DAY aunque no es necesario
SELECT DATEPART(YEAR,GETDATE())
SELECT DATEPART(MONTH,GETDATE())
SELECT DATEPART(DAY,GETDATE())

SELECT DATEPART(HOUR,GETDATE())
SELECT DATEPART(MINUTE,GETDATE())
SELECT DATEPART(SECOND,GETDATE())
SELECT DATEPART(MILLISECOND,GETDATE())

--- con un solo select se puede llamar a varios,deespues le haces columna si quieres...
SELECT DATEPART(HOUR,GETDATE()) , DATEPART(MINUTE,GETDATE()) 


--- EOMONTH(fecha)------------------------------------------------------------------------------------------------
PRINT DAY(EOMONTH('20250301'))
select DAY(EOMONTH('20250301'))

--- FORMAT(fecha, formato)------------------------------------------------------------------------------------------------
PRINT FORMAT(cast('20250311' as date), 'yyyy*_*MM*_*dd')   --- CONVIERTE A TEXTO, NECESITA UN FORMATO
PRINT FORMAT(getdate(), 'yyyy-MM-dd')   --- CONVIERTE A TEXTO, NECESITA UN FORMATO
SELECT FORMAT(getdate(), 'yyyy*_*MM*_*dd')

--genera el periodo de la fecha actual : 202503
PRINT FORMAT(cast('20250311' as date), 'MM-yyyy')   --- CONVIERTE A TEXTO, NECESITA UN FORMATO
PRINT FORMAT(getdate(), 'MM-yyyy')   --- CONVIERTE A TEXTO, NECESITA UN FORMATO

--genera el dia 1 del mes actual : 20250301
PRINT FORMAT(cast('2025-03-11' as date), 'yyyyMM01')   --- CONVIERTE A TEXTO, NECESITA UN FORMATO

--
PRINT cast(FORMAT(cast('20250311' as date), 'yyyyMM01') as date)  --- CONVIERTE A TEXTO, NECESITA UN FORMATO
PRINT cast(FORMAT(getdate(), 'yyyyMM01') as date)  --- CONVIERTE A TEXTO, NECESITA UN FORMATO

select dateadd(day, -(DAY('20250321')-1) , cast('20250321' as date) ) ----- forma mas compleja haciendo calculos raros, el de arriba es mas optimo con cast y format


--- DATENAME(tipo de intervalo, fecha)------------------------------------------------------------------------------------------------
SELECT DATENAME(DAYOFYEAR, GETDATE());
SELECT DATENAME(WEEK, GETDATE()); --numero de semana
SELECT DATENAME(WEEKDAY, GETDATE());
SELECT DATENAME(MONTH, GETDATE());
SELECT DATENAME(YEAR, GETDATE());

-- es superado por format
print FORMAT(cast('2025-03-11' as date) , 'ddd' ) --arroja el formato corto en letras
print FORMAT(cast('2025-03-11' as date) , 'dddd' ) --arroja el formato largo en letras
print FORMAT(cast('2025-03-11' as date) , 'mmm' ) --arroja el formato corto en letras
print FORMAT(cast('2025-03-11' as date) , 'mmmm' ) --arroja el formato largo en letras
-- para yyyy no funciona como tal al parecer, o saldria lo mismo


--- ISDATE(expresion)------------------------------------------------------------------------------------------------
SELECT ISDATE('2025-02-28');
--- 0 es No, 1 es Si


-----------------------------------PRACTICAR----------------------------------------
-- conociendo las tablas
select top 1000 * from OFERTAS
select top 1000 * from GESTION_DETALLE
select top 1000 * from GESTION
select top 1000 * from COLABORADORES
select top 1000 * from AGENCIAS

SELECT TOP 100 NumDoc, DATEDIFF(yy, FechaRegistroGestion, GETDATE())
FROM OFERTAS
WHERE FechaRegistroGestion is not null
 
---- cuales son los periodos que existen en la tabla ofertas --- PeriodoVigencia
select DISTINCT Periodovigencia
from OFERTAS

---- cuales son los productos que existen en la tabla ofertas --- codigo_producto
select DISTINCT codigo_producto
from OFERTAS

------------------conteo de ofertas entre 3 meses-----------------------------
-- primero:
select MIN(FechaRegistroGestion) , MAX(FechaRegistroGestion) from OFERTAS
-- 2021-05-07 12:12:00				2023-09-01 19:10:00

select COUNT(*) from OFERTAS
where cast(FechaRegistroGestion as date) >= '20210501' and cast( FechaRegistroGestion  as date)    <=  '20230901'
-- NOTA MUY IMPORTANTE:
-- se usa el cast (... as date) porque sino no se toma todos los registros, es decir, si hubo un registro el 202408 a las 01:00:00 no contaria
-- porque sin el cast, solo se cuenta hasta las 00:00:00, asi que es preferible contar las de todo el dia, es decir, USAR EL CAST
-- sin cast: 160 916
-- con cast: 161 559

select COUNT(*) from OFERTAS
where cast(FechaRegistroGestion as date)  between  '20210501' and '20230901'  
-- NOTA MUY IMPORTANTE (se repite la explicacion):
-- se usa el cast (... as date) porque sino no se toma todos los registros, es decir, si hubo un registro el 202408 a las 01:00:00 no contaria
-- porque sin el cast, solo se cuenta hasta las 00:00:00, asi que es preferible contar las de todo el dia, es decir, USAR EL CAST
-- sin cast: 160 916
-- con cast: 161 559

-- practica agregando 3 meses mas
select COUNT(*) from OFERTAS
where cast(FechaRegistroGestion as date) between '20210501' and dateadd(mm,+3,'20210501')

-- practica agregando 1 anio mas
select COUNT(*) from OFERTAS
where cast(FechaRegistroGestion as date) between '20210501' and dateadd(yy,+1,'20210501')


-- DUDA de un companera sobre como saber dias habiles de lunes a viernes
-- id , fechaCierre , fechaProceso...... diahabil 
------por transcurridos

--		03-03 --.....04.03........1
--		04-03--------------------------2
--										21


--		01-04 --.....02.04........1
--		02-04--------------------------2
--										21

------por transcurrir
--print datepart(weekday,'20250311')


--------cuantos periodos se tienen a razon de la Fecha de registro de gestion---------------
-- periodo = mes y el anio
select distinct format(FechaRegistroGestion, 'yyyyMM') from OFERTAS
where FechaRegistroGestion is not null





-- ============================================================================
-- Tarea Instrucciones:
-- Realicen una exploraci�n de cada tabla y generen 2 consultas por cada una.  
-- Cada consulta debe incluir al menos 2 condiciones.
-- ============================================================================


-- ===========================================================================================
-- 1. Tabla: Ofertas  
-- ===========================================================================================

-- Exploraci�n: mostrar los primeros registros
SELECT TOP 30 * FROM Ofertas

-- Consulta 1: listar las l�neas �nicas de las ofertas
SELECT DISTINCT Linea
FROM Ofertas 
WHERE Linea is not Null AND Tasa >= 12

-- Consulta 2: Calcular la duraci�n de las ofertas considerando el plazo
SELECT id, FechaInicio, FechaFin, 
	DATEDIFF(DAY, FechaInicio, FechaFin) AS Duracion_Dias, Plazo, NivelRiesgo
FROM Ofertas 
WHERE Plazo IS NOT NULL AND CAST(NivelRiesgo AS FLOAT) > 0.1


-- ===========================================================================================
-- 2. Tabla: Colaboradores  
-- ===========================================================================================

-- Exploraci�n: Mostrar los primeros registros
SELECT TOP 30 * FROM Colaboradores

-- Consulta 1: listar las agencias �nicas en la tabla
SELECT DISTINCT AGENCIA
FROM Colaboradores
WHERE AGENCIA IS NOT NULL AND ESTADO = 'A'

-- Consulta 2: Extraer el a�o de las fechas relacionadas con los colaboradores
SELECT id, NOMBRE, NACIONALIDAD, 
	DATEPART(YEAR, FECHAREGISTRO) AS A�o_Registro, DATEPART(YEAR, FechaREG) AS A�o_FechaREG
FROM Colaboradores
WHERE NACIONALIDAD = 'peruano' AND FECHAREGISTRO IS NOT NULL 
-- Nota: en este ejercicio solo hay 1 registro con fecha en toda la tabla


-- ===========================================================================================
-- 3. Tabla: Agencias  
-- ===========================================================================================

-- Exploraci�n: mostrar los primeros registros
SELECT TOP 30 * FROM Agencias

-- Consulta 1: listar los clusters �nicos de las agencias
SELECT DISTINCT AGENCIA
FROM Agencias
WHERE GERENTE_REGIONAL IS NOT NULL AND GERENTE_AGENCIA IS NOT NULL

-- Consulta 2: C�lculo basado en fecha actual con DATEADD
SELECT AGENCIA, FechaApertura, 
	DATEADD(mm, +6, FechaApertura) as Proxima_Evaluacion
FROM Agencias
WHERE FechaApertura IS NOT NULL AND GERENTE_AGENCIA IS NOT NULL


-- ===========================================================================================
-- 4. Tabla: Gesti�n  
-- ===========================================================================================

-- Exploraci�n: mostrar los primeros registros
SELECT TOP 30 * FROM Gestion

-- Consulta 1: listar los tel�fonos �nicos que gestionaron ofertas
SELECT DISTINCT TelefonoRegistrado 
FROM Gestion 
WHERE TelefonoRegistrado IS NOT NULL AND EstadoGestion = 'Aceptada'

-- Consulta 2: calcular la diferencia de d�as entre dos fechas de gestiones
SELECT Numdoc, FechaRegistro, FechaVolverLllamar, 
	DATEDIFF(DAY, FechaRegistro, FechaVolverLllamar) AS Diferencia_Dias
FROM Gestion
WHERE FechaRegistro IS NOT NULL AND FechaVolverLllamar IS NOT NULL