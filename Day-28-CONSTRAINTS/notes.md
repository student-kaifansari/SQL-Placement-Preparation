<!-- Constraints ⭐⭐⭐⭐⭐
Constraints Kya Hote Hain?

Constraint ek rule hota hai jo table ke data ko valid aur consistent rakhta hai.

Example:

Employee ID duplicate nahi honi chahiye.
Name blank nahi hona chahiye.
Salary negative nahi honi chahiye.

Ye sab Constraints se control hota hai.

Types of Constraints
Constraint	Purpose	Interview Importance
PRIMARY KEY	Unique + Not Null	⭐⭐⭐⭐⭐
FOREIGN KEY	Relationship between tables	⭐⭐⭐⭐⭐
UNIQUE	Duplicate values allow nahi	⭐⭐⭐⭐⭐
NOT NULL	NULL values allow nahi	⭐⭐⭐⭐
DEFAULT	Default value set karta hai	⭐⭐⭐
CHECK	Condition verify karta hai	⭐⭐⭐⭐⭐
Aaj ka Topic

Aaj hum sirf PRIMARY KEY padhenge.

Ek din me ek constraint. Isse concept strong hoga.

PRIMARY KEY
Definition

Primary Key ek aisa column hota hai jo:

✅ Unique hota hai.
✅ NULL nahi ho sakta.

Matlab:

Duplicate value ❌
NULL ❌
Example
CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
Insert Data
INSERT INTO students VALUES
(1,'Aman',22),
(2,'Kaif',21),
(3,'Sara',23);
Table
student_id	name	age
1	Aman	22
2	Kaif	21
3	Sara	23
Rule 1

Duplicate Primary Key allowed?

INSERT INTO students
VALUES
(1,'Rahul',25);
Output
Error

Duplicate entry '1' for key 'PRIMARY'
Rule 2

NULL allowed?

INSERT INTO students
VALUES
(NULL,'Ali',24);
Output
Error

Primary key cannot be NULL
Composite Primary Key

Kabhi-kabhi ek column se unique identify nahi hota.

Example:

Student ek subject ko sirf ek baar choose kar sakta hai.

CREATE TABLE student_subject
(
    student_id INT,
    subject_id INT,

    PRIMARY KEY(student_id, subject_id)
);

Allowed

student_id	subject_id
1	101
1	102
2	101

Not Allowed

student_id	subject_id
1	101
1	101
AUTO_INCREMENT

Har baar ID manually likhna achha nahi.

CREATE TABLE students
(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

Insert

INSERT INTO students(name,age)
VALUES
('Aman',22),
('Kaif',21),
('Sara',23);

Output

student_id	name
1	Aman
2	Kaif
3	Sara

ID automatically generate ho gayi. -->
<!-- 

Placement Interview Questions
Q1. PRIMARY KEY kya hoti hai?

Answer:

Primary Key table ki har row ko uniquely identify karti hai. Isme duplicate aur NULL values allowed nahi hoti.

Q2. Kya ek table me multiple PRIMARY KEY ho sakti hain?

❌ Nahi

Sirf ek Primary Key hoti hai.

Lekin us Primary Key me multiple columns ho sakte hain (Composite Primary Key).

Q3. PRIMARY KEY = UNIQUE + NOT NULL ?

✅ Yes.

Primary Key automatically:

UNIQUE hoti hai.
NOT NULL hoti hai.
Q4. Composite Primary Key kya hoti hai?

Jab do ya usse zyada columns milkar unique record identify karein.

Example:

PRIMARY KEY(student_id, subject_id) -->