---------------------------------------------------------------------------
-- Independent CTE (Standalone CTE)
--Task:1-> Find the total Sales Per Customer and Find the last order
-- date for each Customer

-- CTE-1 Find the total sales per customer.
WITH CTE_TotalSales AS
(
SELECT 
	CustomerID,
	SUM(Sales) AS Each_CustomerTotalSales
FROM Sales.Orders
GROUP BY CustomerID
),

-- CTE-2 Find the last order date per customer.
CTE_CustomerLastOrder AS 
(
SELECT 
	CustomerID,
	MAX(OrderDate) AS CustomersLastOrder
FROM Sales.Orders
GROUP BY CustomerID
),

-- CTE-3 Rank CustomerBased on total Sales per Customer.
CTE_RankCustomer AS 
(
 SELECT 
	CustomerID,
	Each_CustomerTotalSales,
	RANK() OVER(ORDER BY Each_CustomerTotalSales DESC) AS CustomerRank
 FROM CTE_TotalSales
),

-- CTE-4 Segment the Customers based on their Total Sales
CTE_SegmentCustomer AS 
(
SELECT 
	CustomerID,
	CASE 
		WHEN Each_CustomerTotalSales > 100
		THEN 'High'
		WHEN Each_CustomerTotalSales > 80 AND Each_CustomerTotalSales < 100
		THEN 'Medium'
		ELSE 'Low'
	END SalesSegment		
FROM CTE_TotalSales
)


-- Main Query
SELECT 
	c.CustomerID,
	CONCAT(c.FirstName, ' ', c.LastName) AS CustomerFullName,
	c.Country,
	COALESCE(c.Score, 0) AS CustomerScore,
	COALESCE(cts.Each_CustomerTotalSales, 0) CustomerTotalSales,
	clo.CustomersLastOrder,
	rc.CustomerRank,
	sc.SalesSegment
FROM Sales.Customers c
LEFT JOIN CTE_TotalSales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_CustomerLastOrder clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_RankCustomer rc
ON rc.CustomerID = c.CustomerID
LEFT JOIN CTE_SegmentCustomer sc
ON sc.CustomerID = c.CustomerID
ORDER BY CustomerRank;


/*
SELECT 
	clo.CustomerID,
	clo.CustomersLastOrder,
	cts.Each_CustomerTotalSales
FROM CTE_CustomerLastOrder AS clo
LEFT JOIN CTE_TotalSales AS cts
ON clo.CustomerID = cts.CustomerID
ORDER BY CustomerID
*/



-- Recursive CTE 
-- Generate a Sequence of Numbers from 1 to 20 


WITH Series AS (
	-- Anchor Query 
	SELECT 1 AS myNumber 
	UNION ALL
	SELECT 
		myNumber + 1
	FROM Series
	WHERE  myNumber <20
)

SELECT * FROM Series
OPTION (MAXRECURSION 20)


SELECT * FROM Sales.Employees
SELECT * FROM Sales.Products
SELECT * FROM Sales.Orders
SELECT * FROM Sales.OrdersArchive
SELECT * FROM Sales.Customers
