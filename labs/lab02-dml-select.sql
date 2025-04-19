--- SESION 2 =======================================================================

--comentarios

/*comandos asdasd
asdasd
asd
asdasd */

--------control + k  + control + c es comentario
--asdasd
----controla + k  + control + u descomento

----DML SELECT , INSERT , DELETE , UPDATE
----CONTROL + R

------------LICENCIAS PERMITIDAS


SELECT * FROM AGENCIAS


------SELECT , INSERT , DELETE , UPDATE

SELECT TOP 10
	*
FROM AGENCIAS
------ CONSULTA NO NOMINAL
SELECT TOP 20
	*
FROM AGENCIAS
SELECT TOP 30 PERCENT
	*
FROM AGENCIAS

---COUNT------------------------------------
SELECT COUNT(*)
FROM AGENCIAS

-------------------------------------------
SELECT TOP 10
	AGENCIA, CLUSTER
FROM AGENCIAS
------ CONSULTA NOMINAL
----ALT + F1  --- SP_HELP 'AGENCIAS' 
SELECT *
FROM AGENCIAS
-------------------------------------------
SELECT
	AGENCIA
	, FechaApertura
FROM AGENCIAS
-------------------------------------------

-- SP_HELP 'OFERTAS' 

------SHIFT + ALT Y FLECHA HACIA ABAJO
SELECT TOP 10
	id
	, NumDoc
	, codigo_producto
	, CODIGO_TRABAJADOR
	, Tipo_Producto
	, Fecha_Vencimiento
	, Tasa_Original
	, undtiempoplazo
	, Deuda
	, EstadoGestion
	, FechaRegistroGestion
	, VariacionProductos
	, productos
	, flg_validacionDNI
	, flg_validacionDNI1
FROM OFERTAS

--------------================================================

-----------LOS ALIAS ------- TABLAS -- ALIAS DE COLUMNAS


-----------LOS ALIAS ------- TABLAS
SELECT A.AGENCIA , A.CLUSTER
FROM AGENCIAS AS A
SELECT B.AGENCIA , B.CLUSTER
FROM AGENCIAS AS B

SELECT [TB 1].AGENCIA , [TB 1].CLUSTER
FROM AGENCIAS [TB 1]
SELECT [TB 2].AGENCIA , [TB 2].CLUSTER
FROM AGENCIAS [TB 2]

----------========================================

PRINT 'HOLA MUNDO'
----------ALIAS DE COLUMNAS

SELECT 'HOLA MUNDO' AS MENSAJE
SELECT 'HOLA MUNDO'  [% INDICADORES DE MORA DE CONTENCI�N]

SELECT A.AGENCIA , A.CLUSTER [GERENTE DE ZONAL DE AGENCIAS]
FROM AGENCIAS AS A

SELECT COUNT(*) AS [CANTIDAD DE REGISTROS]
FROM AGENCIAS

