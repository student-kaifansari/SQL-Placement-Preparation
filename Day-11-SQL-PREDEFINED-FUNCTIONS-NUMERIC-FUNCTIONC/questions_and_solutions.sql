-- Ab Important Numeric Functions

-- Ye bahut important hain:

-- ✅ ROUND()
-- ✅ CEIL() / CEILING()
-- ✅ FLOOR()
-- ✅ ABS()
-- ✅ MOD()


-- ==========================================
-- Q1
-- Round the average salary to 2 decimal places.

SELECT ROUND(AVG(salary),2)
FROM employee;

-- Output
-- 53437.50


-- ==========================================
-- Q2
-- Round the average salary to the nearest integer.

SELECT ROUND(AVG(salary))
FROM employee;

-- Output
-- 53438


-- ==========================================
-- Q3
-- Display name and rounded salary.

SELECT name, ROUND(salary)
FROM employee;

-- Output
-- Aman    50000
-- Kaif    35000
-- Sara    65000
-- Ali     45000
-- Riya    40000
-- Rahul   70000
-- Neha    42000
-- Arjun   80000

-- Note:
-- Salary is already an integer, so ROUND() doesn't change it.


-- ==========================================
-- Q4
-- Display ROUND(15.678,2).

SELECT ROUND(15.678,2);

-- Output
-- 15.68


-- ==========================================
-- Q5
-- Display ROUND(15.123,2).

SELECT ROUND(15.123,2);

-- Output
-- 15.12


-- ==========================================
-- Q6
-- Display ROUND(99.5).

SELECT ROUND(99.5);

-- Output
-- 100


-- ==========================================
-- Q7
-- Display ROUND(99.4).

SELECT ROUND(99.4);

-- Output
-- 99


-- ==========================================
-- Q8
-- Display ROUND(12345,-1).

SELECT ROUND(12345,-1);

-- Output
-- 12350


-- ==========================================
-- Q9
-- Display ROUND(12345,-2).

SELECT ROUND(12345,-2);

-- Output
-- 12300


-- ==========================================
-- Q10
-- Display ROUND(12345,-3).

SELECT ROUND(12345,-3);

-- Output
-- 12000

-- ============================================================================================

-- ==========================================
-- Q1
-- Display CEIL(15.2).

SELECT CEIL(15.2);

-- Output
-- 16


-- ==========================================
-- Q2
-- Display CEIL(99.1).

SELECT CEIL(99.1);

-- Output
-- 100


-- ==========================================
-- Q3
-- Display FLOOR(15.9).

SELECT FLOOR(15.9);

-- Output
-- 15


-- ==========================================
-- Q4
-- Display FLOOR(99.8).

SELECT FLOOR(99.8);

-- Output
-- 99


-- ==========================================
-- Q5
-- Display CEIL(-10.8).

SELECT CEIL(-10.8);

-- Output
-- -10


-- ==========================================
-- Q6
-- Display FLOOR(-10.8).

SELECT FLOOR(-10.8);

-- Output
-- -11


-- ==========================================
-- Q7
-- Display name and CEIL(salary/1000).

SELECT name, CEIL(salary/1000)
FROM employee;

-- Output
-- Aman    50
-- Kaif    35
-- Sara    65
-- Ali     45
-- Riya    40
-- Rahul   70
-- Neha    42
-- Arjun   80


-- ==========================================
-- Q8
-- Display name and FLOOR(salary/1000).

SELECT name, FLOOR(salary/1000)
FROM employee;

-- Output
-- Aman    50
-- Kaif    35
-- Sara    65
-- Ali     45
-- Riya    40
-- Rahul   70
-- Neha    42
-- Arjun   80


-- ==========================================
-- Q9
-- Display CEIL(AVG(salary)).

SELECT CEIL(AVG(salary))
FROM employee;

-- Output
-- 53438


-- ==========================================
-- Q10
-- Display FLOOR(AVG(salary)).

SELECT FLOOR(AVG(salary))
FROM employee;

-- Output
-- 53437


-- ======================================================================================================

-- ==========================================
-- Q1
-- Display ABS(-50).

SELECT ABS(-50);

-- Output
-- 50


-- ==========================================
-- Q2
-- Display ABS(75).

SELECT ABS(75);

-- Output
-- 75


-- ==========================================
-- Q3
-- Display ABS(-99.99).

SELECT ABS(-99.99);

-- Output
-- 99.99


-- ==========================================
-- Q4
-- Display ABS(0).

SELECT ABS(0);

-- Output
-- 0


-- ==========================================
-- Q5
-- Display name and ABS(salary-50000).

SELECT name, ABS(salary-50000)
FROM employee;

-- Output
-- Aman    0
-- Kaif    15000
-- Sara    15000
-- Ali     5000
-- Riya    10000
-- Rahul   20000
-- Neha    8000
-- Arjun   30000


-- ==========================================
-- Q6
-- Display department and ABS(AVG(salary)-50000).

SELECT department,
       ABS(AVG(salary)-50000) AS salary_difference
FROM employee
GROUP BY department;

-- Output
-- IT       11666.67
-- HR       12500.00
-- Sales     6500.00
-- Finance  30000.00


-- ==========================================
-- Q7
-- Display ABS(-12345).

SELECT ABS(-12345);

-- Output
-- 12345


-- ==========================================
-- Q8
-- Display ABS(12345).

SELECT ABS(12345);

-- Output
-- 12345


-- ==========================================
-- Q9
-- Display ABS(-10.5).

SELECT ABS(-10.5);

-- Output
-- 10.5


-- ==========================================
-- Q10
-- Display ABS(AVG(salary)-50000).

SELECT ABS(AVG(salary)-50000)
FROM employee;

-- Output
-- 3437.50



=====================================================================================================


-- ==========================================
-- Q1
-- Display MOD(25,4).

SELECT MOD(25,4);

-- Output
-- 1


-- ==========================================
-- Q2
-- Display MOD(100,9).

SELECT MOD(100,9);

-- Output
-- 1


-- ==========================================
-- Q3
-- Display MOD(50,5).

SELECT MOD(50,5);

-- Output
-- 0


-- ==========================================
-- Q4
-- Display 35 % 6.

SELECT 35 % 6;

-- Output
-- 5


-- ==========================================
-- Q5
-- Display employee IDs that are even.

SELECT emp_id
FROM employee
WHERE MOD(emp_id,2)=0;

-- Output
-- 2
-- 4
-- 6
-- 8


-- ==========================================
-- Q6
-- Display employee IDs that are odd.

SELECT emp_id
FROM employee
WHERE MOD(emp_id,2)=1;

-- Output
-- 1
-- 3
-- 5
-- 7


-- ==========================================
-- Q7
-- Display employees whose salary is divisible by 5000.

SELECT *
FROM employee
WHERE MOD(salary,5000)=0;

-- Output
-- Aman
-- Kaif
-- Sara
-- Ali
-- Riya
-- Rahul
-- Arjun
--
-- (Neha is not included because 42000 is not divisible by 5000)


-- ==========================================
-- Q8
-- Display employees whose salary is NOT divisible by 5000.

SELECT *
FROM employee
WHERE MOD(salary,5000)<>0;

-- Output
-- Neha


-- ==========================================
-- Q9
-- Display MOD(99,10).

SELECT MOD(99,10);

-- Output
-- 9


-- ==========================================
-- Q10
-- Display name, salary and MOD(salary,10000).

SELECT name,
       salary,
       MOD(salary,10000)
FROM employee;

-- Output
-- Aman    50000    0
-- Kaif    35000    5000
-- Sara    65000    5000
-- Ali     45000    5000
-- Riya    40000    0
-- Rahul   70000    0
-- Neha    42000    2000
-- Arjun   80000    0