-- APELLIDOS Y NOMBRES: Eustaquio Jiménez, Roberto Edmundo

-- Crear una base de datos llamada FIIS
create database FIIS;

-- TABLA 1. CUERPO DOCENTE DE LA FIIS: 
CREATE TABLE Docentes (
    Codigo_Docente VARCHAR2(10) PRIMARY KEY,
    Local VARCHAR2(10),
    Facultad VARCHAR2(100),
    Dni NUMBER,
    Apellido_Paterno VARCHAR2(50),
    Apellido_Materno VARCHAR2(50),
    Nombres VARCHAR2(100),
    Condicion VARCHAR2(20),
    Tipo_Contrato VARCHAR2(20),
    Clasificacion VARCHAR2(50),
    Carga_Academica NUMBER,
    Mayor_Grado_Academico VARCHAR2(20),
    Mencion_Mayor_Grado_Academico VARCHAR2(50)
);

-- TABLA 2. PLAN DE ESTUDIOS DE LA CARRERA DE INGENIERÍA DE SISTEMAS 
CREATE TABLE PlanEstudios (
    N_Asignatura NUMBER PRIMARY KEY,
    Nombre_Asignatura VARCHAR2(100),
    Tipo_Curso VARCHAR2(20),
    Tipo_Estudio VARCHAR2(20),
    Horas_Teoricas NUMBER,
    Horas_Practicas NUMBER,
    Creditos NUMBER,
    Total_Horas_Teoricas NUMBER,
    Total_Horas_Practicas NUMBER,
    Tota_Horas_Academicas NUMBER,
    N_Asignatura_Requisito NUMBER
);

-- TABLA 3. RELACIÓN DE ALUMNOS DISEÑO DE BASE DE DATOS 
CREATE TABLE Alumnos (
    Codigo_Alumno VARCHAR2(10) PRIMARY KEY,
    Nombres VARCHAR2(50),
    Apellidos VARCHAR2(50),
    Correo_Institucional VARCHAR2(50)
);


-- 1.	Por cada una de las tablas creadas, ingresar 10 registros:
-- tabla Docentes (obligatoriamente insertar a los docentes MUÑOZ RAMOS y AZAÑA AZAÑA, con los datos mostrados en el link):
INSERT INTO Docentes VALUES ('001', 'SL07', 'Ingenieria Industrial Y Sistemas', 6756452, 'Azaña', 'Azaña', 'Julio Teofilo', 'Ordinario', 'Asociado', 'Tiempo Completo', 40, 'Maestro', 'Ingeniería De Sistemas');
INSERT INTO Docentes VALUES ('002', 'SL07', 'Ingenieria Industrial Y Sistemas', 6636692, 'Muñoz', 'Ramos', 'Luis Avelino', 'Ordinario', 'Asociado', 'Tiempo Parcial', 12, 'Maestro', 'Ingeniería De Sistemas');
INSERT INTO Docentes VALUES ('003', 'SL07', 'Ingenieria Industrial Y Sistemas', 6046986, 'Villalobos', 'Cueva', 'Walter', 'Ordinario', 'Asociado', 'Tiempo Completo', 40, 'Doctor', 'Medio Ambiente Y Desarrollo Sostenible');
INSERT INTO Docentes VALUES ('004', 'SL07', 'Ingenieria Industrial Y Sistemas', 6813646, 'Villanueva', 'Guzman', 'Victor Gonzalo', 'Ordinario', 'Asociado', 'Tiempo Completo', 40, 'Bachiller', 'Ingeniería Industrial');
INSERT INTO Docentes VALUES ('005', 'SL07', 'Ingenieria Industrial Y Sistemas', 7585766, 'Zuloeta', 'Vera', 'Jaime', 'Ordinario', 'Principal', 'Tiempo Completo', 40, 'Maestro', 'Ingeniería Industrial Con Mención En Producción');
INSERT INTO Docentes VALUES ('006', 'SL07', 'Ingenieria Industrial Y Sistemas', 7235997, 'Alejos', 'Cirilo', 'Epifanio Alberto', 'Contratado', 'DCU-B', 'B1', 32, 'Maestro', 'Docencia Universitaria');
INSERT INTO Docentes VALUES ('007', 'SL07', 'Ingenieria Industrial Y Sistemas', 25694430, 'Aparicio', 'Montenegro', 'Pablo Roberto', 'Contratado', 'DCU-B', 'B2', 16, 'Maestro', 'Ingenieria De Sistemas');
INSERT INTO Docentes VALUES ('008', 'SL07', 'Ingenieria Industrial Y Sistemas', 25669005, 'Carlos', 'Reyes', 'Gabriel Jorge', 'Contratado', 'DCU-B', 'B1', 32, 'Maestro', 'Ingeniería Industrial Con Mención En Producción');
INSERT INTO Docentes VALUES ('009', 'SL07', 'Ingenieria Industrial Y Sistemas', 9179094, 'Carranza', 'Barrena', 'Wilfredo Eduardo', 'Contratado', 'DCU-B', 'B2', 16, 'Maestro', 'Dirección Y Gestión');
INSERT INTO Docentes VALUES ('010', 'SL07', 'Ingenieria Industrial Y Sistemas', 6178602, 'Carrillo', 'Balceda', 'Jesus Elias', 'Contratado', 'DCU-B', 'B1', 32, 'Maestro', 'Salud Pública');
-- tabla PlanEstudios:
INSERT INTO PlanEstudios VALUES (39, 'Programación aplicada III', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 31);
INSERT INTO PlanEstudios VALUES (40, 'Administración financiera', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 32);
INSERT INTO PlanEstudios VALUES (41, 'Diseño de bases de datos', 'Obligatorio', 'Especifico', 2, 4, 4, 32, 64, 96, 33);
INSERT INTO PlanEstudios VALUES (42, 'Ingeniería de requerimientos', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 34);
INSERT INTO PlanEstudios VALUES (43, 'Fundamentos de redes y conectividad', 'Obligatorio', 'Especifico', 2, 4, 4, 32, 64, 96, 35);
INSERT INTO PlanEstudios VALUES (44, 'Arquitectura de software', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 34);
INSERT INTO PlanEstudios VALUES (46, 'Ingeniería de software', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 42);
INSERT INTO PlanEstudios VALUES (47, 'Investigación aplicada', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 21);
INSERT INTO PlanEstudios VALUES (48, 'Administración y gestión de bases de datos', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 41);
INSERT INTO PlanEstudios VALUES (49, 'Planeamiento de recursos empresariales', 'Obligatorio', 'Especifico', 2, 2, 3, 32, 32, 64, 42);
-- tabla Alumnos:
INSERT INTO Alumnos VALUES ('2020102484', 'Roberto Edmundo', 'Eustaquio Jiménez', '2020102484@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020009209', 'Kiara Luz', 'Fernandez Perez', '2020009209@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020102493', 'Luis Angel', 'Martel Bonilla', '2020102493@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020009405', 'Alvaro Manuel', 'Espinoza Garate', '2020009405@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020009441', 'Jose Ivan', 'Suazo Romero', '2020009441@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020009379', 'Josue Gabriel', 'Julca Zeña', '2020009379@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020009165', 'Antonio Isabel', 'Campuzano Suyo', '2020009165@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020103944', 'Dante Ronaldo', 'Carbajal Dominguez', '2020103944@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020103962', 'Mercedes Anayely', 'Durand Azurza', '2020103962@unfv.edu.pe');
INSERT INTO Alumnos VALUES ('2020009058', 'Mishely Dajhanna', 'Vidal Espinoza', '2020009058@unfv.edu.pe');


-- 2.	Modificar los datos de MUÑOZ RAMOS, modificando su clasificacion de Tiempo Parcial 12 horas a Tiempo Completo. Eliminar al docente AZAÑA AZAÑA.
UPDATE Docentes SET Clasificacion='Tiempo Completo', Carga_Academica=40 WHERE Apellido_Paterno = 'Muñoz' and Apellido_Materno = 'Ramos';
DELETE FROM Docentes WHERE Apellido_Paterno = 'Azaña' and Apellido_Materno = 'Azaña';


-- 3.	En la tabla PLAN DE ESTUDIOS, para cada asignatura registrada, adicionar el código de asignatura y código de la asignatura prerrequisito.
-- Primero agrego las columnas solicitadas a la tabla PlanEstudios:
ALTER TABLE PlanEstudios ADD Codigo_Asignatura VARCHAR2(10);
ALTER TABLE PlanEstudios ADD Codigo_Asignatura_Prerrequisito VARCHAR2(10);
-- Ahora adiciono en cada asignatura registrada los datos de los nuevos campos:
UPDATE PlanEstudios SET Codigo_Asignatura='00039', Codigo_Asignatura_Prerrequisito='00031' WHERE N_Asignatura=39;
UPDATE PlanEstudios SET Codigo_Asignatura='00040', Codigo_Asignatura_Prerrequisito='00032' WHERE N_Asignatura=40;
UPDATE PlanEstudios SET Codigo_Asignatura='00041', Codigo_Asignatura_Prerrequisito='00033' WHERE N_Asignatura=41;
UPDATE PlanEstudios SET Codigo_Asignatura='00042', Codigo_Asignatura_Prerrequisito='00034' WHERE N_Asignatura=42;
UPDATE PlanEstudios SET Codigo_Asignatura='00043', Codigo_Asignatura_Prerrequisito='00035' WHERE N_Asignatura=43;
UPDATE PlanEstudios SET Codigo_Asignatura='00044', Codigo_Asignatura_Prerrequisito='00034' WHERE N_Asignatura=44;
UPDATE PlanEstudios SET Codigo_Asignatura='00046', Codigo_Asignatura_Prerrequisito='00042' WHERE N_Asignatura=46;
UPDATE PlanEstudios SET Codigo_Asignatura='00047', Codigo_Asignatura_Prerrequisito='00021' WHERE N_Asignatura=47;
UPDATE PlanEstudios SET Codigo_Asignatura='00048', Codigo_Asignatura_Prerrequisito='00041' WHERE N_Asignatura=48;
UPDATE PlanEstudios SET Codigo_Asignatura='00049', Codigo_Asignatura_Prerrequisito='00042' WHERE N_Asignatura=49;


-- 4.	Modificar la estructura de la tabla ALUMNOS, adicionando el campo Número-Teléfono. Luego, adicionar datos en el campo creado.
ALTER TABLE Alumnos ADD Numero_Telefono VARCHAR2(20);
UPDATE Alumnos SET Numero_Telefono = '950145343' WHERE Codigo_Alumno='2020102484';
UPDATE Alumnos SET Numero_Telefono = '987654132' WHERE Codigo_Alumno = '2020009209';
UPDATE Alumnos SET Numero_Telefono = '933455761' WHERE Codigo_Alumno='2020102493';
UPDATE Alumnos SET Numero_Telefono = '955678949' WHERE Codigo_Alumno = '2020009405';
UPDATE Alumnos SET Numero_Telefono = '977890831' WHERE Codigo_Alumno='2020009441';
UPDATE Alumnos SET Numero_Telefono = '910111592' WHERE Codigo_Alumno = '2020009379';
UPDATE Alumnos SET Numero_Telefono = '922136184' WHERE Codigo_Alumno='2020009165';
UPDATE Alumnos SET Numero_Telefono = '944154166' WHERE Codigo_Alumno = '2020103944';
UPDATE Alumnos SET Numero_Telefono = '966173118' WHERE Codigo_Alumno = '2020103962';
UPDATE Alumnos SET Numero_Telefono = '988192520' WHERE Codigo_Alumno='2020009058';


-- 5.	Crear una nueva tabla MATRICULA, relacionando la tabla ALUMNO con la tabla PLAN DE ESTUDIOS, asignando el curso matriculado a un DOCENTE
CREATE TABLE Matricula (
    Id_Matricula NUMBER PRIMARY KEY,
    Codigo_Alumno VARCHAR2(10),
    N_Asignatura NUMBER,
    Codigo_Docente VARCHAR2(10),
    Estado_Matricula VARCHAR2(20),
    CONSTRAINT FK_Alumno FOREIGN KEY (Codigo_Alumno) REFERENCES Alumnos(Codigo_Alumno),
    CONSTRAINT FK_Asignatura FOREIGN KEY (N_Asignatura) REFERENCES PlanEstudios(N_Asignatura),
    CONSTRAINT FK_Docente FOREIGN KEY (Codigo_Docente) REFERENCES Docentes(Codigo_Docente)
);
INSERT INTO Matricula VALUES (1, '2020102484', 39, '001', 'Matriculado');
INSERT INTO Matricula VALUES (2, '2020009209', 40, '002', 'Matriculado');
INSERT INTO Matricula VALUES (3, '2020102493', 41, '003', 'Matriculado');
INSERT INTO Matricula VALUES (4, '2020009405', 42, '004', 'Matriculado');
INSERT INTO Matricula VALUES (5, '2020009441', 43, '005', 'Matriculado');
INSERT INTO Matricula VALUES (6, '2020009379', 44, '006', 'Matriculado');
INSERT INTO Matricula VALUES (7, '2020009165', 46, '007', 'Matriculado');
INSERT INTO Matricula VALUES (8, '2020103944', 47, '008', 'Matriculado');
INSERT INTO Matricula VALUES (9, '2020103962', 48, '009', 'Matriculado');
INSERT INTO Matricula VALUES (10, '2020009058', 49, '010', 'Matriculado');


-- 6.	Modificar la tabla MATRICULA cuando el ALUMNO solicite Reserva de Matricula
-- Aqui doy un ejemplo general con mi codigo de estudiante:
UPDATE Matricula SET Estado_Matricula = 'Reserva de Matricula'
WHERE Codigo_Alumno = '2020102484' AND Estado_Matricula = 'Matriculado';


select * from Alumnos; 
select * from PlanEstudios;
select * from Docentes;
select * from Matricula;


drop table Alumnos; 
drop table PlanEstudios;
drop table Docentes;
drop table Matricula;
