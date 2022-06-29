CREATE DATABASE IF NOT EXISTS Retail_Store;
USE Retail_Store;
CREATE TABLE _Customer(
	ID BIGINT NOT NULL PRIMARY KEY,
	name VARCHAR(500) NOT NULL,
    phone_number VARCHAR(500) NOT NULL,
    address VARCHAR(500) NOT NULL
);
CREATE TABLE Suppliers(
	ID BIGINT NOT NULL,
    name VARCHAR(500) NOT NULL,
    item_id BIGINT NOT NULL,
    contact VARCHAR(500) NOT NULL,
    PRIMARY KEY (item_id, ID, name)
);
CREATE TABLE Items(
	ID BIGINT NOT NULL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    price FLOAT NOT NULL,
    discount INT NOT NULL,
    quantity INT NOT NULL,
    tax FLOAT NOT NULL,
    delivery_charge FLOAT NOT NULL,
    net_price FLOAT NOT NULL,
    CONSTRAINT Suppliers_Add_Items FOREIGN KEY (ID) REFERENCES Suppliers (item_id)
);
CREATE TABLE Cart(
    ID BIGINT NOT NULL,
    Item_ID BIGINT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 1),
    Net_Price FLOAT NOT NULL,
    PRIMARY KEY (ID , Item_ID),
    FOREIGN KEY (ID) REFERENCES _Customer (ID) ON DELETE CASCADE,
    CONSTRAINT Items_Added_to_Cart FOREIGN KEY (Item_ID) REFERENCES Items (ID) ON DELETE CASCADE
);
CREATE TABLE Employee(
    SSN VARCHAR(500) NOT NULL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    DateOfJoining DATETIME NOT NULL,
    JobTitle VARCHAR(500) NOT NULL,    
    salary FLOAT NOT NULL,
    address VARCHAR(500) NOT NULL
);
CREATE TABLE Deliveries(
    ID BIGINT NOT NULL PRIMARY KEY,
    Customer_ID BIGINT,
    Delivery_person_SSN VARCHAR(500),
    Item_ID INT NOT NULL,
    Delivery_by_date DATETIME NOT NULL ,
    FOREIGN KEY (Customer_ID) REFERENCES _Customer(ID), 
	CONSTRAINT Employee_delivers_to_customer FOREIGN KEY (Delivery_person_SSN) REFERENCES Employee(SSN) 
);
CREATE TABLE Payments_Ledger(
    ID BIGINT NOT NULL PRIMARY KEY,
    Customer_ID BIGINT NOT NULL,
    Payment_date_time DATETIME NOT NULL,
    amount FLOAT NOT NULL,
    CONSTRAINT Customer_Pays FOREIGN KEY (Customer_ID) REFERENCES _Customer (ID)
);

/*_Customer*/
INSERT INTO _Customer VALUES('1','Megan Hooper','2-551-211-1212','Mrs. Megan Hooper, Birkenhead   5755, Madrid - 2332, Israel');
INSERT INTO _Customer VALUES('2','Tony Savage','7-445-818-1875','Mr. Tony Savage, Geffrye   8393, Lancaster - 6826, Nicaragua');
INSERT INTO _Customer VALUES('3','Wade Cartwright','4-867-226-5806','Mr. Wade Cartwright, Cardinal 7457, San Diego - 1038, Vatican City');
INSERT INTO _Customer VALUES('4','Daniel Lloyd','0-376-321-1355','Mr. Daniel Lloyd, Erindale 2577, Seattle - 6721, Sudan, South');
INSERT INTO _Customer VALUES('5','Clint Hewitt','8-830-653-7243','Mr. Clint Hewitt, Adelaide  5086, Lancaster - 3368, Vatican City');
INSERT INTO _Customer VALUES('6','Henry Atkinson','7-865-114-1553','Mr. Henry Atkinson, Kilner   422, Salem - 4406, Ecuador');
INSERT INTO _Customer VALUES('7','Daron Cork','8-118-788-1772','Mr. Daron Cork, Garfield 195, Bucharest - 2672, Greece');
INSERT INTO _Customer VALUES('8','Julia Button','8-212-434-6152','Miss Julia Button, Bayberry 9366, Salem - 5253, Tunisia');
INSERT INTO _Customer VALUES('9','Lorraine Norton','0-446-842-4684','Ms. Lorraine Norton, Carnegie   7418, Los Angeles - 4731, Azerbaijan');
INSERT INTO _Customer VALUES('10','Eduardo Keys','4-241-004-4646','Mr. Eduardo Keys, Cave   9797, Scottsdale - 5170, Netherlands');
INSERT INTO _Customer VALUES('11','Kieth James','5-741-517-1611','Mr. Kieth James, Colombo   4016, Minneapolis - 1414, Belarus');
INSERT INTO _Customer VALUES('12','Liam Burnley','8-426-827-3546','Mr. Liam Burnley, Adelaide  5233, Venice - 8282, Sri Lanka');
INSERT INTO _Customer VALUES('13','Rick Powell','1-176-531-2761','Mr. Rick Powell, Chatfield  3554, Valetta - 7776, Papua New Guinea');
INSERT INTO _Customer VALUES('14','Matthew Robertson','8-541-174-7634','Mr. Matthew Robertson, Ampton  1312, Columbus - 2042, Latvia');
INSERT INTO _Customer VALUES('15','Sharon Asher','2-580-312-1436','Miss Sharon Asher, Rivervalley 680, Richmond - 8328, New Zealand');
INSERT INTO _Customer VALUES('16','Carissa Ebden','7-624-581-7366','Ms. Carissa Ebden, Collins  2903, Moreno Valley - 1542, Vietnam');
INSERT INTO _Customer VALUES('17','Lindsay Pope','4-184-751-7713','Ms. Lindsay Pope, Adelaide  1293, Dallas - 5125, Korea, North');
INSERT INTO _Customer VALUES('18','Nathan Gibbons','4-651-288-0483','Mr. Nathan Gibbons, Camdale  7641, Madison - 3118, Kiribati');
INSERT INTO _Customer VALUES('19','John Larsen','3-808-061-5113','Mr. John Larsen, Edwin   2200, Rome - 8770, Ireland');
INSERT INTO _Customer VALUES('20','Eduardo James','2-768-311-4724','Mr. Eduardo James, Carlisle  2577, Lyon - 7332, Iraq');
INSERT INTO _Customer VALUES('21','Aleksandra York','5-151-108-4845','Miss Aleksandra York, Angel  4122, Baltimore - 6405, Tunisia');
INSERT INTO _Customer VALUES('22','Callie Jarrett','3-678-638-5723','Ms. Callie Jarrett, Cecilia  7421, Las Vegas - 8487, Tajikistan');
INSERT INTO _Customer VALUES('23','Bob James','8-355-728-4221','Mr. Bob James, Blake  3020, Milwaukee - 1007, Sierra Leone');
INSERT INTO _Customer VALUES('24','Danny Gavin','8-040-152-7171','Mr. Danny Gavin, Viscount   1671, Santa Ana - 0387, Egypt');
INSERT INTO _Customer VALUES('25','Benjamin Ogilvy','4-636-630-6110','Mr. Benjamin Ogilvy, Collins  3441, Albuquerque - 6704, The Gambia');
INSERT INTO _Customer VALUES('26','Denny Mcgregor','4-028-374-5534','Mr. Denny Mcgregor, Longmoore   7505, Amarillo - 4300, Malta');
INSERT INTO _Customer VALUES('27','Chris Rossi','1-611-002-5002','Mr. Chris Rossi, Durham 4990, Berna - 5755, Haiti');
INSERT INTO _Customer VALUES('28','Roger Hamilton','7-884-082-3584','Mr. Roger Hamilton, Canon 2482, Cincinnati - 4427, Russia');
INSERT INTO _Customer VALUES('29','Kate Baxter','2-084-231-0303','Ms. Kate Baxter, Elizabeth  985, Columbus - 2566, Barbados');
INSERT INTO _Customer VALUES('30','Hank Andrews','1-310-003-5371','Mr. Hank Andrews, Colombo   365, Berna - 0048, The Gambia');
INSERT INTO _Customer VALUES('31','Harvey Morrison','4-380-161-2715','Mr. Harvey Morrison, Yoakley 961, Salem - 1884, Norway');
INSERT INTO _Customer VALUES('32','Thea Gordon','1-216-620-1333','Mrs. Thea Gordon, Bingham   1082, Lincoln - 2815, Bhutan');
INSERT INTO _Customer VALUES('33','Harvey Newton','2-872-804-7458','Mr. Harvey Newton, Cecilia  9683, Hollywood - 4078, Italy');
INSERT INTO _Customer VALUES('34','Angelina Robertson','4-076-477-5038','Miss Angelina Robertson, Longleigh   8629, Charlotte - 0075, Estonia');
INSERT INTO _Customer VALUES('35','Raquel Pratt','2-286-454-5754','Ms. Raquel Pratt, Blackwall  1068, Seattle - 0068, Thailand');
INSERT INTO _Customer VALUES('36','Clarissa Bloom','2-516-837-8476','Mrs. Clarissa Bloom, Jackson 5492, Toledo - 3046, Algeria');
INSERT INTO _Customer VALUES('37','Zara Evans','5-867-510-7831','Miss Zara Evans, Bishop   3405, San Antonio - 5105, USA');
INSERT INTO _Customer VALUES('38','Benjamin Ellison','8-482-736-6600','Mr. Benjamin Ellison, Edwin   2306, Worcester - 1638, Samoa');
INSERT INTO _Customer VALUES('39','Elijah Harvey','0-028-406-2184','Mr. Elijah Harvey, Beaumont  6700, San Antonio - 1316, Haiti');
INSERT INTO _Customer VALUES('40','Liv Pond','8-358-754-7265','Miss Liv Pond, Beaumont  6418, Miami - 1606, Mauritania');
INSERT INTO _Customer VALUES('41','Sabina Roberts','2-481-454-6102','Ms. Sabina Roberts, Victorian  8988, Bakersfield - 7551, Morocco');
INSERT INTO _Customer VALUES('42','Phillip Evans','4-580-838-0257','Mr. Phillip Evans, Camdenhurst   9098, Milano - 8268, Tajikistan');
INSERT INTO _Customer VALUES('43','Roger Richards','7-252-123-1456','Mr. Roger Richards, Walnut 5493, Chicago - 5318, Somalia');
INSERT INTO _Customer VALUES('44','Joseph Malone','6-715-748-1831','Mr. Joseph Malone, Armory  3388, Tokyo - 7774, Ecuador');
INSERT INTO _Customer VALUES('45','Anabelle Clarkson','8-371-528-0606','Miss Anabelle Clarkson, Marischal  279, Bridgeport - 4543, Uganda');
INSERT INTO _Customer VALUES('46','Sylvia Lynn','5-233-111-3603','Ms. Sylvia Lynn, Bazely   890, San Francisco - 3782, Taiwan');
INSERT INTO _Customer VALUES('47','Carl Tate','5-612-772-7340','Mr. Carl Tate, Cable    1774, El Paso - 6846, Lithuania');
INSERT INTO _Customer VALUES('48','Eileen Whatson','3-320-576-8347','Miss Eileen Whatson, Earl Rise 227, San Antonio - 3532, Cuba');
INSERT INTO _Customer VALUES('49','Wade Strong','3-281-383-1558','Mr. Wade Strong, Queen 5566, Jacksonville - 6855, Costa Rica');
INSERT INTO _Customer VALUES('50','Percy Gordon','2-611-145-8114','Mr. Percy Gordon, Rail 5801, Fremont - 3003, San Marino');
INSERT INTO _Customer VALUES('51','Johnathan Bolton','8-775-230-5227','Mr. Johnathan Bolton, Beechen  1621, Oakland - 1586, Japan');
INSERT INTO _Customer VALUES('52','Domenic Clifton','8-122-552-7243','Mr. Domenic Clifton, Jackson 3312, Lakewood - 2415, Azerbaijan');
INSERT INTO _Customer VALUES('53','Maggie Thomson','1-227-623-8640','Miss Maggie Thomson, Andsell    9688, Denver - 3003, Belize');
INSERT INTO _Customer VALUES('54','Bart Grey','2-766-158-1183','Mr. Bart Grey, Rosewood 3220, Reno - 5585, Brunei');
INSERT INTO _Customer VALUES('55','Penny Giles','3-237-410-3503','Ms. Penny Giles, Becher  9814, Scottsdale - 1372, Ukraine');
INSERT INTO _Customer VALUES('56','Marvin Slater','1-034-755-3183','Mr. Marvin Slater, Cheltenham  8332, Houston - 3015, Portugal');
INSERT INTO _Customer VALUES('57','Marla Mills','6-506-173-4524','Ms. Marla Mills, Calverley  1896, Moreno Valley - 2706, Cabo Verde');
INSERT INTO _Customer VALUES('58','Ryan Scott','2-353-262-4646','Mr. Ryan Scott, Bigland  7837, Detroit - 3464, Nauru');
INSERT INTO _Customer VALUES('59','Elly Varley','0-227-653-4218','Miss Elly Varley, Boadicea   5763, Indianapolis - 0636, Kenya');
INSERT INTO _Customer VALUES('60','Wendy Hancock','7-486-135-7436','Mrs. Wendy Hancock, Sheffield 681, Honolulu - 5738, Eritrea');
INSERT INTO _Customer VALUES('61','Piper Mackenzie','3-705-633-8705','Mrs. Piper Mackenzie, Durnford  7459, Amarillo - 1052, Russia');
INSERT INTO _Customer VALUES('62','Johnathan Adams','2-077-846-4184','Mr. Johnathan Adams, Chantry   1067, Moreno Valley - 7413, United Arab Emirates');
INSERT INTO _Customer VALUES('63','Michael Bayliss','4-782-870-4567','Mr. Michael Bayliss, Cobden  9316, Omaha - 3404, Haiti');
INSERT INTO _Customer VALUES('64','Isabella Lowe','0-027-728-7362','Ms. Isabella Lowe, Chambers  256, Albuquerque - 7504, Indonesia');
INSERT INTO _Customer VALUES('65','Bart Attwood','1-886-770-0255','Mr. Bart Attwood, Hamilton  5910, Milwaukee - 2158, Vanuatu');
INSERT INTO _Customer VALUES('66','Mara Irving','5-322-837-8206','Ms. Mara Irving, Cliff  9472, Tulsa - 1035, Vietnam');
INSERT INTO _Customer VALUES('67','Denny Smith','0-257-338-5172','Mr. Denny Smith, Coleman  5475, San Diego - 0636, United Kingdom');
INSERT INTO _Customer VALUES('68','Russel Ranks','0-254-714-2811','Mr. Russel Ranks, Lake 3614, Madison - 4533, South Africa');
INSERT INTO _Customer VALUES('69','Ilona Uttridge','1-542-758-0257','Mrs. Ilona Uttridge, Clifton  7564, El Paso - 0354, Yemen');
INSERT INTO _Customer VALUES('70','Cherish Willson','5-628-083-7846','Mrs. Cherish Willson, Gathorne   4180, El Paso - 5681, Kiribati');
INSERT INTO _Customer VALUES('71','Maddison Needham','8-662-888-2403','Miss Maddison Needham, Abbots   5460, Sacramento - 8186, Paraguay');
INSERT INTO _Customer VALUES('72','Noah Middleton','8-540-738-2447','Mr. Noah Middleton, Westbourne 3904, Scottsdale - 3801, Cabo Verde');
INSERT INTO _Customer VALUES('73','Gemma Oswald','3-100-080-1783','Miss Gemma Oswald, Tilson  4442, Huntsville - 0746, Grenada');
INSERT INTO _Customer VALUES('74','Mason Rainford','4-454-777-6830','Mr. Mason Rainford, Queen 7557, San Jose - 8232, Denmark');
INSERT INTO _Customer VALUES('75','Shelby Sylvester','8-888-255-6168','Mrs. Shelby Sylvester, Lexington 4496, Springfield - 2382, Spain');
INSERT INTO _Customer VALUES('76','Maribel Pope','0-345-430-6667','Miss Maribel Pope, Blomfield  7826, Lakewood - 5026, Qatar');
INSERT INTO _Customer VALUES('77','Carter Mason','7-471-881-2326','Mr. Carter Mason, Caldwell   8095, Milwaukee - 1200, San Marino');
INSERT INTO _Customer VALUES('78','Julius Stone','7-443-114-5711','Mr. Julius Stone, Sherlock   5762, Memphis - 1653, New Zealand');
INSERT INTO _Customer VALUES('79','Kirsten Harper','2-601-473-6216','Ms. Kirsten Harper, Belfort  4802, Worcester - 0075, Austria');
INSERT INTO _Customer VALUES('80','Chad Jennson','8-508-353-2385','Mr. Chad Jennson, Cobden  743, Lincoln - 0633, Estonia');
INSERT INTO _Customer VALUES('81','Nathan Cameron','5-515-256-8875','Mr. Nathan Cameron, Castile  4200, Venice - 0088, Jamaica');
INSERT INTO _Customer VALUES('82','Matt Skinner','8-806-843-5740','Mr. Matt Skinner, Babmaes    2323, Bakersfield - 0668, Portugal');
INSERT INTO _Customer VALUES('83','Aurelia Callan','4-672-384-0453','Ms. Aurelia Callan, Under  2914, San Antonio - 7451, Ghana');
INSERT INTO _Customer VALUES('84','Aiden Exton','5-787-250-2870','Mr. Aiden Exton, Cavaye  826, Boston - 0534, Turkey');
INSERT INTO _Customer VALUES('85','Bethany Hardwick','4-777-411-2206','Ms. Bethany Hardwick, Angela   4851, Denver - 1332, Dominican Republic');
INSERT INTO _Customer VALUES('86','Chloe Forester','6-624-531-8067','Mrs. Chloe Forester, King 3685, Colorado Springs - 5164, Portugal');
INSERT INTO _Customer VALUES('87','Nina Uddin','6-441-005-3670','Ms. Nina Uddin, St. Jamess  2323, Saint Paul - 5810, Dominica');
INSERT INTO _Customer VALUES('88','Esmeralda Gates','1-757-067-8237','Mrs. Esmeralda Gates, Chatsworth  436, Tallahassee - 0732, Saudi Arabia');
INSERT INTO _Customer VALUES('89','Greta Watson','5-251-543-6404','Mrs. Greta Watson, Burton  4085, Salem - 5688, Brazil');
INSERT INTO _Customer VALUES('90','Ciara Clifton','5-551-210-5415','Miss Ciara Clifton, Lonsdale  4260, Scottsdale - 2475, Romania');
INSERT INTO _Customer VALUES('91','Joy Shields','0-557-516-1335','Ms. Joy Shields, Carlton  9432, San Francisco - 1434, Cuba');
INSERT INTO _Customer VALUES('92','Martin Drew','6-116-482-0207','Mr. Martin Drew, Wager   6108, Indianapolis - 4360, Congo');
INSERT INTO _Customer VALUES('93','Helen Gibson','8-205-077-4432','Miss Helen Gibson, Carlton  4740, Murfreesboro - 1212, United Kingdom');
INSERT INTO _Customer VALUES('94','Fred Wigley','7-508-121-3667','Mr. Fred Wigley, Anns  3809, Memphis - 1135, Jamaica');
INSERT INTO _Customer VALUES('95','Vanessa Barclay','7-075-612-5328','Ms. Vanessa Barclay, Antrobus   9488, Norfolk - 6130, Spain');
INSERT INTO _Customer VALUES('96','Mike Jenkin','1-708-173-3058','Mr. Mike Jenkin, Blandford  2739, Reno - 3131, Armenia');
INSERT INTO _Customer VALUES('97','Domenic Furnell','1-216-372-6406','Mr. Domenic Furnell, Hampden  7452, Salem - 1607, Lithuania');
INSERT INTO _Customer VALUES('98','Hank Rixon','0-440-700-3465','Mr. Hank Rixon, Erindale 339, Kansas City - 8468, Slovenia');
INSERT INTO _Customer VALUES('99','Camden Lloyd','8-582-328-3585','Ms. Camden Lloyd, Hamilton  9104, San Antonio - 4635, Andorra');
INSERT INTO _Customer VALUES('100','Barney Simpson','5-040-315-6488','Mr. Barney Simpson, Fairfield  8351, Jacksonville - 6042, El Salvador');

/* Suppliers */
INSERT INTO Suppliers VALUES('1','Benjamin Martin','1','1-027-556-2142');
INSERT INTO Suppliers VALUES('2','Jules Adams','2','7-847-082-8543');
INSERT INTO Suppliers VALUES('3','Leah Willis','3','0-300-313-5331');
INSERT INTO Suppliers VALUES('4','Logan Speed','4','1-775-105-4855');
INSERT INTO Suppliers VALUES('5','Daniel Clarke','5','3-731-462-6423');
INSERT INTO Suppliers VALUES('6','Ema Johnson','6','4-050-366-7672');
INSERT INTO Suppliers VALUES('7','Chelsea Payne','7','4-335-211-5004');
INSERT INTO Suppliers VALUES('8','Johnny Robinson','8','3-425-230-7852');
INSERT INTO Suppliers VALUES('9','Christy Butler','9','1-573-262-0862');
INSERT INTO Suppliers VALUES('10','Liv Emmett','10','0-544-324-1457');
INSERT INTO Suppliers VALUES('11','Russel James','11','3-620-463-3115');
INSERT INTO Suppliers VALUES('12','Margot Bolton','12','5-424-307-3177');
INSERT INTO Suppliers VALUES('13','Gil Mcgee','13','0-251-266-1311');
INSERT INTO Suppliers VALUES('14','Amelia Edley','14','4-377-114-8326');
INSERT INTO Suppliers VALUES('15','Morgan Willis','15','5-422-532-8432');
INSERT INTO Suppliers VALUES('16','Martin Dillon','16','1-030-518-7000');
INSERT INTO Suppliers VALUES('17','Chad Drummond','17','7-248-865-8886');
INSERT INTO Suppliers VALUES('18','Denny Norburn','18','7-447-407-2867');
INSERT INTO Suppliers VALUES('19','Ember Warden','19','4-216-810-1734');
INSERT INTO Suppliers VALUES('20','Hayden Pitt','20','1-424-738-4423');
INSERT INTO Suppliers VALUES('21','Sasha Varley','21','3-712-574-6600');
INSERT INTO Suppliers VALUES('22','Chris Bristow','22','5-025-151-4327');
INSERT INTO Suppliers VALUES('23','Beatrice Uddin','23','6-835-847-0222');
INSERT INTO Suppliers VALUES('24','Mya Overson','24','6-235-828-3871');
INSERT INTO Suppliers VALUES('25','Nick Dallas','25','3-730-058-7632');
INSERT INTO Suppliers VALUES('26','Vicky Payne','26','7-021-866-1715');
INSERT INTO Suppliers VALUES('27','Ramon Redfern','27','8-442-876-3728');
INSERT INTO Suppliers VALUES('28','Chad Miller','28','5-838-335-8486');
INSERT INTO Suppliers VALUES('29','Hank Ainsworth','29','8-135-567-1880');
INSERT INTO Suppliers VALUES('30','Alexander Zaoui','30','1-026-275-8760');
INSERT INTO Suppliers VALUES('31','Julian Howard','31','0-552-633-5725');
INSERT INTO Suppliers VALUES('32','Henry Hobbs','32','0-373-516-3584');
INSERT INTO Suppliers VALUES('33','Danny Murray','33','3-550-880-3373');
INSERT INTO Suppliers VALUES('34','William Simpson','34','2-814-618-4858');
INSERT INTO Suppliers VALUES('35','Elijah Lane','35','8-562-632-1657');
INSERT INTO Suppliers VALUES('36','Melody Wellington','36','8-001-011-6786');
INSERT INTO Suppliers VALUES('37','Carl Addis','37','6-803-634-6006');
INSERT INTO Suppliers VALUES('38','Mackenzie Lewis','38','2-564-624-7564');
INSERT INTO Suppliers VALUES('39','Caleb Everett','39','7-751-233-6444');
INSERT INTO Suppliers VALUES('40','Macy Nayler','40','8-843-803-1217');
INSERT INTO Suppliers VALUES('41','Nathan Faulkner','41','3-376-728-2453');
INSERT INTO Suppliers VALUES('42','Adelaide Myatt','42','1-207-028-5200');
INSERT INTO Suppliers VALUES('43','Holly James','43','4-333-042-1560');
INSERT INTO Suppliers VALUES('44','Dani Adler','44','3-701-360-0107');
INSERT INTO Suppliers VALUES('45','Tom Selby','45','0-663-326-1286');
INSERT INTO Suppliers VALUES('46','Joyce Benson','46','5-261-821-3071');
INSERT INTO Suppliers VALUES('47','Jacqueline Donnelly','47','2-258-550-7064');
INSERT INTO Suppliers VALUES('48','Mabel Bolton','48','5-031-403-7251');
INSERT INTO Suppliers VALUES('49','Kassandra Griffiths','49','6-722-727-8375');
INSERT INTO Suppliers VALUES('50','Tom Kennedy','50','1-858-386-8485');
INSERT INTO Suppliers VALUES('51','Marvin Wilton','51','8-868-031-1321');
INSERT INTO Suppliers VALUES('52','Havana Sherwood','52','6-456-155-3022');
INSERT INTO Suppliers VALUES('53','Michaela Savage','53','3-252-048-3166');
INSERT INTO Suppliers VALUES('54','Rose Collins','54','4-366-401-8382');
INSERT INTO Suppliers VALUES('55','Madison Atkinson','55','8-353-427-0574');
INSERT INTO Suppliers VALUES('56','Kurt Janes','56','2-705-057-6451');
INSERT INTO Suppliers VALUES('57','Esmeralda Wilton','57','8-685-624-7028');
INSERT INTO Suppliers VALUES('58','Leah Brown','58','6-714-276-4764');
INSERT INTO Suppliers VALUES('59','Liam Butler','59','7-026-541-7881');
INSERT INTO Suppliers VALUES('60','Hayden Ogilvy','60','6-756-438-6354');
INSERT INTO Suppliers VALUES('61','Olivia Patel','61','7-205-328-0825');
INSERT INTO Suppliers VALUES('62','Mara Radcliffe','62','8-126-816-0075');
INSERT INTO Suppliers VALUES('63','Camden Bryson','63','5-617-658-5851');
INSERT INTO Suppliers VALUES('64','Caleb Stewart','64','7-307-016-2277');
INSERT INTO Suppliers VALUES('65','Enoch Ingram','65','1-107-074-2078');
INSERT INTO Suppliers VALUES('66','Liam Hope','66','2-653-601-5664');
INSERT INTO Suppliers VALUES('67','Christine Judd','67','3-382-713-6424');
INSERT INTO Suppliers VALUES('68','Maxwell Kelly','68','3-273-230-4147');
INSERT INTO Suppliers VALUES('69','Ilona Robinson','69','4-230-317-5767');
INSERT INTO Suppliers VALUES('70','Leslie Edwards','70','2-388-742-4817');
INSERT INTO Suppliers VALUES('71','Tara Brock','71','1-331-472-1832');
INSERT INTO Suppliers VALUES('72','Rocco Kennedy','72','3-154-441-7578');
INSERT INTO Suppliers VALUES('73','Jaylene Clark','73','3-114-674-3361');
INSERT INTO Suppliers VALUES('74','Jocelyn Ross','74','3-456-640-7523');
INSERT INTO Suppliers VALUES('75','Joseph Russel','75','7-413-426-6173');
INSERT INTO Suppliers VALUES('76','Joyce Bishop','76','6-824-203-0213');
INSERT INTO Suppliers VALUES('77','Hannah James','77','5-808-015-7474');
INSERT INTO Suppliers VALUES('78','Nathan Benfield','78','2-636-110-6874');
INSERT INTO Suppliers VALUES('79','Bethany Casey','79','2-006-310-2738');
INSERT INTO Suppliers VALUES('80','Domenic Wilson','80','3-403-666-4755');
INSERT INTO Suppliers VALUES('81','Naomi Kelly','81','8-133-165-4664');
INSERT INTO Suppliers VALUES('82','Phillip Upton','82','8-870-602-3710');
INSERT INTO Suppliers VALUES('83','Bart Stone','83','2-305-412-5048');
INSERT INTO Suppliers VALUES('84','Summer Tait','84','7-273-064-7650');
INSERT INTO Suppliers VALUES('85','Owen Ryan','85','3-238-672-2676');
INSERT INTO Suppliers VALUES('86','Fred Emmott','86','8-300-635-4251');
INSERT INTO Suppliers VALUES('87','Peyton Hobbs','87','5-350-462-7108');
INSERT INTO Suppliers VALUES('88','Mayleen Ebbs','88','5-064-027-3587');
INSERT INTO Suppliers VALUES('89','Marina Lane','89','8-773-575-2150');
INSERT INTO Suppliers VALUES('90','Kieth Carpenter','90','2-011-517-2752');
INSERT INTO Suppliers VALUES('91','Keira Parr','91','7-621-737-3148');
INSERT INTO Suppliers VALUES('92','Gladys Goodman','92','7-040-261-5656');
INSERT INTO Suppliers VALUES('93','Bart Ramsey','93','8-105-233-4370');
INSERT INTO Suppliers VALUES('94','Leroy Hilton','94','7-616-333-6126');
INSERT INTO Suppliers VALUES('95','Makenzie Watson','95','0-540-313-0336');
INSERT INTO Suppliers VALUES('96','Chuck Stewart','96','6-686-427-0383');
INSERT INTO Suppliers VALUES('97','Zara Cunningham','97','8-783-323-6281');
INSERT INTO Suppliers VALUES('98','Vera Upsdell','98','2-708-400-4203');
INSERT INTO Suppliers VALUES('99','Francesca Hastings','99','1-566-810-4420');
INSERT INTO Suppliers VALUES('100','Eduardo Brooks','100','3-843-706-5731');

/*Items*/
INSERT INTO Items VALUES('1','Snack foods',320.70,0,508,39.42,64.59,899.71);
INSERT INTO Items VALUES('2','Seafood',728.53,0,505,3.24,33.05,734.76);
INSERT INTO Items VALUES('3','Salmon',421.57,0,71,78.56,5.96,248.91);
INSERT INTO Items VALUES('4','Canned Goods',754.23,0,67,83.67,9.01,949.73);
INSERT INTO Items VALUES('5','Cheese',402.27,0,705,29.45,20.68,864.87);
INSERT INTO Items VALUES('6','Baby food',886.28,0,726,32.63,8.53,940.46);
INSERT INTO Items VALUES('7','Flour',727.77,0,892,96.41,66.96,721.81);
INSERT INTO Items VALUES('8','Candies',613.17,0,822,8.26,60.76,567.05);
INSERT INTO Items VALUES('9','Poultry',582.34,0,456,10.34,46.93,420.79);
INSERT INTO Items VALUES('10','Brown rice',782.54,0,387,40.49,79.01,906.15);
INSERT INTO Items VALUES('11','Pasta',180.66,0,215,50.54,82.93,183.90);
INSERT INTO Items VALUES('12','Hygiene products',595.19,0,556,50.31,32.49,796.39);
INSERT INTO Items VALUES('13','Nonalcoholic beverages',269.39,0,346,69.86,11.96,554.14);
INSERT INTO Items VALUES('14','Frozen foods',223.16,0,17,88.84,92.10,495.61);
INSERT INTO Items VALUES('15','Salmon',208.95,0,412,84.98,48.69,412.35);
INSERT INTO Items VALUES('16','Ground turkey',261.40,0,246,15.85,96.81,219.34);
INSERT INTO Items VALUES('17','Salmon',611.97,0,885,49.42,49.57,696.90);
INSERT INTO Items VALUES('18','Fish',821.18,0,63,28.01,13.48,867.73);
INSERT INTO Items VALUES('19','Diet foods',258.90,0,970,64.68,7.14,684.39);
INSERT INTO Items VALUES('20','Tea',773.34,0,600,96.49,7.20,838.66);
INSERT INTO Items VALUES('21','Medicines',947.58,0,226,9.56,95.68,741.48);
INSERT INTO Items VALUES('22','Candies',979.71,0,611,52.77,80.50,561.21);
INSERT INTO Items VALUES('23','Snack foods',718.41,0,748,68.05,64.41,672.89);
INSERT INTO Items VALUES('24','Ground turkey',192.95,0,105,41.59,51.18,8.65);
INSERT INTO Items VALUES('25','Diet foods',65.36,0,689,34.97,29.39,341.10);
INSERT INTO Items VALUES('26','Chicken',22.86,0,543,34.88,90.03,335.80);
INSERT INTO Items VALUES('27','Sweets',5.52,0,912,41.36,22.98,378.21);
INSERT INTO Items VALUES('28','Dry Goods',90.35,0,145,99.70,67.11,287.55);
INSERT INTO Items VALUES('29','Personal Care',339.93,0,649,87.24,63.28,974.31);
INSERT INTO Items VALUES('30','Sweets',245.35,0,732,43.55,93.16,356.72);
INSERT INTO Items VALUES('31','Paper Goods',740.77,0,218,19.88,19.36,224.52);
INSERT INTO Items VALUES('32','Dry Goods',126.18,0,70,76.49,98.35,96.23);
INSERT INTO Items VALUES('33','Ground turkey',266.10,0,62,26.26,12.17,124.19);
INSERT INTO Items VALUES('34','Detergents',694.19,0,539,65.04,75.08,616.09);
INSERT INTO Items VALUES('35','Fish',973.23,0,707,36.79,45.18,8.62);
INSERT INTO Items VALUES('36','Tomato sauce',769.50,0,246,13.62,93.24,51.39);
INSERT INTO Items VALUES('37','White rice',963.49,0,996,22.83,93.60,12.62);
INSERT INTO Items VALUES('38','Personal Care',958.13,0,159,55.90,33.72,942.18);
INSERT INTO Items VALUES('39','Dairy',283.42,0,529,40.91,13.15,378.04);
INSERT INTO Items VALUES('40','Nonalcoholic beverages',893.26,0,874,36.56,61.24,413.61);
INSERT INTO Items VALUES('41','Cheese',884.54,0,502,97.07,3.91,328.45);
INSERT INTO Items VALUES('42','Coffee',425.20,0,424,69.42,3.46,861.24);
INSERT INTO Items VALUES('43','Chicken',44.23,0,742,67.53,76.10,700.77);
INSERT INTO Items VALUES('44','Snack foods',488.54,0,646,90.93,6.11,473.71);
INSERT INTO Items VALUES('45','Sauces',998.84,0,464,94.87,19.21,949.75);
INSERT INTO Items VALUES('46','Alcoholic beverages',35.50,0,22,23.39,50.14,225.75);
INSERT INTO Items VALUES('47','Mustard',498.72,0,395,4.52,10.40,748.77);
INSERT INTO Items VALUES('48','Poultry',579.24,0,529,21.58,90.91,492.82);
INSERT INTO Items VALUES('49','Baby food',932.50,0,997,88.69,67.61,337.48);
INSERT INTO Items VALUES('50','Candies',876.34,0,593,54.82,67.10,551.00);
INSERT INTO Items VALUES('51','Bottled waters',893.92,0,381,70.17,92.23,316.26);
INSERT INTO Items VALUES('52','Personal hygiene',320.78,0,867,5.64,41.72,144.43);
INSERT INTO Items VALUES('53','Paper Goods',864.36,0,32,62.03,8.23,389.27);
INSERT INTO Items VALUES('54','Baby food',144.61,0,584,49.99,50.68,104.17);
INSERT INTO Items VALUES('55','Sauces',577.02,0,225,68.77,3.69,830.86);
INSERT INTO Items VALUES('56','Pasta',236.06,0,81,67.55,89.15,82.87);
INSERT INTO Items VALUES('57','Cereals',143.64,0,259,46.14,42.22,463.33);
INSERT INTO Items VALUES('58','Pet foods',408.78,0,318,39.35,31.20,699.44);
INSERT INTO Items VALUES('59','Fish',784.37,0,529,41.32,95.79,955.09);
INSERT INTO Items VALUES('60','Bakery products',549.88,0,467,42.30,89.26,613.39);
INSERT INTO Items VALUES('61','Cereals',745.65,0,801,35.16,54.83,882.17);
INSERT INTO Items VALUES('62','Bakery products',824.86,0,708,93.72,10.26,676.37);
INSERT INTO Items VALUES('63','Tomato sauce',821.23,0,245,92.93,2.30,435.83);
INSERT INTO Items VALUES('64','Snack foods',752.63,0,257,61.96,79.24,128.20);
INSERT INTO Items VALUES('65','Dishware',962.05,0,84,71.36,17.15,349.72);
INSERT INTO Items VALUES('66','Decorations',342.83,0,400,10.23,61.81,581.74);
INSERT INTO Items VALUES('67','Baby-care',899.10,0,806,68.10,14.47,432.24);
INSERT INTO Items VALUES('68','Olive oil',405.27,0,26,84.21,65.13,280.48);
INSERT INTO Items VALUES('69','Olive oil',90.29,0,218,21.85,56.63,319.62);
INSERT INTO Items VALUES('70','Housewares',205.15,0,331,90.68,7.01,881.29);
INSERT INTO Items VALUES('71','Dishware',143.42,0,52,8.38,40.15,456.46);
INSERT INTO Items VALUES('72','Dry Goods',693.01,0,731,46.89,29.90,803.92);
INSERT INTO Items VALUES('73','Hygiene products',724.07,0,912,51.30,97.05,272.60);
INSERT INTO Items VALUES('74','Nonalcoholic beverages',672.14,0,450,16.77,18.22,170.17);
INSERT INTO Items VALUES('75','Toys',925.46,0,865,17.22,18.72,983.48);
INSERT INTO Items VALUES('76','Cosmetics',567.70,0,859,16.87,10.17,402.18);
INSERT INTO Items VALUES('77','Housewares',773.34,0,79,1.73,51.71,580.76);
INSERT INTO Items VALUES('78','Tomato sauce',499.14,0,811,64.13,75.87,556.61);
INSERT INTO Items VALUES('79','Salmon',179.58,0,748,30.61,31.12,998.77);
INSERT INTO Items VALUES('80','Grooming products',244.69,0,542,9.21,45.20,272.90);
INSERT INTO Items VALUES('81','Condiments',158.20,0,128,35.22,97.41,531.63);
INSERT INTO Items VALUES('82','Medicines',338.16,0,125,26.42,91.40,457.76);
INSERT INTO Items VALUES('83','Paper Goods',456.90,0,52,10.03,55.41,358.34);
INSERT INTO Items VALUES('84','Dairy',440.42,0,187,17.25,9.15,586.23);
INSERT INTO Items VALUES('85','Dishware',177.35,0,797,97.94,3.29,874.45);
INSERT INTO Items VALUES('86','Ground turkey',513.74,0,85,30.12,93.86,117.27);
INSERT INTO Items VALUES('87','Bread',805.72,0,371,7.25,66.31,306.17);
INSERT INTO Items VALUES('88','Tomato sauce',41.72,0,457,30.06,61.38,73.47);
INSERT INTO Items VALUES('89','White rice',459.91,0,524,9.94,97.21,728.12);
INSERT INTO Items VALUES('90','Poultry',452.54,0,472,59.87,78.62,568.14);
INSERT INTO Items VALUES('91','Cheese',104.70,0,392,84.81,87.25,738.20);
INSERT INTO Items VALUES('92','Meat',720.26,0,361,55.16,72.34,95.44);
INSERT INTO Items VALUES('93','Personal hygiene',894.27,0,585,83.46,74.59,451.90);
INSERT INTO Items VALUES('94','Vegetables',649.80,0,580,69.10,15.33,480.38);
INSERT INTO Items VALUES('95','Vegetables',195.82,0,53,23.32,63.90,232.05);
INSERT INTO Items VALUES('96','Pasta',811.81,0,245,26.98,41.50,150.75);
INSERT INTO Items VALUES('97','Brown rice',775.62,0,54,97.46,62.18,761.96);
INSERT INTO Items VALUES('98','Nonalcoholic beverages',946.07,0,978,78.23,42.95,550.67);
INSERT INTO Items VALUES('99','Coffee',281.99,0,906,45.84,18.92,975.23);
INSERT INTO Items VALUES('100','Olive oil',837.05,0,437,18.35,17.28,55.29);


/*Cart*/
INSERT INTO Cart VALUES('1',11,1,203.42);
INSERT INTO Cart VALUES('2',87,7,167.78);
INSERT INTO Cart VALUES('3',70,7,881.90);
INSERT INTO Cart VALUES('4',9,7,175.05);
INSERT INTO Cart VALUES('5',3,1,579.06);
INSERT INTO Cart VALUES('6',86,9,727.66);
INSERT INTO Cart VALUES('7',86,7,969.60);
INSERT INTO Cart VALUES('8',32,4,43.93);
INSERT INTO Cart VALUES('9',7,3,416.14);
INSERT INTO Cart VALUES('10',60,3,959.49);
INSERT INTO Cart VALUES('11',78,4,176.97);
INSERT INTO Cart VALUES('12',2,9,542.49);
INSERT INTO Cart VALUES('13',13,1,146.33);
INSERT INTO Cart VALUES('14',20,5,397.20);
INSERT INTO Cart VALUES('15',30,5,559.11);
INSERT INTO Cart VALUES('16',76,6,465.32);
INSERT INTO Cart VALUES('17',72,9,829.77);
INSERT INTO Cart VALUES('18',29,1,462.72);
INSERT INTO Cart VALUES('19',5,1,292.49);
INSERT INTO Cart VALUES('20',73,7,650.90);
INSERT INTO Cart VALUES('21',23,5,473.28);
INSERT INTO Cart VALUES('22',24,7,730.62);
INSERT INTO Cart VALUES('23',92,2,846.06);
INSERT INTO Cart VALUES('24',74,8,728.22);
INSERT INTO Cart VALUES('25',91,8,253.06);
INSERT INTO Cart VALUES('26',15,7,208.11);
INSERT INTO Cart VALUES('27',58,4,288.12);
INSERT INTO Cart VALUES('28',16,9,470.54);
INSERT INTO Cart VALUES('12',10,9,542.49);
INSERT INTO Cart VALUES('29',88,6,884.29);
INSERT INTO Cart VALUES('30',10,2,91.02);
INSERT INTO Cart VALUES('31',23,2,850.08);
INSERT INTO Cart VALUES('32',18,4,976.20);
INSERT INTO Cart VALUES('33',36,1,579.89);
INSERT INTO Cart VALUES('34',51,6,759.46);
INSERT INTO Cart VALUES('35',28,4,698.83);
INSERT INTO Cart VALUES('36',42,6,468.02);
INSERT INTO Cart VALUES('37',74,3,185.09);
INSERT INTO Cart VALUES('38',96,4,131.74);
INSERT INTO Cart VALUES('39',76,3,840.94);
INSERT INTO Cart VALUES('40',91,2,928.19);
INSERT INTO Cart VALUES('41',44,1,763.09);
INSERT INTO Cart VALUES('42',33,6,39.30);
INSERT INTO Cart VALUES('43',90,4,13.73);
INSERT INTO Cart VALUES('44',48,3,599.62);
INSERT INTO Cart VALUES('45',74,8,340.88);
INSERT INTO Cart VALUES('46',22,8,243.92);
INSERT INTO Cart VALUES('47',94,8,137.28);
INSERT INTO Cart VALUES('48',74,8,553.16);
INSERT INTO Cart VALUES('49',43,5,393.34);
INSERT INTO Cart VALUES('50',85,4,701.17);
INSERT INTO Cart VALUES('51',28,8,197.55);
INSERT INTO Cart VALUES('52',44,4,258.51);
INSERT INTO Cart VALUES('53',63,3,205.09);
INSERT INTO Cart VALUES('54',79,1,975.55);
INSERT INTO Cart VALUES('55',84,8,154.49);
INSERT INTO Cart VALUES('56',45,7,563.08);
INSERT INTO Cart VALUES('57',87,8,306.98);
INSERT INTO Cart VALUES('58',87,3,768.37);
INSERT INTO Cart VALUES('59',13,2,605.34);
INSERT INTO Cart VALUES('60',70,7,485.55);
INSERT INTO Cart VALUES('61',59,6,653.52);
INSERT INTO Cart VALUES('62',62,5,376.38);
INSERT INTO Cart VALUES('63',53,8,501.00);
INSERT INTO Cart VALUES('64',23,2,727.53);
INSERT INTO Cart VALUES('65',32,1,677.59);
INSERT INTO Cart VALUES('66',10,3,640.38);
INSERT INTO Cart VALUES('67',46,8,964.63);
INSERT INTO Cart VALUES('68',45,6,854.15);
INSERT INTO Cart VALUES('69',37,6,898.82);
INSERT INTO Cart VALUES('70',10,1,466.41);
INSERT INTO Cart VALUES('71',47,9,456.03);
INSERT INTO Cart VALUES('72',75,7,154.91);
INSERT INTO Cart VALUES('73',44,1,38.59);
INSERT INTO Cart VALUES('74',2,8,468.32);
INSERT INTO Cart VALUES('75',98,3,73.79);
INSERT INTO Cart VALUES('76',49,7,929.90);
INSERT INTO Cart VALUES('77',98,4,644.63);
INSERT INTO Cart VALUES('78',32,9,435.28);
INSERT INTO Cart VALUES('79',65,3,128.17);
INSERT INTO Cart VALUES('80',82,6,625.70);
INSERT INTO Cart VALUES('81',68,1,194.38);
INSERT INTO Cart VALUES('82',60,3,148.48);
INSERT INTO Cart VALUES('83',13,6,837.83);
INSERT INTO Cart VALUES('84',97,7,918.73);
INSERT INTO Cart VALUES('85',98,5,59.42);
INSERT INTO Cart VALUES('86',12,5,603.54);
INSERT INTO Cart VALUES('87',64,7,944.75);
INSERT INTO Cart VALUES('88',77,3,504.38);
INSERT INTO Cart VALUES('89',65,4,119.44);
INSERT INTO Cart VALUES('90',56,5,301.72);
INSERT INTO Cart VALUES('91',21,2,509.74);
INSERT INTO Cart VALUES('92',7,6,311.98);
INSERT INTO Cart VALUES('93',35,4,191.26);
INSERT INTO Cart VALUES('94',55,2,579.17);
INSERT INTO Cart VALUES('95',45,6,734.85);
INSERT INTO Cart VALUES('96',32,4,711.84);
INSERT INTO Cart VALUES('97',8,5,186.60);
INSERT INTO Cart VALUES('98',56,5,178.44);
INSERT INTO Cart VALUES('99',26,3,220.96);
INSERT INTO Cart VALUES('100',1,8,474.04);
INSERT INTO Cart VALUES('20',1,8,474.04);
INSERT INTO Cart VALUES('20',56,5,178.44);

/*Employee */
INSERT INTO Employee VALUES('635-62-7404','Chuck Andrews','5030-12-01 04:11:40','Steward',72031,'York Tunnel, 9719');
INSERT INTO Employee VALUES('467-71-2858','Ramon Reyes','1902-03-05 17:58:40','Designer',58403,'Carnegie   Grove, 2414');
INSERT INTO Employee VALUES('424-20-6313','Diane Bolton','3507-06-26 11:07:40','Bookkeeper',87046,'Coal Wharf  Hill, 4722');
INSERT INTO Employee VALUES('586-23-1081','Lara Ingram','7306-04-09 09:03:24','Front Desk Coordinator',62902,'Ernest  Way, 6275');
INSERT INTO Employee VALUES('435-72-7836','Chad Radcliffe','7691-10-22 13:51:19','Treasurer',95275,'Clere  Avenue, 3357');
INSERT INTO Employee VALUES('114-50-0232','Rosalie Jobson','8447-09-01 22:05:32','Steward',52610,'Eliabeth  Boulevard, 139');
INSERT INTO Employee VALUES('488-87-1055','Jamie Duvall','2918-12-13 04:18:15','Business Broker',29743,'Dunstable   Walk, 7261');
INSERT INTO Employee VALUES('337-85-6664','Isabel Watson','3219-07-02 17:44:13','Webmaster',69277,'Bales  Lane, 1802');
INSERT INTO Employee VALUES('548-47-7282','Kieth Malone','2877-04-25 12:03:31','Dentist',13333,'Westcott  Grove, 3142');
INSERT INTO Employee VALUES('107-83-5055','Carter Umney','5460-05-09 02:46:50','CNC Operator',43433,'Angrave    Drive, 4907');
INSERT INTO Employee VALUES('146-01-6635','Bart John','8660-03-20 00:27:30','Project Manager',62468,'Chapel  Street, 2472');
INSERT INTO Employee VALUES('605-63-2605','Makena Murphy','8233-12-04 02:55:34','Web Developer',94214,'Capeners  Crossroad, 3454');
INSERT INTO Employee VALUES('873-60-2387','Havana Osman','2437-01-14 08:31:22','Pharmacist',36329,'West Grove, 102');
INSERT INTO Employee VALUES('850-08-4875','Britney Jarvis','9017-04-24 04:44:10','Web Developer',15551,'Cato   Drive, 3391');
INSERT INTO Employee VALUES('786-56-3115','Allison Todd','3353-07-23 19:58:14','Ambulatory Nurse',67361,'Hamilton  Walk, 4255');
INSERT INTO Employee VALUES('123-31-6172','Chad Reading','6710-09-03 03:04:37','Design Engineer',51659,'St. Jamess  Alley, 7127');
INSERT INTO Employee VALUES('058-53-6873','Carl Tailor','9136-01-12 01:43:40','Cash Manager',31405,'Clere  Rue, 10');
INSERT INTO Employee VALUES('308-56-8501','Miley Vernon','7127-07-20 08:08:38','Physician',79792,'Bicknell  Road, 2672');
INSERT INTO Employee VALUES('723-60-3802','Michelle Brown','7118-05-05 10:34:37','Banker',91195,'Sundown Crossroad, 3288');
INSERT INTO Employee VALUES('203-16-5074','Alexander Stanley','7337-11-23 04:35:41','Call Center Representative',91613,'Charterhouse  Hill, 6569');
INSERT INTO Employee VALUES('852-08-4047','Maddison Allen','9384-01-19 07:32:16','Auditor',60091,'Western   Pass, 9091');
INSERT INTO Employee VALUES('657-82-8828','Carl Mills','6719-01-28 17:17:27','Restaurant Manager',27995,'Bempton   Road, 272');
INSERT INTO Employee VALUES('564-77-0363','Javier Tindall','7476-12-24 17:11:53','IT Support Staff',12059,'Dunton  Hill, 765');
INSERT INTO Employee VALUES('787-25-2763','Logan Walter','8821-06-14 21:10:54','Cash Manager',26441,'Thorndike   Lane, 5259');
INSERT INTO Employee VALUES('584-88-1461','Barry Palmer','9506-12-17 01:41:45','Executive Director',57595,'Burton  Walk, 5905');
INSERT INTO Employee VALUES('851-77-0817','Marilyn Scott','5505-11-23 14:13:00','Design Engineer',40809,'Ampton  Vale, 2714');
INSERT INTO Employee VALUES('131-87-4155','Javier Rainford','9353-02-25 14:38:21','Front Desk Coordinator',15279,'Camley   Alley, 5622');
INSERT INTO Employee VALUES('307-33-4631','Julius Edley','3192-03-21 21:48:12','Loan Officer',94068,'Boleyn  Hill, 8369');
INSERT INTO Employee VALUES('184-50-5582','Chad Farmer','7092-07-13 11:49:18','Accountant',57816,'Thorndike   Drive, 3845');
INSERT INTO Employee VALUES('444-56-7131','Hank Pearce','7252-04-27 22:08:03','Ambulatory Nurse',80642,'Jackson Lane, 1293');
INSERT INTO Employee VALUES('825-53-8853','Marjorie Fox','4525-06-14 06:42:30','Food Technologist',99917,'King Edward  Pass, 4840');
INSERT INTO Employee VALUES('124-85-6286','oe Glynn','2553-03-07 20:33:13','HR Coordinator',10560,'Babmaes    Crossroad, 2469');
INSERT INTO Employee VALUES('668-25-3437','Rhea Hepburn','6452-05-17 19:43:58','Laboratory Technician',66331,'Aspen Tunnel, 6492');
INSERT INTO Employee VALUES('544-13-1208','Regina Faulkner','2372-07-07 16:25:34','Webmaster',74017,'Gathorne   Tunnel, 7229');
INSERT INTO Employee VALUES('888-50-7263','Jack Rogers','5976-07-08 03:03:10','Webmaster',16792,'Thomas More   Tunnel, 2412');
INSERT INTO Employee VALUES('702-31-2358','Anthony Taylor','9263-03-07 03:41:31','Mobile Developer',62848,'Belgrave  Boulevard, 518');
INSERT INTO Employee VALUES('552-54-3305','Catherine Willis','4818-10-20 04:09:54','Software Engineer',28181,'Cingworth  Avenue, 8373');
INSERT INTO Employee VALUES('445-60-3584','Vicky Widdows','1894-07-17 22:10:24','Food Technologist',79161,'Carlton  Lane, 9904');
INSERT INTO Employee VALUES('220-48-4573','Tyson Mitchell','2144-07-07 03:08:07','Machine Operator',97143,'Bayberry Road, 7792');
INSERT INTO Employee VALUES('160-22-8463','Nate Bailey','8469-04-16 12:11:10','Mobile Developer',30413,'Cavaye  Crossroad, 138');
INSERT INTO Employee VALUES('041-87-0227','Moira Morris','2113-01-04 12:07:32','Food Technologist',23682,'Castlereagh   Hill, 1161');
INSERT INTO Employee VALUES('802-35-8816','Marissa Morris','7655-08-11 22:02:16','Loan Officer',38570,'Thorndike   Drive, 2170');
INSERT INTO Employee VALUES('525-58-0540','Lorraine Rothwell','8977-02-25 19:08:22','HR Coordinator',64678,'Westbourne Alley, 3271');
INSERT INTO Employee VALUES('056-45-0207','Elisabeth Roman','8990-07-02 18:18:47','Lecturer',75859,'Carolina  Lane, 3445');
INSERT INTO Employee VALUES('507-71-8806','Leroy Lane','8899-05-11 07:33:39','Paramedic',27100,'Rivervalley Drive, 3443');
INSERT INTO Employee VALUES('216-80-7527','Benny Varndell','9825-11-07 09:23:34','Auditor',62006,'St. Pauls  Street, 3699');
INSERT INTO Employee VALUES('186-04-6164','Barry Walker','0002-12-01 04:25:51','Fabricator',88225,'Catherine  Alley, 3130');
INSERT INTO Employee VALUES('766-88-1085','Eduardo Gonales','9743-12-17 09:06:09','HR Specialist',99059,'Victorian  Alley, 4525');
INSERT INTO Employee VALUES('332-82-8666','Havana Owens','0570-01-18 06:17:17','Food Technologist',19159,'Magnolia Hill, 618');
INSERT INTO Employee VALUES('821-06-2617','Chad Cobb','8605-01-20 03:29:20','Physician',93245,'Belfort  Street, 3640');
INSERT INTO Employee VALUES('507-71-8804','Chad Cobb','8899-05-11 07:33:39','Paramedic',27100,'Rivervalley Drive, 3443');

/*Deliveries*/
INSERT INTO Deliveries VALUES('1','1','635-62-7404',24,'6442-07-20 01:12:42');
INSERT INTO Deliveries VALUES('2','2','635-62-7404',96,'8928-08-08 05:43:58');
INSERT INTO Deliveries VALUES('3','3','635-62-7404',62,'5737-02-17 21:29:39');
INSERT INTO Deliveries VALUES('4','4','635-62-7404',11,'7619-04-08 21:44:26');
INSERT INTO Deliveries VALUES('5','5','635-62-7404',29,'2344-10-03 17:16:39');
INSERT INTO Deliveries VALUES('6','6','635-62-7404',72,'9567-01-17 21:25:15');
INSERT INTO Deliveries VALUES('7','7','635-62-7404',33,'3188-09-10 01:06:18');
INSERT INTO Deliveries VALUES('8','8','635-62-7404',17,'8956-11-15 14:26:30');
INSERT INTO Deliveries VALUES('9','9','635-62-7404',30,'0399-01-08 06:20:37');
INSERT INTO Deliveries VALUES('10','10','635-62-7404',41,'3961-09-23 12:52:40');
INSERT INTO Deliveries VALUES('11','11','635-62-7404',62,'0772-10-12 18:43:28');
INSERT INTO Deliveries VALUES('12','12','467-71-2858',94,'6003-12-07 17:02:31');
INSERT INTO Deliveries VALUES('13','13','467-71-2858',96,'7390-11-16 12:38:25');
INSERT INTO Deliveries VALUES('14','14','467-71-2858',16,'0311-03-01 03:45:54');
INSERT INTO Deliveries VALUES('15','15','467-71-2858',65,'3662-11-12 19:51:06');
INSERT INTO Deliveries VALUES('16','16','467-71-2858',37,'8223-04-21 00:23:02');
INSERT INTO Deliveries VALUES('17','17','467-71-2858',95,'7646-08-01 04:40:33');
INSERT INTO Deliveries VALUES('18','18','467-71-2858',4,'0644-08-06 06:24:16');
INSERT INTO Deliveries VALUES('19','19','467-71-2858',9,'7246-04-01 04:21:12');
INSERT INTO Deliveries VALUES('20','20','467-71-2858',72,'8885-06-16 08:15:38');
INSERT INTO Deliveries VALUES('21','21','467-71-2858',3,'1664-06-15 22:24:07');
INSERT INTO Deliveries VALUES('22','22','114-50-0232',19,'4974-11-01 11:19:12');
INSERT INTO Deliveries VALUES('23','23','114-50-0232',89,'9193-08-20 20:05:40');
INSERT INTO Deliveries VALUES('24','24','114-50-0232',93,'7467-11-21 16:21:23');
INSERT INTO Deliveries VALUES('25','25','114-50-0232',51,'5313-03-27 20:26:04');
INSERT INTO Deliveries VALUES('26','26','114-50-0232',68,'9484-03-07 12:20:53');
INSERT INTO Deliveries VALUES('27','27','114-50-0232',14,'7634-02-19 03:55:47');
INSERT INTO Deliveries VALUES('28','28','114-50-0232',1,'2402-09-12 18:49:55');
INSERT INTO Deliveries VALUES('29','29','114-50-0232',80,'7511-01-25 03:43:02');
INSERT INTO Deliveries VALUES('30','30','114-50-0232',31,'1785-04-05 12:05:00');
INSERT INTO Deliveries VALUES('31','31','114-50-0232',17,'5972-01-23 01:55:46');
INSERT INTO Deliveries VALUES('32','32','605-63-2605',94,'1329-01-04 02:22:15');
INSERT INTO Deliveries VALUES('33','33','605-63-2605',39,'6820-11-12 07:43:58');
INSERT INTO Deliveries VALUES('34','34','605-63-2605',95,'5141-01-14 07:03:02');
INSERT INTO Deliveries VALUES('35','35','605-63-2605',59,'3102-02-26 01:34:52');
INSERT INTO Deliveries VALUES('36','36','605-63-2605',56,'2855-10-16 14:33:21');
INSERT INTO Deliveries VALUES('37','37','605-63-2605',32,'3208-08-10 16:20:48');
INSERT INTO Deliveries VALUES('38','38','605-63-2605',79,'3070-08-31 02:39:39');
INSERT INTO Deliveries VALUES('39','39','605-63-2605',86,'2833-04-24 09:03:25');
INSERT INTO Deliveries VALUES('40','40','605-63-2605',55,'4281-05-03 17:38:09');
INSERT INTO Deliveries VALUES('41','41','605-63-2605',92,'2429-12-23 01:09:45');
INSERT INTO Deliveries VALUES('42','42','605-63-2605',99,'4703-05-14 02:31:11');
INSERT INTO Deliveries VALUES('43','43','873-60-2387',57,'9253-12-16 21:58:48');
INSERT INTO Deliveries VALUES('44','44','873-60-2387',66,'0304-05-13 08:33:49');
INSERT INTO Deliveries VALUES('45','45','873-60-2387',55,'4422-04-20 14:30:36');
INSERT INTO Deliveries VALUES('46','46','873-60-2387',92,'7098-12-13 03:04:27');
INSERT INTO Deliveries VALUES('47','47','873-60-2387',54,'3087-12-12 16:40:13');
INSERT INTO Deliveries VALUES('48','48','873-60-2387',21,'0859-09-03 17:35:21');
INSERT INTO Deliveries VALUES('49','49','873-60-2387',20,'7030-05-20 02:31:04');
INSERT INTO Deliveries VALUES('50','50','873-60-2387',95,'3231-04-24 13:14:10');

/*Payments_Ledger*/
INSERT INTO Payments_Ledger VALUES('1','1','2021-07-25 05:17:33',203.42);
INSERT INTO Payments_Ledger VALUES('2','2','2021-11-03 02:58:31',167.78);
INSERT INTO Payments_Ledger VALUES('3','3','2020-05-10 11:38:18',881.90);
INSERT INTO Payments_Ledger VALUES('4','4','2020-11-08 07:08:45',175.05);
INSERT INTO Payments_Ledger VALUES('5','5','2022-02-10 13:57:55',579.06);
INSERT INTO Payments_Ledger VALUES('6','6','2020-09-09 18:52:26',727.66);
INSERT INTO Payments_Ledger VALUES('7','7','2020-03-29 19:55:18',969.60);
INSERT INTO Payments_Ledger VALUES('8','8','2021-03-21 04:09:52',43.93);
INSERT INTO Payments_Ledger VALUES('9','9','2021-07-23 05:48:44',416.14);
INSERT INTO Payments_Ledger VALUES('10','10','2021-10-25 08:13:28',959.49);
INSERT INTO Payments_Ledger VALUES('11','11','2021-08-10 08:03:51',176.97);
INSERT INTO Payments_Ledger VALUES('12','12','2021-12-16 00:27:50',542.49);
INSERT INTO Payments_Ledger VALUES('13','13','2020-03-02 10:20:45',146.33);
INSERT INTO Payments_Ledger VALUES('14','14','2020-09-15 11:37:29',397.20);
INSERT INTO Payments_Ledger VALUES('15','15','2022-01-16 22:18:11',559.11);
INSERT INTO Payments_Ledger VALUES('16','16','2020-08-01 22:27:44',465.32);
INSERT INTO Payments_Ledger VALUES('17','17','2022-02-14 02:08:31',829.77);
INSERT INTO Payments_Ledger VALUES('18','18','2021-06-21 06:15:08',462.72);
INSERT INTO Payments_Ledger VALUES('19','19','2022-01-29 10:23:17',292.49);
INSERT INTO Payments_Ledger VALUES('20','20','2020-07-20 14:21:09',650.90);
INSERT INTO Payments_Ledger VALUES('21','21','2022-02-10 01:40:39',473.28);
INSERT INTO Payments_Ledger VALUES('22','22','2021-11-04 15:06:36',730.62);
INSERT INTO Payments_Ledger VALUES('23','23','2021-01-07 02:48:34',846.06);
INSERT INTO Payments_Ledger VALUES('24','24','2020-09-26 04:27:10',728.22);
INSERT INTO Payments_Ledger VALUES('25','25','2020-04-20 07:00:32',253.06);
INSERT INTO Payments_Ledger VALUES('26','26','2020-03-08 04:25:57',208.11);
INSERT INTO Payments_Ledger VALUES('27','27','2022-02-17 08:54:06',3292.19);
INSERT INTO Payments_Ledger VALUES('28','28','2021-06-28 16:58:22',1130.18);
INSERT INTO Payments_Ledger VALUES('29','29','2021-09-09 00:02:33',1140.82);
INSERT INTO Payments_Ledger VALUES('30','30','2020-11-28 05:06:42',4688.42);
INSERT INTO Payments_Ledger VALUES('31','31','2021-09-18 15:23:18',4815.65);
INSERT INTO Payments_Ledger VALUES('32','32','2020-07-23 20:50:05',4800.55);
INSERT INTO Payments_Ledger VALUES('33','33','2021-03-22 14:09:31',4304.61);
INSERT INTO Payments_Ledger VALUES('34','34','2021-06-10 01:42:05',675.65);
INSERT INTO Payments_Ledger VALUES('35','35','2020-12-16 20:36:53',4669.47);
INSERT INTO Payments_Ledger VALUES('36','36','2020-08-08 16:03:45',3423.71);
INSERT INTO Payments_Ledger VALUES('37','37','2020-07-06 18:24:35',2695.10);
INSERT INTO Payments_Ledger VALUES('38','38','2021-08-05 01:39:45',1962.40);
INSERT INTO Payments_Ledger VALUES('39','39','2020-03-21 05:56:47',2066.60);
INSERT INTO Payments_Ledger VALUES('40','40','2020-04-26 02:09:59',1305.87);
INSERT INTO Payments_Ledger VALUES('41','41','2020-12-24 16:34:37',1124.03);
INSERT INTO Payments_Ledger VALUES('42','42','2021-11-02 03:30:43',3549.86);
INSERT INTO Payments_Ledger VALUES('43','43','2021-05-02 10:08:52',3680.81);
INSERT INTO Payments_Ledger VALUES('44','44','2020-11-14 01:04:28',1028.45);
INSERT INTO Payments_Ledger VALUES('45','45','2021-11-29 19:52:45',174.36);
INSERT INTO Payments_Ledger VALUES('46','46','2021-12-18 14:05:47',2712.57);
INSERT INTO Payments_Ledger VALUES('47','47','2021-12-27 10:27:54',1385.97);
INSERT INTO Payments_Ledger VALUES('48','48','2020-08-31 17:08:22',2768.72);
INSERT INTO Payments_Ledger VALUES('49','49','2021-10-10 13:57:37',4976.97);
INSERT INTO Payments_Ledger VALUES('50','50','2020-07-01 08:07:22',584.14);

