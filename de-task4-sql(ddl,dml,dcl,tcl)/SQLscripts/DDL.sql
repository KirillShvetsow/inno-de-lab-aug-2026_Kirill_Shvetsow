--1. Создать нового пользователя PostgreSQL (роль) с именем hr_user и паролем.
create user hr_user with password '123hr';

--2. Предоставить hr_user право SELECT на таблицу Employees
grant select on Employees to hr_user;