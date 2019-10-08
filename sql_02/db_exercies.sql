
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

-- 2.10 Select all the data of employees, include each employee`s deprtment.
Select Department, count(*) from employees GROUP BY Department;

-- 2.11 对表内部进行插入，on 相等的情况，再对其进行筛选.
SELECT SSN, E.Name AS Name_E, LastName, D.Name as Name_D, Department, Code, Budget FROM
Employees E INNER JOIN Departments D ON E.Department = D.Code;

-- 2.12 Select the name and last name of employees working for departments with budget >6000.
SELECT name, lastname, department from employees where department in (
    SELECT code from departments where budget > 6000
);
---Without subquery
SELECT E.name, LastName, department FROM employees E INNER JOIN Departments D ON E.department = d.code AND D.budget > 6000; 

-- 合并两个表,以employee 为主 id
SELECT E.name, LastName, department FROM employees E Left JOIN Departments D ON E.department = d.code AND D.budget > 6000; 
SELECT E.name, LastName, department FROM employees D Right JOIN Departments E ON E.department = d.code AND D.budget > 6000; 


-- 2.13 Select all the employees where budget > average people.
--- Return the selected value in sub select;
SELECT * FROM Departments where budget > (
    SELECT AVG(Budget) FROM Department;
);

-- the department`s people > 2 , and return their name, the code is still in the employees table.
SELECT b.name from departments b where code in (
    Select department from employees group by department having coun(*) > 2
);