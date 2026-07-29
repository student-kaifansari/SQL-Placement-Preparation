<!-- DEFAULT Constraint ⭐⭐⭐
DEFAULT kya hota hai?

Agar user kisi column ki value insert nahi karta, to SQL DEFAULT value automatically insert kar deta hai.

Real-Life Example

Employee join hua.

Usne city nahi batayi.

Hum chahte hain by default city = "Noida" save ho.

Yahi DEFAULT karta hai.

Syntax
CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30) DEFAULT 'Noida'
);
Example
Insert
INSERT INTO employees(emp_id,name)
VALUES
(101,'Aman');

Output

emp_id	name	city
101	Aman	Noida

Automatically "Noida" aa gaya.

Agar Value Do
INSERT INTO employees
VALUES
(102,'Kaif','Delhi');

Output

emp_id	name	city
102	Kaif	Delhi

DEFAULT tabhi use hota hai jab value provide na ki ho.

DEFAULT with Date
CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE DEFAULT (CURRENT_DATE)
);

Insert

INSERT INTO orders(order_id,customer_name)
VALUES
(1,'Aman');

Today's date automatically save ho jayegi. -->


===========================================================================


<!-- 
CHECK Constraint ⭐⭐⭐⭐⭐
CHECK kya hota hai?

CHECK kisi column ki value ko condition ke according validate karta hai.

Agar condition true hai → Insert ho jayega.

Agar false hai → Error.

Example

Age 18 se kam nahi honi chahiye.

CREATE TABLE students
(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT CHECK(age >= 18)
);
Valid Insert
INSERT INTO students
VALUES
(1,'Aman',22);

✅ Success

Invalid Insert
INSERT INTO students
VALUES
(2,'Kaif',16);

Output

Error

CHECK constraint violated
Salary Validation
CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT CHECK(salary > 0)
);
Valid
INSERT INTO employees
VALUES
(1,'Aman',50000);
Invalid
INSERT INTO employees
VALUES
(2,'Ali',-1000);

Error

Negative salary allow nahi hogi.

Multiple CHECK Conditions
CREATE TABLE students
(
    id INT PRIMARY KEY,
    age INT CHECK(age BETWEEN 18 AND 60),
    marks INT CHECK(marks BETWEEN 0 AND 100)
); -->



<!-- 
Interview Questions
Q1. DEFAULT kab use hota hai?

Answer: Jab insert statement me us column ki value provide nahi ki jaati.

Q2. Kya DEFAULT existing value ko overwrite karta hai?

Answer: ❌ Nahi. Agar value di gayi hai to wahi save hogi.

Q3. CHECK ka purpose kya hai?

Answer: Data validation. Sirf wahi values allow hoti hain jo condition satisfy karti hain.

Q4. Kya ek table me multiple CHECK constraints ho sakte hain?

Answer: ✅ Haan.

Comparison
Constraint	Purpose	Example
PRIMARY KEY	Unique row identify	emp_id
UNIQUE	Duplicate stop	email
NOT NULL	NULL stop	name
DEFAULT	Value na mile to default	city = 'Noida'
CHECK	Condition validate	age >= 18 -->