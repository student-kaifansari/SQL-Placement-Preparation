<!-- 📖 Theory
AVG() kya karta hai?

AVG() kisi numeric column ka average (mean) nikalta hai.

Syntax
SELECT AVG(column_name)
FROM table_name;
Example

Table:

Name	Salary
Aman	50000
Kaif	35000
Sara	65000

Query:

SELECT AVG(salary)
FROM Employee;

Calculation:

(50000 + 35000 + 65000) / 3
= 50000

Output:

50000
Interview Concepts
Q1. AVG() kis type ke column par use hota hai?

✅ Numeric columns

AVG(salary)   ✅
AVG(age)      ✅

AVG(name)     ❌
AVG(city)     ❌
Q2. Kya AVG() NULL ko consider karta hai?

Table:

salary
50000
NULL
30000
SELECT AVG(salary)
FROM Employee;

Calculation:

(50000 + 30000) / 2

❌ NOT

(50000 + 0 + 30000) / 3

NULL ko ignore kiya jata hai.

Output:

40000
Q3. Empty result set par kya return karega?
SELECT AVG(salary)
FROM Employee
WHERE department='Marketing';

Output:

NULL

Ye tum abhi pichhle question me sahi bata chuke ho. ✅

Q4. GROUP BY ke bina
SELECT AVG(salary)
FROM Employee;

👉 Sab employees ki average salary.

Q5. GROUP BY ke saath
SELECT department,
AVG(salary)
FROM Employee
GROUP BY department;

👉 Har department ki average salary.

🎤 Placement Interview Questions
Q1

Difference between

SUM(salary)

and

AVG(salary)

Expected Answer:

SUM() → Total salary
AVG() → Average salary
Q2

Which formula does SQL internally use?

Expected Answer:

AVG(column)
=
SUM(column) / COUNT(column)

⚠️ Dhyan do:

COUNT(column)

Not

COUNT(*)

Kyun?

Kyuki AVG() NULL values ko ignore karta hai. -->

<!-- 
Question tha:

SELECT AVG(10), SUM(10), COUNT(10);

Sabse pehle ek cheez samjho.

Yeh query table par execute nahi ho rahi.

Yeh sirf constant value 10 par execute ho rahi hai.

SQL ise internally aise dekhta hai:

Value
10

Ab aggregate functions isi ek value par kaam karengi.

SUM(10)

Sirf ek hi value hai.

10

Output:

10
AVG(10)

Average of only one value:

10 / 1 = 10

Output:

10
COUNT(10)

COUNT(expression) non-NULL expressions ko count karta hai.

Yahan expression hai:

10

Ye NULL nahi hai.

Isliye count = 1

Output:

1
Final Output
AVG(10)	SUM(10)	COUNT(10)
10	10	1
🎤 Interview Trap 😈

Ab batao:

SELECT COUNT(NULL);

Output kya hoga?

A)

1

B)

0

C)

NULL

Sirf A, B ya C batao. Ye COUNT() ka sabse famous interview trap hai. -->

<!-- 

Bhai, bahut badhiya question! 🔥 Ye SQL ka concept samajhne ke liye important hai.

Tum pooch rahe ho:

FROM Employee kyu nahi likha?

Answer:
Query 1 (Jo maine likhi)
SELECT AVG(10), SUM(10), COUNT(10);

Isme koi table use hi nahi ho rahi.

SQL sirf constant values par calculation kar raha hai.

Output:

AVG(10)	SUM(10)	COUNT(10)
10	10	1
Query 2 (Agar tum likho)
SELECT AVG(10), SUM(10), COUNT(10)
FROM Employee;

Ab Employee table me 8 rows hain.

Har row ke liye SQL ko value 10 milegi.

Internally SQL aise dekhega:

10
10
10
10
10
10
10
10
10

Ab calculate karo:

SUM(10)
10 + 10 + 10 + 10 + 10 + 10 + 10 + 10
= 80
AVG(10)
80 / 8 = 10
COUNT(10)

Har row me 10 non-NULL hai.

8
Final Output
Query	AVG(10)	SUM(10)	COUNT(10)
SELECT AVG(10), SUM(10), COUNT(10);	10	10	1
SELECT AVG(10), SUM(10), COUNT(10) FROM Employee;	10	80	8
🎯 Interview Tip

Interviewer agar puche:

"Can we write SELECT without FROM?"

Answer:

Yes. Agar hume sirf constants, expressions ya built-in functions evaluate karni ho, to FROM ki zarurat nahi hoti.

Example:

SELECT 5 + 10;

Output:

15

Ya

SELECT NOW();

Ya

SELECT UPPER('kaif');

In sab me FROM ki zarurat nahi hoti.

🎤 Chhota sa interview question

Agar Employee table me 100 rows hoti, to is query ka output kya hota?

SELECT AVG(10), SUM(10), COUNT(10)
FROM Employee;

Question tha:

SELECT AVG(10), SUM(10), COUNT(10)
FROM Employee;

Assume Employee table me 100 rows hain.

Har row me SQL ko value 10 milegi.

Row	Value
1	10
2	10
3	10
...	...
100	10

Ab calculate karte hain.

SUM(10)

100 rows × 10

= 1000
COUNT(10)

100 rows me 100 non-NULL values hain.

= 100
AVG(10)

Formula:

AVG = SUM / COUNT
= 1000 / 100
= 10
✅ Final Answer
AVG(10)	SUM(10)	COUNT(10)
10	1000	100
🎯 Ek Trick Yaad Rakhna

Jab bhi tum likhte ho:

SELECT 10
FROM Employee;

Aur table me 100 rows hain, output hoga:

10
10
10
10
...
(100 times)

Isliye aggregate functions har row par kaam karte hain. -->









🎤 Placement Interview Question (Bahut Common)

Maan lo Employee table me 100 rows hain.

Predict the output:

SELECT COUNT(1), COUNT(*), COUNT(emp_id)
FROM Employee;

Aur kya teeno same output denge? Agar haan, to kyun?

Ye COUNT ka sabse famous interview question hai.

Correct Answer

Agar Employee table me 100 rows hain aur emp_id me koi NULL nahi hai:

SELECT COUNT(1), COUNT(*), COUNT(emp_id)
FROM Employee;

Output:

COUNT(1)	COUNT(*)	COUNT(emp_id)
100	100	100
🤔 Why?
1. COUNT(*)

Rows count karta hai.

100 rows ⇒ 100

2. COUNT(1)

Ye bahut logon ko confuse karta hai.

SQL internally har row ke liye 1 dekhta hai.

Agar table me 100 rows hain:

1
1
1
1
...
1

COUNT(1) = 100

Ye 1 ko count nahi karta, balki har row me expression 1 non-NULL hai ya nahi, ye dekhta hai.

3. COUNT(emp_id)

Ye emp_id ki non-NULL values count karta hai.

Agar saare emp_id filled hain:

100 rows ⇒ 100

⭐ Important Interview Question

Suppose table:

emp_id	name
1	Aman
2	Kaif
NULL	Sara
4	Ali

Ab predict karo:

SELECT COUNT(*), COUNT(1), COUNT(emp_id)
FROM Employee;

Output?

Socho...
COUNT(*) = ?
COUNT(1) = ?
COUNT(emp_id) = ?
🎯 Golden Rule (Yaad Kar Lo)
Function	Counts
COUNT(*)	All rows
COUNT(1)	All rows (because 1 is never NULL)
COUNT(column)	Only non-NULL values of that column

😄 Bhai, is baar ulta ho gaya.

Tumne answer diya:

COUNT(*)      = 4
COUNT(1)      = 3
COUNT(emp_id) = 4

❌ Ye incorrect hai.

Chalo step by step dekhte hain.

Table:

emp_id	name
1	Aman
2	Kaif
NULL	Sara
4	Ali

Total rows = 4

1. COUNT(*)
SELECT COUNT(*)

Ye saari rows count karta hai.

Aman  ✅
Kaif  ✅
Sara  ✅
Ali   ✅

Answer:

4

✅ Tumhara ye sahi tha.

2. COUNT(1)
SELECT COUNT(1)

Ye har row ke liye expression 1 dekhta hai.

Internally SQL aise sochta hai:

1
1
1
1
1

Kya 1 kabhi NULL hai?

Nahi.

To 4 rows count hongi.

Answer:

4

❌ Tumne 3 likha.

3. COUNT(emp_id)
SELECT COUNT(emp_id)

Ye sirf non-NULL emp_id count karega.

1      ✅
2      ✅
NULL   ❌
4      ✅

Answer:

3

❌ Tumne 4 likha.

✅ Final Answer
COUNT(*)      = 4
COUNT(1)      = 4
COUNT(emp_id) = 3
🎯 Super Trick (Placement ke liye)

Ek line me yaad kar lo:

COUNT(*)      → Total rows

COUNT(1)      → Total rows

COUNT(column) → Non-NULL values of that column

Is ek rule se tum COUNT ke 90% interview questions solve kar loge.







🎤 Final Placement Challenge (Hard)

Ye answer kar diya to COUNT chapter complete. 😎

Table:

emp_id	salary
1	50000
2	NULL
3	30000
4	NULL

Predict the output:

SELECT
COUNT(*),
COUNT(salary),
SUM(salary),
AVG(salary),
MAX(salary),
MIN(salary)
FROM Employee;

Ek hi line me 6 outputs likho.

Format:

COUNT(*) = ?
COUNT(salary) = ?
SUM(salary) = ?
AVG(salary) = ?
MAX(salary) = ?
MIN(salary) = ?

Ye placement companies (TCS, Cognizant, Capgemini, Accenture, Infosys, etc.) ka bahut common conceptual question hai.

4, 4, 80000, 40000, 50000, 30000

🔥 Bahut badhiya! Is baar 6 me se 5 answers sahi hain. Sirf ek chhoti si mistake hui.

Table:

emp_id	salary
1	50000
2	NULL
3	30000
4	NULL

Tumhara answer:

COUNT(*) = 4      ✅
COUNT(salary) = 4 ❌
SUM(salary) = 80000 ✅
AVG(salary) = 40000 ✅
MAX(salary) = 50000 ✅
MIN(salary) = 30000 ✅
Step by Step
1. COUNT(*)

Total rows count hoti hain.

4

✅ Correct

2. COUNT(salary)

Ye sirf non-NULL salary count karta hai.

Salary values:

50000  ✅
NULL   ❌
30000  ✅
NULL   ❌

Sirf 2 salaries non-NULL hain.

Isliye:

COUNT(salary) = 2

❌ Tumne 4 likha.

3. SUM(salary)

NULL ignore hoga.

50000 + 30000 = 80000

✅ Correct

4. AVG(salary)

AVG bhi NULL ignore karta hai.

Formula:

AVG = SUM / COUNT(non-NULL)
80000 / 2 = 40000

✅ Correct

5. MAX(salary)
50000

✅ Correct

6. MIN(salary)
30000

✅ Correct

✅ Final Output
Function	Output
COUNT(*)	4
COUNT(salary)	2
SUM(salary)	80000
AVG(salary)	40000
MAX(salary)	50000
MIN(salary)	30000
🎯 Ek Important Rule

Yaad rakho:

COUNT(*) → Total rows
COUNT(column) → Sirf non-NULL values
SUM(), AVG(), MAX(), MIN() → NULL ko ignore karte hain