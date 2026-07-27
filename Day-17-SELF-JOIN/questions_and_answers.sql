CREATE TABLE employee_manager (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee_manager VALUES
(1,'CEO',NULL),
(2,'Aman',1),
(3,'Kaif',1),
(4,'Sara',2),
(5,'Rahul',2),
(6,'Neha',3);



-- Q1
-- Display employee name and manager name.
SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id;
-- Q2
-- Display employee ID, employee name and manager name.
SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id;
-- Q3
-- Display employees whose manager is CEO.
SELECT e.emp_name
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'CEO';

-- Q4
-- Display employees who do not have any manager.
SELECT e.emp_name
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id
WHERE m.emp_id IS NULL;

-- Q5
-- Count employees who do not have a manager.
SELECT COUNT(*) AS No_Manager
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id
WHERE m.emp_id IS NULL;

-- Q6
-- Display all columns using SELF JOIN.
SELECT *
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id;

-- Q7
-- Display manager name along with employee name.
SELECT m.emp_name AS Manager,
       e.emp_name AS Employee
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id;

-- Q8
-- Display employees managed by Aman.
SELECT e.emp_name
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Aman';

-- Q9
-- Display employees managed by Kaif.
SELECT e.emp_name
FROM employee_manager e
LEFT JOIN employee_manager m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Kaif';
-- Q10
-- Display employee name and manager ID.
SELECT emp_name,
       manager_id
FROM employee_manager;


-- ⭐ Bonus Questions (Placement Level)
-- Q11. Display manager name and number of employees under each manager.
SELECT m.emp_name AS Manager,
       COUNT(e.emp_id) AS Total_Employees
FROM employee_manager e
JOIN employee_manager m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name;