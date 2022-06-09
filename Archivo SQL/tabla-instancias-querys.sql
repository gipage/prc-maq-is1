CREATE TABLE Zonas(
    "znbre" character varying(100) NOT NULL,
    "zdescrip" character varying(100) NOT NULL,
    "zhorario" character varying(100) NOT NULL,
    PRIMARY KEY("znbre") 
);
CREATE TABLE Camiones(
    "cpatente" character(7) NOT NULL,
    "cmodelo"  character varying(100) NOT NULL,
    "cestado"  character varying(100) NOT NULL,
    PRIMARY KEY("cpatente")
);
CREATE TABLE Empleados(
    "edni" character(8) NOT NULL,
    "enombre" character varying(100) NOT NULL,
    "elegajo" character(6) NOT NULL,
    "etel" character varying(20),
    "edireccion" character varying(100) NOT NULL,
    "ecargo" character varying(100) NOT NULL,
    PRIMARY KEY("elegajo"),
    UNIQUE("edni")
);
CREATE TABLE Recorrido(
    "znbre" character varying(100) NOT NULL,
    "cpatente" character(7) NOT NULL,
    "zruta" character varying(100) NOT NULL,
    "afecha" date NOT NULL,
    PRIMARY KEY("znbre","cpatente"),
    FOREIGN KEY("znbre") REFERENCES Zonas("znbre"),
    FOREIGN KEY("cpatente") REFERENCES Camiones("cpatente")
);
CREATE TABLE Trabajan(
    "cpatente" character(7) NOT NULL,
    "edni" character(8) NOT NULL,
     PRIMARY KEY("cpatente","edni"),
     FOREIGN KEY("cpatente") REFERENCES Camiones("cpatente"),
     FOREIGN KEY("edni") REFERENCES Empleados("edni") 
);

-- INSTANCIAS PARA PROBAR

INSERT INTO Zonas
VALUES 
('A','Barrio Norte','16:00'),
('B','Barrio Sur','18:00'),
('C','Barrio Oeste','20:00'),
('D','Barrio Este','22:00');

INSERT INTO Camiones
    VALUES 
            ('AB123CD','IVECO','ACTIVO'),
            ('CD333AG','SCANIA','ACTIVO'),
            ('HI456BF','MERCEDES','ACTIVO'),
            ('KJ289LK','VOLKSWAGEN','INACTIVO'),
            ('FI715GI','SCANIA','INACTIVO'),
            ('ZX111OP','VOLKSWAGEN','ACTIVO');
            ('OW114PV','VOLKSWAGEN','INACTIVO');
            ('XY777CZ','SCANIA','ACTIVO');


INSERT INTO Empleados("elegajo","edni","enombre", "etel", "edireccion", "ecargo")
    VALUES  ('EPA315', '25789546', 'ROSSI ABEL', '266415789', 'BELGRANO 125','RECOLECTOR'),
            ('DRT456', '25471254', 'PREZ MATIAS', '265715698', 'RIVADAVIA 314','CHOFER'),            
            ('QWE123', '28547125', 'PEREZ ARIEL', '266415874', 'MAIPU 425','RECOLECTOR'),	
            ('ASD423', '28963852', 'SOSA CARINA', '265715741', 'DON BOSCO 585','RECOLECTOR'),
            ('ZXC753', '21457896', 'BAZAN ANA', '266415963', 'MITRE 214','RECOLECTOR'),
            ('POI951', '22547856', 'GOMEZ ELISA', '265715632', 'RIVADAVIA 895','RECOLECTOR'),
            ('JKL357', '23547125', 'GOMEZ JUAN', '266415963', 'PRINGLES 854','CHOFER'),
            ('BNM741', '23963852', 'PERALTA PEDRO', '265715214', 'COLON 452','CHOFER');

INSERT INTO Recorrido
VALUES
         ('A','AB123CD','RUTA 3','08/06/2022'),
         ('B','CD333AG','RUTA 7','08/06/2022'),
         ('C','HI456BF','RUTA 14','10/06/2022'),
         ('D','ZX111OP','RUTA 14','10/06/2022'),
         ('A','XY777CZ','RUTA 3','15/06/2022');

INSERT INTO Trabajan
VALUES 
        ('AB123CD','25789546'),
        ('AB123CD','25471254'),
        ('CD333AG','28547125'),
        ('CD333AG','28963852'),
        ('HI456BF','21457896'),
        ('HI456BF','22547856'),
        ('ZX111OP','23547125'),
        ('XY777CZ','23963852');


-- CONSULTAR EMPLEADOS POR ZONA
SELECT empleados.edni,enombre,elegajo,etel,edireccion, ecargo
FROM recorrido,trabajan, empleados
WHERE recorrido.cpatente=trabajan.cpatente and znbre='A'and trabajan.edni=empleados.edni

