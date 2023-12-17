use student;
#Create two tables: EmployeeDetails and EmployeeSalary.
#Columns for EmployeeDetails: EmpId FullName ManagerId DateOfJoining City

create table EmployeeDetails(
EmpId int primary key,
FullName varchar(30),
DateOfJoining date,
City varchar(255),
ManagerId int
);

# Columns for EmployeeSalary: : EmpId Project Salary Variable.

create table EmployeeSalary(
EmpId int primary key ,
Project varchar(255),
Salary double);

#SQL Query to fetch records that are present in one table but not in another table.

SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);

#SQL query to fetch all the employees who are not working on any project.

SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary WHERE Project IS NOT NULL);

#SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020

SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

#Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT * FROM EmployeeDetails
WHERE EmpId IN (SELECT EmpId FROM EmployeeSalary);

#Write an SQL query to fetch a project-wise count of employees.


#Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT ed.EmpId, ed.FullName, COALESCE(es.Salary, 'No Salary') AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;

#Write an SQL query to fetch all the Employees who are also managers.

SELECT * FROM EmployeeDetails
WHERE EmpId IN (SELECT DISTINCT ManagerId FROM EmployeeDetails WHERE ManagerId IS NOT NULL);

#Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT EmpId, COUNT(*)
FROM EmployeeDetails
GROUP BY EmpId
HAVING COUNT(*) > 1;

#Write an SQL query to fetch only odd rows from the table.

SELECT * FROM EmployeeDetails
WHERE EmpId % 2 <> 0;

#Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT DISTINCT Salary
FROM EmployeeSalary e1
WHERE 3 = (SELECT COUNT(DISTINCT Salary)
           FROM EmployeeSalary e2
           WHERE e1.Salary <= e2.Salary);


