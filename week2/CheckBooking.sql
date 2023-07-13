DROP PROCEDURE IF EXISTS CheckBooking;
Create PROCEDURE CheckBooking(BookingDate DATE, TableNumber INT)
	SELECT CONCAT("Table ", TableNumber, " is already booked") FROM Bookings
	WHERE Date = BookingDate AND TableNo = TableNumber;
Call CheckBooking("2022-10-13", 3);