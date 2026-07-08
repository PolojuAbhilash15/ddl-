select * from employee_records;

select department, count(*) from  employee_records group by department;
select city, count(*) from employee_records group by city;
select department ,sum(salary) from employee_records group by department;
select department , avg(salary)
 from employee_records group by department;
 select department ,max(salary) from employee_records group by department;
 select department ,min(salary) from employee_records group by department;
select department from employee_records group by department having count(*)>1;
insert into employee_records values (7,"ajay","hr",45000.0,"hyderabad");
desc employee_records;
select department from employee_records group by department having avg(salary)>45000;
select city ,department ,count(*) from employee_records group by city,department;
