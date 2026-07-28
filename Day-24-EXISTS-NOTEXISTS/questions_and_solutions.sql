-- ===========================================
-- EXISTS & NOT EXISTS
-- Practice Set-1 (Answers)
-- ===========================================
INSERT INTO employees_table VALUES
(101,'Aman',25,'Male','IT',50000,'Delhi'),
(102,'Kaif',22,'Male','HR',35000,'Noida'),
(103,'Sara',28,'Female','IT',65000,'Delhi'),
(104,'Ali',30,'Male','Sales',45000,'Lucknow'),
(105,'Riya',26,'Female','HR',40000,'Noida'),
(106,'Rahul',29,'Male','IT',70000,'Mumbai'),
(107,'Neha',24,'Female','Sales',42000,'Delhi'),
(108,'Arjun',31,'Male','Finance',80000,'Pune'),
(109,'Priya',27,'Female','Finance',75000,'Pune'),
(110,'Rohit',32,'Male','Sales',48000,'Mumbai'),
(111,'Ankit',24,'Male','IT',55000,'Delhi'),
(112,'Simran',23,'Female','HR',45000,'Noida');

INSERT INTO departments_table VALUES
(1,'IT'),
(2,'HR'),
(3,'Sales'),
(4,'Finance'),
(5,'Marketing');


DESCRIBE employees_table;
desc departments_table;
SELECT * FROM employees_table;

show tables;
DESC employees_table;
SELECT COUNT(*) FROM employees_table;
SELECT DATABASE();

SELECT COUNT(*) FROM employees_table;
-- Q1
-- Find employees whose department exists in departments_table.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM departments_table d
    WHERE d.dept_name = e1.department
);



-- Q2
-- Find employees whose department does NOT exist
-- in departments_table.

SELECT *
FROM employees_table e1
WHERE NOT EXISTS
(
    SELECT 1
    FROM departments_table d
    WHERE d.dept_name = e1.department
);


-- Q3
-- Find departments that have at least one employee.

SELECT *
FROM departments_table d
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e
    WHERE e.department = d.dept_name
);



-- Q4
-- Find departments that have no employees.

SELECT *
FROM departments_table d
WHERE NOT EXISTS
(
    SELECT 1
    FROM employees_table e
    WHERE e.department = d.dept_name
);



-- Q5
-- Find employees whose manager exists in departments_table.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM departments_table d
    WHERE d.manager = e1.emp_name
);


-- Placement Level Questions


-- Q6
-- Find employees who belong to a department that has at least 2 employees.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e2
    WHERE e2.department = e1.department
    GROUP BY department
    HAVING COUNT(*) >= 2
);



-- Q7
-- Find departments whose average salary is greater than 50000.

SELECT *
FROM departments_table d
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e
    WHERE e.department = d.dept_name
    GROUP BY department
    HAVING AVG(salary) > 50000
);



-- Q8
-- Find employees working in departments whose average salary is above 50000.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e2
    WHERE e2.department = e1.department
    GROUP BY department
    HAVING AVG(salary) > 50000
);



-- Q9
-- Find departments where at least one employee earns more than 70000.

SELECT *
FROM departments_table d
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e
    WHERE e.department = d.dept_name
      AND e.salary > 70000
);



-- Q10
-- Find employees whose department has more than 3 employees.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e2
    WHERE e2.department = e1.department
    GROUP BY department
    HAVING COUNT(*) > 3
);



-- Q11
-- Find employees who are the only employee in their department.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e2
    WHERE e2.department = e1.department
    GROUP BY department
    HAVING COUNT(*) = 1
);



-- Q12
-- Find departments having more than one employee older than 25.

SELECT *
FROM departments_table d
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e
    WHERE e.department = d.dept_name
      AND e.age > 25
    GROUP BY department
    HAVING COUNT(*) > 1
);



-- Q13
-- Find employees whose department has at least one employee from Delhi.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM employees_table e2
    WHERE e2.department = e1.department
      AND e2.city = 'Delhi'
);



-- Q14
-- Find employees whose department has no employee from Mumbai.

SELECT *
FROM employees_table e1
WHERE NOT EXISTS
(
    SELECT 1
    FROM employees_table e2
    WHERE e2.department = e1.department
      AND e2.city = 'Mumbai'
);



-- Q15
-- Find employees who work in a department managed by someone present in employees_table.

SELECT *
FROM employees_table e1
WHERE EXISTS
(
    SELECT 1
    FROM departments_table d
    JOIN employees_table e2
        ON d.manager = e2.emp_name
    WHERE d.dept_name = e1.department
);