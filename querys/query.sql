create DATABASE Hoteles;

use Hoteles;


CREATE TABLE Usuarios (
    CedulaID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL

);


CREATE TABLE Administradores (
 AdministradorID INT PRIMARY KEY,
 Nombre VARCHAR(100) NOT NULL,
 Correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Hoteles (
HotelID INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Clasificacion INT,
AdministradorID INT,
Foreign Key (AdministradorID) REFERENCES Administradores(AdministradorID)
);