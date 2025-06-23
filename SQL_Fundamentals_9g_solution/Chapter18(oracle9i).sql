select last_name , department_id,salary
from hr.EMPLOYEES
where (salary , department_id) in (select SALARY, DEPARTMENT_ID
                                    from hr.employees
                                    where COMMISSION_PCT is not null);

    -------------------     18-2
    select last_name,department_name,salary
    from hr.employees e , hr.DEPARTMENTS d
    where e.DEPARTMENT_ID = d.DEPARTMENT_ID
    and (salary ,nvl(COMMISSION_PCT ,0)) in 
                    (select salary , nvl(COMMISSION_PCT,0)
                    from hr.employees e,hr.DEPARTMENTS d
                    where e.department_id = d.department_id
                    and d.location_id = 1700);


       ---------------------- 18.3
select last_name , hire_date,salary
from hr.employees
where (salary, nvl(commission_pct,0)) IN
        (select salary , nvl(commission_pct,0)
        from hr.employees 
        where last_name = 'Kochhar')
and last_name != 'kochhar';  

--------------------         18.4

select last_name , job_id, salary
from hr.employees
where salary > ALL
                (select SALARY
                from hr.EMPLOYEES
                where job_id = 'SA_MAN')
order by salary desc;                

------------     18.5
select employee_id , last_name , department_id
from hr.EMPLOYEES
where DEPARTMENT_ID in (select DEPARTMENT_ID
                            from hr.DEPARTMENTS
                            where location_id in 
                                    (SELECT LOCATION_ID
                                    from hr.LOCATIONS
                                    where city like 'T%'));

----------------------     18.6

select e.last_name ename , e.salary salary ,
        e.department_id deptno , avg(a.salary) dept_avg 
from hr.employees e , hr.employees a
where e.department_id = a.department_id
and e.salary > (select avg(salary)
                from hr.employees 
                where department_id = e.department_id)
group by e.last_name , e.salary , e.department_id
order by avg(a.salary);  

-----------------      18.7
-----------a
SELECT e.last_name
FROM hr.employees e
WHERE NOT EXISTS (
  SELECT 'X'
  FROM hr.employees m
  WHERE m.manager_id = e.employee_id
);
------------- b
SELECT e.last_name
FROM hr.employees e
WHERE e.employee_id NOT IN (
  SELECT a.manager_id
  FROM hr.employees a
  WHERE a.manager_id IS NOT NULL
);

------------------   18.8
select last_name
from hr.employees e
where e.salary <(select avg(a.salary)
                 from hr.employees a 
                 where a.DEPARTMENT_ID = e.DEPARTMENT_ID  );

----------------    18.9
select last_name
from hr.employees e 
where exists (select 'X' 
                from hr.employees a 
                where a.DEPARTMENT_ID = e.DEPARTMENT_ID 
                and a.hire_date > e.HIRE_DATE
                and a.SALARY > e.SALARY );            

---------------- 18.10
select employee_id ,last_name,
        (select department_name
        from hr.DEPARTMENTS d 
        where e.department_id = d.DEPARTMENT_ID ) DEPARTMENT
from hr.employees e 
order by department;        

---------------- 18.11
with
summary as (
    select department_name , sum(salary) as dept_total
    from hr.employees e, hr.DEPARTMENTS d
    where e.department_id = d.department_id
    group by department_name)
select department_name , dept_total
from summary
where dept_total > (
                    select sum(dept_total) * 1/8
                    from summary)
ORDER by dept_total desc;