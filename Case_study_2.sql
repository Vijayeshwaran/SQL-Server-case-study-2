-- Simple Queries:
-- 1. List all the employee details
SELECT * FROM EMPLOYEE;
-- 2. List all the department details. 
SELECT * FROM DEPARTMENT;
-- 3. List all job details. 
SELECT * FROM JOB;
-- 4. List all the locations. 
SELECT * FROM LOCATION;
-- 5. List out the First Name, Last Name, Salary, Commission for allEmployees. 
SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE;
-- 6. List out the Employee ID, Last Name, Department ID for all employees and Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id"
SELECT EMPLOYEE_ID AS [ID of the Employee], LAST_NAME AS [Name of the Employee], DEPARTMENT_ID AS Dep_id FROM EMPLOYEE;
-- 7. List out the annual salary of the employees with their names only.
SELECT (SALARY * 12) AS ANNUAL_SALARY, LAST_NAME FROM EMPLOYEE;
-- WHERE Condition
-- 1. List the details about "Smith". 
SELECT * FROM EMPLOYEE WHERE LAST_NAME = 'SMITH';
-- 2. List out the employees who are working in department 20. 
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 20;
-- 3. List out the employees who are earning salaries between 3000 and4500. 
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 3000 AND 4500;
-- 4. List out the employees who are working in department 10 or 20. 
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20;
-- 5. Find out the employees who are not working in department 10 or 30. 
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID != 10 AND DEPARTMENT_ID != 30;
-- 6. List out the employees whose name starts with 'S'.
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'S%';
-- 7. List out the employees whose name starts with 'S' and ends with 'H'. 
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'S%' AND LAST_NAME LIKE '%H';
-- 8. List out the employees whose name length is 4 and start with 'S'. 
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE '____' AND LAST_NAME LIKE 'S%';
-- 9. List out employees who are working in department 10 and draw salaries more than 3500.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 10 AND SALARY > 3500;
-- 10. List out the employees who are not receiving commission. 
SELECT * FROM EMPLOYEE WHERE COMM IS NULL;
-- ORDER BY Clause:
-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY EMPLOYEE_ID;
-- 2. List out the Employee ID and Name in descending order based onsalary. 
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY SALARY DESC;
-- 3. List out the employee details according to their Last Name in ascending-order. 
SELECT * FROM EMPLOYEE ORDER BY LAST_NAME;
-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT * FROM EMPLOYEE ORDER BY LAST_NAME, DEPARTMENT_ID DESC;
-- GROUP BY and HAVING Clause:
-- 1. How many employees are in different departments in theorganization?
SELECT DEPARTMENT_ID, COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY DEPARTMENT_ID;
-- 2. List out the department wise maximum salary, minimum salary and average salary of the employees.
SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE GROUP BY DEPARTMENT_ID;
-- 3. List out the job wise maximum salary, minimum salary and average salary of the employees.
SELECT JOB_ID, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE GROUP BY JOB_ID;
-- 4. List out the number of employees who joined each month in ascendingorder.
SELECT MONTH(HIRE_DATE) AS MONTH_OF_JOINING, COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE) ORDER BY MONTH_OF_JOINING;
-- 5. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT MONTH(HIRE_DATE) AS MONTH, YEAR(HIRE_DATE) AS YEAR, COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE), YEAR(HIRE_DATE) ORDER BY MONTH(HIRE_DATE), YEAR(HIRE_DATE);
-- 6. List out the Department ID having at least four employees. 
SELECT DEPARTMENT_ID FROM EMPLOYEE GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID) >= 4;
-- 7. How many employees joined in the month of January?
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE) HAVING MONTH(HIRE_DATE) = 1;
-- 8. How many employees joined in the month of January orSeptember
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE) HAVING MONTH(HIRE_DATE) = 1 OR MONTH(HIRE_DATE) = 9;
-- 9. How many employees joined in 1985?
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY YEAR(HIRE_DATE) HAVING YEAR(HIRE_DATE) = 1985;
-- 10. How many employees joined each month in 1985?
SELECT MONTH(HIRE_DATE) AS MONTH, COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE), YEAR(HIRE_DATE) HAVING YEAR(HIRE_DATE) = 1985;
-- 11. How many employees joined in March 1985?
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE), YEAR(HIRE_DATE) HAVING MONTH(HIRE_DATE) = 3 AND YEAR(HIRE_DATE) = 1985;
-- 12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT Department_ID FROM Employee WHERE YEAR(Hire_Date)=1985 AND MONTH(Hire_Date)=4
GROUP BY Department_ID HAVING COUNT(Employee_ID)>=3;
-- Joins:
-- 1. List out employees with their department names. 
SELECT e.LAST_NAME, d.Name FROM EMPLOYEE e JOIN DEPARTMENT d ON d.Department_Id = e.DEPARTMENT_ID;
-- 2. Display employees with their designations. 
SELECT e.LAST_NAME, j.DESIGNATION FROM EMPLOYEE e JOIN JOB j ON e.JOB_ID = j.JOB_ID;
-- 3. Display the employees with their department names and regional groups. 
SELECT e.LAST_NAME, d.Name, l.City FROM EMPLOYEE e JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id 
JOIN LOCATION l ON l.Location_ID = d.Location_Id;
-- 4. How many employees are working in different departments? Display with department names. 
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE, d.Name FROM EMPLOYEE e JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
GROUP BY e.DEPARTMENT_ID, d.Name;
-- 5. How many employees are working in the sales department?
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE_IN_SALES FROM EMPLOYEE e JOIN DEPARTMENT d 
ON e.DEPARTMENT_ID = d.Department_Id
GROUP BY d.Name HAVING d.Name = 'Sales';
-- 6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.
SELECT d.Name FROM DEPARTMENT d JOIN EMPLOYEE e ON d.Department_Id = e.DEPARTMENT_ID
WHERE e.EMPLOYEE_ID >= 5
GROUP BY e.DEPARTMENT_ID, d.Name ORDER BY d.Name;
-- 7. How many jobs are there in the organization? Display with designations. 
SELECT E.*, Designation FROM (SELECT Job_ID,COUNT(*) AS EMPCNT FROM Employee GROUP BY Job_ID)AS E
INNER JOIN Job AS J ON E.Job_ID=J.Job_ID;
-- 8. How many employees are working in "New York"?
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE_OF_NEW_YORK FROM EMPLOYEE e JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
JOIN LOCATION l ON d.Location_Id = l.Location_ID
WHERE l.City = 'New york';
-- 9. Display the employee details with salary grades. Use conditional statementto create a grade column.
SELECT *, (SELECT CASE WHEN SALARY >= 2000 THEN 'A' WHEN SALARY BETWEEN 1000 AND 2000 THEN 'B' ELSE 'C' END) AS GRADE
FROM EMPLOYEE;
-- 10. List out the number of employees grade wise. Use conditional statementto create a grade column.
SELECT GRADE, COUNT(*) AS NUMBER_OF_EMPLOYEE FROM
(SELECT *, (SELECT CASE WHEN SALARY >= 2000 THEN 'A' WHEN SALARY BETWEEN 1000 AND 2000 THEN 'B' ELSE 'C' END) AS GRADE
FROM EMPLOYEE) t GROUP BY GRADE;
-- 11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
SELECT GRADE FROM
(SELECT *, (SELECT CASE WHEN SALARY >= 2000 THEN 'A' WHEN SALARY BETWEEN 1000 AND 2000 THEN 'B' ELSE 'C' END) AS GRADE
FROM EMPLOYEE) t
SELECT COUNT(*) FROM EMPLOYEE WHERE SALARY BETWEEN 2000 AND 5000;
-- 12. Display all employees in sales or operation departments
SELECT e.LAST_NAME FROM EMPLOYEE e JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
WHERE d.Name = 'Sales' OR d.Name = 'Operations';
-- SET Operators:
-- 1. List out the distinct jobs in sales and accounting departments. 
SELECT DISTINCT Job_ID FROM Employee AS E
INNER JOIN Department AS D ON E.Department_ID=D.Department_ID
WHERE Name IN ('Sales','Accounting');
-- 2. List out all the jobs in sales and accounting departments. 
SELECT Job_ID FROM Employee AS E
INNER JOIN Department AS D ON E.Department_ID=D.Department_ID
WHERE Name IN ('Sales','Accounting');
-- 3. List out the common jobs in research and accounting departments
SELECT Job_ID FROM Employee AS E
INNER JOIN Department AS D ON E.Department_ID=D.Department_ID
WHERE Name = 'Accounting' AND Name = 'Research';
-- Subqueries:
-- 1. Display the employees list who got the maximum salary.
SELECT * FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);
-- 2. Display the employees who are working in the sales department. 
SELECT LAST_NAME FROM EMPLOYEE WHERE DEPARTMENT_ID = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales')
-- 3. Display the employees who are working as 'Clerk'. 
SELECT LAST_NAME FROM EMPLOYEE WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE DESIGNATION = 'clerk');
-- 4. Display the list of employees who are living in "New York". 
SELECT LAST_NAME FROM EMPLOYEE WHERE DEPARTMENT_ID = 
(SELECT Department_Id FROM DEPARTMENT WHERE Location_Id = 
(SELECT Location_ID FROM LOCATION WHERE City = 'New York'));
-- 5. Find out the number of employees working in the sales department. 
SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE WHERE DEPARTMENT_ID = 
(SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');
-- 6. Update the salaries of employees who are working as clerks on the basis of 10%. 
UPDATE EMPLOYEE SET SALARY = SALARY + (SALARY / 10) 
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE DESIGNATION = 'Clerk');
-- 7. Delete the employees who are working in the accounting department. 
DELETE EMPLOYEE WHERE DEPARTMENT_ID = 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE Name = 'Accounting');
-- 8. Display the second highest salary drawing employee details. 
SELECT TOP 1 LAST_NAME AS SECOND_HIGHEST_SALARY  FROM 
(SELECT TOP 2 LAST_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)t ORDER BY SALARY;
-- 9. Display the nth highest salary drawing employee details. 
CREATE FUNCTION N_SAL (@N_POS INT)
RETURNS TABLE
AS 
RETURN 
	(SELECT * FROM (SELECT *, RANK() OVER (ORDER BY Salary DESC) AS R FROM Employee) AS RT WHERE R = @N_POS);
SELECT * FROM dbo.N_SAL(5)
-- 10. List out the employees who earn more than every employee in department 30. 
SELECT LAST_NAME FROM EMPLOYEE WHERE SALARY >
(SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = 30);
-- 11. List out the employees who earn more than the lowest salary in department.Find out whose department has no employees. 
SELECT * FROM Employee WHERE Salary > 
(SELECT MIN(Salary) FROM Employee WHERE Department_ID=30 GROUP BY Department_ID)
-- 12. Find out which department has no employees. 
SELECT Name FROM DEPARTMENT WHERE DEPARTMENT_ID NOT IN
(SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEE);
-- 13. Find out the employees who earn greater than the average salary for their department.
SELECT * FROM Employee AS Emp INNER JOIN 
(SELECT Department_ID, AVG(Salary) AS AvgSal FROM Employee GROUP BY Department_ID) AS ASD
ON Emp.Department_ID=ASD.Department_ID
WHERE Salary >= AvgSal;