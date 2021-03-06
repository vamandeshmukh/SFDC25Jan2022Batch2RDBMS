 
-- SFDC 25 Jan 2022 Batch 2
SELECT current_date();
-- create a table 
CREATE TABLE emp(eid INT, first_name VARCHAR(10), salary DOUBLE);
-- insert a few records 
INSERT INTO emp (eid, first_name, salary) VALUES (101, 'Sonu', 50000);
INSERT INTO emp (eid, first_name, salary) VALUES (102, 'Monu', 60000);
INSERT INTO emp (eid, first_name, salary) VALUES (103, 'Tonu', 45000);
INSERT INTO emp (eid, first_name, salary) VALUES (104, 'Sonu', 55000);
INSERT INTO emp (eid, first_name, salary) VALUES (105, 'Gonu', 65000);
COMMIT; 
-- view the records - SELECT column_names FROM table_name;
-- view all the records - SELECT * FROM table_name;

-- Give me all the data from EMP table. 
SELECT * FROM emp;

-- Give me all the salaries data from EMP table. 
SELECT salary FROM emp;
 
-- Give me all the names and salaries data from EMP table. 
SELECT first_name, salary FROM emp; 

-- How much is Sonu's salary?
SELECT first_name, salary FROM emp WHERE first_name = 'Sonu'; 

-- How much is Sonu's salary? Sonu = 104
SELECT first_name, salary FROM emp WHERE eid = 104;

-- Which employees have salary more than 50000?
SELECT eid, first_name, salary FROM emp WHERE salary > 50000;

-- Display the list of employees in the order of salary. 
SELECT eid, first_name, salary FROM emp ORDER BY salary; 
SELECT eid, first_name, salary FROM emp ORDER BY salary DESC; 
SELECT eid, first_name, salary FROM emp ORDER BY first_name; 

SELECT eid, first_name, salary FROM emp WHERE salary > 50000 ORDER BY salary; 

-- using functions 

-- What is the max salary in the emp table? 
SELECT max(salary) FROM emp;
SELECT min(salary) FROM emp;
SELECT avg(salary) FROM emp;
SELECT sum(salary) FROM emp;
SELECT count(distinct(salary)) FROM emp;
SELECT count(*) FROM emp;
SELECT first_name, UPPER(first_name), LOWER(first_name) from emp;

SELECT count(first_name) FROM emp;
SELECT * FROM emp;
SELECT count(distinct(first_name)) FROM emp;

SELECT 100 / 3;
SELECT ROUND(100 / 3);
SELECT ROUND((100 / 3), 1);
SELECT ROUND((100 / 3), 2);

SELECT first_name, salary, salary + 10000 FROM emp;
SELECT first_name, salary, salary + 10000 'hike' FROM emp;

-- DML operations - insert, update, delete 

SELECT * FROM emp;

-- insert a new record 
INSERT INTO emp (eid, first_name, salary) VALUES (106, 'Monu', 65000);
INSERT INTO emp VALUES (107, 'Sonu', 58000); -- shortcut 

-- insert a record with null value in a column 
INSERT INTO emp (eid, first_name, salary) VALUES (108, 'Monu', NULL);
INSERT INTO emp (eid, first_name) VALUES (109, 'Monu');
INSERT INTO emp (salary, eid) VALUES (75000, 110);
INSERT INTO emp (eid, first_name, salary) VALUES (111, 'Ponu', 65000);

-- update a record - UPDATE table_name SET column_name = new value WHERE search condition
UPDATE emp SET salary = 25000 WHERE eid = 107;

SELECT * FROM emp;

-- delete a record - DELETE FROM table_name WHERE search condition
DELETE FROM emp WHERE eid = 109;
-- DELETE emp WHERE eid = 109; -- works in Oracle 

-- create tables - 
-- CREATE TABLE table_name (column_name1 datatype, column_name2 datatype, ...)
CREATE TABLE cg_emps (eid INT, first_name VARCHAR(40), phone BIGINT, hire_date DATE, salary DOUBLE);

INSERT INTO cg_emps (eid, first_name, phone, hire_date, salary) 
VALUES(101, 'Prakhar', 9876543210, STR_TO_DATE('26-01-2022', '%d-%m-%Y'), 52000);

INSERT INTO cg_emps (eid, first_name, phone, hire_date, salary) 
VALUES(102, 'Suresh', 7485968945, current_date(), 52000);

COMMIT;
SELECT * FROM cg_emps;
SELECT * FROM cg_emps;

SELECT * FROM emp ORDER BY eid;

INSERT INTO emp (eid, first_name, salary) VALUES (103, 'Tonu', 45000);
INSERT INTO emp (eid, first_name, salary) VALUES (NULL, 'Tonu', 45000);

CREATE TABLE emp(eid INT, first_name VARCHAR(10), salary DOUBLE);
-- create table with PK - 
-- CREATE TABLE emps(eid INT constraint emps_pk PRIMARY KEY, first_name VARCHAR(10), salary DOUBLE);
CREATE TABLE emps(eid INT PRIMARY KEY, first_name VARCHAR(10), salary DOUBLE);
SELECT * FROM emps;
INSERT INTO emps (eid, first_name, salary) VALUES (101, 'Sonu', 50000);
INSERT INTO emps (eid, first_name, salary) VALUES (102, 'Monu', 45000);
-- INSERT INTO emps (eid, first_name, salary) VALUES (101, 'Sonu', 50000); -- error 
INSERT INTO emps (eid, first_name, salary) VALUES (NULL, 'Sonu', 50000);
INSERT INTO emps  VALUES (NULL, 'Sonu', 50000);
INSERT INTO emps (first_name, salary) VALUES ( 'Sonu', 50000);
INSERT INTO emps (eid, first_name, salary) VALUES (103, 'Tonu', 55000);

-- create foreign key conatraint 

DROP TABLE emps;


CREATE TABLE deps (
did INT PRIMARY KEY, 
dname VARCHAR(40),
city VARCHAR(40));

-- igonre this syntax for emps table 
CREATE TABLE emps(
eid INT PRIMARY KEY, 
first_name VARCHAR(10), 
salary DOUBLE, 
did INT REFERENCES deps(did));
-- igonre the above syntax for emps table 

SELECT * FROM emps;
SELECT * FROM deps;

INSERT INTO deps (did, dname, city) VALUES (10, 'HR', 'Hyderabad');
INSERT INTO deps (did, dname, city) VALUES (20, 'Admin', 'Pune');
INSERT INTO deps (did, dname, city) VALUES (30, 'Sales', 'Bengaluru');

INSERT INTO emps (eid, first_name, salary, did) VALUES (101, 'Sonu', 55000, 10);
INSERT INTO emps (eid, first_name, salary, did) VALUES (102, 'Monu', 50000, 10);
INSERT INTO emps (eid, first_name, salary, did) VALUES (103, 'Tonu', 60000, 20);
INSERT INTO emps (eid, first_name, salary, did) VALUES (104, 'Sonu', 65000, 30);
INSERT INTO emps (eid, first_name, salary, did) VALUES (105, 'Ponu', 45000, NULL);

COMMIT; 

INSERT INTO emps (eid, first_name, salary, did) VALUES (106, 'Ponu', 45000, 40);
INSERT INTO emps (eid, first_name, salary, did) VALUES (107, 'Gonu', 55000, 50);

DESC emps;

-- use this syntax for emps2 table 
CREATE TABLE emps2(
eid INT PRIMARY KEY, 
first_name VARCHAR(10), 
salary DOUBLE, 
did INT, FOREIGN KEY (did) REFERENCES deps(did));

INSERT INTO emps2 (eid, first_name, salary, did) VALUES (101, 'Sonu', 55000, 10);
INSERT INTO emps2 (eid, first_name, salary, did) VALUES (102, 'Monu', 50000, 10);
INSERT INTO emps2 (eid, first_name, salary, did) VALUES (103, 'Tonu', 60000, 20);
INSERT INTO emps2 (eid, first_name, salary, did) VALUES (104, 'Sonu', 65000, 30);
INSERT INTO emps2 (eid, first_name, salary, did) VALUES (105, 'Ponu', 45000, NULL);
INSERT INTO emps2 (eid, first_name, salary, did) VALUES (106, 'Gonu', 55000, 40); -- error 

SELECT * FROM deps;
SELECT * FROM emps2;

-- DELETE FROM tablename where condition;
-- parent table - deps
-- child tables - emps, emps2, emps3, ...  

-- if a record from parent table (deps) is deleted what should happen to records in child table (emps3, emps4)?
-- on delete in constraint 

-- 1. on delete set null 

CREATE TABLE emps3(
eid INT PRIMARY KEY, 
first_name VARCHAR(10), 
salary DOUBLE, 
did INT, FOREIGN KEY (did) REFERENCES deps(did) ON DELETE SET NULL);

INSERT INTO emps3 (eid, first_name, salary, did) VALUES (101, 'Sonu', 55000, 50);
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (102, 'Monu', 55000, 30);
INSERT INTO deps (did, dname, city) VALUES (50, 'Marketing', 'Delhi');

SELECT * FROM deps; 
SELECT * FROM emps3; 

DELETE FROM deps WHERE did = 50; 
SELECT * FROM emps3; 

-- 2. on delete cascade 
CREATE TABLE emps4(
eid INT PRIMARY KEY, 
first_name VARCHAR(10), 
salary DOUBLE, 
did INT, FOREIGN KEY (did) REFERENCES deps(did) ON DELETE CASCADE);

INSERT INTO emps4 (eid, first_name, salary, did) VALUES (101, 'Sonu', 55000, 50);
INSERT INTO emps4 (eid, first_name, salary, did) VALUES (102, 'Monu', 55000, 30);
INSERT INTO deps (did, dname, city) VALUES (50, 'Marketing', 'Delhi');

SELECT * FROM deps; 
SELECT * FROM emps4; 

DELETE FROM deps WHERE did = 50; 
SELECT * FROM emps4; 

-- In which city does Sonu (101) work?

-- JOINs 
-- joins syntax  SELECT columns FROM table1 JOIN table2 ON table1.fk = table2.pk;
-- use these tables - deps and emps2 

-- JOIN queries 
SELECT eid, first_name, city 
FROM emps2 
JOIN deps 
ON emps2.did = deps.did
WHERE eid = 101;
-- WHERE first_name = 'Sonu';

-- sopecify tablename for columns 
SELECT eid, first_name, city, emps2.did 
FROM emps2 
JOIN deps 
ON emps2.did = deps.did
WHERE eid = 101;

-- specify tablename aliases for columns 
SELECT e.eid, e.first_name, d.city, d.did 
FROM emps2 e
JOIN deps d
ON e.did = d.did
WHERE e.eid = 101;

SELECT * FROM deps; 
SELECT * FROM emps2;

-- work from this line onwards 

INSERT INTO deps (did, dname, city) VALUES (60, 'Management', 'Kolkata');

-- types of joins - 
-- inner join - only matching records 
-- outer join - 
-- left outer join - matching records from both the tables and non-matching records from left table 
-- right outer join - matching records from both the tables and non-matching records from right table 
-- full outer join - matching and non-matching records from both the tables 

-- inner join - only matching records 
SELECT * FROM emps2 e JOIN deps d ON e.did = d.did ORDER BY e.eid; 
 
 -- outer joins 
-- left outer join - matching records from both the tables and non-matching records from left table 
SELECT * FROM emps2 e LEFT JOIN deps d ON e.did = d.did ORDER BY e.eid; 

-- right outer join - matching records from both the tables and non-matching records from right table 
SELECT * FROM emps2 e JOIN deps d ON e.did = d.did ORDER BY e.eid; 

-- full outer join - matching and non-matching records from both the tables 
SELECT * FROM emps2 e LEFT JOIN deps d ON e.did = d.did 
UNION 
SELECT * FROM emps2 e2 RIGHT JOIN deps d2 ON e2.did = d2.did 
ORDER BY eid; 

SELECT * FROM emps2;

-- subquery = query within a query 
-- Find details of the employee who has highest salary. 
SELECT eid, first_name, salary FROM emps2 WHERE salary = (SELECT max(salary) FROM emps2);

-- Find details of the employee who has second highest salary. 
SELECT eid, first_name, salary FROM emps2 WHERE salary = 
(SELECT max(salary) FROM emps2 where salary < 
(SELECT max(salary) FROM emps2));


-- where 
delete from emps99;
insert into emps99 (select * from emps3);
SELECT * FROM emps99;
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (106, 'Sonu', 55000, 20);
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (107, 'Aonu', 75000, 30);
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (108, 'Bonu', 95000, 30);
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (109, 'Conu', 85000, 10);
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (110, 'Donu', 25000, 20);
INSERT INTO emps3 (eid, first_name, salary, did) VALUES (111, 'Eonu', 35000, 30);

COMMIT; 

-- find the highest salary in the company. 
SELECT max(salary) FROM emps99;
SELECT * FROM emps99;

-- find the highest salary in each deparetments. 
SELECT did, max(salary) FROM emps99
GROUP BY did
ORDER BY did;

-- create anothr table fotr this - 
create table emps98 (select * from emps2);

-- alter table 
-- check the table sctucture - 

describe emps98;
desc emps98;
-- As per govt order, start collecting aadhaar number of employees. 
SELECT * FROM emps98;
-- add a new column to an existing table 
ALTER TABLE emps98 ADD aadhaar BIGINT unique;
SELECT * FROM emps98;
-- to add aadhaar for existing employees, update command - 
UPDATE emps98 SET aadhaar = 123456789 WHERE eid = 102;
UPDATE emps98 SET aadhaar = 457856789 WHERE eid = 101;
SELECT * FROM emps98;
INSERT INTO emps98 VALUES (106, 'Abcd', 55000, 20, 9876543210);
-- create other DB objects 

-- check length(aadhaar) >=12  
 create table t1(c1 int, c2 varchar(10));
SELECT * from t1; 
-- sequence - generates numeric values in sequential order 
-- can be used to insert PK values in tables 

-- in oracle - 
-- CREATE sequence sq1;
-- CREATE sequence sq1 start with;
-- CREATE sequence sq1 start with increment by;
-- sq1.nextval

-- in MySQL - AUTO_INCREMENT

create table t2(c1 int AUTO_INCREMENT PRIMARY KEY, c2 varchar(10));
insert into t2 values (1, 'A');
insert into t2 (c2) values ('xyz');
 SELECT * FROM t2; 
 
 