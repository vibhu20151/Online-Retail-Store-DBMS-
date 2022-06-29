Use Retail_Store;

/*----------------------------------------------------------------------------------------------------------*/
CREATE USER 'Liam' IDENTIFIED By '9101112';				/*Liam is a customer whose ID is 12*/
Create View CART_VIEW_12 as select d.id, d.item_id, d.quantity, d.net_price 
		from _customer c, Cart d 
        where c.id = d.id
        AND C.ID = 12;
				   /*We need to create a cart view and a details view for all customers*/
Create view CUSTOMER_DETAILS_VIEW_12 as select name, address, phone_number from _Customer where id = 12;

grant all privileges on CART_VIEW_12 to 'Liam';
grant all privileges on CUSTOMER_DETAILS_VIEW_12 to 'Liam';
grant select on Items to 'Liam';
/*----------------------------------------------------------------------------------------------------------*/
CREATE USER 'Ramon_Reyes' IDENTIFIED by '5678'; 		/*Ramon_Reyes is an employee : delivery person*/
Create View DELIVERY_VIEW_Ramon_Reyes as select e.SSN, d.id, d.customer_id,
		c.name as customer_name, c.phone_number,  c.address, d.delivery_by_date 
        from _Customer c, Employee e, Deliveries d 
        where d.customer_id = c.id 
        and e.name = 'Ramon Reyes';
					/*We need to create such views for all delivery people*/

Grant select on DELIVERY_VIEW_Ramon_Reyes to 'Ramon_Reyes';
/*----------------------------------------------------------------------------------------------------------*/
CREATE USER 'manager' IDENTIFIED BY '1234';
grant select on Payments_Ledger to 'manager';

grant select on Deliveries to 'manager';

grant all privileges on Items to 'manager';

grant all privileges on Suppliers to 'manager';

grant select, update, insert on _Customer to 'manager';

grant select on Employee to 'manager';