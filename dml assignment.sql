show databases;
create database zomato;
create table users (user_id varchar(40),name varchar (50),email varchar(50),city varchar (30),wallet_balance decimal(7,2));
select * from users;
insert into users values(1,"manoj","maoj@gmail.com","siddipet",1500.54),(2,"ajay","ajai12@gmail.com","karimnagar",500.14),(3,"srinivas","srinu@gmail.com","dubbak",700.59),(4,"pradeep","pradee@gmail.com","siddipet",5000.64),(5,"abhilash","abhi15@gmail.com","siddipet",10000.24);
update users set city="hyderabad" where user_id =5;
delete from users where user_id=3;