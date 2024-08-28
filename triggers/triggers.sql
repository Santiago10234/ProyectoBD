use Hoteles

CREATE TRIGGER ActualizarDisponibilidadReservaInsert
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET Disponibilidad = FALSE
    WHERE HabitacionID = NEW.HabitacionID
    AND(
        (FechaInicio <= NEW.FechaFin AND FechaFin >= NEW.FechaInicio)
    );
END;

CREATE TRIGGER ActualizarDisponibilidadReservaDelete
AFTER DELETE ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET Disponibilidad = TRUE
    WHERE HabitacionID = OLD.HabitacionID
    AND NOT EXISTS (
        SELECT 1
        FROM Reservas
        WHERE HabitacionID = OLD.HabitacionID 
        AND (
            (FechaInicio <= CURDATE() AND FechaFin >= CURDATE())
        )
    );
END;