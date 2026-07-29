Pehle Same Data Har Example Me Use Karenge
Parent Table (Departments)
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|    1    | IT        |
|    2    | HR        |
+---------+-----------+
Child Table (Employees)
+--------+------+---------+
| emp_id | name | dept_id |
+--------+------+---------+
| 101    | Aman |    1    |
| 102    | Kaif |    1    |
| 103    | Sara |    2    |
+--------+------+---------+

Ab har case me hum Department 1 delete karenge.

DELETE FROM departments
WHERE dept_id = 1;

Ab dekhte hain har option kya karta hai.

1. ON DELETE CASCADE ⭐⭐⭐⭐⭐
Matlab

Parent delete → Child bhi delete

Tables Before Delete

Departments

1 IT
2 HR

Employees

101 Aman 1
102 Kaif 1
103 Sara 2

Delete

DELETE FROM departments
WHERE dept_id=1;
Result

Departments

2 HR

Employees

103 Sara 2

Aman aur Kaif delete ho gaye.

Kyu?

Kyuki unka department hi delete ho gaya.

Real Life

Instagram

User
↓

Posts
↓

Comments
↓

Likes

Agar user permanently delete ho gaya,

to uske Posts bhi delete,

Comments bhi delete,

Likes bhi delete.

Ye CASCADE hai.

2. ON DELETE SET NULL ⭐⭐⭐⭐
Matlab

Parent delete

↓

Child delete nahi hoga

↓

Foreign Key NULL ho jayegi

Delete

DELETE FROM departments
WHERE dept_id=1;

Result

Departments

2 HR

Employees

101 Aman NULL
102 Kaif NULL
103 Sara 2

Notice

Aman aur Kaif delete nahi hue.

Bas unka department unknown ho gaya.

Real Life

Hospital

Doctor resign kar gaya.

Appointment delete nahi karte.

Bas

doctor_id = NULL

kar dete hain.

3. ON DELETE RESTRICT ⭐⭐⭐⭐⭐
Matlab

Agar child exist karta hai

↓

Parent delete hi nahi hoga.

Delete

DELETE FROM departments
WHERE dept_id=1;

Output

ERROR
Cannot delete parent row

Kuch bhi delete nahi hua.

Departments

1 IT
2 HR

Employees

101 Aman 1
102 Kaif 1
103 Sara 2

Sab same.

Real Life

Bank

Customer ke loan chal rahe hain.

Tum customer record delete nahi kar sakte.

Pehle loan close karo.

Fir delete karo.

Ye RESTRICT hai.

4. ON DELETE NO ACTION ⭐⭐⭐⭐

Ye sunne me alag lagta hai.

Lekin MySQL me

NO ACTION ≈ RESTRICT

Delete

DELETE FROM departments
WHERE dept_id=1;

Output

ERROR

Delete nahi hoga.

Interview

Difference between RESTRICT and NO ACTION?

MySQL

Almost same.

Other Databases

Thoda internal implementation different ho sakta hai.

Placement ke liye itna yaad rakhna enough hai.

5. ON UPDATE CASCADE ⭐⭐⭐⭐⭐

Ye DELETE nahi hai.

Ye UPDATE ke liye hai.

Suppose

Departments

1 IT
2 HR

Employees

101 Aman 1
102 Kaif 1

Ab

UPDATE departments
SET dept_id=10
WHERE dept_id=1;

Result

Departments

10 IT
2 HR

Employees automatically

101 Aman 10
102 Kaif 10

Foreign Key khud update ho gayi.

Ek Diagram Se Yaad Rakho
DELETE Parent

        |
        |

CASCADE
        ↓
Child bhi delete


SET NULL
        ↓
Child rahega
FK = NULL


RESTRICT
        ↓
Delete allowed hi nahi


NO ACTION
        ↓
MySQL me RESTRICT jaisa


UPDATE Parent Key
        ↓

ON UPDATE CASCADE
        ↓
Child FK bhi update
Interview Trick Question

Question:

Kaunsa option sabse dangerous hai?

Answer:

✅ ON DELETE CASCADE

Kyun?

Ek Parent delete kiya aur hazaron Child rows delete ho sakti hain.

Kaunsi Company Kya Use Karti Hai?
System	Mostly Used
Banking	RESTRICT
Hospital	SET NULL
Social Media	CASCADE
E-commerce Orders	RESTRICT
School Management	CASCADE ya RESTRICT (requirement ke hisaab se)
Placement MCQs
Q1

Parent delete hua.

Child bhi delete.

Answer?

✅ CASCADE

Q2

Parent delete hua.

Child raha.

FK NULL.

Answer?

✅ SET NULL

Q3

Parent delete hi nahi hua.

Answer?

✅ RESTRICT

Q4

Parent key update hui.

Child key bhi update hui.

Answer?

✅ ON UPDATE CASCADE