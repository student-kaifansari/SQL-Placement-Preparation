-- Q1
-- Display employee name and department name using LEFT JOIN.
select e.emp_name, d.dept_name from employees as e 
LEFT JOIN departments as d 
on e.dept_id=d.dept_id;
-- Q2
-- Display all employees even if they don't have a department.
select *
from employees as e LEFT JOIN departments as d 
on e.dept_id=d.dept_id;
-- Q3
-- Display employee name, salary and department name.
select e.emp_name,e.salary,d.dept_name from employees as e 
LEFT JOIN departments as d
on e.dept_id=d.dept_id; 
-- Q4
-- Display only employees whose department is NULL.
select e.emp_name from employees as e 
LEFT JOIN departments as d 
on e.dept_id=d.dept_id
where e.dept_id is NULL;

-- Tumne likha

-- WHERE e.dept_id = NULL;

-- Ye SQL me kabhi kaam nahi karta.

-- Kyu?

-- SQL me

-- NULL = NULL

-- iska result TRUE nahi hota.

-- NULL ka matlab hai Unknown Value.

-- Isliye comparison operator (=, !=) NULL ke saath use nahi karte.

-- Correct Query
-- SELECT e.emp_name
-- FROM employees e
-- LEFT JOIN departments d
-- ON e.dept_id = d.dept_id
-- WHERE d.dept_name IS NULL;

-- Ya

-- WHERE e.dept_id IS NULL;

-- Dono is dataset me sahi result denge.

-- ⭐ Interview Rule
-- = NULL      ❌

-- != NULL     ❌

-- IS NULL     ✅

-- IS NOT NULL ✅

-- Ye bahut important hai.


-- Q5
-- Display employee ID, employee name and department name.
select e.emp_id,e.emp_name,d.dept_name from employees as e 
LEFT JOIN departments as d
on e.dept_id=d.dept_id; 
-- Q6
-- Display all columns using LEFT JOIN.
select * from employees as e 
LEFT JOIN departments as d
on e.dept_id=d.dept_id; 
-- Q7
-- Display employees working in the IT department using LEFT JOIN.
select * from employees as e 
LEFT JOIN departments as d
on e.dept_id=d.dept_id
where d.dept_name='IT'; 
-- Q8
-- Display employees whose department is HR using LEFT JOIN.
select * from employees as e 
LEFT JOIN departments as d
on e.dept_id=d.dept_id
where d.dept_name='HR'; 
-- Q9
-- Display employees whose department is not assigned.
SELECT *
FROM employees
WHERE dept_id IS NULL;

-- OR 

SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id=d.dept_id
WHERE d.dept_name IS NULL;

-- Q10
-- Count how many employees do not belong to any department.
SELECT COUNT(*) AS emp_not_in_anydept
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;