-----------------   chapter 7 oracle 11g

------------  7-1
SELECT last_name, hire_date
FROM HR.employees
WHERE department_id = (
    SELECT department_id
    FROM hr.employees
    WHERE UPPER(last_name) = UPPER('&employee_last_name')
)
AND UPPER(last_name) <> UPPER('&employee_last_name');

--------corrected-----------

SELECT last_name, to_char (hire_date, 'DD-MON-YY') hire_date
FROM HR.EMPLOYEES
WHERE department_id = ( SELECT department_id
                        FROM hr.employees
                        WHERE last_name = initcap ('&&last_name'))
AND last_name <> initcap ('&last_name');

----------------- 7-2
SELECT employee_id, last_name, salary
FROM hr.employees
WHERE salary > (
    SELECT AVG(salary)
    FROM hr.employees
)
ORDER BY salary ASC;

--------- 7-3
SELECT employee_id, last_name
FROM hr.employees
WHERE department_id IN (
    SELECT department_id
    FROM hr.employees
    WHERE LOWER(last_name) LIKE '%u%'
);


----------------  7-4
SELECT last_name, department_id, job_id
FROM HR.EMPLOYEES
WHERE department_id IN (SELECT department_id
                        FROM HR.DEPARTMENTS
                        WHERE location_id = 1700)
ORDER BY DEPARTMENT_ID

------------ 7-5
select last_name , salary
from hr.employees
where manager_id in (select HR.EMPLOYEE_ID
                        from hr.employee_last_name
                        where last_name = 'king');
-------------    7-6
SELECT department_id, last_name, job_id
FROM HR.EMPLOYEES
WHERE department_id in (SELECT department_id
                          FROM HR.DEPARTMENTS
                          WHERE department_name = 'Executive');

----------------  7-7

SELECT employee_id,
       last_name,
       salary
FROM hr.employees
WHERE salary > (SELECT AVG(salary) FROM hr.employees)
  AND department_id IN (
        SELECT DISTINCT department_id
        FROM hr.employees
        WHERE last_name LIKE '%u%'
      );