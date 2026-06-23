-- Create the Database
CREATE DATABASE IF NOT EXISTS internship;
USE internship;

-- =========================================================================
-- 1. DEPARTMENT TABLE
-- =========================================================================
CREATE TABLE Department
(
    DepartmentId INT AUTO_INCREMENT NOT NULL,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    Budget DECIMAL(12,2) DEFAULT 0.00,
    CONSTRAINT PK_Department PRIMARY KEY (DepartmentId)
);

-- =========================================================================
-- 2. EMPLOYEE TABLE (Includes Self-Referencing Hierarchy & Salary)
-- =========================================================================
CREATE TABLE Employee
(
    EmployeeId INT AUTO_INCREMENT NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    Title VARCHAR(50) NULL,
    ReportsTo INT NULL, -- Self-referencing FK for Manager Hierarchy
    DepartmentId INT NOT NULL, -- FK to Department
    Salary DECIMAL(10,2) NOT NULL,
    BirthDate DATE NULL,
    HireDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    City VARCHAR(40) NULL,
    Country VARCHAR(40) NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeId),
    CONSTRAINT FK_Employee_ReportsTo FOREIGN KEY (ReportsTo) 
        REFERENCES Employee (EmployeeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_Employee_Department FOREIGN KEY (DepartmentId) 
        REFERENCES Department (DepartmentId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- =========================================================================
-- 3. CUSTOMER TABLE
-- =========================================================================
CREATE TABLE Customer
(
    CustomerId INT AUTO_INCREMENT NOT NULL,
    CompanyName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(60) NOT NULL,
    ContactTitle VARCHAR(30) NULL,
    City VARCHAR(40) NULL,
    Country VARCHAR(40) NULL,
    Phone VARCHAR(24) NULL,
    SupportRepId INT NULL, -- FK to Employee (Account Manager)
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerId),
    CONSTRAINT FK_Customer_Employee FOREIGN KEY (SupportRepId) 
        REFERENCES Employee (EmployeeId) ON DELETE SET NULL
);

-- =========================================================================
-- 4. PROJECT TABLE
-- =========================================================================
CREATE TABLE Project
(
    ProjectId INT AUTO_INCREMENT NOT NULL,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    CustomerId INT NOT NULL, -- FK to Customer
    TotalCost DECIMAL(12,2) DEFAULT 0.00,
    CONSTRAINT PK_Project PRIMARY KEY (ProjectId),
    CONSTRAINT FK_Project_Customer FOREIGN KEY (CustomerId) 
        REFERENCES Customer (CustomerId) ON DELETE CASCADE
);

-- =========================================================================
-- 5. EMPLOYEE_PROJECT_ASSIGNMENT (Many-to-Many Junction Table)
-- =========================================================================
CREATE TABLE ProjectAssignment
(
    EmployeeId INT NOT NULL,
    ProjectId INT NOT NULL,
    RoleOnProject VARCHAR(50) NOT NULL,
    HoursAllocated INT DEFAULT 0,
    CONSTRAINT PK_ProjectAssignment PRIMARY KEY (EmployeeId, ProjectId),
    CONSTRAINT FK_Assignment_Employee FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId),
    CONSTRAINT FK_Assignment_Project FOREIGN KEY (ProjectId) REFERENCES Project (ProjectId) ON DELETE CASCADE
);