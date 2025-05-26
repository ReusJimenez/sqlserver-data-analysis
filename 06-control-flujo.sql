--- CONTROL-FLUJO ===================================================================

------------====begin end=================================

begin ------- creación de cuentas

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
