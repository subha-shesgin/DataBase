CREATE TABLE my_employee (
  id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
  last_name VARCHAR2(25),
  first_name VARCHAR2(25),
  userid VARCHAR2(8),
  salary NUMBER(9,2)
);

----  8.2----------

DESCRIBE my_employee

------------ 8.3 
INSERT into MY_EMPLOYEE
VALUES (1 ,'Patel', 'ralph', 'rpatel',895);

----------  8.4
INSERT into MY_EMPLOYEE(ID,LAST_NAME,FIRST_NAME, USERID,SALARY)
VALUES (2,'Dancs', 'betty', 'bdncs',860);

------------------  8.5

SELECT *
from MY_EMPLOYEE;

----------8.6            8.7
INSERT INTO MY_EMPLOYEE
VALUES (3, 'Biri', 'Ben', LOWER(SUBSTR('Ben', 1, 1) || SUBSTR('Biri', 1, 7)), 1100);
INSERT INTO MY_EMPLOYEE
VALUES (4, 'Newman', 'Chad', LOWER(SUBSTR('Chad', 1, 1) || SUBSTR('Newman', 1, 7)), 750);


------------ 8.8-------
SELECT *
from MY_EMPLOYEE;

------------------ 8.9
COMMIT;

------------------  8.10
update MY_EMPLOYEE
set LAST_NAME = 'Drexler'
WHERE id = 3;

------------------ 8.11

update MY_EMPLOYEE
set salary = 1000
WHERE salary < 900;

--------------- 8.12
SELECT *
from MY_EMPLOYEE;

--------------------- 8.13
DELETE FROM MY_EMPLOYEE
WHERE LAST_NAME = 'Dancs' AND FIRST_NAME = 'betty';

------------------ 8.14
SELECT *
from MY_EMPLOYEE;

----------- 8.15
commit;

------------------ 8.16

INSERT INTO MY_EMPLOYEE
VALUES (5, 'Ropeburn', 'Audrey', LOWER(SUBSTR('Audrey', 1, 1) || SUBSTR('Ropeburn', 1, 7)), 1550);

-----------------      8.17
SELECT *
from MY_EMPLOYEE
order by id asc;

----------------------- 8.18
SAVEPOINT step_18;

--------------------- 8.19

delete from MY_EMPLOYEE;

---------------------- 8.20
SELECT *
from MY_EMPLOYEE;

------------------ 8.21
ROLLBACK to step_18;

---------------- 8.22
SELECT *
from MY_EMPLOYEE
order by id asc;

--------------extra
DELETE FROM MY_EMPLOYEE
WHERE ID = 5;