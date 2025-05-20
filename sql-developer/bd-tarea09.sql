CREATE TABLE ciudades (
    codigo_postal NUMBER PRIMARY KEY,
    ciudad VARCHAR2(50)
);

CREATE TABLE clientes (
    codigo_cli NUMBER PRIMARY KEY,
    nombre_cli VARCHAR2(50),
    nif VARCHAR2(20),
    direccion VARCHAR2(150),
    codigo_postal NUMBER,
    telefono VARCHAR2(20),
    CONSTRAINT fk_cliente_ciudad FOREIGN KEY (codigo_postal) REFERENCES ciudades(codigo_postal)
);

CREATE TABLE dependencias (
    cod_depend NUMBER PRIMARY KEY,
    nombre_depend VARCHAR2(20)
);

CREATE TABLE empleados (
    codigo_empleado NUMBER PRIMARY KEY,
    nombre_empl VARCHAR2(50),
    apellido_empl VARCHAR2(50),
    sueldo NUMBER(10, 2),
    cod_depend NUMBER,
    codigo_postal NUMBER,
    num_proyec NUMBER,
    CONSTRAINT fk_empleado_ciudad FOREIGN KEY (codigo_postal) REFERENCES ciudades(codigo_postal),
    CONSTRAINT fk_empleado_dependencia FOREIGN KEY (cod_depend) REFERENCES dependencias(cod_depend)
);

-- DESCRIBE 
DESCRIBE ciudades;
DESCRIBE clientes;
DESCRIBE dependencias;
DESCRIBE empleados;

-- Consultas SELECT
SELECT * FROM ciudades;
SELECT * FROM clientes;
SELECT * FROM dependencias;
SELECT * FROM empleados;

-- DROP TABLE 
DROP TABLE empleados;
DROP TABLE dependencias;
DROP TABLE clientes;
DROP TABLE ciudades;

-- INSERT 
INSERT INTO ciudades (codigo_postal, ciudad) VALUES (8, 'Barcelona');
INSERT INTO ciudades VALUES (17, 'Girona');
INSERT INTO ciudades VALUES (25, 'Lleida');
INSERT INTO ciudades VALUES (43, 'Tarragona');

INSERT INTO clientes VALUES (10, 'ECIGSA', '38-C', 'Aragon 11', 8, NULL);
INSERT INTO clientes VALUES (20, 'CME', '38-E', 'Valencia 22', 17, '972.23.57.21');
INSERT INTO clientes VALUES (30, 'ACME', '36-A', 'Mallorca 33', 25, '972.23.45.67');
INSERT INTO clientes VALUES (40, 'JGM', '38-B', 'Rosellon 44', 43, '977.33.71.43');

INSERT ALL 
INTO dependencias VALUES (1, 'DIR')
INTO dependencias VALUES (2, 'DIS')
INTO dependencias VALUES (3, 'PROG')
SELECT * FROM dual;

INSERT INTO empleados VALUES (1, 'Maria', 'Puig', 1005, 1, 17, 1);
INSERT INTO empleados VALUES (2, 'Pedro', 'Mas', 9004, 1, 8, 4);
INSERT INTO empleados VALUES (3, 'Ana', 'Ros', 7004, 2, 25, 3);
INSERT INTO empleados VALUES (4, 'Jorge', 'Roca', 7004, 2, 8, 4);
INSERT INTO empleados VALUES (5, 'Clara', 'Blanc', 4004, 3, 43, 1);
INSERT INTO empleados VALUES (6, 'Laura', 'Tort', 3004, 3, 43, 3);
INSERT INTO empleados VALUES (7, 'Rogelio', 'Salt', 4004, NULL, NULL, 4);
INSERT INTO empleados VALUES (8, 'Sergio', 'Grau', 3004, 3, 43, NULL);

-- Tarea en clase:
-- ingresar la ciudad Madrid con codigo postal 28
INSERT INTO ciudades VALUES (28, 'Madrid');

-- actualizar al codigo postal = 28 y actualizar el sueldo = 6000 del empleado = Rogelio
UPDATE empleados SET codigo_postal=28, sueldo=6000
WHERE nombre_empl='Rogelio';

/* UPDATE empleados SET codigo_postal=28 
WHERE nombre_empl='Rogelio';
UPDATE empleados SET sueldo=6000 
WHERE nombre_empl='Rogelio'; */

-- Extras:



