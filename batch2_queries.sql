 
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
