-- ===========================================
-- Day-11 : Multi Row Subquery Practice Set-1
-- Answers
-- ===========================================

-- ===========================================
-- Database
-- ===========================================

CREATE DATABASE SQL_Placement;
USE SQL_Placement;

-- ===========================================
-- Employees Table
-- ===========================================

DROP TABLE IF EXISTS employees_table;

CREATE TABLE employees_table(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    age INT,
    city VARCHAR(30)
);

INSERT INTO employees_table VALUES
(101,'Aman','IT',50000,25,'Delhi'),
(102,'Kaif','HR',35000,22,'Noida'),
(103,'Sara','IT',65000,28,'Delhi'),
(104,'Ali','Sales',45000,30,'Lucknow'),
(105,'Riya','HR',40000,26,'Noida'),
(106,'Rahul','IT',70000,29,'Mumbai'),
(107,'Neha','Sales',42000,24,'Delhi'),
(108,'Arjun','Finance',80000,31,'Pune'),
(109,'Priya','Finance',75000,27,'Pune'),
(110,'Rohit','Sales',48000,32,'Mumbai'),
(111,'Ankit','IT',55000,24,'Delhi'),
(112,'Simran','HR',45000,23,'Noida');



-- ===========================================
-- Departments Table
-- ===========================================

DROP TABLE IF EXISTS departments_table;

CREATE TABLE departments_table(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    manager VARCHAR(50)
);

INSERT INTO departments_table VALUES
(1,'IT','Aman'),
(2,'HR','Kaif'),
(3,'Sales','Ali'),
(4,'Finance','Arjun'),
(5,'Marketing','Nikhil');

-- Q1
-- Find all employees who belong to the IT or HR department.

SELECT *
FROM employees_table
WHERE department IN
(
    SELECT dept_name
    FROM departments_table
    WHERE dept_name IN ('IT','HR')
);


-- Q2
-- Find all employees who do NOT belong to the IT or HR department.

SELECT *
FROM employees_table
WHERE department NOT IN
(
    SELECT dept_name
    FROM departments_table
    WHERE dept_name IN ('IT','HR')
);


-- Q3
-- Find employees whose salary is greater than ANY salary of employees in the HR department.

SELECT *
FROM employees_table
WHERE salary > ANY
(
    SELECT salary
    FROM employees_table
    WHERE department='HR'
);


-- Q4
-- Find employees whose salary is greater than ALL salaries of employees in the HR department.

SELECT *
FROM employees_table
WHERE salary > ALL
(
    SELECT salary
    FROM employees_table
    WHERE department='HR'
);


-- Q5
-- Find employees whose age is less than ANY age of employees in the IT department.

SELECT *
FROM employees_table
WHERE age < ANY
(
    SELECT age
    FROM employees_table
    WHERE department='IT'
);


-- Q6
-- Find employees whose age is less than ALL ages of employees in the IT department.

SELECT *
FROM employees_table
WHERE age < ALL
(
    SELECT age
    FROM employees_table
    WHERE department='IT'
);


-- Q7
-- Find employees whose department exists in the departments table.

SELECT *
FROM employees_table
WHERE department IN
(
    SELECT dept_name
    FROM departments_table
);


-- Q8
-- Find employees whose department does NOT exist in the departments table.

SELECT *
FROM employees_table
WHERE department NOT IN
(
    SELECT dept_name
    FROM departments_table
);


-- Q9
-- Find employees whose salary is greater than ANY salary of employees in the Sales department.

SELECT *
FROM employees_table
WHERE salary > ANY
(
    SELECT salary
    FROM employees_table
    WHERE department='Sales'
);


-- Q10
-- Find employees whose salary is greater than ALL salaries of employees in the Sales department.

SELECT *
FROM employees_table
WHERE salary > ALL
(
    SELECT salary
    FROM employees_table
    WHERE department='Sales'
);