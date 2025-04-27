--- SESIÓN 9 =======================================================================

------------=========FUNCIONES , PROCEDIMIENTOS Y VISTAS=============================

CREATE FUNCTION [dbo].[FunctionName_nixx]
(
    @param1 int,
	@param2 int
)
RETURNS INT
AS
BEGIN

    RETURN @param1 + @param2

END


print dbo.FunctionName_nixx( 100 , 5 )


--select ...... 
--where dbo.FunctionName_nixx( 100 , 5 ) = 105

select top 20  cast(tasa as int) ,dbo.FunctionName_nixx( cast(tasa as int) , 5 )  from ofertas 
where dbo.FunctionName_nixx( cast(tasa as int) , 5 ) = 37


create function dbo.validarDNI(@dniAValidar varchar(20))
returns int  --- null o 1
as
begin
		if(ISNUMERIC(@dniAValidar)= 1 and len(@dniAValidar)= 8 )
				return 1
		return null
end

print dbo.validarDNI('12345678')

select top 1000 numdoc, dbo.validarDNI(numdoc) from OFERTAS


--------=====procedimientos almacenados==========================

ALTER procedure miPrimerSP_nixx(@periodo varchar(6) , @lineaMinima float)
as
begin
		select top 10 * from ofertas
		where PeriodoVigencia =@periodo 

		select top 10 * from ofertas
		where Linea > @lineaMinima 

		print 'hola mundo'

		INSERT INTO ARQUITECTOS(ID,NOMBRE , AA,NROPROYECTOS)
		VALUES(1,'NIXX22',5,100)

end


miPrimerSP_nixx '202408', 3000
exec miPrimerSP_nixx '202408', 3000
execute miPrimerSP_nixx  '202408', 3000


SELECT * FROM sys.procedures WHERE NAME LIKE'%PRIMER%'
SELECT * FROM sys.TABLES  WHERE NAME LIKE'%OFER%'
SELECT * FROM sys.VIEWS  WHERE NAME LIKE'%OFER%'
SELECT * FROM sys.OBJECTS WHERE TYPE = 'FN'
--OFERTAS
------------================================VIEWS============

----------=====1 CONSULTA========

ALTER VIEW dbo.vw_reporteVentasTop10  ---- VISTA SIMPLE --
AS
    Select top 10 * from dbo.ofertas where resultadoGestion = 2
    ----Select top 10 * from dbo.ofertas where resultadoGestion = 2

--select * from vw_reporteVentasTop10


--INSERT INTO vw_reporteVentasTop10
-- Select top 10 * from dbo.ofertas where resultadoGestion = 2


--SELECT COUNT(*) FROM dbo.ofertas
------989,841
------989,851

----POR AGRUPAMIENTO
--- CRUCE DE TABLAS

create VIEW dbo.vw_reporteVentasComplejaGROUP
---- VISTA COMPLEJA --
AS
	Select PeriodoVigencia, FORMAT(SUM(ISNULL(Linea,0)),'N0') VENTAS
	from dbo.ofertas
	where resultadoGestion = 2
	GROUP BY PeriodoVigencia


select * from vw_reporteVentasComplejaGROUP where PeriodoVigencia ='202409'


----INSERT INTO vw_reporteVentasComplejaGROUP
---- Select top 10 * from dbo.ofertas where resultadoGestion = 2
select * from vw_reporteVentasComplejaGROUP where PeriodoVigencia ='202409'


create VIEW dbo.vw_reporteVentasComplejaJoin  ---- VISTA COMPLEJA --
AS
    Select  PeriodoVigencia, FORMAT(SUM(ISNULL(Linea,0)),'N0') VENTAS from dbo.ofertas a inner join COLABORADORES b on a.CODIGO_TRABAJADOR=b.CODIGO_TRABAJADOR
	where resultadoGestion = 2
	GROUP BY PeriodoVigencia


select * from vw_reporteVentasComplejaJoin where PeriodoVigencia ='202409'
