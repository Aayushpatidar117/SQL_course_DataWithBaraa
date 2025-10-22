/*

SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive;
SELECT * FROM Sales.Employees;
SELECT * FROM Sales.Products;


--1. List all customers and their orders(CustomerID, FirstName, OrderID, OrderDate)
SELECT 
	sc.CustomerID,
	sc.FirstName,
	so.OrderID,
	so.OrderDate
FROM Sales.Customers AS sc
INNER JOIN Sales.Orders AS so
ON so.CustomerID = sc.CustomerID;



--2.  Get all orders wiht product names (OrderID, Product, Quality).
SELECT 
	Sales.Orders.OrderID,
	Sales.Products.Product,
	Sales.Orders.Quantity
FROM Sales.Orders
INNER JOIN Sales.Products
ON Sales.Products.ProductID = Sales.Orders.ProductID;



--3. Find employeesand their orders(EmployeeId, FirstName, Quantity)
SELECT 
	Sales.Employees.EmployeeID,
	Sales.Employees.FirstName,
	Sales.Orders.OrderID
FROM Sales.Employees
INNER JOIN Sales.Orders
ON Sales.Employees.EmployeeID = Sales.Orders.SalesPersonID;




--4. Show orders wiht customer full name and product name.
SELECT 
	ord.OrderID,
	CONCAT(cust.FirstName, ' ', cust.LastName) AS Customer_Name,
	prd.Product,
	CONCAT('$', prd.Price)
FROM 
	Sales.Orders AS ord
INNER JOIN Sales.Customers AS cust
ON ord.CustomerID = cust.CustomerID
INNER JOIN Sales.Products AS prd
ON ord.ProductID = prd.ProductID;


--5. Retrive all orders with salesperosn(employee) details.
SELECT 
	ord.OrderID,
	ord.OrderDate,
	emp.EmployeeID,
	CONCAT(emp.FirstName, ' ' , emp.LastName) AS Employee_Name,
	emp.Department
FROM Sales.Orders AS ord
INNER JOIN Sales.Employees AS emp
ON ord.SalesPersonID = emp.EmployeeID;




--6. List all customers and their orders (even those who never ordered).
SELECT 
	cust.CustomerID,
	CONCAT(cust.FirstName, ' ', cust.LastName) AS Customer_Name,
	ord.OrderID
FROM Sales.Customers AS cust
LEFT JOIN Sales.Orders AS ord
ON cust.CustomerID = ord.OrderID;




--7. Show all emploeeys and orders they handled (include employees with no sales)
SELECT 
	emp.EmployeeID,
	CONCAT(emp.FirstName, ' ', emp.LastName) AS Employee_Name,
	ord.OrderID,
	ord.OrderDate
FROM Sales.Employees AS emp
LEFT JOIN Sales.Orders AS ord
ON ord.SalesPersonID = emp.EmployeeID;




--8. List all products and orders placed for them (include products never ordered).
SELECT 
	prd.ProductID,
	prd.Product,
	CONCAT('$',prd.Price) AS Product_Price,
	ord.OrderID,
	ord.Quantity,
	ord.OrderDate
FROM Sales.Products AS prd
LEFT JOIN Sales.Orders AS ord
ON prd.ProductID = ord.ProductID



--9. Find customers with no orders.
SELECT 
	cst.CustomerID,
	CONCAT(cst.FirstName, ' ', cst.LastName) AS Customer_Name,
	ord.OrderID
FROM Sales.Customers AS cst
LEFT JOIN Sales.Orders AS ord
ON cst.CustomerID = ord.CustomerID
WHERE ord.OrderID IS NULL;




--10. Get employees who never handled an order.
SELECT 
	emp.EmployeeID,
	CONCAT(emp.FirstName, ' ', emp.LastName) AS Employee_Name,
	emp.Department,
	ord.OrderID
FROM Sales.Employees AS emp
LEFT JOIN Sales.Orders AS ord
ON emp.EmployeeID = ord.SalesPersonID
WHERE ord.SalesPersonID IS NULL;



--11. Show all orders and their related customers (include orders with no valid customer).
SELECT	
	ord.OrderID,
	ord.Quantity,
	cst.CustomerID,
	CONCAT(cst.FirstName, ' ', cst.LastName) AS Customer_Name
FROM Sales.Orders AS ord
RIGHT JOIN Sales.Customers AS cst
ON ord.CustomerID = cst.CustomerID;




--12. Get all products and their orders (includ orders with invalid produt rerences).
SELECT 
	ord.OrderID,
	ord.Quantity,
	ord.OrderDate,
	prd.ProductID,
	prd.Product,
	CONCAT('$',prd.Price) AS Product_Price,
	prd.Category
FROM Sales.Orders AS ord
LEFT JOIN Sales.Products AS prd
ON ord.ProductID = prd.ProductID;




--13. Retrive all employees and their sales orders (include orders with no employee).
SELECT 
	emp.EmployeeID,
	CONCAT(emp.FirstName, ' ', emp.LastName)Employee_Name,
	emp.Department,
	emp.Department,
	ord.OrderID,
	ord.Quantity,
	ord.ProductID
FROM Sales.Employees AS emp
RIGHT JOIN Sales.Orders AS ord
ON ord.SalesPersonID = emp.EmployeeID;




--14. Show all customers and orders (include orphan orders).
SELECT 
	cst.CustomerID,
	CONCAT(cst.FirstName, ' ', LastName),
	cst.Country,
	ord.OrderID,
	ord.Quantity
FROM Sales.Customers AS cst
RIGHT JOIN Sales.Orders AS ord
ON ord.CustomerID = cst.CustomerID;






--15. List all products with cutomers who ordered them (include products without customers).
SELECT 
	ord.OrderID,
	ord.CustomerID,
	CONCAT(cst.FirstName,' ', cst.LastName) AS Customer_Name,
	prd.Product,
	CONCAT('$',prd.Price) AS Product_Price,
	prd.Category
FROM Sales.Orders AS ord
RIGHT JOIN Sales.Customers AS cst
ON ord.CustomerID = cst.CustomerID
RIGHT JOIN Sales.Products AS prd
ON ord.ProductID = prd.ProductID;





--16. Get all customers and orders (include customers without orders and orders without customers)
SELECT 
	cst.CustomerID,
	CONCAT(cst.FirstName, ' ', cst.LastName) AS Customer_Name,
	ord.OrderID,
	ord.Quantity
FROM Sales.Customers AS cst
FULL JOIN Sales.Orders AS ord
ON cst.CustomerID = ord.CustomerID;




--17. Show all employees and orders (include unassigned orders & employees without orders).
SELECT 
	emp.EmployeeID,
	CONCAT(emp.FirstName, ' ' , emp.LastName) AS Employee_Name,
	ord.OrderID,
	ord.OrderStatus	
FROM Sales.employees AS emp
FULL JOIN Sales.Orders AS ord
ON ord.SalesPersonID = emp.EmployeeID;



--18. List all products and orders (include products without orders and invalid product references).
SELECT 
	prd.ProductID,
	prd.Product,
	CONCAT('$',prd.Price) AS Product_Price,
	ord.OrderID,
	ord.Quantity
FROM Sales.Products AS prd
FULL JOIN Sales.Orders AS ord
ON prd.ProductID = ord.ProductID;



--19. Compare Customers vs Employees by country (include mismatches).
??????????????



--20. List all customers IDs from Customers and Orders (include those present in only one side).
??????????????????????????



--21. Generate all possible combinations of customers and products.
?????????????????????



--22. Create all possible employee-department pairs (use Employees table).

*/









