-- Q1
-- Display employee name and department name using FULL OUTER JOIN in MySQL.
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
-- Q2
-- Display all employees and all departments.
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q3
-- Display employees without departments and departments without employees.
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL

UNION

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- Q4
-- Count total unmatched rows.
SELECT COUNT(*) AS total_unmatched
FROM
(
    SELECT e.emp_id
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id
    WHERE d.dept_id IS NULL

    UNION

    SELECT d.dept_id
    FROM employees e
    RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
    WHERE e.emp_id IS NULL
) AS unmatched;
-- Q5
-- Display all columns using FULL OUTER JOIN.
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q6
-- Display only unmatched employees.
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
-- Q7
-- Display only unmatched departments.
SELECT d.*
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- Q8
-- Display employee names and department names in alphabetical order.
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id

ORDER BY emp_name, dept_name;

-- Q9
-- Explain why UNION is used instead of UNION ALL.
-- Answer

-- LEFT JOIN aur RIGHT JOIN dono me matching rows common hoti hain.

-- Agar hum UNION ALL use karenge to ye common rows do baar aa jayengi.

-- Example:

-- Aman - IT
-- Aman - IT
-- Sara - IT
-- Sara - IT

-- UNION duplicate rows ko remove kar deta hai, isliye FULL OUTER JOIN simulate karte waqt UNION use karte hain.

-- Q10
-- Write the complete MySQL query to simulate FULL OUTER JOIN.

SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;