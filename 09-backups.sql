--- BACKUPS =======================================================================

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

--El área de Riesgos identificó clientes donde se les podría mejorar las condiciones de su crédito. Tanto en tasa, como en monto.
--Iniciaremos un campaña por SMS, para indicar a los clientes las mejoras del crédito, se necesitará crear un speech que sea personalizado 
--por clientes que contenga los productos que tiene.
--Al ser campaña por SMS, debemos descartar clientes que no tengan teléfonos, clientes que estén reportados, clientes que ya obtuvieron el 
--crédito, validamos teléfonos que sean correctos en formato
--En algunos casos son clientes y en otros son prospectos de clientes nuevos:
--	Los que son clientes tendrán un speech con la designación de Sr. O Sra. Y el nombre y las condiciones del producto.
--	Los prospectos a clientes nuevos, solo indicaremos Estimad@

-- ========= Solución =========

--Importación de datos (3 métodos)
--Genera una base única de clientes sin repeticiones 
--Agrégale los campos teléfono , nombre y sexo
--Actualízale el ultimo numero de teléfono , nombre, resultado de ultima gestión y sexo de la base de clientes
--Actualízale el ultimo numero de teléfono de la base de gestión
--Elimina los clientes de la tabla blacklist
--Eliminamos los que tienen gestión según criterio
--Genera la base única de ofertas
--Exportar la data (2 métodos)




