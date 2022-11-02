----------------------- RAW DATA from table Computers
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Lenovo', 'IdeaPad 3','Grey', 8, 256, NULL, 14, 'N', 'AMD Ryzen 5 4.0GHz', '5600H', 6, '1320x1080', NULL, 8, 1769.99, 0.15);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Lenovo', 'IdeaPad 3', 'Grey', 8, NULL, 512, 15.6, 'N', 'AMD Ryzen 5 4.0GHz', '5600H', 6, '1920x1080', NULL, 8, 1849.99, 0.15);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Lenovo', 'IdeaPad Duet 3', 'Black', 4, 256, NULL, 14, 'N', 'AMD A4 1.5GHz', '9220e', 2, '1366x768', NULL, 6, 430, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Lenovo', 'IdeaPad Duet 3', 'Black', 8, 256, NULL, 14, 'N', 'AMD A4 1.5GHz','9220e', 2, '1366x768', NULL, 6, 420, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Lenovo', 'IdeaPad Duet 1', 'Black', 4, NULL, 256, 14, 'N', 'AMD A4 1.5GHz', 'N4020',2, '1366x768', NULL, 6, 500, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Dell', 'Vostro 3500', 'Black', 4, 1000, NULL, 15.6, 'N','Intel i5 2.4GHz', '1135G7',4, '1920x1080', NULL, 8, 1200, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Dell', 'Vostro 3500', 'Black', 8, 1000, NULL, 17, 'N','Intel i5 2.4GHz', '1135G7',4, '1920x1080', NULL, 8, 2000, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Dell', 'Gaming Alienware X15 R2', 'Grey',32, NULL, 1000, 18, 'N','Intel i7 3.5GHz', '12700H',16, '2560x1440', NULL, 10, 9599.99, 0.15);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Dell', 'Gaming Alienware X15 R2', 'Grey',32, NULL, 1000, 18, 'N','Intel i7 3.5GHz', '12700H',16, '2560x1440', NULL, 10, 10000, 0.15);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Dell', 'Vostro 3510', 'Black', 8, 256, NULL, 15.6, 'N', 'Intel i5 2.4GHz', '1135G7', 4,'1920x1080', NULL, 8, 1200, 0.2);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'HP', 'ProBook 445', 'Grey', 8, NULL, 512, 14, 'N', 'AMD Ryzen 5 4.0GHz', '5600U', 6, '1920x1080', NULL, 8, 1500, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'HP', 'Gaming Victus', 'Black', 8, NULL, 512, 15.6, 'N', 'Intel i5 3.3GHz', '12500H', 12, '1920x1080', NULL, 10, 1700, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'HP', 'Gaming Victus', 'Black', 8, NULL, 512, 15.6, 'N', 'Intel i5 3.3GHz', '12500H', 12, '1920x1080', NULL, 10, 2000, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'HP', 'Pavilion', 'Grey', 8, NULL, 512, 15.6, 'N', 'AMD Ryzen 5 4.0GHz', '5600H', 6, '1920x1080', NULL, 7.5, 2289, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'HP', 'Envy x360', 'Black', 8, NULL, 512, 13.3, 'Y', 'AMD Ryzen 7 4.4GHz', '5800U', 8, '1920x1080', NULL, 7, 1949, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Apple', 'MacBook Air 13', 'White', 8, NULL, 256, 13.3, 'N', 'M1', 'Apple M1', 8, '2560x1600', NULL, 18, 2200, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Apple', 'MacBook Pro 13', 'Silver', 8, NULL, 512, 13.3, 'N', 'M1', 'Apple M1', 8, '2560x1600', NULL, 20, 3000, 0.1);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Apple', 'MacBook Pro 14', 'White', 16, NULL, 512, 14, 'N', 'M1 Pro', 'Apple M1 Pro', 8, '3024x1964', NULL, 17, 4000, 0.1);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Apple', 'MacBook Pro 16', 'Silver', 16, NULL, 512, 16.2, 'N', 'M1 Pro', 'Apple M1 Pro', 10, '3456x2234', NULL, 17, 5000, 0);
INSERT INTO Computers VALUES(PK_LAPTOP.NEXTVAL, 'Apple', 'MacBook Pro 16', 'Silver', 16, NULL, 512, 16.2, 'N', 'M1 Pro', 'Apple M1 Pro', 10, '3456x2234', NULL, 17, 5500, 0.1);



----------------------- Normalization 

CREATE SEQUENCE PK_Brands START WITH 1;
CREATE SEQUENCE PK_Models START WITH 1;
CREATE SEQUENCE PK_Colors START WITH 1;
CREATE SEQUENCE PK_Processors START WITH 1;
CREATE SEQUENCE PK_Resolutions START WITH 1;
CREATE SEQUENCE PK_LT START WITH 1;
CREATE SEQUENCE PK_Accessories START WITH 1;


INSERT INTO Brands VALUES(PK_Brands.nextval, 'Lenovo', 'NULL');
INSERT INTO Brands VALUES(PK_Brands.nextval, 'Dell', 'NULL');
INSERT INTO Brands VALUES(PK_Brands.nextval, 'HP', 'NULL');
INSERT INTO Brands VALUES(PK_Brands.nextval, 'Apple', 'NULL');


INSERT INTO Models VALUES(PK_MODELS.nextval, 1, 'IdeaPad 3', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 1, 'IdeaPad Duet 3', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 1, 'IdeaPad Duet 1', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 2, 'Vostro 3500', 'N');
INSERT INTO Models VALUES(PK_MODELS.nextval, 2, 'Gaming Alienware X15 R2', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 2, 'Vostro 3510', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 3, 'ProBook 445', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 3, 'Gaming Victus', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 3, 'Pavilion', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 3, 'Envy x360', 1);
INSERT INTO Models VALUES(PK_MODELS.nextval, 4, 'MacBook Air 13', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 4, 'MacBook Pro 13', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 4, 'MacBook Pro 14', 0);
INSERT INTO Models VALUES(PK_MODELS.nextval, 4, 'MacBook Pro 16', 0);


INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval, 'AMD Ryzen 5 4.0GHz', '5600H', 6);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval, 'AMD A4 1.5GHz', '9220e', 2);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval, 'AMD A4 1.5GHz', 'N4020',2);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval, 'Intel i5 2.4GHz', '1135G7',4);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval, 'Intel i7 3.5GHz', '12700H',16);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval, 'Intel i5 3.3GHz', '12500H', 12);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval,'AMD Ryzen 7 4.4GHz', '5800U', 8);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval,'M1', 'Apple M1', 8);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval,'M1 Pro', 'Apple M1 Pro', 8);
INSERT INTO Processor_type VALUES(PK_PROCESSORS.nextval,'M1 Pro', 'Apple M1 Pro', 10);


INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'1320x1080');
INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'1920x1080');
INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'1366x768');
INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'2560x1440');
INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'2560x1600');
INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'3024x1964');
INSERT INTO Resolution VALUES(PK_RESOLUTIONS.nextval,'3456x2234');


INSERT INTO Colors VALUES(1, 'Black');
INSERT INTO Colors VALUES(2, 'White');
INSERT INTO Colors VALUES(3, 'Silver');
INSERT INTO Colors VALUES(4, 'Grey');


INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 1, 8, NULL, 512, 15.6, 1, 2, 8, 1849.99, 0.15);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 3, 4, NULL, 256, 14, 3, 3, 6, 500, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 5, 32, NULL, 1000, 18, 5, 4, 10, 9599.99, 0.15);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 11, 8, NULL, 256, 13.3, 8, 5, 18, 2200, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 12, 8, NULL, 512, 13.3, 8, 5, 20, 3000, 0.1);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 13, 16, NULL, 512, 14, 9, 6, 17, 4000, 0.1);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 2, 8, 256, NULL, 14, 2, 3, 6, 420, 0.1);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 4, 4, 1000, NULL, 15.6, 4, 2, 8, 1200, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 9, 8, NULL, 512, 15.6, 1, 2, 7.5, 2289, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 10, 8, NULL, 512, 13.3, 7, 2, 7, 1949, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 1, 8, 256, NULL, 14, 1, 1, 8, 1769.99, 0.15);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 2, 4, 256, NULL, 14, 2, 3, 6, 430, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 7, 8, NULL, 512, 14, 1, 2, 8, 1500, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 4, 8, 1000, NULL, 17, 4, 2, 8, 2000, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 13, 6, NULL, 512, 14, 9, 6, 17, 4200, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 14, 16, NULL, 512, 16.2, 10, 7, 17, 5000, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 8, 8, NULL, 512, 15.6, 6, 2, 10, 2000, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 8, 8, NULL, 512, 15.6, 6, 2, 10, 1700, 0);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 6, 8, 256, NULL, 15.6, 4, 2, 8, 1200, 0.2);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 14, 16, NULL, 512, 16.2, 10, 7, 17, 5500, 0.1);
INSERT INTO Laptops VALUES(PK_LT.NEXTVAL, 5, 32, NULL, 1000, 18, 5, 4, 10, 10000, 0.15);


INSERT INTO Accessories VALUES(PK_ACCESSORIES.nextval,'Mouse_USB');
INSERT INTO Accessories VALUES(PK_ACCESSORIES.nextval,'Wireless_Mouse');
INSERT INTO Accessories VALUES(PK_ACCESSORIES.nextval,'Wireless_Keyboard');
INSERT INTO Accessories VALUES(PK_ACCESSORIES.nextval,'Mouse_Pad');
INSERT INTO Accessories VALUES(PK_ACCESSORIES.nextval,'Adapter_65W');


INSERT INTO laptop_accessories VALUES(1,1);
INSERT INTO laptop_accessories VALUES(1,5);
INSERT INTO laptop_accessories VALUES(1,4);
INSERT INTO laptop_accessories VALUES(2,2);
INSERT INTO laptop_accessories VALUES(2,3);
INSERT INTO laptop_accessories VALUES(2,5);
INSERT INTO laptop_accessories VALUES(7,5);
INSERT INTO laptop_accessories VALUES(1,1);
INSERT INTO laptop_accessories VALUES(3,5);
INSERT INTO laptop_accessories VALUES(10,5);
INSERT INTO laptop_accessories VALUES(10,1);
INSERT INTO laptop_accessories VALUES(9,5);
INSERT INTO laptop_accessories VALUES(9,1);