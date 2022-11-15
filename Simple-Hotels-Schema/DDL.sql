-- Countries (Country_ID, Country_Code, Country_Name)
CREATE TABLE Countries(
    Country_ID NUMBER,
    Country_Code CHAR(2) NOT NULL,
    Country_Name VARCHAR2(100) NOT NULL, 

    CONSTRAINT PK_Country
    PRIMARY KEY(Country_ID),

    CONSTRAINT UQ_CountryCode
    UNIQUE(Country_Code),

    CONSTRAINT UQ_Country
    UNIQUE(Country_Name)
);

-- Cities (City _ID, City_Name, Country_ID)
CREATE TABLE Cities(
    City_ID NUMBER,
    City_Name VARCHAR2(100) NOT NULL, 
    Country_Id NUMBER,

    CONSTRAINT PK_City
    PRIMARY KEY(City_ID),

    CONSTRAINT FK_City_Cntry
    FOREIGN KEY(Country_ID)
    REFERENCES Countries(Country_Id)
);

-- Hotels (Hotel_ID, Hotel_Name, City_ID, Count_Of_Employees, Stars)
CREATE TABLE Hotels(
    Hotel_ID NUMBER,
    Hotel_Name VARCHAR2(50) NOT NULL,
    City_ID NUMBER,
    Count_Of_Employees NUMBER,
    Stars NUMBER NOT NULL,

    CONSTRAINT PK_Hotel
    PRIMARY KEY(Hotel_ID),

    CONSTRAINT FK_Hotels_Cities
    FOREIGN KEY(City_ID)
    REFERENCES Cities(City_ID),

    CONSTRAINT CHK_Stars
    CHECK(Stars BETWEEN 1 AND 5) 
);

-- User Accounts (User_ID, First_Name, Last_Name, Birth_Date, Email)
CREATE TABLE User_Accounts(
    User_ID NUMBER, 
    First_Name  NVARCHAR2(100) NOT NULL,
    Last_Name NVARCHAR2(100) NOT NULL,
    Birth_Date DATE NOT NULL,
    Email VARCHAR2(100) NOT NULL,

    CONSTRAINT PK_User_Account
    PRIMARY KEY(User_ID),

    CONSTRAINT Chk_BDate
    CHECK(Birth_Date > TO_DATE('01-01-1920', 'dd-mm-yyyy')),

    CONSTRAINT UQ_Mail
    UNIQUE(Email),

    CONSTRAINT Chk_Mails
    CHECK(Email LIKE '%@gmail.com' OR Email LIKE '%@hotmail.com')
);

-- Reservations (Reservation_ID, User_ID, Book_Date, Arrival_Date, Departure_Date, Cancel_Date, Status_ID)
CREATE TABLE Reservations(
    Reservation_ID NUMBER,
    User_ID NUMBER, 
    Book_Date DATE NOT NULL, 
    Arrival_Date DATE NOT NULL,
    Departure_Date DATE NOT NULL,
    Cancel_Date DATE DEFAULT NULL,
    Status_ID NUMBER,

    CONSTRAINT PK_Reserve
    PRIMARY KEY(Reservation_ID),

    CONSTRAINT FK_Reserv_Users
    FOREIGN KEY(User_ID)
    REFERENCES User_Accounts(User_ID),

    CONSTRAINT CHK_Arrival_Date
    CHECK(Arrival_Date >= Book_Date),

    CONSTRAINT CHK_Departure_Date
    CHECK(Departure_Date > Arrival_Date),

    CONSTRAINT FK_Reserv_Status
    FOREIGN KEY(Status_ID)
    REFERENCES Reservation_Status(Status_ID)
);

-- Reservation_Status (Status_ID, Status_Type)
CREATE TABLE Reservation_Status(
    Status_ID NUMBER,
    Status_Type VARCHAR2(20) NOT NULL,

    CONSTRAINT PK_Reserv_Status
    PRIMARY KEY(Status_ID)
);

-- Room_Types (Room_ID, Room_Type)
CREATE TABLE Room_Types(
    Room_ID NUMBER,
    Room_Type VARCHAR2(30) NOT NULL,

    CONSTRAINT PK_RoomType
    PRIMARY KEY(Room_ID)
);

-- Reservation_Details (Reservation_ID, Hotel_ID, Room_ID, Numb_Rooms, One_Night_Price)
CREATE TABLE Reservation_Details(
    Reservation_ID NUMBER,
    Hotel_ID NUMBER,
    Room_ID NUMBER,
    Numb_Rooms NUMBER,
    One_Night_Price NUMBER(8,2) NOT NULL,

    CONSTRAINT PK_Reserve_Details
    PRIMARY KEY(Reservation_ID, Hotel_ID, Room_ID),

    CONSTRAINT FK_ReserveID
    FOREIGN KEY(Reservation_ID)
    REFERENCES Reservations(Reservation_ID)
    ON DELETE CASCADE,

    CONSTRAINT FK_Reserve_Hotels
    FOREIGN KEY(Hotel_ID)
    REFERENCES Hotels(Hotel_ID),

    CONSTRAINT FK_Reserve_Rooms
    FOREIGN KEY(Room_ID)
    REFERENCES Room_Types(Room_ID),

    CONSTRAINT CHK_Price
    CHECK(One_Night_Price > 0 AND One_Night_Price <= 10000)
);

-- Bed Types(Bed_ID, Bed_type)
CREATE TABLE Bed_Types(
    Bed_ID NUMBER,
    Bed_Type VARCHAR2(30) NOT NULL,

    CONSTRAINT PK_Bed
    PRIMARY KEY(Bed_ID)
);

-- Room_Beds (Room_ID, Bed_ID, Numb_Beds)
CREATE TABLE Room_Beds(
    Room_ID NUMBER,
    Bed_ID NUMBER, 
    Numb_Beds NUMBER(1) NOT NULL, 

    CONSTRAINT PK_Room_Beds
    PRIMARY KEY(Room_ID, Bed_ID),

    CONSTRAINT FK_Rooms
    FOREIGN KEY(Room_ID)
    REFERENCES Room_Types(Room_ID),

    CONSTRAINT FK_Beds
    FOREIGN KEY(Bed_ID)
    REFERENCES Bed_Types(Bed_ID)
);

-- Facilities (Facility_ID, Facility_Type)
CREATE TABLE Facilities(
    Facility_ID NUMBER,
    Facility_Type VARCHAR2(50) NOT NULL,

    CONSTRAINT PK_Facility
    PRIMARY KEY(Facility_ID)
);

-- Rooms_Facilities (Room_ID, Facility_ID)
CREATE TABLE Rooms_Facilities(
    Room_ID NUMBER,
    Facility_ID NUMBER, 

    CONSTRAINT PK_Room_Facility
    PRIMARY KEY(Room_ID, Facility_ID),

    CONSTRAINT FK_Rooms_F
    FOREIGN KEY(Room_ID)
    REFERENCES Room_Types(Room_ID),

    CONSTRAINT FK_Facilities
    FOREIGN KEY(Facility_ID)
    REFERENCES Facilities(Facility_ID)
    ON DELETE CASCADE
);
 