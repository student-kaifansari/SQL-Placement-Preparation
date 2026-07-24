CREATE DATABASE Employee;
USE Employee;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(20),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO Employee VALUES
(1,'Aman',25,'Male','IT',50000,'Delhi'),
(2,'Kaif',22,'Male','HR',35000,'Noida'),
(3,'Sara',28,'Female','IT',65000,'Delhi'),
(4,'Ali',30,'Male','Sales',45000,'Lucknow'),
(5,'Riya',26,'Female','HR',40000,'Noida'),
(6,'Rahul',29,'Male','IT',70000,'Mumbai'),
(7,'Neha',24,'Female','Sales',42000,'Delhi'),
(8,'Arjun',31,'Male','Finance',80000,'Pune');