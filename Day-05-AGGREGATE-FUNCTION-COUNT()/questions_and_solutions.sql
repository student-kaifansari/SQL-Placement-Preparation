-- ===========================================================
-- Day 05 : Aggregate Functions (COUNT)
-- Difficulty : Easy
-- ===========================================================

-- Q1 Display the total number of employees.
select count(*) from Employee;

-- ===========================================================

-- Q2 Display the total number of non-NULL cities.
select count(city) from Employee;

-- ===========================================================

-- Q3 Display the total number of unique departments.
select count(distinct department) from Employee;

-- ===========================================================

-- Q4 Display the total number of female employees.
select count(*) from Employee where gender='Female';

-- ===========================================================

-- Q5 Display the total number of male employees.
select count(*) from Employee where gender='Male';

-- ===========================================================

-- Q6 Display the total number of employees whose salary is greater than 50000.
select count(*) from Employee where salary>5000;

-- ===========================================================

-- Q7 Display the total number of employees whose age is less than 28.
select count(*) from Employee where age<28;

-- ===========================================================

-- Q8 Display the total number of employees working in the IT department.
select count(*) from Employee where department='IT';

-- ===========================================================

-- Q9 Display the total number of employees living in Delhi.
select count(*) from Employee where city='Delhi';

-- ===========================================================

-- Q10 Display the total number of employees whose salary is between 40000 and 70000.
select count(*) from Employee where salary BETWEEN 40000 and 70000;

-- ===========================================================



-- ===========================================================
-- Day 05 : Aggregate Functions (COUNT)
-- Difficulty : Medium
-- ===========================================================

-- Q1 Display the number of employees in each department.
select department,count(*) from Employee group by department;

-- ===========================================================

-- Q2 Display the number of employees in each city.
select city, count(*) from Employee group by city;

-- ===========================================================

-- Q3 Display the number of male and female employees separately.
select gender,count(*) from Employee group by gender;

-- ===========================================================

-- Q4 Display the number of employees in each department whose salary is greater than 50000.
select department, count(*) from Employee where salary>50000 GROUP BY department;

-- ===========================================================

-- Q5 Display the number of employees in each city whose age is less than 30.
select city, count(*) from Employee where age<30 GROUP BY city;
-- ===========================================================

-- Q6 Display the number of unique cities.
--IMPORTANT QUERY++++++++++++++++++++++++++++++++++
select count(DISTINCT city) from Employee;

-- ===========================================================

-- Q7 Display the number of unique departments where at least one employee earns more than 60000.
--IMPORTANT QUERY++++++++++++++++++++++++++++++++++
select COUNT(DISTINCT department) from Employee where salary>60000;
-- ===========================================================

-- Q8 Display the number of employees in each department, sorted from highest to lowest count.
select department, count(*) as num_of_emp from Employee GROUP BY department ORDER BY num_of_emp DESC;
-- ===========================================================

-- Q9 Display only those departments having more than 2 employees.
select department from Employee GROUP BY department having count(*)>2;
-- ===========================================================

-- Q10 Display the city having the maximum number of employees.
select city,count(*) as total from Employee GROUP BY city ORDER BY total desc limit 1;

-- ===========================================================

-- Q11 Display the department having the minimum number of employees.
select department, count(*) as total from Employee GROUP BY department ORDER BY total limit 1;
-- ===========================================================

-- Q12 Display the number of employees whose name starts with 'A' in each department.
select department, count(*) from Employee where name like 'A%' GROUP BY department;
-- ===========================================================

-- Q13 Display the number of employees whose salary is between 40000 and 70000 in each city.
select city, count(*) from employee where salary BETWEEN 40000 and 70000 GROUP BY city;
-- ===========================================================

-- Q14 Display the department name along with the total employees, but only for departments located in Delhi employees.
-- (Hint: Filter first, then group.)
select department, count(*) as total_Employee from employee where city='Delhi' GROUP BY department;
-- ===========================================================

-- Q15 Display the total number of employees department-wise and city-wise.
-- (Hint: Group by more than one column.)
select department, count(*) as total_Employees from Employee GROUP BY department, city;

-- ===========================================================