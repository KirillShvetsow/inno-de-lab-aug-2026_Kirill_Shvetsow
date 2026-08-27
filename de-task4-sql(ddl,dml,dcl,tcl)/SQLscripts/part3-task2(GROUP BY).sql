CREATE TABLE Employees (
EmployeeID SERIAL PRIMARY KEY, -- SERIAL for auto-incrementing integer
IDs in PostgreSQL
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Department VARCHAR(50),
Salary DECIMAL(10, 2)
);