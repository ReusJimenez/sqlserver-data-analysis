--- AGRUPACIONES ====================================================================

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
------presentación de datos
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
