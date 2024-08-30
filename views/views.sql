use Hoteles
-- Santiago
CREATE VIEW ReporteReservasHoy AS
SELECT
    r.ReservaID,
    u.Nombre AS NombreUsuario,
    u.Apellidos AS ApellidosUsuario,
    h.Nombre AS NombreHotel,
    ha.NumeroHabitacion,
    r.FechaInicio,
    r.FechaFin
FROM
    Reservas r
JOIN
    Usuarios u ON r.CedulaID = u.CedulaID
JOIN
    Habitaciones ha ON r.HabitacionID = ha.HabitacionID
JOIN
    Hoteles h ON ha.HotelID = h.HotelID
WHERE
    DATE(r.FechaInicio) = CURDATE() OR DATE(r.FechaFin) = CURDATE();

SELECT * FROM ReporteReservasHoy