DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(Orderid INT)
BEGIN
DELETE FROM Orders WHERE OrderID = Orderid;
SELECT CONCAT("Order ", OrderID, "was cancelled") as Confirmation;
END //

DELIMITER ;

CALL CancelOrder(3);