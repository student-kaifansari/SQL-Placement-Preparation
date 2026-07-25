<!-- MAX() and MIN() Theory (Interview Ready)
🔹 MAX()

MAX() kisi column ki sabse badi (maximum) value return karta hai.

Syntax
SELECT MAX(column_name)
FROM table_name;
Example
SELECT MAX(salary)
FROM Employee;

Output:

80000

Kyuki Employee table me sabse zyada salary 80000 hai.

🔹 MIN()

MIN() kisi column ki sabse chhoti (minimum) value return karta hai.

Syntax
SELECT MIN(column_name)
FROM table_name;
Example
SELECT MIN(age)
FROM Employee;

Output:

22

Kyuki sabse chhoti age 22 hai.

Important Interview Concepts
1. Kya MAX() aur MIN() NULL ko consider karte hain?

❌ Nahi.

Example:

salary
50000
NULL
70000
SELECT MAX(salary), MIN(salary)
FROM Employee;

Output:

MAX = 70000
MIN = 50000

NULL ignore ho jayega.

2. Kya MAX() aur MIN() String par bhi kaam karte hain?

✅ Haan.

Example:

SELECT MAX(name), MIN(name)
FROM Employee;

Ye alphabetical (lexicographical) order ke according compare karta hai.

Suppose names:

Aman
Kaif
Sara
Riya

Output:

MAX(name) = Sara
MIN(name) = Aman
3. GROUP BY ke saath use kar sakte hain?

✅ Bilkul.

Example:

SELECT department,
       MAX(salary),
       MIN(salary)
FROM Employee
GROUP BY department;

Har department ki highest aur lowest salary mil jayegi.

4. Empty Result Set me kya hota hai?
SELECT MAX(salary)
FROM Employee
WHERE department='Marketing';

Agar koi row nahi mili to output:

NULL

MIN() bhi NULL return karega.

Interview Trap 😈

Table:

salary
NULL
NULL
NULL

Predict:

SELECT
MAX(salary),
MIN(salary)
FROM Employee;

A) 0, 0

B) NULL, NULL

C) Error

Interview Trap

Tumne answer diya:

B) NULL, NULL

✅ 100% Correct.

Agar saari values NULL hain, to:

SELECT MAX(salary), MIN(salary)
FROM Employee;

Output:

NULL   NULL

Kyunki compare karne ke liye koi non-NULL value hi nahi hai. -->


<!-- 
📌 Golden Rule (Placement Interview)

WHERE → Individual rows ko filter karta hai (before grouping).

HAVING → Groups ko filter karta hai (after grouping).

Agar HAVING me koi column likh rahe ho jo GROUP BY me nahi hai, to almost hamesha socho:

"Ek group me is column ki multiple values ho sakti hain?"

Agar haan, to ya to WHERE use hoga, ya aggregate function (MAX, MIN, AVG, COUNT, SUM) ke saath HAVING use hoga -->

<!-- 

Interview Trick

Main tumse ek question poochta hoon.

Table:

Department	Salary
IT	50000
IT	70000
IT	60000

Ab batao,

HAVING salary > 50000

👉 SQL kis salary ko compare karega?

50000?
70000?
60000?

Isi sawal ka answer hi reason hai ki HAVING salary > 50000 galat hai.

Ye answer do. Agar ye samajh aa gaya, to WHERE aur HAVING kabhi life me confuse nahi honge.

error ayega

🎯 Bilkul! Yahi point hai.

Lekin interview me sirf "error aayega" bolna enough nahi hota. Interviewer agla question puchta hai:

"Error kyu aayega?"

Yahi explain karna aana chahiye.

Maan lo table hai:

Department	Salary
IT	50000
IT	70000
IT	60000

Tumne likha:

SELECT department, MAX(salary)
FROM employee
GROUP BY department
HAVING salary > 50000;

GROUP BY department ke baad SQL ke paas sirf ek IT group hai.

Us group ke andar salaries hain:

50000
70000
60000

Ab SQL ko mila:

HAVING salary > 50000

Ab SQL sochega:

Kaunsi salary?

50000?
70000?
60000?

Ek group me 3 salary values hain.

Isliye SQL decide hi nahi kar sakta ki salary se tumhara matlab kaunsi value hai.

Isi wajah se error aata hai.

Agar tum aisa likho:
HAVING MAX(salary) > 50000

Ab confusion khatam.

SQL ko pata hai:

MAX(salary) = 70000

Ab check karega:

70000 > 50000 ✅

Isliye ye valid hai.

🔥 Ek Golden Rule (Placement ke liye)

HAVING me agar koi column use kar rahe ho, to woh:

✅ GROUP BY me hona chahiye

ya

✅ kisi aggregate function (MAX, MIN, SUM, AVG, COUNT) ke andar hona chahiye.

Agar na GROUP BY me hai aur na aggregate ke andar, to ek group me us column ki multiple values hongi, aur SQL ko samajh nahi aayega kaunsi value use kare. -->


<!-- 
🎯 Interview Shortcut

Ye table yaad kar lo:

HAVING Condition	Valid?
HAVING department='IT'	✅ (department is GROUP BY column)
HAVING MAX(salary)>50000	✅ (aggregate function)
HAVING COUNT(*)>2	✅ (aggregate function)
HAVING salary>50000	❌ (salary is neither grouped nor aggregated) -->