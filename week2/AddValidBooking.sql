DROP PROCEDURE IF EXISTS AddValidBooking;
DROP FUNCTION IF EXISTS Validate;

DELIMITER //

CREATE FUNCTION Validate(RecordsFound INT, message VARCHAR(45)) RETURNS INT DETERMINISTIC
BEGIN
	IF RecordsFound IS NOT NULL OR RecordsFound > 0 THEN
		SIGNAL SQLSTATE 'ERROR' SET MESSAGE_TEXT = message;
	END IF;
    RETURN RecordsFound;
END //

CREATE PROCEDURE addValidBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
DECLARE `_rollback` BOOL DEFAULT 0;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
		START TRANSACTION;
        
        SELECT Validate(COUNT(*), CONCAT("Table ", TableNumber, " is already booked"))
        FROM Bookings
        WHERE Date = BookingDate AND TableNo = TableNumber;
        
		INSERT INTO Bookings (Date, TableNo)
		VALUES (BookingDate, TableNumber);
		
		IF `_rollback` THEN
			SELECT CONCAT("Table ", TableNumber, " is already booked - booking cancelled") AS "Booking status";
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END//
    
DELIMITER ;
CALL AddValidBooking("2022-12-17", 6);	