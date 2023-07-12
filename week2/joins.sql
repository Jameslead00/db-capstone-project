SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.TotalCost, Menus.Name, MenuItems.MainCourse, MenuItems.Starter FROM
Customers INNER JOIN Orders ON Customers.CustomerID=Orders.Customers_CustomerID
INNER JOIN Menus ON Orders.Menus_MenuID=Menus.MenuID
INNER JOIN MenuItems ON Menus.MenuItems_MenuItemID=MenuItems.MenuItemID
ORDER BY TotalCost ASC;