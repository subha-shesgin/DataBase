CREATE TABLE dept (
  id NUMBER(7),
  name VARCHAR2(25)
);

describe dept;

-----------------------  9.2
insert into dept
select department_id , department_name
from hr.DEPARTMENTS;


----------------- 9.3
CREATE TABLE EMP (
  id NUMBER(7),
  last_name VARCHAR2(25),
  first_name varchar(25),
  dept_id number(7)
);

describe EMP;

------------- 9.4
ALTER table EMP
MODIFY (last_name VARCHAR2(50));

DESCRIBE emp;

------------------  9.5
SELECT table_name
FROM user_tables
WHERE table_name IN ('DEPT', 'EMP');

----------------------   9.6

create table EMPLOYEES2 as
select employee_id id, first_name, last_name,salary, department_id dept_id
from hr.EMPLOYEES;

----------------------           9.7
drop table emp;

---------------------         9.8
rename EMPLOYEES2 to EMP;

---------------     9.9
COMMENT ON TABLE emp IS 'employees information';
COMMENT ON TABLE dept IS 'department info';

select *
from user_tab_comments
where table_name ='DEPT' or table_name = 'EMP';

-----------------------           9-10
alter table emp
drop COLUMN first_name;

DESCRIBE emp;

-----------    9.11
alter table emp
set UNUSED (dept_id);

DESCRIBE emp;

------------ 9.12
alter table emp
drop UNUSED COLUMNS;

DESCRIBE emp;