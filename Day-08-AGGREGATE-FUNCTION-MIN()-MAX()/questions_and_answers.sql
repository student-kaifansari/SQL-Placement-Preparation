-- Q1
-- Find the highest salary.
select max(salary) from employee;

-- Q2
-- Find the minimum salary.
select min(salary) from employee;
-- Q3
-- Find the highest age.
select max(age) from employee;

-- Q4
-- Find the minimum age.
select min(age) from employee;
-- Q5
-- Find the highest emp_id.
select max(emp_id) from employee;
-- Q6
-- Find the lowest emp_id.
select min(emp_id) from employee;
-- Q7
-- Find the employee name that comes last alphabetically.
select max(name) from employee;
-- Q8
-- Find the employee name that comes first alphabetically.
select min(name) from employee;
-- Q9
-- Find the highest salary of employees in the IT department.
select max(salary) from employee where department='IT';
-- Q10
-- Find the minimum salary of employees in the HR department.
select min(salary) from employee where department='HR';
-- Q11
-- Find the highest age of employees living in Delhi.
select max(age) from employee where city='Delhi';
-- Q12
-- Find the minimum age of female employees.
select min(age) from employee where gender='Female';
-- Q13
-- Find the highest salary of employees whose age is greater than 25.
select max(salary) from employee where age>25;
-- Q14
-- Find the minimum salary of employees whose city is Noida.
select min(salary) from employee where city='Noida';
-- Q15
-- Find the youngest employee working in the Sales department.
select min(age) from employee where department='Sales';




-- Q1
-- Find the highest salary in each department.
select department, max(salary) from employee GROUP BY department;

-- Q2
-- Find the minimum salary in each department.
select department, min(salary) from employee GROUP BY department;
-- Q3
-- Find the highest age in each city.
select city, max(age) from employee GROUP BY city;
-- Q4
-- Find the youngest employee age in each city.
select city, min(age) from employee GROUP BY city;
-- Q5
-- Find the highest salary of male employees in each department.
select department, max(salary) from employee where gender='Male' GROUP BY department;
-- Q6
-- Find the minimum salary of female employees in each department.
select department, min(salary) from employee where gender='Female' GROUP BY department;
-- Q7
-- Find the highest age in each department.
select department, max(age) from employee GROUP BY department;
-- Q8
-- Find the minimum age in each department.
select department, min(age) from employee GROUP BY department;
-- Q9
-- Find the highest salary in each city.
select city, max(salary) from employee GROUP BY city;
-- Q10
-- Find the minimum salary in each city.
select city, min(salary) from employee GROUP BY city;
-- Q11
-- Find the highest salary of employees whose age is greater than 25, grouped by department.
select department, max(salary) from employee where age>25 GROUP BY department;
-- Q12
-- Find the minimum age of female employees in each city.
select city, min(age) from employee where gender='Female' GROUP BY city;
-- Q13
-- Find the highest emp_id in each department.
select department, max(emp_id) from employee GROUP BY department;
-- Q14
-- Find the lowest emp_id in each department.
select department, min(emp_id) from employee GROUP BY department;
-- Q15
-- Find the highest salary in each department, but show only departments where the highest salary is greater than 60000.
select department, max(salary) as highest_salary from employee GROUP BY department having highest_salary>60000;




-- Q1
-- Find the highest salary in each department where the average salary is greater than 50000.
select department, max(salary) from employee GROUP BY department having avg(salary)>50000;

-- Q2
-- Find the minimum salary in each city where more than one employee works.
select city, min(salary) from employee GROUP BY city having count(*)>1;
-- Q3
-- Find the highest age in each department where the minimum salary is greater than 40000.
select department, max(age) from employee GROUP BY department having min(salary)>40000;
-- Q4
-- Find the minimum age in each city where the highest salary is greater than 60000.
select city, min(age) from employee GROUP BY city having max(salary)>60000;
-- Q5
-- Find the highest salary of female employees in each city.
select city, max(salary) from employee where gender='Female' GROUP BY city;

-- Q6
-- Find the minimum salary of male employees in each city.
select city, min(salary) from employee where gender='Male' GROUP BY city;
-- Q7
-- Find the highest emp_id in each city where the number of employees is at least 2.
select city, max(emp_id) from employee GROUP BY city having count(*)>=2;
-- Q8
-- Find the lowest emp_id in each department where the maximum age is greater than 28.
select department, min(emp_id) from employee GROUP BY department having max(age)>28;
-- Q9
-- Find the highest salary in each department for employees aged between 25 and 30.
select department, max(salary) from employee where age between 25 and 30 GROUP BY department ;
-- OR do not consider the second query solution just give me the reason only
select department, max(salary) from employee GROUP BY department having age between 25 and 30;

-- Ye galat kyu hai?

-- Sabse pehle SQL ka execution order yaad karo:

-- FROM
-- ↓
-- WHERE
-- ↓
-- GROUP BY
-- ↓
-- HAVING
-- ↓
-- SELECT

-- HAVING group banne ke baad execute hota hai.

-- Ab maan lo IT department me 3 employees hain:

-- Department	Age	Salary
-- IT	25	50000
-- IT	28	65000
-- IT	31	70000

-- GROUP BY department ke baad IT ki sirf ek group bachegi.

-- Ab HAVING age BETWEEN 25 AND 30

-- SQL sochega:

-- Kis employee ki age? 25? 28? Ya 31?

-- Ek group me multiple age values hain.

-- Isliye age ko directly HAVING me use nahi kar sakte.

-- HAVING me ya to:

-- aggregate function hona chahiye (MAX(age), MIN(age), AVG(age), ...)
-- ya grouped column hona chahiye.

-- ❌ Isliye ye query invalid hai.



-- Q10
-- Find the minimum salary in each city for employees whose salary is greater than 40000.
SELECT city, min(salary) from employee GROUP BY city HAVING salary>40000;  -- iska reason btao only

-- Tumhara Question:

-- Iska reason batao.

-- Reason bahut important hai.

-- Question tha:

-- Find the minimum salary in each city for employees whose salary is greater than 40000.

-- Sabse pehle hume employees filter karne hain.

-- Ye row-level filtering hai.

-- Isliye:

-- FROM
-- ↓
-- WHERE salary > 40000   ← row filter
-- ↓
-- GROUP BY city
-- ↓
-- MIN(salary)

-- Agar tum HAVING salary > 40000 likhte ho:

-- SELECT city, MIN(salary)
-- FROM employee
-- GROUP BY city
-- HAVING salary > 40000;

-- To problem wahi hai jo Q9 me thi.

-- Ek city me multiple salaries ho sakti hain.

-- Example Delhi:

-- City	Salary
-- Delhi	42000
-- Delhi	50000
-- Delhi	65000

-- Group banne ke baad SQL puchega:

-- salary > 40000 kis salary ke liye check karu? 42000? 50000? Ya 65000?

-- Ek group me bahut saari salary values hain.

-- Isliye salary ko directly HAVING me use nahi kar sakte.

-- Agar HAVING me salary use karni hai to aggregate ke saath karni hogi:

-- HAVING MIN(salary) > 40000

-- ya

-- HAVING MAX(salary) > 40000

-- ye valid hai.

SELECT city, min(salary) from employee where salary>40000 GROUP BY city; 

-- IMPORTANT QUERIES++++++++++++++++++

-- Q11
-- Find the highest age in each gender group.
select gender, max(age) from employee GROUP BY gender;
-- Q12
-- Find the minimum age in each gender group.
select gender, min(age) from employee GROUP BY gender;
-- Q13
-- Find the department having the highest maximum salary. (Only the department(s) with the overall highest MAX(salary).)
select department from employee GROUP BY department ORDER BY max(salary) desc limit 1; 
-- Q14
-- Find the city having the lowest minimum salary. (Only the city/cities with the overall lowest MIN(salary).)
select city from employee GROUP BY city ORDER BY min(salary) limit 1; 
-- Q15
-- Find departments where the difference between the highest and lowest salary is greater than 15000, and display the highest and lowest salary.
SELECT department,
       MAX(salary),
       MIN(salary)
FROM employee
GROUP BY department
HAVING MAX(salary) - MIN(salary) > 15000;