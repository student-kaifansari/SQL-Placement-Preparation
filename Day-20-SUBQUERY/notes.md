<!-- What is a Subquery?

Sabse pehle definition.

A query written inside another SQL query is called a Subquery.

Simple Hindi me:

Ek SQL query ke andar doosri SQL query likhna hi Subquery hai.

Real Life Example

Socho tum apne dost se bolte ho:

"Mujhe us employee ka naam batao jiski salary sabse zyada hai."

Computer ko pehle ye nahi pata ki sabse zyada salary kitni hai.

Isliye wo pehle ye nikalega:

SELECT MAX(salary)
FROM employees;

Output

60000

Ab computer ke paas value aa gayi.

Fir wo chalega:

SELECT emp_name
FROM employees
WHERE salary = 60000;

Output

emp_name
Sara

Ab socho ye dono query alag-alag likhne ki jagah ek hi query me likh dein.

SELECT emp_name
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

Ye hi Subquery hai.

Execution Order

Ye interview ka favorite question hai.

Query:

SELECT emp_name
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

Execution:

Step 1

Inner Query chalegi.

SELECT MAX(salary)
FROM employees;

Result

60000
Step 2

Ab SQL query ban jayegi

SELECT emp_name
FROM employees
WHERE salary = 60000;

Output

emp_name
Sara
Golden Rule ⭐⭐⭐⭐⭐

Subquery hamesha pehle execute hoti hai.

Is line ko yaad kar lo.

Syntax
SELECT columns
FROM table
WHERE column operator (
    SELECT ...
);
Subquery Kahan Kahan Likhi Ja Sakti Hai?

Ye bahut important interview question hai.

Subquery likh sakte ho:

✅ WHERE

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

✅ FROM

SELECT *
FROM (
    SELECT *
    FROM employees
) AS temp;

✅ SELECT

SELECT
    emp_name,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS average_salary
FROM employees;

✅ HAVING

SELECT dept_id,
       AVG(salary)
FROM employees
GROUP BY dept_id
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM employees
);
Types of Subquery

Placement me mainly 4 types aate hain.

1. Single Row Subquery ⭐⭐⭐⭐⭐

Returns only one value.

Example

SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
2. Multiple Row Subquery ⭐⭐⭐⭐⭐

Returns multiple values.

Example

SELECT *
FROM employees
WHERE dept_id IN
(
    SELECT dept_id
    FROM departments
);
3. Correlated Subquery ⭐⭐⭐⭐⭐

Ye har row ke liye dobara execute hoti hai.

Isi type ka question tha:

Highest salary employee in each department.

Isko hum detail me baad me padhenge.

4. Nested Subquery

Subquery ke andar bhi Subquery.

Example

SELECT *
FROM employees
WHERE dept_id =
(
    SELECT dept_id
    FROM departments
    WHERE manager_id =
    (
        SELECT emp_id
        FROM employees
        WHERE emp_name='Aman'
    )
); -->

<!-- 
✅ Q1

Your Answer:

Inner

✔ Correct (10/10)

Interview answer:

Subquery (Inner Query) executes first, then Outer Query executes.

✅ Q2

Your Answer:

E

✔ Correct (10/10)

Subquery can be written in:

WHERE
HAVING
FROM
SELECT
✅ Q3

Your Answer:

Single

✔ Correct (10/10)

Reason:

SELECT AVG(salary)
FROM employees;

Ye sirf ek value return karta hai.

⚠️ Q4

Tumne likha:

return those employees name where salary is equal to max_salary of all employees

Concept bilkul sahi hai. 👍

Lekin interview me agar poochha jaye:

"What will be the output?"

To actual output batana hota hai.

Hamare dataset me:

emp_name	salary
Aman	50000
Kaif	45000
Sara	60000
Rahul	55000
Neha	40000

Maximum salary = 60000

Output:

emp_name
Sara

✔ Concept correct tha, bas actual output bhi batana tha.

Score: 9/10

📌 Important Interview Point

Subquery do cheezein return kar sakti hai:

1. Value
SELECT MAX(salary)
FROM employees;

Returns:

60000
2. Table (Result Set)
SELECT *
FROM (
    SELECT *
    FROM employees
) AS temp;

Returns a complete table.

Isliye ye mat sochna ki subquery hamesha sirf ek value return karti hai. -->