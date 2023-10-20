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

