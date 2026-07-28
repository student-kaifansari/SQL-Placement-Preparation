-- ===========================================
-- Correlated Subquery Practice Set-1
-- Answers
-- ===========================================

-- Q1
-- Find employees whose salary is greater than the average salary
-- of their own department.

SELECT *
FROM employees_table e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q2
-- Find employees whose salary is less than the average salary
-- of their own department.

SELECT *
FROM employees_table e1
WHERE salary <
(
    SELECT AVG(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q3
-- Find employees who have the highest salary in their department.

SELECT *
FROM employees_table e1
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q4
-- Find employees who have the lowest salary in their department.

SELECT *
FROM employees_table e1
WHERE salary =
(
    SELECT MIN(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q5
-- Find employees who are older than the average age
-- of their own department.

SELECT *
FROM employees_table e1
WHERE age >
(
    SELECT AVG(age)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q6
-- Find employees who are younger than the average age
-- of their own department.

SELECT *
FROM employees_table e1
WHERE age <
(
    SELECT AVG(age)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q7
-- Find employees whose salary is equal to the maximum salary
-- of their department.

SELECT *
FROM employees_table e1
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q8
-- Find employees whose salary is equal to the minimum salary
-- of their department.

SELECT *
FROM employees_table e1
WHERE salary =
(
    SELECT MIN(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q9
-- Find employees whose salary is greater than
-- every other employee in the same department.

SELECT *
FROM employees_table e1
WHERE salary >= ALL
(
    SELECT salary
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q10
-- Find employees whose age is greater than
-- every other employee in the same department.

SELECT *
FROM employees_table e1
WHERE age >= ALL
(
    SELECT age
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q11
-- Find the second highest salary in each department.

SELECT *
FROM employees_table e1
WHERE 1 =
(
    SELECT COUNT(DISTINCT salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
      AND e2.salary > e1.salary
);

-- ------------------------------------------------------------

-- Q12
-- Find employees whose salary is above the department average
-- and whose age is also above the department average.

SELECT *
FROM employees_table e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
)
AND age >
(
    SELECT AVG(age)
    FROM employees_table e3
    WHERE e3.department = e1.department
);

-- ------------------------------------------------------------

-- Q13
-- Find employees who earn more than their department manager.

SELECT *
FROM employees_table e1
WHERE salary >
(
    SELECT e2.salary
    FROM employees_table e2
    JOIN departments_table d
      ON e2.emp_name = d.manager
    WHERE d.dept_name = e1.department
);

-- ------------------------------------------------------------

-- Q14
-- Find employees who are the youngest employee
-- in their department.

SELECT *
FROM employees_table e1
WHERE age =
(
    SELECT MIN(age)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

-- ------------------------------------------------------------

-- Q15
-- Find employees whose salary is higher than at least
-- two employees in the same department.

SELECT *
FROM employees_table e1
WHERE 2 <=
(
    SELECT COUNT(*)
    FROM employees_table e2
    WHERE e2.department = e1.department
      AND e2.salary < e1.salary
);