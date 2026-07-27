<!-- What is JOIN?

Simple language me:

JOIN ka use do ya usse zyada tables ko common column ke basis par combine karne ke liye hota hai.

Example:

Ek table me Employee ki information hai.

emp_id	name	dept_id
1	Aman	101
2	Kaif	102
3	Sara	101

Dusri table me Department ki information hai.

dept_id	department
101	IT
102	HR
103	Sales

Ab agar interviewer bole:

"Employee ka naam aur uska department batao."

Ye information ek table me nahi hai.

Isliye JOIN use hoga.

Result:

name	department
Aman	IT
Kaif	HR
Sara	IT
Real Life Example

Socho:

Students Table

Student_ID	Name
1	Kaif
2	Aman

Marks Table

Student_ID	Marks
1	95
2	88

Question:

Show student's name with marks.

Answer:

JOIN.

Why JOIN?

Without JOIN

Employee Table
↓
Only employee data
Department Table
↓
Only department data

After JOIN

Employee + Department
↓
One complete result
Types of JOIN
JOIN
│
├── INNER JOIN ⭐⭐⭐⭐⭐
├── LEFT JOIN ⭐⭐⭐⭐⭐
├── RIGHT JOIN ⭐⭐⭐⭐
├── FULL OUTER JOIN ⭐⭐⭐
├── SELF JOIN ⭐⭐⭐⭐
└── CROSS JOIN ⭐⭐⭐
Step 1: Dataset

Aaj se hum is dataset par practice karenge.

Employee Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

INSERT INTO employees VALUES
(1,'Aman',101,50000),
(2,'Kaif',102,45000),
(3,'Sara',101,60000),
(4,'Rahul',103,55000),
(5,'Neha',NULL,40000);
Department Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Sales'),
(104,'Finance');
Table Data
employees
emp_id	emp_name	dept_id	salary
1	Aman	101	50000
2	Kaif	102	45000
3	Sara	101	60000
4	Rahul	103	55000
5	Neha	NULL	40000
departments
dept_id	dept_name
101	IT
102	HR
103	Sales
104	Finance -->


===================================================================================


<!-- 
What is INNER JOIN?

Definition:

INNER JOIN sirf un rows ko return karta hai jinka matching value dono tables me hota hai.

Simple Hindi me:

Common records hi output me aate hain.

Visual
Employees                 Departments

101  Aman      -------->   101  IT      ✅
102  Kaif      -------->   102  HR      ✅
101  Sara      -------->   101  IT      ✅
103  Rahul     -------->   103  Sales   ✅
NULL Neha                   104 Finance ❌

Output:
Aman
Kaif
Sara
Rahul

👉 Neha nahi aayegi kyunki uska dept_id = NULL hai.

👉 Finance bhi nahi aayega kyunki us department me koi employee nahi hai.

Syntax
SELECT column_names
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;

Ya simply:

SELECT column_names
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;

✅ JOIN aur INNER JOIN MySQL me same hote hain.

Example 1

Employee Name + Department Name

SELECT emp_name, dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;
Output
emp_name	dept_name
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales
Example 2 (Using Aliases ⭐ Interview Style)

Instead of writing:

employees.emp_name

Interview me aise likho:

SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
Ye professional style hai.
Example 3

Employee Name + Salary + Department

SELECT
    e.emp_name,
    e.salary,
    d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
Example 4

Show all columns

SELECT *
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
Important Interview Point
ON vs WHERE

Bahut log confuse hote hain.

ON

Tables ko join karne ke liye

ON e.dept_id = d.dept_id
WHERE

Joined data ko filter karne ke liye

WHERE salary > 50000

Example:

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;

Output:

emp_name	dept_name	salary
Sara	IT	60000
Rahul	Sales	55000 -->
<!-- 

Interview Questions (Answers)
Q1. Difference between JOIN and INNER JOIN?

✅ Answer: MySQL me JOIN aur INNER JOIN same hote hain. Dono sirf matching rows return karte hain.

Q2. Will employees with NULL department appear in an INNER JOIN?

❌ No.

Reason: NULL kisi dept_id se match nahi karta.

Q3. Will a department with no employees appear in an INNER JOIN?

❌ No.

Example: Finance (104) output me nahi aayega kyunki us department me koi employee nahi hai.

Q4. What is the purpose of the ON clause?

✅ ON clause join condition batata hai, yani kis column ke basis par tables ko match karna hai.

Example:

ON e.dept_id = d.dept_id
Q5. Can we use table aliases in JOIN?

✅ Yes.

Example:

FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
⭐ Interview Tip

Agar interview me kabhi output galat aa raha ho, sabse pehle ON condition check karo.

90% JOIN errors isi wajah se hote hain:

-- ❌ Wrong
ON e.dept_id = e.dept_id

-- ✅ Correct
ON e.dept_id = d.dept_id

Ye bahut hi common mistake hai aur tumne abhi isi trap ko identify kar liya. Agle questions me is par dhyan rakhna. -->


<!-- 
Ye hi concept interviewer poochta hai:

"Internally JOIN kaise kaam karta hai?"

Agar tum ye explain kar pao, to interviewer ko lagega ki tumhe sirf syntax nahi, concept bhi aata hai.

Hamara Data
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
Query
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
Internal Working

Database internally almost aise sochta hai (conceptually).

Step 1

Employee table ki first row uthao.

Aman
dept_id = 101

Ab Department table me search karo.

101 == 101 ?

Yes ✅

Output

emp_name	dept_name
Aman	IT
Step 2

Second employee

Kaif
dept_id = 102

Department table

101 ==102 ❌

102 ==102 ✅

Output

emp_name	dept_name
Kaif	HR
Step 3

Third employee

Sara
dept_id =101

Department table

101==101 ✅

Output

emp_name	dept_name
Sara	IT
Step 4

Fourth employee

Rahul
dept_id=103

Department table

103==103 ✅

Output

emp_name	dept_name
Rahul	Sales
Step 5

Fifth employee

Neha
dept_id=NULL

Department table

101==NULL ❌

102==NULL ❌

103==NULL ❌

104==NULL ❌

No Match

So

Neha is discarded.
Final Output
emp_name	dept_name
Aman	IT
Kaif	HR
Sara	IT
Rahul	Sales -->