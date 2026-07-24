-- ===========================================================
-- Day 04 : LIKE
-- Difficulty : Easy
-- ===========================================================

-- Q1 Display employees whose name starts with 'A'.

SELECT *
FROM Employee
WHERE name LIKE 'A%';

-- ===========================================================

-- Q2 Display employees whose name ends with 'a'.

SELECT *
FROM Employee
WHERE name LIKE '%a';

-- ===========================================================

-- Q3 Display employees whose name contains 'a'.

SELECT *
FROM Employee
WHERE name LIKE '%a%';

-- ===========================================================

-- Q4 Display employees whose city starts with 'D'.

SELECT *
FROM Employee
WHERE city LIKE 'D%';

-- ===========================================================

-- Q5 Display employees whose department ends with 'T'.

SELECT *
FROM Employee
WHERE department LIKE '%T';

-- ===========================================================

-- Q6 Display employees whose name has exactly 4 characters.

SELECT *
FROM Employee
WHERE name LIKE '____';

-- ===========================================================

-- Q7 Display employees whose name starts with 'R' and has exactly 5 characters.

SELECT *
FROM Employee
WHERE name LIKE 'R____';

-- ===========================================================

-- Q8 Display employees whose city contains 'o'.

SELECT *
FROM Employee
WHERE city LIKE '%o%';

-- ===========================================================

-- Q9 Display employees whose department starts with 'S'.

SELECT *
FROM Employee
WHERE department LIKE 'S%';

-- ===========================================================

-- Q10 Display employees whose name does not start with 'A'.

SELECT *
FROM Employee
WHERE name NOT LIKE 'A%';

-- ===========================================================

-- Q11 Display employees whose city does not contain 'o'.

SELECT *
FROM Employee
WHERE city NOT LIKE '%o%';

-- ===========================================================

-- Q12 Display employees whose department contains 'a'.

SELECT *
FROM Employee
WHERE department LIKE '%a%';

-- ===========================================================