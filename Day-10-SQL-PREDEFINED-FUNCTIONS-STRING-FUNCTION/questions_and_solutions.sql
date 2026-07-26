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


-- ===================================================


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



-- ============================================


-- Q1
-- Display employee name with "Mr." before every name.
select concat('Mr. ', name) from employee;
-- Q2
-- Display employee name followed by city.
-- Example: Aman - Delhi
select concat(name,' - ', city) from employee;
-- Q3
-- Display:
-- Aman works in IT
select concat(name,' works in ', department) from employee;
-- Q4
-- Display:
-- Kaif earns Rs.35000
select concat(name,' earns Rs. ',salary) from employee;
-- Q5
-- Display employee name and age.
-- Example:
-- Aman (25)
select concat(name,' (',age,')') from employee;
-- Q6
-- Display:
-- Employee: Aman
select concat('Employee: ',name) from employee;
-- Q7
-- Display:
-- City: Delhi
select concat('City: ',city) from employee;
-- Q8
-- Display:
-- Department - Salary
-- Example:
-- IT - 50000
select concat(department,' - ',salary) from employee;
-- Q9
-- Display:
-- Aman from Delhi
select concat(name, ' from ',city) from employee;
-- Q10
-- Display:
-- Aman | IT | Delhi

select concat(name,' | ',department,' | ',city) from employee;



-- ==================================================


-- Q1
-- Display:
-- Aman | IT | Delhi
select concat_ws(' | ',name,department,city) from employee;

-- Q2
-- Display:
-- Aman - IT - Delhi
select concat_ws(' - ',name,department,city) from employee;
-- Q3
-- Display:
-- Aman, IT, Delhi
select concat_ws(', ',name,department,city) from employee;
-- Q4
-- Display:
-- Kaif -> HR -> Noida
select concat_ws(' -> ',name,department,city) from employee;
-- Q5
-- Display:
-- Aman / Delhi
select concat_ws(' / ',name,city) from employee;
-- Q6
-- Display:
-- IT : Delhi
select concat_ws(' : ',department,city) from employee;
-- Q7
-- Display:
-- Name | City
select concat_ws(' | ',name,city) from employee;
-- Q8
-- Display:
-- Name, Salary
select concat_ws(' , ',name,salary) from employee;
-- Q9
-- Display:
-- Department -> Salary -> City
select concat_ws(' -> ',department,salary,city) from employee;
-- Q10
-- Display:
-- Name - Age - Department - City
select concat_ws(' - ',name,age,department,city) from employee;



-- =========================================




-- Q1
-- Display first 2 characters of every employee name.
select SUBSTRING(name,1,2) from employee;
-- Q2
-- Display first 3 characters of every city.
select SUBSTRING(city,1,3) from employee;

-- Q3
-- Display last 2 characters of every employee name.
select SUBSTRING(name,-2) from employee;
-- OR
select SUBSTRING(name,-2,2) from employee;
-- Q4
-- Display last 3 characters of every department.
SELECT SUBSTRING(department,-3) from employee;
-- Q5
-- Display first character of every employee name.
select SUBSTRING(name,1,1) from employee;

-- Q6
-- Display second character of every employee name.
select SUBSTRING(name,2,1) from employee;

-- Q7
-- Display first 4 characters of every city.
select SUBSTRING(city,1,4) from employee;
-- Q8
-- Display employee name and first 2 characters of department.
select name, SUBSTRING(department,1,2) from employee;
-- Q9
-- Display employee name and last character of city.
select name,SUBSTRING(city,-1) from employee;
-- Q10
-- Display first 3 characters of employee name and first 2 characters of city.
select SUBSTRING(name,1,3), SUBSTRING(city,1,2) from employee;



-- =========================================


-- Q1
-- Display first 2 characters of every employee name using LEFT().
select left(name, 2) from employee;
-- Q2
-- Display last 2 characters of every employee name using RIGHT().
select right(name, 2) from employee;
-- Q3
-- Display first 3 characters of every city.
select left(city,3) from employee;

-- Q4
-- Display last 3 characters of every city.
select DISTINCT RIGHT(city,3) from employee; -- yha distinct unnecessary hai, every city bola gya hai na
select right(city,3) from employee;
-- Q5
-- Display first character of every department.
select left(department,1) from employee;
-- Q6
-- Display last character of every department.
select right(department,1) from employee;
-- Q7
-- Display employee name and first 2 characters of city.
select name, left(city,2) from employee;
-- Q8
-- Display employee name and last 2 characters of city.
select name, right(city,2) from employee;
-- Q9
-- Display first 4 characters of department and last 2 characters of department.
select left(department,4), right(department,2) from employee;
-- Q10
-- Display employee name, first character of name, and last character of name.
select name, left(name,1), right(name,1) from employee;


-- ========================================


-- Q1
-- Remove spaces from both sides of '   Aman   '.
select trim('   Aman   ') ;
-- Q2
-- Remove left spaces from '   Kaif'.
select ltrim('   Kaif') ;
-- Q3
-- Remove right spaces from 'Kaif   '.
select rtrim('Kaif   ');
-- Q4
-- Apply TRIM() on employee names.
select trim(name) from employee;
-- Q5
-- Apply LTRIM() on city.
select ltrim(city) from employee;

-- Q6
-- Apply RTRIM() on department.
select rtrim(department) from employee;

-- Q7
-- Display employee name after trimming spaces.
select trim(name) from employee;
-- Q8
-- Display city after removing left spaces.
select ltrim(city) from employee;
-- Q9
-- Display department after removing right spaces.
select rtrim(department) from employee;
-- Q10
-- Display TRIM(name), LTRIM(city), RTRIM(department).
select trim(name), ltrim(city), rtrim(department) from employee;


-- ==========================================

-- Q1
-- Replace 'IT' with 'Tech' in department.
select replace(department,'IT','Tech') from employee;
-- Q2
-- Replace 'Delhi' with 'New Delhi' in city.
SELECT replace(city,'Delhi','New Delhi') from employee;
-- Q3
-- Remove spaces from 'Kaif Ansari'.
select replace('Kaif Ansari',' ','');
-- Q4
-- Replace 'a' with '@' in employee names.
select replace(name, 'a','@') from employee;
-- Q5
-- Replace 'Sales' with 'Marketing' in department.
select REPLACE(department,'Sales','Marketing') from employee;
-- Q6
-- Replace 'o' with '0' in city.
select REPLACE(city,'o','0') from employee;
-- Q7
-- Display employee name after replacing 'a' with '*'.
select replace(name,'a','*')  from employee;
-- Q8
-- Display city after replacing 'i' with '1'.
select replace(city,'i','1') from employee;
-- Q9
-- Replace 'Finance' with 'Accounts' in department.
select REPLACE(department,'Finance','Accounts') from employee;
-- Q10
-- Replace 'e' with 'E' in employee names.
select replace(name,'e','E') from employee;


-- ==================================


-- Q1
-- Reverse every employee name.
select reverse(name) from employee;
-- Q2
-- Reverse every city.
select REVERSE(city) from employee;
-- Q3
-- Reverse every department.
select reverse(department) from employee;
-- Q4
-- Display employee name and its reverse.
select name, REVERSE(name) from employee;
-- Q5
-- Display city and its reverse.
select city, reverse(city) from employee;
-- Q6
-- Reverse the string 'Database'.
select reverse('Database');
-- Q7
-- Reverse the string 'SQL123'.
select reverse('SQL123');
-- Q8
-- Reverse the string 'Kaif Ansari'.
select reverse('Kaif Ansari');
-- Q9
-- Reverse employee name and city.
select reverse(name), reverse(city) from employee;
-- Q10
-- Display REVERSE(name), REVERSE(city), REVERSE(department).
select reverse(name), reverse(city), reverse(department) from employee;


-- ====================================


-- Q1
-- Find position of 'a' in every employee name using INSTR().
select instr(name,'a') from employee;
-- Q2
-- Find position of 'i' in every city using INSTR().
select instr(city,'i') from employee;
-- Q3
-- Find position of 'T' in department.
select instr(department,'T') from employee;
-- Q4
-- Find position of 'e' in city using LOCATE().
select locate('e',city) from employee;
-- Q5
-- Find position of 'a' in employee name using LOCATE().
select locate('a',name) from employee;
-- Q6
-- Find position of 'l' in city.
select locate('l',city) from employee;
-- OR
select instr(city,'l') from employee;
-- Q7
-- Find position of 'r' in employee name.
select locate('r',name) from employee;

-- Q8
-- Find position of 'H' in department.
select instr(department,'H') from employee;
-- Q9
-- Find position of 'u' in city.
select instr(city,'u') from employee;
-- Q10
-- Display name, INSTR(name,'a'), LOCATE('a',name).
select name, instr(name,'a'), locate('a',name) from employee;


-- ==========================================
-- Q1
-- Find ASCII value of every employee name.

SELECT ASCII(name)
FROM employee;

-- Output (Based on current data)
-- Aman   -> 65
-- Kaif   -> 75
-- Sara   -> 83
-- Ali    -> 65
-- Riya   -> 82
-- Rahul  -> 82
-- Neha   -> 78
-- Arjun  -> 65


-- ==========================================
-- Q2
-- Find ASCII value of every city.

SELECT ASCII(city)
FROM employee;

-- Output
-- Delhi    -> 68
-- Noida    -> 78
-- Delhi    -> 68
-- Lucknow  -> 76
-- Noida    -> 78
-- Mumbai   -> 77
-- Delhi    -> 68
-- Pune     -> 80


-- ==========================================
-- Q3
-- Find ASCII value of every department.

SELECT ASCII(department)
FROM employee;

-- Output
-- IT       -> 73
-- HR       -> 72
-- IT       -> 73
-- Sales    -> 83
-- HR       -> 72
-- IT       -> 73
-- Sales    -> 83
-- Finance  -> 70


-- ==========================================
-- Q4
-- Display employee name and ASCII value of first character.

SELECT name, ASCII(name)
FROM employee;

-- Output
-- Aman    65
-- Kaif    75
-- Sara    83
-- Ali     65
-- Riya    82
-- Rahul   82
-- Neha    78
-- Arjun   65


-- ==========================================
-- Q5
-- Display city and ASCII value of first character.

SELECT city, ASCII(city)
FROM employee;

-- Output
-- Delhi     68
-- Noida     78
-- Delhi     68
-- Lucknow   76
-- Noida     78
-- Mumbai    77
-- Delhi     68
-- Pune      80


-- ==========================================
-- Q6
-- Display CHAR(65).

SELECT CHAR(65);

-- Output
-- A


-- ==========================================
-- Q7
-- Display CHAR(97).

SELECT CHAR(97);

-- Output
-- a


-- ==========================================
-- Q8
-- Display CHAR(72,73).

SELECT CHAR(72,73);

-- Output
-- HI


-- ==========================================
-- Q9
-- Display ASCII('Z').

SELECT ASCII('Z');

-- Output
-- 90


-- ==========================================
-- Q10
-- Display ASCII('9').

SELECT ASCII('9');

-- Output
-- 57