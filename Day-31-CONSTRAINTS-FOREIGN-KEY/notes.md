FOREIGN KEY ⭐⭐⭐⭐⭐⭐
Pehle Problem Samjho

Maan lo hamare paas do tables hain.

Departments
dept_id	dept_name
1	IT
2	HR
3	Sales
Employees
emp_id	name	dept_id
101	Aman	1
102	Kaif	2
103	Sara	5

Ab problem dekho.

Employee Sara ka department 5 hai.

Lekin Departments table me 5 exist hi nahi karta.

Ye galat data hai.

Isi problem ko FOREIGN KEY solve karta hai.

FOREIGN KEY Kya Hai?

FOREIGN KEY ek constraint hai jo do tables ke beech relationship banata hai.

Ye ensure karta hai ki child table ki value parent table me exist kare.

Simple language me:

Child table kisi bhi aisi value ko store nahi kar sakti jo Parent table me na ho.

Parent Table

Jis table ki PRIMARY KEY ko reference kiya jaata hai.

Example

Departments
Child Table

Jo Parent ki PRIMARY KEY ko use karta hai.

Example

Employees
Visualization
Departments (Parent)

dept_id
-------
1
2
3

        ▲
        │
        │ FOREIGN KEY
        │

Employees (Child)

emp_id   dept_id
101         1
102         2
103         3
Syntax
CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),

    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);
Insert Parent Data
INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Sales');
Valid Insert
INSERT INTO employees VALUES
(101,'Aman',1),
(102,'Kaif',2),
(103,'Sara',3);

✅ Success

Invalid Insert
INSERT INTO employees VALUES
(104,'Ali',5);

Output

Error

Cannot add or update a child row:
a foreign key constraint fails

Kyun?

Kyuki Departments table me dept_id = 5 exist hi nahi karta.

Real-Life Examples
College Database

Parent

Courses

course_id
----------
101
102
103

Child

Students

student_id
course_id

Student sirf wahi course choose kar sakta hai jo available ho.

E-commerce

Parent

Customers

Child

Orders

Order tabhi create hoga jab Customer pehle se exist kare.

Hospital

Parent

Doctors

Child

Appointments

Appointment sirf existing doctor ke saath ban sakti hai.

Important Rule

Foreign Key hamesha

👉 Parent Table ki

PRIMARY KEY

ya

UNIQUE KEY

ko reference karti hai.

Interview Question

Can FOREIGN KEY reference a normal column?

❌ No

Ye sirf PRIMARY KEY ya UNIQUE column ko reference karti hai.


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



Placement Interview Questions
Q1

What is Referential Integrity?

Answer

Referential Integrity ka matlab hai:

Child table ki FOREIGN KEY value hamesha Parent table me exist honi chahiye.

Q2

Can Child Table exist without Parent Table?

❌ Nahi.

Pehle Parent table create hoti hai.

Uske baad Child table.

Q3

Can Parent Table be deleted?

Answer: Depends.

Agar child table me uska reference hai, to by default delete nahi kar sakte. Isi behavior ko control karne ke liye ON DELETE options use hote hain.

Diagram (Yaad Rakhne Ka Trick)
Departments
------------------
dept_id (PK)
dept_name

        ▲
        │
        │
Employees
------------------
emp_id (PK)
name
dept_id (FK)


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



Joins padhte waqt FOREIGN KEY hona zaroori nahi hota.

Ye dekh:

Table 1
employees
emp_id	name	dept_id
101	Aman	1
102	Kaif	2
103	Sara	1
Table 2
departments
dept_id	dept_name
1	IT
2	HR

Ab JOIN likho:

SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

Ye query bilkul sahi chalegi, chahe employees.dept_id par FOREIGN KEY ho ya na ho.

To phir FOREIGN KEY ka use kya hai?

FOREIGN KEY JOIN ke liye nahi, balki data ko validate karne ke liye hoti hai.

Agar FOREIGN KEY nahi hai

Tum ye insert kar sakte ho:

INSERT INTO employees
VALUES
(104,'Rahul',50000,10);

Departments table me dept_id = 10 nahi hai.

Fir bhi insert ho jayega. ❌ (Galat data)

Agar FOREIGN KEY hai
FOREIGN KEY(dept_id)
REFERENCES departments(dept_id)

Ab wahi query:

INSERT INTO employees
VALUES
(104,'Rahul',50000,10);

Output:

ERROR
Cannot add or update a child row

Ab database galat data save hi nahi karega. ✅

Interview Point ⭐⭐⭐⭐⭐

Question: Can we use JOIN without a FOREIGN KEY?

Answer: Yes.

JOIN sirf condition dekhta hai:

ON table1.column = table2.column

Usse koi farq nahi padta ki FOREIGN KEY lagi hai ya nahi.

Simple Difference
JOIN	FOREIGN KEY
Data ko combine karta hai	Data ko validate karta hai
SELECT operation me use hota hai	CREATE TABLE ke time define hota hai
FK hona zaroori nahi	Relationship enforce karta hai
Existing data ko read karta hai	Galat data insert/update hone se rokta hai
Real Company Example

Suppose Amazon ka database hai.

orders

order_id	customer_id
1	101
2	999

customers

customer_id	name
101	Aman

Agar FOREIGN KEY nahi hai to customer_id = 999 wala order bhi save ho jayega, jabki aisa customer exist hi nahi karta.

Lekin JOIN phir bhi chalega:

SELECT *
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;

Output:

order_id	customer_id	name
1	101	Aman
2	999	NULL

Query chal gayi, bas second row me match nahi mila.

Ek line me yaad rakhna:
JOIN = Data ko jodna (retrieve karna).
FOREIGN KEY = Data ko sahi rakhna (integrity maintain karna).