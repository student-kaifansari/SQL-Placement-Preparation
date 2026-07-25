-- Company Level SQL Questions (Aggregate Functions)
-- Ye type ke questions TCS, Cognizant, Accenture, Capgemini, Infosys, Wipro me frequently pooche jaate hain.

-- Q1
-- Find the department having the highest average salary.
select department from employee GROUP BY department ORDER BY avg(salary) desc limit 1;
-- Q2
-- Find the city having the lowest average salary.
select city from employee GROUP BY city ORDER BY avg(salary) limit 1;
-- Q3
-- Display departments whose average salary is greater than the overall average salary.
SELECT department
FROM employee
GROUP BY department
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM employee
);
-- Q4
-- Find the department with the maximum number of employees.
select department from employee group by department ORDER BY count(*) desc limit 1;

-- Q5
-- Find the city with the minimum number of employees.
select city from employee group by city ORDER BY count(*) limit 1;
-- Q6
-- Display departments where the highest salary is equal to the overall highest salary.
select department from employee group by department having max(salary)=(select max(salary) from employee);
-- Q7
-- Display cities where the minimum salary is equal to the overall minimum salary.
select city from employee group by city having min(salary)=(select min(salary) from employee);
-- Q8
-- Find departments where the average age is greater than 26 and total salary is greater than 100000.
select department from employee group by department having avg(age)> 26 and sum(salary)>100000;
-- Q9
-- Find the city where the salary difference (MAX - MIN) is maximum.
select city from employee group by city ORDER BY max(salary)-min(salary) desc limit 1;
-- Q10
-- Find the department where the age difference (MAX - MIN) is minimum.
select department from employee group by department ORDER BY max(age)-min(age) asc limit 1;