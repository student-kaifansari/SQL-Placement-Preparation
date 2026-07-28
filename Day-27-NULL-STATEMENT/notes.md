<!-- NULL Functions ⭐⭐⭐⭐⭐

Aaj hum padhenge:

IFNULL()
COALESCE()
NULLIF()

Ye teeno interviews me bahut pooche jaate hain.

Pehle NULL samajhte hain

NULL ka matlab 0, blank ya empty string nahi hota.

NULL ka matlab:

Value Unknown / Missing

Example:

emp_id	name	bonus
101	Aman	5000
102	Kaif	NULL
103	Sara	7000

Kaif ka bonus 0 nahi hai, balki pata hi nahi.

Practice Table

Ye table bana lo.

DROP TABLE IF EXISTS employees_bonus;

CREATE TABLE employees_bonus
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    bonus INT
);

Insert Data

INSERT INTO employees_bonus VALUES
(101,'Aman',50000,5000),
(102,'Kaif',35000,NULL),
(103,'Sara',65000,7000),
(104,'Ali',45000,NULL),
(105,'Riya',40000,3000),
(106,'Rahul',70000,NULL);
Check Data
SELECT * FROM employees_bonus;

Output

emp_id	name	salary	bonus
101	Aman	50000	5000
102	Kaif	35000	NULL
103	Sara	65000	7000
104	Ali	45000	NULL
105	Riya	40000	3000
106	Rahul	70000	NULL
Problem

Suppose HR bolta hai:

Agar bonus NULL hai to uski jagah 0 dikhao.

Without IFNULL

SELECT
name,
bonus
FROM employees_bonus;

Output

name	bonus
Aman	5000
Kaif	NULL
Sara	7000
IFNULL()
Syntax
IFNULL(expression, value_if_null)

Agar expression NULL hua to second value return hogi.

Example 1
SELECT
name,
bonus,
IFNULL(bonus,0) AS Final_Bonus
FROM employees_bonus;

Output

name	bonus	Final_Bonus
Aman	5000	5000
Kaif	NULL	0
Sara	7000	7000
Ali	NULL	0
Riya	3000	3000
Rahul	NULL	0
Execution

For Aman

bonus = 5000

NULL ?

NO

Return 5000

For Kaif

bonus = NULL

NULL ?

YES

Return 0
Example 2

Instead of 0

SELECT
name,
IFNULL(bonus,'Not Assigned') AS Bonus
FROM employees_bonus;

Output

name	Bonus
Aman	5000
Kaif	Not Assigned
Sara	7000
Ali	Not Assigned
Placement Question 1

Show total salary received.

Salary + Bonus

SELECT
name,
salary + IFNULL(bonus,0) AS Total_Salary
FROM employees_bonus;

Output

name	Total_Salary
Aman	55000
Kaif	35000
Sara	72000
Ali	45000
Riya	43000
Rahul	70000
Interview Trick

Without IFNULL

SELECT
salary + bonus
FROM employees_bonus;

For Kaif

35000 + NULL

Output?

NULL

Kyun?

SQL me arithmetic ke saath NULL aa gaya to result bhi NULL ho jata hai.

Isliye:

salary + IFNULL(bonus,0)

bahut common interview pattern hai. -->


<!-- 
⭐ Placement Interview Questions
Q1. IFNULL() ka syntax kya hai?
IFNULL(expression, value_if_null)
Q2. IFNULL() kab use karte hain?

Jab kisi NULL value ko kisi default value se replace karna ho.

Example:

SELECT IFNULL(bonus, 0)
FROM employees_bonus;
Q3. salary + bonus aur salary + IFNULL(bonus, 0) me kya difference hai?
salary + bonus

Agar bonus = NULL hai to result bhi NULL hoga.

Lekin:

salary + IFNULL(bonus, 0)

Agar bonus = NULL hai to 0 treat hoga aur calculation sahi hogi.

Q4. Kya IFNULL() ANSI SQL Standard hai?

❌ Nahi.

Standard function hai:

COALESCE()

Ye MySQL-specific function hai. -->


=========================================================================


<!-- 
COALESCE() ⭐⭐⭐⭐⭐
COALESCE() kya hai?

COALESCE() left se right check karta hai aur pehli non-NULL value return karta hai.

Syntax
COALESCE(value1, value2, value3, ...)
Rule
Check value1

↓

NULL?

YES

↓

Check value2

↓

NULL?

YES

↓

Check value3

↓

NULL?

NO

↓

Return value3
Example 1

Suppose

Bonus = NULL

Query

SELECT
    name,
    bonus,
    COALESCE(bonus, 0) AS Final_Bonus
FROM employees_bonus;

Output

name	bonus	Final_Bonus
Aman	5000	5000
Kaif	NULL	0
Sara	7000	7000
Ali	NULL	0
Riya	3000	3000
Rahul	NULL	0
Ye to IFNULL jaisa hi hai 🤔

Haan!

Jab sirf 2 values hoti hain

IFNULL(bonus,0)

aur

COALESCE(bonus,0)

Dono same output dete hain.

Difference
IFNULL()

Sirf 2 arguments

IFNULL(bonus,0)
COALESCE()

Unlimited arguments

COALESCE(bonus,incentive,commission,0)

Ye bahut powerful hai.

Example 2

Suppose

Bonus = NULL

Incentive = NULL

Commission = 5000

Query

SELECT
COALESCE(NULL,NULL,5000,0);

Output

5000

Execution

NULL ?

↓

YES

↓

NULL ?

↓

YES

↓

5000 ?

↓

Return 5000
Example 3
SELECT
COALESCE(NULL,NULL,NULL,100);

Output

100
Example 4
SELECT
COALESCE(10,20,30);

Output

10

Kyun?

Pehli value NULL hi nahi hai.

Example 5
SELECT
COALESCE(NULL,'SQL','MySQL');

Output

SQL
Employees Table Example
SELECT
    name,
    salary,
    COALESCE(bonus,0) AS Bonus
FROM employees_bonus;

Output

Same as IFNULL.

Placement Example

Total Salary

SELECT
    name,
    salary + COALESCE(bonus,0) AS Total_Salary
FROM employees_bonus;

Output

name	Total_Salary
Aman	55000
Kaif	35000
Sara	72000
Ali	45000
Riya	43000
Rahul	70000
IFNULL vs COALESCE
IFNULL	COALESCE
MySQL Specific	ANSI SQL Standard
2 arguments	Unlimited arguments
Less Flexible	More Flexible
MySQL only	MySQL, PostgreSQL, SQL Server, Oracle
Interview Recommendation ⭐⭐⭐⭐⭐

Interviewer puche:

IFNULL aur COALESCE me kya difference hai?

Best answer:

IFNULL sirf MySQL me use hota hai aur 2 arguments leta hai. COALESCE ANSI SQL Standard hai aur multiple arguments support karta hai. Isliye production code aur interviews me generally COALESCE prefer kiya jata hai. -->


<!-- 
🎯 Placement Interview Tip

IFNULL()

IFNULL(bonus, 0)

COALESCE()

COALESCE(bonus, 0)

👉 Agar sirf 2 values hain, to dono same result denge.

Lekin agar 3 ya usse zyada values check karni hain:

COALESCE(bonus, incentive, commission, 0)

To sirf COALESCE() use kar sakte ho. -->


===========================================================================================


<!-- 
NULLIF() ⭐⭐⭐⭐⭐

Ye chhota topic hai, lekin TCS, Infosys, Accenture, Cognizant, Capgemini aur product-based companies me poocha jata hai.

NULLIF() Kya Hai?

NULLIF() do values compare karta hai.

Agar dono values equal hain → NULL return karta hai.
Agar equal nahi hain → First value return karta hai.
Syntax
NULLIF(expression1, expression2)
Rule
expression1 == expression2 ?

        YES
         ↓
      Return NULL

        NO
         ↓
 Return expression1
Example 1
SELECT NULLIF(10,10) AS Result;
Output
Result
NULL
Example 2
SELECT NULLIF(10,20) AS Result;
Output
Result
10
Example 3
SELECT NULLIF('SQL','SQL') AS Result;
Output
Result
NULL
Example 4
SELECT NULLIF('SQL','MYSQL') AS Result;
Output
Result
SQL
Example 5
SELECT
    name,
    bonus,
    NULLIF(bonus,5000) AS Result
FROM employees_bonus;
Output
name	bonus	Result
Aman	5000	NULL
Kaif	NULL	NULL
Sara	7000	7000
Ali	NULL	NULL
Riya	3000	3000
Rahul	NULL	NULL
Execution

For Aman

bonus = 5000

5000 == 5000 ?

YES

↓

Return NULL

For Sara

bonus = 7000

7000 == 5000 ?

NO

↓

Return 7000
Real Interview Use

Suppose

Marks = 0

0 ka matlab hai student absent.

Tum 0 ko NULL banana chahte ho.

SELECT
NULLIF(0,0);

Output

NULL
Sabse Important Use (Divide by Zero)

Suppose

SELECT salary/bonus
FROM employees_bonus;

Agar bonus 0 hua to error aa sakta hai.

Safe way:

salary / NULLIF(bonus,0)

Agar bonus = 0

NULLIF(0,0)

↓

NULL

↓

salary/NULL

↓

NULL

Error nahi aayega.

Ye bahut famous interview question hai.

IFNULL vs COALESCE vs NULLIF
Function	Purpose
IFNULL(x,y)	NULL ko replace karta hai
COALESCE(a,b,c)	First non-NULL value return karta hai
NULLIF(a,b)	Equal hone par NULL return karta hai -->

<!-- 
🎯 Interview Questions
Q1. NULLIF() kya karta hai?

Answer:
Agar dono values equal hoti hain to NULL return karta hai, warna pehli value return karta hai.

Q2. NULLIF() ka real-world use?

Answer:
Divide-by-zero error avoid karne ke liye.

Example:

salary / NULLIF(bonus,0) -->