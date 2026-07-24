<!-- # Day 01 - SELECT & WHERE

## SELECT

Used to retrieve data from a table.

Syntax

```sql
SELECT column_name
FROM table_name;
```

Example

```sql
SELECT *
FROM Employee;
```

---

## WHERE

Used to filter rows.

Example

```sql
SELECT *
FROM Employee
WHERE salary > 50000;
```

---

## Comparison Operators

| Operator | Meaning |
|----------|---------|
| = | Equal |
| > | Greater Than |
| < | Less Than |
| >= | Greater Than or Equal |
| <= | Less Than or Equal |
| != | Not Equal |

---

## BETWEEN

Used to check values within a range.

Syntax

```sql
salary BETWEEN 40000 AND 70000
```

BETWEEN is **inclusive**.

Equivalent to

```sql
salary >= 40000
AND salary <= 70000
```

---

## IN

Used to compare multiple values.

Example

```sql
department IN ('IT','HR')
```

Equivalent to

```sql
department='IT'
OR department='HR'
```

---

## Interview Notes

✔ WHERE filters rows before GROUP BY.

✔ WHERE cannot use aggregate functions.

✔ BETWEEN is inclusive.

✔ IN is better than multiple OR conditions. -->