use employees;
create user 'marketing_user'@'localhost' identified by 'mark_123';
select * from employee_records;
grant all privileges on employees.employee_records to 'marketing_user'@'localhost';
revoke select on employees.employee_records from 'hr_user'@'localhost';


