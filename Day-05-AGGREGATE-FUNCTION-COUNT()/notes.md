<!-- Interview Question 1 ⭐
Q1. Aggregate Function kya hota hai?

Interviewer:

"Can you explain what an aggregate function is in SQL?"

Expected Placement Answer

Aggregate Functions are SQL functions that perform calculations on multiple rows and return a single value. They are commonly used for summarizing data.

Example:

SELECT AVG(salary)
FROM Employee;

Agar 100 employees hain, to output sirf 1 row aayegi.

Interview Question 2 ⭐⭐
Name the five most commonly used aggregate functions.

Expected Answer:

COUNT()
SUM()
AVG()
MAX()
MIN()
Interview Question 3 ⭐⭐⭐
Why are they called "Aggregate" functions?

Hint: Ye interview me kabhi-kabhi poochte hain.

Expected idea:

Because they aggregate (combine/summarize) data from multiple rows into a single result.

Interview Question 4 ⭐⭐⭐⭐

Table:

Salary
50000
60000
70000

Query:

SELECT AVG(salary)
FROM Employee;
Interviewer:

How many rows will be returned?

A) 3

B) 2

C) 1

D) Depends on the database

Interview Question 5 ⭐⭐⭐⭐⭐

Suppose Employee table has 1000 rows.

Query:

SELECT MAX(salary)
FROM Employee;
Interviewer:

Will SQL compare all rows or only the first row?

Explain your answer.

🧠 Concept You Must Remember

Aggregate Functions:

Multiple Rows
      │
      ▼
Calculation
      │
      ▼
Single Value

Example:

50000
60000
70000
45000

↓

SUM()

↓

225000 -->

<!-- 

Question 1

Difference between:

SELECT COUNT(*)
FROM Employee
WHERE gender='Female';

and

SELECT COUNT(gender)
FROM Employee
WHERE gender='Female';
Answer

Agar gender column me NULL nahi hai, to dono same output denge.

Example:

Name	Gender
A	Female
B	Female
C	Male

Query 1:

SELECT COUNT(*)
FROM Employee
WHERE gender='Female';

Output:

2

Query 2:

SELECT COUNT(gender)
FROM Employee
WHERE gender='Female';

Output:

2
Interview Follow-up

Agar table ho:

Name	Gender
A	Female
B	NULL
C	Female

Ab bhi WHERE gender='Female' pehle NULL row ko hata dega, isliye remaining rows me gender NULL nahi hoga.

Isliye is particular query me bhi dono ka output same hi rahega.

Best Practice

Placement aur real projects me:

COUNT(*)

zyada use kiya jata hai kyunki iska intention clear hota hai: count the rows.

Question 2

Difference between:

COUNT(*)

and

COUNT(city)
Answer
COUNT(*)

Table ki saari rows count karta hai.

Example:

Name	City
A	Delhi
B	NULL
C	Noida
SELECT COUNT(*)
FROM Employee;

Output:

3
COUNT(city)

Sirf non-NULL city values count karega.

SELECT COUNT(city)
FROM Employee;

Output:

2
Kab difference aayega?

Jab column me NULL values hongi.

Agar NULL nahi hai:

COUNT(*) = COUNT(city)

Agar NULL hai:

COUNT(*) > COUNT(city)
Question 3 ⭐

Query:

SELECT name, COUNT(*)
FROM Employee;
Answer

❌ Invalid query.

Kyun?

COUNT(*) ek aggregate function hai.

name ek normal column hai.

SQL ko samajh nahi aata ki itni saari rows me se kaunsa name dikhaya jaye.

Example:

Name
Aman
Kaif
Sara

Agar output ho:

Name   Count
?      3

To SQL puchega:

"Kaunsa name dikhau? Aman? Kaif? Ya Sara?"

Isi wajah se query invalid hai.

Correct Way 1

Sirf total count chahiye:

SELECT COUNT(*)
FROM Employee;
Correct Way 2

Agar har employee ka count (group-wise) chahiye:

SELECT name, COUNT(*)
FROM Employee
GROUP BY name;

Output:

Name	Count
Aman	1
Kaif	1
Sara	1

Agar duplicate names honge to unka count 2, 3... bhi ho sakta hai.

🎯 Placement Interview Tip

Interviewer agar puche:

"Why is SELECT name, COUNT(*) FROM Employee; invalid?"

Tum confidently bol sakte ho:

Because COUNT(*) is an aggregate function while name is a non-aggregated column. Every selected column must either be aggregated or included in the GROUP BY clause. Otherwise, SQL cannot determine which value of name should be returned. -->
<!-- 
⭐ Ek Rule Yaad Rakhna (Very Important)

Jab bhi GROUP BY use karoge:

SELECT group_by_column, Aggregate_Function()
FROM table
GROUP BY group_by_column;

Example 1
SELECT department, COUNT(*)
FROM Employee
GROUP BY department;
Example 2

SELECT city, AVG(salary)
FROM Employee
GROUP BY city;

Example 3
SELECT gender, MAX(salary)
FROM Employee
GROUP BY gender; -->



Haan, generally jo non-aggregate column SELECT me hai, use GROUP BY me hona chahiye. Aur jo column GROUP BY me hai, use SELECT me rakhna zaruri nahi hai, lekin aksar practical queries me rakhte hain kyunki usse pata chalta hai count kis group ka hai.

Chalo examples se samajhte hain.

Case 1 ✅ (Most Common)
SELECT department, COUNT(*)
FROM Employee
GROUP BY department;

Output:

department	COUNT(*)
IT	3
HR	2
Sales	2

Ye perfect hai.

Case 2 ✅ (Valid)
SELECT COUNT(*)
FROM Employee
GROUP BY department;

Ye bhi valid hai.

Output:

COUNT(*)
3
2
2
1
Lekin problem?

Tumhe nahi pata:

3 kis department ka hai?
2 kis department ka hai?

Isliye practically hum department ko bhi SELECT me rakhte hain.

Case 3 ❌ (Invalid)
SELECT department, city, COUNT(*)
FROM Employee
GROUP BY department;

Ye galat hai.

Kyun?

Maan lo data hai:

department	city
IT	Delhi
IT	Mumbai
IT	Noida

Ab SQL sochega:

Department = IT

City kaunsi dikhau?

Delhi?
Mumbai?
Noida?

Ek group me multiple city hain, isliye SQL decide nahi kar sakta.

Isliye error aata hai.

Correct Query
SELECT department, city, COUNT(*)
FROM Employee
GROUP BY department, city;

Ab har (department, city) combination alag group ban jayega.

Golden Rule ⭐⭐⭐⭐⭐

Jab bhi SELECT me aggregate function ke alawa koi column likho:

SELECT column1, column2, COUNT(*)

to:

GROUP BY column1, column2;
Ek Trick Yaad Rakhna
SELECT me jo bhi normal columns hain
        ↓
Wo GROUP BY me hone chahiye.

Aur:

COUNT()
SUM()
AVG()
MAX()
MIN()

Inhe GROUP BY me likhne ki zarurat nahi hoti.



📌 Ek Golden Rule (Placement ke liye yaad rakhna)
SELECT me do tarah ki cheezein hoti hain:

1. Normal columns
   → GROUP BY me honi chahiye.

2. Aggregate functions
   → GROUP BY me nahi aati.

Example:

SELECT department, COUNT(*)
FROM Employee
GROUP BY department;
department → Normal column → GROUP BY me hoga. ✅
COUNT(*) → Aggregate function → GROUP BY me nahi hoga. ✅

Rule ko ek line me yaad rakhna ⭐⭐⭐⭐⭐
Agar SELECT me aggregate function ke saath koi normal column likhte ho,
to us normal column ko GROUP BY me hona hi chahiye.

Examples:

✅ Valid

SELECT department, COUNT(*)
FROM Employee
GROUP BY department;

❌ Invalid

SELECT department, COUNT(*)
FROM Employee;