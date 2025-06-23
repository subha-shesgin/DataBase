alter table EMP
add constraint my_emp_id_pk primary key (id);

---------  10.2
alter table dept
add constraint my_deptid_pk primary key(id);

------------      10.3
alter table emp
add (dept_id NUMBER(7));

alter table emp 
add constraint my_emp_dept_id_fk 
FOREIGN key (dept_id) REFERENCES dept(id);

-------------- 10.4
SELECT constraint_name, constraint_type AS "C"
FROM user_constraints
WHERE table_name IN ('EMP', 'DEPT');

-----------------    10.5
select object_name,object_type 
from USER_OBJECTS
where OBJECT_NAME like 'EMP%'
or OBJECT_NAME like 'DEPT%';

-----------------    10.6

alter table EMP
add commission NUMBER(2,2)
CONSTRAINT my_emp_com_ck check (commission >= 0);