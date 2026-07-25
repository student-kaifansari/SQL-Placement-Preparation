-- ===========================================================
-- Day 05 : Aggregate Functions (SUM)
-- Easy Level
-- ===========================================================

-- Q1 Display the total salary of all employees.
select sum(salary) as tot_salary from Employee;
-- ===========================================================

-- Q2 Display the total age of all employees.
select sum(age) as tot_age from employee;
-- ===========================================================

-- Q3 Display the total salary of employees working in the IT department.
select sum(salary) as tot_salary from Employee where department='IT';
-- ===========================================================

-- Q4 Display the total salary of employees living in Delhi.
select sum(salary) as tot_salary from employee where city='Delhi';
-- OR
select city,sum(salary) as tot_salary from employee where city='Delhi' GROUP BY city;

-- ===========================================================

-- Q5 Display the total salary of employees whose age is greater than 25.
select sum(salary) as tot_salary from employee where age>25;

-- ===========================================================

-- Q6 Display the total salary of female employees.
select sum(salary) as tot_salary from employee where gender='Female';
-- OR
select gender,sum(salary) as tot_salary from employee where gender='Female' GROUP BY gender;

-- 🎤 Interview Discussion

-- Tumne do jagah ye pattern use kiya:

-- SELECT city, SUM(salary)
-- FROM Employee
-- WHERE city='Delhi'
-- GROUP BY city;

-- Ye correct hai.

-- Lekin interviewer puch sakta hai:

-- "Is query me GROUP BY ki zarurat thi?"

-- Expected Answer:

-- "No sir. Since the WHERE clause filters the data to only one city (Delhi), there is only one group left. Therefore, GROUP BY city is not required. It is valid, but unnecessary."


-- ===========================================================

-- Q7 Display the total salary of employees whose salary is between 40000 and 70000.
select sum(salary) as tot_salary from employee where salary BETWEEN 40000 and 70000;
-- ===========================================================

-- Q8 Display the total salary of employees whose name starts with 'A'.
select sum(salary) as tot_salary from employee where name like 'A%';
-- ===========================================================

-- Q9 Display the total salary of employees in the Sales department.
select sum(salary) as tot_salary from employee where department='Sales';
-- ===========================================================

-- Q10 Display the total age of employees living in Noida.
select sum(age) as tot_age from employee where city='Noida';
-- ===========================================================