DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(IN bookingID INT, IN customerID INT, IN tableNo INT, IN date DATE)
BEGIN
INSERT INTO Bookings(BookingID, Customers_CustomerID, TableNo, Date) VALUES (bookingID, customerID, tableNo, date);
SELECT "New booking added" AS "Confirmation";
END//
DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");