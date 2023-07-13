DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN BookingIDPara INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = BookingIDPara;
SELECT CONCAT("Booking ", BookingIDPara, " cancelled") AS "Confirmation";
END //
DELIMITER ;

CALL CancelBooking(9);

SELECT * FROM Bookings;