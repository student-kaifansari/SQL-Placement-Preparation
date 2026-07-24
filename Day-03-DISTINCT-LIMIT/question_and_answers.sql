-- ===========================================================
-- Day 03 : DISTINCT & LIMIT
-- Difficulty : Easy
-- ===========================================================

-- Q1 Display all unique departments.

SELECT DISTINCT department
FROM Employee;

-- ===========================================================

-- Q2 Display all unique cities.

SELECT DISTINCT city
FROM Employee;

-- ===========================================================

-- Q3 Display all unique genders.

SELECT DISTINCT gender
FROM Employee;

-- ===========================================================

-- Q4 Display the first 3 employees.

SELECT *
FROM Employee
LIMIT 3;

-- ===========================================================

-- Q5 Display the top 5 employees.

SELECT *
FROM Employee
LIMIT 5;

-- ===========================================================

-- Q6 Display the employee with the highest salary.

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1;

-- ===========================================================

-- Q7 Display the employee with the lowest salary.

SELECT *
FROM Employee
ORDER BY salary ASC
LIMIT 1;

-- ===========================================================

-- Q8 Display the top 3 highest-paid employees.

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;

-- ===========================================================

-- Q9 Display the second highest-paid employee.

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- ===========================================================

-- Q10 Display the third highest-paid employee.

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- ===========================================================

-- Q11 Display the first 2 employees after skipping the first 3 employees.

SELECT *
FROM Employee
LIMIT 2 OFFSET 3;

-- ===========================================================

-- Q12 Display the second highest unique salary.

SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- ===========================================================