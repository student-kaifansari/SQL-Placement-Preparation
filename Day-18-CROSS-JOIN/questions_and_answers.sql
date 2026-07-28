-- Q1
-- Display all employee and department combinations.
select * from employees
cross JOIN departments;
-- Q2
-- Count total rows after CROSS JOIN.
select count(*) as total_rows FROM employees
cross JOIN departments;

-- Q3
-- Display employee name and department name using CROSS JOIN.
select emp_name, dept_name from employees
cross join departments;

-- Q4
-- If employees has 8 rows and departments has 4 rows,
-- without executing SQL, tell the output row count.
8*4=32

-- Q5
-- What is the difference between CROSS JOIN and INNER JOIN?
cross join doesn't have on clause while inner join have on clause, cross join gives total combination rows of both tables while inner provides common rows from both of the table