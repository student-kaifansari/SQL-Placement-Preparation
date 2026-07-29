-- ============================================================
-- FOREIGN KEY PRACTICE SET
-- ============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- ============================================================
-- Q1
-- Create Departments Table
-- ============================================================

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Answer

DESC departments;

-- ============================================================
-- Q2
-- Insert Departments
-- ============================================================

INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Sales'),
(4,'Finance');

-- Answer

SELECT * FROM departments;

-- ============================================================
-- Q3
-- Create Employees Table with FOREIGN KEY
-- ============================================================

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
);

-- Answer

DESC employees;

-- ============================================================
-- Q4
-- Insert Valid Employees
-- ============================================================

INSERT INTO employees VALUES
(101,'Aman',50000,1),
(102,'Kaif',35000,2),
(103,'Sara',65000,1),
(104,'Ali',45000,3);

-- Answer

SELECT * FROM employees;

-- ============================================================
-- Q5
-- Try inserting employee with invalid department.
-- ============================================================

INSERT INTO employees VALUES
(105,'Rahul',40000,8);

-- Answer

-- ERROR
-- Cannot add or update a child row:
-- a foreign key constraint fails

-- ============================================================
-- Q6
-- Display employee name with department name.
-- ============================================================

SELECT
e.emp_id,
e.name,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id;

-- ============================================================
-- Q7
-- Find employees working in HR department.
-- ============================================================

SELECT
e.emp_id,
e.name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
WHERE d.dept_name='HR';

-- ============================================================
-- Q8
-- Count employees department wise.
-- ============================================================

SELECT
d.dept_name,
COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id=e.dept_id
GROUP BY d.dept_name;

-- ============================================================
-- Q9
-- Find departments having no employees.
-- ============================================================

SELECT
d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id=e.dept_id
WHERE e.emp_id IS NULL;

-- ============================================================
-- Q10
-- Try deleting department 1.
-- ============================================================

DELETE FROM departments
WHERE dept_id=1;

-- Answer

-- ERROR
-- Cannot delete or update a parent row:
-- a foreign key constraint fails

-- ============================================================
-- Q11
-- Find highest salary employee with department name.
-- ============================================================

SELECT
e.name,
e.salary,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
ORDER BY salary DESC
LIMIT 1;

-- ============================================================
-- Q12
-- Find average salary department wise.
-- ============================================================

SELECT
d.dept_name,
AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employees e
ON d.dept_id=e.dept_id
GROUP BY d.dept_name;

-- ============================================================
-- Q13
-- Find employees earning more than 45000.
-- ============================================================

SELECT
e.name,
e.salary,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
WHERE salary>45000;

-- ============================================================
-- Q14
-- Find total salary department wise.
-- ============================================================

SELECT
d.dept_name,
SUM(e.salary) AS total_salary
FROM departments d
INNER JOIN employees e
ON d.dept_id=e.dept_id
GROUP BY d.dept_name;

-- ============================================================
-- Q15
-- Find department having maximum employees.
-- ============================================================

SELECT
d.dept_name,
COUNT(*) AS total
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
ORDER BY total DESC
LIMIT 1;

-- ============================================================
-- Q16
-- Find employees whose department is IT or HR.
-- ============================================================

SELECT
e.name,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
WHERE d.dept_name IN ('IT','HR');

-- ============================================================
-- Q17
-- Find departments where average salary > 45000.
-- ============================================================

SELECT
d.dept_name,
AVG(e.salary) AS avg_salary
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary)>45000;

-- ============================================================
-- Q18
-- Find employees sorted by department then salary descending.
-- ============================================================

SELECT
e.name,
e.salary,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
ORDER BY d.dept_name,e.salary DESC;

-- ============================================================
-- Q19
-- Count employees in every department including departments
-- with zero employees.
-- ============================================================

SELECT
d.dept_name,
COUNT(e.emp_id) AS total
FROM departments d
LEFT JOIN employees e
ON d.dept_id=e.dept_id
GROUP BY d.dept_name;

-- ============================================================
-- Q20
-- Display all employee details with department names.
-- ============================================================

SELECT
e.*,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id;