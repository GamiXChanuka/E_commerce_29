CREATE DATABASE  IF NOT EXISTS `ecommerce2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce2`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce2
-- ------------------------------------------------------
-- Server version	8.0.37

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123','Main St','New York','10001','Manhattan'),(2,'456','Elm St','Los Angeles','90001','Downtown'),(3,'789','Maple Ave','Chicago','60601','Loop'),(4,'123','Main St','New York','10001','Manhattan'),(5,'456','Elm St','Los Angeles','90001','Downtown'),(6,'789','Maple Ave','Chicago','60601','Loop'),(7,'2','1st lane','colombo','1010','Colombo');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'admin123','Admin','User','adminpassword','admin@example.com');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Color'),(2,'Storage'),(3,'RAM');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backorders`
--

LOCK TABLES `backorders` WRITE;
/*!40000 ALTER TABLE `backorders` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1);
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
INSERT INTO `cartitem` VALUES (1,1,3),(2,1,3),(3,1,4),(4,1,3),(7,1,3),(8,1,1),(9,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics',NULL),(2,'Mobile Phones',1),(3,'Laptops',1),(4,'Home Appliances',NULL),(5,'Toys',NULL),(6,'Action Figures',5),(7,'Dolls',5),(8,'Educational Toys',5),(9,'Gaming Device',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverymodule`
--

LOCK TABLES `deliverymodule` WRITE;
/*!40000 ALTER TABLE `deliverymodule` DISABLE KEYS */;
INSERT INTO `deliverymodule` VALUES (1,41,'2023-09-05',1),(2,42,'2023-09-06',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-14-pro/iphone-14-pro-deep-purple.jpg',1),(2,'https://celltronics.lk/wp-content/uploads/2022/09/Apple-iPhone-14-pro-2.jpg',2),(3,'https://img.drz.lazcdn.com/static/lk/p/8b2d5fdf01f0562a6c7c2065e0c2ff9d.jpg_200x200q80.jpg_.webp',3),(4,'https://img.drz.lazcdn.com/static/lk/p/292aa54e558f4b630ce4855478f65f88.jpg_200x200q80.jpg_.webp',4),(7,'https://img.drz.lazcdn.com/static/lk/p/a337b7a6699a1f8cc10650bbc5b02c6b.jpg_200x200q80.jpg_.webp',5),(8,'https://img.drz.lazcdn.com/static/lk/p/b006cd13bcdc791ce6b91f4b05e1c988.jpg_200x200q80.jpg_.webp',6),(9,'https://img.drz.lazcdn.com/static/lk/p/0414db07b3b792e896410bd830b0fc05.jpg_200x200q80.jpg_.webp',7),(10,'https://img.drz.lazcdn.com/g/kf/S64f080ae314d4e32b7f1952a3f21da4eG.jpg_200x200q80.jpg_.webp',8),(11,'https://ae-pic-a1.aliexpress-media.com/kf/S4c420d7254b84636b6f29fd69ee21c210.jpg_640x640.jpg_.webp',9),(12,'https://ae-pic-a1.aliexpress-media.com/kf/Sae45a069c13c46329873a8dab6396d56Q.jpg_640x640.jpg_.webp',10);
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
  `DeliveryType` enum('storePickup','delivery') NOT NULL,
  `PaymentMethod` enum('card','COD') NOT NULL,
  `OrderTotal` decimal(10,2) NOT NULL,
  `AddressID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (41,1,'2024-10-01','delivery','card',1999.98,1),(42,1,'2024-10-02','delivery','card',2074.95,1),(45,1,'2024-10-07','delivery','card',12999.87,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_order_delete` BEFORE DELETE ON `order` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `orderitem` VALUES (41,1,2),(42,1,2),(42,6,3),(45,1,13);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_stock_before_insert_order` BEFORE INSERT ON `orderitem` FOR EACH ROW BEGIN
    DECLARE current_stock INT;

    -- Fetch current stock for the variant
    SELECT StockCount INTO current_stock FROM Variant WHERE VariantID = NEW.VariantID;

    -- Check if the order quantity exceeds available stock
    IF NEW.Quantity > current_stock THEN
        -- Log oversell in Backorders table
        INSERT INTO Backorders (VariantID, Quantity, OrderID)
        VALUES (NEW.VariantID, NEW.Quantity - current_stock, NEW.OrderID);

        -- Update stock to 0 since it's oversold
        UPDATE Variant SET StockCount = 0 WHERE VariantID = NEW.VariantID;
    ELSE
        -- Deduct stock if sufficient
        UPDATE Variant
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 14 Pro'),(2,'MacBook Pro'),(3,'Washing Machine'),(5,'Lego Building Set'),(6,'Barbie Doll'),(7,'Action Figure Set'),(8,'Educational Board Game'),(9,'Redmi A3');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattribute`
--

LOCK TABLES `productattribute` WRITE;
/*!40000 ALTER TABLE `productattribute` DISABLE KEYS */;
INSERT INTO `productattribute` VALUES (1,1,1,'Black'),(2,2,1,'128GB'),(3,1,2,'Silver'),(4,2,2,'256GB'),(5,3,3,'16GB'),(6,1,5,'Multi-Color'),(7,2,5,'1500 Pieces'),(8,1,6,'Pink'),(10,1,7,'Various'),(12,1,8,'Multi-Color'),(14,1,9,'black'),(15,1,10,'blue'),(16,2,9,'128GB'),(17,2,10,'128GB');
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
INSERT INTO `productcategory` VALUES (1,2),(1,9),(2,3),(3,4),(5,5),(6,7),(7,6),(8,8),(9,2),(9,9);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `registeredcustomer` VALUES (1,'johndoe','john@example.com','password123',1),(2,'janesmith','jane@example.com','securepass',2),(7,'InduwaraB','abc@gmail.com','$2a$10$CGzOQOaykjGp.MuysbIdJetX7V3lVp8Se7VfX1H4B2YrpujSNvfO6',7);
/*!40000 ALTER TABLE `registeredcustomer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1234567890','John','Doe','Registered'),(2,'0987654321','Jane','Smith','Registered'),(3,'1122334455','Alice','Johnson','UnRegistered'),(4,'1234567890','John','Doe','Registered'),(5,'0987654321','Jane','Smith','Registered'),(6,'1122334455','Alice','Johnson','UnRegistered'),(7,'0772209691','Induwara','Rathnayake','Registered');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `VariantID` int NOT NULL AUTO_INCREMENT,
  `VariantName` varchar(50) NOT NULL,
  `Description` text,
  `ProductID` int NOT NULL,
  `SKU` varchar(20) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockCount` int NOT NULL,
  PRIMARY KEY (`VariantID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,'iPhone 14 Pro - 128GB','The latest iPhone with 128GB storage',1,'IP14P128',999.99,0),(2,'iPhone 14 Pro - 256GB','The latest iPhone with 256GB storage',1,'IP14P256',1099.99,5),(3,'MacBook Pro - 16GB RAM','MacBook Pro with M2 chip and 16GB RAM',2,'MBP16',2399.99,5),(4,'Washing Machine - 8kg','Front-load washing machine with 8kg capacity',3,'WM8KG',499.99,15),(5,'Lego Building Set - 1500 Pieces','A large Lego set for building multiple models',5,'Lego1500',59.99,10),(6,'Barbie Doll - Classic','A classic Barbie doll with accessories',6,'BarbieClassic',24.99,17),(7,'Action Figure Set - Superheroes','Set of 5 action figures from popular superhero movies',7,'AFSuperheroes',39.99,15),(8,'Educational Board Game - Math Whiz','A fun board game to learn math skills',8,'MathWhizGame',29.99,5),(9,'Redmi A3','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bc',30.99,10),(10,'Redmi A3','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bl',32.99,10);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce2'
--

--
-- Dumping routines for database 'ecommerce2'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUser`(
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
    INSERT INTO User (PhoneNumber, FirstName, LastName, Role)
    VALUES (phoneNumber, firstName, lastName, 'Registered');
    SET userId = LAST_INSERT_ID(); -- Get the newly inserted user ID

    -- Insert the user's address into the Address table
    INSERT INTO Address (AddressNumber, Lane, City, PostalCode, District)
    VALUES (addressNumber, lane, city, postalCode, district);
    SET addressId = LAST_INSERT_ID(); -- Get the newly inserted address ID

    -- Insert the user into the RegisteredCustomer table
    INSERT INTO RegisteredCustomer (UserID, UserName, Email, Password, AddressID)
    VALUES (userId, userName, email, password, addressId);

    COMMIT;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserByEmail`(IN inputEmail VARCHAR(255))
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    -- Check if email exists in RegisteredCustomer table
    SELECT COUNT(*) INTO user_exists
    FROM RegisteredCustomer
    WHERE Email = inputEmail;

    -- If no user is found, raise an error
    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User email is incorrect';
    ELSE
        -- Fetch user details if the email exists
        SELECT * 
        FROM RegisteredCustomer
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserInfo`(IN userId INT)
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM User
    WHERE UserID = userId;

    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist';
    ELSE
        SELECT 
            user.FirstName,
            user.LastName,
            user.PhoneNumber,
            registeredcustomer.UserName,
            registeredcustomer.Email,
            Address.AddressNumber,
            Address.Lane,
            Address.City,
            Address.PostalCode,
            Address.District
        FROM User
        JOIN RegisteredCustomer ON User.UserID = RegisteredCustomer.UserID
        JOIN Address ON registeredcustomer.AddressID = Address.AddressID
        WHERE User.UserID = userId;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserNameByID`(IN userId INT)
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM User
    WHERE UserID = userId;

    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not a registered customer';
    ELSE
        SELECT 
            registeredcustomer.UserName
        FROM User
        JOIN RegisteredCustomer ON User.UserID = RegisteredCustomer.UserID
        WHERE User.UserID = userId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17  2:45:32
