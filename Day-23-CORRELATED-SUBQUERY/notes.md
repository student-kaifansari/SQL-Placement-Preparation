<!-- Correlated Subquery
Pehle ek simple question

Suppose tumhare paas ye table hai:

Name	Department	Salary
Aman	IT	50000
Sara	IT	65000
Rahul	IT	70000
Kaif	HR	35000
Simran	HR	45000

Question:

Find employees whose salary is greater than the average salary of their own department.

So expected output:

Name	Department	Salary
Sara	IT	65000
Rahul	IT	70000
Simran	HR	45000
Kya Normal Subquery se ho jayega?

Agar tum likho:

SELECT *
FROM employees_table
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_table
);

Ye kis average se compare karega?

👉 Pure company ke average salary se.

Maan lo overall average = ₹54,583

To comparison hoga:

50000 > 54583 ❌
65000 > 54583 ✅
70000 > 54583 ✅
35000 > 54583 ❌
45000 > 54583 ❌

Lekin question kya tha?

Har employee ko uske department ke average se compare karo.

Yaani:

Aman   → IT Average
Sara   → IT Average
Rahul  → IT Average

Kaif   → HR Average
Simran → HR Average

Yahan normal subquery fail ho gayi.

Correlated Subquery kya hoti hai?
Definition (Interview)

A Correlated Subquery is a subquery that depends on the outer query. It is executed once for every row processed by the outer query.

Simple Hindi:

Inner query outer query ki current row ka data use karti hai. Isliye inner query har row ke liye dobara chalti hai.

Sabse Important Difference
Single Row Subquery
Outer Query
      ↓
Inner Query (1 baar)
      ↓
Result

Sirf ek baar execute hoti hai.

Correlated Subquery
Row 1
   ↓
Inner Query

Row 2
   ↓
Inner Query

Row 3
   ↓
Inner Query

Row 4
   ↓
Inner Query

Har row ke liye alag execute hoti hai.

Example
SELECT *
FROM employees_table e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

Ab dekhte hain kya ho raha hai.

Row 1
Employee = Aman
Department = IT
Salary = 50000

Inner query ban gayi:

SELECT AVG(salary)
FROM employees_table
WHERE department='IT';

Average IT:

(50000+65000+70000+55000)/4

= 60000

Comparison:

50000 > 60000

False

Aman reject.

Row 2
Sara
IT
65000

Inner query fir se chalegi.

Average IT

60000

Comparison:

65000 > 60000

True

Sara select.

Row 3
Rahul
IT
70000

Average fir:

60000
70000 > 60000

True

Rahul select.

Row 4
Kaif

HR

Ab query badal gayi.

Average HR

(35000+40000+45000)/3

=40000

Comparison

35000 > 40000

False

Reject.

Row 5
Simran

45000

Average HR:

40000
45000>40000

True

Select.

Final Output
Employee	Department
Sara	IT
Rahul	IT
Simran	HR

Exactly wahi jo question me chahiye tha.

Alias kyu use kiya?
FROM employees_table e1

Outer table ka naam:

e1

Inner table:

FROM employees_table e2
e2

Phir comparison:

e2.department = e1.department

Matlab:

Current employee ka department
=
Inner query ka department

Agar alias nahi use karoge, SQL ko samajh nahi aayega ki department kis table ka hai, kyunki dono jagah same table use ho raha hai.

Interview Difference Table
Single Row Subquery	Correlated Subquery
Independent hoti hai	Outer query par depend karti hai
1 baar execute hoti hai	Har row ke liye execute hoti hai
Outer query ka data use nahi karti	Outer query ka data use karti hai
Fast hoti hai	Relatively slow ho sakti hai (har row ke liye chalti hai)
📌 Placement Tip

Interviewer agar bole:

Compare with same department
Highest salary per department
Average of own department
Employee of same city
Employee of same manager

👉 Sabse pehla thought hona chahiye: Correlated Subquery ho sakti hai. -->


<!-- 
MCQ Answers
Q16

How many times does a Correlated Subquery execute?

✅ C. Once for every row of the outer query

Q17

Which keyword is necessary in a Correlated Subquery?

✅ B. Alias

Q18

Which statement is true?

✅ B. Correlated Subquery depends on the outer query

Q19

Which type of subquery is generally slower?

✅ C. Correlated Subquery

Q20

Which clause connects the inner query with the outer query?

✅ A. WHERE

📌 Placement Tip

Correlated Subqueries se ye questions bahut frequently pooche jaate hain:

✅ Highest salary in each department
✅ Lowest salary in each department
✅ Employees above department average
✅ Second highest salary per department
✅ Employees older/younger than department average
✅ Top performer of each department -->





<!-- 
Short answer: Nahi. Correlated Subquery me "outer query pehle poori run hoti hai" bhi nahi, aur "inner query pehle poori run hoti hai" bhi nahi.

Execution ka actual flow

Maan lo query hai:

SELECT *
FROM employees_table e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
);

SQL is tarah kaam karta hai:

Step 1

Outer query ki pehli row uthata hai.

Aman | IT | 50000
Step 2

Ab inner query chalti hai, kyunki usse e1.department chahiye.

SELECT AVG(salary)
FROM employees_table
WHERE department = 'IT';

Result:

60000

Comparison:

50000 > 60000 ❌

Aman reject.

Step 3

Outer query ki dusri row uthata hai.

Sara | IT | 65000

Inner query dobara chalegi.

SELECT AVG(salary)
FROM employees_table
WHERE department = 'IT';

Result:

60000

Comparison:

65000 > 60000 ✅

Sara select.

Step 4

Outer query ki teesri row...

Phir inner query...

Ye process har row ke liye repeat hota hai.

Visualize it like this
Outer Row 1
     ↓
Inner Query
     ↓
Comparison

Outer Row 2
     ↓
Inner Query
     ↓
Comparison

Outer Row 3
     ↓
Inner Query
     ↓
Comparison

...
Difference from Single Row Subquery

Single Row Subquery:

Inner Query (1 time)
       ↓
Result
       ↓
Outer Query

Example:

SELECT *
FROM employees_table
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_table
);

Yahan inner query sirf ek baar chalti hai.

Correlated Subquery:

Outer Row
    ↓
Inner Query
    ↓
Comparison
    ↓
Next Outer Row
    ↓
Inner Query

Yahan inner query har outer row ke liye chalti hai.

Interview me agar poocha jaye:

"Does the outer query execute first in a correlated subquery?"

Best answer:

Outer query poori execute nahi hoti. SQL outer query ki ek row process karta hai, us row ke liye inner query execute hoti hai, comparison hota hai, phir next row process hoti hai. Isliye correlated subquery outer query par depend karti hai aur inner query har outer row ke liye execute hoti hai. -->


===========================




<!-- 
Q11
SELECT *
FROM employees_table e1
WHERE 1 =
(
    SELECT COUNT(DISTINCT salary)
    FROM employees_table e2
    WHERE e2.department = e1.department
      AND e2.salary > e1.salary
);
1 = ka matlab kya hai?

Yahan COUNT(DISTINCT salary) count return karta hai.

Hum check kar rahe hain:

Current employee se kitni distinct salaries badi hain?

Example (IT Department)
Employee	Salary
Rahul	70000
Sara	65000
Ankit	55000
Aman	50000
Rahul (70000)

Badi salary kitni hai?

None

Count = 0

Condition:

1 = 0 ❌

Reject.

Sara (65000)

Usse badi salary:

70000

Count = 1

Condition:

1 = 1 ✅

Select.

Sara IT department ki second highest salary hai.

Ankit (55000)

Usse badi salaries:

65000
70000

Count = 2

Condition:

1 = 2 ❌

Reject.

Aman (50000)

Usse badi salaries:

55000
65000
70000

Count = 3

Reject.

Isliye 1 = ka matlab hai:

Current employee se sirf ek salary badi honi chahiye.

Yahi second highest salary hoti hai.

Q15
SELECT *
FROM employees_table e1
WHERE 2 <=
(
    SELECT COUNT(*)
    FROM employees_table e2
    WHERE e2.department = e1.department
      AND e2.salary < e1.salary
);

Yahan 2 <= ka matlab hai:

Current employee se kam se kam 2 employees ki salary kam honi chahiye.

Example
Employee	Salary
Rahul	70000
Sara	65000
Ankit	55000
Aman	50000
Rahul (70000)

Usse kam salary:

65000
55000
50000

Count = 3

Condition:

2 <= 3 ✅

Rahul select.

Sara (65000)

Usse kam salary:

55000
50000

Count = 2

Condition:

2 <= 2 ✅

Sara select.

Ankit (55000)

Usse kam salary:

50000

Count = 1

Condition:

2 <= 1 ❌

Reject.

Aman (50000)

Usse kam salary:

None

Count = 0

Reject.

General Pattern (Placement Trick)
Top-1 (Highest)
COUNT(salary > current_salary) = 0

Koi bhi salary current salary se badi nahi honi chahiye.

Top-2 (Second Highest)
COUNT(salary > current_salary) = 1

Sirf ek salary current salary se badi honi chahiye.

Top-3 (Third Highest)
COUNT(salary > current_salary) = 2

Do salaries current salary se badi honi chahiye.

At least N employees below current employee
COUNT(salary < current_salary) >= N

Jaise:

>= 2 → Kam se kam 2 employees ki salary kam ho.
>= 5 → Kam se kam 5 employees ki salary kam ho./ -->