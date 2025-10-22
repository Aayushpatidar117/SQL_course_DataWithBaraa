SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Employees;
SELECT * FROM Sales.Products;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive;

------------------------------------------------------------------------------------

SELECT 
	ord.OrderID,
    prd.ProductID,
	prd.Product,
	prd.Category,
	prd.Price,
	COUNT(*) OVER(PARTITION BY ord.ProductID) AS OrderCountForEachProduct
FROM Sales.Orders AS ord
INNER JOIN Sales.Products AS prd
ON prd.ProductID = ord.ProductID;

-------------------------------------------------------------------------------------

SELECT 
	OrderID,
	CustomerID,
	COUNT(*) OVER(PARTITION BY CustomerID) AS Order_Count_As_Per_Customer
FROM Sales.Orders;

--------------------------------------------------------------------------------------

SELECT 
	CustomerID,
	FirstName + ' ' + COALESCE(LastName, ' ') AS CustomerFullName,
	Country,
	COALESCE(Score, 0) Customer_Score, 
	COUNT(*) OVER() AS TotalCustomers,
	COUNT(Score) OVER() TotalScores
FROM Sales.Customers;

---------------------------------------------------------------------------------------

SELECT 
	ProductID,
	OrderID,
	SUM(COALESCE(Sales, 0)) OVER(PARTITION BY ProductID) AS TotelSales
FROM Sales.Orders;


SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID ) AS TotalSalesforEachProduct
FROM Sales.Orders;

---------------------------------------------------------------------------------------

SELECT 
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	CONCAT(ROUND(CAST(Sales AS FLOAT) /SUM(Sales) OVER() * 100 , 2 ), '%') AS SalesPercentage
FROM Sales.Orders;

----------------------------------------------------------------------------------------

SELECT
	OrderID,
	ProductID,
	AVG(COALESCE(Sales, 0)) OVER(PARTITION BY ProductID) AS AverageSales
FROM Sales.Orders;

-----------------------------------------------------------------------------------------

SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	AVG(COALESCE(Sales, 0)) OVER() AS OverallAverageSales,
	AVG(COALESCE(Sales, 0)) OVER(PARTITION BY ProductID) AS AverageProdutSales
FROM Sales.Orders;

------------------------------------------------------------------------------------------


SELECT 
	CustomerID,
	COALESCE(LastName, 'Not Available') AS CustomerLastName,
	COALESCE(Score,0) AS CustomerScore,
	AVG(COALESCE(Score, 0)) OVER() AS CustomerAveargeScore
FROM Sales.Customers;

--------------------------------------------------------------------------------------------


SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(COALESCE(Sales, 0))OVER() AS OverAllMaximumSales,
	MIN(COALESCE(Sales, 0)) OVER() AS OverallMinimumSales,
	MAX(COALESCE(Sales, 0))OVER(PARTITION BY ProductID ) AS EachProductMaximumSales,
	MIN(COALESCE(Sales, 0)) OVER(PARTITION BY ProductID ) AS EachProductMinimumSales
FROM Sales.Orders
ORDER BY OrderDate;

-- Sub Query Execution
SELECT *
FROM (
SELECT *,
	MAX(Salary) OVER() AS HigestSalary
FROM Sales.Employees) T WHERE Salary = HigestSalary;



-- Running and Rolling Total in SQL Window Functions
SELECT 
    OrderID, 
	OrderDate,
	Sales,
	SUM(COALESCE(Sales, 0)) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS RollingTotal_ofSales,
	SUM(COALESCE(Sales, 0)) OVER(ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal_ofSales
FROM Sales.Orders;


--Find the Top higest Sales fro each Product TOP-N ANALYSIS
SELECT *
FROM (SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProductSales
FROM Sales.Orders) t 
WHERE RankByProductSales = 1;


-- Find the lowest 2 Customers based on their total Sales BOTTOM-N ANALYSIS
SELECT *
FROM
(SELECT 
	CustomerID,
	SUM(Sales) TotalCustomerSales,
ROW_NUMBER() OVER(ORDER BY SUM(Sales) )  RankingOfSales
FROM Sales.Orders
GROUP BY CustomerID)t
WHERE RankingOfSales <=2


-- Identify duplicate rows in the table 'Orders Archive' 
-- and return a clean result without any duplicates

SELECT * FROM
(SELECT 
	ROW_NUMBER() OVER(PARTITION BY OrderID ORDER BY CreationTime DESC ) rnk,
	*
FROM Sales.OrdersArchive)
t WHERE rnk = 1;


-- NTILE() -----------------------------------------------------------
SELECT 
OrderID, 
Sales,
NTILE(1) OVER(ORDER BY Sales DESC) OneBucket,
NTILE(2) OVER(ORDER BY Sales DESC) TwoBucket,
NTILE(3) OVER(ORDER BY Sales DESC) ThreeBucket,
NTILE(4) OVER(ORDER BY Sales DESC) FourBucket,
NTILE(5) OVER(ORDER BY Sales DESC) FiveBucket,
NTILE(6) OVER(ORDER BY Sales DESC) OneBucket
FROM Sales.Orders;


----------------------------------------------------------------------


SELECT *,
CASE WHEN Buckets = 1 THEN 'High'
     WHEN Buckets = 2 THEN 'Medium'
	 WHEN Buckets = 3 THEN 'Low'
END SalesSegmentations
FROM (
SELECT 
	OrderID, 
	Sales,
	NTILE(3) OVER(ORDER BY Sales DESC) AS Buckets
FROM Sales.Orders)t


------------------------------------------------------------------------------------

SELECT 
	*,
	CurrentMonthSales - PreviousMonthSales AS AscompairtoPreviousMonth,
 	CONCAT( ROUND( CAST( (CurrentMonthSales - PreviousMonthSales) AS FLOAT )/PreviousMonthSales * 100, 1) , '%') MoM_PercentageChanges,
	CurrentMonthSales - NextMonthSales AS AscompairtoNextMonth,
	CONCAT(ROUND(CAST((CurrentMonthSales - NextMonthSales) AS FLOAT)/ NextMOnthSales * 100, 1 ), '%' )AS MoMPercentageChangeSales
FROM(
	SELECT 
		FORMAT(OrderDate, 'MMMM') AS Monthoforder,
		MONTH(OrderDate) SalesMonth ,
		SUM(Sales) CurrentMonthSales,
		LAG(SUM(Sales), 1) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales,
		LEAD(SUM(Sales), 1) OVER(ORDER BY MONTH(OrderDate)) NextMonthSales
	FROM Sales.Orders
		GROUP BY MONTH(OrderDate), FORMAT(OrderDate, 'MMMM')
	)T

------------------------------------------------------------------------------------








-- Basic window Aggregates
--1. Show each customer with their score and the average score of all customers.
SELECT 
	CustomerID,
	FirstName + ' ' + COALESCE(LastName, ' ') AS CustomerFullName,
	COALESCE(Score,0) AS Score,
	AVG(COALESCE(Score,0)) OVER() AS AverageScore
FROM Sales.Customers;


--2. Display each country's customers and their average score per country using AVG() OVER(PARTITION BY Country).








-----------------------------------------------------------------------------
-- Sub-Query 
-- Find the Product Price whch is Grater Then the Average Price of All the Products
SELECT 
	*
FROM (
	SELECT 
	    ProductID,
		Product,
		Price,
		AVG(Price) OVER()  AveragePrice
	FROM Sales.Products)t
WHERE Price > AveragePrice;

-- Aproch-2 -----------------------------------------------------------------

SELECT ProductID, AVG(Price) AS AveragePrice
FROM Sales.Products
GROUP BY ProductID
HAVING AVG(Price) > (SELECT AVG(Price) FROM Sales.Products);


-----------------------------------------------------------------------------
-- Rank the Customers based on their total amount of sales

SELECT 
	*,
	RANK() OVER(ORDER BY TotalSalesToCustomer DESC) AS RankingOfCustomers
FROM (
	SELECT 
		CustomerID,
		SUM(Sales) TotalSalesToCustomer
	FROM Sales.Orders
	GROUP BY CustomerID
	) t


-----------------------------------------------------------------------------
-- SubQuery With SQL JOINS
--1. Show all customer details and find the total orders of each customer

SELECT 
	*
FROM Sales.Customers cst
LEFT JOIN (
SELECT 
	CustomerID,
	COUNT(*) AS TotalOrderOfEachCustomer
	FROM Sales.Orders
	GROUP BY CustomerID
)ord
ON cst.CustomerID = ord.CustomerID

-- Aproch 2

SELECT
	COUNT(*) OVER(PARTITION BY ord.CustomerID) AS TotalOrderOfEachCustomer,
	cst.*
FROM Sales.Orders ord
RIGHT JOIN 
Sales.Customers cst
ON cst.CustomerID = ord.CustomerID


SELECT * FROM Sales.Customers;
SELECT* FROM Sales.Orders;



-----------------------------------------------------------------------------------
-- Find the products that have a price higher than the average price of all products

SELECT 
	ProductID,
	Product,
	Price
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products);

-----------------------------------------------------------------------------
-- SubQuery with IN operator 
-- Show the details of orders made by customers in Germany.

SELECT 
	Ord.*,
	Cst.Country
FROM Sales.Orders AS Ord
INNER JOIN Sales.Customers Cst
ON Cst.CustomerID = Ord.CustomerID
WHERE Cst.Country  = 'Germany';

--2. 
SELECT * 
FROM Sales.Orders AS ord
WHERE ord.CustomerID 
IN (SELECT CustomerID FROM Sales.Customers WHERE Country = 'Germany');


-----------------------------------------------------------------------------
-- Find Female Employees Whose Salaries are greater than the salaries of any male employees


SELECT * FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ANY (SELECT Salary FROM Sales.Employees WHERE Gender = 'M')


-----------------------------------------------------------------------------
-- Find Female Employees Whose Salaries are greater than the salaries of all male employees

SELECT * FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ALL (SELECT Salary FROM Sales.Employees WHERE Gender = 'M');

-----------------------------------------------------------------------------

-- Show all customer detials and find the total orders of each customer



SELECT * FROM Sales.Customers








