USE Retail_Store;
/*1*/ select phone_number from _Customer where name = 'Eduardo Keys';    /*B-tree indexing on Customer name has optimized this query*/ 

/*2*/ select Item_ID from Cart where id = (select id from _Customer where name = 'Tony Savage'); /*Indexing on Customer name has optimized this query*/

/*3*/SELECT name , COUNT(name) 
	 FROM employee						/*Gives the name of employee who have same names*/
     Group By name
     having COUNT(name) > 1 ; 	

/*4*/ select AVG(salary) from Employee;    /* basic aggregate*/
/*4*/ select COUNT(Distinct Customer_ID) from Deliveries;

/*5*/ UPDATE Items SET quantity = quantity - 3 where ID = 1;	/* Updation */

/*Indexing on _Customer(ID) has optimized this query*/
/*6*/ SELECT d.id, c.id, c.name, c.address			/*Shows the deliveries pending for a delivery man*/
	  FROM _customer c, deliveries d							
      WHERE d.Delivery_person_SSN='114-50-0232' and c.id = d.customer_id;
	
/*7*/ CREATE VIEW Russian_Customers AS
	  SELECT _customer.id, _customer.name,_customer.phone_number,cart.Net_Price FROM Cart,_Customer
	  WHERE (_customer.address like '%Russia') and cart.id = _customer.id and 	/*not exact details types*/
      (cart.Net_Price >= 500 );													/* View Which gives Russian customers with cart value greater than 500 */
	  Select * from Russian_Customers;							/* use of View and Join in this to get Net_Price too....*/
	  drop view Russian_Customers;

/* 8 */ SELECT name, net_price, quantity FROM Items ORDER BY net_price ASC;             /* basic ordering */
/* 8 */ SELECT items.name, items.net_price,suppliers.name as supplier_name,				/* ranking with join to get supplier name */
		RANK() over (ORDER BY net_price ASC ) as item_rank
		FROM items,suppliers where items.id=suppliers.item_id;

/*9*/ SELECT distinct t1.id  from Cart t1 , Cart t2 				/*Self_Join*/
	  WHERE  t1.id = t2.id and t1.Item_ID <> t2.Item_ID					/*Gives the customers who buyes more than 1 items*/
      ORder by t1.id ASC;											/*Ordering in ascending*/
      
      
/*10*/ select items.name from items
	  where items.id=(Select cart.Item_ID from Cart
      where cart.id = (Select payments_ledger.Customer_ID from payments_ledger where payments_ledger.id='1'));	/*A nested Type query*/
      
/*11*/ SELECT p1.ID,p1.amount from payments_ledger p1
	   WHERE 2 = (SELECT count(distinct amount) from payments_ledger p2   /*Getting Nth largest amount from payment ledger*/ 
       WHERE p2.amount > p1.amount );									  /*Took help from gate Smasher*/
    
/*12*/ALTER TABLE _Customer ADD COLUMN email varchar(500);
	  ALTER TABLE _Customer DROP COLUMN email;							/* Just for showing .....!! */
      select * from _Customer;





																					