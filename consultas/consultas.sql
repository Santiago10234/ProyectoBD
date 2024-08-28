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

