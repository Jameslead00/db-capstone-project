USE LittleLemonDB;
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingIDPara INT, IN DatePara DATE)
BEGIN
UPDATE Bookings SET Date = DatePara WHERE BookingID = BookingIDPara;
SELECT CONCAT("Booking ", BookingIDPara, " updated") AS "Confirmation";
END //
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");

SELECT * FROM Bookings;