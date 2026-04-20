	SHOW databases;
    CREATE DATABASE guvi_db;
    USE guvi_db;
    SELECT database();
    CREATE TABLE employee(empno INT PRIMARY KEY,
							ename varchar(100),
                            job varchar(50),
                            manager INT,
                            hiredate date,
                            salary DECIMAL(10,2),
                            commision DECIMAL(5,2),
                            deptno INT
                            );
                      
ALTER TABLE employee MODIFY commision DECIMAL(7,2);
ALTER TABLE employee RENAME COLUMN commision TO commission;
INSERT INTO employee VALUES (8521,'SETH','SALESMAN',8698,'1991-02-22',1250.00,500.00,30),
                            (8566,'MAHADEVAN','MANAGER',8839,'1991-04-02',2985.00,NULL,20),
                            (8654,'MOMIN','SALESMAN',8698,'1991-09-28',1250.00,1400.00,30),
                            (8698,'BINA','MANAGER',8839,'1991-05-01',2850.00,NULL,30),
                            (8882,'SHIVANSH','MANAGER',8839,'1991-06-09',2450.00,NULL,10),
                            (8888,'SCOTT','ANALYST',8566,'1991-12-09',3000.00,NULL,20),
                            (8839,'AMIR','PRESIDENT',NULL,'1991-11-18',5000.00,NULL,10),
                            (8844,'KULDEEP','SALESMAN',8698,'1991-09-08',1500.00,0.00,30);
SELECT * FROM EMPLOYEE;
SELECT ename, salary FROM employee WHERE salary >= 2200;                          
SELECT * FROM employee WHERE commission IS NULL;
SELECT ename, salary FROM employee WHERE salary NOT BETWEEN 2500 AND 4000;
SELECT ename, salary FROM employee WHERE salary < 2500 OR salary > 4000;
SELECT ename, job, salary FROM employee WHERE manager IS NULL;
SELECT ename FROM employee WHERE ename LIKE '__I%';
SELECT ename FROM employee WHERE ename LIKE '%T';