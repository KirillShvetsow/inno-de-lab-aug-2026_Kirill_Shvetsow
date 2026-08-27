--
create or replace function CalculateAnnualBonus(
	employeeId INTEGER,
	salary DECIMAL)
returns DECIMAL
language PLpgSQL 
as $$
declare
	bonus_sum DECIMAL;
begin
	if salary < 0 then
		return 0;
	else
		bonus_sum := (salary + (salary * 0.1));
		return bonus_sum;
	end if;
end;
$$;

select CalculateAnnualBonus(3,100000.00) as bonus_salary

--льтернативный вариант где мы получаем Salary по Id если такой работник существует
create or replace function CalculateAnnualBonus(
	emplId INTEGER)
returns DECIMAL
language PLpgSQL 
as $$
declare
	bonus_sum DECIMAL;
	emplSalary DECIMAL;
begin
	select salary into emplSalary
	from employees
	where emplId = employeeId;
	if emplSalary is null or emplSalary < 0 then
		return 0;
	else
		bonus_sum := (emplSalary + (emplSalary * 0.1));
		return bonus_sum;
	end if;
end;
$$;

--Если работник существует
select CalculateAnnualBonus(3) as bonus;

--Если не существует
select CalculateAnnualBonus(15) as bonus;

--
create view IT_Department_View as
select
	firstName,
	lastName,
	Salary
from employees where department in('IT')

select * from IT_Department_View 