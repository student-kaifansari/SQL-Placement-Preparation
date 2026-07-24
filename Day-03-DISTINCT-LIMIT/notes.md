<!-- # Day 03 - DISTINCT & LIMIT

## DISTINCT

DISTINCT is used to remove duplicate values from the result.

### Syntax

```sql
SELECT DISTINCT column_name
FROM Employee;
```

### Example

```sql
SELECT DISTINCT department
FROM Employee;
```

---

## LIMIT

LIMIT is used to restrict the number of rows returned.

### Syntax

```sql
SELECT *
FROM Employee
LIMIT 5;
```

---

## OFFSET

OFFSET is used to skip rows before returning the result.

### Syntax

```sql
SELECT *
FROM Employee
LIMIT 2 OFFSET 3;
```

Meaning:

- Skip first 3 rows
- Return next 2 rows

---

## Top N Records

Highest salary

```sql
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1;
```

Top 3 salaries

```sql
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;
```

---

## Second Highest Salary

```sql
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
```

---

## COUNT Review

| Function | Description |
|----------|-------------|
| COUNT(*) | Counts all rows |
| COUNT(column) | Counts only non-NULL values |
| COUNT(DISTINCT column) | Counts unique non-NULL values |

---

## Interview Questions

### Q1. What is DISTINCT used for?

Answer:

Removes duplicate values.

---

### Q2. Can DISTINCT be used on multiple columns?

Answer:

Yes.

Example

```sql
SELECT DISTINCT department, city
FROM Employee;
```

---

### Q3. Difference between LIMIT and OFFSET?

Answer:

- LIMIT decides how many rows to return.
- OFFSET decides how many rows to skip.

---

### Q4. Difference between

```sql
COUNT(*)
```

and

```sql
COUNT(DISTINCT department)
```

Answer:

- COUNT(*) counts all rows.
- COUNT(DISTINCT department) counts unique non-NULL departments.

---

## Common Mistakes

❌

```sql
SELECT DISTINCT salary
LIMIT 3;
```

✔

```sql
SELECT DISTINCT salary
FROM Employee
LIMIT 3;
```

---

❌

```sql
LIMIT 3,2
```

✔ (Recommended)

```sql
LIMIT 2 OFFSET 3;
``` -->