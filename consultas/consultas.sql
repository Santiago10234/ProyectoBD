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


SELECT 
    u.Nombre AS NombreCliente,
    u.Apellidos AS ApellidosCliente,
    r.ReservaID,
    r.FechaInicio,
    r.FechaFin,
    h.NumeroHabitacion,
    ho.Nombre AS NombreHotel,
    ho.Ubicacion
FROM 
    Usuarios u
JOIN 
    Reservas r ON u.CedulaID = r.CedulaID
JOIN 
    Habitaciones h ON r.HabitacionID = h.HabitacionID
JOIN 
    Hoteles ho ON h.HotelID = ho.HotelID
WHERE 
    u.Correo = "carlos@gmail.com"
    AND r.FechaInicio BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
ORDER BY 
    r.FechaInicio;


SELECT
    ho.nombre AS NombreHotel,
    COUNT(r.reservaID) AS TotalReservas,
    DATEDIFF(MAX(r.FechaFin),MIN(r.FechaInicio)) + 1 AS NumeroDias,
    COUNT(r.ReservaID)/ (DATEDIFF(MAX(r.FechaFin),MIN(r.FechaInicio))+1) AS PromedioReservasDiarias
FROM 
   Reservas r
JOIN 
   Habitaciones h ON r.HabitacionID = h.HabitacionID
JOIN
   Hoteles ho ON h.HotelID = ho.HotelID
WHERE 
   ho.HotelID = 1
GROUP BY 
    ho.HotelID, ho.Nombre;
 