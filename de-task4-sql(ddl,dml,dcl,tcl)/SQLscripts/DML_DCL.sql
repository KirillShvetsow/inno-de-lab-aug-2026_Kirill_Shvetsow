--1. Увеличить Salary всех сотрудников в отделе 'HR' на 10%.
update employees 
set salary = salary + (0.1 * salary)
where department in ('HR');

--Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'.(Не знаю нужно ли было,обновлял именно того у которого отдел IT,а то не логично что HR стал Senior)
update employees
set department = 'Senior IT'
where employeeId = (
    select employeeId 
    from employees 
    where salary > 70000.00 and department like('IT')
    limit 1
);

--
delete from employees
where not exists (
    select 1
    from employeeProjects as ep
    where employees.employeeId = ep.employeeId
);


--
begin;
with new_project as (
    insert into Projects (ProjectName, Budget, StartDate, EndDate)
    values ('SpringSecurity Token Generation', 34000.00, '2027-01-09', '2027-01-29')
    returning ProjectID
)
insert into EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
select 
    e.EmployeeID,
    np.ProjectID,
    100
from new_project np
cross join Employees e
where e.Department = 'IT'
limit 2
returning EmployeeID, ProjectID, HoursWorked;

commit;
