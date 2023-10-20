
/** Database Creation & Data Loading **/

-- Dropping the database if it exists 
DROP DATABASE IF EXISTS db_paakasa;

-- creating the database using character encoding of utf-8
CREATE DATABASE db_paakasa DEFAULT CHARACTER SET utf8mb4;

-- to check if the database was created 
SHOW DATABASES;

-- to make the db_paakasa database the active database 
USE db_paakasa;

-- To drop the table if it exists
DROP TABLE IF EXISTS TblPaakasa;
DROP TABLE IF EXISTS Paakasa;

-- TO create the table for the paakasa data
CREATE TABLE TblPaakasa (
    orderID INT,
    customerID INT,
    employeeID INT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipVia INT,
    Freight DECIMAL(10,2),
    productID INT,
    unitPrice DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    companyName VARCHAR(255),
    contactName VARCHAR(255),
    contactTitle VARCHAR(255),
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    employees_lastName VARCHAR(255),
    employees_firstName VARCHAR(255),
    employees_title VARCHAR(255),
    title VARCHAR(255),
    productName VARCHAR(255),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(255),
    product_unitPrice DECIMAL(10,2),
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued TINYINT,
    categoryName VARCHAR(255),
    supplier_CompanyName VARCHAR(255),
    supplier_ContactName VARCHAR(255),
    supplier_ContactTitle VARCHAR(255)
);

-- INSERTING DATA INTO THE CREATED TABLE
/**LOAD DATA LOCAL INFILE 'G:\projects\paakasa\paakasa.csv'-- table path
INTO TABLE TblPaakasa
FIELDS TERMINATED BY ',' -- for a csv file
ENCLOSED BY '"' -- for the strings
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ignore the headers

-- to check the table for the loaded data
SELECT *
FROM TblPaakasa;
/////
This works if you have access enabled on the User and clients side. 
Due to issues with getting access so I used the Table Import Wizard and the table was successfully
imported into the db_paakasa database created on MySQL Workbench.
**/


/** Normalization and Denormalization **/
/***
After Normalizing the table, The table was sub-divided into the following entities
-- Customers
-- Categories
-- Suppliers
-- Products
-- Orders
-- Employees
 ***/

-- To get the column names of the dataset
DESCRIBE TblPaakasa;

-- TO CREATE THE CUSTOMER TABLE
CREATE TABLE IF NOT EXISTS customers AS
SELECT DISTINCT customerID,
    companyName,
    contactName,
    contactTitle       
FROM TblPaakasa;

-- To check if the table was created and the data was loaded
SELECT *
FROM customers;

-- TO CREATE THE CATEGORIES TABLE
CREATE TABLE IF NOT EXISTS categories AS 
SELECT DISTINCT categoryID,
    categoryName
FROM TblPaakasa
ORDER BY categoryID;

-- To check if the table was created and the data was loaded
SELECT *
FROM categories;

-- TO CREATE THE SUPPLIERS TABLE
CREATE TABLE IF NOT EXISTS suppliers AS
SELECT DISTINCT supplierID,
	supplier_companyName AS companyName,
    supplier_contactName AS contactName,
    supplier_contactTitle AS contactTitle
FROM TblPaakasa
ORDER BY supplierID;


-- To check if the table was created and the data was loaded
SELECT *
FROM suppliers;


-- TO CREATE THE PRODUCTS TABLE
CREATE TABLE IF NOT EXISTS products AS 
SELECT DISTINCT productID,
    productName,
    categoryID,
    supplierID,
    quantityPerUnit,
    product_unitPrice,
    unitsInStock,
	unitsOnOrder,
	reorderLevel,
	discontinued
FROM TblPaakasa
ORDER BY productID;

-- To check if the table was created and the data was loaded
SELECT *
FROM products;


-- TO CREATE THE ORDERS TABLE
CREATE TABLE IF NOT EXISTS orders AS 
SELECT  orderID,
    customerID,
    employeeID,
    STR_TO_DATE(orderDate, '%m/%d/%Y') orderDate,
    STR_TO_DATE(requiredDate, '%m/%d/%Y') requiredDate,
    STR_TO_DATE(shippedDate, '%m/%d/%Y') shippedDate,
    shipVia,
    Freight,
    productID,
    unitPrice,
    quantity,
    discount
FROM TblPaakasa
ORDER BY orderID;

-- To check if the table was created and the data was loaded
SELECT *
FROM orders;


-- TO CREATE THE EMPLOYEES TABLE
CREATE TABLE IF NOT EXISTS employees AS 
SELECT DISTINCT employeeID,
    employees_lastName,
    employees_firstName,
    CONCAT(employees_firstName, ' ', employees_lastName) AS full_name,
    employees_title
FROM TblPaakasa
ORDER BY employeeID;

-- To check if the table was created and the data was loaded
SELECT *
FROM employees;




/** Database Diagram Design and Table Alterations **/
-- ALTER TABLE CONSTRAINTS



-- FOR THE CATEGORIES TABLE
DESCRIBE categories;

-- From observing the table, the category ID should be a Primary key (NOT NULL & UNIQUE) and AUTO INCREMENT. 
-- The CategoryName column should be not be null and it should be Unique. The datatype should be VARCHAR(255)
-- To Alter the table constraints below

ALTER TABLE categories
MODIFY categoryID INT AUTO_INCREMENT PRIMARY KEY, -- For Category ID
MODIFY categoryName VARCHAR(255) NOT NULL UNIQUE; -- For Category Name

-- FOR THE CUSTOMERS TABLE
DESCRIBE customers;

/* 
From observing the table, the customerID is the Primary Key. 
The Company Name, Contact Name and Contact Title
column should not be null. 
*/

ALTER TABLE customers 
CHANGE COLUMN customerID customerID CHAR(5) NOT NULL ,
CHANGE COLUMN companyName companyName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactName contactName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactTitle contactTitle VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (customerID);
;

-- FOR THE SUPPLIERS TABLE
DESCRIBE suppliers;

/* 
From observing the columns in the table, the supplierID is the Primary Key and AUTO INCREMENT. The companyname, contactname 
and contactTitle should not be null
*/

ALTER TABLE suppliers 
CHANGE COLUMN supplierID supplierID INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN companyName companyName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactName contactName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactTitle contactTitle VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (supplierID),
ADD UNIQUE INDEX supplierID_UNIQUE (supplierID ASC) VISIBLE;
;


-- FOR THE EMPLOYEES TABLE
DESCRIBE employees;

/* 
From observing the table, the Employee ID is the Primary Key & Auto Increment then other columns are Not Null and the Data type
would be changed to VARCHAR(255)
*/

ALTER TABLE employees
CHANGE COLUMN employeeID employeeID INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN employees_lastName employees_lastName VARCHAR(255) NOT NULL ,
CHANGE COLUMN employees_firstName employees_firstName VARCHAR(255) NOT NULL ,
CHANGE COLUMN full_name full_name VARCHAR(255) NOT NULL ,
CHANGE COLUMN employees_title employees_title VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (employeeID);
;


-- FOR THE PRODUCTS TABLE
DESCRIBE products;

/* 
From my Observation, Product ID is the Primary Key, Category ID and Supplier ID are Foreign keys. Discontinued is a Boolean 
so it would be TinyINT since MySQL doesnt support Boolean. The Unit Price should be a Decimal Data Type. 
*/ 

ALTER TABLE products 
CHANGE COLUMN productID productID INT NOT NULL ,
CHANGE COLUMN productName productName VARCHAR(255) NOT NULL ,
CHANGE COLUMN quantityPerUnit quantityPerUnit VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN product_unitPrice product_unitPrice DECIMAL(10,2) NULL DEFAULT NULL ,
CHANGE COLUMN discontinued discontinued TINYINT NULL DEFAULT NULL ,
ADD PRIMARY KEY (productID),
ADD UNIQUE INDEX productName_UNIQUE (productName ASC) VISIBLE,
ADD INDEX Supplier_fk_idx (supplierID ASC) VISIBLE,
ADD INDEX Category_fk_idx (categoryID ASC) VISIBLE;
;

-- To Include the Foreign key for Supplier ID and Category ID
ALTER TABLE products 
ADD CONSTRAINT Supplier_fk
    FOREIGN KEY (supplierID)
    REFERENCES db_TblPaakasa.suppliers (supplierID)
    ON DELETE CASCADE 
    ON UPDATE RESTRICT,
ADD CONSTRAINT Category_fk
    FOREIGN KEY (categoryID)
    REFERENCES db_TblPaakasa.categories (categoryID)
    ON DELETE CASCADE 
    ON UPDATE RESTRICT;


-- FOR THE ORDERS TABLE
DESCRIBE orders;

/* AFter observing the tabel, the following constraints were added to the table */

ALTER TABLE orders 
CHANGE COLUMN orderID orderID INT NOT NULL ,
CHANGE COLUMN customerID customerID CHAR(5) NULL DEFAULT NULL ,
CHANGE COLUMN productID productID INT NOT NULL ,
CHANGE COLUMN unitPrice unitPrice DOUBLE NOT NULL ,
CHANGE COLUMN quantity quantity INT NOT NULL ,
ADD INDEX employee_fk_idx (employeeID ASC) VISIBLE,
ADD INDEX customer_fk_idx (customerID ASC) VISIBLE,
ADD INDEX product_fk_idx (productID ASC) VISIBLE;


-- To add the foreign key to the tables
ALTER TABLE db_TblPaakasa.orders 
ADD CONSTRAINT employee_fk
    FOREIGN KEY (employeeID)
    REFERENCES db_TblPaakasa.employees (employeeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT customer_fk
    FOREIGN KEY (customerID)
    REFERENCES db_TblPaakasa.customers (customerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT product_fk
    FOREIGN KEY (productID)
    REFERENCES db_TblPaakasa.products (productID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;