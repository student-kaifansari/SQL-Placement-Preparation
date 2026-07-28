<!-- CASE Statement ⭐⭐⭐⭐⭐
CASE kya hai?

CASE SQL ka if-else hai.

Jaise C++ me:

if (salary >= 70000)
    cout << "High";
else
    cout << "Low";

SQL me:

CASE
    WHEN salary >= 70000 THEN 'High'
    ELSE 'Low'
END
CASE ke Types
1. Simple CASE

Ek hi column ko compare karta hai.

Syntax:

SELECT name,
CASE department
    WHEN 'IT' THEN 'Information Technology'
    WHEN 'HR' THEN 'Human Resource'
    WHEN 'Sales' THEN 'Sales Department'
    ELSE 'Other'
END AS Department_Name
FROM employees_table;
Output
name	Department_Name
Aman	Information Technology
Kaif	Human Resource
Ali	Sales Department
2. Searched CASE ⭐⭐⭐⭐⭐

Conditions likhte hain.

Syntax:

SELECT name,
salary,
CASE
    WHEN salary >= 70000 THEN 'High Salary'
    WHEN salary >= 50000 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS Salary_Category
FROM employees_table;
SQL Execution

For Rahul (70000)

salary >=70000 ?

YES

Return High Salary

For Aman (50000)

salary >=70000 ?

NO

salary>=50000 ?

YES

Return Medium Salary

For Kaif (35000)

salary>=70000 ?

NO

salary>=50000 ?

NO

ELSE

Low Salary
Important Rule

CASE top se bottom check hota hai.

Example:

CASE
WHEN salary>=50000 THEN 'A'
WHEN salary>=70000 THEN 'B'
END

Rahul ki salary = 70000

Kya output hoga?

A

Kyun?

Pehla condition hi true ho gaya.

Second kabhi check hi nahi hua.

👉 Isliye specific condition pehle, general condition baad me.

Correct:

CASE
WHEN salary>=70000 THEN 'High'
WHEN salary>=50000 THEN 'Medium'
ELSE 'Low'
END
CASE in SELECT
SELECT
name,
salary,
CASE
WHEN salary>=60000 THEN 'Eligible'
ELSE 'Not Eligible'
END AS Status
FROM employees_table;
CASE in ORDER BY

High salary wale pehle:

SELECT *
FROM employees_table
ORDER BY
CASE
WHEN salary>=70000 THEN 1
WHEN salary>=50000 THEN 2
ELSE 3
END;
CASE with Aggregate

Department-wise High Earners

SELECT
department,
COUNT(
CASE
WHEN salary>=50000 THEN 1
END
) AS High_Earners
FROM employees_table
GROUP BY department;

Ye interview me bahut poocha jata hai.

Interview Difference
IF()
IF(salary>50000,'Yes','No')
MySQL specific
Har database me available nahi.
CASE
CASE
WHEN salary>50000 THEN 'Yes'
ELSE 'No'
END
ANSI SQL Standard
Oracle
SQL Server
PostgreSQL
MySQL
Sab me chalta hai.

👉 Placement me CASE use karo. -->



<!-- 
Situation 1: Sirf value check karni hai

Suppose variable hai:

string department = "IT";

Tum C++ me likhoge:

if(department == "IT")
    cout << "Developer";
else if(department == "HR")
    cout << "Recruiter";

SQL me iske 2 tareeke hain.

Method 1 (Simple CASE)
CASE department
    WHEN 'IT' THEN 'Developer'
    WHEN 'HR' THEN 'Recruiter'
END

Yahan SQL khud samajh leta hai:

department == 'IT'
department == 'HR'

Isliye department baar-baar nahi likhna padta.

Method 2 (Searched CASE)
CASE
    WHEN department = 'IT' THEN 'Developer'
    WHEN department = 'HR' THEN 'Recruiter'
END

Ye bhi bilkul sahi hai.

Dono ka output same hai.

Situation 2: Condition check karni hai

Ab salary dekhte hain.

if(salary >= 70000)
    Grade = "A";
else if(salary >= 50000)
    Grade = "B";

SQL me:

CASE
    WHEN salary >= 70000 THEN 'A'
    WHEN salary >= 50000 THEN 'B'
END

Ab socho...

Kya ye likh sakte ho?

CASE salary
    WHEN >=70000 THEN 'A'

❌ Nahi. Ye syntax hi galat hai.

Kyunki CASE salary sirf equal (=) compare kar sakta hai.

Bas ek rule yaad rakho
Agar WHEN ke baad sirf value likhi hai:
CASE city
    WHEN 'Delhi'
    WHEN 'Noida'
END

👉 CASE ke baad column aayega.

Agar WHEN ke baad condition likhi hai:
CASE
    WHEN salary >= 50000
    WHEN age > 25
END

👉 CASE ke baad column nahi aayega. -->

<!-- 

Placement Shortcut

Main interview me sirf ye dekhta hoon:

Equality (=) check?

✅ Simple CASE

CASE department
CASE city
CASE gender
Range (>, <, >=, <=, BETWEEN, AND, OR)?

✅ Searched CASE

CASE
    WHEN salary >= 50000
    WHEN age > 25
🔥 Ab tumhara ek final test

Bina soche batao:

Q1
Marks:
90 = A
80 = B
70 = C

👉 Simple ya Searched?

Q2
Marks:
>=90 = A
>=80 = B
Else C

👉 Simple ya Searched? -->


============================================================

<!-- 
Ek Final Revision Table
Situation	CASE Type	Example
department = 'IT'	✅ Simple CASE	CASE department WHEN 'IT' THEN ...
city = 'Delhi'	✅ Simple CASE	CASE city WHEN 'Delhi' THEN ...
gender = 'Male'	✅ Simple CASE	CASE gender WHEN 'Male' THEN ...
salary >= 50000	✅ Searched CASE	CASE WHEN salary >= 50000 THEN ...
age > 25	✅ Searched CASE	CASE WHEN age > 25 THEN ...
salary BETWEEN 40000 AND 60000	✅ Searched CASE	CASE WHEN salary BETWEEN ...
city='Delhi' AND salary>50000	✅ Searched CASE	CASE WHEN city='Delhi' AND salary>50000 THEN ... -->