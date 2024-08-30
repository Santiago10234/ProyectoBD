create DATABASE Hoteles;
use Hoteles;


CREATE TABLE Usuarios (
    CedulaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL
);
ALTER TABLE Usuarios ADD COLUMN Tipo VARCHAR(20) NOT NULL;
UPDATE Usuarios SET Tipo = 'usuario'; WHERE CedulaID = 1;
UPDATE Usuarios SET Tipo = 'usuario'; WHERE CedulaID = 2;

CREATE TABLE Administradores (
 AdministradorID INT PRIMARY KEY AUTO_INCREMENT,
 Nombre VARCHAR(100) NOT NULL,
 Apellidos VARCHAR(100) NOT NULL,
 Correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Hoteles (
HotelID INT PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(100) NOT NULL,
Clasificacion INT,
AdministradorID INT,
Foreign Key (AdministradorID) REFERENCES Administradores(AdministradorID)
);

create TABLE Habitaciones (HabitacionID INT PRIMARY KEY AUTO_INCREMENT, HotelID INT, NumeroHabitacion VARCHAR(10) NOT NULL, Disponibilidad BOOLEAN NOT NULL, Clasificacion VARCHAR(50), FOREIGN KEY (HotelID) REFERENCES Hoteles(HotelID));

create TABLE Servicios (ServicioID INT PRIMARY KEY AUTO_INCREMENT, Nombre VARCHAR(100) NOT NULL, Costo DECIMAL(10, 2), HotelID INT, FOREIGN KEY (HotelID) REFERENCES Hoteles(HotelID))

create TABLE Reservas (ReservaID INT PRIMARY KEY AUTO_INCREMENT, CedulaID INT, HabitacionID INT, FechaInicio DATE NOT NULL, FechaFin DATE NOT NULL, FOREIGN KEY (CedulaID) REFERENCES Usuarios(CedulaID), FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID));
INSERT INTO Administradores (Nombre, Apellidos, Correo) VALUES
("Juan", "Perez", "juan@gmail.com"),
("Anita", "Biliber", "anitab@gmail.com"); 
INSERT INTO Usuarios (Nombre, Apellidos, Correo) VALUES
("Carlos", "Gomez", "carlos@gmail.com"),
("Laurita", "Gomez", "laura.m@gmail.com");
INSERT INTO Usuarios (Nombre, Apellidos, Correo, Tipo) VALUES
("Santiago", "Ariza", "Santiago@gmail.com", "administrador");

ALTER TABLE Hoteles ADD COLUMN Ubicacion VARCHAR(100) NOT NULL 

INSERT INTO Hoteles (Nombre, Ubicacion, Clasificacion, AdministradorID)VALUES
("hotel playa","playa del carmen",4, 1 ),
("hotel Montaña","ciudad Mexico",5, 2)

INSERT INTO Hoteles (Nombre, Ubicacion, Clasificacion, AdministradorID)VALUES
("HotelCosta Azul", "Cancún", 4, 1),
("Hotel Sierra Verde", "Guadalajara", 3, 2),
("Hotel Ciudad Sol", "Monterrey", 5, 1),
("Hotel Oasis Tropical", "Tulum", 4, 2),
("Hotel Laguna Dorada", "Puerto Vallarta", 3, 1);


INSERT INTO Habitaciones (HotelID, NumeroHabitacion, Disponibilidad, Clasificacion) VALUES(1,"101", TRUE, "Deluxe"), (1,"102",FALSE,"Standard"), (2,"201", TRUE, "Suite"), (2, "202", TRUE, "Standard");
INSERT INTO Habitaciones (HotelID, NumeroHabitacion, Disponibilidad, Clasificacion) VALUES(3, "301", TRUE, "Deluxe"), (3, "302", TRUE, "Standard"), (3, "303", TRUE, "Standard"), (4, "401", TRUE, "Suite"), (4, "402", FALSE, "Standard"), (4, "403", FALSE, "Standard"), (5, "501", TRUE, "Superior"), (5, "502", TRUE, "Deluxe"), (5, "503", TRUE, "Suite"), (6, "601", TRUE, "Suite"), (6, "602", FALSE, "Standard"), (6, "603", True, "Standard"), (7, "701", TRUE, "Standard"), (7, "702", TRUE, "Superior"), (7, "703", FALSE, "Superior");
INSERT INTO Servicios (Nombre, Costo, HotelID) VALUES ("WiFi", 10.00,1), ("Desayuno incluido", 25.00, 2);
INSERT INTO Reservas (CedulaID, HabitacionID, FechaInicio, FechaFin) VALUES (1, 1, "2024-09-01", "2024-09-05"), (2, 3, "2024-10-10", "2024-10-15");


CREATE INDEX idx_ubicacion ON Hoteles(Ubicacion);


SELECT * FROM Usuarios

SELECT * FROM Administradores

SELECT * FROM Hoteles

SELECT * FROM Habitaciones

SELECT * FROM Servicios

SELECT * FROM Reservas
