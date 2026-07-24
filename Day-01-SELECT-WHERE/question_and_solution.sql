-- ===========================================================
-- Day 01 : SELECT & WHERE
-- Difficulty : Easy
-- ===========================================================

-- Q1 Display all columns from the Employee table.

SELECT *
FROM Employee;

-- ===========================================================

-- Q2 Display only name and salary.

SELECT name, salary
FROM Employee;

-- ===========================================================

-- Q3 Display name, department and city.

SELECT name, department, city
FROM Employee;


-- ===========================================================

-- Q4 Display employees whose salary is greater than 50000.

SELECT *
FROM Employee
WHERE salary > 50000;

-- ===========================================================

-- Q5 Display employees belonging to the IT department.

SELECT *
FROM Employee
WHERE department = 'IT';

-- ===========================================================

-- Q6 Display employees whose age is less than 28.

SELECT *
FROM Employee
WHERE age < 28;

-- ===========================================================

-- Q7 Display employees from Delhi.

SELECT *
FROM Employee
WHERE city = 'Delhi';

-- ===========================================================

-- Q8 Display employees whose salary is between 40000 and 70000.

SELECT *
FROM Employee
WHERE salary BETWEEN 40000 AND 70000;

-- ===========================================================

-- Q9 Display employees whose department is HR or Sales.

SELECT *
FROM Employee
WHERE department = 'HR'
OR department = 'Sales';

-- ===========================================================

-- Q10 Display employees whose city is Delhi and salary is greater than 45000.

SELECT *
FROM Employee
WHERE city = 'Delhi'
AND salary > 45000;

-- ===========================================================

-- Q11 Display employees whose age is between 24 and 30.

SELECT *
FROM Employee
WHERE age BETWEEN 24 AND 30;

-- ===========================================================

-- Q12 Display employees whose department is IT or Finance.

SELECT *
FROM Employee
WHERE department IN ('IT','Finance');

-- ===========================================================

-- Q13 Display employees whose city is not Delhi.

SELECT *
FROM Employee
WHERE city != 'Delhi';

-- ===========================================================

-- Q14 Display employees whose salary is not between 40000 and 70000.

SELECT *
FROM Employee
WHERE salary NOT BETWEEN 40000 AND 70000;

-- ===========================================================

-- Q15 Display employees whose department is IT or HR.

SELECT *
FROM Employee
WHERE department IN ('IT','HR');

-- ===========================================================

-- Q16 Display employees whose department is not Sales or Finance.

SELECT *
FROM Employee
WHERE department NOT IN ('Sales','Finance');

-- ===========================================================