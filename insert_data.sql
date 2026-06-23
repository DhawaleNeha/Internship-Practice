CREATE DATABASE IF NOT EXISTS internship;
USE internship;

-- Insert Departments
INSERT INTO Department (DepartmentId, DepartmentName, Location, Budget) VALUES 
(1, 'Executive', 'New York', 2500000.00),
(2, 'Engineering', 'San Francisco', 5000000.00),
(3, 'Sales', 'Chicago', 1800000.00),
(4, 'Marketing', 'Austin', 1200000.00);

-- Insert Employees (Hierarchy: Andrew -> Nancy & Michael -> Staff)
-- Top Level
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, DepartmentId, Salary, BirthDate, HireDate, City, Country, Email) VALUES 
(1, 'Adams', 'Andrew', 'General Manager', NULL, 1, 160000.00, '1975-02-18', '2018-01-15', 'New York', 'USA', 'andrew@company.com');

-- Managers (Report to 1)
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, DepartmentId, Salary, BirthDate, HireDate, City, Country, Email) VALUES 
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, 3, 95000.00, '1982-12-08', '2019-03-01', 'Chicago', 'USA', 'nancy@company.com'),
(3, 'Mitchell', 'Michael', 'Engineering Lead', 1, 2, 120000.00, '1985-07-01', '2019-06-15', 'San Francisco', 'USA', 'michael@company.com'),
(7, 'Smith', 'John', 'Marketing Coordinator', 1, 4, 85000.00, '1995-04-12', '2020-02-15', 'Austin', 'USA', 'john@company.com');

-- Engineering Team (Report to 3)
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, DepartmentId, Salary, BirthDate, HireDate, City, Country, Email) VALUES 
(4, 'Peacock', 'Jane', 'Senior Developer', 3, 2, 95000.00, '1990-08-29', '2020-01-10', 'San Francisco', 'USA', 'jane@company.com'),
(5, 'Park', 'Margaret', 'QA Engineer', 3, 2, 75000.00, '1993-09-19', '2021-05-11', 'San Francisco', 'USA', 'margaret@company.com'),
(8, 'Miller', 'Chris', 'DevOps Engineer', 3, 2, 88000.00, '1991-03-14', '2021-06-20', 'San Francisco', 'USA', 'chris.m@company.com'),
(9, 'Davis', 'Amanda', 'Frontend Developer', 3, 2, 82000.00, '1994-11-22', '2021-08-15', 'Oakland', 'USA', 'amanda.d@company.com'),
(10, 'Rodriguez', 'Carlos', 'Backend Developer', 3, 2, 84000.00, '1992-05-05', '2021-11-01', 'San Jose', 'USA', 'carlos.r@company.com'),
(11, 'Wilson', 'Megan', 'Data Scientist', 3, 2, 105000.00, '1989-07-19', '2022-01-10', 'San Francisco', 'USA', 'megan.w@company.com'),
(12, 'Thomas', 'Kevin', 'Systems Analyst', 3, 2, 79000.00, '1995-12-01', '2022-04-18', 'Berkeley', 'USA', 'kevin.t@company.com'),
(13, 'White', 'Rachel', 'UI/UX Designer', 3, 2, 78000.00, '1996-02-28', '2022-07-01', 'San Francisco', 'USA', 'rachel.w@company.com'),
(14, 'Taylor', 'Jason', 'Junior Developer', 3, 2, 60000.00, '1998-10-05', '2023-01-15', 'San Francisco', 'USA', 'jason.t@company.com'),
(15, 'Anderson', 'Stephanie', 'QA Analyst', 3, 2, 63000.00, '1997-04-12', '2023-03-01', 'Oakland', 'USA', 'steph.a@company.com');

-- Sales Team (Report to 2)
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, DepartmentId, Salary, BirthDate, HireDate, City, Country, Email) VALUES 
(6, 'Johnson', 'Steve', 'Sales Representative', 2, 3, 62000.00, '1988-03-03', '2021-10-01', 'Chicago', 'USA', 'steve@company.com'),
(16, 'Thomas', 'Brian', 'Account Executive', 2, 3, 68000.00, '1990-06-21', '2022-02-01', 'Chicago', 'USA', 'brian.t@company.com'),
(17, 'Jackson', 'Emma', 'Sales Representative', 2, 3, 61000.00, '1993-01-15', '2022-05-10', 'Evanston', 'USA', 'emma.j@company.com'),
(18, 'White', 'Eric', 'Account Executive', 2, 3, 70000.00, '1987-11-30', '2022-08-15', 'Chicago', 'USA', 'eric.w@company.com'),
(19, 'Harris', 'Melissa', 'Sales Representative', 2, 3, 62500.00, '1995-09-08', '2023-02-01', 'Naperville', 'USA', 'melissa.h@company.com'),
(20, 'Martin', 'Scott', 'Inside Sales Specialist', 2, 3, 52000.00, '1996-05-14', '2023-06-01', 'Chicago', 'USA', 'scott.m@company.com');

-- Marketing Team (Report to 7)
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, DepartmentId, Salary, BirthDate, HireDate, City, Country, Email) VALUES 
(21, 'Garcia', 'Maria', 'SEO Specialist', 7, 4, 64000.00, '1994-03-23', '2021-04-11', 'Austin', 'USA', 'maria.g@company.com'),
(22, 'Martinez', 'David', 'Content Writer', 7, 4, 58000.00, '1996-07-19', '2021-09-15', 'Austin', 'USA', 'david.m@company.com'),
(23, 'Robinson', 'Sarah', 'Social Media Manager', 7, 4, 61000.00, '1995-11-02', '2022-01-20', 'San Antonio', 'USA', 'sarah.r@company.com'),
(24, 'Clark', 'James', 'Digital Marketer', 7, 4, 67000.00, '1991-08-12', '2022-06-01', 'Austin', 'USA', 'james.c@company.com'),
(25, 'Lewis', 'Elena', 'Graphic Designer', 7, 4, 59000.00, '1997-01-30', '2022-10-15', 'Houston', 'USA', 'elena.l@company.com'),
(26, 'Lee', 'Daniel', 'Marketing Analyst', 7, 4, 72000.00, '1993-04-05', '2023-03-10', 'Austin', 'USA', 'daniel.l@company.com');

-- Insert Customers
INSERT INTO Customer (CustomerId, CompanyName, ContactName, ContactTitle, City, Country, Phone, SupportRepId) VALUES 
(1, 'Alpha Tech Corp', 'Alice Smith', 'CTO', 'San Francisco', 'USA', '555-0122', 6),
(2, 'Beta Logistics', 'Bob Jones', 'Operations Director', 'Chicago', 'USA', '555-0144', 6),
(3, 'Global Media Inc', 'Charlie Brown', 'Procurement Manager', 'London', 'UK', '555-0199', 2),
(4, 'Apex Solutions', 'Diana Prince', 'Director of IT', 'Boston', 'USA', '555-0211', 16),
(5, 'Quantum Leap Enterprises', 'Sam Beckett', 'Head Research Executive', 'Dallas', 'USA', '555-0233', 17),
(6, 'Vanguard Industries', 'Tony Stark', 'CEO', 'New York', 'USA', '555-3000', 18),
(7, 'Omni Consumer Products', 'Dick Jones', 'Vice President', 'Detroit', 'USA', '555-1987', 19),
(8, 'Initech LLC', 'Peter Gibbons', 'Project Lead', 'Austin', 'USA', '555-0999', 2),
(9, 'Starlight Ventures', 'Stella Maris', 'Partner', 'Miami', 'USA', '555-4321', 16),
(10, 'Horizon Retailers', 'Walter White', 'Operations Lead', 'Albuquerque', 'USA', '555-0815', 17),
(11, 'Cyberdyne Systems', 'Miles Dyson', 'Director of R&D', 'Los Angeles', 'USA', '555-1991', 6),
(12, 'Acme Corporation', 'Wile E. Coyote', 'Product Specialist', 'Phoenix', 'USA', '555-4422', 18),
(13, 'Tyrell Corp', 'Eldon Tyrell', 'Founder', 'Los Angeles', 'USA', '555-2019', 19),
(14, 'Wayne Enterprises', 'Bruce Wayne', 'Owner', 'Gotham', 'USA', '555-0007', 2),
(15, 'LexCorp', 'Lex Luthor', 'CEO', 'Metropolis', 'USA', '555-0900', 16),
(16, 'Umbrella Corp', 'Albert Wesker', 'Security Chief', 'Raccoon City', 'USA', '555-0666', 17),
(17, 'Massive Dynamic', 'Nina Sharp', 'COO', 'New York', 'USA', '555-8811', 18),
(18, 'Hudsucker Industries', 'Waring Hudsucker', 'President', 'Chicago', 'USA', '555-1958', 19),
(19, 'Globex Corporation', 'Hank Scorpio', 'CEO', 'Cypress Creek', 'USA', '555-1997', 6),
(20, 'Soylent Industries', 'Robert Thorn', 'Investigator', 'New York', 'USA', '555-2022', 16);

-- Insert Projects
INSERT INTO Project (ProjectId, ProjectName, StartDate, EndDate, CustomerId, TotalCost) VALUES 
(1, 'Cloud Migration', '2024-01-10', '2024-08-30', 1, 150000.00),
(2, 'E-Commerce Platform', '2024-03-15', NULL, 1, 250000.00),
(3, 'Supply Chain API', '2024-05-01', NULL, 2, 95000.00),
(4, 'CRM Integration', '2024-02-01', '2024-06-15', 4, 110000.00),
(5, 'Data Warehouse Build', '2024-04-10', NULL, 5, 320000.00),
(6, 'Mobile App v2', '2024-01-15', '2024-07-20', 6, 185000.00),
(7, 'Security Audit Patching', '2024-06-01', '2024-09-01', 11, 45000.00),
(8, 'AI Chatbot Assistant', '2024-07-01', NULL, 3, 135000.00),
(9, 'ERP System Overhaul', '2024-02-20', NULL, 7, 450000.00),
(10, 'Legacy Code Refactor', '2024-03-01', '2024-05-30', 8, 75000.00),
(11, 'Network Infrastructure Upgrade', '2024-05-15', NULL, 14, 210000.00),
(12, 'BI Dashboard Analytics', '2024-06-10', NULL, 15, 85000.00),
(13, 'Automated Testing Pipeline', '2024-04-01', '2024-08-01', 19, 65000.00),
(14, 'Disaster Recovery Plan', '2024-07-15', NULL, 16, 125000.00),
(15, 'Cloud Cost Optimization', '2024-08-01', NULL, 13, 55000.00),
(16, 'IoT Sensor Integration', '2024-02-15', '2024-11-30', 17, 280000.00),
(17, 'DevOps Containerization', '2024-03-10', '2024-09-15', 1, 140000.00),
(18, 'Customer Portal Redesign', '2024-05-20', NULL, 9, 90000.00),
(19, 'Blockchain Ledger Pilot', '2024-06-01', NULL, 6, 400000.00),
(20, 'Internal Tooling Suite', '2024-01-05', '2024-04-30', 20, 35000.00);

-- Insert Project Assignments
INSERT INTO ProjectAssignment (EmployeeId, ProjectId, RoleOnProject, HoursAllocated) VALUES 
(3, 1, 'Project Sponsor', 40),
(4, 1, 'Lead Backend Dev', 160),
(5, 1, 'QA Lead', 100),
(8, 1, 'DevOps Setup', 60),
(4, 2, 'Fullstack Architect', 200),
(9, 2, 'UI Developer', 140),
(13, 2, 'UX Designer', 80),
(5, 3, 'Backend Engineer', 120),
(10, 3, 'API Developer', 150),
(12, 4, 'System Analyst', 90),
(4, 5, 'Database Architect', 180),
(11, 5, 'Data Engineer', 220),
(9, 6, 'Frontend Specialist', 160),
(14, 6, 'Junior Developer', 120),
(5, 6, 'QA Engineer', 80),
(8, 7, 'Security Engineer', 110),
(11, 8, 'AI Engineer', 200),
(10, 8, 'Python Developer', 130),
(12, 9, 'Business Analyst', 150),
(4, 9, 'Technical Lead', 250),
(14, 10, 'Developer', 100),
(8, 11, 'Infrastructure Engineer', 140),
(11, 12, 'BI Developer', 110),
(5, 13, 'Automation Engineer', 130),
(12, 14, 'Risk Analyst', 70),
(8, 15, 'Cloud Architect', 90),
(10, 16, 'Firmware Engineer', 180),
(8, 17, 'Docker Specialist', 100),
(13, 18, 'UI Designer', 120),
(4, 19, 'Smart Contract Dev', 210);