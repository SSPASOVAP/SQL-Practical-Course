CREATE SEQUENCE PK_Cities START WITH 1;
CREATE SEQUENCE PK_Countries START WITH 1;
CREATE SEQUENCE PK_Facilities START WITH 1;
CREATE SEQUENCE PK_Hotels START WITH 1;
CREATE SEQUENCE PK_Reservations START WITH 1;
CREATE SEQUENCE PK_UserAccounts START WITH 1;



INSERT INTO Bed_Types VALUES (1, 'Single Bed');
INSERT INTO Bed_Types VALUES (2, 'Double Bed');
INSERT INTO Bed_Types VALUES (3, 'King Size Bed');


INSERT INTO Room_Types VALUES (1, 'Single Room');
INSERT INTO Room_Types VALUES (2, 'Double Room');
INSERT INTO Room_Types VALUES (3, 'Studio');
INSERT INTO Room_Types VALUES (4, 'Apartment');


INSERT INTO Room_Beds VALUES (1, 1, 1);
INSERT INTO Room_Beds VALUES (2, 1, 2);
INSERT INTO Room_Beds VALUES (3, 2 ,1);
INSERT INTO Room_Beds VALUES (4, 1 ,2);
INSERT INTO Room_Beds VALUES (4, 2, 1);
INSERT INTO Room_Beds VALUES (4, 3 ,1);


INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Private bathroom');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'WiFi');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Microwave');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Kettle');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Coffee machine');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Oven');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Toster');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'TV');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Iron');
INSERT INTO Facilities VALUES (PK_FACILITIES.nextval, 'Washing machine');


INSERT INTO Rooms_Facilities VALUES(1, 1);
INSERT INTO Rooms_Facilities VALUES(1, 2);
INSERT INTO Rooms_Facilities VALUES(1, 4);
INSERT INTO Rooms_Facilities VALUES(1, 8);
INSERT INTO Rooms_Facilities VALUES(2, 1);
INSERT INTO Rooms_Facilities VALUES(2, 2);
INSERT INTO Rooms_Facilities VALUES(2, 3);
INSERT INTO Rooms_Facilities VALUES(2, 4);
INSERT INTO Rooms_Facilities VALUES(2, 7);
INSERT INTO Rooms_Facilities VALUES(2, 8);
INSERT INTO Rooms_Facilities VALUES(3, 1);
INSERT INTO Rooms_Facilities VALUES(3, 2);
INSERT INTO Rooms_Facilities VALUES(3, 3);
INSERT INTO Rooms_Facilities VALUES(3, 5);
INSERT INTO Rooms_Facilities VALUES(3, 7);
INSERT INTO Rooms_Facilities VALUES(3, 8);
INSERT INTO Rooms_Facilities VALUES(3, 9);
INSERT INTO Rooms_Facilities VALUES(4, 1);
INSERT INTO Rooms_Facilities VALUES(4, 2);
INSERT INTO Rooms_Facilities VALUES(4, 3);
INSERT INTO Rooms_Facilities VALUES(4, 4);
INSERT INTO Rooms_Facilities VALUES(4, 5);
INSERT INTO Rooms_Facilities VALUES(4, 6);
INSERT INTO Rooms_Facilities VALUES(4, 7);
INSERT INTO Rooms_Facilities VALUES(4, 8);
INSERT INTO Rooms_Facilities VALUES(4, 9);
INSERT INTO Rooms_Facilities VALUES(4, 10);


INSERT INTO Countries VALUES(PK_COUNTRIES.nextval, 'IT', 'Italy');
INSERT INTO Countries VALUES(PK_COUNTRIES.nextval, 'FR', 'France');
INSERT INTO Countries VALUES(PK_COUNTRIES.nextval, 'ES', 'Spain');


INSERT INTO Cities VALUES(PK_CITIES.nextval, 'Rome', 1);
INSERT INTO Cities VALUES(PK_CITIES.nextval, 'Milano', 1);
INSERT INTO Cities VALUES(PK_CITIES.nextval, 'Paris', 2);
INSERT INTO Cities VALUES(PK_CITIES.nextval, 'Madrid', 3);
INSERT INTO Cities VALUES(PK_CITIES.nextval, 'Barcelona', 3);


INSERT INTO Reservation_Status VALUES (1, 'Active');
INSERT INTO Reservation_Status VALUES (2, 'Closed');
INSERT INTO Reservation_Status VALUES (3, 'Canceled');


INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Milton Roma', 1, NULL, 3);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Roma Soul', 1, NULL, 5);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Heart of Milano', 2, NULL, 3);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Milano San Siro', 2, NULL, 5);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Pullman Paris', 3, NULL, 3);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Paris Les Halles', 3, NULL, 5);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Madrid Tower', 4, NULL, 3);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Plaza Espana', 4, NULL, 5);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Barcelo Sants', 5, NULL, 3);
INSERT INTO Hotels VALUES (PK_HOTELS.nextval, 'Ayre Gran Via', 5, NULL, 5);


INSERT INTO Reservation_Details VALUES (1, 3, 2, 1, 1200);
INSERT INTO Reservation_Details VALUES (1, 3, 1, 2, 800);
INSERT INTO Reservation_Details VALUES (2, 11, 2, 1, 900);
INSERT INTO Reservation_Details VALUES (3, 5, 4, 1, 3800);
INSERT INTO Reservation_Details VALUES (4, 7, 3, 1, 1400);
INSERT INTO Reservation_Details VALUES (5, 10, 1, 1, 600);
INSERT INTO Reservation_Details VALUES (5, 10, 2, 2, 1000);


INSERT INTO Reservations VALUES (PK_RESERVATIONS.nextval, 1, TO_DATE('10-06-2022', 'dd-mm-yyyy'),
TO_DATE('25-06-2022', 'dd-mm-yyyy'), TO_DATE('29-06-2022', 'dd-mm-yyyy'), NULL,1);

INSERT INTO Reservations VALUES (PK_RESERVATIONS.nextval, 2, TO_DATE('15-07-2022', 'dd-mm-yyyy'),
TO_DATE('20-07-2022', 'dd-mm-yyyy'), TO_DATE('23-07-2022', 'dd-mm-yyyy'), NULL,1);

INSERT INTO Reservations VALUES (PK_RESERVATIONS.nextval, 3, TO_DATE('10-08-2022', 'dd-mm-yyyy'),
TO_DATE('10-08-2022', 'dd-mm-yyyy'), TO_DATE('15-08-2022', 'dd-mm-yyyy'), NULL,1);

INSERT INTO Reservations VALUES (PK_RESERVATIONS.nextval, 5, TO_DATE('01-09-2022', 'dd-mm-yyyy'),
TO_DATE('10-09-2022', 'dd-mm-yyyy'), TO_DATE('13-09-2022', 'dd-mm-yyyy'), NULL,1);

INSERT INTO Reservations VALUES (PK_RESERVATIONS.nextval, 1, TO_DATE('03-09-2022', 'dd-mm-yyyy'),
TO_DATE('15-09-2022', 'dd-mm-yyyy'), TO_DATE('20-09-2022', 'dd-mm-yyyy'), NULL,1);


INSERT INTO User_Accounts VALUES (PK_USERACCOUNTS.nextval, 'Sara', 'Jones', TO_DATE('10-06-1988', 'dd-mm-yyyy'), 's.jones@gmail.com');
INSERT INTO User_Accounts VALUES (PK_USERACCOUNTS.nextval, 'Lina', 'Smith', TO_DATE('11-08-1978', 'dd-mm-yyyy'), 'l.smith@gmail.com');
INSERT INTO User_Accounts VALUES (PK_USERACCOUNTS.nextval, 'John', 'Carter', TO_DATE('10-09-1984', 'dd-mm-yyyy'), 'j_carter@hotmail.com');
INSERT INTO User_Accounts VALUES (PK_USERACCOUNTS.nextval, 'Piter', 'Scott', TO_DATE('08-10-1985', 'dd-mm-yyyy'), 'p_scott@gmail.com');
INSERT INTO User_Accounts VALUES (PK_USERACCOUNTS.nextval, 'Scott', 'Davis', TO_DATE('07-06-1992', 'dd-mm-yyyy'), 's.davis@hotmail.com');