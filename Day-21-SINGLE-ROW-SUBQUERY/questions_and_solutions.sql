-- ===========================================
-- Day-10 : Subquery Practice Set-1
-- Topic: Single Row Subquery
-- ===========================================

-- Q1
-- Find the employee(s) whose salary is equal to the highest salary.

-- Write Query Here
select * from employee
where salary=(select max(salary) from employee);


-- Q2
-- Find the employee(s) whose salary is equal to the lowest salary.

-- Write Query Here
select * from employee
where salary=(select min(salary) from employee);



-- Q3
-- Find all employees whose salary is greater than the average salary.

-- Write Query Here
select * from employee
where salary>(select avg(salary) from employee);



-- Q4
-- Find all employees whose salary is less than the average salary.

-- Write Query Here
select * from employee
where salary<(select avg(salary) from employee);



-- Q5
-- Find the employee(s) whose salary is greater than Rahul's salary.
-- (Do not hardcode Rahul's salary)

-- Write Query Here
select * from employee
where salary>(select salary from employee where name='Rahul');



-- Q6
-- Find the employee(s) whose salary is less than Sara's salary.
-- (Do not hardcode Sara's salary)

-- Write Query Here
select * from employee
where salary<(select salary from employee where name='Sara');


-- Q7
-- Find all employees who belong to the same department as Aman.

-- Write Query Here
select * from employee
where department=(select department from employee where name='Aman');


-- Q8
-- Find all employees whose salary is equal to Aman's salary.

-- Write Query Here
select * from employee
where salary=(select salary from employee where name='Aman');


-- Q9
-- Find employees whose age is greater than Kaif's age.

-- Write Query Here
select * from employee
where age>(select age from employee where name='Kaif');


-- Q10
-- Find all employees who belong to the same department as Sara.

-- Write Query Here
select * from employee
where department=(select department from employee where name='Sara');




-- ===========================================
-- Day-10 : Subquery Practice Set-2
-- Level : Medium
-- ===========================================

-- Q11
-- Find employees whose salary is greater than the salary of Aman.

-- Write Query Here
select * from employee
where salary>(select salary from employee where name='Aman');


-- Q12
-- Find employees whose age is less than Rahul's age.

-- Write Query Here
select * from employee
where age<(select age from employee where name='Rahul');


-- Q13
-- Find employees whose salary is equal to the average salary of all employees.
-- (If no employee has exactly the average salary, the result should be empty.)

-- Write Query Here
select * from employee
where salary=(select avg(salary) from employee);


-- Q14
-- Find employees who are older than the oldest employee in the HR department.

-- Write Query Here
select * from employee
where age>(select max(age) from employee where department='HR');


-- Q15
-- Find employees whose salary is less than the highest salary.

-- Write Query Here
select * from employee
where salary<(select max(salary) from employee);


-- Q16
-- Find employees whose salary is greater than the minimum salary.

-- Write Query Here
select * from employee
where salary>(select min(salary) from employee);


-- Q17
-- Find employees who belong to the same city as Sara.

-- Write Query Here
select * from employee
where city=(select city from employee where name='Sara');


-- Q18
-- Find employees whose age is equal to the minimum age.

-- Write Query Here
select * from employee
where age=(select min(age) from employee);


-- Q19
-- Find employees whose salary is greater than the average salary of the IT department.

-- Write Query Here
select * from employee
where salary>(select avg(salary) from employee where department='IT');


-- Q20
-- Find employees whose age is greater than the average age of all employees.

-- Write Query Here
select * from employee
where age>(select avg(age) from employee);