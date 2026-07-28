<!-- Placement Mentor Feedback

Agar ye paper TCS, Infosys, Cognizant ya Capgemini me aata to tum easily 80%+ score kar lete.

Ab sirf do concepts weak hain:

1️⃣ COUNT(*)

Yaad rakhna:

COUNT(*)

➡️ Total rows count karta hai.

COUNT(column)

➡️ Sirf non-NULL values count karta hai.

2️⃣ CROSS JOIN

Jab question me likha ho:

Every employee with every department
Every product with every size
All possible combinations
Cartesian Product

➡️ Seedha dimag me aana chahiye:

CROSS JOIN -->


===============================================================

<!-- 
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

COUNT() counts the number of matching rows. If there are no matching rows, the count is simply 0. SUM(), AVG(), MIN(), and MAX() require actual values to compute a result. When no values exist, SQL returns NULL because there is no meaningful result to calculate.  -->

<!-- 
⭐ Interview Follow-up

Interviewer:

GROUP BY ke bina HAVING kab use kar sakte hain?

Ye thoda advanced question hai.

Example:

SELECT COUNT(*)
FROM employees
HAVING COUNT(*) > 3;

Ye valid hai.

Kyun?

Kyuki poori table ko SQL ek hi group maan leta hai.

Lekin tumhare question me department-wise average chahiye tha, isliye GROUP BY d.dept_name zaroori hai.

Score

Q12: 9/10 ⭐⭐⭐⭐

✅ HAVING use kiya (bahut achha)
✅ AVG() use kiya
❌ GROUP BY miss ho gaya

Ye bahut common interview mistake hai. Ek baar yaad ho gaya to dobara nahi bhoologe. -->

<!-- 
Aur agar tables ka order ulta kar do, to LEFT JOIN bhi same result dega.

Tumhari Query
SELECT d.dept_name,
       MAX(e.salary) AS max_salary
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

✔ 100% Correct

Output:

dept_name	max_salary
IT	60000
HR	45000
Sales	55000
Finance	NULL
Meri Query
SELECT d.dept_name,
       MAX(e.salary) AS max_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

✔ Ye bhi 100% Correct

Dono Same Kyu Hain?

Ye dono logically equivalent hain.

Method 1
employees
RIGHT JOIN
departments

👉 "Departments ki saari rows chahiye."

Method 2
departments
LEFT JOIN
employees

👉 "Departments left side me hain, isliye unki saari rows chahiye."

Placement Tip ⭐⭐⭐⭐⭐

Interview me RIGHT JOIN avoid karne ki advice di jaati hai.

Reason

LEFT JOIN zyada readable hota hai.

Agar mujhe Departments ki saari rows chahiye, to main departments ko hi left side me rakhunga.

FROM departments d
LEFT JOIN employees e

Ye naturally samajh aata hai.

Interviewer Question

Agar interviewer pooche:

Can you replace RIGHT JOIN with LEFT JOIN?

Answer:

Yes.

Bas tables ki position change karni padegi.

Example:

employees
RIGHT JOIN
departments

⇅ Same As ⇅

departments
LEFT JOIN
employees
⭐ Rule Yaad Kar Lo
Agar LEFT table ki saari rows chahiye
        ↓
LEFT JOIN

Agar RIGHT table ki saari rows chahiye
        ↓
RIGHT JOIN

Aur ek practical interview tip:

Professional developers generally prefer LEFT JOIN. Agar RIGHT JOIN ki zarurat ho, to aksar tables ka order badal kar LEFT JOIN likh dete hain. Isliye agar tum RIGHT JOIN likhte ho to wo galat nahi hai, lekin LEFT JOIN version thoda zyada readable mana jata hai. -->

<!-- 
Lekin Interview Twist ⭐⭐⭐⭐⭐

Agar kal data change ho jaye:

emp_name	dept_name
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales
Neha	NULL
Arjun	Finance

Tab tumhari query output degi:

emp_name	dept_name
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales
Neha	NULL
Arjun	Finance ❌

Question tha:

Department is not Finance.

To Arjun nahi aana chahiye.

Isliye generic solution hoga:

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name <> 'Finance'
   OR d.dept_name IS NULL; -->

<!-- 
Interview Tip

Har database alias ko HAVING me support nahi karta.

Safer query:

HAVING COUNT(e.emp_id) > 1;

Interview me ye likhna. -->