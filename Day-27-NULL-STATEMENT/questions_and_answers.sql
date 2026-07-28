DROP TABLE IF EXISTS employees_bonus;

CREATE TABLE employees_bonus
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    bonus INT
);

INSERT INTO employees_bonus VALUES
(101,'Aman',50000,5000),
(102,'Kaif',35000,NULL),
(103,'Sara',65000,7000),
(104,'Ali',45000,NULL),
(105,'Riya',40000,3000),
(106,'Rahul',70000,NULL);

SELECT * FROM employees_bonus;
-- ============================================
-- Q1
-- Show employee name and display 0 if bonus is NULL.
-- ============================================

SELECT
    name,
    IFNULL(bonus, 0) AS Bonus
FROM employees_bonus;


-- ============================================
-- Q2
-- Show employee name and display 'No Bonus'
-- if bonus is NULL.
-- ============================================

SELECT
    name,
    IFNULL(bonus, 'No Bonus') AS Bonus
FROM employees_bonus;


-- ============================================
-- Q3
-- Calculate Total Salary
-- Salary + Bonus
-- NULL bonus should be treated as 0.
-- ============================================

SELECT
    name,
    salary,
    bonus,
    salary + IFNULL(bonus, 0) AS Total_Salary
FROM employees_bonus;


-- ============================================
-- Q4
-- Display bonus.
-- If NULL show 1000.
-- ============================================

SELECT
    name,
    IFNULL(bonus, 1000) AS Bonus
FROM employees_bonus;


-- ============================================
-- Q5
-- Show employee name and bonus.
-- If NULL show 'Pending'.
-- ============================================

SELECT
    name,
    IFNULL(bonus, 'Pending') AS Bonus
FROM employees_bonus;




-- ==========================================================
-- COALESCE() Practice Questions with Solutions
-- ==========================================================

-- Q1
-- Show employee name and bonus.
-- If bonus is NULL, display 0.

SELECT
    name,
    COALESCE(bonus, 0) AS Bonus
FROM employees_bonus;


-- ==========================================================

-- Q2
-- Show employee name and bonus.
-- If bonus is NULL, display 5000.

SELECT
    name,
    COALESCE(bonus, 5000) AS Bonus
FROM employees_bonus;


-- ==========================================================

-- Q3
-- Show employee name and bonus.
-- If bonus is NULL, display 'Pending'.

SELECT
    name,
    COALESCE(bonus, 'Pending') AS Bonus
FROM employees_bonus;


-- ==========================================================

-- Q4
-- Calculate Total Salary.
-- NULL bonus should be treated as 0.

SELECT
    name,
    salary,
    bonus,
    salary + COALESCE(bonus, 0) AS Total_Salary
FROM employees_bonus;


-- ==========================================================

-- Q5
-- Return the first non-NULL value.

SELECT COALESCE(NULL, NULL, 100, 200) AS Result;


-- ==========================================================

-- Q6
-- Return the first non-NULL string.

SELECT COALESCE(NULL, NULL, 'SQL', 'MySQL') AS Result;


-- ==========================================================

-- Q7
-- Return the first available value.

SELECT COALESCE(NULL, 10, 20, 30) AS Result;


-- ==========================================================

-- Q8
-- Return the first available city.

SELECT COALESCE(NULL, NULL, 'Delhi', 'Noida') AS City;


-- ==========================================================

-- Q9
-- Display bonus.
-- If NULL show salary instead.

SELECT
    name,
    salary,
    bonus,
    COALESCE(bonus, salary) AS Bonus_or_Salary
FROM employees_bonus;


-- ==========================================================

-- Q10
-- Display bonus.
-- If NULL show salary.
-- If salary is also NULL then show 0.

SELECT
    name,
    COALESCE(bonus, salary, 0) AS Final_Value
FROM employees_bonus;


-- ==========================================================

-- Q11
-- Return first non-NULL number.

SELECT COALESCE(NULL, NULL, NULL, 500) AS Result;


-- ==========================================================

-- Q12
-- Return first non-NULL string.

SELECT COALESCE(NULL, 'HR', 'IT', 'Sales') AS Department;


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =====================================================
-- NULLIF() Practice Questions
-- =====================================================

-- Q1
-- Return NULL if 100 and 100 are equal.

SELECT NULLIF(100,100) AS Result;


-- =====================================================

-- Q2
-- Compare 100 and 200.

SELECT NULLIF(100,200) AS Result;


-- =====================================================

-- Q3
-- Compare 'SQL' and 'SQL'.

SELECT NULLIF('SQL','SQL') AS Result;


-- =====================================================

-- Q4
-- Compare 'SQL' and 'MYSQL'.

SELECT NULLIF('SQL','MYSQL') AS Result;


-- =====================================================

-- Q5
-- Show employee name and bonus.
-- If bonus is 3000 then display NULL.

SELECT
    name,
    bonus,
    NULLIF(bonus,3000) AS Result
FROM employees_bonus;


-- =====================================================

-- Q6
-- Show employee name and salary.
-- If salary is 50000 then display NULL.

SELECT
    name,
    salary,
    NULLIF(salary,50000) AS Result
FROM employees_bonus;


-- =====================================================

-- Q7
-- Compare two numbers.

SELECT NULLIF(25,25) AS Result;


-- =====================================================

-- Q8
-- Compare two strings.

SELECT NULLIF('HR','IT') AS Result;


-- =====================================================

-- Q9
-- Return NULL if values are equal.

SELECT NULLIF(999,999) AS Result;


-- =====================================================

-- Q10
-- Compare NULL and NULL.

SELECT NULLIF(NULL,NULL) AS Result;