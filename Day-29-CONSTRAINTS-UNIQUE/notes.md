<!-- UNIQUE Constraint ⭐⭐⭐⭐⭐
UNIQUE kya hai?

UNIQUE ka kaam hai duplicate values ko rokna.

Matlab:

❌ Duplicate Allowed Nahi
✅ NULL Allowed (MySQL me multiple NULLs allowed hote hain)
Syntax
CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(50)
);
Insert Data
INSERT INTO students VALUES
(1,'aman@gmail.com','Aman'),
(2,'kaif@gmail.com','Kaif'),
(3,'sara@gmail.com','Sara');
Duplicate Email
INSERT INTO students VALUES
(4,'aman@gmail.com','Rahul');
Output
Error

Duplicate entry 'aman@gmail.com'
for key 'email'
NULL Values
INSERT INTO students VALUES
(4,NULL,'Ali');

INSERT INTO students VALUES
(5,NULL,'Riya');
Output

✅ Dono insert ho jayenge.

MySQL me UNIQUE column me multiple NULL values allowed hoti hain.

Multiple UNIQUE Constraints

Ek table me multiple UNIQUE ho sakte hain.

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    aadhar VARCHAR(20) UNIQUE
);

Yahan:

Email duplicate ❌
Phone duplicate ❌
Aadhaar duplicate ❌ -->


<!-- 
Interview Questions
Q1

Can UNIQUE contain duplicate values?

Answer: ❌ No.

Q2

Can UNIQUE contain NULL values?

Answer: ✅ Yes.

(MySQL me multiple NULL values allowed hoti hain.)

Q3

Ek table me kitne UNIQUE ho sakte hain?

Answer: Multiple.

NOT NULL Constraint ⭐⭐⭐⭐
NOT NULL kya hai?

NOT NULL ka matlab:

Is column me NULL value allowed nahi hai.

Duplicate allowed hain.

NULL allowed nahi hai. -->

<!-- 

NOT NULL Constraint ⭐⭐⭐⭐
NOT NULL kya hai?

NOT NULL ka matlab:

Is column me NULL value allowed nahi hai.

Duplicate allowed hain.

NULL allowed nahi hai.

Syntax
CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT
);
Valid Insert
INSERT INTO employees VALUES
(1,'Aman',50000);
Invalid Insert
INSERT INTO employees VALUES
(2,NULL,40000);

Output

Error

Column 'name' cannot be NULL -->


<!-- 
⭐ Most Important Interview Question
PRIMARY KEY vs UNIQUE vs NOT NULL
Feature	PRIMARY KEY	UNIQUE	NOT NULL
Duplicate Allowed	❌ No	❌ No	✅ Yes
NULL Allowed	❌ No	✅ Yes (MySQL)	❌ No
Per Table	Only 1	Multiple	Multiple
Purpose	Unique Identity	Unique Values	Mandatory Value
Example
Value	PRIMARY KEY	UNIQUE	NOT NULL
101	✅	✅	✅
101	❌	❌	✅
NULL	❌	✅	❌ -->