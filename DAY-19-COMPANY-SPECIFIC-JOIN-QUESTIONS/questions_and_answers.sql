/*=========================================================
            SQL JOIN Placement Practice Set - 1
                  (TCS | Infosys | Amazon)
=========================================================*/

/*---------------------------------------------------------
Q1 (TCS Digital) ⭐⭐⭐
Display all employees along with their department names.
---------------------------------------------------------*/
select e.*, d.dept_name from employees as e
INNER JOIN departments as d
on e.dept_id=d.dept_id;

/*---------------------------------------------------------
Q2 (Infosys) ⭐⭐⭐
Display employees who are not assigned to any department.
---------------------------------------------------------*/
select e.* from employees as e
left JOIN departments as d
on e.dept_id=d.dept_id
where d.dept_id is null;

/*---------------------------------------------------------
Q3 (Accenture) ⭐⭐⭐
Display all departments even if no employee works in them.
(Finance should also appear.)
---------------------------------------------------------*/
select d.* from employees as e
RIGHT JOIN departments as d
on d.dept_id=e.dept_id;

/*---------------------------------------------------------
Q4 (Cognizant) ⭐⭐⭐⭐
Using employee_manager table,
display employee name and manager name.
(Self Join)
---------------------------------------------------------*/
select e.emp_name as employee_name, m.emp_name as manager_name
from employee_manager as e left join employee_manager as m
on e.manager_id=m.emp_id; 

/*---------------------------------------------------------
Q5 (Capgemini) ⭐⭐⭐⭐
Using employee_manager table,
display employees whose manager is CEO.
---------------------------------------------------------*/
select e.emp_name from employee_manager as e
left join employee_manager as m
on e.manager_id=m.emp_id
where m.emp_name='CEO';

/*---------------------------------------------------------
Q6 (Deloitte) ⭐⭐⭐
Count employees in every department.
Expected Output:
dept_name | Total_Employees

Finance should also be included.
---------------------------------------------------------*/
select d.dept_name, count(e.emp_id) as Total_Employees from employees as e
RIGHT JOIN departments as d
on e.dept_id=d.dept_id
GROUP BY d.dept_name;

/*---------------------------------------------------------
Q7 (Oracle) ⭐⭐⭐⭐
Display departments that do not have any employees.
---------------------------------------------------------*/
select d.dept_name from employees as e
RIGHT JOIN departments as d
on e.dept_id=d.dept_id
where e.dept_id is null;

/*---------------------------------------------------------
Q8 (Amazon) ⭐⭐⭐⭐
Display employee name, salary and department name.

Sort the result by salary in descending order.
---------------------------------------------------------*/
select e.emp_name, e.salary, d.dept_name from employees as e
join departments as d
on d.dept_id=e.dept_id
ORDER BY e.salary desc;

-- OR

select e.emp_name, e.salary, d.dept_name from employees as e
left join departments as d
on d.dept_id=e.dept_id
ORDER BY e.salary desc;
/*---------------------------------------------------------
Q9 (Juspay) ⭐⭐⭐⭐⭐
Display employee names whose salary is greater than 50000
along with their department names.
---------------------------------------------------------*/
select e.emp_name, d.dept_name from employees as e
join departments as d
on e.dept_id=d.dept_id
where e.salary>50000;

/*---------------------------------------------------------
Q10 (Zoho) ⭐⭐⭐⭐⭐
Display every employee with every department.

(Which JOIN will you use?)
---------------------------------------------------------*/

select e.emp_name, d.dept_name from employees as e
cross join departments as d;




-- ===========================================================================================================



/*=========================================================
            SQL JOIN Placement Practice Set - 2
      (Amazon | Microsoft | Oracle | Deloitte)
=========================================================*/

/*---------------------------------------------------------
Q11 (Amazon) ⭐⭐⭐⭐
Display department name and average salary of employees.

Expected Output:
dept_name | avg_salary
---------------------------------------------------------*/
SELECT d.dept_name, avg(e.salary) as avg_salary from employees as e
right JOIN departments as d
on d.dept_id=e.dept_id
GROUP BY d.dept_name;


/*---------------------------------------------------------
Q12 (Microsoft) ⭐⭐⭐⭐
Display departments where the average salary is greater
than 50000.
---------------------------------------------------------*/
select d.dept_name from employees as e
RIGHT JOIN departments as d
on d.dept_id=e.dept_id
GROUP BY d.dept_name
having avg(e.salary)>50000;

-- or

select d.dept_name from employees as e
JOIN departments as d
on d.dept_id=e.dept_id
GROUP BY d.dept_name
having avg(e.salary)>50000;

/*---------------------------------------------------------
Q13 (Oracle) ⭐⭐⭐⭐
Display employee names who belong to the IT department.
---------------------------------------------------------*/
select e.emp_name from employees as e
join departments as d
on e.dept_id=d.dept_id
where d.dept_name='IT';

/*---------------------------------------------------------
Q14 (Deloitte) ⭐⭐⭐⭐
Display employee names who belong to either IT or HR
department.
---------------------------------------------------------*/
select e.emp_name from employees as e
join departments as d
on e.dept_id=d.dept_id
where d.dept_name in ('IT', 'HR');

/*---------------------------------------------------------
Q15 (Infosys) ⭐⭐⭐
Display department name and maximum salary in each
department.
---------------------------------------------------------*/
SELECT d.dept_name,
       MAX(e.salary) AS max_salary
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- OR

SELECT d.dept_name,
       MAX(e.salary) AS max_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

/*---------------------------------------------------------
Q16 (Amazon) ⭐⭐⭐⭐⭐
Display the employee(s) who have the highest salary
in each department.

(Think carefully. There can be more than one employee
with the same highest salary.)
---------------------------------------------------------*/

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
);

/*---------------------------------------------------------
Q17 (Capgemini) ⭐⭐⭐⭐
Display all employees whose department is not Finance.
(Employees having NULL department should also appear.)
---------------------------------------------------------*/
select e.emp_name, d.dept_name from employees as e
LEFT JOIN departments as d
on e.dept_id=d.dept_id;

/*---------------------------------------------------------
Q18 (Oracle) ⭐⭐⭐⭐⭐
Display departments having more than one employee.

Expected Output:
dept_name | total_employees
---------------------------------------------------------*/
select d.dept_name, count(e.emp_id) as total_employees from employees as e
join departments as d
on e.dept_id=d.dept_id
GROUP BY d.dept_name
having total_employees>1;
/*---------------------------------------------------------
Q19 (Juspay) ⭐⭐⭐⭐⭐
Display employees whose salary is between 45000 and
70000 along with their department names.

Sort salary in ascending order.
---------------------------------------------------------*/
select e.emp_name,e.salary, d.dept_name from employees as e
join departments as d
on e.dept_id=d.dept_id
where e.salary between 45000 and 70000;

/*---------------------------------------------------------
Q20 (Microsoft) ⭐⭐⭐⭐⭐
Display all departments along with the total salary
paid in each department.

Finance should also appear with Total Salary = NULL.
---------------------------------------------------------*/
SELECT d.dept_name,
       SUM(e.salary) AS total_salary
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;