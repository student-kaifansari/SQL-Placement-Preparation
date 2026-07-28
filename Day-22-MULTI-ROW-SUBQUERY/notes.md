<!-- Multi Row Subquery
Sabse Pehle Ek Problem

Single Row Subquery me humne dekha tha:

SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);

Yahan inner query ne sirf ek value return ki.

50000

Isliye > operator perfectly work kar gaya.

Ab Ye Query Dekho
SELECT department
FROM employee;

Output:

department
IT
HR
IT
Sales
HR
IT
Finance

Ab agar likho:

SELECT *
FROM employee
WHERE department =
(
    SELECT department
    FROM employee
);
Kya Hoga?

Inner query return karegi:

IT
HR
IT
Sales
HR
IT
Finance

Yaani ek nahi, bahut saari rows.

Ab SQL confuse ho jayegi.

department = IT
department = HR
department = Sales
department = Finance

Kis se compare kare?

Isliye error aayega.

Typical MySQL Error:

ERROR 1242 (21000):
Subquery returns more than 1 row
⭐ Rule #2

Agar Subquery multiple rows return kare, to = operator use nahi kar sakte.

To Kya Kare?

SQL ne is problem ke liye kuch operators diye hain.

1. IN ⭐⭐⭐⭐⭐

Sabse important.

Example:

SELECT *
FROM employee
WHERE department IN
(
    SELECT department
    FROM employee
);

Meaning:

department = IT
OR
department = HR
OR
department = Sales
OR
department = Finance

Yaani:

"Agar department inme se kisi bhi value ke equal ho."

Real Example

Suppose doosri table hai:

departments
dept_name
IT
HR

Query:

SELECT *
FROM employee
WHERE department IN
(
    SELECT dept_name
    FROM departments
);

Output:

Sirf

IT employees
HR employees
Interview Difference

Single Row

=
>
<

Multi Row

IN
NOT IN
ANY
ALL -->


<!-- 
Definition

A subquery that returns more than one row is called a Multi Row Subquery.

Hindi:

Jab inner query ek se zyada rows return kare, use Multi Row Subquery kehte hain.

Single Row vs Multi Row
Single Row	Multi Row
Returns one value	Returns multiple values
= > < >= <= <>	IN NOT IN ANY ALL
No error	= lagaya to error aa sakta hai
Kab Use Karen?

Agar inner query return kare:

IT
HR
Finance
Sales

To = nahi likh sakte.

Use

IN
Execution Order

Same rahega.

Step-1

Inner Query

SELECT department
FROM departments;

Output

IT
HR
Step-2

Outer Query

SELECT *
FROM employee
WHERE department IN ('IT','HR');
IN Operator

Meaning

department IN ('IT','HR')

Same as

department='IT'
OR
department='HR'

Ye interview me bahut poochte hain.

NOT IN

Meaning

department NOT IN ('IT','HR')

Equivalent

department<>'IT'
AND
department<>'HR'

Notice:

IN = OR
NOT IN = AND

Ye placement ka favourite trap hai.

Memory Trick ⭐⭐⭐⭐⭐
=      → One value

IN     → Many values

NOT IN → Exclude many values

ANY    → Compare with any value

ALL    → Compare with every value
Common Errors
Error 1
WHERE department =
(
SELECT department
FROM employee
)

❌ Error

Reason:

Subquery returns multiple rows.

Error 2
WHERE salary >
(
SELECT salary
FROM employee
)

❌ Error

Agar subquery multiple salaries return karegi to > compare nahi kar paayega.

Interview Questions
Q1

Difference between Single Row and Multi Row Subquery?

Q2

Why can't we use = with Multi Row Subquery?

Q3

Difference between

IN

and

=
Q4

Execution order?

Q5

IN internally kis operator ki tarah behave karta hai?

Answer:

OR
Placement Tips ⭐⭐⭐⭐⭐
Tip 1

Agar subquery me

MAX()
MIN()
AVG()
COUNT()
SUM()

dikhe...

To pehle check karo:

Ye ek value return karega ya multiple?

99% cases me Single Row Subquery hogi.

Tip 2

Agar subquery me sirf

SELECT department
FROM employee

jaisa query hai...

To pehle socho:

Kitni rows return hongi?

Agar multiple...

To = mat lagana.

Tip 3 (Very Important)

Kabhi bhi operator dekhkar query mat likho.

Pehle ye dekho:

Inner Query kitni rows return karegi?

Phir operator choose karo.

Yahi skill OA aur interviews me sabse zyada kaam aati hai. -->



<!-- 
Q1. Kya IN, NOT IN, ANY, ALL sirf WHERE clause ke saath hi use hote hain?

Answer: Nahi.

Ye operators comparison operators hain. Inhe wahan use karte hain jahan comparison karna ho.

Sabse common use:

✅ WHERE

SELECT *
FROM employee
WHERE department IN ('IT','HR');
HAVING ke saath bhi use kar sakte ho
SELECT department, AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) > ALL
(
    SELECT AVG(salary)
    FROM employee
    GROUP BY department
);

Yeh valid hai.

CASE me bhi use kar sakte ho
SELECT name,
CASE
    WHEN department IN ('IT','HR')
    THEN 'Technical'
    ELSE 'Non Technical'
END
FROM employee;

Valid.

UPDATE
UPDATE employee
SET salary = salary + 1000
WHERE department IN ('IT','HR');
DELETE
DELETE FROM employee
WHERE department IN ('HR');

📌 Placement Note:
95% interviews me tumhe ye operators WHERE clause ke saath hi milenge.

Ab aata hai sabse important part.
ANY

Definition:

ANY ka matlab hai "at least one value".

Yaad rakho:

ANY = At least one
Example

Employee table

Name	Salary
Aman	50000
Kaif	45000
Sara	60000

Query

SELECT *
FROM employee
WHERE salary > ANY
(
    SELECT salary
    FROM employee
    WHERE department='IT'
);

Suppose IT department salaries hain

50000
60000
70000

Question ban gaya

salary > ANY (50000,60000,70000)

Meaning

salary > 50000
OR
salary > 60000
OR
salary > 70000

Bas ek bhi condition true hui to row aa jayegi.

Isliye

ANY = OR
ALL

Definition

ALL ka matlab hai "every value".

Yaad rakho

ALL = Every value

Example

SELECT *
FROM employee
WHERE salary > ALL
(
    SELECT salary
    FROM employee
    WHERE department='IT'
);

Suppose

50000
60000
70000

Question ban gaya

salary > 50000
AND
salary > 60000
AND
salary > 70000

Ab employee ki salary 70000 se bhi zyada honi chahiye.

Isliye

ALL = AND
Easy Memory Trick ⭐⭐⭐⭐⭐
IN
↓

=
OR
=
OR
=
ANY
↓

>
OR
>
OR
>
ALL
↓

>
AND
>
AND
>
Difference
Operator	Meaning
IN	Equal to any value
ANY	Comparison with at least one value
ALL	Comparison with every value
Example

Suppose subquery returns

10
20
30

Now see carefully.

IN
WHERE age IN (10,20,30)

Means

age=10
OR
age=20
OR
age=30
> ANY
WHERE age > ANY (10,20,30)

Means

age>10
OR
age>20
OR
age>30

Minimum value se bada hona hi kaafi hai.

> ALL
WHERE age > ALL (10,20,30)

Means

age>10
AND
age>20
AND
age>30

Yaani 30 se bhi bada hona chahiye.

Placement Shortcut (Very Important)

Ye table yaad kar lo:

Query	Shortcut
> ANY	> MIN()
< ANY	< MAX()
> ALL	> MAX()
< ALL	< MIN()
Example
WHERE salary > ANY
(
SELECT salary
FROM employee
WHERE department='IT'
)

Ye almost same hai:

WHERE salary >
(
SELECT MIN(salary)
FROM employee
WHERE department='IT'
)

Aur

WHERE salary > ALL
(
SELECT salary
FROM employee
WHERE department='IT'
)

Ye almost same hai:

WHERE salary >
(
SELECT MAX(salary)
FROM employee
WHERE department='IT'
) -->
<!-- 

📌 Placement Reality

Ek important baat:

IN aur NOT IN bahut common hain.
ANY aur ALL interviews me concept ke liye poochhe jaate hain, lekin real projects me inka use kaafi kam hota hai. Bahut baar developers MIN() aur MAX() wali subquery likhna zyada readable samajhte hain. -->

<!-- 
📌 Interview Rule

Agar question me sirf employee table ho → Same table use karna bilkul sahi hai.

Agar employee + departments dono tables di hui hain → Lookup ke liye departments_table use karna better practice hai. -->