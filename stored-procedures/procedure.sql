use Hoteles

-- Santiago
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
CALL AgregarReserva(1, 1, "2024-8-27", "2024-8-31");
CALL AgregarReserva(1, 2, "2024-8-28", "2024-8-31");
CALL AgregarReserva(3, 12, "2024-8-30", "2024-8-31");

-- Kenneth
CREATE PROCEDURE ConsultarDisponibilidad(
IN p_HotelID INT,
IN p_FechaInicio DATE,
IN p_FechaFin DATE
)
BEGIN
 SELECT h.HabitacionID,h.NumeroHabitacion,h.Disponibilidad,
h.Clasificacion
  FROM Habitaciones h
  LEFT JOIN Reservas r
  ON h.HabitacionID = r.HabitacionID
  AND (
    (r.FechaInicio <= p_FechaFin AND r.FechaFin >= p_FechaInicio)
  )
  WHERE h.HotelID = p_HotelID
  AND(r.ReservaID IS NULL OR (r.FechaFin < p_FechaInicio OR r.FechaInicio > p_FechaFin));
  END

  CALL ConsultarDisponibilidad(1,"2024-09-01", "2024-09-10");


SELECT * FROM reservas;