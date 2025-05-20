CREATE TABLE PACIENTES(
H_clinica number PRIMARY KEY,
nombre varchar2 (15),
n_seguro_social number,
direccion varchar2(30),
telefono number,
fecha_nacimiento date
);

CREATE TABLE INGRESOS(
id_ingreso number PRIMARY KEY,
num_historia_clinica number REFERENCES PACIENTES(H_clinica),
servicio varchar2(20),
diagnostico varchar2(30),
fecha_ingreso date,
fecha_alta date
);

CREATE TABLE FACULTATIVOS(
num_colegiado number PRIMARY KEY,
nombre varchar2(20),
direccion varchar2(30),
telefono number,
serv_adscrito varchar2(30)
);

CREATE TABLE CONSUMO_PACIENTE(
id_consumo number PRIMARY KEY,
num_historia_clinica number REFERENCES PACIENTES(H_clinica),
num_historia_farmaco number REFERENCES FARMACOS(n_registro),
cantidad number
);

CREATE TABLE CONSUMO_SERVICIO(
id_consumo number PRIMARY KEY,
servicio varchar2(30),
num_registro_farmaco number REFERENCES FARMACOS(n_registro),
cantidad number,
fecha date
);

CREATE TABLE FARMACOS(
n_registro number PRIMARY KEY,
nombre_comercial varchar2 (20),
nombre_clinico varchar2 (20),
compuesto_quimico varchar2 (20),
ubicacion varchar2 (20),
cod_proveedor number,
num_unid_por_envase number,
precio_por_unidosis number(5,2),
precio_por_envase number(5,2)
);

CREATE TABLE REVISIONES(
id_revision number PRIMARY KEY,
num_historia_clinica number REFERENCES PACIENTES(H_clinica),
id_ingreso number REFERENCES INGRESOS(id_ingreso),
fecha date,
informe varchar2(30)
);


-- PACIENTES
--1. Insertar Paciente
CREATE OR REPLACE PROCEDURE insertar_paciente (a_h_clinica IN NUMBER, a_nombre IN VARCHAR2, a_n_seguro_social IN NUMBER, a_direccion IN VARCHAR2, a_telefono IN NUMBER, a_fecha_nacimiento IN DATE)
AS
BEGIN
	INSERT INTO PACIENTES (h_clinica, nombre, n_seguro_social, direccion, telefono, fecha_nacimiento) VALUES (a_h_clinica, a_nombre, a_n_seguro_social, a_direccion, a_telefono, a_fecha_nacimiento);
END;
/
exec insertar_paciente (4, 'Herber',44,'LOS PINOS 111',999888777, Current_date);
--2. Modificar Paciente 
CREATE OR REPLACE PROCEDURE modificar_paciente (a_h_clinica IN NUMBER, a_nombre IN VARCHAR2, a_n_seguro_social IN NUMBER, a_direccion IN VARCHAR2, a_telefono IN NUMBER, a_fecha_nacimiento IN DATE)
AS
BEGIN
    UPDATE PACIENTES
    SET 
        nombre = a_nombre,
        n_seguro_social = a_n_seguro_social,
        direccion = a_direccion,
        telefono = a_telefono,
        fecha_nacimiento = a_fecha_nacimiento
    WHERE H_clinica = a_h_clinica;
END;
/
exec modificar_paciente(1,'Pepe',11,'AV COLONIAL',914153434,'18/06/02');
--3. Borrar Paciente 
CREATE OR REPLACE PROCEDURE borrar_paciente (a_h_clinica IN NUMBER)
AS
BEGIN
DELETE FROM PACIENTES WHERE H_clinica = a_h_clinica;
END;
/

exec borrar_paciente(4);

-- MEDICAMENTOS
--1. Insertar Medicamento
CREATE OR REPLACE PROCEDURE InsertarMedicamento(
    p_nombre_comercial VARCHAR2,
    p_nombre_clinico VARCHAR2,
    p_compuesto_quimico VARCHAR2,
    p_ubicacion VARCHAR2,
    p_cod_proveedor NUMBER,
    p_num_unid_por_envase NUMBER,
    p_precio_por_unidosis NUMBER,
    p_precio_por_envase NUMBER
) 
AS
BEGIN
    INSERT INTO FARMACOS (
        nombre_comercial, nombre_clinico, compuesto_quimico, ubicacion,
        cod_proveedor, num_unid_por_envase, precio_por_unidosis, precio_por_envase
    ) VALUES (
        p_nombre_comercial, p_nombre_clinico, p_compuesto_quimico, p_ubicacion,
        p_cod_proveedor, p_num_unid_por_envase, p_precio_por_unidosis, p_precio_por_envase
    );
END;
/
--2. Modificar Medicamento 
CREATE OR REPLACE PROCEDURE ModificarMedicamento(
    p_n_registro NUMBER,
    p_nombre_comercial VARCHAR2,
    p_nombre_clinico VARCHAR2,
    p_compuesto_quimico VARCHAR2,
    p_ubicacion VARCHAR2,
    p_cod_proveedor NUMBER,
    p_num_unid_por_envase NUMBER,
    p_precio_por_unidosis NUMBER,
    p_precio_por_envase NUMBER
) 
AS
BEGIN
    UPDATE FARMACOS
    SET nombre_comercial = p_nombre_comercial,
        nombre_clinico = p_nombre_clinico,
        compuesto_quimico = p_compuesto_quimico,
        ubicacion = p_ubicacion,
        cod_proveedor = p_cod_proveedor,
        num_unid_por_envase = p_num_unid_por_envase,
        precio_por_unidosis = p_precio_por_unidosis,
        precio_por_envase = p_precio_por_envase
    WHERE n_registro = p_n_registro;
END;
/
--3. Borrar Medicamento
CREATE OR REPLACE PROCEDURE BorrarMedicamento(
    p_n_registro NUMBER
) 
AS
BEGIN
    DELETE FROM FARMACOS
    WHERE n_registro = p_n_registro;
END;
/


-- SERVICIOS
--1. Insertar Servicio
CREATE OR REPLACE PROCEDURE InsertarServicio(
    p_id_ingreso NUMBER,
    p_num_historia_clinica NUMBER,
    p_servicio VARCHAR2,
    p_diagnostico VARCHAR2,
    p_fecha_ingreso DATE,
    p_fecha_alta DATE
) AS
BEGIN
    INSERT INTO INGRESOS (
        id_ingreso, num_historia_clinica, servicio, diagnostico, fecha_ingreso, fecha_alta
    ) VALUES (
        p_id_ingreso, p_num_historia_clinica, p_servicio, p_diagnostico, p_fecha_ingreso, p_fecha_alta
    );
END;
/
--2. Modificar Servicio 
CREATE OR REPLACE PROCEDURE ModificarServicio(
    p_id_ingreso NUMBER,
    p_nueva_servicio VARCHAR2,
    p_nuevo_diagnostico VARCHAR2,
    p_nueva_fecha_ingreso DATE,
    p_nueva_fecha_alta DATE
) AS
BEGIN
    UPDATE INGRESOS
    SET servicio = p_nueva_servicio,
        diagnostico = p_nuevo_diagnostico,
        fecha_ingreso = p_nueva_fecha_ingreso,
        fecha_alta = p_nueva_fecha_alta
    WHERE id_ingreso = p_id_ingreso;
END;
/
--3. Borrar Servicio
CREATE OR REPLACE PROCEDURE BorrarServicio(
    p_id_ingreso NUMBER
) AS
BEGIN
    DELETE FROM INGRESOS
    WHERE id_ingreso = p_id_ingreso;
END;
/


-- JOINS
--1.	Gasto total de un servicio 
SELECT s.servicio, SUM(s.cantidad * f.precio_por_unidosis) AS gasto_total 
FROM Consumo_Servicio s 
JOIN Farmacos f 
ON s.num_registro_farmaco = f.n_registro 
GROUP BY s.servicio;

--2.	Fármacos recetados a un paciente por un facultativ
SELECT c.num_historia_clinica, c.num_historia_farmaco, f.nombre_comercial, c.cantidad
FROM Consumo_Paciente c 
JOIN Farmacos f 
ON c.num_historia_farmaco = f.n_registro 
WHERE c.num_historia_clinica = 1;

--3.	Revisión de un paciente en un ingreso específico
SELECT r.fecha, r.informe 
FROM Revisiones r 
WHERE r.num_historia_clinica = 1
AND r.id_ingreso =1;





