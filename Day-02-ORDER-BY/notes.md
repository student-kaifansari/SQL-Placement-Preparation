<!-- # Day 02 - ORDER BY

## Definition

ORDER BY is used to sort the result set in ascending or descending order.

---

## Syntax

```sql
SELECT *
FROM Employee
ORDER BY column_name;
ASC

Ascending Order (Default)

ORDER BY salary ASC;
DESC

Descending Order

ORDER BY salary DESC;
Multiple Columns
ORDER BY city ASC, salary DESC;

First data is sorted by city.

If city is same, then salary is sorted.

Important Points

✔ ASC is default.

✔ ORDER BY is executed after SELECT.

✔ Multiple columns can be used.

✔ Every column can have its own sorting order.

Example

ORDER BY department ASC, salary DESC;
Interview Questions

Q1. What is the default sorting order?

Answer:
ASC

Q2. Can ORDER BY sort multiple columns?

Answer:
Yes

Q3. Is this valid?

ORDER BY city AND salary;

Answer:
❌ No

Correct

ORDER BY city, salary;
Common Mistakes

❌ ORDER BY city AND salary

✅ ORDER BY city, salary

❌ ORDER BY salary dec

✅ ORDER BY salary DESC -->