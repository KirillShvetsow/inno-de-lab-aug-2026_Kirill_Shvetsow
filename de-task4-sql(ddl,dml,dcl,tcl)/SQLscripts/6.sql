--Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'.
update projects
set budget = budget + (budget * 0.1)
where projectId in(
	select projectid from EmployeeProjects as ep
	join employees as e on ep.employeeId = e.employeeid
	where e.department='IT'
	)
	
--Для любого проекта, у которого еще нет EndDate установить EndDate на один год позже его StartDate
NULL), установить EndDate на один год позже его StartD
update projects
set endDate = startDate + interval '1 year'
where endDate is null