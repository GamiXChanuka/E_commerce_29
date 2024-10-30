CREATE DATABASE  IF NOT EXISTS "ecommercedb" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommercedb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: shopzy-ecommerce-rathnayakeinduwara23-5e5f.j.aivencloud.com    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.30

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c9103065-91cf-11ef-bb33-06470b8fe559:1-1559';

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `AddressNumber` varchar(10) DEFAULT NULL,
  `Lane` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (103,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(104,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(105,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(106,'42/5','3rd lane','Panninpitiya','1122','Colombo'),(107,'263   ','deniyakada road','beliatta','82400','Hambanthota'),(108,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(109,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(110,'42/5','3rd lane','Panninpitiya','1122','Colombo'),(111,'263   ','deniyakada road','beliatta','82400','Hambanthota'),(112,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(113,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(114,'263   ','deniyakada road','beliatta','82400','Hambanthota'),(115,'23/6','samagi lane','Colombo','5566','Colombo'),(116,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(117,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(118,'263   ','deniyakada road','beliatta','82400','Hambanthota'),(119,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(120,'42/5','3rd lane','Panninpitiya','1122','Colombo'),(121,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(122,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(123,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(124,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(125,'263   ','deniyakada road','beliatta','82400','Hambanthota'),(126,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(127,'778A','uma oya road','Rukmalgama','0099','Kurunagala'),(128,'290','Gemunu MW','Kiribathgoda','11600','Gampaha'),(129,'263   ','deniyakada road','beliatta','82400','Hambanthota'),(130,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(131,'67/9','ruwanwall','Awissawella','14141','Colombo'),(132,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(133,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(134,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(135,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(136,'283  ','yatiyana','matara','82455','matara'),(137,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(138,'12','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(139,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','Polonnaruwa'),(140,'52A','Layards Road','Fort Wayne','46802','Galle'),(141,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','Colombo'),(142,'283  ','yatiyana','matara','82455','matara'),(143,'52A','Layards Road','Fort Wayne','46802','Galle'),(144,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','Galle'),(145,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(146,'283  ','yatiyana','matara','82455','matara'),(147,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','colombo'),(148,'1323','2ND LANE','KOTTAWA','11111','GAMPAHA'),(149,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(150,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(151,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(152,'52A','Layards Road','Fort Wayne','46802','Galle'),(153,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(154,'1323','2ND LANE','KOTTAWA','11111','GAMPAHA'),(155,'52A','3rd Road','Kottawa','2004','Mathrara'),(156,'1323','2ND LANE','KOTTAWA','11111','GAMPAHA'),(157,'52A','katana Road','Katuwawala','220033','Anuradhapura'),(158,'283  ','yatiyana','matara','82455','matara'),(159,'558','waligama','matara','879552','matara'),(160,'23','Gale','Neluw','79010','Galle'),(161,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(162,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(163,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(164,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle'),(165,'1','suboda road','Moratuwa','12345','Colombo'),(166,'1','suboda road','Moratuwa','12345','Colombo'),(167,'','','','',''),(168,'558','waligama','matara','879552','matara'),(169,'13','Nisala Uyana,Mavita,Neluwa.','Neluwa,Galle.','80082','galle');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `AdminUserName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `AdminUserName` (`AdminUserName`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'admin123','Admin','User','$2a$10$xapUFuFG5nGG3thvEmNM8ujNXecxfnd6s/V6dsSrJ6jAEDBGQsCYG','admin@123.com'),(2,'ck1admin','chamith','kaveesha','$2a$10$BUJbJGjUlDEG93sEYYvEMeC/884e.hZAzbUAfzgExA1Ifp5/MJErG','chamith1@gmail.com'),(3,'ck','c','k','$2a$10$Y4SDdKUVZZf1Ak6qDMlTCOQr8IpOKVaYMucghgOGF8RYwnkMTaYbW','11@gamil.com'),(4,'chamindu12','Chamindu','Sathsara','$2a$10$wShlyBwnZIoYUkja6crIcOqwemVKlsVp.qhu1D2HlJM88EHGE7Jem','chamindusathsara27@gmail.com'),(5,'naveen','naveen','sandaruwan','$2a$10$vhqcutFEF1SDQ9o0cpGVz.zIxj/ZbTMlNG5w9UKe1b/68HfVKI7bm','naveen@gmail.com'),(6,'admin123111','John','Doe','$2a$10$A6EgqR1hE.LqMRfXN8Xj2eGZgRsKlbW2ujHEJwuTfP8AenH/hk5lC','john.doe@example.com'),(7,'a3','John','Doe','$2a$10$iPqluhQ8XJDa3vAcu6WIaeEoP9.XJaYxPQHap.VXQILRlCpmBLZGi','john.doe@ample.com'),(8,'a31','John','Doe','$2a$10$OtB4wvZbCHfifblFVJdDtuKNMoD77fEZT0fXxLo.mnG8kEXg8hN3e','john.d1oe@ample.com');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `beforeAdminInsert` BEFORE INSERT ON `administrator` FOR EACH ROW BEGIN
    -- Check for existing AdminUserName
    IF EXISTS (SELECT 1 FROM administrator WHERE AdminUserName = NEW.AdminUserName) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: AdminUserName already exists.';
    END IF;
    
    -- Check for existing Email
    IF EXISTS (SELECT 1 FROM administrator WHERE Email = NEW.Email) THEN
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Error: Email already exists.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `AttributeID` int NOT NULL AUTO_INCREMENT,
  `AttributeName` varchar(50) NOT NULL,
  PRIMARY KEY (`AttributeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Color'),(2,'Storage'),(3,'RAM'),(4,'GPU'),(5,'CPU'),(6,'Size'),(7,'Bluetooth'),(8,'Capacity'),(9,'Pieces'),(10,'Flexible'),(11,'Wireless'),(12,'Name');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backorders`
--

DROP TABLE IF EXISTS `backorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backorders` (
  `BackorderID` int NOT NULL AUTO_INCREMENT,
  `VariantID` int NOT NULL,
  `Quantity` int NOT NULL,
  `OrderID` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BackorderID`),
  KEY `VariantID` (`VariantID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `backorders_ibfk_1` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`),
  CONSTRAINT `backorders_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backorders`
--

LOCK TABLES `backorders` WRITE;
/*!40000 ALTER TABLE `backorders` DISABLE KEYS */;
INSERT INTO `backorders` VALUES (4,6,1,78,'2024-10-30 15:09:11'),(5,4,1,82,'2024-10-30 15:11:22'),(6,8,5,83,'2024-10-30 15:12:03'),(7,6,1,94,'2024-10-30 15:17:30'),(9,5,5,98,'2024-10-30 15:22:24'),(10,36,11,98,'2024-10-30 15:22:24'),(11,27,9,102,'2024-10-30 15:24:44'),(14,20,1,109,'2024-10-30 15:32:00'),(15,27,1,109,'2024-10-30 15:32:00'),(16,41,2,111,'2024-10-30 15:34:35'),(17,59,4,111,'2024-10-30 15:34:35'),(18,8,1,113,'2024-10-30 15:38:19'),(19,4,1,115,'2024-10-30 15:40:06'),(20,59,1,115,'2024-10-30 15:40:06'),(21,3,1,120,'2024-10-30 16:28:16'),(22,6,4,120,'2024-10-30 16:28:16');
/*!40000 ALTER TABLE `backorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  PRIMARY KEY (`CartID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (38,48),(39,49),(40,51),(41,52),(42,53),(43,54),(44,55),(45,56),(46,57),(48,59),(49,60),(50,61),(52,63),(53,64),(54,65),(55,66),(56,67),(57,68);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `VariantID` int NOT NULL,
  `CartID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`VariantID`,`CartID`),
  KEY `CartID` (`CartID`),
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`),
  CONSTRAINT `cartitem_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `ParentCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `ParentCategoryID` (`ParentCategoryID`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`ParentCategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics',NULL),(2,'Mobile Phones',1),(3,'Laptops',1),(4,'Home Appliances',NULL),(5,'Toys',NULL),(6,'Action Figures',5),(7,'Dolls',5),(8,'Educational Toys',5),(9,'Gaming Device',1),(10,'TV',1),(11,'Ear buds',1),(12,'Powerbank',1),(13,'Headset',1),(14,'Key Bord',1),(15,'Wireless keyboard',1),(16,'Mouse',1),(17,'Remote control toys',5),(18,'Pen drive',1),(19,'Remote control helicopter',17),(20,'Tablet',1),(21,'Remote control car',17),(22,'Remote control truck',17),(23,'Speaker',1),(24,'Anime doll',7);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_table`
--

DROP TABLE IF EXISTS `city_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_table` (
  `cityid` int NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_table`
--

LOCK TABLES `city_table` WRITE;
/*!40000 ALTER TABLE `city_table` DISABLE KEYS */;
INSERT INTO `city_table` VALUES (1,'ampara'),(2,'anuradhapura'),(3,'badulla'),(4,'batticaloa'),(5,'colombo'),(6,'galle'),(7,'gampaha'),(8,'hambantota'),(9,'jaffna'),(10,'kalutara'),(11,'kandy'),(12,'kegalle'),(13,'kilinochchi'),(14,'kurunegala'),(15,'mannar'),(16,'matale'),(17,'matara'),(18,'monaragala'),(19,'mullaitivu'),(20,'nuwara eliya'),(21,'polonnaruwa'),(22,'puttalam'),(23,'ratnapura'),(24,'trincomalee'),(25,'vavuniya');
/*!40000 ALTER TABLE `city_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
/*!50001 DROP VIEW IF EXISTS `customerinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerinfo` AS SELECT 
 1 AS `UserID`,
 1 AS `CustomerName`,
 1 AS `Email`,
 1 AS `PhoneNumber`,
 1 AS `AddressNumber`,
 1 AS `Lane`,
 1 AS `City`,
 1 AS `PostalCode`,
 1 AS `District`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `deliverymodule`
--

DROP TABLE IF EXISTS `deliverymodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverymodule` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `EstimateDate` date DEFAULT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `OrderID` (`OrderID`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `deliverymodule_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `deliverymodule_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverymodule`
--

LOCK TABLES `deliverymodule` WRITE;
/*!40000 ALTER TABLE `deliverymodule` DISABLE KEYS */;
INSERT INTO `deliverymodule` VALUES (58,65,'2024-11-06',105),(59,66,'2024-11-06',108),(60,67,'2024-11-06',109),(61,68,'2024-11-06',110),(62,69,'2024-11-06',111),(63,70,'2024-11-06',112),(64,71,'2024-11-06',113),(65,72,'2024-11-06',114),(66,73,'2024-11-04',115),(67,74,'2024-11-06',116),(68,75,'2024-11-06',117),(69,76,'2024-11-06',118),(70,77,'2024-11-06',119),(71,78,'2024-11-06',120),(72,79,'2024-11-06',121),(73,80,'2024-11-06',122),(74,81,'2024-11-06',123),(75,82,'2024-11-06',124),(76,83,'2024-11-06',125),(77,84,'2024-11-06',126),(78,85,'2024-11-06',127),(79,86,'2024-11-06',128),(80,87,'2024-11-06',129),(81,88,'2024-11-06',130),(82,89,'2024-11-06',131),(83,90,'2024-11-06',132),(84,91,'2024-11-06',133),(85,92,'2024-11-06',134),(86,93,'2024-11-06',135),(87,94,'2024-11-06',137),(88,95,'2024-11-06',138),(89,96,'2024-11-06',139),(91,98,'2024-11-04',142),(92,99,'2024-11-06',143),(93,100,'2024-11-06',144),(94,101,'2024-11-06',145),(95,102,'2024-11-04',146),(96,103,'2024-11-06',147),(97,104,'2024-11-06',149),(98,105,'2024-11-06',151),(99,106,'2024-11-06',152),(100,107,'2024-11-06',153),(102,109,'2024-11-06',155),(104,111,'2024-11-06',157),(105,112,'2024-11-04',158),(106,113,'2024-11-06',160),(107,114,'2024-11-06',161),(108,115,'2024-11-06',162),(109,116,'2024-11-06',163),(110,117,'2024-11-06',164),(111,118,'2024-11-06',166),(112,119,'2024-11-06',167),(113,120,'2024-11-04',168),(114,121,'2024-11-06',169);
/*!40000 ALTER TABLE `deliverymodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `ImageID` int NOT NULL AUTO_INCREMENT,
  `ImageLink` varchar(250) NOT NULL,
  `VariantID` int NOT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `VariantID` (`VariantID`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://img.drz.lazcdn.com/g/kf/S5c7bcb272e9f45ad817e755b6ea97808W.jpg_720x720q80.jpg_.webp',2),(2,'https://img.drz.lazcdn.com/static/lk/p/682fa96af3d91ef85d3eb9d589b37076.jpg_720x720q80.jpg_.webp',1),(3,'https://img.drz.lazcdn.com/static/lk/p/8b2d5fdf01f0562a6c7c2065e0c2ff9d.jpg_720x720q80.jpg_.webp',3),(4,'https://img.drz.lazcdn.com/static/lk/p/292aa54e558f4b630ce4855478f65f88.jpg_720x720q80.jpg_.webp',4),(7,'https://img.drz.lazcdn.com/static/lk/p/a337b7a6699a1f8cc10650bbc5b02c6b.jpg_720x720q80.jpg_.webp',5),(8,'https://img.drz.lazcdn.com/static/lk/p/b006cd13bcdc791ce6b91f4b05e1c988.jpg_720x720q80.jpg_.webp',6),(9,'https://img.drz.lazcdn.com/static/lk/p/0414db07b3b792e896410bd830b0fc05.jpg_720x720q80.jpg_.webp',7),(10,'https://img.drz.lazcdn.com/g/kf/S64f080ae314d4e32b7f1952a3f21da4eG.jpg_720x720q80.jpg_.webp',8),(11,'https://ae-pic-a1.aliexpress-media.com/kf/S4c420d7254b84636b6f29fd69ee21c210.jpg_720x720q80.jpg_.webp',9),(12,'https://ae-pic-a1.aliexpress-media.com/kf/Sae45a069c13c46329873a8dab6396d56Q.jpg_720x720q80.jpg_.webp',10),(13,'https://img.drz.lazcdn.com/static/lk/p/87c426910ba267680285aed42c2ec520.jpg_720x720q80.jpg_.webp',12),(14,'https://img.drz.lazcdn.com/static/lk/p/acba5ee28b71820a32004761c0848d5b.jpg_720x720q80.jpg_.webp',11),(15,'https://img.drz.lazcdn.com/static/lk/p/acba5ee28b71820a32004761c0848d5b.jpg_720x720q80.jpg_.webp',13),(16,'https://img.drz.lazcdn.com/g/kf/Sd195d712838943fe8563c2c46fc76a1dE.jpg_720x720q80.jpg_.webp',14),(17,'https://img.drz.lazcdn.com/g/kf/Sd195d712838943fe8563c2c46fc76a1dE.jpg_720x720q80.jpg_.webp',15),(18,'https://img.drz.lazcdn.com/static/lk/p/33754a42b0a59ea632116848c0c175ef.jpg_720x720q80.jpg_.webp',16),(19,'https://img.drz.lazcdn.com/static/lk/p/bf6756da5926795caddb3b495e48fd30.png_720x720q80.png_.webp',17),(20,'https://img.drz.lazcdn.com/static/lk/p/bf6756da5926795caddb3b495e48fd30.png_720x720q80.png_.webp',18),(21,'https://img.drz.lazcdn.com/static/lk/p/992ca4ec74d378d4b656ea5ba8f7bdcb.jpg_720x720q80.jpg_.webp',20),(22,'https://img.drz.lazcdn.com/static/lk/p/7e4b74d48823e775e199057d3ee5df4e.png_720x720q80.png_.webp',19),(23,'https://img.drz.lazcdn.com/static/lk/p/d5940041153812bfc7d208ca57e35d09.jpg_720x720q80.jpg_.webp',22),(24,'https://img.drz.lazcdn.com/static/lk/p/457218b6a0e7aaacb0864617bdfdfdea.jpg_720x720q80.jpg_.webp',25),(25,'https://img.drz.lazcdn.com/static/lk/p/bef039da6282f8112d022d96a2c9d1ae.jpg_720x720q80.jpg_.webp',24),(26,'https://img.drz.lazcdn.com/static/lk/p/b5b938b0bfd064259117d5bd939dbb4e.jpg_720x720q80.jpg_.webp',23),(27,'https://img.drz.lazcdn.com/g/kf/S65e357aef28a405c9d8915ff5185de3dC.jpg_720x720q80.jpg_.webp',26),(28,'https://img.drz.lazcdn.com/g/kf/S678a01c1a22e4457b1d60826eca52b97B.jpg_720x720q80.jpg_.webp',29),(29,'https://img.drz.lazcdn.com/static/lk/p/88c530851a99e67a617d154986b0687e.jpg_720x720q80.jpg_.webp',28),(30,'https://img.drz.lazcdn.com/g/kf/S1d71bdc9152c46a09afbf61458ff2d26E.jpg_720x720q80.jpg_.webp',27),(31,'https://img.drz.lazcdn.com/static/lk/p/f67989654348a1103aa3d68049ae71ea.jpg_720x720q80.jpg_.webp',31),(32,'https://img.drz.lazcdn.com/g/kf/S3985f0a8a4294d0e83234dd461a7a934E.jpg_720x720q80.jpg_.webp',30),(33,'https://img.drz.lazcdn.com/g/kf/S9fbb74c3036a4836ba9660063a407359H.png_720x720q80.png_.webp',32),(34,'https://img.drz.lazcdn.com/static/lk/p/ef3c4a8bd1ebb28513d86e8ff2845083.jpg_720x720q80.jpg_.webp',33),(35,'https://img.drz.lazcdn.com/static/lk/p/419895494e319233090cc80a64302cdc.jpg_720x720q80.jpg_.webp',34),(36,'https://img.drz.lazcdn.com/g/kf/S20157e1e7fba4a689507e8bd362fe06ev.jpg_720x720q80.jpg_.webp',35),(37,'https://img.drz.lazcdn.com/g/kf/S1abb5013ee524ce28e4643759ecf72ba3.jpg_720x720q80.jpg_.webp',36),(38,'https://img.drz.lazcdn.com/g/kf/Sf49bbd6762614116bf79f6764a29e3dc0.jpg_720x720q80.jpg_.webp',38),(39,'https://img.drz.lazcdn.com/g/kf/Sb5415c0bd56d4cf8b3700407b22c346fc.jpg_720x720q80.jpg_.webp',39),(40,'https://img.drz.lazcdn.com/g/kf/Sfdcee3d62d17475fb5c39aff49cf2f61V.jpg_720x720q80.jpg_.webp',37),(41,'https://img.drz.lazcdn.com/g/kf/S2962a20060bb44b9adc5ae0cfc1ab54cg.jpg_720x720q80.jpg_.webp',40),(42,'https://img.drz.lazcdn.com/g/kf/Sa7e4de4a7caf4a478b5e93fa8b7e4a55r.jpg_720x720q80.jpg_.webp',41),(43,'https://img.drz.lazcdn.com/static/lk/p/c68bbcd1661dd79b4ba22045d9288f58.jpg_720x720q80.jpg_.webp',42),(44,'https://img.drz.lazcdn.com/static/lk/p/0233876b4ad7e00ca02b25558039cef2.png_720x720q80.png_.webp',21),(45,'https://img.drz.lazcdn.com/g/kf/S7da84f4c5c654498857b84ccfa18eaa08.jpg_720x720q80.jpg_.webp',44),(46,'https://img.drz.lazcdn.com/g/kf/Sc7c10435c24743ee97505e8a95e1b15f0.jpg_720x720q80.jpg_.webp',45),(47,'https://img.drz.lazcdn.com/static/lk/p/ff9b8091a7cbe42ce8a57ba5430f2004.jpg_720x720q80.jpg_.webp',46),(48,'https://img.drz.lazcdn.com/static/lk/p/61d156ce9ac9e966eb3fd0f093ba68c9.jpg_720x720q80.jpg_.webp',47),(49,'https://img.drz.lazcdn.com/static/lk/p/b3c215f4506c4a7777c7c5d5d3359f64.jpg_720x720q80.jpg_.webp',51),(50,'https://img.drz.lazcdn.com/static/lk/p/515dd146102ae139163cc63ffa97a9a7.jpg_720x720q80.jpg_.webp',48),(51,'https://img.drz.lazcdn.com/static/lk/p/1459f5adc13ccd1143310ddc4cd49ac8.jpg_720x720q80.jpg_.webp',49),(52,'https://img.drz.lazcdn.com/static/lk/p/be4c3f2d6d940f50f61814305b80b8a2.jpg_720x720q80.jpg_.webp',50),(53,'https://img.drz.lazcdn.com/static/lk/p/bc871a4c0718d315521a2d2d08e44b8d.png_720x720q80.png_.webp',52),(54,'https://img.drz.lazcdn.com/g/kf/Se00311c21fda43f1824bb2a34cf51204Q.jpg_720x720q80.jpg_.webp',53),(55,'https://img.drz.lazcdn.com/static/lk/p/169334541e147ab1c238509762244d5a.jpg_720x720q80.jpg_.webp',54),(56,'https://img.drz.lazcdn.com/static/lk/p/c0843e3cad57925a4665f9d833a00bcb.jpg_720x720q80.jpg_.webp',56),(57,'https://img.drz.lazcdn.com/static/lk/p/fbcf0a52dddc8e11a95ff4fa30d8083b.jpg_720x720q80.jpg_.webp',55),(58,'https://img.drz.lazcdn.com/static/lk/p/c05983b2b9802ff5a64b57133ce0ba3e.jpg_720x720q80.jpg_.webp',57),(59,'https://img.drz.lazcdn.com/static/lk/p/f01c76c62a6fc9b63a8f6a7e3a1db721.jpg_720x720q80.jpg_.webp',58),(60,'https://img.drz.lazcdn.com/static/lk/p/0b9bf84e59c3f3ea2787564dc3567838.jpg_720x720q80.jpg_.webp',60),(61,'https://img.drz.lazcdn.com/static/lk/p/c0ba5be88baeea39ab92dac17d21f00d.png_720x720q80.png_.webp',61),(62,'https://img.drz.lazcdn.com/static/lk/p/cc1051b61de86d2e5f72c079c16d2adb.jpg_720x720q80.jpg_.webp',59),(63,'https://img.drz.lazcdn.com/static/lk/p/5e00df7bab051cd411c75e5bea0f8737.jpg_720x720q80.jpg_.webp',62),(64,'https://img.drz.lazcdn.com/static/lk/p/59aca725911cd5900386b18997ac1104.jpg_720x720q80.jpg_.webp',63),(65,'https://img.drz.lazcdn.com/g/kf/Sf06c85c81308405ba036ac762a61b331V.jpg_720x720q80.jpg_.webp',64),(66,'https://img.drz.lazcdn.com/g/kf/S040b34883ec54e6fb17b05c7f0b9c2bdT.jpg_720x720q80.jpg_.webp',65),(67,'https://img.drz.lazcdn.com/g/kf/S5edf51433dac4e67a8727e9d84ee0e4bF.jpg_720x720q80.jpg_.webp',66),(68,'https://img.drz.lazcdn.com/static/lk/p/79e55b5ebb531b38d23f4c51e7c80d9e.jpg_720x720q80.jpg_.webp',43);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `DeliveryType` enum('storePickup','delivery','Fedex','DHL') NOT NULL,
  `PaymentMethod` enum('card','COD') NOT NULL,
  `OrderTotal` decimal(10,2) NOT NULL,
  `AddressID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (65,49,'2024-01-30','DHL','COD',32000.99,105),(66,49,'2024-02-02','DHL','card',522.00,108),(67,48,'2024-03-30','Fedex','card',15934.99,109),(68,51,'2024-04-30','Fedex','card',62500.00,110),(69,52,'2024-05-30','DHL','COD',6424.00,111),(70,48,'2024-06-30','DHL','COD',128500.99,112),(71,48,'2024-07-30','DHL','COD',3003.99,113),(72,52,'2024-08-30','DHL','COD',2350.00,114),(73,51,'2024-09-30','Fedex','COD',584303.96,115),(74,48,'2024-10-30','Fedex','card',10148.00,116),(75,48,'2022-01-30','DHL','COD',4377.00,117),(76,52,'2023-01-01','DHL','COD',317766.96,118),(77,48,'2023-03-30','DHL','COD',1136150.00,119),(78,51,'2023-04-30','DHL','COD',60661.98,120),(79,48,'2023-05-30','DHL','COD',599970.00,121),(80,49,'2023-06-30','DHL','COD',169000.00,122),(81,48,'2023-07-30','DHL','COD',7398.00,123),(82,48,'2023-08-30','DHL','card',169000.00,124),(83,52,'2023-09-30','DHL','COD',7661.00,125),(84,48,'2023-10-30','DHL','COD',398.00,126),(85,51,'2023-11-30','DHL','card',17700.00,127),(86,48,'2022-10-30','DHL','COD',4818.00,128),(87,52,'2021-10-30','DHL','COD',7476.00,129),(88,49,'2022-10-30','DHL','card',3465.00,130),(89,51,'2022-05-30','DHL','COD',18352.97,131),(90,49,'2022-12-30','DHL','COD',490.00,132),(91,49,'2022-01-30','DHL','COD',3400.00,133),(92,49,'2022-03-30','DHL','COD',3699.00,134),(93,49,'2022-04-30','DHL','COD',1779.00,135),(94,54,'2022-05-30','DHL','COD',8014.98,137),(95,55,'2022-06-30','DHL','COD',228605.00,138),(96,56,'2022-08-30','DHL','COD',49990.00,139),(98,53,'2022-01-30','Fedex','card',317524.88,142),(99,57,'2020-01-30','DHL','COD',29354.00,143),(100,59,'2020-02-10','Fedex','card',3200.00,144),(101,60,'2020-03-30','DHL','COD',3890.00,145),(102,53,'2020-04-30','DHL','card',48390.00,146),(103,61,'2020-05-30','DHL','COD',42790.00,147),(104,63,'2020-06-30','DHL','COD',199.00,149),(105,64,'2020-07-30','DHL','COD',4818.00,151),(106,57,'2020-08-30','Fedex','COD',36313.00,152),(107,64,'2020-09-30','DHL','COD',60001.98,153),(109,57,'2024-10-30','DHL','COD',1118730.00,155),(111,57,'2024-10-30','DHL','COD',413322.00,157),(112,53,'2024-10-30','DHL','COD',3800.00,158),(113,66,'2024-10-30','DHL','COD',200.00,160),(114,64,'2024-10-30','DHL','COD',3870.00,161),(115,64,'2024-10-30','DHL','COD',267500.00,162),(116,64,'2024-10-30','DHL','COD',453980.00,163),(117,64,'2024-10-30','DHL','COD',1798.00,164),(118,67,'2024-10-30','DHL','COD',1410000.00,166),(119,68,'2024-10-30','Fedex','COD',45990.00,167),(120,65,'2024-10-30','DHL','COD',360839.96,168),(121,64,'2024-10-30','Fedex','COD',705000.00,169);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `update_deliverymodule_after_order_insert` AFTER INSERT ON `order` FOR EACH ROW BEGIN
  DECLARE city_exists INT;
  DECLARE is_backorder INT;
  DECLARE estimated_days INT;
  DECLARE order_city VARCHAR(50);

  -- Get the city from the address of the new order
  SELECT City INTO order_city FROM address WHERE AddressID = NEW.AddressID;

  -- Check if the city exists in the city_table
  SELECT COUNT(*) INTO city_exists FROM city_table WHERE LOWER(city) = LOWER(order_city);

  -- Check if the OrderID exists in the backorders table
  SELECT COUNT(*) INTO is_backorder FROM backorders WHERE OrderID = NEW.OrderID;

  -- Determine the estimated delivery days based on the conditions
  IF is_backorder > 0 AND city_exists = 0 THEN
    SET estimated_days = 10;
  ELSEIF is_backorder = 0 AND city_exists = 0 THEN
    SET estimated_days = 7;
  ELSEIF is_backorder = 0 AND city_exists > 0 THEN
    SET estimated_days = 5;
  END IF;

  -- Insert data into the deliverymodule table with the calculated estimate date
  INSERT INTO deliverymodule (OrderID, EstimateDate, AddressID)
  VALUES (NEW.OrderID, DATE_ADD(CURDATE(), INTERVAL estimated_days DAY), NEW.AddressID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `before_order_delete` BEFORE DELETE ON `order` FOR EACH ROW BEGIN
    -- Declare necessary variables
    DECLARE var_variant_id INT;
    DECLARE var_quantity INT;
    DECLARE back_quantity INT;
    DECLARE total_return_quantity INT;
    DECLARE done BOOLEAN DEFAULT FALSE;  -- Declare the 'done' variable to track end of cursor

    -- Cursor to loop through each variant in orderitem related to the deleted order
    DECLARE cur_orderitem CURSOR FOR 
        SELECT VariantID, Quantity 
        FROM orderitem 
        WHERE OrderID = OLD.OrderID;

    -- Continue handler for cursor end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor
    OPEN cur_orderitem;

    -- Loop through cursor result set
    read_loop: LOOP
        -- Fetch each row into declared variables
        FETCH cur_orderitem INTO var_variant_id, var_quantity;
        
        -- Check if cursor has reached the end
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Get the backorder quantity for the specific order and variant
        SELECT COALESCE(SUM(Quantity), 0) 
        INTO back_quantity 
        FROM backorders 
        WHERE OrderID = OLD.OrderID AND VariantID = var_variant_id;

        -- Calculate total quantity to return to stock (ordered - backordered)
        SET total_return_quantity = var_quantity - back_quantity;

        -- Update stock in the variant table
        UPDATE variant
        SET StockCount = StockCount + total_return_quantity
        WHERE VariantID = var_variant_id;

        -- Delete the related backorders
        DELETE FROM backorders 
        WHERE OrderID = OLD.OrderID AND VariantID = var_variant_id;

        -- Delete the related orderitems
        DELETE FROM orderitem 
        WHERE OrderID = OLD.OrderID AND VariantID = var_variant_id;
    END LOOP;

    -- Close cursor
    CLOSE cur_orderitem;

    -- Delete the corresponding row from the deliverymodule table
    DELETE FROM deliverymodule 
    WHERE OrderID = OLD.OrderID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!50001 DROP VIEW IF EXISTS `orderinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderinfo` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderDate`,
 1 AS `OrderTotal`,
 1 AS `UserID`,
 1 AS `PaymentMethod`,
 1 AS `DeliveryType`,
 1 AS `EstimateDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderID` int NOT NULL,
  `VariantID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`,`VariantID`),
  KEY `VariantID` (`VariantID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`),
  CONSTRAINT `orderitem_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (65,10,1),(66,37,1),(67,5,1),(67,40,1),(67,41,1),(67,62,1),(68,31,5),(69,50,4),(70,9,1),(70,59,1),(71,6,1),(71,33,1),(71,35,1),(72,23,1),(73,2,2),(73,7,4),(73,47,2),(74,24,1),(74,25,1),(74,29,1),(74,32,1),(75,43,3),(76,6,4),(76,59,3),(76,60,3),(76,61,6),(77,26,2),(77,52,5),(78,6,1),(78,10,1),(78,36,3),(78,39,1),(78,51,2),(79,21,3),(80,4,1),(81,42,2),(82,4,1),(83,8,7),(83,27,3),(83,37,1),(83,38,1),(83,42,1),(84,35,2),(85,22,4),(85,58,3),(86,49,1),(86,50,2),(87,33,1),(87,34,1),(87,44,1),(87,45,1),(87,48,1),(88,30,1),(89,7,3),(89,33,2),(89,34,3),(89,35,2),(89,57,4),(89,63,2),(90,46,1),(91,48,2),(91,63,1),(92,42,1),(93,24,1),(94,5,1),(94,6,1),(95,19,1),(96,14,1),(98,5,12),(98,24,13),(98,25,11),(98,36,11),(98,40,13),(98,41,11),(98,48,10),(98,51,10),(99,25,4),(99,27,2),(99,28,1),(99,35,2),(99,54,6),(100,33,4),(101,55,1),(102,26,14),(102,27,14),(102,47,13),(102,54,16),(103,55,11),(104,35,1),(105,49,2),(105,50,1),(106,30,4),(106,32,3),(106,43,3),(106,60,2),(106,61,3),(106,63,2),(107,9,2),(109,20,4),(109,27,1),(109,49,4),(109,50,1),(111,40,2),(111,41,2),(111,59,4),(111,63,1),(112,47,4),(113,8,1),(114,54,3),(115,4,1),(115,59,1),(116,52,2),(117,56,1),(117,57,1),(118,1,6),(119,15,1),(120,3,1),(120,6,4),(120,24,1),(120,25,1),(120,42,1),(120,43,2),(120,46,1),(120,56,1),(120,62,1),(120,63,1),(121,1,3);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `check_stock_before_insert_order` BEFORE INSERT ON `orderitem` FOR EACH ROW BEGIN
    DECLARE current_stock INT;

    -- Fetch current stock for the variant
    SELECT StockCount INTO current_stock FROM variant WHERE VariantID = NEW.VariantID;

    -- Check if the order quantity exceeds available stock
    IF NEW.Quantity > current_stock THEN
        -- Log oversell in Backorders table
        INSERT INTO backorders (VariantID, Quantity, OrderID)
        VALUES (NEW.VariantID, NEW.Quantity - current_stock, NEW.OrderID);

        -- Update stock to 0 since it's oversold
        UPDATE variant SET StockCount = 0 WHERE VariantID = NEW.VariantID;
    ELSE
        -- Deduct stock if sufficient
        UPDATE variant
        SET StockCount = StockCount - NEW.Quantity
        WHERE VariantID = NEW.VariantID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 14 Pro'),(2,'MacBook Pro'),(3,'Washing Machine'),(5,'Lego Building Set'),(6,'Barbie Doll'),(7,'Action Figure Set'),(8,'Educational Board Game'),(9,'Redmi A3'),(10,'Samsung Galaxy A05'),(11,'MSI Vector'),(12,'Samsung Galaxy A15'),(13,'Solstar LED Digital Television'),(14,'Samsung Smart TV'),(15,'M-Series Earbuds'),(16,'Samsung HDR 4K Smart TV'),(17,'ASPOR Powerbank'),(18,'Multi-Jointed Shapeshift Robot'),(19,'MSI Headset'),(20,'AirPods Pro'),(21,'Marvel Superhero'),(22,'Rubic cube'),(23,'Game Controller - Joystick'),(24,'Children Montessori Clock'),(25,'VR Headset'),(26,'Keyboard Mini Foldable'),(27,'Wireless Bluetooth Keyboard'),(28,'Gaming Mouse'),(29,'Wireless Mouse'),(30,'Kingston Pen drive'),(31,'Remote control Outdoor Flying Helicopter'),(32,'Apple iPad'),(33,'Remote Control Racing Car Super Model Car'),(34,'Remote Control truck with off road tires'),(35,'JBL mini Speaker'),(36,'JBL Speaker'),(37,'Ewis Laptop'),(38,'Brick Game Handheld Game Machine'),(39,'Anime Demon Slayer Toys');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productattribute`
--

DROP TABLE IF EXISTS `productattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productattribute` (
  `ProductAttributeID` int NOT NULL AUTO_INCREMENT,
  `AttributeID` int NOT NULL,
  `VariantID` int NOT NULL,
  `AttributeValue` varchar(100) NOT NULL,
  PRIMARY KEY (`ProductAttributeID`),
  KEY `AttributeID` (`AttributeID`),
  KEY `VariantID` (`VariantID`),
  CONSTRAINT `productattribute_ibfk_1` FOREIGN KEY (`AttributeID`) REFERENCES `attributes` (`AttributeID`),
  CONSTRAINT `productattribute_ibfk_2` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattribute`
--

LOCK TABLES `productattribute` WRITE;
/*!40000 ALTER TABLE `productattribute` DISABLE KEYS */;
INSERT INTO `productattribute` VALUES (1,1,1,'Black'),(2,2,1,'128GB'),(3,1,2,'Gold'),(4,2,2,'256GB'),(5,3,3,'16GB'),(6,1,5,'Multi-Color'),(7,2,5,'1500 Pieces'),(8,1,6,'Pink'),(10,1,7,'Various'),(12,1,8,'Multi-Color'),(14,1,9,'black'),(15,1,10,'blue'),(16,2,9,'128GB'),(17,2,10,'128GB'),(18,2,11,'64GB'),(19,1,11,'Black'),(20,3,11,'4GB'),(21,1,12,'Gray'),(22,4,12,'RTX 4070'),(23,5,12,'Core i9'),(24,2,13,'128GB'),(25,1,13,'Black'),(26,3,13,'4GB'),(27,2,14,'128GB'),(28,1,14,'Black'),(29,3,14,'6GB'),(30,2,15,'64GB'),(31,1,15,'Black'),(32,3,15,'4GB'),(33,1,16,'Black'),(34,4,16,'RTX 4070'),(35,5,16,'Core i7'),(36,6,17,'43 inch'),(37,6,18,'32 inch'),(38,1,20,'Silver'),(39,2,20,'8 GB'),(40,3,20,'256 GB'),(41,6,19,'55 inch'),(42,1,19,'Black'),(43,1,22,'Black'),(44,7,22,'5.0'),(45,6,21,'44 inch'),(46,8,24,'10000mAh'),(47,1,24,'Black'),(48,8,25,'20000mAh'),(49,1,25,'White'),(50,1,23,'Blue'),(51,7,23,'4.0'),(52,1,26,'Blue'),(53,1,27,'White'),(54,1,28,'Blue'),(55,7,28,'3.0'),(56,1,29,'Blue'),(57,1,30,'Red'),(58,1,32,'White'),(59,1,33,'Black'),(60,1,31,'Red'),(61,7,31,'4.0'),(62,1,34,'White'),(63,1,35,'Multicolour'),(64,1,36,'Black'),(65,1,37,'Yellow'),(66,1,38,'Blue'),(67,1,39,'Blue'),(68,9,40,'585 pcs'),(69,9,41,'554 pcs'),(70,1,42,'White'),(71,8,4,'7 kg'),(72,1,43,'Black'),(73,11,43,'Yes'),(74,1,44,'Black'),(75,11,44,'Yes'),(76,1,45,'White'),(77,11,45,'Yes'),(78,11,46,'NO'),(79,11,47,'Yes'),(80,2,48,'64GB'),(81,2,51,'32GB'),(82,1,49,'Red'),(83,1,50,'Blue'),(84,1,52,'Gray'),(85,2,52,'64GB'),(86,1,53,'Gray'),(87,2,53,'128GB'),(88,1,54,'Red'),(89,1,55,'Blue'),(90,1,56,'Blue'),(91,1,57,'Black'),(92,1,58,'Green'),(93,1,60,'Black'),(94,1,61,'Red'),(95,3,59,'8GB'),(96,1,62,'Blue'),(97,1,63,'Red'),(98,12,64,'Agatsuma Zenitsu'),(99,12,65,'Kamado Tanjirou'),(100,12,66,'Nezuko');
/*!40000 ALTER TABLE `productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `ProductID` int NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`ProductID`,`CategoryID`),
  KEY `ProductID` (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,2),(1,9),(2,3),(3,4),(5,5),(6,7),(7,6),(8,8),(9,2),(9,9),(10,2),(11,3),(12,2),(13,10),(14,10),(15,11),(16,10),(17,12),(18,6),(19,13),(20,11),(21,6),(22,8),(23,9),(24,5),(25,9),(26,14),(27,15),(28,16),(29,16),(30,18),(31,19),(32,20),(33,21),(34,22),(35,23),(36,23),(37,3),(38,9);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productinfo`
--

DROP TABLE IF EXISTS `productinfo`;
/*!50001 DROP VIEW IF EXISTS `productinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productinfo` AS SELECT 
 1 AS `OrderID`,
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `QuantityOrdered`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `registeredcustomer`
--

DROP TABLE IF EXISTS `registeredcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeredcustomer` (
  `UserID` int NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `AddressID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `registeredcustomer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `registeredcustomer_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredcustomer`
--

LOCK TABLES `registeredcustomer` WRITE;
/*!40000 ALTER TABLE `registeredcustomer` DISABLE KEYS */;
INSERT INTO `registeredcustomer` VALUES (48,'Chami','ckaveesha2002@gmail.com','$2a$10$thgM.v/i7OdoyZAQzxQileMN0tqc52LegZDV/xADDUV6drd6TU2PW',103),(49,'gamith123','gamithchanuka@gmail.com','$2a$10$7mSix6YYc7RKOh/umkZiruoAhGVRsHaLnqgiztct3QeAtDs0G5fiu',104),(51,'InduwaraB','induwaraB@gmail.com','$2a$10$FJHrBFJFgezbYDxnZs5B.etP4ocfiQ1DHqzPkcu92LwJXx.SU1zLS',106),(52,'hasitha12','hasithasandun12@gmail.com','$2a$10$y1VtSjZfARN.1AuqgXpGEOl8yhW4AbBnmMoAPKLQCAS7lObGyLl1e',107),(53,'tiran12','tiranshanuka12@gmail.com','$2a$10$0YvUr6Fqxgm2axIu7NbcfOU.YsN5Mbv.K3k1GUal3fcmuCUlr0mjS',136),(57,'KIndunil','kindunill@gmail.com','$2a$10$eGPSgSWjWOaRPZUnc5tmYu8Yd32aQuObBtb1pVRV7utsMYTcGnb4G',140),(64,'ravii','test@gmail.com','$2a$10$5mKf7vJf0FhTRXpRogBlueZD5IJIQDYn/8HOKD5mLXAt0KmEUPnuu',150),(65,'rasindu12','Rasinduseku12@gmail.com','$2a$10$QWbqKMhCtP10pgcc4KwLfO0gGGfRYqf0t1FeY5Qfn9Ptwbwq9VzwK',159),(67,'NSjayasooriya','forapikey6@gmail.com','$2a$10$DbIeTS1S9yCEealf0xroYerFyWql7akRQxScjEbxkWuKTnvB0b6Qu',165);
/*!40000 ALTER TABLE `registeredcustomer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `BeforeInsertRegisteredCustomer` BEFORE INSERT ON `registeredcustomer` FOR EACH ROW BEGIN
    -- Check if the email already exists
    IF (EXISTS (SELECT 1 FROM registeredcustomer WHERE Email = NEW.Email)) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email already exists';
    END IF;

    -- Check if the username already exists
    IF (EXISTS (SELECT 1 FROM registeredcustomer WHERE UserName = NEW.UserName)) THEN
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Username already exists';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `PhoneNumber` char(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` enum('Registered','UnRegistered') NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (48,'0703022692','Chamith','Kaveesha','Registered'),(49,'0770796550','Gamith','Chanuka','Registered'),(51,'0772209691','Induwara','Rathnayake','Registered'),(52,'0714749285','hasitha','sandun','Registered'),(53,'0714747852','tiran','shanuka','Registered'),(54,'0123784569','gamitj','chanuka','UnRegistered'),(55,'0770796550','Chamith','chanth','UnRegistered'),(56,'119','Don','Chamith','UnRegistered'),(57,'0112787878','Kaveesha','Indunil','Registered'),(59,'0770796550','Induwarii','Rathnayake','UnRegistered'),(60,'0770796550','M','Sanduni','UnRegistered'),(61,'0770796550','pawani','gamage','UnRegistered'),(63,'0770796550','pamoj','H','UnRegistered'),(64,'0770796550','Ravindu','Sandeep','Registered'),(65,'0784745565','Rasindu','Seekkubadu','Registered'),(66,'0772','Gamith','Chanuka','UnRegistered'),(67,'0766869075','Naveen','Jayasooriya','Registered'),(68,'','','','UnRegistered');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `before_user_delete` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
    -- Delete associated records from cartitem
    DELETE FROM cartitem WHERE CartID IN (SELECT CartID FROM cart WHERE UserID = OLD.UserID);
    
    -- Delete associated records from deliverymodule
    DELETE FROM deliverymodule WHERE OrderID IN (SELECT OrderID FROM `order` WHERE UserID = OLD.UserID);
    
    -- Delete associated records from orderitem
    DELETE FROM orderitem WHERE OrderID IN (SELECT OrderID FROM `order` WHERE UserID = OLD.UserID);
    
    DELETE FROM backorders WHERE OrderID IN (SELECT OrderID FROM `order` WHERE UserID = OLD.UserID);
    
    -- Delete associated records from order
    DELETE FROM `order` WHERE UserID = OLD.UserID;
    
    -- Delete associated records from cart
    DELETE FROM cart WHERE UserID = OLD.UserID;
    
    -- Delete associated records from registeredcustomer
    DELETE FROM registeredcustomer WHERE UserID = OLD.UserID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `VariantID` int NOT NULL AUTO_INCREMENT,
  `VariantName` varchar(75) NOT NULL,
  `Description` text,
  `ProductID` int NOT NULL,
  `SKU` varchar(40) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockCount` int NOT NULL,
  PRIMARY KEY (`VariantID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,'iPhone 14 Pro - 128GB','Experience the pinnacle of smartphone technology with the iPhone 14 Pro in black. Featuring a 6.1-inch Super Retina XDR display, A16 Bionic chip, and a 48MP pro camera system, it delivers stunning visuals and exceptional performance. With 128GB of storage, you have ample space for all your apps, photos, and videos. The iPhone 14 Pro also includes groundbreaking features like Dynamic Island, Always-On display, and advanced safety capabilities such as Crash Detection and Emergency SOS via satellite. Available in a sleek black finish, it combines elegance with cutting-edge technology.',1,'IP14P128',235000.00,1),(2,'iPhone 14 Pro - 256GB','Experience the pinnacle of smartphone technology with the iPhone 14 Pro in gold. Featuring a 6.1-inch Super Retina XDR display, A16 Bionic chip, and a 48MP pro camera system, it delivers stunning visuals and exceptional performance. With 256GB of storage, you have ample space for all your apps, photos, and videos. The iPhone 14 Pro also includes groundbreaking features like Dynamic Island, Always-On display, and advanced safety capabilities such as Crash Detection and Emergency SOS via satellite. Available in a luxurious gold finish, it combines elegance with cutting-edge technology',1,'IP14P256',285000.00,2),(3,'MacBook Pro - 16GB RAM','The MacBook Pro with the M2 chip and 16GB RAM offers exceptional performance, a stunning Retina display, and long battery life, making it perfect for professionals and creatives who need power and portability.',2,'MBP16',340000.00,0),(4,'Washing Machine - 8kg','Efficiently handle your laundry with this front-load washing machine. With an 8kg capacity, it is perfect for medium-sized households. It features multiple wash programs, energy-efficient operation, and a sleek design, ensuring your clothes are cleaned thoroughly and gently',3,'WM8KG',169000.00,0),(5,'Lego Building Set - 1500 Pieces','The LEGO Creator Expert 3-in-1 sets are perfect for builders who love versatility and creativity. These sets allow you to construct multiple models from a single set of bricks, providing endless hours of fun and imaginative play.',5,'Lego1500',6009.99,0),(6,'Barbie Doll - Classic','Delight in timeless play with the classic Barbie doll. This iconic doll comes with a variety of accessories, allowing for endless imaginative adventures. Perfect for collectors and children alike, it embodies elegance and creativity.',6,'BarbieClassic',2004.99,0),(7,'Action Figure Set - Superheroes','Bring the excitement of superhero movies to life with this set of 5 action figures. Each figure is meticulously crafted to resemble popular characters from blockbuster films, making it perfect for fans and collectors alike',7,'AFSuperheroes',3100.99,0),(8,'Educational Board Game - Math Whiz','Prime Climb is an engaging and educational board game that makes learning math fun and interactive. It’s designed to help players master basic arithmetic operations, including addition, subtraction, multiplication, and division, through strategic gameplay.',8,'MathWhizGame',200.00,0),(9,'Redmi A3 -Black','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bc',30000.99,2),(10,'Redmi A3 - Blue','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bl',32000.99,8),(11,'Samsung Galaxy A05','Samsung Galaxy A05 4GB 64GB (Brand New, Sealed pack)',10,'SAM-A05-4GB-64GB',32490.00,18),(12,'MSI Vector 16 HX','Experience unparalleled performance with the MSI Vector 16 HX A14V. Powered by the latest Intel Core i9 14th Gen processor and NVIDIA GeForce RTX 4070 graphics, this laptop is designed for gamers and professionals who demand the best.',11,'MSI-V16HX-A14V-4070',885472.00,1),(13,'Samsung Galaxy A05','Powered by the Mediatek Helio G85 processor and featuring a 6.7-inch display, this smartphone is perfect for everyday use. With 4GB RAM and storage options of 64GB or 128GB, expandable via microSD, you’ll have plenty of space for all your needs. Capture stunning photos with the 50MP dual rear cameras and enjoy long-lasting battery life with the 5000mAh battery and 25W fast charging. Running on Android 13, the Galaxy A05 offers the latest features and security updates.',10,'SAM-A05-4GB-128GB',34980.00,2),(14,'Samsung Galaxy A15','Powered by the Mediatek Helio G85 processor and featuring a 6.5-inch Super AMOLED display, this smartphone is perfect for both work and play. With 6GB RAM and 128GB storage, expandable via microSD, you’ll have ample space for all your needs. Capture stunning photos with the triple camera setup, including a 50MP main sensor. Enjoy long-lasting battery life with the 5000mAh battery and fast charging capabilities. Running on the latest Android OS, the Galaxy A15 offers cutting-edge features and security updates.',12,'SAM-A15-6GB-128GB',49990.00,19),(15,'Samsung Galaxy A15','Powered by the Mediatek Helio G85 processor and featuring a 6.5-inch Super AMOLED display, this smartphone is perfect for both work and play. With 4GB RAM and 64GB storage, expandable via microSD, you’ll have ample space for all your needs. Capture stunning photos with the triple camera setup, including a 50MP main sensor. Enjoy long-lasting battery life with the 5000mAh battery and fast charging capabilities. Running on the latest Android OS, the Galaxy A15 offers cutting-edge features and security updates.',12,'SAM-A15-4GB-64GB',45990.00,16),(16,'MSI Vector 17 HX','Experience unparalleled performance with the MSI Vector 17 HX. Powered by the latest Intel Core i7 14th Gen processor and NVIDIA GeForce RTX 4070 graphics, this laptop is designed for gamers and professionals who demand the best.',11,'MSI-V17HX-A14V-4070',999995.00,1),(17,'Solstar 43\" FHD LED Digital Television','Experience stunning visuals with the Solstar 43\" FHD LED TV. With a 43-inch Full HD display and multiple connectivity options (HDMI, USB, VGA), it’s perfect for all your entertainment needs. Enjoy high-quality audio with 2x6W speakers and a sleek design that fits any space.',13,'SOL-LED43HD6100SS',73990.00,20),(18,'Solstar 32\" FHD LED Digital Television','Experience stunning visuals with the Solstar 32\" FHD LED TV. With a 32-inch Full HD display and multiple connectivity options (HDMI, USB, VGA), it’s perfect for all your entertainment needs. Enjoy high-quality audio with 2x6W speakers and a sleek design that fits any space.',13,'SOL-LED32HD6100SS',63990.00,20),(19,'Samsung Crystal UHD Smart TV','Experience breathtaking visuals with the Samsung 55\" Crystal UHD Smart TV. Featuring a 4K UHD resolution and Dynamic Crystal Color technology, this TV delivers vibrant and lifelike images. The Crystal Processor 4K ensures smooth performance, while the sleek AirSlim design adds a modern touch to any room. Enjoy seamless streaming and smart features powered by Tizen OS.',14,'SAM-UA55BU8100KXXT',228605.00,19),(20,'Apple Macbook Air M1','Experience the power of the Apple MacBook Air M1. With 8GB RAM, 256GB SSD, and the M1 chip, it delivers exceptional performance and stunning visuals in a sleek, portable design.',2,'APP-MBA-M1-8GB-256GB',277550.00,0),(21,'Samsung HDR 4K Smart TV','This TV features Quantum Dot technology, delivering 100% Color Volume for vivid, lifelike colors at any brightness level. The Quantum Processor Lite with 4K Upscaling enhances clarity and depth in every scene. Dual LED backlights provide balanced colors and stronger contrast. Quantum HDR goes beyond standard HDR to create deep blacks and impressive contrast. Motion Xcelerator ensures smooth motion and improved clarity for high-intensity sports, movies, and games.',14,'QN43Q60CAFXZA',199990.00,10),(22,'M19 Earbuds Mic Full Set with Box','Enjoy high-quality sound with the M19 Earbuds. Featuring Bluetooth 5.0 for a stable connection, these earbuds offer stereo sound, a built-in mic, and a flashlight. Perfect for on-the-go use, they come with a charging case for convenience.',15,'M19-TWS-BT50',1500.00,11),(23,'M10 TWS Wireless Earbuds','Enjoy high-fidelity sound with the M10 TWS Wireless Earbuds. Featuring Bluetooth 4.0, touch control, and an LED digital display, these earbuds offer a seamless audio experience. With a built-in microphone and power bank, they are perfect for on-the-go use.',15,'M10-TWS-BT50',2350.00,0),(24,'ASPOR A323 Powerbank','The ASPOR A323 Powerbank offers 10000mAh capacity, fast charging, dual USB outputs, LED display, and two input options (Micro USB and Type-C) for versatile recharging.',17,'A323',1779.00,4),(25,'ASPOR A324 Powerbank','The ASPOR A324 Powerbank offers 20000mAh capacity, fast charging, dual USB outputs, LED display, and two input options (Micro USB and Type-C) for versatile recharging.',17,'A324',1979.00,3),(26,'13-Piece Multi-Jointed Shapeshift Robot','Unleash creativity with this 13-piece Multi-Jointed Shapeshift Robot 3D Printed Action Figure Set. Perfect for kids, adults, and parent-child bonding, these highly articulated action figures offer endless fun. Designed to mimic real-life movements, each figure is fully customizable and ideal for imaginative games, DIY crafting, or collector\'s display.',18,'MJ-SR-13-2024',600.00,4),(27,'13-Piece Multi-Jointed Shapeshift Robot','Unleash creativity with this 13-piece Multi-Jointed Shapeshift Robot 3D Printed Action Figure Set. Perfect for kids, adults, and parent-child bonding, these highly articulated action figures offer endless fun. Designed to mimic real-life movements, each figure is fully customizable and ideal for imaginative games, DIY crafting, or collector\'s display.',18,'MJ-SR-13-2024',500.00,0),(28,'Airpods Pro- Blue','Experience Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio with AirPods Pro 2. Dust, sweat, and water-resistant, with MagSafe Charging Case for up to 6 hours of listening.',20,'AP-PRO2-ADPT-AUD',12300.00,9),(29,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3355.00,19),(30,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3465.00,15),(31,'Airpods Pro - Red','Experience the ultimate in audio innovation with the AirPods Pro 3. Featuring Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio with dynamic head tracking, these earbuds offer an immersive listening experience. Dust, sweat, and water resistant, with a MagSafe Charging Case (USB-C) that includes a speaker and lanyard loop, they provide up to 6 hours of listening time on a single charge.',20,'AP-PRO3-ADPT-AUD',12500.00,3),(32,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3035.00,16),(33,'Marvel Superhero Iron Spider','Bring the excitement of Marvel superheroes to life with these building block action figures featuring Gwen Stacy, Miles Morales, and Iron Spider. Perfect for children and collectors alike, these figures are designed to be compatible with major building block sets. Made with high-quality materials, they’re great for imaginative play or as part of a display collection.',21,'KT1069-MSF',800.00,2),(34,'Marvel Superhero Iron Spider','Bring the excitement of Marvel superheroes to life with these building block action figures featuring Gwen Stacy, Miles Morales, and Iron Spider. Perfect for children and collectors alike, these figures are designed to be compatible with major building block sets. Made with high-quality materials, they’re great for imaginative play or as part of a display collection.',21,'KT1069-MSF',800.00,6),(35,'Rubic Cube','Professional 3x3x3 speed cube with 5.6 cm size, high-quality rotation, and durable design.',22,'SC5603',199.00,11),(36,'Wired USB PC Game Controller','Master your games with the Wired USB PC Game Controller. Compatible with Windows XP, 7, 8, and 10, this gamepad offers a comfortable and ergonomic design. Featuring plug-and-play functionality, it provides precise control with its responsive buttons and joystick. Perfect for PC gaming, this black game controller ensures an immersive gaming experience.',23,'USB-GAMEPAD-WIN',5500.00,0),(37,'Children Montessori Clock','Colorful Montessori clock toy for kids to learn hours, minutes, and seconds.',24,'MCET123Y',522.00,18),(38,'Children Montessori Clock','Colorful Montessori clock toy for kids to learn hours, minutes, and seconds.',24,'MCET123B',540.00,19),(39,'DualShock Wireless Controller','Elevate your gaming experience with the PS4 DualShock Wireless Controller. Designed for PlayStation, PC, laptops, and mobile devices, this AAA-grade controller offers precise control and comfort. With Bluetooth connectivity, it ensures seamless gameplay across multiple platforms.',23,'DS4-WL-AAA',7700.00,9),(40,'Lego set 585Pcs City Police Station SWAT Truck','SWAT Truck Car Building Blocks DIY Toys for Boys. Compatible with Lego and perfect for boys who love building their city police stations.',5,'LB585SWATp',5001.00,1),(41,'Lego set 585Pcs City Police Station SWAT Truck','SWAT Truck Car Building Blocks DIY Toys for Boys. Compatible with Lego and perfect for boys who love building their city police stations.',5,'LB554SWATp',4396.00,0),(42,'Mini 3D Glasses VR Headset','Immerse yourself in virtual reality with the BOX 5 Mini 3D Glasses. Designed for use with smartphones, this white VR headset offers a 360° unobstructed view and adjustable lenses for optimal comfort. Made from durable ABS material, it is lightweight and portable, perfect for on-the-go entertainment.',25,'BOX5-VR-WHT',3699.00,0),(43,'Keyboard Mini Foldable','Flexible Keyboard Mini Foldable Wired Usb Computer Keyboards Portable Waterproof Silicone Soft Slim Folding Gaming Keypad For Laptop',26,'FK-MFW-USB-WP-SLIM-GK-LT',1459.00,42),(44,'Wireless Bluetooth Keyboard','Wireless Bluetooth Keyboard for Android IOS Windows Slim Portable Universal Bluetooth-compatible Keyboard For PC Tablet Phone',27,'WBK-BT-UNI-Blc',2230.00,49),(45,'Wireless Bluetooth Keyboard','Wireless Bluetooth Keyboard for Android IOS Windows Slim Portable Universal Bluetooth-compatible Keyboard For PC Tablet Phone',27,'WBK-BT-UNI-Wh',2210.00,48),(46,'Gaming Mouse','7 Color RGB LED X1 1200DPI / M66 & ZORNWEE GM02 Gaming Mouse With Warranty.',28,'GM02-RGB-1200DPI',490.00,48),(47,'Bluetooth Wireless Mouse','Bluetooth Wireless Mouse with USB, BT5.2 Rechargeable RGB Mouse for Laptop, PC, Macbook, 2.4GHz, 1600DPI',29,'BWM-BT5.2-RGB-1600DPI',950.00,30),(48,'Kingston Pen Drive','Kingston 64GB Pen Drive DT50 Silver-Blue',30,'K64GB-DT50-SB',1436.00,27),(49,'Remote control Outdoor Flying Helicopter-red','Mini RC Induction Helicopter Aircraft With Altitude Hold Light USB Charging Flight Helicopter Outdoor Flying Helicopter -red',31,'RC-IND-HLPTR-RED-USB-AH',1606.00,91),(50,'Remote control Outdoor Flying Helicopter-blue','Mini RC Induction Helicopter Aircraft With Altitude Hold Light USB Charging Flight Helicopter Outdoor Flying Helicopter - blue',31,'RC-IND-HLPTR-BLACK-USB-AH',1606.00,92),(51,'Kingston Pen Drive','Kingston 32GB Pen Drive DT50 Silver-Red',30,'K32GB-DT50-SR',1228.00,37),(52,'Apple iPad','Apple iPad Air 6 2024 11″ M2 WiFi 128GB',32,'IPA6-11-M2-WIFI-128GB',226990.00,13),(53,'Apple iPad','Apple iPad Air 6 2024 11″ M2 WiFi 128GB',32,'IPAD9-10.2-WIFI-2021',132900.00,19),(54,'Remote Control Racing Car Super Model Car','Remote Control Racing Car Super Model High-Speed Motor 2.4GHz Remote USB Charging Durable Indoor Racing Car - Red',33,'RC-RC-SM-HS-24G-USB-RED',1290.00,75),(55,'Remote Control truck with off road tires LED Lights RC drift cars-Blue','Remote Control Off-Road Truck with LED Lights Heavy-Duty Tires High Torque Motor RC Drift Car Outdoor All-Terrain Vehicle - Blue',34,'RC-TRK-ORT-LT-LED-DRFT',3890.00,88),(56,'Mini Bluetooth Speaker','Jbl Charge 3+ Mini Bluetooth Speaker Big Bass Sound Ultra Loud Stereo Bluetooth Subwoofer Speaker Support USB TF AUX MIC Rechargeable Portable Party Box Speakers Low Price/Fast Shipping with 6 Month Warranty',35,'JBL3P-RGB-BB-USB',899.00,48),(57,'Mini Bluetooth Speaker','Jbl Charge 3+ Mini Bluetooth Speaker Big Bass Sound Ultra Loud Stereo Bluetooth Subwoofer Speaker Support USB TF AUX MIC Rechargeable Portable Party Box Speakers Low Price/Fast Shipping with 6 Month Warranty',35,'JBL3P-RGB-BB-USB',899.00,45),(58,'Remote Control truck with off road tires LED Lights RC drift cars-Green','Remote Control Off-Road Truck with LED Lights Heavy-Duty Tires High Torque Motor RC Drift Car Outdoor All-Terrain Vehicle - Green',34,'RC-TRK-ORT-LT-LED-DRFT-GREEN',3900.00,55),(59,'Ewis OCTA Intel N4020 Laptop','Ultra-light laptop with Intel N4020, FHD display, 128GB eMMC + 1TB HDD. Includes free Ewis backpack and USB mouse',37,'EWIS-X15GL-N4020-BUNDLE',98500.00,0),(60,'Bluetooth Speaker','Jbl Charge 3+ Mini Bluetooth Speaker Big Bass Sound Ultra Loud Stereo Bluetooth Subwoofer Speaker Support USB TF AUX MIC Rechargeable Portable Party Box Speakers Low Price/Fast Shipping with 6 Month Warranty',36,'JBL3P-BB-RGB-USB',1583.00,45),(61,'Bluetooth Speaker','Jbl Charge 3+ Mini Bluetooth Speaker Big Bass Sound Ultra Loud Stereo Bluetooth Subwoofer Speaker Support USB TF AUX MIC Rechargeable Portable Party Box Speakers Low Price/Fast Shipping with 6 Month Warranty',36,'JBL3P-BB-RGB-USB',1583.00,41),(62,'Brick Game Handheld Game Machine','Kids Electronic Tetris Brick Game Handheld Game Machine LCD Educational Toys',38,'B01GUASTIB',528.00,98),(63,'Brick Game Handheld Game Machine','Kids Electronic Tetris Brick Game Handheld Game Machine LCD Educational Toys',38,'B01GUASTIB',528.00,93),(64,'Action Figure Agatsuma Zenitsu','Anime Demon Slayer Kimetsu no Yaiba figure Action Figure Agatsuma Zenitsu Warrior PVC Model Toys',39,'B0B8NPVVC5',730.00,50),(65,'Action Figure Kamado Tanjirou','Anime Demon Slayer Kimetsu no Yaiba figure Kamado Tanjirou Action Figure Warrior PVC Model Toys',39,'B08JCBX2DP',730.00,50),(66,'Nezuko','Anime Demon Slayer Kimetsu no Yaiba figure Kamado Tanjirou Action Figure Nezuko Warrior PVC Model Toys',39,'B08JCBX2DP',730.00,50);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommercedb'
--

--
-- Dumping routines for database 'ecommercedb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetTopMainCategoryName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" FUNCTION "GetTopMainCategoryName"(catID INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE currentCategoryID INT;
    DECLARE topCategoryName VARCHAR(50);

    SET currentCategoryID = catID;

    -- Loop until we find a category with no parent
    WHILE currentCategoryID IS NOT NULL DO
        -- Check the parent of the current category
        SELECT ParentCategoryID INTO currentCategoryID
        FROM category
        WHERE CategoryID = currentCategoryID;

        -- If we find a category with no parent, retrieve the category name
        IF currentCategoryID IS NULL THEN
            SELECT CategoryName INTO topCategoryName
            FROM category
            WHERE CategoryID = catID;  -- Use the last valid catID to get the name
        ELSE
            SET catID = currentCategoryID;  -- Move to the next parent category
        END IF;
    END WHILE;

    RETURN topCategoryName;  -- Return the top category name
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetUserCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" FUNCTION "GetUserCount"() RETURNS int
BEGIN
    DECLARE totalCount INT;

    SELECT COUNT(*) INTO totalCount FROM user;  -- Assuming your table name is 'user'
    
    RETURN totalCount;  -- Return the total user count
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "AddAddress"(
    IN AddressNumber VARCHAR(10),
    IN Lane VARCHAR(50),
    IN City VARCHAR(50),
    IN PostalCode VARCHAR(10),
    IN District VARCHAR(50),
    OUT AddressID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error adding address' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert the new address
    INSERT INTO `address` (AddressNumber, Lane, City, PostalCode, District)
    VALUES (AddressNumber, Lane, City, PostalCode, District);

    -- Get the last inserted AddressID
    SET AddressID = LAST_INSERT_ID();

    COMMIT;

    -- Return success message and AddressID
    SELECT 'Address added successfully' AS message, AddressID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddToCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "AddToCart"(IN VID INT, IN CID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error adding to cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Check if the variant exists
    IF EXISTS (SELECT * FROM variant WHERE VariantID = VID) THEN

        -- Check if the product variant is already in the cart
        IF EXISTS (SELECT * FROM cartitem WHERE VariantID = VID AND CartID = CID) THEN
            -- Update the quantity
            UPDATE cartitem SET Quantity = Quantity + 1 WHERE VariantID = VID AND CartID = CID;
        ELSE
            -- Insert the product variant into the CartItem table
            INSERT INTO cartitem (VariantID, CartID, Quantity) VALUES (VID, CID, 1);
        END IF;

        COMMIT;
        SELECT 'Added to cart successfully' AS message;

    ELSE
        -- If the variant does not exist
        SELECT 'Product variant not found' AS message;
        ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddUserAndGetCartID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "AddUserAndGetCartID"(
    IN PhoneNumber CHAR(10),
    IN FirstName VARCHAR(50),
    IN LastName VARCHAR(50),
    IN Role ENUM('Registered', 'UnRegistered'),
    OUT UserID INT,
    OUT CartID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error adding user' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert the new user
    INSERT INTO `user` (PhoneNumber, FirstName, LastName, Role)
    VALUES (PhoneNumber, FirstName, LastName, Role);

    -- Get the last inserted UserID
    SET UserID = LAST_INSERT_ID();

    -- Insert a new cart for the newly registered user
    INSERT INTO `cart` (UserID)
    VALUES (UserID);

    -- Get the last inserted CartID
    SET CartID = LAST_INSERT_ID();

    COMMIT;

    -- Return success message and CartID
    SELECT 'User and cart added successfully' AS message, UserID, CartID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "CreateAdmin"(
    IN AdminUserName VARCHAR(50),
    IN FirstName VARCHAR(50),
    IN LastName VARCHAR(50),
    IN Password VARCHAR(100),
    IN Email VARCHAR(100)
)
BEGIN
    -- Insert new admin record
    INSERT INTO administrator (AdminUserName, FirstName, LastName, Password, Email)
    VALUES (AdminUserName, FirstName, LastName, Password, Email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "CreateUser"(
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN userName VARCHAR(255),
    IN phoneNumber VARCHAR(20),
    IN email VARCHAR(255),
    IN password VARCHAR(255),
    IN addressNumber VARCHAR(255),
    IN lane VARCHAR(255),
    IN city VARCHAR(255),
    IN postalCode VARCHAR(20),
    IN district VARCHAR(255),
    OUT userId INT,
    OUT addressId INT
)
BEGIN
    -- Insert the new user into the User table
    INSERT INTO `user` (PhoneNumber, FirstName, LastName, Role)
    VALUES (phoneNumber, firstName, lastName, 'Registered');
    SET userId = LAST_INSERT_ID(); -- Get the newly inserted user ID

    -- Insert the user's address into the Address table
    INSERT INTO `address` (AddressNumber, Lane, City, PostalCode, District)
    VALUES (addressNumber, lane, city, postalCode, district);
    SET addressId = LAST_INSERT_ID(); -- Get the newly inserted address ID

    -- Insert the user into the RegisteredCustomer table
    INSERT INTO `registeredcustomer` (UserID, UserName, Email, Password, AddressID)
    VALUES (userId, userName, email, password, addressId);
    
      -- Insert a new cart for the newly registered user
    INSERT INTO `cart` (UserID)
    VALUES (userId);
    
    

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "DeleteUser"(IN uId INT)
BEGIN
    DELETE FROM user WHERE UserID = uId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "DropOrder"(IN oID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error dropping order' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Delete the order
    DELETE FROM `order` WHERE OrderID = oID;

    COMMIT;
    SELECT 'Order dropped successfully' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdminByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "getAdminByEmail"(IN inputEmail VARCHAR(255))
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    -- Check if email exists in RegisteredCustomer table
    SELECT COUNT(*) INTO user_exists
    FROM administrator
    WHERE Email = inputEmail;

    -- If no user is found, raise an error
    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User email is incorrect';
    ELSE
        -- Fetch user details if the email exists
        SELECT *
        FROM administrator
        WHERE Email = inputEmail;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBackorderQuantities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetBackorderQuantities"()
BEGIN
    -- Select the total quantity of backorders for each variant along with the variant name
    SELECT 
        v.VariantID, 
        v.VariantName, 
        SUM(b.Quantity) AS totalQuantity
    FROM 
        backorders b
    JOIN 
        variant v ON b.VariantID = v.VariantID
    GROUP BY 
        v.VariantID, v.VariantName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetCart"(IN userId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT ci.*, v.VariantName, v.Price, i.ImageLink
    FROM cartitem ci
    JOIN cart c ON ci.CartID = c.CartID
    JOIN variant v ON ci.VariantID = v.VariantID
    JOIN product p ON v.ProductID = p.ProductID
    JOIN image i ON i.VariantID = v.VariantID
    WHERE c.UserID = userId;

    COMMIT;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCartId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetCartId"(IN Id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching cart ID' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT CartID FROM cart WHERE UserID = Id;

    COMMIT;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCartIDByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetCartIDByUserID"(IN inputUserID INT)
BEGIN
    SELECT CartID 
    FROM cart 
    WHERE UserID = inputUserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDeals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetDeals"()
begin
	SELECT COUNT(OrderID) AS totalDeals FROM `order`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDeliveryData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetDeliveryData"(
    IN p_orderID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error retrieving delivery data' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Select delivery data
    SELECT 
        d.EstimateDate,
        a.AddressNumber,
        a.Lane,
        a.City,
        a.District
    FROM 
        deliverymodule d
    LEFT OUTER JOIN 
        address a ON a.AddressID = d.AddressID
    WHERE 
        d.OrderID = p_orderID;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDistinctVariantDetailsByTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetDistinctVariantDetailsByTitle"(IN searchTerm VARCHAR(100))
BEGIN
    SELECT 
        v.VariantID,
        p.ProductID,
        p.Title,
        MIN(c.CategoryID) AS CategoryID,  -- Get the minimum CategoryID if multiple categories exist
        MIN(c.CategoryName) AS CategoryName,  -- Get the minimum CategoryName if multiple categories exist
        MIN(img.ImageLink) AS image_link,  -- Get the minimum image link if multiple images exist
        v.Price
    FROM 
        product p
    JOIN 
        variant v ON p.ProductID = v.ProductID
    JOIN 
        image img ON v.VariantID = img.VariantID
    JOIN 
        productcategory pc ON p.ProductID = pc.ProductID
    JOIN 
        category c ON pc.CategoryID = c.CategoryID
    WHERE 
        p.Title LIKE CONCAT('%', searchTerm, '%')
    GROUP BY 
        v.VariantID, p.ProductID, p.Title, v.Price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMonthlyEarnings2024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetMonthlyEarnings2024"()
BEGIN
    SELECT 
        DATE_FORMAT(OrderDate, '%Y-%m') AS Month,  -- Format the date as Year-Month
        COALESCE(SUM(OrderTotal), 0) AS TotalEarnings  -- Sum of all order totals, replacing NULL with 0
    FROM 
        `order`  -- The table containing orders
    WHERE 
        YEAR(OrderDate) = 2024  -- Filter for the year 2024
    GROUP BY 
        Month  -- Group by the month (Year-Month)
    ORDER BY 
        Month; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetOrderDetails"(IN orderId INT)
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.DeliveryType,
        o.PaymentMethod,
        o.OrderTotal,
        oi.Quantity,
        v.VariantName,
        v.Price,
        img.ImageLink
    FROM 
        `order` o
    JOIN 
        orderitem oi ON o.OrderID = oi.OrderID
    JOIN 
        variant v ON oi.VariantID = v.VariantID
    LEFT JOIN 
        image img ON v.VariantID = img.VariantID
    WHERE 
        o.OrderID = orderId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrderReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetOrderReport"()
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.OrderTotal,
        o.UserID,
        c.CustomerName,
        c.Email,
        c.PhoneNumber,
        CONCAT(c.AddressNumber, ', ', c.Lane, ', ', c.City, ', ', c.PostalCode, ', ', c.District) AS ShippingAddress,
        o.PaymentMethod,
        o.DeliveryType,
        o.EstimateDate,
        p.ProductID,
        p.ProductName,
        p.QuantityOrdered
    FROM orderinfo o
    JOIN customerinfo c ON o.UserID = c.UserID
    LEFT JOIN productinfo p ON o.OrderID = p.OrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetOrders"(IN uID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching orders' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Fetch orders for the user
    SELECT 
		o.OrderID, 
		o.OrderDate,
		o.PaymentMethod,
		o.DeliveryType,
		o.OrderTotal,
		a.AddressNumber,
		a.Lane,
		a.City,
		a.PostalCode,
		a.District
	FROM `order` o
	JOIN address a on a.AddressID = o.AddressID
	WHERE UserID = uID;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetProductAttribute"(IN VariantID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching product attributes' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Fetch product attributes
    SELECT pa.VariantID, pa.AttributeValue, a.AttributeName
    FROM productattribute pa
    LEFT JOIN attributes a ON pa.AttributeID = a.AttributeID
    WHERE pa.VariantID = VariantID;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductSalesByMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetProductSalesByMonth"(IN startDate DATE, IN endDate DATE)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error by raising a custom error message
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error fetching product sales';
    END;

    -- Validate input dates
    IF startDate IS NULL OR endDate IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date and end date cannot be NULL.';
    END IF;

    IF startDate > endDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date must be less than or equal to end date.';
    END IF;

    -- Fetch product sales
    SELECT 
        p.Title AS productName, 
        DATE_FORMAT(o.OrderDate, '%Y-%m') AS month,  -- Extract year and month
        SUM(oi.Quantity) AS totalQuantitySold
    FROM 
        orderitem oi
    JOIN 
        variant v ON oi.VariantID = v.VariantID
    JOIN 
        product p ON v.ProductID = p.ProductID
    JOIN 
        `order` o ON oi.OrderID = o.OrderID  -- Escape the "order" table name
    WHERE 
        o.OrderDate BETWEEN startDate AND endDate
    GROUP BY 
        p.Title, month  -- Group by product and month
    ORDER BY 
        month, p.Title;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductsWithMostNumberOfSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetProductsWithMostNumberOfSales"(IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT p.Title AS productName, 
           DATE_FORMAT(o.OrderDate, '%Y-%m') AS month,  -- Extract year and month
           SUM(oi.Quantity) AS totalQuantitySold
    FROM orderitem oi
    JOIN variant v ON oi.VariantID = v.VariantID
    JOIN product p ON v.ProductID = p.ProductID
    JOIN `order` o ON oi.OrderID = o.OrderID
    WHERE o.OrderDate BETWEEN startDate AND endDate
    GROUP BY p.Title, month  -- Group by product and month
    ORDER BY month, p.Title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductTitles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetProductTitles"()
BEGIN
    SELECT Title, ProductID
    FROM product;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductVariants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetProductVariants"(IN ProductID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching product variants' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Fetch product variants
    SELECT v.*, p.*, i.*
    FROM variant v
    LEFT JOIN product p ON v.ProductID = p.ProductID
    LEFT JOIN image i ON v.VariantID = i.VariantID
    WHERE p.ProductID = ProductID;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductVariantsByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetProductVariantsByCategory"(IN categoryNameInput VARCHAR(50))
BEGIN
    -- Step 1: Recursive CTE to find the category tree (including parents and children)
    WITH RECURSIVE CategoryTree AS (
        -- Find the category matching the input name with wildcards for partial match
        SELECT CategoryID
        FROM category
        WHERE CategoryName LIKE CONCAT('%', categoryNameInput, '%')  -- Added wildcards
        
        UNION ALL
        
        -- Recursively find parent categories and their children
        SELECT c.CategoryID
        FROM category c
        INNER JOIN CategoryTree ct ON c.ParentCategoryID = ct.CategoryID
    ),

    -- Step 2: Get ranked products with variants and images
    RankedProducts AS (
        SELECT 
            v.VariantID,
            v.Price,
            p.ProductID, 
            p.Title, 
            pc.CategoryID, 
            c.CategoryName,
            i.ImageLink AS image_link,
            ROW_NUMBER() OVER (PARTITION BY p.ProductID ORDER BY p.ProductID) AS row_num
        FROM 
            product p
            JOIN productcategory pc ON p.ProductID = pc.ProductID
            JOIN category c ON pc.CategoryID = c.CategoryID
            JOIN variant v ON p.ProductID = v.ProductID
            JOIN image i ON v.VariantID = i.VariantID
        WHERE 
            pc.CategoryID IN (SELECT CategoryID FROM CategoryTree)  -- Categories from the CTE
    )

    -- Step 3: Select the required product information
    SELECT 
        ProductID, 
        Title, 
        CategoryID, 
        CategoryName, 
        image_link,
        VariantID,
        Price
    FROM 
        RankedProducts
    WHERE 
        row_num = 1;  -- Get only one variant per product

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSalesByQuarter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetSalesByQuarter"(
    IN input_year INT,
    IN input_category VARCHAR(255)
)
BEGIN
    SELECT 
        QUARTER(o.OrderDate) AS quarter, 
        SUM(DISTINCT oi.Quantity) AS sales  -- Use DISTINCT to sum unique quantities
    FROM 
        `order` o 
        RIGHT JOIN orderitem oi USING(OrderID) 
        LEFT JOIN variant v USING(VariantID) 
        LEFT JOIN productcategory pc USING(ProductID)
    WHERE 
        (input_year IS NULL OR YEAR(o.OrderDate) = input_year) 
        AND 
        (input_category IS NULL OR input_category = GetTopMainCategoryName(pc.CategoryID) COLLATE utf8mb4_unicode_ci)
    GROUP BY 
        QUARTER(o.OrderDate)
    ORDER BY 
        QUARTER(o.OrderDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetTopCategories"()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error by raising a custom error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error fetching top categories';
    END;

    -- Fetch the top categories
    SELECT 
        c.CategoryName, 
        COUNT(o.OrderID) AS OrderCount
    FROM 
        category c
    LEFT JOIN 
        productcategory pc ON c.CategoryID = pc.CategoryID
    LEFT JOIN 
        product p ON pc.ProductID = p.ProductID
    LEFT JOIN 
        variant v ON p.ProductID = v.ProductID
    LEFT JOIN 
        orderitem o ON v.VariantID = o.VariantID
    GROUP BY 
        c.CategoryID, c.CategoryName
    ORDER BY 
        OrderCount DESC
    LIMIT 10;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTotalRevenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetTotalRevenue"()
BEGIN
    SELECT SUM(OrderTotal) AS totalRevenue FROM `order`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetUserByEmail"(IN inputEmail VARCHAR(255))
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    -- Check if email exists in RegisteredCustomer table
    SELECT COUNT(*) INTO user_exists
    FROM registeredcustomer
    WHERE Email = inputEmail;

    -- If no user is found, raise an error
    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User email is incorrect';
    ELSE
        -- Fetch user details if the email exists
        SELECT * 
        FROM registeredcustomer
        WHERE Email = inputEmail;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetUserInfo"(IN userId INT)
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM `user`
    WHERE UserID = userId;

    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist';
    ELSE
        SELECT 
            `user`.FirstName,
            `user`.LastName,
            `user`.PhoneNumber,
            registeredcustomer.UserName,
            registeredcustomer.Email,
            address.AddressNumber,
            address.Lane,
            address.City,
            address.PostalCode,
            address.District
        FROM `user`
        JOIN registeredcustomer ON `user`.UserID = registeredcustomer.UserID
        JOIN address ON registeredcustomer.AddressID = address.AddressID
        WHERE `user`.UserID = userId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserNameByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetUserNameByID"(IN userId INT)
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM `user`
    WHERE UserID = userId;

    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not a registered customer';
    ELSE
        SELECT 
            registeredcustomer.UserName
        FROM `user`
        JOIN registeredcustomer ON `user`.UserID = registeredcustomer.UserID
        WHERE `user`.UserID = userId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetUsers"()
BEGIN
    DECLARE exit HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the SQL exception
        SELECT 'An error occurred while retrieving users.' AS error_message;
    END;

    -- Try to select users
    SELECT * FROM user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVariant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "GetVariant"(IN VariantID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching variant details' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Fetch variant details
    SELECT v.VariantID, v.VariantName, v.Price, i.ImageLink
    FROM variant v
    LEFT OUTER JOIN image i ON v.VariantID = i.VariantID
    WHERE v.VariantID = VariantID;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlaceOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "PlaceOrder"(
    IN p_userID INT,
    IN p_cartID INT,
    IN p_deliveryType ENUM('storePickup', 'delivery','Fedex','DHL'),
    IN p_paymentMethod ENUM('card', 'COD'),
    IN p_addressID INT
)
BEGIN
    DECLARE totalPrice DECIMAL(10, 2);
    DECLARE orderID INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error placing order' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Fetch cart items and calculate total price
    SELECT SUM(v.Price * ci.Quantity) INTO totalPrice
    FROM cartitem ci
    JOIN variant v ON ci.VariantID = v.VariantID
    WHERE ci.CartID = p_cartID;

    -- Ensure totalPrice is not zero
    IF totalPrice IS NULL OR totalPrice = 0 THEN
        SELECT 'Total price is zero, cannot proceed with order.' AS message;
        ROLLBACK;
    ELSE
        -- Insert into orders table
        INSERT INTO `order` (UserID, OrderDate, DeliveryType, PaymentMethod, OrderTotal, AddressID)
        VALUES (p_userID, CURRENT_DATE, p_deliveryType, p_paymentMethod, totalPrice, p_addressID);

        -- Get the last inserted orderID
        SET orderID = LAST_INSERT_ID();

        -- Insert into orderitem table for each cart item
        INSERT INTO orderitem (OrderID, VariantID, Quantity)
        SELECT orderID, ci.VariantID, ci.Quantity
        FROM cartitem ci
        WHERE ci.CartID = p_cartID;

        -- Empty the cart table
        DELETE FROM cartitem WHERE CartID = p_cartID;

        -- Commit the transaction
        COMMIT;

        -- Return the orderID along with the success message
        SELECT orderID AS OrderID, 'Order placed successfully' AS message;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAllFromCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "RemoveAllFromCart"(IN CID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error removing all from cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Remove all items from the cart
    DELETE FROM cartitem WHERE CartID = CID;

    COMMIT;
    SELECT 'Removed all items from cart successfully' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveFromCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "RemoveFromCart"(IN VID INT, IN CID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error removing from cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Check if the product variant is in the cart
    IF EXISTS (SELECT * FROM cartitem WHERE VariantID = VID AND CartID = CID) THEN
        -- Check the quantity
        IF (SELECT Quantity FROM cartitem WHERE VariantID = VID AND CartID = CID) > 1 THEN
            -- Update the quantity
            UPDATE cartitem SET Quantity = Quantity - 1 WHERE VariantID = VID AND CartID = CID;
        ELSE
            -- Remove the product variant from the cart
            DELETE FROM cartitem WHERE VariantID = VID AND CartID = CID;
        END IF;

        COMMIT;
        SELECT 'Removed from cart successfully' AS message;

    ELSE
        -- If the product variant is not in the cart
        SELECT 'Product variant not found in cart' AS message;
        ROLLBACK;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UnRegSetCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "UnRegSetCart"(IN VariantID INT, IN CartID INT, IN Quantity INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error performing cart operation' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert or update the cart item
    INSERT INTO cartitem (VariantID, CartID, Quantity)
    VALUES (VariantID, CartID, Quantity)
    ON DUPLICATE KEY UPDATE Quantity = VALUES(Quantity);

    COMMIT;
    SELECT 'Cart operation successful' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customerinfo`
--

/*!50001 DROP VIEW IF EXISTS `customerinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`avnadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customerinfo` AS select distinct `u`.`UserID` AS `UserID`,concat(`u`.`FirstName`,' ',`u`.`LastName`) AS `CustomerName`,`rc`.`Email` AS `Email`,`u`.`PhoneNumber` AS `PhoneNumber`,`a`.`AddressNumber` AS `AddressNumber`,`a`.`Lane` AS `Lane`,`a`.`City` AS `City`,`a`.`PostalCode` AS `PostalCode`,`a`.`District` AS `District` from (((`order` `o` left join `user` `u` on((`o`.`UserID` = `u`.`UserID`))) left join `registeredcustomer` `rc` on((`u`.`UserID` = `rc`.`UserID`))) left join `address` `a` on((`o`.`AddressID` = `a`.`AddressID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderinfo`
--

/*!50001 DROP VIEW IF EXISTS `orderinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`avnadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orderinfo` AS select `o`.`OrderID` AS `OrderID`,`o`.`OrderDate` AS `OrderDate`,`o`.`OrderTotal` AS `OrderTotal`,`o`.`UserID` AS `UserID`,`o`.`PaymentMethod` AS `PaymentMethod`,`o`.`DeliveryType` AS `DeliveryType`,`d`.`EstimateDate` AS `EstimateDate` from (`order` `o` left join `deliverymodule` `d` on((`o`.`OrderID` = `d`.`OrderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productinfo`
--

/*!50001 DROP VIEW IF EXISTS `productinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`avnadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `productinfo` AS select `oi`.`OrderID` AS `OrderID`,`v`.`VariantID` AS `ProductID`,`v`.`VariantName` AS `ProductName`,`oi`.`Quantity` AS `QuantityOrdered` from (`orderitem` `oi` join `variant` `v` on((`oi`.`VariantID` = `v`.`VariantID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 22:00:21
