
-- 2.1 Select the last name of all the employees.
SELECT lastName from employees;

-- 2.2 Select the last name without dumplicate, only one lastName.
SELECT DISTINCT lastName FROM employees;

-- 2.3 Select all the data from ...
SELECT  * FROM employees WHERE lastName = 'Smith';

-- 2.4 Select all the data whose last name is 'Smith' or 'Doe'
SELECT * FROM employees WHERE (lastName = 'Smith' OR lastName = 'Doe');

-- 2.5 Select all the employee that work in the department = 14;
SELECT * FROM employees WHERE department = 14;

-- 2.6 Seletc all the employee that work in A or B.
SELECT * FROM employees WHERE department = 37 OR department = 77;
SELECT * FROM employees WHERE department in (37, 77);

-- 2.9 Select the number of employees in each department.
SELECT department, count(*) FROM employees GROUP BY department;

-- 3.0 