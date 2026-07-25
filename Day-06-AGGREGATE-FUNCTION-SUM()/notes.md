<!-- Topic: SUM()

Tumne COUNT() achhe se kar liya hai, ab SUM() bahut easy lagega.

📖 Theory
SUM() kya karta hai?

SUM() kisi numeric column ka total nikalta hai.

Syntax
SELECT SUM(column_name)
FROM table_name;
Example

Table

name	salary
Aman	50000
Kaif	35000
Sara	65000

Query

SELECT SUM(salary)
FROM Employee;

Output

150000

Kyuki

50000
+35000
+65000
--------
150000
Important Points (Interview)
Q1. Kya SUM() sirf numbers par lagta hai?

✅ Haan.

SUM(salary)      ✅
SUM(age)         ✅
SUM(price)       ✅

SUM(name)        ❌
SUM(city)        ❌
Q2. Kya NULL values ko SUM count karta hai?

Example

salary
50000
NULL
30000
SELECT SUM(salary)
FROM Employee;

Output

80000

NULL ignore ho jata hai.

Q3. Kya SUM() GROUP BY ke bina use ho sakta hai?

Bilkul.

SELECT SUM(salary)
FROM Employee;

Ye poori table ki salary ka total dega.

Q4. GROUP BY ke saath?
SELECT department,
SUM(salary)
FROM Employee
GROUP BY department;

Har department ki total salary.

Placement Interview Questions
Q1

Difference between

COUNT(salary)

and

SUM(salary)

Expected Answer:

COUNT(salary) → salary values ki ginti karta hai (NULL ko ignore karta hai).
SUM(salary) → salary values ka total nikalta hai (NULL ko ignore karta hai).
Q2

Can SUM() work on VARCHAR?

❌ No. -->


<!-- 🔥 Bonus Interview Question (Placement Favorite)

Is query ka output kya hoga?

SELECT SUM(salary)
FROM Employee
WHERE department='Marketing';

Assume Marketing department me koi employee nahi hai.

Question:

Output kya aayega?
0 aayega ya NULL?
Why?

Ye bahut common interview trap hai.
🎯 Correct! ✅

Agar Marketing department me ek bhi row nahi hai, to:

SELECT SUM(salary)
FROM Employee
WHERE department='Marketing';

Output:

NULL
🤔 Interviewer puchega: "Why NULL, not 0?"

Reason:

WHERE department='Marketing' ke baad result set me 0 rows bachti hain.

SUM() ke paas add karne ke liye koi value hi nahi hoti, isliye SQL NULL return karta hai.

NULL ka matlab hai: "No value available."

0 ka matlab hota: "Total calculate hua aur result zero nikla."

Dono alag cheezein hain.

Example

Table:

department	salary
IT	50000
HR	35000

Query:

SELECT SUM(salary)
FROM Employee
WHERE department='Marketing';

Result:

NULL -->


<!-- 
Q1
SELECT COUNT(*)
FROM Employee
WHERE department='Marketing';
Tumhara Answer:
NULL

❌ Incorrect

Correct Answer:
0
Reason

COUNT() values ka count karta hai.

Agar rows hi nahi hain, to count = 0.

COUNT() kabhi NULL return nahi karta.

Q2
SELECT AVG(salary)
FROM Employee
WHERE department='Marketing';
Tumhara Answer:
NULL

✅ Correct.

Reason:

Average nikalne ke liye koi value hi nahi hai.

Q3
SELECT MAX(salary)
FROM Employee
WHERE department='Marketing';
Tumhara Answer:
NULL

✅ Correct.

Reason:

Maximum value exist hi nahi karti.

⭐ Ye Table Yaad Kar Lo (Very Important)
Function	Empty Result Set
COUNT(*)	0 ✅
COUNT(column)	0 ✅
SUM()	NULL
AVG()	NULL
MAX()	NULL
MIN()	NULL
🎤 Interview Trick Question

Interviewer:

Why does COUNT() return 0 while SUM() returns NULL?

Best Answer

COUNT() counts the number of matching rows. If there are no matching rows, the count is simply 0. SUM(), AVG(), MIN(), and MAX() require actual values to compute a result. When no values exist, SQL returns NULL because there is no meaningful result to calculate. -->