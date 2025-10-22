/* SELECT * FROM dbo.customers WHERE (country IN ('Germany', 'UK', 'USA' )); 
INSERT INTO dbo.customers  VALUES (6 , 'Aayush', 'India', 960);

SELECT * FROM dbo.customers WHERE ((first_name = 'Maria' AND country = 'Germany') OR  (first_name = 'Aayush' AND country = 'India')); 

SELECT * FROM dbo.customers WHERE (country = 'Germany'); 

SELECT first_name, score FROM dbo.customers ORDER BY  first_name DESC; 

SELECT first_name, score FROM dbo.customers ORDER BY  scpre DESC; 

SELECT * FROM dbo.customers WHERE (score > 400);

SELECT * FROM dbo.orders WHERE (order_date > '2021-04-01');

SELECT country, first_name FROM dbo.customers WHERE (id = 3);  


SELECT AVG(score) AS avg_score FROM customers WHERE country = 'India';  

SELECT MAX(sales) AS maximum_sales FROM dbo.orders;  
SELECT * FROM customers; 

SELECT COUNT(*) AS total_orders FROM orders WHERE customer_id = 1; 

SELECT * FROM customers WHERE (score BETWEEN 300 AND 800); 

SELECT * FROM customers WHERE (score >= 300 AND score <= 800); */

