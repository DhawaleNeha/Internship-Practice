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



-- Employees whose salary > Department average salary
SELECT employeeid, firstname, lastname, departmentID, salary
FROM (
    SELECT *, 
           AVG(salary) OVER(PARTITION BY departmentID) AS avgdepartmentsalary
    FROM employee
) emp_derived
WHERE salary > avgdepartmentsalary;

-- Inner join
SELECT e.employeeID, e.firstname, e.lastname, e.departmentID, e.salary
FROM employee e
INNER JOIN (
    SELECT departmentID, AVG(salary) AS avgsalary
    FROM employee
    GROUP BY departmentid
) d ON e.departmentid = d.departmentid
WHERE e.salary > d.avgsalary;

-- Left Join
SELECT e.employeeID, e.firstname, e.lastname, e.departmentID, e.salary
FROM employee e
LEFT JOIN (
    SELECT departmentID, AVG(salary) AS avgsalary
    FROM employee
    GROUP BY departmentID
) d ON e.departmentID = d.departmentID
WHERE e.salary > d.avgsalary;

-- Group by with having
SELECT employeeid, firstname, lastname, departmentid, salary
FROM employee e
WHERE departmentid IN (
    SELECT departmentid
    FROM employee
    GROUP BY departmentid
    HAVING e.salary > AVG(salary)
);


-- Employees hired in last 6 months
SELECT employeeid, firstname, lastname, hiredate
FROM employee
WHERE hiredate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);


-- Find duplicate records
SELECT e.*
FROM employee e
INNER JOIN (
    SELECT email
    FROM employee
    GROUP BY email
    HAVING COUNT(*) > 1
) duplicates ON e.email = duplicates.email
ORDER BY e.email;

SELECT email, COUNT(*) as occurrence_count
FROM employee
GROUP BY email
HAVING COUNT(*) > 1;



INSERT INTO employee (firstname, lastname, email, departmentid, salary, hiredate)
SELECT firstname, lastname, email, departmentid, salary, hiredate
FROM employee
WHERE departmentid = 10;

-- turnoff safe update mode
SET SQL_SAFE_UPDATES = 0;


-- Remove the duplicates records
DELETE e1 
FROM employee e1
INNER JOIN employee e2 
    ON e1.email = e2.email 
    AND e1.employeeid > e2.employeeid;


INSERT INTO department (departmentid, departmentname, location) VALUES
(10, 'Information Technology', 'New York'),
(20, 'Human Resources', 'London'),
(30, 'Finance', 'Tokyo'),
(40, 'Information Technology', 'New York'),
(50, 'Operations', 'Mumbai');


INSERT INTO employee (firstname, lastname, email, departmentid, salary, hiredate) VALUES 
-- Information Technology (ID: 10)
('Alice', 'Smith', 'alice.smith@email.com', 10, 115000.00, '2024-03-15'),
('Bob', 'Jones', 'bob.jones@email.com', 10, 95000.00, '2025-06-20'),
('Charlie', 'Brown', 'charlie.brown@email.com', 10, 60000.00, '2026-04-01'), 

-- Human Resources (ID: 20)
('Diana', 'Prince', 'diana.prince@email.com', 20, 75000.00, '2023-01-10'),
('Evan', 'Wright', 'evan.wright@email.com', 20, 70000.00, '2026-02-14'), 

-- Finance (ID: 30)
('Fiona', 'Gallagher', 'fiona.g@email.com', 30, 130000.00, '2022-05-19'),
('George', 'Clark', 'george.clark@email.com', 30, 90000.00, '2025-12-10'), 

-- Marketing (ID: 40)
('Hannah', 'Abbott', 'hannah.a@email.com', 40, 80000.00, '2024-09-05'),
('Ian', 'Malcolm', 'ian.m@email.com', 40, 105000.00, '2026-05-22'), 

-- Operations (ID: 50)
('Julia', 'Roberts', 'julia.r@email.com', 50, 65000.00, '2025-03-12'), 

-- Modified Email Values to avoid constraint block (Testing name duplicates instead)
('Alice', 'Smith', 'alice.smith.dup@email.com', 10, 115000.00, '2025-02-15'),
('Diana', 'Prince', 'diana.prince.dup@email.com', 20, 75000.00, '2023-01-10');



SELECT employeeid, firstname, lastname, hiredate
FROM employee
WHERE hiredate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- add records into existing table
INSERT INTO employee (firstname, lastname, email, departmentid, salary, hiredate) VALUES 
-- Information Technology (ID: 10)
('Alicen', 'Smith', 'alicen.smith@email.com', 10, 115000.00, '2024-03-15'),
('Bobby', 'Jones', 'bobby.jones@email.com', 10, 95000.00, '2025-06-20'),
('Charliechamp', 'Brown', 'charliecham.brown@email.com', 10, 60000.00, '2026-04-01'), 

-- Human Resources (ID: 20)
('Dianal', 'Prince', 'dianal.prince@email.com', 20, 75000.00, '2023-01-10'),
('Eva', 'Wright', 'eva.wright@email.com', 20, 70000.00, '2026-02-14'), 

-- Finance (ID: 30)
('Fio', 'Gallagher', 'fio.g@email.com', 30, 130000.00, '2022-05-19'),
('Georget', 'Clark', 'georget.clark@email.com', 30, 90000.00, '2025-12-10'), 

-- Marketing (ID: 40)
('Hannat', 'Abbott', 'hannat.a@email.com', 40, 80000.00, '2024-09-05'),
('Iant', 'Malcolm', 'iant.m@email.com', 40, 105000.00, '2026-05-22'), 

-- Operations (ID: 50)
('Juliat', 'Roberts', 'juliat.r@email.com', 50, 65000.00, '2025-03-12'), 

-- Modified Email Values to avoid constraint block (Testing name duplicates instead)
('Aliced', 'Smith', 'aliced.smith.dup@email.com', 10, 115000.00, '2025-02-15'),
('Dianaam', 'Prince', 'dianaam.prince.dup@email.com', 20, 75000.00, '2023-01-10');


-- Handle case when in the data
SELECT 
    FirstName,
    salary,
    CASE 
        WHEN salary >= 80000 THEN 'Tier 1 (High)'
        WHEN salary >= 60000 AND salary < 80000 THEN 'Tier 2 (Mid)'
        ELSE 'Tier 3 (Standard)'
    END AS salarybracket
FROM employee;


-- Apply Window Function on the Data
SELECT 
    FirstName,
    departmentID,
    salary,
    -- Ranks employees within their specific department by salary
    ROW_NUMBER() OVER (PARTITION BY departmentID ORDER BY salary DESC) AS rankindept,
    -- Calculates the average salary of the employee's department
    AVG(salary) OVER (PARTITION BY departmentID) AS deptaveragesalary
FROM employee;


-- Apply a View on the Data
CREATE VIEW vemployeeanalytics AS
SELECT 
    FirstName, LastName,
    departmentID,
    salary,
    CASE 
        WHEN salary >= 80000 THEN 'Tier 1'
        ELSE 'Tier 2'
    END AS bracket,
    ROW_NUMBER() OVER (PARTITION BY departmentID ORDER BY salary DESC) AS rankindept
FROM employee;

-- You can now query it like a regular table:
SELECT * FROM vemployeeanalytics WHERE rankindept = 1;



-- Apply Triggers on the Data
-- Step A: Create an audit log table
CREATE TABLE salaryauditlog (
    logid INT AUTO_INCREMENT PRIMARY KEY,
    employeeID INT,
    oldsalary DECIMAL(10, 2),
    newsalary DECIMAL(10, 2),
    changedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

DELIMITER //

CREATE TRIGGER aftersalaryupdate 
AFTER UPDATE ON employee 
FOR EACH ROW 
BEGIN     
    IF OLD.salary <> NEW.salary THEN         
        INSERT INTO salaryauditlog (employeeid, oldsalary, newsalary)         
        VALUES (OLD.employeeid, OLD.salary, NEW.salary);
    END IF; 
END //

DELIMITER ;




-- Case 1
SELECT 
    employeeid, 
    oldsalary, 
    newsalary,
    CASE 
        WHEN newsalary >= 90000 THEN 'Executive Tier'
        WHEN newsalary >= 60000 AND newsalary < 90000 THEN 'Professional Tier'
        ELSE 'Associate Tier'
    END AS salarytier
FROM salaryauditlog;


-- Case 2
SELECT 
    employeeid,
    oldsalary,
    newsalary,
    CASE 
        WHEN newsalary > oldsalary THEN 'Salary Increment'
        WHEN newsalary < oldsalary THEN 'Salary Decrement'
        ELSE 'No Change'
    END AS change_type
FROM salaryauditlog;

-- Combine case 1 and case 2
SELECT 
    COUNT(*) AS total_updates,
    SUM(CASE WHEN newsalary > oldsalary THEN 1 ELSE 0 END) AS total_raises_given,
    SUM(CASE WHEN newsalary < oldsalary THEN 1 ELSE 0 END) AS total_pay_cuts
FROM salaryauditlog;

-- Usecase WHen in View
CREATE OR REPLACE VIEW v_salary_change_analysis AS
SELECT 
    employeeid,
    oldsalary,
    newsalary,
    (newsalary - oldsalary) AS absolute_change,
    CASE 
        WHEN newsalary > oldsalary THEN 'Higher Pay'
        WHEN newsalary < oldsalary THEN 'Lower Pay'
        ELSE 'Identical Pay'
    END AS adjustment_status
FROM salaryauditlog;

-- Test the view by querying it directly:
SELECT * FROM v_salary_change_analysis;

