create table Competencia (
    IDCompetencia NUMBER PRIMARY KEY,
    NombreCompetencia VARCHAR2(25) not null,
    TipoCompetencia VARCHAR2(25) not null
);

create table RolLaboral ( -- analista programador, jefe de proyectos, desarrollador, …)
    IDRol NUMBER PRIMARY KEY,
    NombreRol VARCHAR2(50) not null,
    FuncionRol VARCHAR2(100) not null
);

create table CompetenciaxRol (
    IDCompetenciaRol NUMBER PRIMARY KEY,
    IDCompet NUMBER,
    IDPuesto NUMBER,
    NivelCompetenciaRol NUMBER, -- atributo propio de la tabla
    --FOREIGN KEY (Fk_IDCompetencia) REFERENCES Competencia(IDCompetencia),
    --FOREIGN KEY (Fk_IDRol) REFERENCES RolLaboral(IDRol)
    CONSTRAINT fk_competencia FOREIGN KEY (IDCompet) REFERENCES Competencia(IDCompetencia),
    CONSTRAINT fk_rol FOREIGN KEY (IDPuesto) REFERENCES RolLaboral(IDRol)
);

-- Eliminar la tablas
drop table Competencia; 
drop table RolLaboral; 
drop table CompetenciaxRol;

-- Mostrar las tablas
describe Competencia; 
describe RolLaboral; 
describe CompetenciaxRol;

--NivelExperienciaCompetenciaRol VARCHAR2(50), -- atributo propio de la tabla
--nivel para competencia, pero jalas de otra tabla, pero eso ya no cumple con ser propio de CompetenciaxRol
--nivel tiene que ser NUMBER, porque si lo pones como var puede ingresar demasiados 
-- valores (se codifica a parte que el 1 = alto, etc.)


