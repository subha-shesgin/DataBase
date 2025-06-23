-----------   chapter 5 oracle 11g ------------

--------- 5-4
SELECT 
round (max(salary)) as MAXIMUM,
round(min(salary)) as MINIMUM,
round(sum(salary)) as SUM,
round(avg(salary)) as AVERAGE
from hr.employees;

----- 5-5
SELECT  JOB_ID,
round (max(salary)) as MAXIMUM,
round(min(salary)) as MINIMUM,
round(sum(salary)) as SUM,
round(avg(salary)) as AVERAGE
from hr.employees
group by job_id;

---------- 5-6
SELECT job_id , count(*)
from hr.employees
where upper (job_id) = upper ('&job_id')
group by job_id;

---part 1
SELECT job_id, COUNT(*)
FROM hr.employees
GROUP BY job_id;

---------- 5-7

SELECT COUNT(distinct manager_id) AS "NUMBER OF MANAGERS"
FROM hr.employees;

----------------- 5-8
SELECT max(salary) - min(salary) as "DIFFERENCE"
from hr.employees;

----------  5-9
SELECT manager_id, MIN(salary)
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY MIN(salary) DESC;

-------------   5-10
SELECT
    COUNT(*) AS "TOTAL",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '1995' THEN 1 END) AS "1995",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '1996' THEN 1 END) AS "1996",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '1997' THEN 1 END) AS "1997",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '1998' THEN 1 END) AS "1998"
FROM hr.employees;

--------------  5-11
SELECT DISTINCT
    ( JOB_ID )                             "Job",
    SUM(DECODE(DEPARTMENT_ID, 20, SALARY)) "Dept 20",
    SUM(DECODE(DEPARTMENT_ID, 50, SALARY)) "Dept 50",
    SUM(DECODE(DEPARTMENT_ID, 80, SALARY)) "Dept 80",
    SUM(DECODE(DEPARTMENT_ID, 90, SALARY)) "Dept 90",
    SUM(SALARY)                            TOTAL
FROM
    HR.EMPLOYEES
WHERE
    DEPARTMENT_ID IN ( 20, 50, 80, 90 )
GROUP BY
    JOB_ID
ORDER BY
    JOB_ID;