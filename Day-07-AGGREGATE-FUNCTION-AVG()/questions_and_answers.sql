-- ===========================================================
-- Day 05 : Aggregate Functions (AVG)
-- Easy Level
-- ===========================================================

-- Q1 Display the average salary of all employees.
select avg(salary) from employee;

-- ===========================================================

-- Q2 Display the average age of all employees.
select avg(age) from employee;

-- ===========================================================

-- Q3 Display the average salary of employees working in the IT department.
select avg(salary) from employee where department='IT';

-- ===========================================================

-- Q4 Display the average salary of employees living in Delhi.
select avg(salary) from employee where city='Delhi';

-- ===========================================================

-- Q5 Display the average salary of employees whose age is greater than 25.
select avg(salary) from employee where age>25;
-- ===========================================================

-- Q6 Display the average salary of female employees.
select avg(salary) from employee where gender='Female';

-- ===========================================================

-- Q7 Display the average salary of employees whose salary is between 40000 and 70000.
select avg(salary) from employee where salary between 40000 and 70000;

-- ===========================================================

-- Q8 Display the average salary of employees whose name starts with 'A'.
select avg(salary) from employee where name like 'A%';

-- ===========================================================

-- Q9 Display the average salary of employees in the Sales department.
select avg(salary) from employee where department='Sales';
-- ===========================================================

-- Q10 Display the average age of employees living in Noida.
select avg(age) from employee where city='Noida';

-- ===========================================================


SELECT AVG(10), SUM(10), COUNT(10);