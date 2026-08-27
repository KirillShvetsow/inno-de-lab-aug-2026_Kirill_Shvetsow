--1. Создать новую таблицу с именем Departments.
create table Departments(
	DepartmentId Serial Primary Key,
	DepartmentName VARCHAR(50) unique not null,
	location VARCHAR(50)
	)
	
--2. Изменить таблицу Employees, добавив новый столбец с именем Email (VARCHAR(100)).
alter table Employees
add Email VARCHAR(100);

--3. Заполнить столбец Email для всех текущих сотрудников уникальными значениями (например, через UPDATE).
update Employees
set Email = '123@gmail.com'
where employeeid = 1;

update Employees
set Email = '456@gmail.com'
where employeeid = 2;

update Employees
set Email = '789@gmail.com'
where employeeid = 3;

update Employees
set Email = '135@gmail.com'
where employeeid = 4;

update Employees
set Email = '246@gmail.com'
where employeeid = 6;

update Employees
set Email = '359@gmail.com'
where employeeid = 7;

--4. Добавить ограничение UNIQUE к столбцу Email в таблице Employees.
alter table Employees
add constraint email_unique unique(Email);

--Альтернатива
alter table Employees
add unique(Email);

--Переименовать столбец Location в таблице Departments в OfficeLocation.
alter table Departments 
rename column Location to OfficeLocation;