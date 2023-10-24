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

-- FOR THE SUPPLIERS TABLE
DESCRIBE suppliers;

/* 
From observing the columns in the table, the supplierID is the Primary Key and AUTO INCREMENT. The companyname, contactname 
and contactTitle should not be null
*/

ALTER TABLE suppliers 
CHANGE COLUMN supplierID supplierID INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN supplierCompanyName supplierCompanyName VARCHAR(255) NOT NULL ,
CHANGE COLUMN supplierContactName supplerContactName VARCHAR(255) NOT NULL ,
CHANGE COLUMN supplierContactTitle supplierContactTitle VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (supplierID),
ADD UNIQUE INDEX supplierID_UNIQUE (supplierID ASC) VISIBLE;
;

ALTER TABLE suppliers
CHANGE COLUMN supplierID supplierID INT NOT NULL AUTO_INCREMENT,
CHANGE COLUMN supplierCompanyName companyName VARCHAR(255) NOT NULL,
CHANGE COLUMN supplierContactName contactName VARCHAR(255) NOT NULL,
CHANGE COLUMN supplierContactTitle contactTitle VARCHAR(255) NOT NULL,
ADD PRIMARY KEY (supplierID),
ADD UNIQUE INDEX supplierID_UNIQUE (supplierID ASC) VISIBLE;


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
  REFERENCES db_paakasa.suppliers (supplierID)
  ON DELETE CASCADE 
  ON UPDATE RESTRICT,
ADD CONSTRAINT Category_fk
  FOREIGN KEY (categoryID)
  REFERENCES db_paakasa.categories (categoryID)
  ON DELETE CASCADE 
  ON UPDATE RESTRICT;
  

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