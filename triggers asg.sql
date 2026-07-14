use users;
delimiter $$
create table orders (order_id int , no_ofitems int , order_date date ,message varchar (30));
select * from orders;
insert into orders values (5,10,'2026-07-03',"order confirmed");
desc orders;
alter table audit_log drop no_ofitems;
create table audit_log (action_type varchar (40) , no_ofitems int , order_id int ,message varchar (30));
desc audit_log;
select * from audit_log;
DELIMITER $$

CREATE TRIGGER trigger_after_insert
AFTER INSERT
ON orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log(action_type, order_id, message)
    VALUES ('INSERT', NEW.order_id, 'New order added');
END$$

DELIMITER ;
use users;
select * from orders;
select * from audit_log;



delimiter $$
create trigger t_before after insert on orders for each row begin 
insert into audit_log (action_type,order_id,message) values ("insert",new.order_id,"order not confirmed");
end $$
delimiter ;
show triggers;
desc orders;
INSERT INTO orders
VALUES (2,4,'2025-10-09');
desc orders;
alter table orders drop no_ofitems;
desc audit_log;
select * from orders;
update orders set price = 200 where order_id in (2,4);
alter table orders add price int;
set SQL_SAFE_UPDATES =0;
SELECT * FROM audit_log;
show triggers;
delimiter $$
create trigger triger_after_update after update on orders for each row begin  
insert into audit_log (action_type,order_id,message) values ("update", new.order_id,concat(old.price ,"to",new.price));
end $$
delimiter ;

update orders set price = 200 where order_id=1;
delimiter $$
create trigger trgr_after_dlte after delete on orders for each row begin insert into audit_log(action_type,order_id,message) values ("delete",old.order_id,"order got delted");
end $$
delimiter ;
delete from orders where order_id=5;
show triggers;
delimiter $$
create trigger trgr_before_update before update on orders for each row begin 
insert into audit_log (action_type,order_id,message) values ("update2",new.order_id,"updated");
end $$
delimiter ;
select * from audit_log;
update orders set price =400 where order_id=4;
show triggers;
select * from orders;
delimiter $$ 
create trigger trgr_before_dlte before delete on orders for each row begin insert into audit_log (action_type,order_id,message) values ("delete2",old.order_id,"orders got deleted ");
end $$
delimiter ;
update orders set price =1000 where order_id =1;
delete from orders where order_id =1;
select * from audit_log;
select * from orders;
create user 'employees'@'local host' identified by 'employees@123';
create user 'sales'@'localhost' identified by 'sales@123';
grant select on employees .employee_details to 'sales'@'localhost';







