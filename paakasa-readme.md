# PAAKASA

## Business Database Project Design

### Introduction

Database are structured collections of data tha allow this data to be easily accessed, managed and updated.

How data is organized in a database greatly impacts the performance of an application considering databases are the heart of most business applications, which is why It’s important to properly design databases in order to speed up queries, indexing, and storage among other processes & performance targets.  

### Reading Resource

While working on this project i utilized this resources for learning purposes;-

* [Why Is Database Design Important?](https://www.linkedin.com/pulse/why-database-design-important-colbytech/)
* [Database Design Project: Building A Business Database from Scratch](https://medium.com/@okonkwoebuka456/database-design-project-building-a-business-database-from-scratch-9f9b48944f97)
* [Why Database Character Set Matter?](https://www.linkedin.com/pulse/why-database-character-set-matter-adhika-widjaya/)
* [Understanding Database Character Sets and Collations”](https://blog.fourninecloud.com/database-character-set-charset-collation-and-their-relationship-explained-227bd5155c48)
* [Understanding Character Encoding](https://www.geeksforgeeks.org/understanding-character-encoding/)
* [Introduction to Character Encoding](https://medium.com/jspoint/introduction-to-character-encoding-3b9735f265a6)
* [The ASCII table and mapping](https://www.asciitable.com/)
* [Data Normalization: Definition, Importance, and Advantages](https://coresignal.com/blog/data-normalization/)

### The Paakasa Database process

I initially followed the process from the github repo until the Normalization and Denormalization step at which point i realized i needed to revisit the previous SQLs commands as well as the excel file and clean the data a little bit better.

I therefore embarked on proper versioning with creating branches for each step so that i can inspect and perform each step properly.

#### Database Creation & Data Loading  

* I created the file <em>db_pakaasa-create.sql</em> for this step.
* I also made sure to clean the excel data a bit, reduce it and make it a bit relevant to my test project.
* I tried loading the data from csv using the sql command in file <em>db_pakaasa-load-data.sql</em> and failed due to restriction, I ran the <code>SET GLOBAL local_infile = true;</code> and checked it with <code>SHOW GLOBAL VARIABLES LIKE 'local_infile';</code> but also failed even with (value) showing ON, so run <code>SET GLOBAL local_infile = false;</code> to change value back to OFF and resorted to using the Table Import Wizard as well.
* Data was uploaded successfully(107 rows) and confirmed by running sql query <em>SELECT *
FROM TblPaakasa;</em>.

All in all at the end of the project i was working with only 94 rows after making some data cleaning.

#### Normalization and Denormalization

As per tutorial, the imported data is denormalized, thus the need for, Data Normalization

Normalization involves organizing data based on assigned attributes as a part of a larger data model. The main objective of database normalization is to eliminate redundant data, minimize data modification errors, and simplify the query process.

After Normalizing the table, The table was sub-divided into the following entities

* Customers with query <code>SELECT * FROM db_paakasa.customers;</code> to confirm table.
* Categories with query <code>SELECT * FROM db_paakasa.categories;</code> to confirm table.
* Suppliers with query <code>SELECT * FROM db_paakasa.suppliers;</code> to confirm table.
* Products with query <code>SELECT * FROM db_paakasa.products;</code> to confirm table.
* Orders with query <code>SELECT * FROM db_paakasa.orders;</code> to confirm table.
* Employees with query <code>SELECT * FROM db_paakasa.employees;</code> to confirm table.

The file i used for this step was <code>db_pakaasa-data-normalization.sql</code>
  
#### Database Diagram Design and Table Alterations

This section of the tutorial gave me abit of a challenge as i had to go back and forth between the SQL scripts, Excel data and [BARD](https://bard.google.com/)(As my peer programmer) to get it right.

#### Creating Views, Triggers, and Stored Procedures

The file i used for this step was <code>db_paakasa-create-views-triggers-stored-procedures.sql</code>

#### User Management and Privileges

The 1st user "JohnDoe" a DBA was granted full DATABASE ADMINISTRATOR PRIVILEGES.
THE 2nd user "JaneDoe" an ANALYST was granted only Read Access. 
The file i used for this step was <code>db_paakasa-user-management-privileges.sql</code>

  
### Project SQL file

After completing the project i compiled it all back into one file <code>db_paakasa.sql</code> 

``` sql

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
    customerID CHAR(5),
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
    employees_lastName VARCHAR(255),
    employees_firstName VARCHAR(255),
    employees_title VARCHAR(255),
    productName VARCHAR(255),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(255),
    product_unitPrice DECIMAL(10,2),
    unitPrice_1 DECIMAL(10,2),
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued TINYINT,
    categoryName VARCHAR(255),
    supplierCompanyName VARCHAR(255),
    supplierContactName VARCHAR(255),
    supplierContactTitle VARCHAR(255)
);

-- Databases Creation
-- Database Paakasa has been created along with table TblPaakasa(Has 32 columns)

-- Data Loading
-- INSERTING DATA INTO THE CREATED TABLE
LOAD DATA LOCAL INFILE
'G:\projects\paakasa\paakasa.csv'-- table path
INTO TABLE TblPaakasa
FIELDS TERMINATED BY ',' -- for a csv file
ENCLOSED BY '"' -- for the strings
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ignore the headers

-- to check the table for the loaded data
SELECT *
FROM TblPaakasa;
/**
This works if you have access enabled on the User and clients side. But Due to issues with getting access so I used the Table Import Wizard and the table was successfully
imported into the db_paakasa database created on MySQL Workbench.
**/
-- All in all after data cleaning i have 94(rows) when i load paakasa.csv file.
---------------------------------------------------------------------------------------

/** Normalization and Denormalization **/

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

/***
After Normalizing the table, The table was sub-divided into the following entities
-- Customers
-- Categories
-- Suppliers
-- Products
-- Orders
-- Employees
 ***/
-----------------------------------------------------------------------------------------

/** Database Diagram Design and Table Alterations **/
-- ALTER TABLE CONSTRAINTS

USE db_paakasa;
-- FOR THE CATEGORIES TABLE
DESCRIBE categories;

-- From observing the table, the category ID should be a Primary key (NOT NULL & UNIQUE) and AUTO INCREMENT. 
-- The CategoryName column should be not be null and it should be Unique. The datatype should be VARCHAR(255)
-- To Alter the table constraints below

ALTER TABLE categories
MODIFY categoryID INT AUTO_INCREMENT PRIMARY KEY; -- For Category ID
ALTER TABLE categories
MODIFY categoryName VARCHAR(255) NOT NULL UNIQUE; -- For Category Name

--------------------------------------------------------------------------------------

-- FOR THE CUSTOMERS TABLE
DESCRIBE customers;

/* 
From observing the table, the customerID is the Primary Key.
The Company Name, Contact Name and Contact Title
column should not be null. 
*/

ALTER TABLE customers 
CHANGE COLUMN customerID customerID CHAR(6) NOT NULL ,
CHANGE COLUMN companyName companyName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactName contactName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactTitle contactTitle VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (customerID);
;
------------------------------------------------------------------------------------------

-- FOR THE SUPPLIERS TABLE
DESCRIBE suppliers;

/* 
From observing the columns in the table, the supplierID is the Primary Key and AUTO INCREMENT. The companyname, contactname 
and contactTitle should not be null
*/


ALTER TABLE suppliers
CHANGE COLUMN supplierID supplierID INT NOT NULL AUTO_INCREMENT,
CHANGE COLUMN supplierCompanyName supplierCompanyName VARCHAR(255) NOT NULL,
CHANGE COLUMN supplierContactName supplierContactName VARCHAR(255) NOT NULL,
CHANGE COLUMN supplierContactTitle supplierContactTitle VARCHAR(255) NOT NULL,
ADD PRIMARY KEY (supplierID),
ADD UNIQUE INDEX supplierID_UNIQUE (supplierID ASC) VISIBLE;
;
-------------------------------------------------------------------------------------------------

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
-------------------------------------------------------------------------------------------------

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
------------------------------------------------------------------------------------------------

-- To Include the Foreign key for Supplier ID and Category ID
ALTER TABLE products 
ADD CONSTRAINT Supplier_fk
    FOREIGN KEY (supplierID)
    REFERENCES db_paakasa.suppliers (supplierID)
    ON DELETE CASCADE 
    ON UPDATE RESTRICT,
ADD CONSTRAINT Category_fk
    FOREIGN KEY (categoryID)
    REFERENCES db_paakasa.categories (categoryID)
    ON DELETE CASCADE 
    ON UPDATE RESTRICT;

-------------------------------------------------------------------------------------------------------
-- FOR THE ORDERS TABLE
DESCRIBE orders;

/* AFter observing the tabel, the following constraints were added to the table */

ALTER TABLE orders 
CHANGE COLUMN orderID orderID INT NOT NULL ,
CHANGE COLUMN customerID customerID CHAR(6) NULL DEFAULT NULL ,
CHANGE COLUMN productID productID INT NOT NULL ,
CHANGE COLUMN unitPrice unitPrice DOUBLE NOT NULL ,
CHANGE COLUMN quantity quantity INT NOT NULL ,
ADD INDEX employee_fk_idx (employeeID ASC) VISIBLE,
ADD INDEX customer_fk_idx (customerID ASC) VISIBLE,
ADD INDEX product_fk_idx (productID ASC) VISIBLE;


-- To add the foreign key to the tables
ALTER TABLE db_paakasa.orders 
ADD CONSTRAINT employee_fk
    FOREIGN KEY (employeeID)
    REFERENCES db_paakasa.employees (employeeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT customer_fk
    FOREIGN KEY (customerID)
    REFERENCES db_paakasa.customers (customerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT product_fk
    FOREIGN KEY (productID)
    REFERENCES db_paakasa.products (productID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--------------------------------------------------------------------------------------------
-- Creating Views, Triggers, and Stored Procedures

-- TASK: Create a View to show the number of Quantity sold and The Revenue made by Each Employee
CREATE OR REPLACE VIEW employee_record AS
SELECT e.employeeID,
	e.full_name AS "Full Name",
    e.employees_title AS "Title",
	SUM(o.quantity) AS "Quantity Sold",
    CONCAT( '$',
		  ROUND(SUM(o.unitPrice * o.quantity), 2)
        ) AS Revenue
FROM employees e JOIN
	orders o 
    ON e.employeeID = o.employeeID
GROUP BY e.employeeID,
		e.full_name,
        e.employees_title
ORDER BY SUM(o.unitPrice * o.quantity) DESC
;

-- To check the results of the view
SELECT *
FROM employee_record;

-- TASK: Create a Trigger on the products table that automatically removes the number of Units of product in stock, after 
-- an order has been made

-- To fist drop the Trigger if it exists
DROP TRIGGER update_products;

-- To create the trigger
DELIMITER //
CREATE TRIGGER update_products
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
UPDATE products
SET unitsInStock = products.unitsInStock - NEW.quantity
WHERE productID = NEW.productID;
END //
DELIMITER ;


-- TASK: Write a Procedure to list the products that needs to be restocked
/* 
Products that needs to be restocked are products that the amount of unit in stock is less
than the reorder level. So a procedure would be used to generate the list of products that fall
into this category. 

This helps the business Owner identify the products that need to be restocked
*/
DELIMITER $$
CREATE PROCEDURE getRestock_products ( IN product_name VARCHAR(255))
BEGIN
-- TAKING THE LOWER CASE OF THE INPUT PARAMETER
SET product_name = LOWER(product_name);
-- To check if a certain product needs to be restocked
SELECT productName,
	CASE WHEN unitsInStock < reorderLevel THEN "Restock Level reached"
    WHEN unitsInStock = reorderLevel THEN "On Restock Level"
    WHEN unitsInStock - reorderLevel <= 5 THEN "Close to Restock Level"
    ELSE "Above Restocked Level"
    END AS "Restock Status"
FROM products
WHERE LOWER(productName) LIKE CONCAT('%', product_name, '%');

-- Products that needs to be restocked
SELECT productID,
	productName,
    unitsInStock,
    reorderLevel
FROM products
WHERE unitsInStock < reorderLevel;
END $$
DELIMITER ;

-- To test if the procedures worked
CALL getRestock_products("che");

-----------------------------------------------------------------------------------------

-- User Management and Privileges

-- TASK: CREATE TWO USERS AND GIVE THEM ACCESS TO THE DATABASE 
/* 
THE FIRST USER "JohnDoe" WILL BE A DBA AND SHOULD GET FULL DATABASE ADMINISTRATOR PRIVILEGES
THE SECOND USER "JaneDoe" IS AN ANALYST AND NEEDS READ ACCESS
*/

-- To check for the existing privileges granted
SHOW GRANTS FOR 
root@localhost;

-- USER CREATION

-- FOR THE FIRST USER NAMED "JohnDoe"
CREATE USER IF NOT EXISTS
'JohnDoe'@'localhost'
IDENTIFIED BY 'user_password';

-- FOR THE SECOND USER NAMED "JaneDoe"
CREATE USER IF NOT EXISTS
'JaneDoe'@'localhost'
IDENTIFIED BY 'user_password';

-- ASSIGNING USER PRIVILEGES

-- FOR THE FIRST USER, PRIVILEGES ARE FULL DATABASE ADMINISTRATOR
-- DBA GETS FULL PRIVILEGES ON THE DATABASE
GRANT ALL PRIVILEGES
ON db_paakasa.*
TO 'JohnDoe'@'localhost';

-- FOR THE SECOND USER, PRIVILEGES ARE FOR A DATA ANALYST
-- DATA ANALYSTS GET READ ONLY ACCESS WHICH IS ONLY THE SELECT STATEMENT
GRANT 
	SELECT
ON db_paakasa.*
TO 'JaneDoe'@'localhost';
----------------------------------------------------------------------------------------


```

#### Database Backup

I did a Data Export from my MySQL workbench to create a backup of the DB file <code>PaakasaBackUp20231024.sql</code>

### Conclusion

As part of my learning i forked the original project to [my account](https://github.com/piusnmuhumuza/Database-Design) for learning purposes, backup and easy follow-up purposes.
Here is my [Paakasa project](https://github.com/piusnmuhumuza/paakasa) on github

I organized the files and pushed all files to repository to complete project.

### Tool Utilized

* [Markdown](https://www.markdownguide.org/basic-syntax/), Medium & Hashnode for this documenting my project.
* [VS CODE](https://code.visualstudio.com/download) , [MySQL WorkBench](https://www.mysql.com/products/workbench/) for the SQL.
* Google, LinkedIn & Medium for the tutorial reading material.
* [Project Documentation](https://github.com/Ebuka456/Database-Design) by Okonkwo Chukwuebuka Malcom on github.
* I also thought it a good practice to use [BARD](https://bard.google.com/) as a peer Programmer and for quickly researching complex syntax, terminologies to save time using google search or specific sites. Its important not to add sensitive information to Bard or any chatGPT platform and also ask questions that you are familiar with a a control measure incases of genAI hallucinations. 