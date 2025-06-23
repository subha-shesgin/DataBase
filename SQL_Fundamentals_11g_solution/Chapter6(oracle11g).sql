----------------   chapter 6 oracle 11g

------------  6-1
SELECT location_id,
       street_address,
       city,
       state_province,
       country_name
FROM hr.locations
NATURAL JOIN hr.countries;

--------------   6-2
SELECT e.last_name,
       e.department_id,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id;


-------- 6-3

SELECT e.last_name,
       e.job_id,
       e.department_id,
       d.department_name
FROM   HR.employees e
JOIN   HR.departments d ON e.department_id = d.department_id
JOIN   HR.locations l ON d.location_id = l.location_id
WHERE  l.city = 'Toronto';

-------  6-4
SELECT e.last_name AS "Employee",
       e.employee_id AS "Emp#",
       m.last_name AS "Manager",
       m.employee_id AS "Mgr#"
FROM   HR.employees e
JOIN   HR.employees m
ON     e.manager_id = m.employee_id;

--------------- 6-5
SELECT 
    e.last_name AS Employee,
    e.employee_id AS "Emp#",
    m.last_name AS Manager,
    m.employee_id AS "Mgr#"
FROM 
    hr.employees e
LEFT JOIN 
    hr.employees m
ON 
    e.manager_id = m.employee_id
ORDER BY 
    e.employee_id;

    -------------        6-6
    SELECT 
    e1.last_name AS "Employee",
    e1.department_id AS "Dept#",
    e2.last_name AS "Colleague"
FROM 
    hr.employees e1
JOIN 
    hr.employees e2
ON 
    e1.department_id = e2.department_id
AND 
    e1.employee_id != e2.employee_id
ORDER BY 
    e1.department_id, e1.last_name, e2.last_name;


----------------- 6-7

DESCRIBE hr.JOBS;
--part 2
-- find correct answer 
SELECT e.last_name,
       e.job_id,
       d.department_name,
       e.salary,
       CASE
           WHEN e.salary BETWEEN 0 AND 3000 THEN 'A'
           WHEN e.salary BETWEEN 3001 AND 6000 THEN 'B'
           WHEN e.salary BETWEEN 6001 AND 9000 THEN 'C'
           WHEN e.salary BETWEEN 9001 AND 12000 THEN 'D'
           ELSE 'E'
       END AS grade_level
FROM HR.EMPLOYEES e
JOIN HR.DEPARTMENTS d ON e.department_id = d.department_id
ORDER BY e.salary;

------- 6-8
SELECT last_name, hire_date
FROM hr.employees
WHERE hire_date > (
    SELECT hire_date
    FROM hr.employees
    WHERE last_name = 'Davies'
);

--------------- 6-9
SELECT 
    e.last_name AS "Employee",
    e.hire_date AS "Employee Hire Date",
    m.last_name AS "Manager",
    m.hire_date AS "Manager Hire Date"
FROM 
    hr.employees e
JOIN 
    hr.employees m 
ON 
    e.manager_id = m.employee_id
WHERE 
    e.hire_date < m.hire_date
ORDER BY 
    e.hire_date;