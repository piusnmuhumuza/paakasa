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
	supplierCompanyName,
    supplierContactName,
    supplierContactTitle
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
    STR_TO_DATE('21,5,2013','%d,%m,%Y') orderDate,
    STR_TO_DATE('21,5,2013','%d,%m,%Y') requiredDate,
    STR_TO_DATE('21,5,2013','%d,%m,%Y') shippedDate,
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