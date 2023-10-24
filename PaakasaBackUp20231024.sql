CREATE DATABASE  IF NOT EXISTS `db_paakasa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_paakasa`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_paakasa
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beverages'),(2,'Condiments'),(3,'Confections'),(4,'Dairy Products'),(5,'Grains/Cereals'),(6,'Meat/Poultry'),(7,'Produce'),(8,'Seafood');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerID` char(6) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  `contactTitle` varchar(255) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('ANATR','Ana Trades Limited','Ana Tracy','Owner'),('AROUT','Around the Horn','Thomas Hardy','Sales Representative'),('BOTTM','Botta Markets Limited','Elizabeth Lincoln','Accounting Manager'),('BSBEV','Basana Beverages','Victoria Ashworth','Sales Representative'),('CONSH','Consolidated Holdings','Elizabeth Brown','Sales Representative'),('EASTC','Eastern Connection','Ann Devon','Sales Agent'),('HANAR','Hana Canes Limited','Mario Pontes','Accounting Manager'),('HILAA','Hero Abas and Sons Limited','Carlos Hernández','Sales Representative'),('HUNGC','Coyote Import Store','Yoshi Latimer','Sales Representative'),('HUNGO','All Night Grocers ','Patricia AKena','Sales Associate'),('ISLAT','Islands Traders','Helen Bennett','Marketing Manager'),('LAUGB','Baker Wine Cellars','Yoshi Tannamuri','Marketing Assistant'),('LEHMS','Lehmanns Marketing','Renate Messner','Sales Representative'),('MAISD','Mason Drew','Catherine Dewey','Sales Agent'),('OLDWO','Old World Delicacies','Rene Phillips','Sales Representative'),('QUEEN','Queen Cousins','Lúcia Carvalho','Marketing Assistant'),('QUICK','Quick Shooters ','Horst Kloss','Accounting Manager'),('RATTC','Canyon Grocery','Paula Wilson','Assistant Sales Representative'),('RICSU','Richter Supermarkt','Michael Holz','Sales Manager'),('SEVES','Seven Seas Imports','Hari Kumar','Sales Manager'),('THECR','The Cracker Box','Liu Wong','Marketing Assistant'),('TOMSP','Toms Special','Karin Josephs','Marketing Manager'),('TORTU','Top Restaurant','Miguel Angel Paolino','Owner');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_record`
--

DROP TABLE IF EXISTS `employee_record`;
/*!50001 DROP VIEW IF EXISTS `employee_record`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_record` AS SELECT 
 1 AS `employeeID`,
 1 AS `Full Name`,
 1 AS `Title`,
 1 AS `Quantity Sold`,
 1 AS `Revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `employees_lastName` varchar(255) NOT NULL,
  `employees_firstName` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `employees_title` varchar(255) NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Davolio','Nancy','Nancy Davolio','Sales Representative'),(2,'Fuller','Andrew','Andrew Fuller','Vice President, Sales'),(3,'Leverling','Janet','Janet Leverling','Sales Representative'),(4,'Peacock','Margaret','Margaret Peacock','Sales Representative'),(5,'Buchanan','Steven','Steven Buchanan','Sales Manager'),(6,'Suyama','Michael','Michael Suyama','Sales Representative'),(7,'King','Robert','Robert King','Sales Representative'),(8,'Callahan','Laura','Laura Callahan','Inside Sales Coordinator'),(9,'Dodsworth','Anne','Anne Dodsworth','Sales Representative');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL,
  `customerID` char(6) DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `requiredDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `shipVia` int DEFAULT NULL,
  `Freight` decimal(10,2) DEFAULT NULL,
  `productID` int NOT NULL,
  `unitPrice` double NOT NULL,
  `quantity` int NOT NULL,
  `discount` decimal(4,2) DEFAULT NULL,
  KEY `employee_fk_idx` (`employeeID`),
  KEY `customer_fk_idx` (`customerID`),
  KEY `product_fk_idx` (`productID`),
  CONSTRAINT `customer_fk` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  CONSTRAINT `employee_fk` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`),
  CONSTRAINT `product_fk` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10249,'TOMSP',6,'2013-05-21','2013-05-21','2013-05-21',1,11.61,14,18.6,9,0.00),(10249,'TOMSP',6,'2013-05-21','2013-05-21','2013-05-21',1,11.61,51,42.4,40,0.00),(10250,'HANAR',4,'2013-05-21','2013-05-21','2013-05-21',2,65.83,41,7.7,10,0.00),(10250,'HANAR',4,'2013-05-21','2013-05-21','2013-05-21',2,65.83,51,42.4,35,0.15),(10253,'HANAR',3,'2013-05-21','2013-05-21','2013-05-21',2,58.17,31,10,20,0.00),(10253,'HANAR',3,'2013-05-21','2013-05-21','2013-05-21',2,58.17,49,16,40,0.00),(10255,'RICSU',9,'2013-05-21','2013-05-21','2013-05-21',3,148.33,59,44,30,0.00),(10255,'RICSU',9,'2013-05-21','2013-05-21','2013-05-21',3,148.33,36,15.2,25,0.00),(10255,'RICSU',9,'2013-05-21','2013-05-21','2013-05-21',3,148.33,16,13.9,35,0.00),(10272,'RATTC',6,'2013-05-21','2013-05-21','2013-05-21',2,98.03,31,10,40,0.00),(10272,'RATTC',6,'2013-05-21','2013-05-21','2013-05-21',2,98.03,20,64.8,6,0.00),(10272,'RATTC',6,'2013-05-21','2013-05-21','2013-05-21',2,98.03,72,27.8,24,0.00),(10273,'QUICK',3,'2013-05-21','2013-05-21','2013-05-21',3,76.07,10,24.8,24,0.05),(10273,'QUICK',3,'2013-05-21','2013-05-21','2013-05-21',3,76.07,31,10,15,0.05),(10273,'QUICK',3,'2013-05-21','2013-05-21','2013-05-21',3,76.07,33,2,20,0.00),(10273,'QUICK',3,'2013-05-21','2013-05-21','2013-05-21',3,76.07,40,14.7,60,0.05),(10273,'QUICK',3,'2013-05-21','2013-05-21','2013-05-21',3,76.07,76,14.4,33,0.05),(10276,'TORTU',8,'2013-05-21','2013-05-21','2013-05-21',3,13.84,10,24.8,15,0.00),(10276,'TORTU',8,'2013-05-21','2013-05-21','2013-05-21',3,13.84,13,4.8,10,0.00),(10293,'TORTU',1,'2013-05-21','2013-05-21','2013-05-21',3,21.18,18,50,12,0.00),(10298,'HUNGO',6,'2013-05-21','2013-05-21','2013-05-21',2,168.22,2,15.2,40,0.00),(10298,'HUNGO',6,'2013-05-21','2013-05-21','2013-05-21',2,168.22,36,15.2,40,0.25),(10304,'TORTU',1,'2013-05-21','2013-05-21','2013-05-21',2,63.79,49,16,30,0.00),(10304,'TORTU',1,'2013-05-21','2013-05-21','2013-05-21',2,63.79,59,44,10,0.00),(10304,'TORTU',1,'2013-05-21','2013-05-21','2013-05-21',2,63.79,71,17.2,2,0.00),(10321,'ISLAT',3,'2013-05-21','2013-05-21','2013-05-21',2,3.43,35,14.4,10,0.00),(10346,'RATTC',3,'2013-05-21','2013-05-21','2013-05-21',3,142.08,56,30.4,20,0.00),(10372,'QUEEN',5,'2013-05-21','2013-05-21','2013-05-21',2,890.78,20,64.8,12,0.25),(10372,'QUEEN',5,'2013-05-21','2013-05-21','2013-05-21',2,890.78,38,210.8,40,0.25),(10372,'QUEEN',5,'2013-05-21','2013-05-21','2013-05-21',2,890.78,60,27.2,70,0.25),(10372,'QUEEN',5,'2013-05-21','2013-05-21','2013-05-21',2,890.78,72,27.8,42,0.25),(10373,'HUNGO',4,'2013-05-21','2013-05-21','2013-05-21',3,124.12,58,10.6,80,0.20),(10373,'HUNGO',4,'2013-05-21','2013-05-21','2013-05-21',3,124.12,71,17.2,50,0.20),(10375,'HUNGC',3,'2013-05-21','2013-05-21','2013-05-21',2,20.12,14,18.6,15,0.00),(10377,'SEVES',1,'2013-05-21','2013-05-21','2013-05-21',3,22.21,28,36.4,20,0.15),(10377,'SEVES',1,'2013-05-21','2013-05-21','2013-05-21',3,22.21,39,14.4,20,0.15),(10380,'HUNGO',8,'2013-05-21','2013-05-21','2013-05-21',3,35.03,30,20.7,18,0.10),(10380,'HUNGO',8,'2013-05-21','2013-05-21','2013-05-21',3,35.03,53,26.2,20,0.10),(10395,'HILAA',6,'2013-05-21','2013-05-21','2013-05-21',1,184.41,69,28.8,8,0.00),(10400,'EASTC',1,'2013-05-21','2013-05-21','2013-05-21',3,83.93,35,14.4,35,0.00),(10401,'RATTC',1,'2013-05-21','2013-05-21','2013-05-21',1,12.51,30,20.7,18,0.00),(10401,'RATTC',1,'2013-05-21','2013-05-21','2013-05-21',1,12.51,56,30.4,70,0.00),(10401,'RATTC',1,'2013-05-21','2013-05-21','2013-05-21',1,12.51,65,16.8,20,0.00),(10401,'RATTC',1,'2013-05-21','2013-05-21','2013-05-21',1,12.51,71,17.2,60,0.00),(10406,'QUEEN',7,'2013-05-21','2013-05-21','2013-05-21',1,108.04,21,8,30,0.10),(10406,'QUEEN',7,'2013-05-21','2013-05-21','2013-05-21',1,108.04,28,36.4,42,0.10),(10406,'QUEEN',7,'2013-05-21','2013-05-21','2013-05-21',1,108.04,36,15.2,5,0.10),(10406,'QUEEN',7,'2013-05-21','2013-05-21','2013-05-21',1,108.04,40,14.7,2,0.10),(10410,'BOTTM',3,'2013-05-21','2013-05-21','2013-05-21',3,2.40,33,2,49,0.00),(10411,'BOTTM',9,'2013-05-21','2013-05-21','2013-05-21',3,23.65,44,15.5,40,0.20),(10411,'BOTTM',9,'2013-05-21','2013-05-21','2013-05-21',3,23.65,59,44,9,0.20),(10435,'CONSH',8,'2013-05-21','2013-05-21','2013-05-21',2,9.21,2,15.2,10,0.00),(10435,'CONSH',8,'2013-05-21','2013-05-21','2013-05-21',2,9.21,72,27.8,10,0.00),(10438,'TOMSP',3,'2013-05-21','2013-05-21','2013-05-21',2,8.24,19,7.3,15,0.20),(10438,'TOMSP',3,'2013-05-21','2013-05-21','2013-05-21',2,8.24,34,11.2,20,0.20),(10438,'TOMSP',3,'2013-05-21','2013-05-21','2013-05-21',2,8.24,57,15.6,15,0.20),(10441,'OLDWO',3,'2013-05-21','2013-05-21','2013-05-21',2,73.02,27,35.1,50,0.00),(10471,'BSBEV',2,'2013-05-21','2013-05-21','2013-05-21',3,45.59,7,24,30,0.00),(10471,'BSBEV',2,'2013-05-21','2013-05-21','2013-05-21',3,45.59,56,30.4,20,0.00),(10472,'SEVES',8,'2013-05-21','2013-05-21','2013-05-21',1,4.20,24,3.6,80,0.05),(10472,'SEVES',8,'2013-05-21','2013-05-21','2013-05-21',1,4.20,51,42.4,18,0.00),(10495,'LAUGB',3,'2013-05-21','2013-05-21','2013-05-21',3,4.65,23,7.2,10,0.00),(10495,'LAUGB',3,'2013-05-21','2013-05-21','2013-05-21',3,4.65,41,7.7,20,0.00),(10495,'LAUGB',3,'2013-05-21','2013-05-21','2013-05-21',3,4.65,77,10.4,5,0.00),(10497,'LEHMS',7,'2013-05-21','2013-05-21','2013-05-21',1,36.21,56,30.4,14,0.00),(10497,'LEHMS',7,'2013-05-21','2013-05-21','2013-05-21',1,36.21,72,27.8,25,0.00),(10497,'LEHMS',7,'2013-05-21','2013-05-21','2013-05-21',1,36.21,77,10.4,25,0.00),(10498,'HILAA',8,'2013-05-21','2013-05-21','2013-05-21',2,29.75,24,4.5,14,0.00),(10498,'HILAA',8,'2013-05-21','2013-05-21','2013-05-21',2,29.75,40,18.4,5,0.00),(10503,'HUNGO',6,'2013-05-21','2013-05-21','2013-05-21',2,16.74,14,23.25,70,0.00),(10503,'HUNGO',6,'2013-05-21','2013-05-21','2013-05-21',2,16.74,65,21.05,20,0.00),(10523,'SEVES',7,'2013-05-21','2013-05-21','2013-05-21',2,77.63,17,39,25,0.10),(10529,'MAISD',5,'2013-05-21','2013-05-21','2013-05-21',2,66.69,55,24,14,0.00),(10529,'MAISD',5,'2013-05-21','2013-05-21','2013-05-21',2,66.69,68,12.5,20,0.00),(10529,'MAISD',5,'2013-05-21','2013-05-21','2013-05-21',2,66.69,69,36,10,0.00),(10532,'EASTC',7,'2013-05-21','2013-05-21','2013-05-21',3,74.46,30,25.89,15,0.00),(10532,'EASTC',7,'2013-05-21','2013-05-21','2013-05-21',3,74.46,66,17,24,0.00),(10534,'LEHMS',8,'2013-05-21','2013-05-21','2013-05-21',2,27.94,30,25.89,10,0.00),(10534,'LEHMS',8,'2013-05-21','2013-05-21','2013-05-21',2,27.94,40,18.4,10,0.20),(10534,'LEHMS',8,'2013-05-21','2013-05-21','2013-05-21',2,27.94,54,7.45,10,0.20),(10558,'AROUT',1,'2013-05-21','2013-05-21','2013-05-21',2,72.97,47,9.5,25,0.00),(10558,'AROUT',1,'2013-05-21','2013-05-21','2013-05-21',2,72.97,51,53,20,0.00),(10558,'AROUT',1,'2013-05-21','2013-05-21','2013-05-21',2,72.97,52,7,30,0.00),(10558,'AROUT',1,'2013-05-21','2013-05-21','2013-05-21',2,72.97,53,32.8,18,0.00),(10558,'AROUT',1,'2013-05-21','2013-05-21','2013-05-21',2,72.97,73,15,3,0.00),(10620,'LAUGB',2,'2013-05-21','2013-05-21','2013-05-21',3,0.94,24,4.5,5,0.00),(10620,'LAUGB',2,'2013-05-21','2013-05-21','2013-05-21',3,0.94,52,7,5,0.00),(10621,'ISLAT',4,'2013-05-21','2013-05-21','2013-05-21',2,23.73,19,9.2,5,0.00),(10624,'THECR',4,'2013-05-21','2013-05-21','2013-05-21',2,94.80,28,45.6,10,0.00),(10624,'THECR',4,'2013-05-21','2013-05-21','2013-05-21',2,94.80,29,123.79,6,0.00),(10624,'THECR',4,'2013-05-21','2013-05-21','2013-05-21',2,94.80,44,19.45,10,0.00),(10625,'ANATR',3,'2013-05-21','2013-05-21','2013-05-21',1,43.90,14,23.25,3,0.00),(10625,'ANATR',3,'2013-05-21','2013-05-21','2013-05-21',1,43.90,42,14,5,0.00),(10625,'ANATR',3,'2013-05-21','2013-05-21','2013-05-21',1,43.90,60,34,10,0.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` int NOT NULL,
  `productName` varchar(255) NOT NULL,
  `categoryID` int DEFAULT NULL,
  `supplierID` int DEFAULT NULL,
  `quantityPerUnit` varchar(255) DEFAULT NULL,
  `product_unitPrice` decimal(10,2) DEFAULT NULL,
  `unitsInStock` int DEFAULT NULL,
  `unitsOnOrder` int DEFAULT NULL,
  `reorderLevel` int DEFAULT NULL,
  `discontinued` tinyint DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productName_UNIQUE` (`productName`),
  KEY `Supplier_fk_idx` (`supplierID`),
  KEY `Category_fk_idx` (`categoryID`),
  CONSTRAINT `Category_fk` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Supplier_fk` FOREIGN KEY (`supplierID`) REFERENCES `suppliers` (`supplierID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Chang',1,1,'24 - 12 oz bottles',19.00,17,40,25,0),(7,'Uncle Bob\'s Organic Dried Pears',7,3,'12 - 1 lb pkgs.',30.00,15,0,10,0),(10,'Ikura',8,4,'12 - 200 ml jars',31.00,31,0,0,0),(13,'Konbu',8,6,'2 kg box',6.00,24,0,5,0),(14,'Tofu',7,6,'40 - 100 g pkgs.',23.25,35,0,0,0),(16,'Pavlova',3,7,'32 - 500 g boxes',17.45,29,0,10,0),(17,'Alice Mutton',6,7,'20 - 1 kg tins',39.00,0,0,0,1),(18,'Carnarvon Tigers',8,7,'16 kg pkg.',62.50,42,0,0,0),(19,'Teatime Chocolate Biscuits',3,8,'10 boxes x 12 pieces',9.20,25,0,5,0),(20,'Sir Rodney\'s Marmalade',3,8,'30 gift boxes',81.00,40,0,0,0),(21,'Sir Rodney\'s Scones',3,8,'24 pkgs. x 4 pieces',10.00,3,40,5,0),(23,'Tunnbröd',5,9,'12 - 250 g pkgs.',9.00,61,0,25,0),(24,'Guaraná Fantástica',1,10,'12 - 355 ml cans',4.50,20,0,0,1),(27,'Schoggi Schokolade',3,11,'100 - 100 g pieces',43.90,49,0,30,0),(28,'Rössle Sauerkraut',7,12,'25 - 825 g cans',45.60,26,0,0,1),(29,'Thüringer Rostbratwurst',6,12,'50 bags x 30 sausgs.',123.79,0,0,0,1),(30,'Nord-Ost Matjeshering',8,13,'10 - 200 g glasses',25.89,10,0,15,0),(31,'Gorgonzola Telino',4,14,'12 - 100 g pkgs',12.50,0,70,20,0),(33,'Geitost',4,15,'500 g',2.50,112,0,20,0),(34,'Sasquatch Ale',1,16,'24 - 12 oz bottles',14.00,111,0,15,0),(35,'Steeleye Stout',1,16,'24 - 12 oz bottles',18.00,20,0,15,0),(36,'Inlagd Sill',8,17,'24 - 250 g  jars',19.00,112,0,20,0),(38,'Côte de Blaye',1,18,'12 - 75 cl bottles',263.50,17,0,15,0),(39,'Chartreuse verte',1,18,'750 cc per bottle',18.00,69,0,5,0),(40,'Boston Crab Meat',8,19,'24 - 4 oz tins',18.40,123,0,30,0),(41,'Jack\'s New England Clam Chowder',8,19,'12 - 12 oz cans',9.65,85,0,10,0),(42,'Singaporean Hokkien Fried Mee',5,20,'32 - 1 kg pkgs.',14.00,26,0,0,1),(44,'Gula Malacca',2,20,'20 - 2 kg bags',19.45,27,0,15,0),(47,'Zaanse koeken',3,22,'10 - 4 oz boxes',9.50,36,0,0,0),(49,'Maxilaku',3,23,'24 - 50 g pkgs.',20.00,10,60,15,0),(51,'Manjimup Dried Apples',7,24,'50 - 300 g pkgs.',53.00,20,0,10,0),(52,'Filo Mix',5,24,'16 - 2 kg boxes',7.00,38,0,25,0),(53,'Perth Pasties',6,24,'48 pieces',32.80,0,0,0,1),(54,'Tourtière',6,25,'16 pies',7.45,21,0,10,0),(55,'Pâté chinois',6,25,'24 boxes x 2 pies',24.00,115,0,20,0),(56,'Gnocchi di nonna Alice',5,26,'24 - 250 g pkgs.',38.00,21,10,30,0),(57,'Ravioli Angelo',5,26,'24 - 250 g pkgs.',19.50,36,0,20,0),(58,'Escargots de Bourgogne',8,27,'24 pieces',13.25,62,0,20,0),(59,'Raclette Courdavault',4,28,'5 kg pkg.',55.00,79,0,0,0),(60,'Camembert Pierrot',4,28,'15 - 300 g rounds',34.00,19,0,0,0),(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05,76,0,0,0),(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17.00,4,100,20,0),(68,'Scottish Longbreads',3,8,'10 boxes x 8 pieces',12.50,6,10,15,0),(69,'Gudbrandsdalsost',4,15,'10 kg pkg.',36.00,26,0,15,0),(71,'Flotemysost',4,15,'10 - 500 g pkgs.',21.50,26,0,0,0),(72,'Mozzarella di Giovanni',4,14,'24 - 200 g pkgs.',34.80,14,0,0,0),(73,'Röd Kaviar',8,17,'24 - 150 g jars',15.00,101,0,5,0),(76,'Lakkalikööri',1,23,'500 ml',18.00,57,0,20,0),(77,'Original Frankfurter grüne Soße',2,12,'12 boxes',13.00,32,0,15,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplierID` int NOT NULL AUTO_INCREMENT,
  `supplierCompanyName` varchar(255) NOT NULL,
  `supplierContactName` varchar(255) NOT NULL,
  `supplierContactTitle` varchar(255) NOT NULL,
  PRIMARY KEY (`supplierID`),
  UNIQUE KEY `supplierID_UNIQUE` (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Exotic Liquids Suppliers','Cooper Limited','Purchasing Manager'),(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator'),(3,'Kella Homestead','Regina Murphy','Sales Representative'),(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager'),(6,'Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(7,'Pavlova Ltd','Pavlova Ltd','Ian Devling'),(8,'Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(9,'PB Limited','Lars Peterson','Sales Agent'),(10,'Frescos Americanas LTD','Carlos Diaz','Marketing Manager'),(11,'Heli Limited','Petra Winkler','Sales Manager'),(12,'Pluto Limited','Martin Bein','International Marketing Mgr.'),(13,'Nord Suppliers','Sven Petersen','Coordinator Foreign Markets'),(14,'Formanta Supply Limited','Elio Rossi','Sales Representative'),(15,'Nord Suppliers','Beate Vileid','Marketing Manager'),(16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.'),(17,'Sven AB','Michael Björn','Sales Representative'),(18,'Atom Suppliers','Greene Nodier','Sales Manager'),(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(20,'Leka Trading','Chandra Leka','Owner'),(22,'Zaam Snowpick','Dirk Luchte','Accounting Manager'),(23,'Kart Kouriers','Anne Heikkonen','Product Manager'),(24,'Gooday',' Mate','Wendy Mackenzie'),(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager'),(26,'Pasta bris Limited','Giovanni Giudici','Order Administrator'),(27,'Escar Nouve Limited','Marie Delamare','Sales Manager'),(28,'Gabaana','Eliane Noz','Sales Representative');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpaakasa`
--

DROP TABLE IF EXISTS `tblpaakasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblpaakasa` (
  `orderID` int DEFAULT NULL,
  `customerID` char(5) DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `requiredDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `shipVia` int DEFAULT NULL,
  `Freight` decimal(10,2) DEFAULT NULL,
  `productID` int DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `discount` decimal(4,2) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `contactTitle` varchar(255) DEFAULT NULL,
  `employees_lastName` varchar(255) DEFAULT NULL,
  `employees_firstName` varchar(255) DEFAULT NULL,
  `employees_title` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `supplierID` int DEFAULT NULL,
  `categoryID` int DEFAULT NULL,
  `quantityPerUnit` varchar(255) DEFAULT NULL,
  `product_unitPrice` decimal(10,2) DEFAULT NULL,
  `unitPrice_1` decimal(10,2) DEFAULT NULL,
  `unitsInStock` int DEFAULT NULL,
  `unitsOnOrder` int DEFAULT NULL,
  `reorderLevel` int DEFAULT NULL,
  `discontinued` tinyint DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `supplierCompanyName` varchar(255) DEFAULT NULL,
  `supplierContactName` varchar(255) DEFAULT NULL,
  `supplierContactTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpaakasa`
--

LOCK TABLES `tblpaakasa` WRITE;
/*!40000 ALTER TABLE `tblpaakasa` DISABLE KEYS */;
INSERT INTO `tblpaakasa` VALUES (10272,'RATTC',6,'1996-02-08','1996-02-09','1996-06-08',2,98.03,72,27.80,24,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Suyama','Michael','Sales Representative','Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.80,34.80,14,0,0,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10249,'TOMSP',6,'1996-05-07','1996-02-10','1996-10-07',1,11.61,14,18.60,9,0.00,'Toms Special','Karin Josephs','Marketing Manager','Suyama','Michael','Sales Representative','Tofu',6,7,'40 - 100 g pkgs.',23.25,23.25,35,0,0,0,'Produce','Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(10249,'TOMSP',6,'1996-05-07','1996-02-11','1996-10-07',1,11.61,51,42.40,40,0.00,'Toms Special','Karin Josephs','Marketing Manager','Suyama','Michael','Sales Representative','Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53.00,53.00,20,0,10,0,'Produce','Gooday',' Mate','Wendy Mackenzie'),(10250,'HANAR',4,'1996-08-07','1996-05-08','1996-12-07',2,65.83,51,42.40,35,0.15,'Hana Canes Limited','Mario Pontes','Accounting Manager','Peacock','Margaret','Sales Representative','Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53.00,53.00,20,0,10,0,'Produce','Gooday',' Mate','Wendy Mackenzie'),(10255,'RICSU',9,'1996-12-07','1996-09-08','1996-12-08',3,148.33,59,44.00,30,0.00,'Richter Supermarkt','Michael Holz','Sales Manager','Dodsworth','Anne','Sales Representative','Raclette Courdavault',28,4,'5 kg pkg.',55.00,55.00,79,0,0,0,'Dairy Products','Gabaana','Eliane Noz','Sales Representative'),(10250,'HANAR',4,'1996-08-07','1996-05-08','1996-12-07',2,65.83,41,7.70,10,0.00,'Hana Canes Limited','Mario Pontes','Accounting Manager','Peacock','Margaret','Sales Representative','Jack\'s New England Clam Chowder',19,8,'12 - 12 oz cans',9.65,9.65,85,0,10,0,'Seafood','New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(10255,'RICSU',9,'1996-12-07','1996-09-08','1996-12-08',3,148.33,16,13.90,35,0.00,'Richter Supermarkt','Michael Holz','Sales Manager','Dodsworth','Anne','Sales Representative','Pavlova',7,3,'32 - 500 g boxes',17.45,17.45,29,0,10,0,'Confections','Pavlova Ltd','Pavlova Ltd','Ian Devling'),(10253,'HANAR',3,'1996-10-07','1996-09-09','1996-12-09',2,58.17,31,10.00,20,0.00,'Hana Canes Limited','Mario Pontes','Accounting Manager','Leverling','Janet','Sales Representative','Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.50,12.50,0,70,20,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10272,'RATTC',6,'1996-02-08','1996-09-10','1996-06-08',2,98.03,31,10.00,40,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Suyama','Michael','Sales Representative','Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.50,12.50,0,70,20,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10253,'HANAR',3,'1996-10-07','1996-09-11','1996-06-09',2,58.17,49,16.00,40,0.00,'Hana Canes Limited','Mario Pontes','Accounting Manager','Leverling','Janet','Sales Representative','Maxilaku',23,3,'24 - 50 g pkgs.',20.00,20.00,10,60,15,0,'Confections','Kart Kouriers','Anne Heikkonen','Product Manager'),(10272,'RATTC',6,'1996-02-08','1996-09-12','1996-06-08',2,98.03,20,64.80,6,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Suyama','Michael','Sales Representative','Sir Rodney\'s Marmalade',8,3,'30 gift boxes',81.00,81.00,40,0,0,0,'Confections','Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(10255,'RICSU',9,'1996-12-07','1996-09-08','1996-06-09',3,148.33,36,15.20,25,0.00,'Richter Supermarkt','Michael Holz','Sales Manager','Dodsworth','Anne','Sales Representative','Inlagd Sill',17,8,'24 - 250 g  jars',19.00,19.00,112,0,20,0,'Seafood','Sven AB','Michael Björn','Sales Representative'),(10273,'QUICK',3,'1996-05-08','1996-02-09','1996-12-08',3,76.07,10,24.80,24,0.05,'Quick Shooters ','Horst Kloss','Accounting Manager','Leverling','Janet','Sales Representative','Ikura',4,8,'12 - 200 ml jars',31.00,31.00,31,0,0,0,'Seafood','Tokyo Traders','Yoshi Nagase','Marketing Manager'),(10273,'QUICK',3,'1996-05-08','1996-02-09','1996-12-08',3,76.07,31,10.00,15,0.05,'Quick Shooters ','Horst Kloss','Accounting Manager','Leverling','Janet','Sales Representative','Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.50,12.50,0,70,20,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10273,'QUICK',3,'1996-05-08','1996-02-09','1996-12-08',3,76.07,33,2.00,20,0.00,'Quick Shooters ','Horst Kloss','Accounting Manager','Leverling','Janet','Sales Representative','Geitost',15,4,'500 g',2.50,2.50,112,0,20,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10273,'QUICK',3,'1996-05-08','1996-02-09','1996-12-08',3,76.07,40,14.70,60,0.05,'Quick Shooters ','Horst Kloss','Accounting Manager','Leverling','Janet','Sales Representative','Boston Crab Meat',19,8,'24 - 4 oz tins',18.40,18.40,123,0,30,0,'Seafood','New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(10273,'QUICK',3,'1996-05-08','1996-02-09','1996-12-08',3,76.07,76,14.40,33,0.05,'Quick Shooters ','Horst Kloss','Accounting Manager','Leverling','Janet','Sales Representative','Lakkalikööri',23,1,'500 ml',18.00,18.00,57,0,20,0,'Beverages','Kart Kouriers','Anne Heikkonen','Product Manager'),(10276,'TORTU',8,'1996-08-08','1996-02-10','1996-12-09',3,13.84,10,24.80,15,0.00,'Top Restaurant','Miguel Angel Paolino','Owner','Callahan','Laura','Inside Sales Coordinator','Ikura',4,8,'12 - 200 ml jars',31.00,31.00,31,0,0,0,'Seafood','Tokyo Traders','Yoshi Nagase','Marketing Manager'),(10276,'TORTU',8,'1996-08-08','1996-02-11','1996-12-10',3,13.84,13,4.80,10,0.00,'Top Restaurant','Miguel Angel Paolino','Owner','Callahan','Laura','Inside Sales Coordinator','Konbu',6,8,'2 kg box',6.00,6.00,24,0,5,0,'Seafood','Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(10293,'TORTU',1,'1996-08-29','1996-02-12','1996-11-09',3,21.18,18,50.00,12,0.00,'Top Restaurant','Miguel Angel Paolino','Owner','Davolio','Nancy','Sales Representative','Carnarvon Tigers',7,8,'16 kg pkg.',62.50,62.50,42,0,0,0,'Seafood','Pavlova Ltd','Pavlova Ltd','Ian Devling'),(10298,'HUNGO',6,'1996-05-09','1996-03-10','1996-11-09',2,168.22,2,15.20,40,0.00,'All Night Grocers ','Patricia AKena','Sales Associate','Suyama','Michael','Sales Representative','Chang',1,1,'24 - 12 oz bottles',19.00,19.00,17,40,25,0,'Beverages','Exotic Liquids Suppliers','Cooper Limited','Purchasing Manager'),(10298,'HUNGO',6,'1996-05-09','1996-03-10','1996-11-09',2,168.22,36,15.20,40,0.25,'All Night Grocers ','Patricia AKena','Sales Associate','Suyama','Michael','Sales Representative','Inlagd Sill',17,8,'24 - 250 g  jars',19.00,19.00,112,0,20,0,'Seafood','Sven AB','Michael Björn','Sales Representative'),(10304,'TORTU',1,'1996-12-09','1996-10-10','1996-11-10',2,63.79,49,16.00,30,0.00,'Top Restaurant','Miguel Angel Paolino','Owner','Davolio','Nancy','Sales Representative','Maxilaku',23,3,'24 - 50 g pkgs.',20.00,20.00,10,60,15,0,'Confections','Kart Kouriers','Anne Heikkonen','Product Manager'),(10304,'TORTU',1,'1996-12-09','1996-10-10','1996-11-11',2,63.79,59,44.00,10,0.00,'Top Restaurant','Miguel Angel Paolino','Owner','Davolio','Nancy','Sales Representative','Raclette Courdavault',28,4,'5 kg pkg.',55.00,55.00,79,0,0,0,'Dairy Products','Gabaana','Eliane Noz','Sales Representative'),(10304,'TORTU',1,'1996-12-09','1996-10-10','1996-11-12',2,63.79,71,17.20,2,0.00,'Top Restaurant','Miguel Angel Paolino','Owner','Davolio','Nancy','Sales Representative','Flotemysost',15,4,'10 - 500 g pkgs.',21.50,21.50,26,0,0,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10321,'ISLAT',3,'1996-03-10','1996-10-11','1996-11-10',2,3.43,35,14.40,10,0.00,'Islands Traders','Helen Bennett','Marketing Manager','Leverling','Janet','Sales Representative','Steeleye Stout',16,1,'24 - 12 oz bottles',18.00,18.00,20,0,15,0,'Beverages','Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.'),(10346,'RATTC',3,'1996-05-11','1996-10-14','1996-08-11',3,142.08,56,30.40,20,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Leverling','Janet','Sales Representative','Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38.00,38.00,21,10,30,0,'Grains/Cereals','Pasta bris Limited','Giovanni Giudici','Order Administrator'),(10372,'QUEEN',5,'1996-04-12','1997-01-01','1996-09-12',2,890.78,20,64.80,12,0.25,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','Buchanan','Steven','Sales Manager','Sir Rodney\'s Marmalade',8,3,'30 gift boxes',81.00,81.00,40,0,0,0,'Confections','Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(10372,'QUEEN',5,'1996-04-12','1997-01-01','1996-09-12',2,890.78,38,210.80,40,0.25,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','Buchanan','Steven','Sales Manager','Côte de Blaye',18,1,'12 - 75 cl bottles',263.50,263.50,17,0,15,0,'Beverages','Atom Suppliers','Greene Nodier','Sales Manager'),(10372,'QUEEN',5,'1996-04-12','1997-01-01','1996-09-12',2,890.78,60,27.20,70,0.25,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','Buchanan','Steven','Sales Manager','Camembert Pierrot',28,4,'15 - 300 g rounds',34.00,34.00,19,0,0,0,'Dairy Products','Gabaana','Eliane Noz','Sales Representative'),(10372,'QUEEN',5,'1996-04-12','1997-01-01','1996-09-12',2,890.78,72,27.80,42,0.25,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','Buchanan','Steven','Sales Manager','Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.80,34.80,14,0,0,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10373,'HUNGO',4,'1996-05-12','1997-02-01','1996-11-12',3,124.12,58,10.60,80,0.20,'All Night Grocers ','Patricia AKena','Sales Associate','Peacock','Margaret','Sales Representative','Escargots de Bourgogne',27,8,'24 pieces',13.25,13.25,62,0,20,0,'Seafood','Escar Nouve Limited','Marie Delamare','Sales Manager'),(10373,'HUNGO',4,'1996-05-12','1997-02-01','1996-11-12',3,124.12,71,17.20,50,0.20,'All Night Grocers ','Patricia AKena','Sales Associate','Peacock','Margaret','Sales Representative','Flotemysost',15,4,'10 - 500 g pkgs.',21.50,21.50,26,0,0,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10375,'HUNGC',3,'1996-06-12','1997-03-01','1996-09-12',2,20.12,14,18.60,15,0.00,'Coyote Import Store','Yoshi Latimer','Sales Representative','Leverling','Janet','Sales Representative','Tofu',6,7,'40 - 100 g pkgs.',23.25,23.25,35,0,0,0,'Produce','Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(10377,'SEVES',1,'1996-09-12','1997-06-01','1996-09-13',3,22.21,28,36.40,20,0.15,'Seven Seas Imports','Hari Kumar','Sales Manager','Davolio','Nancy','Sales Representative','Rössle Sauerkraut',12,7,'25 - 825 g cans',45.60,45.60,26,0,0,1,'Produce','Pluto Limited','Martin Bein','International Marketing Mgr.'),(10377,'SEVES',1,'1996-09-12','1997-06-01','1996-09-14',3,22.21,39,14.40,20,0.15,'Seven Seas Imports','Hari Kumar','Sales Manager','Davolio','Nancy','Sales Representative','Chartreuse verte',18,1,'750 cc per bottle',18.00,18.00,69,0,5,0,'Beverages','Atom Suppliers','Greene Nodier','Sales Manager'),(10380,'HUNGO',8,'1996-12-12','1997-09-01','1996-09-15',3,35.03,30,20.70,18,0.10,'All Night Grocers ','Patricia AKena','Sales Associate','Callahan','Laura','Inside Sales Coordinator','Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89,25.89,10,0,15,0,'Seafood','Nord Suppliers','Sven Petersen','Coordinator Foreign Markets'),(10380,'HUNGO',8,'1996-12-12','1997-09-01','1996-09-16',3,35.03,53,26.20,20,0.10,'All Night Grocers ','Patricia AKena','Sales Associate','Callahan','Laura','Inside Sales Coordinator','Perth Pasties',24,6,'48 pieces',32.80,32.80,0,0,0,1,'Meat/Poultry','Gooday',' Mate','Wendy Mackenzie'),(10395,'HILAA',6,'1996-12-13','1997-09-02','1997-03-01',1,184.41,69,28.80,8,0.00,'Hero Abas and Sons Limited','Carlos Hernández','Sales Representative','Suyama','Michael','Sales Representative','Gudbrandsdalsost',15,4,'10 kg pkg.',36.00,36.00,26,0,15,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10400,'EASTC',1,'1997-01-01','1997-09-03','1997-03-02',3,83.93,35,14.40,35,0.00,'Eastern Connection','Ann Devon','Sales Agent','Davolio','Nancy','Sales Representative','Steeleye Stout',16,1,'24 - 12 oz bottles',18.00,18.00,20,0,15,0,'Beverages','Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.'),(10401,'RATTC',1,'1997-01-01','1997-09-04','1997-10-01',1,12.51,30,20.70,18,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Davolio','Nancy','Sales Representative','Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89,25.89,10,0,15,0,'Seafood','Nord Suppliers','Sven Petersen','Coordinator Foreign Markets'),(10401,'RATTC',1,'1997-01-01','1997-09-05','1997-10-01',1,12.51,56,30.40,70,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Davolio','Nancy','Sales Representative','Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38.00,38.00,21,10,30,0,'Grains/Cereals','Pasta bris Limited','Giovanni Giudici','Order Administrator'),(10401,'RATTC',1,'1997-01-01','1997-09-06','1997-10-01',1,12.51,65,16.80,20,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Davolio','Nancy','Sales Representative','Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05,21.05,76,0,0,0,'Condiments','New Orleans Cajun Delights','Shelley Burke','Order Administrator'),(10401,'RATTC',1,'1997-01-01','1997-09-07','1997-10-01',1,12.51,71,17.20,60,0.00,'Canyon Grocery','Paula Wilson','Assistant Sales Representative','Davolio','Nancy','Sales Representative','Flotemysost',15,4,'10 - 500 g pkgs.',21.50,21.50,26,0,0,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10406,'QUEEN',7,'1997-07-01','1997-09-09','1997-10-03',1,108.04,21,8.00,30,0.10,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','King','Robert','Sales Representative','Sir Rodney\'s Scones',8,3,'24 pkgs. x 4 pieces',10.00,10.00,3,40,5,0,'Confections','Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(10406,'QUEEN',7,'1997-07-01','1997-09-10','1997-10-04',1,108.04,28,36.40,42,0.10,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','King','Robert','Sales Representative','Rössle Sauerkraut',12,7,'25 - 825 g cans',45.60,45.60,26,0,0,1,'Produce','Pluto Limited','Martin Bein','International Marketing Mgr.'),(10406,'QUEEN',7,'1997-07-01','1997-09-11','1997-10-05',1,108.04,36,15.20,5,0.10,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','King','Robert','Sales Representative','Inlagd Sill',17,8,'24 - 250 g  jars',19.00,19.00,112,0,20,0,'Seafood','Sven AB','Michael Björn','Sales Representative'),(10406,'QUEEN',7,'1997-07-01','1997-09-12','1997-10-06',1,108.04,40,14.70,2,0.10,'Queen Cousins','Lúcia Carvalho','Marketing Assistant','King','Robert','Sales Representative','Boston Crab Meat',19,8,'24 - 4 oz tins',18.40,18.40,123,0,30,0,'Seafood','New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(10410,'BOTTM',3,'1997-10-01','1997-07-02','1997-10-07',3,2.40,33,2.00,49,0.00,'Botta Markets Limited','Elizabeth Lincoln','Accounting Manager','Leverling','Janet','Sales Representative','Geitost',15,4,'500 g',2.50,2.50,112,0,20,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10411,'BOTTM',9,'1997-10-01','1997-07-02','1997-10-08',3,23.65,44,15.50,40,0.20,'Botta Markets Limited','Elizabeth Lincoln','Accounting Manager','Dodsworth','Anne','Sales Representative','Gula Malacca',20,2,'20 - 2 kg bags',19.45,19.45,27,0,15,0,'Condiments','Leka Trading','Chandra Leka','Owner'),(10411,'BOTTM',9,'1997-10-01','1997-07-02','1997-10-09',3,23.65,59,44.00,9,0.20,'Botta Markets Limited','Elizabeth Lincoln','Accounting Manager','Dodsworth','Anne','Sales Representative','Raclette Courdavault',28,4,'5 kg pkg.',55.00,55.00,79,0,0,0,'Dairy Products','Gabaana','Eliane Noz','Sales Representative'),(10435,'CONSH',8,'1997-04-02','1997-07-03','1997-07-02',2,9.21,2,15.20,10,0.00,'Consolidated Holdings','Elizabeth Brown','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Chang',1,1,'24 - 12 oz bottles',19.00,19.00,17,40,25,0,'Beverages','Exotic Liquids Suppliers','Cooper Limited','Purchasing Manager'),(10435,'CONSH',8,'1997-04-02','1997-07-04','1997-07-02',2,9.21,72,27.80,10,0.00,'Consolidated Holdings','Elizabeth Brown','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.80,34.80,14,0,0,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10438,'TOMSP',3,'1997-06-02','1997-06-03','1997-07-03',2,8.24,19,7.30,15,0.20,'Toms Special','Karin Josephs','Marketing Manager','Leverling','Janet','Sales Representative','Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9.20,9.20,25,0,5,0,'Confections','Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(10438,'TOMSP',3,'1997-06-02','1997-06-03','1997-07-04',2,8.24,34,11.20,20,0.20,'Toms Special','Karin Josephs','Marketing Manager','Leverling','Janet','Sales Representative','Sasquatch Ale',16,1,'24 - 12 oz bottles',14.00,14.00,111,0,15,0,'Beverages','Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.'),(10438,'TOMSP',3,'1997-06-02','1997-06-03','1997-07-05',2,8.24,57,15.60,15,0.20,'Toms Special','Karin Josephs','Marketing Manager','Leverling','Janet','Sales Representative','Ravioli Angelo',26,5,'24 - 250 g pkgs.',19.50,19.50,36,0,20,0,'Grains/Cereals','Pasta bris Limited','Giovanni Giudici','Order Administrator'),(10441,'OLDWO',3,'1997-10-02','1997-06-04','1997-07-06',2,73.02,27,35.10,50,0.00,'Old World Delicacies','Rene Phillips','Sales Representative','Leverling','Janet','Sales Representative','Schoggi Schokolade',11,3,'100 - 100 g pieces',43.90,43.90,49,0,30,0,'Confections','Heli Limited','Petra Winkler','Sales Manager'),(10471,'BSBEV',2,'1997-11-03','1997-08-04','1997-07-10',3,45.59,7,24.00,30,0.00,'Basana Beverages','Victoria Ashworth','Sales Representative','Fuller','Andrew','Vice President, Sales','Uncle Bob\'s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30.00,30.00,15,0,10,0,'Produce','Kella Homestead','Regina Murphy','Sales Representative'),(10471,'BSBEV',2,'1997-11-03','1997-08-04','1997-07-11',3,45.59,56,30.40,20,0.00,'Basana Beverages','Victoria Ashworth','Sales Representative','Fuller','Andrew','Vice President, Sales','Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38.00,38.00,21,10,30,0,'Grains/Cereals','Pasta bris Limited','Giovanni Giudici','Order Administrator'),(10472,'SEVES',8,'1997-12-03','1997-09-04','1997-07-12',1,4.20,24,3.60,80,0.05,'Seven Seas Imports','Hari Kumar','Sales Manager','Callahan','Laura','Inside Sales Coordinator','Guaraná Fantástica',10,1,'12 - 355 ml cans',4.50,4.50,20,0,0,1,'Beverages','Frescos Americanas LTD','Carlos Diaz','Marketing Manager'),(10472,'SEVES',8,'1997-12-03','1997-09-04','1997-07-13',1,4.20,51,42.40,18,0.00,'Seven Seas Imports','Hari Kumar','Sales Manager','Callahan','Laura','Inside Sales Coordinator','Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53.00,53.00,20,0,10,0,'Produce','Gooday',' Mate','Wendy Mackenzie'),(10495,'LAUGB',3,'1997-03-04','1997-01-05','1997-11-04',3,4.65,23,7.20,10,0.00,'Baker Wine Cellars','Yoshi Tannamuri','Marketing Assistant','Leverling','Janet','Sales Representative','Tunnbröd',9,5,'12 - 250 g pkgs.',9.00,9.00,61,0,25,0,'Grains/Cereals','PB Limited','Lars Peterson','Sales Agent'),(10495,'LAUGB',3,'1997-03-04','1997-01-05','1997-11-04',3,4.65,41,7.70,20,0.00,'Baker Wine Cellars','Yoshi Tannamuri','Marketing Assistant','Leverling','Janet','Sales Representative','Jack\'s New England Clam Chowder',19,8,'12 - 12 oz cans',9.65,9.65,85,0,10,0,'Seafood','New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(10495,'LAUGB',3,'1997-03-04','1997-01-05','1997-11-04',3,4.65,77,10.40,5,0.00,'Baker Wine Cellars','Yoshi Tannamuri','Marketing Assistant','Leverling','Janet','Sales Representative','Original Frankfurter grüne Soße',12,2,'12 boxes',13.00,13.00,32,0,15,0,'Condiments','Pluto Limited','Martin Bein','International Marketing Mgr.'),(10497,'LEHMS',7,'1997-04-04','1997-02-05','1997-07-04',1,36.21,56,30.40,14,0.00,'Lehmanns Marketing','Renate Messner','Sales Representative','King','Robert','Sales Representative','Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38.00,38.00,21,10,30,0,'Grains/Cereals','Pasta bris Limited','Giovanni Giudici','Order Administrator'),(10497,'LEHMS',7,'1997-04-04','1997-02-05','1997-07-04',1,36.21,72,27.80,25,0.00,'Lehmanns Marketing','Renate Messner','Sales Representative','King','Robert','Sales Representative','Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.80,34.80,14,0,0,0,'Dairy Products','Formanta Supply Limited','Elio Rossi','Sales Representative'),(10497,'LEHMS',7,'1997-04-04','1997-02-05','1997-07-04',1,36.21,77,10.40,25,0.00,'Lehmanns Marketing','Renate Messner','Sales Representative','King','Robert','Sales Representative','Original Frankfurter grüne Soße',12,2,'12 boxes',13.00,13.00,32,0,15,0,'Condiments','Pluto Limited','Martin Bein','International Marketing Mgr.'),(10498,'HILAA',8,'1997-07-04','1997-05-05','1997-11-04',2,29.75,24,4.50,14,0.00,'Hero Abas and Sons Limited','Carlos Hernández','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Guaraná Fantástica',10,1,'12 - 355 ml cans',4.50,4.50,20,0,0,1,'Beverages','Frescos Americanas LTD','Carlos Diaz','Marketing Manager'),(10498,'HILAA',8,'1997-07-04','1997-05-05','1997-11-04',2,29.75,40,18.40,5,0.00,'Hero Abas and Sons Limited','Carlos Hernández','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Boston Crab Meat',19,8,'24 - 4 oz tins',18.40,18.40,123,0,30,0,'Seafood','New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(10503,'HUNGO',6,'1997-11-04','1997-09-05','1997-04-16',2,16.74,14,23.25,70,0.00,'All Night Grocers ','Patricia AKena','Sales Associate','Suyama','Michael','Sales Representative','Tofu',6,7,'40 - 100 g pkgs.',23.25,23.25,35,0,0,0,'Produce','Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(10503,'HUNGO',6,'1997-11-04','1997-09-05','1997-04-17',2,16.74,65,21.05,20,0.00,'All Night Grocers ','Patricia AKena','Sales Associate','Suyama','Michael','Sales Representative','Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05,21.05,76,0,0,0,'Condiments','New Orleans Cajun Delights','Shelley Burke','Order Administrator'),(10523,'SEVES',7,'1997-01-05','1997-09-06','1997-04-22',2,77.63,17,39.00,25,0.10,'Seven Seas Imports','Hari Kumar','Sales Manager','King','Robert','Sales Representative','Alice Mutton',7,6,'20 - 1 kg tins',39.00,39.00,0,0,0,1,'Meat/Poultry','Pavlova Ltd','Pavlova Ltd','Ian Devling'),(10529,'MAISD',5,'1997-07-05','1997-04-06','1997-09-05',2,66.69,55,24.00,14,0.00,'Mason Drew','Catherine Dewey','Sales Agent','Buchanan','Steven','Sales Manager','Pâté chinois',25,6,'24 boxes x 2 pies',24.00,24.00,115,0,20,0,'Meat/Poultry','Ma Maison','Jean-Guy Lauzon','Marketing Manager'),(10529,'MAISD',5,'1997-07-05','1997-04-06','1997-09-05',2,66.69,68,12.50,20,0.00,'Mason Drew','Catherine Dewey','Sales Agent','Buchanan','Steven','Sales Manager','Scottish Longbreads',8,3,'10 boxes x 8 pieces',12.50,12.50,6,10,15,0,'Confections','Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(10529,'MAISD',5,'1997-07-05','1997-04-06','1997-09-05',2,66.69,69,36.00,10,0.00,'Mason Drew','Catherine Dewey','Sales Agent','Buchanan','Steven','Sales Manager','Gudbrandsdalsost',15,4,'10 kg pkg.',36.00,36.00,26,0,15,0,'Dairy Products','Nord Suppliers','Beate Vileid','Marketing Manager'),(10532,'EASTC',7,'1997-09-05','1997-06-06','1997-12-05',3,74.46,30,25.89,15,0.00,'Eastern Connection','Ann Devon','Sales Agent','King','Robert','Sales Representative','Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89,25.89,10,0,15,0,'Seafood','Nord Suppliers','Sven Petersen','Coordinator Foreign Markets'),(10532,'EASTC',7,'1997-09-05','1997-06-06','1997-12-05',3,74.46,66,17.00,24,0.00,'Eastern Connection','Ann Devon','Sales Agent','King','Robert','Sales Representative','Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17.00,17.00,4,100,20,0,'Condiments','New Orleans Cajun Delights','Shelley Burke','Order Administrator'),(10534,'LEHMS',8,'1997-12-05','1997-09-06','1997-05-14',2,27.94,30,25.89,10,0.00,'Lehmanns Marketing','Renate Messner','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89,25.89,10,0,15,0,'Seafood','Nord Suppliers','Sven Petersen','Coordinator Foreign Markets'),(10534,'LEHMS',8,'1997-12-05','1997-09-06','1997-05-14',2,27.94,40,18.40,10,0.20,'Lehmanns Marketing','Renate Messner','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Boston Crab Meat',19,8,'24 - 4 oz tins',18.40,18.40,123,0,30,0,'Seafood','New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(10534,'LEHMS',8,'1997-12-05','1997-09-06','1997-05-14',2,27.94,54,7.45,10,0.20,'Lehmanns Marketing','Renate Messner','Sales Representative','Callahan','Laura','Inside Sales Coordinator','Tourtière',25,6,'16 pies',7.45,7.45,21,0,10,0,'Meat/Poultry','Ma Maison','Jean-Guy Lauzon','Marketing Manager'),(10558,'AROUT',1,'1997-04-06','1997-02-07','1997-10-06',2,72.97,47,9.50,25,0.00,'Around the Horn','Thomas Hardy','Sales Representative','Davolio','Nancy','Sales Representative','Zaanse koeken',22,3,'10 - 4 oz boxes',9.50,9.50,36,0,0,0,'Confections','Zaam Snowpick','Dirk Luchte','Accounting Manager'),(10558,'AROUT',1,'1997-04-06','1997-02-07','1997-10-06',2,72.97,51,53.00,20,0.00,'Around the Horn','Thomas Hardy','Sales Representative','Davolio','Nancy','Sales Representative','Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53.00,53.00,20,0,10,0,'Produce','Gooday',' Mate','Wendy Mackenzie'),(10558,'AROUT',1,'1997-04-06','1997-02-07','1997-10-06',2,72.97,52,7.00,30,0.00,'Around the Horn','Thomas Hardy','Sales Representative','Davolio','Nancy','Sales Representative','Filo Mix',24,5,'16 - 2 kg boxes',7.00,7.00,38,0,25,0,'Grains/Cereals','Gooday',' Mate','Wendy Mackenzie'),(10558,'AROUT',1,'1997-04-06','1997-02-07','1997-10-06',2,72.97,53,32.80,18,0.00,'Around the Horn','Thomas Hardy','Sales Representative','Davolio','Nancy','Sales Representative','Perth Pasties',24,6,'48 pieces',32.80,32.80,0,0,0,1,'Meat/Poultry','Gooday',' Mate','Wendy Mackenzie'),(10558,'AROUT',1,'1997-04-06','1997-02-07','1997-10-06',2,72.97,73,15.00,3,0.00,'Around the Horn','Thomas Hardy','Sales Representative','Davolio','Nancy','Sales Representative','Röd Kaviar',17,8,'24 - 150 g jars',15.00,15.00,101,0,5,0,'Seafood','Sven AB','Michael Björn','Sales Representative'),(10620,'LAUGB',2,'1997-05-08','1997-02-09','1997-08-14',3,0.94,24,4.50,5,0.00,'Baker Wine Cellars','Yoshi Tannamuri','Marketing Assistant','Fuller','Andrew','Vice President, Sales','Guaraná Fantástica',10,1,'12 - 355 ml cans',4.50,4.50,20,0,0,1,'Beverages','Frescos Americanas LTD','Carlos Diaz','Marketing Manager'),(10620,'LAUGB',2,'1997-05-08','1997-02-09','1997-08-14',3,0.94,52,7.00,5,0.00,'Baker Wine Cellars','Yoshi Tannamuri','Marketing Assistant','Fuller','Andrew','Vice President, Sales','Filo Mix',24,5,'16 - 2 kg boxes',7.00,7.00,38,0,25,0,'Grains/Cereals','Gooday',' Mate','Wendy Mackenzie'),(10621,'ISLAT',4,'1997-05-08','1997-02-09','1997-11-08',2,23.73,19,9.20,5,0.00,'Islands Traders','Helen Bennett','Marketing Manager','Peacock','Margaret','Sales Representative','Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9.20,9.20,25,0,5,0,'Confections','Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(10624,'THECR',4,'1997-07-08','1997-04-09','1997-08-19',2,94.80,28,45.60,10,0.00,'The Cracker Box','Liu Wong','Marketing Assistant','Peacock','Margaret','Sales Representative','Rössle Sauerkraut',12,7,'25 - 825 g cans',45.60,45.60,26,0,0,1,'Produce','Pluto Limited','Martin Bein','International Marketing Mgr.'),(10624,'THECR',4,'1997-07-08','1997-04-09','1997-08-19',2,94.80,29,123.79,6,0.00,'The Cracker Box','Liu Wong','Marketing Assistant','Peacock','Margaret','Sales Representative','Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',123.79,123.79,0,0,0,1,'Meat/Poultry','Pluto Limited','Martin Bein','International Marketing Mgr.'),(10624,'THECR',4,'1997-07-08','1997-04-09','1997-08-19',2,94.80,44,19.45,10,0.00,'The Cracker Box','Liu Wong','Marketing Assistant','Peacock','Margaret','Sales Representative','Gula Malacca',20,2,'20 - 2 kg bags',19.45,19.45,27,0,15,0,'Condiments','Leka Trading','Chandra Leka','Owner'),(10625,'ANATR',3,'1997-08-08','1997-05-09','1997-08-14',1,43.90,14,23.25,3,0.00,'Ana Trades Limited','Ana Tracy','Owner','Leverling','Janet','Sales Representative','Tofu',6,7,'40 - 100 g pkgs.',23.25,23.25,35,0,0,0,'Produce','Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(10625,'ANATR',3,'1997-08-08','1997-05-09','1997-08-14',1,43.90,42,14.00,5,0.00,'Ana Trades Limited','Ana Tracy','Owner','Leverling','Janet','Sales Representative','Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14.00,14.00,26,0,0,1,'Grains/Cereals','Leka Trading','Chandra Leka','Owner'),(10625,'ANATR',3,'1997-08-08','1997-05-09','1997-08-14',1,43.90,60,34.00,10,0.00,'Ana Trades Limited','Ana Tracy','Owner','Leverling','Janet','Sales Representative','Camembert Pierrot',28,4,'15 - 300 g rounds',34.00,34.00,19,0,0,0,'Dairy Products','Gabaana','Eliane Noz','Sales Representative');
/*!40000 ALTER TABLE `tblpaakasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_paakasa'
--

--
-- Dumping routines for database 'db_paakasa'
--

--
-- Final view structure for view `employee_record`
--

/*!50001 DROP VIEW IF EXISTS `employee_record`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_record` AS select `e`.`employeeID` AS `employeeID`,`e`.`full_name` AS `Full Name`,`e`.`employees_title` AS `Title`,sum(`o`.`quantity`) AS `Quantity Sold`,concat('$',round(sum((`o`.`unitPrice` * `o`.`quantity`)),2)) AS `Revenue` from (`employees` `e` join `orders` `o` on((`e`.`employeeID` = `o`.`employeeID`))) group by `e`.`employeeID`,`e`.`full_name`,`e`.`employees_title` order by sum((`o`.`unitPrice` * `o`.`quantity`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 13:19:45
