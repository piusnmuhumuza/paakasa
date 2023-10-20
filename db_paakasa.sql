
/** Database Creation & Data Loading **/

-- Dropping the database if it exists 
DROP DATABASE IF EXISTS db_paakasa;

-- creating the database using character encoding of utf-8
CREATE DATABASE db_paakasa DEFAULT CHARACTER SET utf8mb4;

-- to check if the database was created 
SHOW DATABASES;

-- to make the db_paakasa database the active database 
USE db_paakasa;

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
    title VARCHAR(255),
    productName VARCHAR(255),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(255),
    unitPrice_1 DECIMAL(10,2),
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
LOAD DATA LOCAL INFILE 'G:\projects\paakasa\paakasa.csv'-- table path
INTO TABLE TblPaakasa
FIELDS TERMINATED BY ',' -- for a csv file
ENCLOSED BY '"' -- for the strings
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ignore the headers

-- to check the table for the loaded data
SELECT *
FROM TblPaakasa;


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
    employee_firstname,
    employee_lastname,
    CONCAT(employee_firstname, ' ', employee_lastname) AS full_name,
    employees_title
FROM TblPaakasa
ORDER BY employeeID;

-- To check if the table was created and the data was loaded
SELECT *
FROM employees;