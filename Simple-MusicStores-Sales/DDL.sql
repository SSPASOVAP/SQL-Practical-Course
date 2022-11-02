-- Countries (Country_ID, Country_Name)
CREATE TABLE Countries(
    Country_id NUMBER,
    Country_name VARCHAR2(50) NOT NULL,

    CONSTRAINT PK_Cntr
    PRIMARY KEY(Country_ID)
);

-- Cities (City_ID, City_Name)
CREATE TABLE Cities(
    Country_ID NUMBER,
    City_ID NUMBER, 
    City_Name VARCHAR2(50) NOT NULL,
    
    CONSTRAINT PK_Cities
    PRIMARY KEY (City_ID),

    CONSTRAINT FK_City_Country
    FOREIGN KEY(Country_ID)
    REFERENCES Countries(Country_ID)
);

-- Stores (Store_ID, City_ID, Store_Name)
CREATE TABLE Stores(
    Store_ID NUMBER, 
    City_ID NUMBER, 
    Store_Name VARCHAR2(30) NOT NULL,
    Address VARCHAR2(50) NOT NULL,

    CONSTRAINT PK_Stores
    PRIMARY KEY (Store_ID),

    CONSTRAINT FK_Stores_Cities
    FOREIGN KEY (City_ID)
    REFERENCES Cities(City_ID)
);

-- Employees (Employee_ID, Store_ID, First_Name, Last_Name, Email, Phone)
CREATE TABLE Employees(
    Employee_ID NUMBER, 
    Store_ID NUMBER, 
    First_Name VARCHAR2(20) NOT NULL,
    Last_Name VARCHAR2(20) NOT NULL,
    Email VARCHAR2(40) NOT NULL, 
    Phone CHAR(10) NOT NULL, 

    CONSTRAINT PK_Employees
    PRIMARY KEY(Employee_ID),

    CONSTRAINT FK_Employees_Stores
    FOREIGN KEY (Store_ID)
    REFERENCES Stores(Store_ID),

    CONSTRAINT UQ_Mail
    UNIQUE(Email),

    CONSTRAINT Chk_Mails
    CHECK(Email LIKE '%@gmail.com' OR Email LIKE '%@abv.bg' OR Email LIKE '%@hotmail.com'), -- 3 as an example

    CONSTRAINT UQ_Phone
    UNIQUE(Phone)
);

-- Categories (Category_ID, Category_Name)
CREATE TABLE Categories(
    Category_ID NUMBER,
    Category_Name VARCHAR2(30) NOT NULL,

    CONSTRAINT PK_Categories
    PRIMARY KEY(Category_ID),

    CONSTRAINT UQ_Cat_Name
    UNIQUE(Category_Name)
);

-- Sub_Categories (Category_ID, Sub_Category_ID, Sub_Category_Name)
CREATE TABLE Sub_Categories(
    Category_ID NUMBER, 
    Sub_Category_ID NUMBER, 
    Sub_Category_Name VARCHAR2(30) NOT NULL,

    CONSTRAINT PK_Sub_Categoriy
    PRIMARY KEY(Sub_Category_ID),

    CONSTRAINT FK_SubCat_Cat
    FOREIGN KEY(Category_ID)
    REFERENCES Categories(Category_ID),

    CONSTRAINT UQ_SubCat_Name
    UNIQUE(Sub_Category_Name)
);


--Products (Sub_Category_ID, Product_ID, Product_Name, Description, Unit_Price)
CREATE TABLE Products(
    Sub_Category_ID NUMBER, 
    Product_ID NUMBER, 
    Product_Name VARCHAR2(50) NOT NULL,
    "Description" VARCHAR2(200),
    Unit_Price NUMBER(8,2) NOT NULL, 

    CONSTRAINT PK_Products
    PRIMARY KEY(Product_ID),

    CONSTRAINT FK_Prodcuts_SubCat
    FOREIGN KEY(Sub_Category_ID)
    REFERENCES Sub_Categories(Sub_Category_ID)
);

-- Customers (Customer_ID, Customer_Name, Address, Phone)
CREATE TABLE Customers(
    Customer_ID NUMBER,
    Customer_Name VARCHAR2(50) NOT NULL,
    Address VARCHAR2(50),
    Phone CHAR(10),
    
    CONSTRAINT PK_Customers
    PRIMARY KEY(Customer_ID)
);

-- Orders (Order_ID, Employee_ID, Customer_ID, Order_Date)
CREATE TABLE Orders(
    Order_ID NUMBER, 
    Employee_ID NUMBER,
    Customer_ID NUMBER,
    Order_Date DATE DEFAULT SYSDATE NOT NULL,

    CONSTRAINT PK_Orders
    PRIMARY KEY(Order_id),

    CONSTRAINT FK_Order_Employee
    FOREIGN KEY(Employee_ID)
    REFERENCES Employees(Employee_ID)
    ON DELETE SET NULL,
    
    CONSTRAINT FK_Order_Customer
    FOREIGN KEY(Customer_ID)
    REFERENCES Customers(Customer_ID)
    ON DELETE CASCADE
);

-- Order_Details (Order_ID, Product_ID, Quantity, Unit_Price, Discount)
CREATE TABLE Order_Details(
    Order_ID NUMBER, 
    Product_ID NUMBER, 
    Quantity NUMBER NOT NULL,
    Unit_Price NUMBER(8,2) NOT NULL,
    Discount NUMBER(4,2) NOT NULL,

    CONSTRAINT PK_Order_Details
    PRIMARY KEY(Order_ID, Product_ID),

    CONSTRAINT FK_Orderdtls_Orders
    FOREIGN KEY(Order_ID)
    REFERENCES Orders(Order_ID)
    ON DELETE CASCADE,

    CONSTRAINT FK_Orderdtls_Products
    FOREIGN KEY(Product_ID)
    REFERENCES Products(Product_ID)
    ON DELETE CASCADE
);