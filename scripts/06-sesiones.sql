--- SESION 6 =======================================================================

select   tasa , count(*) from ofertas
group by tasa

--------======================================
drop table if exists #tempLocalNixx
select 
	tasa , 
	case 
		when (tasa = 0)  then '0%' 
		when (tasa > 0 and Tasa <=10)  then '0%-10%' 
		when (tasa > 10 and Tasa <=20)  then '10%-20%' 
		when (tasa > 20 and Tasa <=50)  then '20%-50%' 
		when (tasa is null)  then 'tasa Nula' 
		else '>50%' 
	end RangoTasa
	into #tempLocalNixx
from 
	OFERTAS


	----------=================================
select RangoTasa ,COUNT(*) cant  from #tempLocalNixx
group by RangoTasa
order by 1 

--select count(*) from ofertas
------=====================================================

--order by Tasa asc

--select count(*)from OFERTAS where Tasa = 12

------between
------presentacion de datos
------orden

--<> --- abierto
--[0-20] ----- conjunto cerrado
--<]
--[>

drop table if exists #tempLocalNixx
select 
	tasa , 
	case 
		when (tasa = 0)  then			    '0. =0%' 
		when (tasa between 0 and 10)  then  '1. <0%-10%]' 
		when (tasa between 10 and 20)  then '2. <10%-20%]' 
		when (tasa between 20 and 50)  then '3. <20%-50%]' 
		when (tasa is null)  then '5. tasa Nula' 
		else '4. >50%' 
	end RangoTasa
	into #tempLocalNixx
from 
	OFERTAS
	----------=================================
select RangoTasa ,COUNT(*) cant  from #tempLocalNixx
group by RangoTasa
order by 1 
--------========================retoooo=========================
--------cuantas lineas tenemos rango de lineas 
------0k -1k
------1k- 3k
------3k- 5k
------5k- 10k
------10k--20k
------20k--50k
------50k--100k
------>100k

--select MAX(Linea), MIN(Linea),AVG(Linea) from OFERTAS




--select 
--linea, 
--case 
--when (linea between 0 and 1000) then 'a.<0-1K]'
--when (linea between 1000 and 3000) then 'b.<1k-3k]'
--when (linea between 3000 and 5000) then 'c.<3k-5k]'
--when (linea between 5000 and 10000) then 'd.<5k-10k]'
--when (linea between 10000 and 20000) then 'e.<10k-20k]'
--when (linea between 20000 and 50000) then 'f.<20k-50k]'
--when (linea between 50000 and 100000) then 'g.<50k-100k]'
--when (linea is null) then 'i.tasa nula'
--else 'h.>100k' 
--end RangoLinea
--into #teemplocalyess2
--from 
--OFERTAS

--select RangoLinea, count(*) from #teemplocalyess2
--group by RangoLinea
--order by 1
--------===========================================

drop table if exists #templocalFran
select Linea, 
	case 
		when (linea between 0 and 1000) then 'a.0-1k'
		when (linea between 1000 and 3000 ) then 'b.1k-3k'
		when (linea between 3000 and 5000 ) then 'c.3k-5k'
		when (linea between 5000 and 10000 ) then 'd.5k-10k'
		when (linea between 10000 and 20000 ) then 'e.10k-20k'
		when (linea between 20000 and 50000 ) then  'f.20-50k'
		when (linea between 50000 and 100000 ) then 'g.50k-100k'
		when (linea is null) then 'i.Linea Nula'
		else 'h.>100k'end Rango
		into #templocalFran
from Ofertas

select Rango, count(*) Cantidad, SUM(Linea) lineaTotal , AVG(linea) lineaPromedio , MAX(Linea) lineaMax , MIN(linea) lineaMin from #templocalFran
group by Rango
order by 1

--------======================================================

--select 

drop table if exists #tempLocalNixx2
select
ResultadoGestion,
case 
		when (ResultadoGestion= 2) then 1
		else null end flgVenta,
case 
		when (ResultadoGestion in (5,6) ) then 1
		else null end flgVentaPerdida,

case 
		when (ResultadoGestion in (4,16) ) then 1
		else null end flgVentaPotencial,
case	
		when (CODIGO_TRABAJADOR is not null) then 1
		else null end flgColaboradorAsignado

into #tempLocalNixx2
from OFERTAS


select COUNT(flgVenta), COUNT(flgVentaPerdida),COUNT(flgVentaPotencial) from #tempLocalNixx2


------select sum(flgVenta)  , sum(flgVentaPerdida)  ,sum(flgVentaPotencial) from #tempLocalNixx2

select flgColaboradorAsignado,flgVenta,flgVentaPerdida,flgVentaPotencial,COUNT(*)  cant 
from #tempLocalNixx2
group by flgColaboradorAsignado,flgVenta,flgVentaPerdida,flgVentaPotencial






select * from COLABORADORES A
where A.agencia in  (select TOP 10 B.agencia from AGENCIAS B where B.agencia like 'AG. CA%') --SUBCONSULTA ANIDADA


select * from COLABORADORES A
where A.agencia in  (select   B.agencia from AGENCIAS B where B.agencia like 'AG. CA%' ) --SUBCONSULTA CORRELACIONADA
----339 

select * from COLABORADORES A
where EXISTS (select 'X' from AGENCIAS B where B.agencia like 'AG. CA%'  AND A.AGENCIA = B.AGENCIA  ) --SUBCONSULTA CORRELACIONADA
----339



SELECT COUNT(*) FROM OFERTAS A INNER JOIN CLIENTES C ON A.NUMDOC = C.NUMDOC
WHERE A.NUMDOC IN (SELECT B.NUMDOC FROM GESTION B )  
----212,085

SELECT COUNT(*) FROM OFERTAS A INNER JOIN (SELECT DISTINCT NUMDOC,TELEFONO FROM CLIENTES) C ON A.NUMDOC = C.NUMDOC
WHERE EXISTS (SELECT 'X' FROM GESTION B WHERE A.NUMDOC = B.NUMDOC AND B.TelefonoRegistrado = C.telefono           )




SELECT COUNT(*) FROM OFERTAS A INNER JOIN CLIENTES C ON A.NUMDOC = C.NUMDOC
WHERE A.NUMDOC IN (SELECT B.NUMDOC FROM GESTION B )  
----212,085


SELECT COUNT(*) FROM OFERTAS A
WHERE A.NUMDOC IN (SELECT B.NUMDOC FROM GESTION B WHERE A.NUMDOC=B.NUMDOC)


SELECT COUNT(*) FROM OFERTAS A
WHERE EXISTS (SELECT 'X' FROM GESTION B WHERE A.NUMDOC=B.NUMDOC)
----305,949
----212,085
---305,949

----609,387

------------====begin end=================================

begin ------- creacion de cuentas

	SELECT COUNT(*) FROM OFERTAS A	
	WHERE EXISTS (SELECT 'X' FROM GESTION B WHERE A.NUMDOC=B.NUMDOC)
	
	SELECT COUNT(*) FROM OFERTAS A INNER JOIN CLIENTES C ON A.NUMDOC = C.NUMDOC
	WHERE A.NUMDOC IN (SELECT B.NUMDOC FROM GESTION B )  
end

--------===========if else========
if (1=1) 
	begin
		print 'es verdadero'-------------ejecucion cuando se cumple la condicion
		print 'esta ok'
	end
else
	begin
		print 'es false'-------------ejecucion cuando se cumple la condicion
		print 'fin1'------------- 
		print 'fin2'------------- 
	end
print 'fin3'------------- 
--------====================================


declare @edad int
set @edad = 18

if @edad  in (17,19)----- = >= <= /// between == in === case.......
	begin
		print 'vender producto'
		print 'lanzar aplicativo de pago para generar QR'
	end
else
	begin
		print 'no vender'
		print 'avisar a la policia'
	end
go

------===========si es lunes el limite es 18 , otro dia el limite es 17

declare @edad int
declare @diaSemana varchar(20)

set @diaSemana = 'Martes'
set @edad = 15

if @edad >=  case 
				when @diaSemana = 'Lunes' then 18 
				when @diaSemana = 'Martes' then 16
				when @diaSemana = 'Martes' then 16
				when @diaSemana = 'Martes' then 16
				else 17 end
	begin
	print 'vender producto'
	print 'lanzar aplicativo de pago para generar QR'
end
else
	begin
	print 'no vender'
	print 'avisar a la policia'
end

go


declare @edad int
declare @diaSemana varchar(20)

set @diaSemana = 'Martes'
set @edad = 18

if @edad >=  (select (count(*)/100000)+ 9
from OFERTAS)
	begin
	print 'vender producto'
	print 'lanzar aplicativo de pago para generar QR'
end
else
	begin
	print 'no vender'
	print 'avisar a la policia'
end
--------======================================================

if(1=2) print '1 es igual a 1'
else print 'es incorrecto'



go
declare @edad int
declare @diaSemana varchar(20)

set @diaSemana = 'Martes'
set @edad = 15

if @edad >=  case 
					when @diaSemana = 'Lunes' then 18 
					when @diaSemana = 'Martes' then 16
					when @diaSemana = 'Martes' then 16
					when @diaSemana = 'Martes' then 16
					else 17 end
	begin
		print 'vender producto'
		print 'lanzar aplicativo de pago para generar QR'
	end
else
	begin
		print 'no vender'
		print 'avisar a la policia'
	end

go

--------=========while====================================================
------====== mutacion , o .... ejecute los controle break o continue
-------- no existe pause

declare @i int = 0 

while(@i < 10 )
	begin
			print @i 
			if @i = 5 break --------------------------------------
			set @i = @i + 1									--	|
	 														--	|
	end --<---------------------------------------------------------
print 'fin'

go

declare @i int = 0 

while(@i < 10 )	---<-----------------------------------------------------
	begin																--|
			print @i													--|
																		--|
			    set @i = @i + 1											--|
				if(@i= 5) continue  --------------------------------------
				print @i
	end  
print 'fin'
--------------==============================================
go


declare @periodo varchar(20)
declare @i int = 0

while (@i < 36)
begin
		declare @conteoxPeriodo int 
		set @periodo  =   format( DATEADD(mm,- @i ,  GETDATE()), 'yyyyMM')
		select @conteoxPeriodo = count(*) from OFERTAS where periodovigencia = @periodo
		print @periodo
		print @conteoxPeriodo
		set @i = @i+ 1
end


----------------=======crear tablas sin valores,  con 12 periodos desde hoy hacia atras.=====nombre tabla oferta_yyyyMM ===================

go
declare @periodo varchar(20)
declare @i int = 0

while (@i < 36)
begin
			set @periodo  =   format( DATEADD(mm,- @i ,  GETDATE()), 'yyyyMM') 
			
			declare @mySQL varchar(4000)= '
				drop table if exists  oferta_'+  @periodo +'
				--select top 0   *
				--into oferta_'+  @periodo +'
				--from OFERTAS
				'

			--print @mySQL
			exec(@mySQL)

		set @i = @i+ 1
end

----------cursor 
select top 10
	NumDoc, Linea, Tasa, codigo_producto
from OFERTAS

---------------------------------


------------------cursor es tipo de variable ----------------

----crear variable cursor
----llenar informacion al cursor
--- apertura de cursor
----asingancion de datos a varibles 
----cierre del cursor
----destruccion del cursor


declare @numdoc varchar(20) , @linea float, @tasa float, @codigoProducto varchar(20)

declare cursor_ofertas cursor
  FOR select top 10
	NumDoc, Linea, Tasa, codigo_producto
from OFERTAS
open cursor_ofertas
	
	fetch cursor_ofertas into @numdoc , @linea , @tasa , @codigoProducto  ---- primera fila  a las variables
	
	while (@@FETCH_STATUS = 0)
	begin
			
			print @numdoc
			print @linea
			print @tasa
			print @codigoProducto
			print '___________________________________'

		fetch cursor_ofertas into @numdoc , @linea , @tasa , @codigoProducto  
	end
close cursor_ofertas
deallocate   cursor_ofertas

go 
--------------------====
--------nueva creacion de ofertas de cliente
--linea >=10000 y la tasa >= 20 , la nueva linea aumenta un 20% y la tasa se reduce en un 10%
--linea <10000 y la tasa < 20 , la nueva linea disminuye un 10% y la tasa se aumenta en un 5%
--ademas verificar si el cliente esta asignado a un colaborador con origen 'BANCO FINANZAS', si lo es aumentar la linea final en otro 10%
----generar una tabla con las nuevas ofertas
--==============================

--select 
--NumDoc,
--case when Linea >=10000 and Tasa >=20 then Linea * 1.20% end,
--case when Linea >=10000 and Tasa >=20 then tasa * 0.9% end  ,                          

--from OFERTAS inner join COLABORADORES 


if (1=1) goto fin

bloque1:
	print 'bloque 1'
	goto fin


bloque2:
	print 'bloque 2'
	goto fin

fin:
	print 'fin'


declare @numdoc varchar(20) , @linea float, @tasa float, @codigoProducto varchar(20), @codigoTrabajador varchar(20)

declare cursor_ofertas cursor
FOR select top 1000 NumDoc,Linea,Tasa, codigo_producto,CODIGO_TRABAJADOR  from OFERTAS
open cursor_ofertas
	
	fetch cursor_ofertas into @numdoc , @linea , @tasa , @codigoProducto ,@codigoTrabajador ---- primera fila  a las variables
	
	while (@@FETCH_STATUS = 0)
	begin
			
		--linea >=10000 y la tasa >= 20 , la nueva linea aumenta un 20% y la tasa se reduce en un 10%
			if (@linea >=10000 and @tasa >=20)
				begin
						set @linea = @linea * 1.2
						set @tasa = @tasa * 0.9
						goto  validacionOrigen
				end
		--linea <10000 y la tasa < 20 , la nueva linea disminuye un 10% y la tasa se aumenta en un 5%
		
			if (@linea <10000 and @tasa <20)
				begin
						set @linea = @linea * 0.9
						set @tasa = @tasa * 1.05
						goto validacionOrigen
				end
		--ademas verificar si el cliente esta asignado a un colaborador con origen 'BANCO FINANZAS', si lo es aumentar la linea final en otro 10%
			
			validacionOrigen:
			
				declare @origen varchar(100)

				select @origen= origen from COLABORADORES where CODIGO_TRABAJADOR = @codigoTrabajador
				if (@origen ='BANCO FINANZAS')
				set @linea = @linea * 1.1
			
				insert into ofertas_nuevas(numdoc , linea  , tasa )
				values (@numdoc, @linea, @tasa)

		fetch cursor_ofertas into @numdoc , @linea , @tasa , @codigoProducto  ,@codigoTrabajador
	end
close cursor_ofertas
deallocate   cursor_ofertas

select * from ofertas_nuevas

truncate table ofertas_nuevas
create table ofertas_nuevas (numdoc varchar(20), linea float , tasa float)


------= begin transaction , try catch======
----==funciones, procedimientos y vistas====


begin tran 
UPDATE OFERTAS
SET NUMDOC= '001231230'
WHERE ID = 111083
SELECT * FROM OFERTAS WHERE ID = 111083
rollback tran
SELECT * FROM OFERTAS WHERE ID = 111083

--rollback

--commit  
--rollback
--select * from CLIENTES

--SELECT 1000/0

--SELECT FECHAaPERTURA + 'TEXT' FROM AGENCIAS


BEGIN TRY
			--SELECT 1000/0  --ERROR DE CALCULO
				
--INSERT INTO AGENCIAS(FECHAaPERTURA)  --ERROR DE INTEGRIDAD .... 
--VALUES('TEXT')
DECLARE @EDAD INT = 15


--INSERT INTO AGENCIAS(FECHAaPERTURA)  --ERROR DE INTEGRIDAD .... 
--VALUES('TEXT')

IF @EDAD < 18
	RAISERROR (N'es menor de edad no se le puede vender alcohol', -- Message text.
	16, -- Severity,
	1 -- State, 
	); -- Second argument.
	----ERROR GENERADO POR EL USUARIO...


	--	--ERROR DE ESCRITURA.
END TRY
BEGIN CATCH
	
	PRINT error_number()	
	PRINT error_severity()
	PRINT error_state() 
	PRINT error_procedure()
	PRINT error_line()	
	PRINT error_message()	
	PRINT USER_NAME ()    
	PRINT getdate()

	END CATCH


----------COMBINADO ------
SELECT * FROM [dbo].[ARQUITECTOS]


COMMIT

GO

SELECT * FROM ARQUITECTOS


BEGIN TRANSACTION 
BEGIN TRY
	DECLARE @EDAD INT = 20

	IF @EDAD < 18

	RAISERROR (N'es menor de edad no se le puede vender alcohol', -- Message text.
	16, -- Severity,
	1 -- State, 
	); -- Second argument. -----------------------------------------------------------------------


	INSERT INTO ARQUITECTOS(ID,NOMBRE , AA,NROPROYECTOS)
	VALUES(1,'NIXX',5,100)

	PRINT 'TODO OK'
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK ----------------------------------------

	PRINT error_number()	
	PRINT error_severity()
	PRINT error_state() 
	PRINT error_procedure()
	PRINT error_line()	
	PRINT error_message()	
	PRINT USER_NAME ()    
	PRINT getdate()

END CATCH


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
