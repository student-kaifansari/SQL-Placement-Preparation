<!-- Day 10 - RIGHT JOIN ⭐⭐⭐⭐
Definition

RIGHT JOIN = Right table ki saari rows + Left table ki matching rows.

Bas itna yaad rakho.

LEFT JOIN me Left Table important thi.

RIGHT JOIN me Right Table important hai.

Hamara Data
Employees (Left Table)
emp_id	emp_name	dept_id
1	Aman	101
2	Kaif	102
3	Sara	101
4	Rahul	103
5	Neha	NULL
Departments (Right Table)
dept_id	dept_name
101	IT
102	HR
103	Sales
104	Finance
Query
SELECT e.emp_name,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
Step by Step Working
Department = IT (101)

Matching employees

Aman
Sara

Output

emp_name	dept_name
Aman	IT
Sara	IT
Department = HR (102)

Matching employee

Kaif

Output

|Kaif|HR|

Department = Sales (103)

Matching employee

Rahul

Output

|Rahul|Sales|

Department = Finance (104)

Koi employee nahi.

Lekin...

RIGHT JOIN kya bolta hai?

Right table ki saari rows aani chahiye.

Isliye

emp_name	dept_name
NULL	Finance
Neha

Neha ka dept_id = NULL

Wo kisi department se match nahi karti.

RIGHT JOIN me left table guarantee nahi hoti.

Isliye

❌ Neha output me nahi aayegi.

Final Output
emp_name	dept_name
Aman	IT
Sara	IT
Kaif	HR
Rahul	Sales
NULL	Finance
Visualization
Employees             Departments
---------             -----------
Aman      ───────►      IT
Sara      ───────►      IT

Kaif      ───────►      HR

Rahul     ───────►      Sales

Neha      ❌

                     Finance
                        │
                        ▼
                     NULL
LEFT JOIN vs RIGHT JOIN
LEFT JOIN	RIGHT JOIN
Left table ki saari rows	Right table ki saari rows
Right table ki matching rows	Left table ki matching rows
Neha aayegi	Finance aayega
Interview Trick ⭐⭐⭐⭐⭐

Ye dono queries dekho.

Query 1
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

Output me

✅ Neha

❌ Finance

Query 2
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

Output me

❌ Neha

✅ Finance

Important Note ⭐⭐⭐⭐⭐

Interview me agar koi bole:

"RIGHT JOIN ka use kab karte ho?"

Sach bataun?

Real projects me RIGHT JOIN bahut kam use hota hai.

Most developers query ko ulta likhkar LEFT JOIN use karna prefer karte hain.

Example:

Ye

SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

Aur ye

SELECT *
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

Same result dete hain.

Isliye industry me LEFT JOIN zyada popular hai. -->