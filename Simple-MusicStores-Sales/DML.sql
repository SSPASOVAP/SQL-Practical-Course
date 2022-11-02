CREATE SEQUENCE PK_Categories START WITH 1;
CREATE SEQUENCE PK_Countries START WITH 1;
CREATE SEQUENCE PK_Cities START WITH 1;
CREATE SEQUENCE PK_Employees START WITH 1;
CREATE SEQUENCE PK_Orders START WITH 1;
CREATE SEQUENCE PK_Products START WITH 1;
CREATE SEQUENCE PK_Stores START WITH 1;
CREATE SEQUENCE PK_Sub_Cat START WITH 1;
CREATE SEQUENCE PK_Customers START WITH 1;


INSERT INTO Countries VALUES(PK_Countries.nextval, 'Bulgaria');


INSERT INTO Cities VALUES(1, PK_CITIES.nextval, 'Sofia');
INSERT INTO Cities VALUES(1, PK_CITIES.nextval, 'Plovdiv');
INSERT INTO Cities VALUES(1, PK_CITIES.nextval, 'Varna');
INSERT INTO Cities VALUES(1, PK_CITIES.nextval, 'Burgas');
INSERT INTO Cities VALUES(1, PK_CITIES.nextval, 'Stara Zagora');


INSERT INTO Categories VALUES(PK_CATEGORIES.nextval, 'Stringed');
INSERT INTO Categories VALUES(PK_CATEGORIES.nextval, 'Keyboard');
INSERT INTO Categories VALUES(PK_CATEGORIES.nextval, 'Percussion');


INSERT INTO Sub_Categories VALUES(1, PK_SUB_CAT.nextval, 'Classic Guitars');
INSERT INTO Sub_Categories VALUES(1, PK_SUB_CAT.nextval, 'Electric Guitars');
INSERT INTO Sub_Categories VALUES(1, PK_SUB_CAT.nextval, 'Acoustic Guitars');
INSERT INTO Sub_Categories VALUES(2, PK_SUB_CAT.nextval, 'Piano');
INSERT INTO Sub_Categories VALUES(2, PK_SUB_CAT.nextval, 'Organ');
INSERT INTO Sub_Categories VALUES(2, PK_SUB_CAT.nextval, 'Clavichord');
INSERT INTO Sub_Categories VALUES(3, PK_SUB_CAT.nextval, 'Drums');
INSERT INTO Sub_Categories VALUES(3, PK_SUB_CAT.nextval, 'Cymbals');
INSERT INTO Sub_Categories VALUES(3, PK_SUB_CAT.nextval, 'Xylophone');


INSERT INTO Products VALUES (1, PK_PRODUCTS.nextval, 'Jaime Ribot 1900', NULL, 4800);
INSERT INTO Products VALUES (1, PK_PRODUCTS.nextval, 'Alfonso Checa 1970', NULL, 1850);
INSERT INTO Products VALUES (1, PK_PRODUCTS.nextval, 'Jose Ramirez "Guitarra de Tablao"', NULL, 5500);
INSERT INTO Products VALUES (2, PK_PRODUCTS.nextval, 'Godin LGXT Cognac Burst Flame', NULL, 2500);
INSERT INTO Products VALUES (2, PK_PRODUCTS.nextval, 'Cort G290 Antique Violin Burst', NULL, 750);
INSERT INTO Products VALUES (2, PK_PRODUCTS.nextval, 'Godin 025503 xtSA Trans Black Flame', NULL, 2000);
INSERT INTO Products VALUES (3, PK_PRODUCTS.nextval, 'Kremona S65C GG Classical Guitar', NULL, 350);
INSERT INTO Products VALUES (3, PK_PRODUCTS.nextval, 'Godin A6 Ultra Cognac Burst', NULL, 1500);
INSERT INTO Products VALUES (3, PK_PRODUCTS.nextval, 'Rainsong Black Ice Graphite Acoustic', NULL, 3000);
INSERT INTO Products VALUES (4, PK_PRODUCTS.nextval, 'Yamaha Arius', NULL, 16000);
INSERT INTO Products VALUES (7, PK_PRODUCTS.nextval, 'Pearl Session Studio STS905XP', NULL, 1700);
INSERT INTO Products VALUES (7, PK_PRODUCTS.nextval, 'Pearl Session Studio STS925XSP', NULL, 1900);
INSERT INTO Products VALUES (8, PK_PRODUCTS.nextval, 'Paiste Formula 602 Modern Essentials 14"', NULL, 400);
INSERT INTO Products VALUES (8, PK_PRODUCTS.nextval, 'Sabian Artisan 14" Hats', NULL, 700);


INSERT INTO Stores VALUES(PK_STORES.nextval, 1, 'Dynacord', 'bd. "Hristo Botev" 20');
INSERT INTO Stores VALUES(PK_STORES.nextval, 1, 'Yamaha Music Store', 'bd. Iskarsko Shose" 35');
INSERT INTO Stores VALUES(PK_STORES.nextval, 2, 'IGS', 'st. "Hristo Danov" 10');
INSERT INTO Stores VALUES(PK_STORES.nextval, 3, 'Forte Music', 'st. "St. Kliment" 14');
INSERT INTO Stores VALUES(PK_STORES.nextval, 3, 'Music Factor', 'bd. "Maria Louisa" 37a');
INSERT INTO Stores VALUES(PK_STORES.nextval, 4, 'Sky Music', 'st. "George Baev" 23');
INSERT INTO Stores VALUES(PK_STORES.nextval, 5, 'Vikron', '"bd. Ruski" 20');


INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 1, 'Ivan', 'Hristov', 'i.hristov@gmail.com', '0888123456');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 1, 'Hristo', 'Ivanov', 'h_ivanov@hotmail.com', '0888133456');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 2, 'Lidia', 'Stefan', 'l.stefan@gmail.com', '0888123446');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 2, 'Viktoria', 'Petrova', 'v.petrova@gmail.com', '0889123446');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 3, 'Viktor', 'Petrov', 'v.petrov@abv.bg', '0898123456');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 4, 'Stoyan', 'Hristov', 's.hristov@abv.bg', '0888123466');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 5, 'Silviya', 'Marinova', 's.marinova@gmail.com', '0888123556');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 6, 'Stefan', 'Boev', 's_boev@hotmail.com', '0888123356');
INSERT INTO Employees VALUES (PK_EMPLOYEES.nextval, 7, 'Marin', 'Rusev', 'm.rusev@gmail.com', '0888123551');


INSERT INTO Customers VALUES(PK_CUSTOMERS.nextval, 'Verona Ltd.', NULL, NULL);
INSERT INTO Customers VALUES(PK_CUSTOMERS.nextval, 'Cosmo Music Ltd.', NULL, NULL);
INSERT INTO Customers VALUES(PK_CUSTOMERS.nextval, 'Silver Stone Ltd.', NULL, NULL);
INSERT INTO Customers VALUES(PK_CUSTOMERS.nextval, 'Disco World Ltd.', NULL, NULL);
INSERT INTO Customers VALUES(PK_CUSTOMERS.nextval, 'Music Space Ltd.', NULL, NULL);


INSERT INTO Orders VALUES (PK_ORDERS.nextval, 1, 1, TO_DATE('15-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 1, 1, TO_DATE('15-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 2, 1, TO_DATE('15-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 3, 1, TO_DATE('16-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 4, 1, TO_DATE('16-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 5, 2, TO_DATE('17-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 5, 2, TO_DATE('18-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 6, 3, TO_DATE('18-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 6, 3, TO_DATE('19-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 7, 3, TO_DATE('19-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 8, 4, TO_DATE('20-10-2022', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES (PK_ORDERS.nextval, 9, 5, TO_DATE('20-10-2022', 'dd-mm-yyyy'));


INSERT INTO Order_Details VALUES (1, 1, 1, 4800, 0);
INSERT INTO Order_Details VALUES (1, 4, 1, 2500, 0);
INSERT INTO Order_Details VALUES (1, 7, 1, 350, 0);
INSERT INTO Order_Details VALUES (2, 3, 1, 5500, 0);
INSERT INTO Order_Details VALUES (3, 8, 1, 1500, 0);
INSERT INTO Order_Details VALUES (4, 14, 1, 350, 0);
INSERT INTO Order_Details VALUES (5, 7, 2, 700, 0.20);
INSERT INTO Order_Details VALUES (6, 6, 1, 2000, 0);
INSERT INTO Order_Details VALUES (7, 2, 1, 1850, 0);
INSERT INTO Order_Details VALUES (8, 12, 1, 1900, 0);
INSERT INTO Order_Details VALUES (8, 13, 1, 400, 0);
INSERT INTO Order_Details VALUES (9, 10, 1, 16000, 0);
INSERT INTO Order_Details VALUES (10, 13, 2, 400, 0.15);
INSERT INTO Order_Details VALUES (11, 1, 1, 4800, 0);
INSERT INTO Order_Details VALUES (12, 11, 1, 1700, 0);
