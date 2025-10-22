SELECT 
    FirstName +' ' + COALESCE(LastName, '') AS Customer_Full_Name,
	COALESCE(Customers.Score, 0) + 10 AS NewScore

FROM Sales.Customers;


SELECT * FROM Sales.Customers;



SELECT 
	OrderId,
	Sales,
	Quantity,
	COALESCE(Sales / NULLIF( Quantity, 0 ), Sales) AS SalesPricE
FROM Sales.Orders;

SELECT 
	OrderId,
	Sales,
	Quantity
FROM Sales.Orders;


SELECT 
*
FROM Sales.Customers
WHERE Score IS NULL;
