create table employee_records (emp_id int primary key, emp_name varchar(40),department varchar(30),salary decimal(8,3));
select * from employee_records;

insert into employee_records values ( 6,"vignesh","it",70000);
select * from employee_records order by salary asc;
select * from employee_records order by salary desc;
select * from employee_records order by emp_name asc;
select count(emp_id) from employee_records;
select sum(salary) from employee_records;
select avg(salary) from employee_records;
select max(salary) from employee_records;
select min(salary) from employee_records;
 
alter table employee_records add city varchar (50);
update employee_records set city="siddipet" where emp_id =4;
select count(emp_id) from employee_records where city ="hyderabad";
select avg(salary)  from employee_records where department="it";