create DATABASE Hoteles;
use Hoteles;


CREATE TABLE Usuarios (
    CedulaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL
);


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

ALTER TABLE Hoteles ADD COLUMN Ubicacion VARCHAR(100) NOT NULL 

INSERT INTO Hoteles (Nombre, Ubicacion, Clasificacion, AdministradorID)VALUES
("hotel playa","playa del carmen",4, 1 ),
("hotel Montaña","ciudad Mexico",5, 2)

INSERT INTO Habitaciones (HotelID, NumeroHabitacion, Disponibilidad, Clasificacion) VALUES(1,"101", TRUE, "Deluxe"), (1,"102",FALSE,"Standard"), (2,"201", TRUE, "Suite"), (2, "202", TRUE, "Standard");
INSERT INTO Servicios (Nombre, Costo, HotelID) VALUES ("WiFi", 10.00,1), ("Desayuno incluido", 25.00, 2);
INSERT INTO Reservas (CedulaID, HabitacionID, FechaInicio, FechaFin) VALUES (1, 1, "2024-09-01", "2024-09-05"), (2, 3, "2024-10-10", "2024-10-15");


CREATE PROCEDURE AgregarReserva (
    IN p_CedulaID INT, 
    IN p_HabitacionID INT, 
    IN p_FechaInicio DATE, 
    IN p_FechaFin DATE
)
BEGIN 
    IF NOT EXISTS (
        SELECT 1
        FROM Reservas
        WHERE HabitacionID = p_HabitacionID
        AND (
            (FechaInicio <= p_FechaFin AND FechaFin >= p_FechaInicio)
        )
    ) THEN
        INSERT INTO Reservas (CedulaID, HabitacionID, FechaInicio, FechaFin)
        VALUES (p_CedulaID, p_HabitacionID, p_FechaInicio, p_FechaFin);
    ELSE
        SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "La habitación no está disponible en las fechas seleccionadas.";
    END IF;
END;

CALL AgregarReserva(1, 1, "2024-09-01", "2024-09-05");
CALL AgregarReserva(2, 3, "2024-11-10", "2024-11-15");


SELECT * FROM Usuarios

SELECT * FROM Administradores

SELECT * FROM Hoteles

SELECT * FROM Habitaciones

SELECT * FROM Servicios

SELECT * FROM Reservas

