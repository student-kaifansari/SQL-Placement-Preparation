-- ===========================================================
-- Day 02 : ORDER BY
-- Difficulty : Easy
-- ===========================================================

-- Q1 Display all employees in ascending order of salary.

SELECT *
FROM Employee
ORDER BY salary ASC;

-- ===========================================================

-- Q2 Display all employees in descending order of salary.

SELECT *
FROM Employee
ORDER BY salary DESC;

-- ===========================================================

-- Q3 Display employee names in alphabetical order.

SELECT *
FROM Employee
ORDER BY name ASC;

-- ===========================================================

-- Q4 Display employees by age in descending order.

SELECT *
FROM Employee
ORDER BY age DESC;

-- ===========================================================

-- Q5 Display employees first by city (A-Z) and then by salary (High to Low).

SELECT *
FROM Employee
ORDER BY city ASC, salary DESC;

-- ===========================================================

-- Q6 Display employees first by department and then by age.

SELECT *
FROM Employee
ORDER BY department ASC, age ASC;

-- ===========================================================

-- Q7 Display only name and salary in descending order of salary.

SELECT name, salary
FROM Employee
ORDER BY salary DESC;

-- ===========================================================

-- Q8 Display employees ordered by gender and then by name.

SELECT *
FROM Employee
ORDER BY gender ASC, name ASC;

-- ===========================================================

-- Q9 Display employees ordered by city in descending order.

SELECT *
FROM Employee
ORDER BY city DESC;

-- ===========================================================

-- Q10 Display employees ordered by department and salary.

SELECT *
FROM Employee
ORDER BY department ASC, salary DESC;

-- ===========================================================