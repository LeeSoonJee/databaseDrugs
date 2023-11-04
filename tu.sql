-- Bảng Tù Nhân
CREATE TABLE Prisoners (
    PrisonerID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Gender CHAR(1),
    Nationality VARCHAR(50),
    Crime VARCHAR(100),
    Sentence INT,
    EntryDate DATE
);

-- Bảng Nhân Viên
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    ContactInfo VARCHAR(100)
);

-- Bảng Phòng Giam
CREATE TABLE Cells (
    CellID INT PRIMARY KEY,
    Capacity INT,
    CurrentPrisoners INT
);

-- Bảng Giao Dịch
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    PrisonerID INT,
    EmployeeID INT,
    TransactionDate DATE,
    Description VARCHAR(255)
);

-- Bảng Hợp Đồng Lao Động
CREATE TABLE EmploymentContracts (
    ContractID INT PRIMARY KEY,
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    Salary DECIMAL(10, 2)
);

-- Bảng Chấm Công
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    Status VARCHAR(50)
);

-- Bảng Lương
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Month date,
    Amount DECIMAL(10, 2)
);

-- Bảng Đơn Xin Phép
CREATE TABLE LeaveRequests (
    RequestID INT PRIMARY KEY,
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    Reason VARCHAR(255)
);