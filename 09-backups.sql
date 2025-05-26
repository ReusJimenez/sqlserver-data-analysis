--- BACKUPS =========================================================================

--BACKUP 1
--Crear la tabla OFERTAS en la base [bd-pruebas].
--Copiar todos los datos desde la tabla OFERTAS en [bd-empresa-2025].
--OJO: Verificar si existe una tabla llamada OFERTAS en [bd-pruebas] y se esta intentando crearla de nuevo sin eliminarla previamente.

select *
into [bd-pruebas].dbo.COLABORADORES
from [bd-empresa-2025].dbo.COLABORADORES

select * from COLABORADORES;

--BACKUP 2
--Pasar todo el contenido de una bd a otra bd
BACKUP DATABASE [BD-VENTAS] TO DISK = 'C:\Backups-SQL-Server (Carpeta propia)\BD-VENTAS.bak';

RESTORE FILELISTONLY 
FROM DISK = 'C:\Backups-SQL-Server (Carpeta propia)\BD-VENTAS.bak';

RESTORE DATABASE [bd-empresa-2025]
FROM DISK = 'C:\Backups-SQL-Server (Carpeta propia)\BD-VENTAS.bak'
WITH 
  MOVE 'bdClase9_1' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bd-smartdata-2025.mdf',
  MOVE 'bdClase9_1_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bd-smartdata-2025.ldf',
  REPLACE;

-- ========= Caso Propuesto =========

--El �rea de Riesgos identific� clientes donde se les podr�a mejorar las condiciones de su cr�dito. Tanto en tasa, como en monto.
--Iniciaremos un campa�a por SMS, para indicar a los clientes las mejoras del cr�dito, se necesitar� crear un speech que sea personalizado 
--por clientes que contenga los productos que tiene.
--Al ser campa�a por SMS, debemos descartar clientes que no tengan tel�fonos, clientes que est�n reportados, clientes que ya obtuvieron el 
--cr�dito, validamos tel�fonos que sean correctos en formato
--En algunos casos son clientes y en otros son prospectos de clientes nuevos:
--	Los que son clientes tendr�n un speech con la designaci�n de Sr. O Sra. Y el nombre y las condiciones del producto.
--	Los prospectos a clientes nuevos, solo indicaremos Estimad@

-- ========= Soluci�n =========

--Importaci�n de datos (3 m�todos)
--Genera una base �nica de clientes sin repeticiones 
--Agr�gale los campos tel�fono , nombre y sexo
--Actual�zale el ultimo numero de tel�fono , nombre, resultado de ultima gesti�n y sexo de la base de clientes
--Actual�zale el ultimo numero de tel�fono de la base de gesti�n
--Elimina los clientes de la tabla blacklist
--Eliminamos los que tienen gesti�n seg�n criterio
--Genera la base �nica de ofertas
--Exportar la data (2 m�todos)




