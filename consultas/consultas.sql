use Hoteles

SELECT h.HotelID, h.Nombre AS NombreHotel,
    COUNT(r.ReservaID) AS NumeroReservas
FROM
    Hoteles h
LEFT JOIN
    Habitaciones ha ON h.HotelID = ha.HotelID 
LEFT JOIN
    Reservas r ON ha.HabitacionID = r.HabitacionID 
GROUP BY
    h.HotelID, h.Nombre
ORDER BY
    NumeroReservas DESC;



SELECT
    COUNT(*) AS HabitacionesDisponibles
FROM 
    Habitaciones ha                    
LEFT JOIN
    Reservas r ON ha.HabitacionID = r.HabitacionID 
    AND (
        (r.FechaInicio <= "2024-09-15" AND r.FechaFin >= "2024-9-28")
    )
WHERE
    ha.HotelID = 1
    AND ha.Disponibilidad = TRUE
    AND r.ReservaID IS NULL;


SELECT
    HotelID,
    Nombre,
    Ubicacion,
    Clasificacion
FROM
    Hoteles 
WHERE
    Nombre LIKE "%hotel%"


SELECT
    HotelID,
    Nombre,
    Ubicacion,
    Clasificacion
FROM
    Hoteles 
WHERE
    Ubicacion LIKE "Puerto%"


SELECT
    HotelID,
    Nombre,
    Ubicacion,
    Clasificacion
FROM
    Hoteles
WHERE
    Ubicacion LIKE "%n"