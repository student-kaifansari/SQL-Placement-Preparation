CREATE DATABASE SQL_Placement;
USE SQL_Placement;

DROP TABLE IF EXISTS employees_table;

CREATE TABLE employees_table
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

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


DROP TABLE IF EXISTS departments_table;

CREATE TABLE departments_table
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

INSERT INTO departments_table VALUES
(1,'IT'),
(2,'HR'),
(3,'Sales'),
(4,'Finance'),
(5,'Marketing');

-- Q1
-- Show employee name and classify salary as:
-- High (>=70000)
-- Medium (50000-69999)
-- Low (<50000)
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 AND salary <= 69999 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees_table;

-- OR

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees_table;


-- Q2
-- Display employee name and gender as:
-- M -> Male Employee
-- F -> Female Employee
-- (Use your dataset values.)
select name,
gender, case when gender='Male' then 'Male Employee'
when gender='Female' then 'Female Employee'
else 'Other'
end as employee_gender
from employees_table;



-- Q3
-- Show department names as:
-- IT -> Information Technology
-- HR -> Human Resource
-- Sales -> Sales Department
-- Finance -> Finance Department

SELECT
    dept_name,
    CASE
        WHEN dept_name = 'IT' THEN 'Information Technology'
        WHEN dept_name = 'HR' THEN 'Human Resource'
        WHEN dept_name = 'Sales' THEN 'Sales Department'
        WHEN dept_name = 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_type
FROM departments_table;

-- OR

SELECT
    name,
    department,
    CASE department
        WHEN 'IT' THEN 'Information Technology'
        WHEN 'HR' THEN 'Human Resource'
        WHEN 'Sales' THEN 'Sales Department'
        WHEN 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_type
FROM employees_table;

-- OR

SELECT
    name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Information Technology'
        WHEN department = 'HR' THEN 'Human Resource'
        WHEN department = 'Sales' THEN 'Sales Department'
        WHEN department = 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_type
FROM employees_table;
-----------------------------------------------------

-- Q4
-- Show whether employee is Adult or Young.
-- Adult : age >=25

SELECT
    name,
    age,
    CASE
        WHEN age >= 25 THEN 'Adult'
        ELSE 'Young'
    END AS Age_Category
FROM employees_table;

-----------------------------------------------------

-- Q5
-- Show Bonus:
-- Salary >=70000 → 10000
-- Salary >=50000 → 5000
-- Otherwise → 2000

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 10000
        WHEN salary >= 50000 THEN 5000
        ELSE 2000
    END AS Bonus
FROM employees_table;


-- ============================================
-- Q6
-- Display employee grade:
-- A : salary >= 70000
-- B : salary >= 50000
-- C : salary >= 40000
-- D : Otherwise
-- ============================================

SELECT
    name,
    salary,
    CASE 
        WHEN salary >= 70000 THEN 'A'
        WHEN salary >= 50000 THEN 'B'
        WHEN salary >= 40000 THEN 'C'
        ELSE 'D'
    END AS Grade
FROM employees_table;


-- ============================================
-- Q7
-- Display city category:
-- Delhi  -> North
-- Noida  -> NCR
-- Mumbai -> West
-- Others -> Other
-- ============================================

SELECT
    name,
    city,
    CASE city
        WHEN 'Delhi' THEN 'North'
        WHEN 'Noida' THEN 'NCR'
        WHEN 'Mumbai' THEN 'West'
        ELSE 'Other'
    END AS City_Category
FROM employees_table;


-- ============================================
-- Q8
-- Show Tax:
-- Salary >=70000 -> 20%
-- Salary >=50000 -> 10%
-- Otherwise -> 5%
-- ============================================

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN '20%'
        WHEN salary >= 50000 THEN '10%'
        ELSE '5%'
    END AS Tax
FROM employees_table;


-- ============================================
-- Q9
-- Display employee experience category:
-- Age >30  -> Senior
-- Age 25-30 -> Mid
-- Below 25 -> Junior
-- ============================================

SELECT
    name,
    age,
    CASE
        WHEN age > 30 THEN 'Senior'
        WHEN age >= 25 THEN 'Mid'
        ELSE 'Junior'
    END AS Experience_Category
FROM employees_table;


-- ============================================
-- Q10
-- Display employee name and role:
-- IT      -> Developer
-- HR      -> Recruiter
-- Sales   -> Sales Executive
-- Finance -> Accountant
-- ============================================

SELECT
    name,
    department,
    CASE department
        WHEN 'IT' THEN 'Developer'
        WHEN 'HR' THEN 'Recruiter'
        WHEN 'Sales' THEN 'Sales Executive'
        WHEN 'Finance' THEN 'Accountant'
        ELSE 'Unknown'
    END AS Role
FROM employees_table;