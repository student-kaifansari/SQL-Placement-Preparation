CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(50)
);

INSERT INTO students VALUES
(1,'aman@gmail.com','Aman'),
(2,'kaif@gmail.com','Kaif'),
(3,'sara@gmail.com','Sara');


-- Duplicate Email
INSERT INTO students VALUES
(4,'aman@gmail.com','Rahul');
-- Output
-- Error
-- Duplicate entry 'aman@gmail.com'
-- for key 'email'


-- NULL Values
INSERT INTO students VALUES
(4,NULL,'Ali');

INSERT INTO students VALUES
(5,NULL,'Riya');



-- Multiple UNIQUE Constraints

-- Ek table me multiple UNIQUE ho sakte hain.

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    aadhar VARCHAR(20) UNIQUE
);

-- Yahan:

-- Email duplicate ❌
-- Phone duplicate ❌
-- Aadhaar duplicate ❌



-- ==========================================
-- Q1
-- Create a students table.
-- Email should be UNIQUE.
-- ==========================================

CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);


-- ==========================================
-- Q2
-- Insert three students.
-- ==========================================

INSERT INTO students VALUES
(1,'Aman','aman@gmail.com'),
(2,'Kaif','kaif@gmail.com'),
(3,'Sara','sara@gmail.com');


-- ==========================================
-- Q3
-- Try inserting duplicate email.
-- Observe the error.
-- ==========================================

INSERT INTO students VALUES
(4,'Ali','aman@gmail.com');


-- ==========================================
-- Q4
-- Insert NULL email.
-- ==========================================

INSERT INTO students VALUES
(5,'Riya',NULL);


-- ==========================================
-- Q5
-- Insert another NULL email.
-- ==========================================

INSERT INTO students VALUES
(6,'Rahul',NULL);


-- ==========================================
-- Q1
-- Create employees table.
-- Name should be NOT NULL.
-- ==========================================

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT
);


-- ==========================================
-- Q2
-- Insert valid data.
-- ==========================================

INSERT INTO employees VALUES
(1,'Aman',50000),
(2,'Kaif',35000),
(3,'Sara',65000);


-- ==========================================
-- Q3
-- Try inserting NULL name.
-- Observe the error.
-- ==========================================

INSERT INTO employees VALUES
(4,NULL,45000);


-- ==========================================
-- Q4
-- Insert employee without salary.
-- Salary allows NULL.
-- ==========================================

INSERT INTO employees VALUES
(5,'Ali',NULL);


-- ==========================================
-- Q5
-- Display all employees.
-- ==========================================

SELECT * FROM employees;