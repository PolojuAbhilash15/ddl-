create database BANK_db;
use BANK_db;
desc accounts;
create table accounts (account_number int primary key,customer_name varchar(50),account_type varchar(30),balance float(8,2));
insert into accounts values(1001,"ellie","savings",50000.00),
(1002,"john","savings",300000.00),
(1003,"sarah","current",750000.00),
(1004,"david","savings",250000.00),
(1005,"emma","current",600000.00);

start transaction;
update accounts  set balance =balance -10000
where account_number = 1001;
update accounts  set balance =40000
where account_number = 1002;
start transaction;
update accounts set balance=30000 where account_number =1002;
rollback;
select account_number ,customer_name ,balance from accounts;
select * from accounts;  
start transaction;
update accounts set balance =balance+5000  where account_number =1001;
savepoint s1; 

update accounts set balance =balance+8000  where account_number =1005;
savepoint s3;
update accounts set balance =balance-500  where account_number =1004;
rollback to s3;
commit;
start transaction;
update accounts set balance =balance+2000  where account_number =1001;
savepoint f1;
update accounts set balance =balance+3000  where account_number =1002;
savepoint f2;
update accounts set balance =balance+4000  where account_number =1003;
update accounts set balance =balance-1000  where account_number =1005;
rollback to f2;
commit;
select * from accounts; 





