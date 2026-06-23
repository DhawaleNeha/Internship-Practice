USE internship;

select * from department;
select * from employee;


-- Top 5 highest salary
select * from employee
order by Salary desc limit 5;

-- DepartmentName wise Employee Countcustomer
select  DepartmentName, count(*) as employee_Count
from department dept
inner join employee emp
on dept.DepartmentId=emp.DepartmentId
group by DepartmentName ;

 
 
-- second highest salary
select MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);

