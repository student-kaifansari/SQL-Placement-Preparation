<!-- Day 09 - LEFT JOIN ⭐⭐⭐⭐⭐ (Most Asked in Placements)

Ye TCS, Infosys, Cognizant, Accenture, Capgemini, Deloitte... sab jagah poocha jata hai.

Pehle Data Yaad Kar Lo
Employees
emp_id	emp_name	dept_id
1	Aman	101
2	Kaif	102
3	Sara	101
4	Rahul	103
5	Neha	NULL
Departments
dept_id	dept_name
101	IT
102	HR
103	Sales
104	Finance
INNER JOIN Kya Karta Tha?

Sirf matching rows deta tha.

Output:

Employee	Department
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales

Neha ❌

Finance ❌

LEFT JOIN Kya Karta Hai?

Rule yaad rakho:

LEFT JOIN = Left table ki saari rows + Right table ki matching rows.

Yani agar match nahi mila tab bhi left table ki row delete nahi hogi.

Syntax:

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
Hamare Example Me
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

Ab dekhte hain step by step.

Aman
101 == 101

✔ Match

Output

|Aman|IT|

Kaif
102 == 102

✔ Match

Output

|Kaif|HR|

Sara
101 ==101

✔ Match

Output

|Sara|IT|

Rahul
103 ==103

✔ Match

Output

|Rahul|Sales|

Neha
NULL

Koi match nahi.

INNER JOIN me?

❌ Remove

LEFT JOIN me?

✅ Row rahegi.

Bas department ki value NULL ho jayegi.

Output

|Neha|NULL|

Final Output
emp_name	dept_name
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales
Neha	NULL

Notice:

Finance abhi bhi nahi aaya.

Kyun?

Kyuki Finance RIGHT TABLE me hai.

LEFT JOIN sirf LEFT TABLE ki guarantee deta hai.

Visualization
LEFT TABLE
(employees)

Aman
Kaif
Sara
Rahul
Neha

        LEFT JOIN

RIGHT TABLE
(departments)

IT
HR
Sales
Finance

Result:

Aman   -> IT
Kaif   -> HR
Sara   -> IT
Rahul  -> Sales
Neha   -> NULL

Finance ❌

INNER JOIN vs LEFT JOIN
INNER JOIN	LEFT JOIN
Sirf matching rows	Left table ki sabhi rows
Non-matching rows remove	Non-matching rows bhi aati hain
NULL rows nahi aati	NULL values ke saath aati hain
Real Life Example
Employees
Aman
Kaif
Sara
Rahul
Neha
Departments
IT
HR
Sales
Finance

Neha ka department assign nahi hua.

INNER JOIN
Aman
Kaif
Sara
Rahul

Neha gayab.

LEFT JOIN
Aman
Kaif
Sara
Rahul
Neha (Department = NULL)
Interview Question ⭐⭐⭐⭐⭐
Q1. LEFT JOIN kya return karta hai?

Answer:

LEFT JOIN left table ki sabhi rows return karta hai aur right table ki sirf matching rows. Agar match nahi milta to right table ke columns me NULL aata hai.

Q2. LEFT JOIN me kaunsi table important hoti hai?

✅ Left table.

Q3. Agar match na mile to kya hota hai?

✅ Left row rahegi.

✅ Right side ke columns NULL honge. -->

<!-- 
Rule

Jis table ka naam FROM ke baad likha hota hai, wo LEFT Table hoti hai.

Jis table ka naam JOIN ke baad likha hota hai, wo RIGHT Table hoti hai.

Example 1
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

Yahan:

FROM employees

➡️ employees = LEFT Table

LEFT JOIN departments

➡️ departments = RIGHT Table

Isliye result me:

✅ Employees ki saari rows aayengi.
❌ Departments ki sirf matching rows aayengi.

Output:

Employee	Department
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales
Neha	NULL

Finance nahi aayega.

Example 2

Agar query ulta likh do:

SELECT *
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

Ab:

FROM departments

➡️ departments = LEFT Table

LEFT JOIN employees

➡️ employees = RIGHT Table

Ab result hoga:

Department	Employee
IT	Aman
IT	Sara
HR	Kaif
Sales	Rahul
Finance	NULL

Ab Finance aa gaya, aur Neha gayab ho gayi.

Kyun?

Kyuki ab LEFT table departments hai.

Ek Trick (Kabhi nahi bhoologe)

Query ko sirf left se right padho.

FROM employees
LEFT JOIN departments

Visualization:

employees      departments
    LEFT JOIN

👉 Jo LEFT side me likha hai = LEFT Table

👉 Jo RIGHT side me likha hai = RIGHT Table

Interview Question ⭐⭐⭐⭐⭐
Interviewer:

Can we change the result of a LEFT JOIN by swapping the tables?

Answer:

Yes. LEFT JOIN me FROM wali table ki sabhi rows preserve hoti hain. Agar hum tables ki position swap kar denge, to jis table ko preserve kiya ja raha hai wo bhi badal jayega, aur output bhi change ho jayega. -->
<!-- 

Jo 3 mistakes hui hain, teeno ek hi topic se related hain:

NULL handling (IS NULL vs = NULL)
LEFT JOIN ... WHERE right_table IS NULL
Wrong JOIN condition (= ki jagah !=)

Agar ye teen concepts clear ho gaye, to LEFT JOIN ka 90% interview part cover ho jayega. -->