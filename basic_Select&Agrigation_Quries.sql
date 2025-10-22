/*
-- 1. show all employees with all details
SELECT * FROM employees;

--2. show first name, last name, and salary of all employees
SELECT first_name, last_name, salary FROM employees;

--3. Display unique countries of employees
SELECT DISTINCT country FROM employees;
SELECT country FROM employees GROUP BY country;

--4. List all the departments without duplicates
SELECT DISTINCT department FROM employees;
SELECT department FROM employees GROUP BY department;

--5. Show employees who have NULL bonus
SELECT * FROM employees WHERE (bonus IS NULL); -- working properly 
SELECT * FROM employees WHERE (bonus = NULL); -- not working reson - ??

--6. Show employees who do not have bonus NULL
SELECT * FROM employees WHERE (bonus IS NOT NULL);

--7. List employees with salary = 0
SELECT * FROM employees WHERE salary = 0;

--8. Show only employees From India
SELECT * FROM employees WHERE country = 'India';

--9. Display employees whos country is NOT USA
SELECT * FROM employees WHERE (country != 'USA');

--10. Show all the employees who joined in 2020
SELECT * FROM employees WHERE YERA(join_date) = 2020;
SELECT * FROM employees WHERE (join_date BETWEEN '2020-01-01' AND '2020-12-31');

--11. Employees with salary grater than 60000
SELECT * FROM employees WHERE (salary > 60000);

--12. Employees with salary less than 50000
SELECT * FROM employees WHERE (salary < 50000);

--13. Employees whose bonus is grater than 5000
SELECT * FROM employees WHERE (bonus > 5000);

--14. Employees whose salary is between 50k and 80k
SELECT * FROM employees WHERE (salary BETWEEN 50000 AND 80000);

--15. Employees whose joining date is before 2020-01-01
SELECT * FROM employees WHERE (join_date < '2020-01-01');

--16. Employees whose joining date is after 2021-01-01
SELECT * FROM employees WHERE (join_date > '2021-01-01');

--17. Employees whose first name starts wiht 'A'
SELECT * FROM employees WHERE (first_name LIKE 'A%');

--18. Employees whose last name ends with 'a'
SELECT * FROM employees WHERE (last_name LIKE '%a');

--19. Employees whose country is either 'India' or 'USA'
SELECT * FROM employees WHERE (country = 'India' OR country = 'USA');
SELECT * FROM employees WHERE country IN ('India', 'USA');

-- 20 Employees whose country is not in ('India', 'USA')
SELECT * FROM employees WHERE (country != 'India' OR country != 'USA');
SELECT * FROM employees WHERE (country NOT IN ('India', 'USA'));

--21. Count total number of employees 
SELECT COUNT(*) AS employee_count FROM employees;

--22. Find average salary of employees
SELECT AVG(salary) AS average_salary FROM employees;

--23. Find Maximum Salary
SELECT MAX(salary) AS max_salary FROM employees;

--24. Find Minimym Salary 
SELECT MIN(salary) AS minimum_salary FROM employees;

--25. Find Total salary of all employees
SELECT SUM(salary) AS total_salary FROM  employees;

--26. Count how many employees are from india
SELECT COUNT(*) AS number_of_indian_employees FROM employees WHERE (country IN ('India'));

--27. Count how many employees have bonus NULL
SELECT COUNT(*) FROM employees WHERE (bonus IS NULL);
SELECT COUNT(CASE WHEN bonus IS NULL THEN 1 END) FROM employees;

--28. Count how many employees have salary = 0.
SELECT COUNT( CASE WHEN salary = 0 THEN 1 END) FROM employees;

--29. Find Average bonus (ignore NULL)
SELECT AVG(bonus) AS average_bonus FROM employees WHERE bonus IS NOT NULL;

--30. Find maximum bonus given 
SELECT MAX(bonus) AS max_bonus FROM employees;

--31. Count employees in each department.
SELECT department,COUNT(*) AS employe_count FROM employees GROUP BY department; 

--32.  Find the average salary per department
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department; 

--33. Find the maximum salary in each country.
SELECT country, MAX(salary) AS max_salary_in_country FROM employees GROUP BY country;

-- 34. Count employees country-wise.
SELECT country, COUNT(*) AS employes_in_country FROM employees GROUP BY country;

--35. Count employees who joined in each year
SELECT YEAR(join_date) AS joining_date, COUNT(*) AS total_employees FROM employees GROUP BY YEAR(join_date);

--36. Find total bonus per department
SELECT  department, SUM(bonus) AS total_bonus FROM employees GROUP BY department;

--37. Find Minimum Salary per department.
SELECT department, MIN(salary) AS minimum_salary FROM employees GROUP BY department;

--38. Count employees whose bonus is NULL per department.
SELECT department, COUNT(*) AS total_employees
FROM employees
WHERE bonus IS NULL
GROUP BY department;

--39. Find average salary for employees in Finsncs vs IT
SELECT department, AVG(salary) AS salary_in_IT_finance 
FROM employees
WHERE department IN ('Finance', 'IT')
GROUP BY department;

--40. Find Number of Employees in each country where salary > 50000.
SELECT country, COUNT(*) AS employee_count_earn_more_then_50k
FROM employees
WHERE salary > 50000
GROUP BY country;

--41. Show employees whose salary is above overall average salary
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

--42. Show employees whose bonus is less than average bonus
SELECT * FROM employees 
WHERE bonus < (SELECT AVG(bonus) FROM employees) WHERE bonus IS NOT NULL;

--43. Find employees who joined in February(any year).
SELECT * FROM employees WHERE MONTH(join_date)  = 2;

--44. Count employees whose first name has exactly 5 characters.
SELECT COUNT(*) AS average_count 
FROM employees 
WHERE LEN(first_name) = 5;

--45. Show employees with duplicate salaries
SELECT salary, COUNT(*) AS  cnt 
FROM employees 
GROUP BY salary 
HAVING COUNT(*) > 1;

46. Show employees with duplicate departments.
SELECT department, COUNT(*) AS cnt 
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

--47. Find department which has the highest average salary.


--48. Find country which has the maximum number of employees.


--49. Show employees with the earliest join date.


--50. Show employees with the latest join date.



--51 Find the average salary per Country
SELECT country, AVG(salary) AS avg_salary_country 
FROM employees 
GROUP BY country;

--52 Find the average salary of employees in each country
SELECT country, AVG(salary) AS countyr_wise_salary
FROM employees
WHERE salary > 50000
GROUP BY country;
*/

SELECT * FROM employees;
