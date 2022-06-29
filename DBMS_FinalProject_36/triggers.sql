Use Retail_Store;
/*When a customer puts an item into cart, quantity of that item is reduced by the quantity taken by the customer*/
delimiter |
CREATE TRIGGER insertingInCart BEFORE INSERT ON Cart
	FOR EACH ROW
		BEGIN
			UPDATE Items set Items.quantity = Items.quantity - New.quantity where Items.id = New.item_id;
		END;
|
delimiter ;



/*If the quantity of an item changes, the change will be reflected on the items of Cart*/
delimiter |
CREATE TRIGGER modifyQuantityInItems AFTER UPDATE ON Items
	FOR EACH ROW
	BEGIN
		UPDATE CART SET CART.Quantity = IF(New.Quantity <= Cart.quantity, New.Quantity, Cart.quantity) WHERE CART.ITEM_ID = New.ID;
	END;
|
delimiter ;


/*For illustration*/
/*1*/INSERT INTO Cart VALUES('20',50,5,178.44);
select * from Cart;
select * from Items; 
/*2*/UPDATE Items set quantity = quantity - 355 where ID = 87;









