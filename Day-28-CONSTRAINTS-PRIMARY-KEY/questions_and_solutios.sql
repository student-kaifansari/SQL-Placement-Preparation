-- =====================================================
-- Q1
-- Create a table named students.
-- student_id should be PRIMARY KEY.
-- =====================================================

CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);


-- =====================================================
-- Q2
-- Insert three students.
-- =====================================================

INSERT INTO students VALUES
(1,'Aman',22),
(2,'Kaif',21),
(3,'Sara',23);


-- =====================================================
-- Q3
-- Try inserting duplicate primary key.
-- Observe the error.
-- =====================================================

INSERT INTO students
VALUES
(1,'Rahul',25);


-- =====================================================
-- Q4
-- Try inserting NULL in primary key.
-- Observe the error.
-- =====================================================

INSERT INTO students
VALUES
(NULL,'Ali',24);


-- =====================================================
-- Q5
-- Create a table using AUTO_INCREMENT.
-- =====================================================

CREATE TABLE employees
(
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employees(name,salary)
VALUES
('Aman',50000),
('Kaif',35000),
('Sara',65000);

SELECT * FROM employees;