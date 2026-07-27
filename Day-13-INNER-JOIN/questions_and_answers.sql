CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

INSERT INTO employees VALUES
(1,'Aman',101,50000),
(2,'Kaif',102,45000),
(3,'Sara',101,60000),
(4,'Rahul',103,55000),
(5,'Neha',NULL,40000);



CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Sales'),
(104,'Finance');


-- ==========================================================


-- Q1
-- Display employee name and department name.
select e.emp_name, d.dept_name from employees as e
join departments as d 
on e.dept_id=d.dept_id;
-- Q2
-- Display employee name and salary.
select emp_name, salary from employees;
-- Q3
-- Display employee name, department name and salary.
select e.emp_name, d.dept_name, e.salary
from employees as e
INNER JOIN departments as d
on d.dept_id=e.dept_id;
-- Q4
-- Display all columns using INNER JOIN.
select *
from employees as e
INNER JOIN departments as d
on e.dept_id=d.dept_id;
-- Q5
-- Display only employees whose salary is greater than 50000.
select * from employees where salary>50000;
-- Q6
-- Display employees working in the IT department.
select e.* from employees as e
INNER JOIN departments as d
on e.dept_id=d.dept_id
where dept_name='IT';
-- Q7
-- Display employees working in the HR department.
select e.* from employees as e
INNER JOIN departments as d
on e.dept_id=d.dept_id
where dept_name='HR';
-- Q8
-- Display employee ID, employee name and department name.
select e.emp_id, e.emp_name, d.dept_name from employees as e
INNER JOIN departments as d
on e.dept_id=d.dept_id;
-- Q9
-- Display department name along with employee salary.
select d.dept_name, e.salary from departments as d
INNER JOIN employees as e
on d.dept_id=e.dept_id;
-- Q10
-- Display all employees whose department ID matches in both tables.
select * from employees as e
INNER JOIN departments as d
on e.dept_id=d.dept_id;