use student;
#Create two tables: EmployeeDetails and EmployeeSalary.
#1 Columns for EmployeeDetails: EmpId FullName ManagerId DateOfJoining City

create table EmployeeDetails(
EmpId int primary key,
FullName varchar(30),
DateOfJoining date,
City varchar(255),
ManagerId int
);

#2 Columns for EmployeeSalary: : EmpId Project Salary Variable.

create table EmployeeSalary(
EmpId int primary key ,
Project varchar(255),
Salary double);

#3 SQL Query to fetch records that are present in one table but not in another table.

SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);

#4 SQL query to fetch all the employees who are not working on any project.

SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary WHERE Project IS NOT NULL);

#5 SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020

SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

#6 Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT * FROM EmployeeDetails
WHERE EmpId IN (SELECT EmpId FROM EmployeeSalary);

#7 Write an SQL query to fetch a project-wise count of employees.
SELECT Project, COUNT(EmpId) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project;



#8 Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT ed.EmpId, ed.FullName, COALESCE(es.Salary, 'No Salary') AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;

#9 Write an SQL query to fetch all the Employees who are also managers.

SELECT * FROM EmployeeDetails
WHERE EmpId IN (SELECT DISTINCT ManagerId FROM EmployeeDetails WHERE ManagerId IS NOT NULL);

#10 Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT EmpId, COUNT(*)
FROM EmployeeDetails
GROUP BY EmpId
HAVING COUNT(*) > 1;

#11 Write an SQL query to fetch only odd rows from the table.

SELECT * FROM EmployeeDetails
WHERE EmpId % 2 <> 0;

#12 Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT DISTINCT Salary
FROM EmployeeSalary e1
WHERE 3 = (SELECT COUNT(DISTINCT Salary)
           FROM EmployeeSalary e2
           WHERE e1.Salary <= e2.Salary);


