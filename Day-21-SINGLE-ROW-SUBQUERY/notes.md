<!-- 
Single Row Subquery

Definition:

A subquery that returns exactly one row is called a Single Row Subquery.

Ye operators ke saath use hoti hai:

=
>
<
>=
<=
<>
Example 1

Question:

Display employees whose salary is greater than the average salary.

Pehle socho.

Average salary kitni hai?

SELECT AVG(salary)
FROM employees;

Hamare data me:

(50000 + 45000 + 60000 + 55000 + 40000)
/ 5

= 50000

Ab query:

SELECT emp_name, salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
); -->


<!-- 
⭐ Interview Trap

Interviewer poochta hai:

"Har row ke liye inner query execute hogi?"

Is query me?

❌ No

Ye Single Row Subquery hai.

Sirf 1 baar execute hogi.

⚠️ Correlated Subquery me inner query har row ke liye execute hoti hai. Wo hum baad me padhenge.

📌 Rule #1 (Likho Notes me)

Single Row Subquery is executed only once because it returns a single value before the outer query starts.

Example 2 (= Operator)
Question

Find the employee whose salary is equal to the highest salary.

SELECT emp_name, salary
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);
Execution

Step 1

SELECT MAX(salary)
FROM employees;

Output:

60000

Step 2

SQL internally ban jayegi:

SELECT emp_name, salary
FROM employees
WHERE salary = 60000;

Output:

emp_name	salary
Sara	60000
Example 3 (< Operator)
Question

Find employees whose salary is less than the minimum salary.

SELECT emp_name, salary
FROM employees
WHERE salary <
(
    SELECT MIN(salary)
    FROM employees
);
Socho...

MIN(salary) = 40000

Ab query banegi:

WHERE salary < 40000

Hamare dataset me koi employee ki salary 40000 se kam nahi hai.

Output

Empty Set -->

<!-- 
📌 Interview Note

Abhi tak tumne sirf Single Row Subquery padhi hai.

Isliye tumne har jagah:

=
>
<

ka use kiya.

Ye bilkul sahi approach hai. -->