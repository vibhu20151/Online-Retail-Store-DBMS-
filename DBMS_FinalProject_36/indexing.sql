CREATE INDEX ITEM_NAMES ON Items (name); /*Secondary Index*/

CREATE INDEX CustName USING BTREE ON _Customer (name);	/*B-Tree Indexing*/
/*The number of customers can become very large with time, so using dense index is not a good idea.
*/

CREATE INDEX EmpName ON Employee (name); /*Secondary Index*/

CREATE INDEX DelSSN ON Deliveries (delivery_person_ssn);  /*Secondary Index*/