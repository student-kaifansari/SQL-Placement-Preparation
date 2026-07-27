<!-- Function 1: NOW()
Definition

NOW() current date + current time return karta hai.

Syntax
SELECT NOW();
Example
SELECT NOW();

Output (Example)

2026-07-27 18:45:30

⚠️ Output tumhare system ke current date aur time ke according alag hoga.

Function 2: CURDATE()

Sirf current date return karta hai.

SELECT CURDATE();

Output

2026-07-27
Function 3: CURTIME()

Sirf current time return karta hai.

SELECT CURTIME();

Output

18:45:30
Difference
Function	Returns
NOW()	Date + Time
CURDATE()	Only Date
CURTIME()	Only Time
Interview Question ⭐
Q1

What is the difference between:

SELECT NOW();

and

SELECT CURDATE();

Answer:

NOW() → Current Date + Current Time
CURDATE() → Only Current Date -->


<!-- 
📅 Function 4: YEAR()
Definition

YEAR() kisi bhi date se sirf year nikalta hai.

Syntax
YEAR(date)
Example 1
SELECT YEAR('2026-07-27');

Output

2026
Example 2
SELECT YEAR(NOW());

Output (Current Year)

2026
📅 Function 5: MONTH()
Definition

MONTH() date se month number (1–12) return karta hai.

Syntax
MONTH(date)
Example 1
SELECT MONTH('2026-07-27');

Output

7
Example 2
SELECT MONTH(NOW());

Output

7
📅 Function 6: DAY()
Definition

DAY() (ya DAYOFMONTH()) date ka day (1–31) return karta hai.

Syntax
DAY(date)
Example 1
SELECT DAY('2026-07-27');

Output

27
Example 2
SELECT DAY(NOW());

Output

27
⭐ Combined Example
SELECT
YEAR(NOW()) AS Year,
MONTH(NOW()) AS Month,
DAY(NOW()) AS Day;

Example Output

Year	Month	Day
2026	7	27
Difference
Function	Returns
YEAR()	Year
MONTH()	Month Number
DAY()	Day of Month
🎯 Placement Interview Questions
Q1

What is the output?

SELECT YEAR('2025-12-31');
Q2

What is the output?

SELECT MONTH('2026-01-15');
Q3

What is the output?

SELECT DAY('2024-02-29');
Q4

Write a query to display the current year.

Q5

Write a query to display the current month.

Q6

Write a query to display the current day. -->
<!-- 
💡 Interview Tip

Agar interviewer poochhe:

"How do you extract parts of a date in SQL?"

Tum confidently bol sakte ho:

YEAR(date) → Year
MONTH(date) → Month Number
DAY(date) → Day of Month -->



==================================================


<!-- 
1. DAYNAME()
Purpose

Date ka day name return karta hai.

Syntax
SELECT DAYNAME('2026-07-27');

Output

Monday
Example
SELECT DAYNAME(NOW());
2. MONTHNAME()
Purpose

Date ka month name return karta hai.

Syntax
SELECT MONTHNAME('2026-07-27');

Output

July
Example
SELECT MONTHNAME(NOW());
3. DATEDIFF()
Purpose

Do dates ke beech kitne days ka difference hai.

Syntax
DATEDIFF(date1, date2)

Formula

date1 - date2
Example 1
SELECT DATEDIFF('2026-07-27','2026-07-20');

Output

7
Example 2
SELECT DATEDIFF(CURDATE(),'2026-07-01');

Output (depends on current date)

4. DATE_ADD()
Purpose

Date me days/months/years add karna.

Syntax
DATE_ADD(date, INTERVAL value unit)
Add 10 Days
SELECT DATE_ADD('2026-07-27', INTERVAL 10 DAY);

Output

2026-08-06
Add 2 Months
SELECT DATE_ADD('2026-07-27', INTERVAL 2 MONTH);

Output

2026-09-27
Add 1 Year
SELECT DATE_ADD('2026-07-27', INTERVAL 1 YEAR);

Output

2027-07-27
5. DATE_SUB()
Purpose

Date se days/months/years minus karna.

Syntax
DATE_SUB(date, INTERVAL value unit)
Minus 5 Days
SELECT DATE_SUB('2026-07-27', INTERVAL 5 DAY);

Output

2026-07-22
Minus 1 Month
SELECT DATE_SUB('2026-07-27', INTERVAL 1 MONTH);

Output

2026-06-27
Minus 2 Years
SELECT DATE_SUB('2026-07-27', INTERVAL 2 YEAR);

Output

2024-07-27
🎯 Most Asked Interview Questions
Current Year
SELECT YEAR(NOW());
Current Month
SELECT MONTH(NOW());
Current Day
SELECT DAY(NOW());
Current Day Name
SELECT DAYNAME(NOW());
Current Month Name
SELECT MONTHNAME(NOW());
Difference Between Two Dates
SELECT DATEDIFF('2026-07-27','2026-07-20');
Add 30 Days
SELECT DATE_ADD(CURDATE(), INTERVAL 30 DAY);
Subtract 7 Days
SELECT DATE_SUB(CURDATE(), INTERVAL 7 DAY);
📌 Placement Cheat Sheet
Function	Purpose
NOW()	Current Date + Time
CURDATE()	Current Date
CURTIME()	Current Time
YEAR()	Extract Year
MONTH()	Extract Month
DAY()	Extract Day
DAYNAME()	Monday, Tuesday...
MONTHNAME()	January, February...
DATEDIFF()	Difference in Days
DATE_ADD()	Add Date/Time Interval
DATE_SUB()	Subtract Date/Time Interval -->