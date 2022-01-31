
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
-- view the records 
SELECT * FROM emp;





