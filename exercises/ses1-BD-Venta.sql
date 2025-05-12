--CREATE DATABASE BD_Venta
USE BD_Venta

CREATE TABLE Categoria
(
	idCategoria		INT IDENTITY(1,1)	NOT NULL
	,descripcion	VARCHAR(150)		NOT NULL
	,estado			CHAR(1) DEFAULT 'A' NOT NULL
)
ALTER TABLE Categoria ADD PRIMARY KEY (idCategoria)

--SELECT * FROM Categoria
--DROP TABLE Categoria
--TRUNCATE TABLE Categoria
--DELETE FROM Categoria

CREATE TABLE Producto
(
	idProducto		INT IDENTITY(1,1)	NOT NULL
	,idCategoria	INT					NOT NULL
	,descripcion	VARCHAR(150)		NOT NULL
	,precio			DECIMAL(9,2)		
	,stock			INT	CHECK(stock>0)	NOT NULL
	,estado			CHAR(1) DEFAULT 'A' NOT NULL
)
ALTER TABLE Producto ADD PRIMARY KEY (idProducto)
ALTER TABLE Producto ADD FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria)


CREATE TABLE Cliente
(
	idCliente		INT IDENTITY(1,1)	NOT NULL
	,nombres		VARCHAR(50)			NOT NULL
	,apellidos		VARCHAR(50)			NOT NULL
	,nroDocumento	VARCHAR(15)
	,estado			CHAR(1) DEFAULT 'A' NOT NULL
)
ALTER TABLE Cliente ADD PRIMARY KEY (idCliente)

CREATE TABLE Venta
(
	idVenta			INT IDENTITY(1,1)	NOT NULL
	,idCliente		INT					NOT NULL
	,montoTotal		DECIMAL(9,2)		NOT NULL
	,fechaVenta		SMALLDATETIME		DEFAULT GETDATE()
	,estado			CHAR(1) DEFAULT 'A' NOT NULL
)
ALTER TABLE Venta ADD PRIMARY KEY (idVenta)
ALTER TABLE Venta ADD FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)

CREATE TABLE DetalleVenta
(
	idDetalleVenta	INT IDENTITY(1,1)	NOT NULL
	,idProducto		INT					NOT NULL
	,idVenta		INT					NOT NULL
	,precioUnitario	DECIMAL(9,2)		NOT NULL
	,cantidad		INT					NOT NULL
	,monto			DECIMAL(9,2)		NOT NULL
	,estado			CHAR(1) DEFAULT 'A' NOT NULL
)
ALTER TABLE DetalleVenta ADD PRIMARY KEY (idDetalleVenta)
ALTER TABLE DetalleVenta ADD FOREIGN KEY(idProducto) REFERENCES Producto(idProducto)
ALTER TABLE DetalleVenta ADD FOREIGN KEY(idVenta) REFERENCES Venta(idVenta)

--SELECT * FROM Producto

INSERT INTO Categoria (descripcion)
			VALUES ('Televisores')
INSERT INTO Categoria (descripcion)
			VALUES ('VideoJuegos')
INSERT INTO Categoria (descripcion)
			VALUES ('Calzado')
INSERT INTO Categoria (descripcion)
			VALUES ('Lavadoras')
INSERT INTO Categoria (descripcion)
			VALUES ('Laptops')
INSERT INTO Categoria (descripcion)
			VALUES ('Celulares')

INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR SAMSUNG 55 QLED 4K', 2200.00, 50)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR SONY 65 UHD', 2500.00, 100)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR LG 40 QLED', 1800.00, 80)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR SAMSUNG 50 QLED 4K', 1500.00, 40)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATO CALIMOD T41', 250.00, 50)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATILLAS ADIDAS T40', 200.00, 90)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATILLAS PUMA T40', 120.00, 30)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATILLAS REEF T41', 150.00, 10)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'CRASH BANDICOOT', 100.00, 6)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'SUPER MARIO BROOS', 90.00, 4)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'BATMAN ARKAM KNIGHT', 80.00, 8)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'SPIDERMAN SPIDER ARMOR', 120.00, 2)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP LENOVO I5 8GB RAM', 3500.00, 7)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP LENOVO I7 16GB RAM', 4800.00, 4)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP ASUS I3 8GB RAM', 2000.00, 2)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP HP I5 8GB RAM', 2800.00, 2)


INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Richard', 'Rivas', '4485976')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Jahir', 'Otero', '5897985')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Daniel', 'Nonato', '589759874')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Ervin', 'Parra', '89757978')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Carlos', 'Sanchez', '6979784')

--Venta 1 
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (4, 1800.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 1, 3, 1800.00, 1, 1800.00)

--Venta 2
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (3, 6960.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 2, 1, 2000.00, 1, 2000.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 2, 11, 80.00, 2, 160.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 2, 14, 4800.00, 1, 4800.00)

--Venta 3
INSERT INTO Venta(idCliente, montoTotal, fechaVenta)
			VALUES (2, 330.00, GETDATE())
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(7, 3 , 120.00, 2, 240.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(10, 3 , 90.00, 1, 90.00)

--Venta 4
INSERT INTO Venta(idCliente, montoTotal, fechaVenta)
			VALUES (3, 4680.00, GETDATE())
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(2, 4 , 2500.00, 1, 2500.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(10, 4 , 50.00, 2, 100.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(11, 4 , 80.00, 1, 80.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(15, 4 , 2000.00, 1, 2000.00)

--Venta 5
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (4, 300.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 5, 6, 100.00, 3, 300.00)

--Venta 6
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (5, 140.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 6, 9, 140.00, 1, 140.00)

SELECT * FROM Categoria
SELECT * FROM Producto
SELECT * FROM Cliente
SELECT * FROM Venta
SELECT * FROM DetalleVenta