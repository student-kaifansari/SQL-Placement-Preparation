-- Part-1 : String Functions
-- UPPER()
-- LOWER()
-- LENGTH()
-- CHAR_LENGTH()
-- CONCAT()
-- CONCAT_WS()
-- SUBSTRING()/SUBSTR()
-- LEFT()
-- RIGHT()
-- TRIM()
-- LTRIM()
-- RTRIM()
-- REPLACE()
-- REVERSE()
-- INSTR()
-- LOCATE()
-- POSITION()
-- LPAD()
-- RPAD()


-- Q1
-- Display all employee names in uppercase.
select upper(name) from employee;
-- Q2
-- Display all department names in uppercase.
select upper(department) from employee;
-- Q3
-- Display all city names in lowercase.
select lower(city) from employee;
-- Q4
-- Display employee name in lowercase and department in uppercase.
select lower(name), upper(department) from employee;
-- Q5
-- Display employee name and its uppercase version.
select name, upper(name) from employee;
-- Q6
-- Display employee name and its lowercase version.
select name, lower(name) from employee;
-- Q7
-- Find employees whose name is 'kaif' (ignore case).
SELECT *
FROM employee
WHERE UPPER(name)='KAIF';

-- Ya

SELECT *
FROM employee
WHERE LOWER(name)='kaif';
-- Q8
-- Find employees whose department is 'it' (ignore case).
select * from employee where lower(department)='it';
-- Q9
-- Display all cities in uppercase.
select upper(city) from employee;

-- Q10
-- Display all departments in lowercase.
select lower(department) from employee;


===================================================


-- Q1
-- Display employee name and its length.
select name, LENGTH(name) from employee;
-- Q2
-- Display department name and its length.
select department, LENGTH(department) from employee;
-- Q3
-- Find employees whose name length is exactly 4.
select name from employee where name like '____';
-- OR
select name from employee where length(name)=4;
-- OR
select name from employee where char_length(name)=4;

-- Q4
-- Find employees whose name length is greater than 4.
select name from employee where length(name)>4;
-- OR
select name from employee where name like '_____%';
-- OR
select name from employee where CHAR_LENGTH(name)>4;
-- Q5
-- Find departments whose name length is less than 3.
select DISTINCT department from employee where length(name)<3;
-- Q6
-- Display city name and its length.
select city, length(city) from employee;
-- Q7
-- Find cities whose length is exactly 5.
select distinct city from employee where length(city)=5;

-- Q8
-- Display employee name, department and length of department.
select name, department, length(department) from employee;
-- Q9
-- Display employee name whose city name has more than 5 characters.
select name from employee where char_length(city)>5;
-- Q10
-- Display employee names ordered by their name length (smallest to largest).
SELECT name
FROM employee
ORDER BY LENGTH(name);