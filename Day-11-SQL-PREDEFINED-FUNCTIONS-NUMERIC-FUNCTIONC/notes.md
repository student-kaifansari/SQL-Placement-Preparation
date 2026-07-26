<!-- Ab Important Numeric Functions

Ye bahut important hain:

✅ ROUND()
✅ CEIL() / CEILING()
✅ FLOOR()
✅ ABS()
✅ MOD() -->


<!-- 🚀 Numeric Function 1: ROUND()

⭐⭐⭐⭐⭐ Placement Importance: Very High

Definition

ROUND() kisi number ko nearest value tak round off karta hai.

Simple Hindi:

Decimal number ko round karke nearest value deta hai.

Syntax
ROUND(number, decimal_places)
number → jis number ko round karna hai.
decimal_places → decimal ke baad kitne digits chahiye.
Example 1
SELECT ROUND(12.3456,2);

Output

12.35
Example 2
SELECT ROUND(12.3446,2);

Output

12.34
Example 3
SELECT ROUND(12.5);

Output

13
Example 4
SELECT ROUND(12.4);

Output

12
Example 5 (Negative Number)
SELECT ROUND(-12.6);

Output

-13
Employee Examples
Salary ko round karo
SELECT name,
       ROUND(salary)
FROM employee;

👉 Hamare current dataset me salary already integer hai, isliye output same aayega.

Average Salary ko Round karo
SELECT ROUND(AVG(salary),2)
FROM employee;

Output

53437.50
Average Salary without decimal
SELECT ROUND(AVG(salary))
FROM employee;

Output

53438
Negative Decimal Places ⭐⭐⭐ (Interview Favorite)
Example
SELECT ROUND(12345,-1);

Output

12350
SELECT ROUND(12345,-2);

Output

12300
SELECT ROUND(12345,-3);

Output

12000
Rule
Decimal Places	Meaning
2	2 decimal places
1	1 decimal place
0	Nearest integer
-1	Nearest 10
-2	Nearest 100
-3	Nearest 1000
Interview Tricks ⭐⭐⭐⭐⭐
Q1
SELECT ROUND(5.5);

Output?

6
Q2
SELECT ROUND(5.4);

Output?

5
Q3
SELECT ROUND(125,-1);

Output?

130
Q4
SELECT ROUND(149,-2);

Output?

100
Q5
SELECT ROUND(150,-2);

Output?

200 -->
<!-- 
Ye negative decimal places wala concept pehli baar sabko confusing lagta hai. Chalo bahut simple tarike se samajhte hain.

Rule
ROUND(number, -1)

➡️ Nearest 10 par round karega.

ROUND(number, -2)

➡️ Nearest 100 par round karega.

ROUND(number, -3)

➡️ Nearest 1000 par round karega.

Example 1
SELECT ROUND(125,-1);

Nearest multiples of 10 kya hain?

120     125     130

125 bilkul beech me hai.

Rule:

5 ya usse zyada → upar round.

Isliye

130

✅ Answer = 130

Example 2
SELECT ROUND(149,-2);

Nearest multiples of 100:

100      149      200

Distance check karo:

149 → 100 = 49

149 → 200 = 51

49 chhota hai.

Isliye nearest hai

100

✅ Answer = 100

Example 3
SELECT ROUND(150,-2);

Nearest multiples of 100:

100      150      200

150 exactly beech me hai.

Rule:

5 ya usse zyada → next value

Isliye

200

✅ Answer = 200

Aur Examples
Example
SELECT ROUND(175,-2);

Nearest hundreds:

100      175      200

Distance:

175 → 100 = 75

175 → 200 = 25

Nearest:

200
Example
SELECT ROUND(124,-2);
100      124      200

Distance:

124 → 100 = 24

124 → 200 = 76

Answer:

100
Example
SELECT ROUND(6789,-3);

Nearest thousands:

6000      6789      7000

Distance:

6789 → 6000 = 789

6789 → 7000 = 211

Answer:

7000
🎯 Interview Shortcut
Query	Think as	Answer
ROUND(125,-1)	Nearest 10	130
ROUND(149,-2)	Nearest 100	100
ROUND(150,-2)	Nearest 100	200
ROUND(12345,-3)	Nearest 1000	12000
ROUND(16789,-3)	Nearest 1000	17000
⭐ Placement Tip

Interview me agar koi bole:

SELECT ROUND(4567,-2);

Turant socho:

-2 = nearest 100
4567 kis ke paas hai?
4500 ❌ (100 ka multiple nahi hai)
4600 ✅
Distance:
4567 → 4600 = 33
4567 → 4500 = 67

Answer = 4600

Bas ye rule yaad rakho:

0 → nearest integer
-1 → nearest 10
-2 → nearest 100
-3 → nearest 1000

Ye concept aa gaya to negative decimal wale saare interview questions solve ho jayenge. -->



============================================================================================================



<!-- 🚀 Function 2: CEIL() / CEILING()

⭐⭐⭐⭐⭐ Placement Importance: High

Definition

CEIL() kisi bhi number ko next greater integer me convert karta hai.

Simple Hindi:

Hamesha upar wali integer value deta hai.

Syntax
CEIL(number)

Ya

CEILING(number)

👉 Dono same function hain.

Example 1
SELECT CEIL(10.2);

Output

11
Example 2
SELECT CEIL(10.9);

Output

11
Example 3
SELECT CEIL(10.0);

Output

10
Negative Number
SELECT CEIL(-10.8);

Output

-10

⚠️ Interview Trick:

-10 is greater than -11.

🚀 Function 3: FLOOR()

⭐⭐⭐⭐⭐ Placement Importance: High

Definition

FLOOR() kisi bhi number ko previous smaller integer me convert karta hai.

Simple Hindi:

Hamesha neeche wali integer value deta hai.

Syntax
FLOOR(number)
Example 1
SELECT FLOOR(10.8);

Output

10
Example 2
SELECT FLOOR(10.1);

Output

10
Example 3
SELECT FLOOR(10.0);

Output

10
Negative Number
SELECT FLOOR(-10.2);

Output

-11
Difference
Number	CEIL()	FLOOR()
10.2	11	10
10.8	11	10
10.0	10	10
-10.2	-10	-11
-10.8	-10	-11
Easy Trick 😄

Imagine number line:

<------ Smaller -------- Greater ------>

10      10.2      11
CEIL() ➜ Upar jump
FLOOR() ➜ Neeche jump
Employee Example
SELECT name,
       CEIL(salary/1000)
FROM employee;
SELECT name,
       FLOOR(salary/1000)
FROM employee;
⭐ Interview Questions
Q1
SELECT CEIL(5.1);

Output?

6
Q2
SELECT FLOOR(5.9);

Output?

5
Q3
SELECT CEIL(-8.7);

Output?

-8
Q4
SELECT FLOOR(-8.7);

Output?

-9
Q5 (Favorite)
SELECT ROUND(5.6),
       CEIL(5.6),
       FLOOR(5.6);

Output

ROUND	CEIL	FLOOR
6	6	5 -->


========================================================================================================


<!-- 🚀 Function 4: ABS()

⭐⭐⭐⭐☆ Placement Importance: High

Definition

ABS() kisi bhi number ki absolute (positive) value return karta hai.

Simple Hindi:

Number positive ho ya negative, ABS() hamesha uski positive value deta hai.

Syntax
ABS(number)
Example 1
SELECT ABS(25);

Output

25
Example 2
SELECT ABS(-25);

Output

25
Example 3
SELECT ABS(0);

Output

0
Decimal Numbers
SELECT ABS(-12.75);

Output

12.75
Employee Examples
Salary Difference
SELECT name,
       ABS(salary-50000)
FROM employee;

Example Output

Name	Difference
Aman	0
Kaif	15000
Sara	15000
Ali	5000
Riya	10000
Rahul	20000
Neha	8000
Arjun	30000
Find Difference from Average Salary
SELECT name,
       ABS(salary-(SELECT AVG(salary) FROM employee)) AS difference
FROM employee;
Real Interview Use

Suppose interviewer asks:

Find employees whose salary differs from ₹50,000 by less than ₹10,000.

SELECT *
FROM employee
WHERE ABS(salary-50000) < 10000;

Ye ABS() ka sabse common real-life use hai.

Interview Tricks
Q1
SELECT ABS(-100);

Output?

100
Q2
SELECT ABS(100);

Output?

100
Q3
SELECT ABS(-25.75);

Output?

25.75 -->


=======================================================================================================
<!-- 
🚀 Function 5: MOD()

⭐⭐⭐⭐⭐ Placement Importance: Very High

Definition

MOD() division ka remainder (shesh) return karta hai.

Simple Hindi:

Divide karne ke baad jo remainder bachta hai, wahi MOD() return karta hai.

Syntax
MOD(number, divisor)

Ya

number % divisor

👉 MySQL me dono same hain.

Example 1
SELECT MOD(10,3);

Output

1

Explanation

10 ÷ 3 = 3
Remainder = 1
Example 2
SELECT MOD(20,5);

Output

0
Example 3
SELECT 20 % 5;

Output

0

Same result.

⭐ Even / Odd (Most Important)
Even Numbers
SELECT *
FROM employee
WHERE emp_id % 2 = 0;
Odd Numbers
SELECT *
FROM employee
WHERE MOD(emp_id,2)=1;
Employee Examples
Even Employee IDs
SELECT emp_id,name
FROM employee
WHERE MOD(emp_id,2)=0;
Odd Employee IDs
SELECT emp_id,name
FROM employee
WHERE MOD(emp_id,2)=1;
Salary divisible by 5000
SELECT name,salary
FROM employee
WHERE MOD(salary,5000)=0;
Interview Tricks ⭐⭐⭐⭐⭐
Q1
SELECT MOD(17,5);

Output?

2
Q2
SELECT MOD(100,10);

Output?

0
Q3
SELECT MOD(25,7);

Output?

4
Q4
SELECT 15 % 4;

Output?

3
MOD() vs %
Function	Meaning
MOD(10,3)	1
10 % 3	1

✔️ Dono same hain. -->

<!-- 
🎯 Placement Tip

MOD() ka sabse common use interviews me:

✅ Find Even/Odd IDs
✅ Salary divisible by a number
✅ Alternate rows
✅ Pattern-based SQL questions -->