-- ============================================================
-- FOREIGN KEY ADVANCED PRACTICE
-- Topics:
-- 1. ON DELETE CASCADE
-- 2. ON DELETE SET NULL
-- 3. ON DELETE RESTRICT
-- 4. ON DELETE NO ACTION
-- 5. ON UPDATE CASCADE
-- ============================================================


-- ============================================================
-- Q1
-- Create tables using ON DELETE CASCADE.
-- ============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
    ON DELETE CASCADE
);

-- ============================================================
-- Q2
-- Insert data.
-- ============================================================

INSERT INTO departments VALUES
(1,'IT'),
(2,'HR');

INSERT INTO employees VALUES
(101,'Aman',1),
(102,'Kaif',1),
(103,'Sara',2);

-- Answer

SELECT * FROM departments;
SELECT * FROM employees;

-- ============================================================
-- Q3
-- Delete department 1.
-- What happens?
-- ============================================================

DELETE FROM departments
WHERE dept_id=1;

-- Answer

SELECT * FROM employees;

-- Expected:
-- Only Sara remains.
-- Aman and Kaif are deleted automatically.


-- ============================================================
-- Q4
-- Create tables using ON DELETE SET NULL.
-- ============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
    ON DELETE SET NULL
);

-- ============================================================
-- Q5
-- Insert data.
-- ============================================================

INSERT INTO departments VALUES
(1,'IT'),
(2,'HR');

INSERT INTO employees VALUES
(101,'Aman',1),
(102,'Kaif',1),
(103,'Sara',2);

-- ============================================================
-- Q6
-- Delete department 1.
-- ============================================================

DELETE FROM departments
WHERE dept_id=1;

-- Answer

SELECT * FROM employees;

-- Expected:
-- Aman -> NULL
-- Kaif -> NULL
-- Sara -> 2


-- ============================================================
-- Q7
-- Create tables using ON DELETE RESTRICT.
-- ============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
    ON DELETE RESTRICT
);

-- ============================================================
-- Q8
-- Insert data.
-- ============================================================

INSERT INTO departments VALUES
(1,'IT');

INSERT INTO employees VALUES
(101,'Aman',1);

-- ============================================================
-- Q9
-- Try deleting department 1.
-- ============================================================

DELETE FROM departments
WHERE dept_id=1;

-- Answer

-- ERROR
-- Cannot delete or update a parent row:
-- a foreign key constraint fails


-- ============================================================
-- Q10
-- Create tables using ON DELETE NO ACTION.
-- ============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
    ON DELETE NO ACTION
);

-- ============================================================
-- Q11
-- Insert data.
-- ============================================================

INSERT INTO departments VALUES
(1,'IT');

INSERT INTO employees VALUES
(101,'Aman',1);

-- ============================================================
-- Q12
-- Try deleting parent row.
-- ============================================================

DELETE FROM departments
WHERE dept_id=1;

-- Answer

-- ERROR
-- Same behavior as RESTRICT in MySQL.


-- ============================================================
-- Q13
-- Create tables using ON UPDATE CASCADE.
-- ============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
    ON UPDATE CASCADE
);

-- ============================================================
-- Q14
-- Insert data.
-- ============================================================

INSERT INTO departments VALUES
(1,'IT');

INSERT INTO employees VALUES
(101,'Aman',1);

-- ============================================================
-- Q15
-- Update department id.
-- ============================================================

UPDATE departments
SET dept_id=10
WHERE dept_id=1;

-- Answer

SELECT * FROM employees;

-- Expected:
-- Aman dept_id becomes 10 automatically.


-- ============================================================
-- Interview Question 1
--
-- CASCADE vs SET NULL
--
-- Answer:
-- CASCADE -> Child row deleted.
-- SET NULL -> Child row remains, FK becomes NULL.
-- ============================================================


-- ============================================================
-- Interview Question 2
--
-- RESTRICT vs NO ACTION
--
-- Answer:
-- In MySQL, both behave almost the same.
-- Parent delete is blocked.
-- ============================================================


-- ============================================================
-- Interview Question 3
--
-- Which option updates child table automatically?
--
-- Answer:
-- ON UPDATE CASCADE
-- ============================================================


-- ============================================================
-- Interview Question 4
--
-- Which option is safest for Banking Systems?
--
-- Answer:
-- RESTRICT
-- ============================================================


-- ============================================================
-- Interview Question 5
--
-- Which option is useful when deleting parent should
-- automatically delete child records?
--
-- Answer:
-- ON DELETE CASCADE
-- ============================================================