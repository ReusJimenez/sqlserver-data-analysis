--- JOINS ===========================================================================

--------======inner join==============
--------colaboradores y agencias

------código trabajador  , nombre colaborador , agencia --- alias a , 
--- agencia , gerente agencia y su gerente regional alias b

--select * from COLABORADORES
--select * from AGENCIAS


--SELECT 
--CODIGO_TRABAJADOR,
--NOMBRE,
--AGENCIA 
--FROM [dbo].[COLABORADORES] A


--SELECT 
--AGENCIA
--,GERENTE_REGIONAL
--,GERENTE_AGENCIA
--FROM AGENCIAS B
--ddl
--CREATE... TABLE

--dml
--SELECT 


--DROP TABLE IF EXISTS WT_COLABORADORES_AGENCIAS_2
--INTO WT_COLABORADORES_AGENCIAS_2

SELECT
	A.CODIGO_TRABAJADOR,
	A.NOMBRE,
	A.AGENCIA,
	B.GERENTE_REGIONAL,
	B.GERENTE_AGENCIA,
	c.codigo_producto,
	C.linea,
	C.ResultadoGestion
FROM [dbo].[COLABORADORES] A
	INNER JOIN AGENCIAS B ON A.AGENCIA=B.AGENCIA
	INNER JOIN OFERTAS C ON A.CODIGO_TRABAJADOR = C.CODIGO_TRABAJADOR



SELECT
	A.CODIGO_TRABAJADOR,
	A.NOMBRE,
	A.AGENCIA,
	B.GERENTE_REGIONAL,
	B.GERENTE_AGENCIA,
	C.codigo_producto,
	C.linea,
	C.ResultadoGestion,
	D.DetalleResultado
FROM [dbo].[COLABORADORES] A
	INNER JOIN AGENCIAS B ON A.AGENCIA=B.AGENCIA
	INNER JOIN OFERTAS C ON A.CODIGO_TRABAJADOR = C.CODIGO_TRABAJADOR
	INNER JOIN GESTION_DETALLE D ON C.ResultadoGestion = D.ResultadoGestion
WHERE 
	C.ResultadoGestion = 2 AND C.codigo_producto= 'PLD'

------LEFT JOIN , RIGHT JOIN , FULL OUTER JOIN

SELECT *
FROM AGENCIAS
WHERE AGENCIA='AG. CARSA SAN ISIDRO'
SELECT DISTINCT AGENCIA
FROM AGENCIAS


SELECT *
FROM COLABORADORES A INNER JOIN AGENCIAS B ON A.AGENCIA = B.AGENCIA


SELECT *
FROM COLABORADORES A LEFT JOIN AGENCIAS B ON A.AGENCIA = B.AGENCIA


SELECT *
FROM COLABORADORES A RIGHT JOIN AGENCIAS B ON A.AGENCIA = B.AGENCIA

SELECT *
FROM AGENCIAS A LEFT JOIN COLABORADORES B ON A.AGENCIA = B.AGENCIA
WHERE B.AGENCIA IS NOT NULL

SELECT *
FROM COLABORADORES A FULL JOIN AGENCIAS B ON A.AGENCIA = B.AGENCIA


CREATE TABLE INGENIEROS
(
	ID INT ,
	NOMBRE VARCHAR(100) ,
	AA INT
)

INSERT INTO INGENIEROS
	(ID , NOMBRE , AA )
VALUES
	(1, 'NIXON LLANOS', 20)


CREATE TABLE ARQUITECTOS
(
	ID INT ,
	NOMBRE VARCHAR(100) ,
	AA INT,
	NROPROYECTOS INT
)

INSERT INTO ARQUITECTOS
	(ID , NOMBRE , AA , NROPROYECTOS )
VALUES
	(1, 'NIXON LLANOS', 20 , 50)


--INTO WT_INGENIEROS_ARQUITECTOS

	SELECT ID, NOMBRE , AA , NULL  NROPROYECTOS , 'INGENIEROS'  PROFESION
	FROM INGENIEROS
UNION
	SELECT ID, NOMBRE , AA , NROPROYECTOS  , 'ARQUITECTOS' ESPECIALIDAD
	FROM ARQUITECTOS


--SELECT * FROM WT_INGENIEROS_ARQUITECTOS



--SELECT * FROM [dbo].[GESTION_DETALLE]


--SELECT * FROM [dbo].[GESTION_DETALLE]

--SELECT TOP 10 * FROM COLABORADORES
--WHERE CODIGO_TRABAJADOR IS   NULL



SELECT *
INTO OFERTAS_AU
FROM OFERTAS


--OFERTAS_AU
--OFERTAS


	SELECT *
	FROM OFERTAS_AU
EXCEPT
	SELECT *
	FROM OFERTAS


SELECT *
FROM OFERTAS_AU
WHERE id=127269
SELECT *
FROM OFERTAS
WHERE id=127269


	SELECT ID, NOMBRE, AA
	FROM INGENIEROS
INTERSECT
	SELECT ID, NOMBRE, AA
	FROM ARQUITECTOS


	SELECT ID, NOMBRE, AA
	FROM INGENIEROS
EXCEPT
	SELECT ID, NOMBRE, AA
	FROM ARQUITECTOS


----- SABER CUANTOS  TENGO POR CADA TIPO DE PRODUCTO

--SUM
--COUNT
--AVG
--MAX
--MIN

SELECT PeriodoVigencia , codigo_producto , COUNT(*) CANT , SUM(LINEA) TOTAL_LINEA , AVG(LINEA) PROMEDIO_LINEA 
, MAX(LINEA) MAX_LINEA , MIN(LINEA) MIN_LINEA

FROM OFERTAS
GROUP BY PeriodoVigencia ,  codigo_producto
ORDER BY 1,2


--select * from ofertas with(nolock)


--SELECT PeriodoVigencia , COUNT(*) CANT  FROM OFERTAS
--GROUP BY PeriodoVigencia
--ORDER BY 2 DESC

------DML
DROP TABLE IF EXISTS #temp_nixx
SELECT PeriodoVigencia , codigo_producto , COUNT(*) CANT , SUM(LINEA) TOTAL_LINEA , AVG(LINEA) PROMEDIO_LINEA 
, MAX(LINEA) MAX_LINEA , MIN(LINEA) MIN_LINEA
into #temp_nixx
FROM OFERTAS
GROUP BY PeriodoVigencia ,  codigo_producto
ORDER BY 1,2


------ddl

DROP TABLE IF EXISTS #temp_nixx_2
create table #temp_nixx_2
(
	PeriodoVigencia VARCHAR(20),
	codigo_producto VARCHAR(20),
	CANT INT,
	TOTAL_LINEA FLOAT,
	PROMEDIO_LINEA FLOAT ,
	MAX_LINEA FLOAT ,
	MIN_LINEA FLOAT
)

INSERT INTO #temp_nixx_2
SELECT PeriodoVigencia , codigo_producto   ------ ESTAS COLUMNAS SON DE GRUPO
, COUNT(*) CANT , SUM(LINEA) TOTAL_LINEA , AVG(LINEA) PROMEDIO_LINEA , MAX(LINEA) MAX_LINEA , MIN(LINEA) MIN_LINEA
---- ESTAS SON COLUMNAS DE AGREGACION
FROM OFERTAS
GROUP BY PeriodoVigencia ,  codigo_producto
------ ESTAS COLUMNAS SON DE GRUPO
--ORDER BY 1,2 


SELECT *
INTO ##TEMP_GLOBLA_NIXX
FROM #temp_nixx_2

SELECT *
FROM #temp_nixx_2



----------=======GENERAR UN REPORTE DONDE MUESTRE  LA ULTIMA LLAMADA DEL CLIENTE Y , MOSTRATLO POR PRODUCTO , POR PERIODO===============================================
------tabla 1
--numdoc
--CODIGO_PRODUCTO
--PERIODO

--........ MOSTRAR UNA FECHA ..... 
------tabla 2
--numdoc , fechaRegistro

SELECT top 1000
	*
FROM GESTION

-------- en gestion van agrupar por nro doc , mostrar la fecha maxima .....

select NumDoc , codigo_producto , PeriodoVigencia
into #tempProductoPeriodo
from OFERTAS
group by NumDoc , codigo_producto , PeriodoVigencia



--#tempProductoPeriodo


select Numdoc, CodigoProducto , MAX(FechaRegistro) FechaRegistroMax
into #tempoGestionFechaMax
from GESTION
group by Numdoc,CodigoProducto

--#tempoGestionFechaMax

--codigo_producto , fechaMaxima.


select a.codigo_producto , MAX(FechaRegistroMax)  FechaRegistroMax
from #tempProductoPeriodo a left join #tempoGestionFechaMax b
	on a.NumDoc = b.Numdoc and a.codigo_producto = b.CodigoProducto
group by  a.codigo_producto
ORDER BY 2 DESC


--select * from GESTION
--where CodigoProducto = 'COSTO'

--# --------------- TABLA TEMPORA LOCAL
--## --------------- TABLA TEMPORA GLOBAL
--@ --------------- VARIABLE


DECLARE @edad int
set @edad = 18
select @edad EdadNixon
print  @edad


declare @periodoVigencia varchar(10)
set @periodoVigencia= '202408'

select top 1000
	*
from OFERTAS
where PeriodoVigencia = @periodoVigencia




------==============================

--select top 10000          PeriodoVigencia    from OFERTAS


declare @periodoVigencia2 varchar(10)
declare @codigoProducto varchar(10)

select top 1
	@periodoVigencia2 = PeriodoVigencia , @codigoProducto =  codigo_producto
from OFERTAS

print @periodoVigencia2
print @codigoProducto


declare @linea float

set @linea = (select max(Linea)
from OFERTAS)
print @linea

set @linea = (select top 1
	Linea
from OFERTAS)
print @linea

----------===================================================================
--'202409'


declare @periodo varchar(10) = FORMAT(DATEADD(mm,-6,GETDATE()), 'yyyyMM')
---- set 
print @periodo

select *
from OFERTAS
where PeriodoVigencia = @periodo


-- DECLARE @periodo VARCHAR(10) = FORMAT(DATEADD(MONTH, 6, GETDATE()), 'yyyyMM')  
--PRINT @periodo  

--SELECT * FROM OFERTAS  
--WHERE PeriodoVigencia = @periodo

--------===========quiero incremetnar un 10% las lineas que estamos ofertando en PLD============================
declare @factor float = 1.1
select (Linea * @factor) nuevaLinea  , a.*
from OFERTAS a
where a.codigo_producto='PLD'
--------==========================================================================


--------CTE

select top 10
	*
from OFERTAS
;WITH
	a
	AS
	(
		select top 100
			*
		from OFERTAS
		where codigo_producto = 'PLD'
	)
select *
from a
------select * from a



select *
from AGENCIAS with (nolock)

;with
	a
	as
	(
		select Numdoc, CodigoProducto , MAX(FechaRegistro) FechaRegistroMax
		from GESTION
		group by Numdoc,CodigoProducto
	)

select *
from a


------CTE anidados
------CTE comunicacion entre anidados
-----------------------------------------------
;with
	a
	as
	(
		select top 100000
			*
		from OFERTAS
		where codigo_producto = 'PLD'
	),
	b
	as
	(
		select *
		from COLABORADORES
		where AGENCIA like'%AG. SAN JUAN DE MIRAFLORES%'
	),
	c
	as
	(
		select a.*
		from a inner join b on a.CODIGO_TRABAJADOR = b.CODIGO_TRABAJADOR
	)
select *
from c
--------------------------------------------------

--implementacion .... 
--- temporall.......

--------produccion

;with
	a
	as
	(
		select NumDoc , codigo_producto , PeriodoVigencia
		from OFERTAS
		group by NumDoc , codigo_producto , PeriodoVigencia
	) ,
	b
	as
	(
		select Numdoc, CodigoProducto , MAX(FechaRegistro) FechaRegistroMax
		from GESTION
		group by Numdoc,CodigoProducto
	) 
,
	c
	as
	(
		select a.codigo_producto , MAX(FechaRegistroMax)  FechaRegistroMax
		from a left join b on a.NumDoc = b.Numdoc and a.codigo_producto = b.CodigoProducto
		group by  a.codigo_producto
	)
select *
from c
order by 2 desc
