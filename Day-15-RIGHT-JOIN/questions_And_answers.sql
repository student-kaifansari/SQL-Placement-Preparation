-- Q1
-- Display employee name and department name using RIGHT JOIN.
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
-- Q2
-- Display all departments even if they don't have employees.
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
-- Q3
-- Display department name and employee salary.
SELECT d.dept_name, e.salary
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
-- Q4
-- Display only departments that have no employees.
SELECT d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- Q5
-- Display department ID, department name and employee name.
SELECT d.dept_id,
       d.dept_name,
       e.emp_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q6
-- Display all columns using RIGHT JOIN.
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q7
-- Display employees working in the IT department using RIGHT JOIN.
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- Q8
-- Display departments whose employee name is NULL.
SELECT d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_name IS NULL;

-- Q9
-- Count departments that have no employees.
SELECT COUNT(*) AS no_employee_department
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- Q10
-- Display department names in alphabetical order using RIGHT JOIN.
SELECT d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY d.dept_name;