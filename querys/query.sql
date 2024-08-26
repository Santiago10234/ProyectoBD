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

create TABLE Habitaciones (HabitacionID INT PRIMARY KEY AUTO_INCREMENT, HotelID INT, NumeroHabitacion VARCHAR(10) NOT NULL, Disponibilidad BOOLEAN NOT NULL, Clasificacion VARCHAR(50), FOREIGN KEY (HotelID) REFERENCES Hoteles(HotelID));

create TABLE Servicios (ServicioID INT PRIMARY KEY AUTO_INCREMENT, Nombre VARCHAR(100) NOT NULL, Costo DECIMAL(10, 2), HotelID INT, FOREIGN KEY (HotelID) REFERENCES Hoteles(HotelID))

create TABLE Reservas (ReservaID INT PRIMARY KEY AUTO_INCREMENT, CedulaID INT, HabitacionID INT, FechaInicio DATE NOT NULL, FechaFin DATE NOT NULL, FOREIGN KEY (CedulaID) REFERENCES Usuarios(CedulaID), FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID));