--- Consultas_Parte_I =======================================================================

SELECT * FROM Categoria

SELECT descripcion, estado FROM Categoria

SELECT	c.descripcion
		,c.estado
FROM	Categoria AS c

SELECT	c.descripcion	AS nombreCat
		,c.estado		AS estadoCat
FROM	Categoria AS c

SELECT	c.descripcion	AS [nombre Categoria]
		,c.estado		AS [estado Categoria]
FROM	Categoria AS c

SELECT	TOP 1
		c.idCategoria
		,c.descripcion
		,c.estado
FROM	Categoria AS c 


SELECT	c.idCategoria
		,c.descripcion
		,c.estado
FROM	Categoria AS c 
WHERE	c.idCategoria = 3

SELECT	p.idProducto
		,p.idCategoria
		,p.descripcion
		,p.precio
FROM	Producto AS p
WHERE	p.idCategoria = 2

SELECT	p.idProducto
		,p.idCategoria
		,p.descripcion
		,p.precio
FROM	Producto AS p
WHERE	p.descripcion LIKE '%H%'
		AND estado = 'A'

SELECT	p.idProducto
		,p.idCategoria
		,p.descripcion
		,p.precio
FROM	Producto AS p
WHERE	p.descripcion LIKE '%H%'
		OR estado = 'A'

--UPDATE	Producto 
--SET		estado = 'I'
--WHERE	idProducto = 3

--UPDATE	Producto 
--SET		estado = 'I'
--WHERE	idProducto IN (1,3,5,7)

--select * from Producto where idProducto = 2

SELECT	p.idProducto
		,p.idCategoria
		,p.descripcion
		,p.precio
FROM	Producto AS p
WHERE	p.idCategoria <= 3

SELECT	p.idProducto
		,p.idCategoria
		,p.descripcion
		,p.precio
FROM	Producto AS p
WHERE	p.descripcion LIKE '_A%'

SELECT	p.idProducto
		,p.idCategoria
		,p.descripcion
		,p.precio
FROM	Producto AS p
WHERE	p.descripcion LIKE '[a-m]%'

SELECT	DISTINCT
		p.idCategoria 
FROM	Producto AS p

SELECT	COUNT(p.idProducto) AS totalProductos
FROM	Producto AS p

SELECT	p.idCategoria
		,COUNT(p.idProducto) AS totalProductos
		,p.estado
FROM	Producto AS p
GROUP BY p.idCategoria, p.estado

SELECT	p.idCategoria
		,COUNT(p.idProducto) AS totalProductos
		,p.estado
FROM	Producto AS p
GROUP BY p.idCategoria, p.estado
HAVING p.estado = 'A'

SELECT	p.idCategoria
		,COUNT(p.idProducto) AS totalProductos
		,p.estado
FROM	Producto AS p
GROUP BY p.idCategoria, p.estado
HAVING p.estado = 'A'
ORDER BY p.idCategoria DESC

SELECT	MAX(p.precio)  AS maximoPrecio
FROM	Producto AS p

SELECT	MIN(p.precio)  AS minimoPrecio
FROM	Producto AS p

SELECT	AVG(p.precio)  AS promedioPrecio
FROM	Producto AS p

SELECT	SUM(p.precio) AS SumaPrecio
FROM	Producto AS p

SELECT	p.precio - p.stock
FROM	Producto AS p

--CONSULTAS MULTITABLAS
/**************  INNER JOIN **********************/
SELECT	c.idCategoria
		,c.descripcion
		,p.idProducto
		,p.descripcion
		,p.precio
FROM	Categoria AS c
		INNER JOIN Producto AS p ON c.idCategoria = p.idCategoria


SELECT	* 
FROM	Cliente AS cli
		INNER JOIN Venta AS v ON cli.idCliente = v.idCliente

SELECT	* 
FROM	Venta AS v
		INNER JOIN DetalleVenta AS dv ON v.idVenta = dv.idVenta

SELECT	* 
FROM	Producto AS p
		INNER JOIN DetalleVenta AS dv ON p.idProducto = dv.idProducto

SELECT	*
FROM	Categoria AS c
		INNER JOIN Producto		AS p	ON c.idCategoria = p.idCategoria
		INNER JOIN DetalleVenta AS dv	ON p.idProducto  = dv.idProducto
		INNER JOIN Venta		AS v	ON v.idVenta	 = dv.idVenta
		INNER JOIN Cliente		AS cli	ON cli.idCliente = v.idCliente

/**************  LEFT JOIN **********************/
SELECT	*
FROM	Categoria AS c
		LEFT JOIN Producto AS p ON c.idCategoria = p.idCategoria

SELECT	c.idCategoria
		,c.descripcion
		,ISNULL(p.idProducto, 0) AS idPro
		,ISNULL(p.descripcion,'') AS nombrePro
FROM	Categoria AS c
		LEFT JOIN Producto AS p ON c.idCategoria = p.idCategoria

SELECT	DISTINCT
		c.idCategoria
		,c.descripcion
FROM	Categoria AS c
		LEFT JOIN Producto AS p ON c.idCategoria = p.idCategoria

SELECT	* 
FROM	Producto AS p
		LEFT JOIN DetalleVenta AS dv ON p.idProducto = dv.idProducto

SELECT	p.idProducto
		,p.descripcion
FROM	Producto AS p
		LEFT JOIN DetalleVenta AS dv ON p.idProducto = dv.idProducto
WHERE	dv.idDetalleVenta IS NULL

/**************  RIGHT JOIN **********************/
SELECT	*
FROM	Producto AS p
		RIGHT JOIN Categoria AS c ON c.idCategoria = p.idCategoria


/**************  SUB CONSULTAS **********************/
SELECT	p.idProducto
		,p.descripcion
FROM	Producto AS p
WHERE	p.idProducto NOT IN (
								SELECT	idProducto 
								FROM	DetalleVenta
							)

SELECT	p.idProducto
		,p.descripcion
FROM	Producto AS p
WHERE	p.idProducto	IN (
								SELECT	idProducto 
								FROM	DetalleVenta
							)

--- Consultas_Parte_II =======================================================================

USE Rusia2018
SELECT * FROM Arbitro
SELECT * FROM Pais
SELECT * FROM Jugador

SELECT *
FROM	Pais p
		INNER JOIN Jugador j ON p.idPais = j.idPais

SELECT	CONVERT(VARCHAR(10), e.fecha, 103) fecha
		,a.nomArbitro
		,f.descripcion
		,e.idPaisL
		,pl.nomPais
		,e.golesPaisL
		,e.idPaisV
		,pv.nomPais
		,e.golesPaisV
FROM	Encuentro e
		INNER JOIN Estadio est  ON e.idEstadio = est.idEstadio
		INNER JOIN Arbitro a	ON e.idArbitro = a.idArbitro
		INNER JOIN Fase	f		ON e.idFase = f.idFase
		INNER JOIN Pais	pl		ON e.idPaisL = pl.idPais
		INNER JOIN Pais pv		ON e.idPaisV = pv.idPais
