<!-- # Day 04 - LIKE

## Definition

The LIKE operator is used to search for a specific pattern in a string.

---

## Syntax

```sql
SELECT *
FROM Employee
WHERE column_name LIKE 'pattern';
```

---

## Wildcards

### %

Represents zero or more characters.

Example

```sql
LIKE 'A%'
```

Starts with A.

---

```sql
LIKE '%A'
```

Ends with A.

---

```sql
LIKE '%A%'
```

Contains A anywhere.

---

### _

Represents exactly one character.

Example

```sql
LIKE '____'
```

Matches exactly 4 characters.

---

```sql
LIKE 'A___'
```

Starts with A and has exactly 4 characters.

---

## NOT LIKE

Used to exclude matching patterns.

Example

```sql
SELECT *
FROM Employee
WHERE name NOT LIKE 'A%';
```

---

## Interview Questions

### Q1. Difference between = and LIKE?

Answer:

- `=` checks an exact value.
- `LIKE` checks a pattern.

---

### Q2. Difference between % and _?

Answer:

- `%` → Zero or more characters.
- `_` → Exactly one character.

---

### Q3. Can LIKE be used with numbers?

Answer:

It is intended for string pattern matching. On numeric columns, some databases (like MySQL) may perform implicit conversion, but the recommended approach is to use `LIKE` with string data (`CHAR`, `VARCHAR`, `TEXT`) or explicitly convert numbers to strings when needed.

---

### Q4. Is LIKE case-sensitive?

Answer:

In MySQL, it depends on the column's collation. With the common case-insensitive collations, `LIKE` is not case-sensitive.

---

## Common Mistakes

❌

```sql
WHERE name = 'A%'
```

✔

```sql
WHERE name LIKE 'A%'
```

---

❌

```sql
LIKE 'A_'
```

(Only matches names with exactly 2 characters.)

✔

```sql
LIKE 'A%'
```

(Starts with A and can have any number of characters.) -->