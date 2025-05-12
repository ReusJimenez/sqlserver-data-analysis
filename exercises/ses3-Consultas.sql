--- CLUSTERED ==================================================================================

/*Indices Clustered*/
CREATE CLUSTERED INDEX [IX_tblVentas_Fecha] ON tblVentas (Fecha)


--- Ejercicios_consultas =======================================================================

USE Rusia2018
--a. Mostrar el nombre del técnico, nacionalidad y fecha de nacimiento para aquellos que hayan
--nacidos después del mes de abril de cualquier año además que el nombre incluya los
--caracteres “ar”, ordenados por el año de nacimiento en forma descendente
--(07 registros)

SELECT	t.nomTecnico
		,t.nacionalidad
		,YEAR(GETDATE()) - YEAR(t.fechaNacimiento) AS edad
FROM	Tecnico AS t
WHERE	MONTH(t.fechaNacimiento) > 4
		AND t.nomTecnico LIKE '%ar%' 

--b. Contar todos los jugadores y presentarlos debidamente agrupados por posición (arqueros,
--defensas, volantes y delanteros), ordenados por la cantidad total de jugadores de cada
--posición de forma descendente.
--(4 filas afectadas)
SELECT	j.posicion
		,COUNT(j.idJugador) AS total
FROM	Jugador AS j
GROUP BY j.posicion

--c. Mostrar los jugadores con su respectivo nombre, país y continente, para los que pertenecen
--al continente Americano y que el nombre del jugador contenga la letra "u‟ como segundo carácter.
--(12 filas afectadas)
SELECT	j.nomJugador
		,p.nomPais
		,c.descripcion
FROM	Jugador AS j
		INNER JOIN Pais AS p ON p.idPais = j.idPais
		INNER JOIN Continente AS c ON c.idContinente = p.idContinente
WHERE	c.descripcion = 'América'
		AND j.nomJugador LIKE '_u%'

--d. Mostrar el nombre del árbitro y país para aquellos que son principales; y que el nombre del
--país contenga en cualquier ubicación la letra “a”
--(17 filas afectadas)
SELECT	a.nomArbitro
		,a.pais
FROM	Arbitro AS a 
WHERE	a.principal = 1
		AND a.pais LIKE '%a%'


--- NO CLUSTERED ===============================================================================

/*Identificar claves Externas no Indexadas*/
WITH v_NonIndexedFKColumns AS (
   SELECT 
      Object_Name(a.parent_object_id) AS Table_Name
      ,b.NAME AS Column_Name
   FROM 
      sys.foreign_key_columns a
      ,sys.all_columns b
      ,sys.objects c
   WHERE 
      a.parent_column_id = b.column_id
      AND a.parent_object_id = b.object_id
      AND b.object_id = c.object_id
      AND c.is_ms_shipped = 0
   EXCEPT
   SELECT 
      Object_name(a.Object_id)
      ,b.NAME
   FROM 
      sys.index_columns a
      ,sys.all_columns b
      ,sys.objects c
   WHERE 
      a.object_id = b.object_id
      AND a.key_ordinal = 1
      AND a.column_id = b.column_id
      AND a.object_id = c.object_id 
      AND c.is_ms_shipped = 0
   )

SELECT  
    'CREATE NONCLUSTERED INDEX [IX_'+v.Table_Name + '_' + v.Column_Name + '] ON [dbo].['+v.Table_Name+'] ('+ v.Column_Name + ') WITH ( FILLFACTOR=80)' AS Indice,
    'DROP INDEX [IX_'+v.Table_Name + '_' + v.Column_Name + '] ON [dbo].['+v.Table_Name+']' AS borrarIndice,
    v.Table_Name AS NonIndexedCol_Table_Name
    ,v.Column_Name AS NonIndexedCol_Column_Name             
    ,fk.NAME AS Constraint_Name   
    ,SCHEMA_NAME(fk.schema_id) AS Ref_Schema_Name       
    ,object_name(fkc.referenced_object_id) AS Ref_Table_Name      
    ,c2.NAME AS Ref_Column_Name         
FROM 
    v_NonIndexedFKColumns v
    ,sys.all_columns c
    ,sys.all_columns c2
    ,sys.foreign_key_columns fkc
    ,sys.foreign_keys fk
WHERE 
    v.Table_Name = Object_Name(fkc.parent_object_id)
    AND v.Column_Name = c.NAME
    AND fkc.parent_column_id = c.column_id
    AND fkc.parent_object_id = c.object_id
    AND fkc.referenced_column_id = c2.column_id
    AND fkc.referenced_object_id = c2.object_id
    AND fk.object_id = fkc.constraint_object_id
ORDER BY 1,2

--CREATE NONCLUSTERED INDEX [IX_tblEmpleado_IdDepartamento] ON tblEmpleado(IdDepartamento) WITH(FILLFACTOR=80)
--CREATE NONCLUSTERED INDEX [IX_tblEmpleado_IdDepartamento] ON [dbo].[tblEmpleado] (IdDepartamento)
--DROP INDEX [IX_tblEmpleado_IdDepartamento] ON tblEmpleado


--- OPTIMIZAR_CONSULTAS =======================================================================


SET STATISTICS IO ON
SET STATISTICS TIME ON
--CREATE INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos (NOM_PROD)
SELECT * FROM tblProductos tp  WHERE tp.NOM_PROD LIKE '%carne%'
SET STATISTICS IO OFF
SET STATISTICS TIME OFF

sp_help 'tblproductos'

logical reads 11540 
1 LECTURA LOGICA = 1 PAGINA = 8Kb
8 * 11540 = 93320kb
93320 / 1024 = 90Mb
100 usuarios * 90 MB = 8.7 GB


--- sp_Transaction =======================================================================

CREATE PROCEDURE sp_Transaction
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @idVenta AS INT

			INSERT INTO Venta(idCliente, montoTotal, fechaVenta)
						VALUES (4, 1890.00, GETDATE())

			SET @idVenta = SCOPE_IDENTITY()
		
			INSERT INTO DetalleVenta(idProducto, idVenta, precioUnitario, cantidad, monto)
						VALUES(3, @idVenta , 90.00, 1, 90.00)
			
			INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
					VALUES(5, @idVenta , 1800.00, 1, 1800.00)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT ERROR_LINE() AS lineaError
				,ERROR_NUMBER() AS codigoError
				,ERROR_MESSAGE() AS mensajeError
				,ERROR_PROCEDURE() AS procedimientoError
	END CATCH
END

--EXEC sp_Transaction

SELECT * FROM Venta
SELECT * FROM DetalleVenta
SELECT * FROM Producto


--- spDetalleVenta =======================================================================

--STORE PROCEDURE
CREATE PROCEDURE spDetalleVenta
AS
BEGIN
	SELECT  p.idProducto
			,p.descripcion
			,dv.precioUnitario
			,dv.cantidad
			,dv.monto
	FROM	Producto AS p
			INNER JOIN DetalleVenta AS dv	ON p.idProducto = dv.idProducto
			INNER JOIN Venta		AS v	ON v.idVenta = dv.idVenta
END

--EXECUTE spDetalleVenta
--EXEC spDetalleVenta


--- spDetalleVentaByCodigo =======================================================================

ALTER PROCEDURE spDetalleVentaByCodigo
				@pIdProducto	AS INT
				,@pIdCategoria  AS INT = 0
AS
BEGIN
	SELECT  p.idProducto
			,p.descripcion
			,dv.precioUnitario
			,dv.cantidad
			,dv.monto
	FROM	Producto AS p
			INNER JOIN DetalleVenta AS dv	ON p.idProducto = dv.idProducto
			INNER JOIN Venta		AS v	ON v.idVenta = dv.idVenta
	WHERE	(p.idProducto		= @pIdProducto)
			AND (@pIdCategoria = 0 OR p.idCategoria	= @pIdCategoria)
END

EXEC spDetalleVentaByCodigo @pIdProducto = 3
EXEC spDetalleVentaByCodigo 3, 1


--- spDetalleVentaByDescripcion =======================================================================

CREATE PROCEDURE spDetalleVentaByDescripcion
				@pDescripcion AS VARCHAR(20)
AS
BEGIN
	SELECT  p.idProducto
			,p.descripcion
			,dv.precioUnitario
			,dv.cantidad
			,dv.monto
	FROM	Producto AS p
			INNER JOIN DetalleVenta AS dv	ON p.idProducto = dv.idProducto
			INNER JOIN Venta		AS v	ON v.idVenta = dv.idVenta
	WHERE	p.descripcion LIKE '%' + @pDescripcion + '%'
END

EXEC spDetalleVentaByDescripcion 'tele' 


--- vstProductoVenta =======================================================================

CREATE VIEW vstProductoVenta
AS
	SELECT  p.idProducto
			,p.descripcion
			,dv.precioUnitario
			,dv.cantidad
			,dv.monto
	FROM	Producto AS p
			INNER JOIN DetalleVenta AS dv	ON p.idProducto = dv.idProducto
			INNER JOIN Venta		AS v	ON v.idVenta = dv.idVenta

--SELECT	idProducto ,SUM(monto)  AS total FROM	vstProductoVenta GROUP BY idProducto
