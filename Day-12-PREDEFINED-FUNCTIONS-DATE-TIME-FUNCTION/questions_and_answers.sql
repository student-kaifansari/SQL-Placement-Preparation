-- 📚 Topic: Date & Time Functions (⭐⭐⭐⭐⭐ Placement Important)

-- Ye functions interviews me bahut frequently use hote hain.

-- Aaj ka Plan
-- Part 1
-- ✅ NOW()
-- ✅ CURDATE()
-- ✅ CURTIME()
-- Part 2
-- ✅ YEAR()
-- ✅ MONTH()
-- ✅ DAY()
-- ✅ DAYNAME()
-- ✅ MONTHNAME()
-- Part 3
-- ✅ DATEDIFF()
-- ✅ DATE_ADD()
-- ✅ DATE_SUB()


-- Q1
-- Display the current date and time.
select now();
-- Q2
-- Display only the current date.
select curdate();
-- Q3
-- Display only the current time.
select curtime();
-- Q4
-- Write a query using NOW().
select now();
-- Q5
-- Write a query using CURDATE().
select curdate();


-- ====================================================


-- Q1
-- Display the year from '2026-07-27'.
select year('2026-07-27');
-- Q2
-- Display the month from '2025-12-25'.
select month('2025-12-25');
-- Q3
-- Display the day from '2024-01-01'.
select day('2024-01-01');
-- Q4
-- Display the current year.
select year(now());
-- Q5
-- Display the current month.
select month(now());
-- Q6
-- Display the current day.
select day(now());
-- Q7
-- Display year, month and day together using NOW().
select year(now()), month(now()), day(now());
-- Q8
-- Display the year from '2004-08-15'.
select year('2004-08-15');
-- Q9
-- Display the month from '2023-11-10'.
select month('2023-11-10');
-- Q10
-- Display the day from '2022-06-30'.
select day('2022-06-30');


-- =============================================================

-- ==========================================
-- DATE FUNCTIONS PRACTICE
-- ==========================================

-- Q1
-- Display the current date and time.
select now();
-- Q2
-- Display only the current date.
select curdate();
-- Q3
-- Display only the current time.
select curtime();
-- Q4
-- Display the current year.
select year(now());
-- Q5
-- Display the current month.
select month(now());
-- Q6
-- Display the current day.
select day(now());
-- Q7
-- Display the current day name.
select dayname(now());
-- Q8
-- Display the current month name.
select monthname(now());
-- Q9
-- Display the year from '2023-10-15'.
select year('2023-10-15');
-- Q10
-- Display the month from '2025-12-25'.
select month('2025-12-25');
-- Q11
-- Display the day from '2024-01-01'.
select day('2024-01-01');
-- Q12
-- Display the day name from '2026-07-27'.
select dayname('2026-07-27');
-- Q13
-- Display the month name from '2026-12-25'.
select monthname('2026-12-25');
-- Q14
-- Find the difference in days between
-- '2026-07-27' and '2026-07-20'.
select datediff('2026-07-27','2026-07-20');
-- Q15
-- Find the difference in days between
-- CURDATE() and '2026-01-01'.
select datediff(curdate(),'2026-01-01');
-- Q16
-- Add 10 days to '2026-07-27'.
select date_add('2026-07-27', interval 10 day);
-- Q17
-- Add 2 months to '2026-07-27'.
select date_add('2026-07-27',interval 2 month);
-- Q18
-- Add 1 year to CURDATE().
select date_add(curdate(),interval 1 year);
-- Q19
-- Subtract 5 days from '2026-07-27'.
select date_sub('2026-07-27',interval 5 day);
-- Q20
-- Subtract 3 months from CURDATE().
select date_sub(curdate(),interval 3 month);
-- Q21
-- Subtract 2 years from '2026-07-27'.
select date_sub('2026-07-27',interval 2 year);
-- Q22
-- Display Year, Month and Day in a single query using NOW().
select year(now()), month(now()), day(now());
-- Q23
-- Display Year, Month, Day, Day Name and Month Name in one query.
select year(now()), month(now()), day(now()), dayname(now()), monthname(now());
-- Q24
-- Find the number of days between
-- '2026-12-31' and '2026-01-01'.
select datediff('2026-12-31','2026-01-01');
-- Q25
-- Add 100 days to CURDATE().
select date_add(curdate(), interval 100 day);


-- =======================================

-- Q31
-- Display today's date after 1 year and 15 days.
select date_add(date_add(curdate(),interval 1 year), interval 15 day);
-- Q32
-- Display today's date before 2 months and 10 days.
select date_sub(date_sub(curdate(),interval 2 month), interval 10 day);
-- Q33
-- Find the difference between today's date and '2025-01-01'.
select datediff(curdate(),'2025-01-01');
-- Q34
-- Display current Year, Month Name and Day Name together.
select year(now()) as year, monthname(now()) as month, dayname(now()) as day;
-- Q35
-- Add 5 years, 3 months and 20 days to '2026-07-27'.
select date_add(date_add(date_add('2026-07-27',interval 5 year),interval 3 month), interval 20 day);
