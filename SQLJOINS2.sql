-- JOIN Practice
/*

-- 1. Example of NO JOIN
SELECT * FROM customers;
SELECT  * FROM orders;


-- 2.  Example of INNER JOIN

SELECT 
	 customers.id,
	 customers.first_name,
	 customers.country,
	 orders.order_id,
	 orders.order_date,
	 orders.sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;


-- 3. Example of RIGHT JOIN

SELECT 
	 customers.id,
	 customers.first_name,
	 customers.country,
	 orders.order_id,
	 orders.order_date,
	 orders.sales
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;



-- 4. Example of LEFT JOIN

SELECT 
	 customers.id,
	 customers.first_name,
	 customers.country,
	 orders.order_id,
	 orders.order_date,
	 orders.sales
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;




-- 5.  Example of FULL JOIN

SELECT 
	customers.id,
	customers.first_name,
	customers.country,
	orders.order_id,
	orders.order_date,
	orders.sales
FROM customers
FULL JOIN orders
ON customers.id = orders.customer_id;



-- Example of LEFT ANTI JOIN 
SELECT * 
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
WHERE orders.order_id IS NULL;



-- Example of RIGHT ANTI JOIN 

SELECT * 
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id
WHERE customers.id IS NULL;



-- Example of  FULL ANTI JOIN

SELECT * 
FROM customers 
FULL JOIN orders
ON customers.id = orders.customer_id
WHERE customers.id IS NULL OR orders.customer_id IS NULL;


-- Example of  whithout Using INNER JOIN 

SELECT * 
FROM customers 
LEFT JOIN orders
ON customers.id = orders.customer_id
WHERE orders.customer_id IS NOT NULL;


-- Example of CROSS JOIN

SELECT * 
FROM customers 
CROSS JOIN orders;




SELECT * FROM customers;
SELECT  * FROM orders;

*/



SELECT 
    od.OrderID,
	Sales.Customers.FirstName,
	Sales.Products.Product,
	od.Sales,
	Sales.Products.Price,
	Sales.Employees.FirstName
FROM Sales.Orders as od

SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Employees;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive;
SELECT * FROM Sales.Products;













