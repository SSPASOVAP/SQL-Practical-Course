--  Computers(LapTop_ID, Brand, Model, Color, RAM_GB, HDD_GB, SSD_GB, Screen_Size_Inches, Touch_Screen,
--  Processor_Type, Processor_Model, Numb_Cores, Resolution, Description, Battery_Duration, Price_USD, Perc_Discount)

CREATE TABLE Computers (
    LapTop_ID NUMBER PRIMARY KEY,
    Brand VARCHAR2(30) NOT NULL,
    "Model" VARCHAR2(30) NOT NULL,
    Color VARCHAR2(10) NOT NULL,
    RAM_GB NUMBER(2) NOT NULL,
    HDD_GB NUMBER(4),
    SSD_GB  NUMBER(4),
    Screen_Size_Inches NUMBER(5,2) NOT NULL,
    Touch_Screen CHAR(1),
    Processor_Type VARCHAR2(20) NOT NULL,
    Processor_Model VARCHAR2(10) NOT NULL,
    Numb_Cores NUMBER(2) NOT NULL,
    Resolution CHAR(9) NOT NULL,
    "Description" VARCHAR2(200),
    Battery_Duration NUMBER(5,2) NOT NULL,
    Price_USD NUMBER(8,2) NOT NULL,
    Discount NUMBER(4,2),

    CONSTRAINT Chk_Ram
    CHECK(RAM_GB IN(2, 4, 8, 12, 16, 20, 32, 40)),

    CONSTRAINT Chk_HDD
    CHECK(HDD_GB IN (256, 512, 1000)),

    CONSTRAINT Chk_SSD
    CHECK(SSD_GB IN (256, 512, 1000)),

    CONSTRAINT Chk_Laptop_Memory
    CHECK(HDD_GB IS NOT NULL OR SSD_GB IS NOT NULL),

    CONSTRAINT Chk_Screen
    CHECK(Screen_Size_Inches IN (13.3, 14, 15.6, 16.2, 17, 18)),

    CONSTRAINT Chk_T_Screen
    CHECK(Touch_Screen IN (1, 2) AND Touch_Screen IS NOT NULL),

    CONSTRAINT Chk_Battery
    CHECK(Battery_Duration <= 20)
);


------------------------------------------------ Normalization

-- Brands(Brand_ID, Brand_Name, Description)
CREATE TABLE Brands (
    Brand_ID NUMBER PRIMARY KEY,
    Brand_Name VARCHAR2(30) NOT NULL,
    "Description" VARCHAR2(200)
);

-- Models(Model_ID, Brand_ID, Models_Name, Touch_Screen, Color_ID)
CREATE TABLE Models (
    Model_ID NUMBER PRIMARY KEY,
    Brand_ID NUMBER,
    Model_Name VARCHAR2(50) NOT NULL,
    Touch_Screen CHAR(1),
    Color_ID NUMBER,

    CONSTRAINT FK_Models_Brands
    FOREIGN KEY(Brand_ID)
    REFERENCES Brands(Brand_ID),

    CONSTRAINT FK_Color
    FOREIGN KEY (Color_ID)
    REFERENCES Colors(Color_ID),

    CONSTRAINT Chk_TScreen
    CHECK(Touch_Screen IN (0, 1) AND Touch_Screen IS NOT NULL)
);

-- Processor_Type (Processor_ID, Processor_Type, Processor_Model, Numb_Cores)
CREATE TABLE Processor_Type (
    Processor_ID NUMBER PRIMARY KEY,
    Processor_Type VARCHAR2(20) NOT NULL,
    Processor_Model VARCHAR2(15) NOT NULL,
    Numb_Cores NUMBER(2) NOT NULL
); 

-- Resolution (Resolution_ID, Resolution_Type)
CREATE TABLE Resolution (
    Resolution_ID NUMBER PRIMARY KEY,
    Resolution_Type CHAR(9) NOT NULL
);

-- Accessories (Accessory_ID, Accessory_Type)
CREATE TABLE Accessories (
    Accessory_ID NUMBER PRIMARY KEY,
    Accessory_Type VARCHAR2(30) NOT NULL
);

-- Laptops (Laptop_ID, Model_ID, RAM_GB, HDD_GB, SSD_GB, Screen_Size_Inches, Processor_ID, Resolution_ID, Battery_Duration_h, Price, Discount)
CREATE TABLE Laptops (
    Laptop_ID NUMBER PRIMARY KEY,
    Model_ID NUMBER,
    RAM_GB NUMBER(2) NOT NULL,
    HDD_GB NUMBER(4),
    SSD_GB  NUMBER(4),
    Screen_Size_Inches NUMBER(5,2) NOT NULL,
    Processor_ID NUMBER,
    Resolution_ID NUMBER,
    Battery_Duration_h NUMBER (5,2) NOT NULL,
    Price NUMBER(8,2) NOT NULL,
    Discount NUMBER (4,2),

    CONSTRAINT FK_LT_Models
    FOREIGN KEY(Model_ID)
    REFERENCES Models(Model_ID),

    CONSTRAINT FK_LT_Processors
    FOREIGN KEY(Processor_ID)
    REFERENCES Processor_Type(Processor_ID),

    CONSTRAINT FK_LT_Resolutions
    FOREIGN KEY(Resolution_ID)
    REFERENCES Resolution(Resolution_ID),

    CONSTRAINT Chk_Rams
    CHECK(RAM_GB IN(2, 4, 8, 12, 16, 20, 32, 40)),

    CONSTRAINT Chk_HDDs
    CHECK(HDD_GB IN (256, 512, 1000)),

    CONSTRAINT Chk_SSDs
    CHECK(SSD_GB IN (256, 512, 1000)),

    CONSTRAINT Chk_Laptop_Memories
    CHECK(HDD_GB IS NOT NULL OR SSD_GB IS NOT NULL),

    CONSTRAINT Chk_Screens
    CHECK(Screen_Size_Inches IN (13.3, 14, 15.6, 16.2, 17, 18)),

    CONSTRAINT Chk_Batteries
    CHECK(Battery_Duration <= 20),

    CONSTRAINT Chk_Price
    CHECK(Price > 300)
);

-- Colors(Color_ID, Color)
CREATE TABLE Colors (
    Color_ID NUMBER PRIMARY KEY,
    Color VARCHAR2(10) NOT NULL
);

-- Accessories (Accessory_ID , Accessory_Type)
CREATE TABLE  Accessories (
    Accessory_ID NUMBER PRIMARY KEY,
    Accessory_Type VARCHAR2(30) NOT NULL
);

-- Laptop_Accessories (Model_ID, Accessory_ID)
CREATE TABLE Laptop_Accessories (
    Model_ID NUMBER,
    Accessory_ID NUMBER,

    CONSTRAINT PK_LT_Accessories
    PRIMARY KEY(Model_ID,Accessory_ID)
);

-- Tabel Computers can be dropped, after Normalization
DROP TABLE Computers;