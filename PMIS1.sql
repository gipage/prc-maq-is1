CREATE TABLE Zonas(
    "znbre" character varying(100) NOT NULL,
    "zdescrip" character varying(100) NOT NULL,
    "zhorario" character varying(100) NOT NULL,
    "zruta" character varying(100) NOT NULL,
    PRIMARY KEY("znbre") 
);
CREATE TABLE Camiones(
    "cpatente" character(7) NOT NULL,
    "cmodelo"  character varying(100) NOT NULL,
    "cestado"  character varying(100) NOT NULL
    PRIMARY KEY("cpatente")
);
CREATE TABLE Empleados(
    "edni" character(8) NOT NULL,
    "enombre" character varying(100) NOT NULL,
    "elegajo" character(6) NOT NULL,
    "etel" character varying(20),
    "edireccion" character varying(100) NOT NULL,
    "ecargo" character character varying(100) NOT NULL
    PRIMARY KEY("elegajo"),
    UNIQUE("edni")
);
CREATE TABLE Asignados(
    "znbre" character varying(100) NOT NULL,
    "cpatente" character(7) NOT NULL,
    "zruta" character varying(100) NOT NULL,
    "afecha" date NOT NULL,
    PRIMARY KEY("znbre","cpatente"),
    FOREIGN KEY("zbre") REFERENCES Zonas("znbre"),
    FOREIGN KEY("cpatente") REFERENCES Camiones("cpatente"),
    FOREIGN KEY("zruta") REFERENCES Zonas("zruta")
);
CREATE TABLE Trabajan(
    "cpatente" character(7) NOT NULL,
    "edni" character(8) NOT NULL,
    "znbre"character varying(100) NOT NULL,
    "tfecha" date NOT NULL,
    PRIMARY KEY("cpatente","edni","znbre","tfecha"),
    FOREIGN KEY("zbre") REFERENCES Zonas("znbre"),
    FOREIGN KEY("cpatente") REFERENCES Camiones("cpatente"),
    FOREIGN KEY("edni") REFERENCES Empleados("cpatente")
);