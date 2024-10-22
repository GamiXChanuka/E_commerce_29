CREATE DATABASE  IF NOT EXISTS `ecommerce4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce4`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce4
-- ------------------------------------------------------
-- Server version	9.0.0

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1','suboda road','Moratuwa','12345','Colombo');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Color'),(2,'Storage'),(3,'RAM'),(4,'GPU'),(5,'CPU'),(6,'Size'),(7,'Bluetooth'),(8,'Capacity'),(9,'Pieces');
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
INSERT INTO `cartitem` VALUES (1,1,2),(11,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics',NULL),(2,'Mobile Phones',1),(3,'Laptops',1),(4,'Home Appliances',NULL),(5,'Toys',NULL),(6,'Action Figures',5),(7,'Dolls',5),(8,'Educational Toys',5),(9,'Gaming Device',1),(10,'TV',1),(11,'Ear buds',1),(12,'Powerbank',1),(13,'Headset',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverymodule`
--

LOCK TABLES `deliverymodule` WRITE;
/*!40000 ALTER TABLE `deliverymodule` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-14-pro/iphone-14-pro-deep-purple.jpg',1),(2,'https://celltronics.lk/wp-content/uploads/2022/09/Apple-iPhone-14-pro-2.jpg',2),(3,'https://img.drz.lazcdn.com/static/lk/p/8b2d5fdf01f0562a6c7c2065e0c2ff9d.jpg_200x200q80.jpg_.webp',3),(4,'https://img.drz.lazcdn.com/static/lk/p/292aa54e558f4b630ce4855478f65f88.jpg_200x200q80.jpg_.webp',4),(7,'https://img.drz.lazcdn.com/static/lk/p/a337b7a6699a1f8cc10650bbc5b02c6b.jpg_200x200q80.jpg_.webp',5),(8,'https://img.drz.lazcdn.com/static/lk/p/b006cd13bcdc791ce6b91f4b05e1c988.jpg_200x200q80.jpg_.webp',6),(9,'https://img.drz.lazcdn.com/static/lk/p/0414db07b3b792e896410bd830b0fc05.jpg_200x200q80.jpg_.webp',7),(10,'https://img.drz.lazcdn.com/g/kf/S64f080ae314d4e32b7f1952a3f21da4eG.jpg_200x200q80.jpg_.webp',8),(11,'https://ae-pic-a1.aliexpress-media.com/kf/S4c420d7254b84636b6f29fd69ee21c210.jpg_640x640.jpg_.webp',9),(12,'https://ae-pic-a1.aliexpress-media.com/kf/Sae45a069c13c46329873a8dab6396d56Q.jpg_640x640.jpg_.webp',10),(13,'https://img.drz.lazcdn.com/static/lk/p/87c426910ba267680285aed42c2ec520.jpg_720x720q80.jpg_.webp',12),(14,'https://img.drz.lazcdn.com/static/lk/p/acba5ee28b71820a32004761c0848d5b.jpg_720x720q80.jpg_.webp',11),(15,'https://img.drz.lazcdn.com/static/lk/p/acba5ee28b71820a32004761c0848d5b.jpg_720x720q80.jpg_.webp',13),(16,'https://img.drz.lazcdn.com/g/kf/Sd195d712838943fe8563c2c46fc76a1dE.jpg_720x720q80.jpg_.webp',14),(17,'https://img.drz.lazcdn.com/g/kf/Sd195d712838943fe8563c2c46fc76a1dE.jpg_720x720q80.jpg_.webp',15),(18,'https://img.drz.lazcdn.com/static/lk/p/33754a42b0a59ea632116848c0c175ef.jpg_720x720q80.jpg_.webp',16),(19,'https://img.drz.lazcdn.com/static/lk/p/bf6756da5926795caddb3b495e48fd30.png_720x720q80.png_.webp',17),(20,'https://img.drz.lazcdn.com/static/lk/p/bf6756da5926795caddb3b495e48fd30.png_720x720q80.png_.webp',18),(21,'https://img.drz.lazcdn.com/static/lk/p/992ca4ec74d378d4b656ea5ba8f7bdcb.jpg_720x720q80.jpg_.webp',20),(22,'https://img.drz.lazcdn.com/static/lk/p/7e4b74d48823e775e199057d3ee5df4e.png_720x720q80.png_.webp',19),(23,'https://img.drz.lazcdn.com/static/lk/p/d5940041153812bfc7d208ca57e35d09.jpg_720x720q80.jpg_.webp',22),(24,'https://img.drz.lazcdn.com/static/lk/p/e56eefabebd565aaf359b6a0a2ad358b.jpg_720x720q80.jpg_.webp',24),(25,'https://img.drz.lazcdn.com/static/lk/p/457218b6a0e7aaacb0864617bdfdfdea.jpg_720x720q80.jpg_.webp',25),(26,'https://img.drz.lazcdn.com/static/lk/p/b5b938b0bfd064259117d5bd939dbb4e.jpg_720x720q80.jpg_.webp',23),(27,'https://img.drz.lazcdn.com/g/kf/S65e357aef28a405c9d8915ff5185de3dC.jpg_720x720q80.jpg_.webp',26),(28,'https://img.drz.lazcdn.com/g/kf/S678a01c1a22e4457b1d60826eca52b97B.jpg_720x720q80.jpg_.webp',29),(29,'https://img.drz.lazcdn.com/static/lk/p/88c530851a99e67a617d154986b0687e.jpg_720x720q80.jpg_.webp',28),(30,'https://img.drz.lazcdn.com/g/kf/S1d71bdc9152c46a09afbf61458ff2d26E.jpg_720x720q80.jpg_.webp',27),(31,'https://img.drz.lazcdn.com/static/lk/p/f67989654348a1103aa3d68049ae71ea.jpg_720x720q80.jpg_.webp',31),(32,'https://img.drz.lazcdn.com/g/kf/S3985f0a8a4294d0e83234dd461a7a934E.jpg_720x720q80.jpg_.webp',30),(33,'https://img.drz.lazcdn.com/g/kf/S9fbb74c3036a4836ba9660063a407359H.png_720x720q80.png_.webp',32),(34,'https://img.drz.lazcdn.com/static/lk/p/ef3c4a8bd1ebb28513d86e8ff2845083.jpg_720x720q80.jpg_.webp',33),(35,'https://img.drz.lazcdn.com/static/lk/p/419895494e319233090cc80a64302cdc.jpg_720x720q80.jpg_.webp',34),(36,'https://img.drz.lazcdn.com/g/kf/S20157e1e7fba4a689507e8bd362fe06ev.jpg_720x720q80.jpg_.webp',35),(37,'https://img.drz.lazcdn.com/g/kf/S1abb5013ee524ce28e4643759ecf72ba3.jpg_720x720q80.jpg_.webp',36),(38,'https://img.drz.lazcdn.com/g/kf/Sf49bbd6762614116bf79f6764a29e3dc0.jpg_720x720q80.jpg_.webp',38),(39,'https://img.drz.lazcdn.com/g/kf/Sb5415c0bd56d4cf8b3700407b22c346fc.jpg_720x720q80.jpg_.webp',39),(40,'https://img.drz.lazcdn.com/g/kf/Sfdcee3d62d17475fb5c39aff49cf2f61V.jpg_720x720q80.jpg_.webp',37),(41,'https://img.drz.lazcdn.com/g/kf/S2962a20060bb44b9adc5ae0cfc1ab54cg.jpg_720x720q80.jpg_.webp',40),(42,'https://img.drz.lazcdn.com/g/kf/Sa7e4de4a7caf4a478b5e93fa8b7e4a55r.jpg_720x720q80.jpg_.webp',41),(43,'https://img.drz.lazcdn.com/static/lk/p/c68bbcd1661dd79b4ba22045d9288f58.jpg_720x720q80.jpg_.webp',42),(44,'https://img.drz.lazcdn.com/static/lk/p/0233876b4ad7e00ca02b25558039cef2.png_720x720q80.png_.webp',21);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (5,1,'2024-10-22','delivery','COD',59.99,1);
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
INSERT INTO `orderitem` VALUES (5,5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 14 Pro'),(2,'MacBook Pro'),(3,'Washing Machine'),(5,'Lego Building Set'),(6,'Barbie Doll'),(7,'Action Figure Set'),(8,'Educational Board Game'),(9,'Redmi A3'),(10,'Samsung Galaxy A05'),(11,'MSI Vector'),(12,'Samsung Galaxy A15'),(13,'Solstar LED Digital Television'),(14,'Samsung Smart TV'),(15,'M-Series Earbuds'),(16,'Samsung HDR 4K Smart TV'),(17,'ASPOR Powerbank'),(18,'Multi-Jointed Shapeshift Robot'),(19,'MSI Headset'),(20,'AirPods Pro'),(21,'Marvel Superhero'),(22,'Rubic cube'),(23,'Game Controller - Joystick'),(24,'Children Montessori Clock'),(25,'VR Headset');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattribute`
--

LOCK TABLES `productattribute` WRITE;
/*!40000 ALTER TABLE `productattribute` DISABLE KEYS */;
INSERT INTO `productattribute` VALUES (1,1,1,'Black'),(2,2,1,'128GB'),(3,1,2,'Silver'),(4,2,2,'256GB'),(5,3,3,'16GB'),(6,1,5,'Multi-Color'),(7,2,5,'1500 Pieces'),(8,1,6,'Pink'),(10,1,7,'Various'),(12,1,8,'Multi-Color'),(14,1,9,'black'),(15,1,10,'blue'),(16,2,9,'128GB'),(17,2,10,'128GB'),(18,2,11,'64GB'),(19,1,11,'Black'),(20,3,11,'4GB'),(21,1,12,'Gray'),(22,4,12,'RTX 4070'),(23,5,12,'Core i9'),(24,2,13,'128GB'),(25,1,13,'Black'),(26,3,13,'4GB'),(27,2,14,'128GB'),(28,1,14,'Black'),(29,3,14,'6GB'),(30,2,15,'64GB'),(31,1,15,'Black'),(32,3,15,'4GB'),(33,1,16,'Black'),(34,4,16,'RTX 4070'),(35,5,16,'Core i7'),(36,6,17,'43 inch'),(37,6,18,'32 inch'),(38,1,20,'Silver'),(39,2,20,'8 GB'),(40,3,20,'256 GB'),(41,6,19,'55 inch'),(42,1,19,'Black'),(43,1,22,'Black'),(44,7,22,'5.0'),(45,6,21,'44 inch'),(46,8,24,'10000mAh'),(47,1,24,'Black'),(48,8,25,'20000mAh'),(49,1,25,'White'),(50,1,23,'Blue'),(51,7,23,'4.0'),(52,1,26,'Blue'),(53,1,27,'White'),(54,1,28,'Blue'),(55,7,28,'3.0'),(56,1,29,'Blue'),(57,1,30,'Red'),(58,1,32,'White'),(59,1,33,'Black'),(60,1,31,'Red'),(61,7,31,'4.0'),(62,1,34,'White'),(63,1,35,'Multicolour'),(64,1,36,'Black'),(65,1,37,'Yellow'),(66,1,38,'Blue'),(67,1,39,'Blue'),(68,9,40,'585 pcs'),(69,9,41,'554 pcs'),(70,1,42,'White');
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
INSERT INTO `productcategory` VALUES (1,2),(1,9),(2,3),(3,4),(5,5),(6,7),(7,6),(8,8),(9,2),(9,9),(10,2),(11,3),(12,2),(13,10),(14,10),(15,11),(16,10),(17,12),(18,6),(19,13),(20,11),(21,6),(22,8),(23,9),(24,5),(25,9);
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
INSERT INTO `registeredcustomer` VALUES (1,'Naveen','forapikey6@gmail.com','$2a$10$xapUFuFG5nGG3thvEmNM8ujNXecxfnd6s/V6dsSrJ6jAEDBGQsCYG',1);
/*!40000 ALTER TABLE `registeredcustomer` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BeforeInsertRegisteredCustomer` BEFORE INSERT ON `registeredcustomer` FOR EACH ROW BEGIN
    -- Check if the email already exists
    IF (EXISTS (SELECT 1 FROM RegisteredCustomer WHERE Email = NEW.Email)) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email already exists';
    END IF;

    -- Check if the username already exists
    IF (EXISTS (SELECT 1 FROM RegisteredCustomer WHERE UserName = NEW.UserName)) THEN
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Username already exists';
    END IF;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterInsertRegisteredCustomer` AFTER INSERT ON `registeredcustomer` FOR EACH ROW BEGIN
    -- Insert a new cart for the newly registered user
    INSERT INTO Cart (UserID)
    VALUES (NEW.UserID);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'0766869075','Naveen','Jayasooriya','Registered');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,'iPhone 14 Pro - 128GB','The latest iPhone with 128GB storage',1,'IP14P128',999.99,0),(2,'iPhone 14 Pro - 256GB','The latest iPhone with 256GB storage',1,'IP14P256',1099.99,0),(3,'MacBook Pro - 16GB RAM','MacBook Pro with M2 chip and 16GB RAM',2,'MBP16',2399.99,0),(4,'Washing Machine - 8kg','Front-load washing machine with 8kg capacity',3,'WM8KG',499.99,7),(5,'Lego Building Set - 1500 Pieces','A large Lego set for building multiple models',5,'Lego1500',59.99,9),(6,'Barbie Doll - Classic','A classic Barbie doll with accessories',6,'BarbieClassic',24.99,17),(7,'Action Figure Set - Superheroes','Set of 5 action figures from popular superhero movies',7,'AFSuperheroes',39.99,9),(8,'Educational Board Game - Math Whiz','A fun board game to learn math skills',8,'MathWhizGame',29.99,3),(9,'Redmi A3','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bc',30.99,6),(10,'Redmi A3','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bl',32.99,10),(11,'Samsung Galaxy A05','Samsung Galaxy A05 4GB 64GB (Brand New, Sealed pack)',10,'SAM-A05-4GB-64GB',32490.00,20),(12,'MSI Vector 16 HX','Experience unparalleled performance with the MSI Vector 16 HX A14V. Powered by the latest Intel Core i9 14th Gen processor and NVIDIA GeForce RTX 4070 graphics, this laptop is designed for gamers and professionals who demand the best.',11,'MSI-V16HX-A14V-4070',885472.00,5),(13,'Samsung Galaxy A05','Powered by the Mediatek Helio G85 processor and featuring a 6.7-inch display, this smartphone is perfect for everyday use. With 4GB RAM and storage options of 64GB or 128GB, expandable via microSD, you’ll have plenty of space for all your needs. Capture stunning photos with the 50MP dual rear cameras and enjoy long-lasting battery life with the 5000mAh battery and 25W fast charging. Running on Android 13, the Galaxy A05 offers the latest features and security updates.',10,'SAM-A05-4GB-128GB',34980.00,10),(14,'Samsung Galaxy A15','Powered by the Mediatek Helio G85 processor and featuring a 6.5-inch Super AMOLED display, this smartphone is perfect for both work and play. With 6GB RAM and 128GB storage, expandable via microSD, you’ll have ample space for all your needs. Capture stunning photos with the triple camera setup, including a 50MP main sensor. Enjoy long-lasting battery life with the 5000mAh battery and fast charging capabilities. Running on the latest Android OS, the Galaxy A15 offers cutting-edge features and security updates.',12,'SAM-A15-6GB-128GB',49990.00,20),(15,'Samsung Galaxy A15','Powered by the Mediatek Helio G85 processor and featuring a 6.5-inch Super AMOLED display, this smartphone is perfect for both work and play. With 4GB RAM and 64GB storage, expandable via microSD, you’ll have ample space for all your needs. Capture stunning photos with the triple camera setup, including a 50MP main sensor. Enjoy long-lasting battery life with the 5000mAh battery and fast charging capabilities. Running on the latest Android OS, the Galaxy A15 offers cutting-edge features and security updates.',12,'SAM-A15-4GB-64GB',45990.00,20),(16,'MSI Vector 17 HX','Experience unparalleled performance with the MSI Vector 17 HX. Powered by the latest Intel Core i7 14th Gen processor and NVIDIA GeForce RTX 4070 graphics, this laptop is designed for gamers and professionals who demand the best.',11,'MSI-V17HX-A14V-4070',999995.00,2),(17,'Solstar 43\" FHD LED Digital Television','Experience stunning visuals with the Solstar 43\" FHD LED TV. With a 43-inch Full HD display and multiple connectivity options (HDMI, USB, VGA), it’s perfect for all your entertainment needs. Enjoy high-quality audio with 2x6W speakers and a sleek design that fits any space.',13,'SOL-LED43HD6100SS',73990.00,20),(18,'Solstar 32\" FHD LED Digital Television','Experience stunning visuals with the Solstar 32\" FHD LED TV. With a 32-inch Full HD display and multiple connectivity options (HDMI, USB, VGA), it’s perfect for all your entertainment needs. Enjoy high-quality audio with 2x6W speakers and a sleek design that fits any space.',13,'SOL-LED32HD6100SS',63990.00,20),(19,'Samsung Crystal UHD Smart TV','Experience breathtaking visuals with the Samsung 55\" Crystal UHD Smart TV. Featuring a 4K UHD resolution and Dynamic Crystal Color technology, this TV delivers vibrant and lifelike images. The Crystal Processor 4K ensures smooth performance, while the sleek AirSlim design adds a modern touch to any room. Enjoy seamless streaming and smart features powered by Tizen OS.',14,'SAM-UA55BU8100KXXT',228605.00,20),(20,'Apple Macbook Air M1','Experience the power of the Apple MacBook Air M1. With 8GB RAM, 256GB SSD, and the M1 chip, it delivers exceptional performance and stunning visuals in a sleek, portable design.',2,'APP-MBA-M1-8GB-256GB',277550.00,4),(21,'Samsung HDR 4K Smart TV','This TV features Quantum Dot technology, delivering 100% Color Volume for vivid, lifelike colors at any brightness level. The Quantum Processor Lite with 4K Upscaling enhances clarity and depth in every scene. Dual LED backlights provide balanced colors and stronger contrast. Quantum HDR goes beyond standard HDR to create deep blacks and impressive contrast. Motion Xcelerator ensures smooth motion and improved clarity for high-intensity sports, movies, and games.',14,'QN43Q60CAFXZA',199990.00,15),(22,'M19 Earbuds Mic Full Set with Box','Enjoy high-quality sound with the M19 Earbuds. Featuring Bluetooth 5.0 for a stable connection, these earbuds offer stereo sound, a built-in mic, and a flashlight. Perfect for on-the-go use, they come with a charging case for convenience.',15,'M19-TWS-BT50',1500.00,20),(23,'M10 TWS Wireless Earbuds','Enjoy high-fidelity sound with the M10 TWS Wireless Earbuds. Featuring Bluetooth 4.0, touch control, and an LED digital display, these earbuds offer a seamless audio experience. With a built-in microphone and power bank, they are perfect for on-the-go use.',15,'M10-TWS-BT50',2350.00,2),(24,'ASPOR A323 Powerbank','The ASPOR A323 Powerbank offers 10000mAh capacity, fast charging, dual USB outputs, LED display, and two input options (Micro USB and Type-C) for versatile recharging.',17,'A323',1779.00,20),(25,'ASPOR A324 Powerbank','The ASPOR A324 Powerbank offers 20000mAh capacity, fast charging, dual USB outputs, LED display, and two input options (Micro USB and Type-C) for versatile recharging.',17,'A324',1979.00,20),(26,'13-Piece Multi-Jointed Shapeshift Robot','Unleash creativity with this 13-piece Multi-Jointed Shapeshift Robot 3D Printed Action Figure Set. Perfect for kids, adults, and parent-child bonding, these highly articulated action figures offer endless fun. Designed to mimic real-life movements, each figure is fully customizable and ideal for imaginative games, DIY crafting, or collector\'s display.',18,'MJ-SR-13-2024',600.00,20),(27,'13-Piece Multi-Jointed Shapeshift Robot','Unleash creativity with this 13-piece Multi-Jointed Shapeshift Robot 3D Printed Action Figure Set. Perfect for kids, adults, and parent-child bonding, these highly articulated action figures offer endless fun. Designed to mimic real-life movements, each figure is fully customizable and ideal for imaginative games, DIY crafting, or collector\'s display.',18,'MJ-SR-13-2024',500.00,10),(28,'Airpods Pro- Blue','Experience Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio with AirPods Pro 2. Dust, sweat, and water-resistant, with MagSafe Charging Case for up to 6 hours of listening.',20,'AP-PRO2-ADPT-AUD',12300.00,10),(29,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3355.00,20),(30,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3465.00,20),(31,'Airpods Pro - Red','Experience the ultimate in audio innovation with the AirPods Pro 3. Featuring Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio with dynamic head tracking, these earbuds offer an immersive listening experience. Dust, sweat, and water resistant, with a MagSafe Charging Case (USB-C) that includes a speaker and lanyard loop, they provide up to 6 hours of listening time on a single charge.',20,'AP-PRO3-ADPT-AUD',12500.00,10),(32,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3035.00,20),(33,'Marvel Superhero Iron Spider','Bring the excitement of Marvel superheroes to life with these building block action figures featuring Gwen Stacy, Miles Morales, and Iron Spider. Perfect for children and collectors alike, these figures are designed to be compatible with major building block sets. Made with high-quality materials, they’re great for imaginative play or as part of a display collection.',21,'KT1069-MSF',800.00,10),(34,'Marvel Superhero Iron Spider','Bring the excitement of Marvel superheroes to life with these building block action figures featuring Gwen Stacy, Miles Morales, and Iron Spider. Perfect for children and collectors alike, these figures are designed to be compatible with major building block sets. Made with high-quality materials, they’re great for imaginative play or as part of a display collection.',21,'KT1069-MSF',800.00,10),(35,'Rubic Cube','Professional 3x3x3 speed cube with 5.6 cm size, high-quality rotation, and durable design.',22,'SC5603',199.00,20),(36,'Wired USB PC Game Controller','Master your games with the Wired USB PC Game Controller. Compatible with Windows XP, 7, 8, and 10, this gamepad offers a comfortable and ergonomic design. Featuring plug-and-play functionality, it provides precise control with its responsive buttons and joystick. Perfect for PC gaming, this black game controller ensures an immersive gaming experience.',23,'USB-GAMEPAD-WIN',5500.00,5),(37,'Children Montessori Clock','Colorful Montessori clock toy for kids to learn hours, minutes, and seconds.',24,'MCET123Y',522.00,20),(38,'Children Montessori Clock','Colorful Montessori clock toy for kids to learn hours, minutes, and seconds.',24,'MCET123B',540.00,20),(39,'DualShock Wireless Controller','Elevate your gaming experience with the PS4 DualShock Wireless Controller. Designed for PlayStation, PC, laptops, and mobile devices, this AAA-grade controller offers precise control and comfort. With Bluetooth connectivity, it ensures seamless gameplay across multiple platforms.',23,'DS4-WL-AAA',7700.00,10),(40,'Lego set 585Pcs City Police Station SWAT Truck','SWAT Truck Car Building Blocks DIY Toys for Boys. Compatible with Lego and perfect for boys who love building their city police stations.',5,'LB585SWATp',5001.00,20),(41,'Lego set 585Pcs City Police Station SWAT Truck','SWAT Truck Car Building Blocks DIY Toys for Boys. Compatible with Lego and perfect for boys who love building their city police stations.',5,'LB554SWATp',4396.00,20),(42,'Mini 3D Glasses VR Headset','Immerse yourself in virtual reality with the BOX 5 Mini 3D Glasses. Designed for use with smartphones, this white VR headset offers a 360° unobstructed view and adjustable lenses for optimal comfort. Made from durable ABS material, it is lightweight and portable, perfect for on-the-go entertainment.',25,'BOX5-VR-WHT',3699.00,5);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce4'
--

--
-- Dumping routines for database 'ecommerce4'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddToCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddToCart`(IN VID INT, IN CID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error adding to cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Check if the variant exists
    IF EXISTS (SELECT * FROM Variant WHERE VariantID = VID) THEN

        -- Check if the product variant is already in the cart
        IF EXISTS (SELECT * FROM CartItem WHERE VariantID = VID AND CartID = CID) THEN
            -- Update the quantity
            UPDATE CartItem SET Quantity = Quantity + 1 WHERE VariantID = VID AND CartID = CID;
        ELSE
            -- Insert the product variant into the CartItem table
            INSERT INTO CartItem (VariantID, CartID, Quantity) VALUES (VID, CID, 1);
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
/*!50003 DROP PROCEDURE IF EXISTS `DropOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropOrder`(IN oID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error dropping order' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Delete the order
    DELETE FROM `Order` WHERE OrderID = oID;

    COMMIT;
    SELECT 'Order dropped successfully' AS message;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCart`(IN userId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT ci.*, v.VariantName, v.Price, i.ImageLink
    FROM CartItem ci
    JOIN Cart c ON ci.CartID = c.CartID
    JOIN Variant v ON ci.VariantID = v.VariantID
    JOIN Product p ON v.ProductID = p.ProductID
    JOIN Image i ON i.VariantID = v.VariantID
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCartId`(IN Id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching cart ID' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT CartID FROM Cart WHERE UserID = Id;

    COMMIT;
   
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrders`(IN userID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching orders' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Fetch orders for the user
    SELECT * FROM `Order` WHERE UserID = userID;

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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProductAttribute`(IN VariantID INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `GetProductsByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProductsByCategory`(IN categoryNamePattern VARCHAR(255))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error fetching products by category' AS message;
    END;

    -- Create a temporary table for the category tree
    CREATE TEMPORARY TABLE IF NOT EXISTS CategoryTree (CategoryID INT);

    -- Populate the CategoryTree with the root categories that match the pattern
    INSERT INTO CategoryTree (CategoryID)
    SELECT CategoryID
    FROM Category
    WHERE CategoryName LIKE categoryNamePattern;

    -- Use REPEAT to insert child categories into CategoryTree recursively
    REPEAT
        INSERT INTO CategoryTree (CategoryID)
        SELECT c.CategoryID
        FROM Category c
        INNER JOIN CategoryTree ct ON c.ParentCategoryID = ct.CategoryID
        WHERE c.CategoryID NOT IN (SELECT CategoryID FROM CategoryTree);
    UNTIL ROW_COUNT() = 0
    END REPEAT;

    -- Fetch the products based on the populated CategoryTree
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
        Product p
        JOIN productCategory pc ON p.ProductID = pc.ProductID
        JOIN Category c ON pc.CategoryID = c.CategoryID
        JOIN variant v ON p.ProductID = v.ProductID
        JOIN image i ON v.VariantID = i.VariantID
    WHERE 
        pc.CategoryID IN (SELECT CategoryID FROM CategoryTree);

    -- Clean up the temporary table
    DROP TEMPORARY TABLE IF EXISTS CategoryTree;

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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProductVariants`(IN ProductID INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `GetVariant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVariant`(IN VariantID INT)
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
    FROM Variant v
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PlaceOrder`(
    IN p_userID INT,
    IN p_cartID INT,
    IN p_deliveryType ENUM('storePickup', 'delivery'),
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
    FROM CartItem ci
    JOIN Variant v ON ci.VariantID = v.VariantID
    WHERE ci.CartID = p_cartID;

    -- Ensure totalPrice is not zero
    IF totalPrice IS NULL OR totalPrice = 0 THEN
        SELECT 'Total price is zero, cannot proceed with order.' AS message;
        ROLLBACK;
    ELSE
        -- Insert into Orders table
        INSERT INTO `Order` (UserID, OrderDate, DeliveryType, PaymentMethod, OrderTotal, AddressID)
        VALUES (p_userID, CURRENT_DATE, p_deliveryType, p_paymentMethod, totalPrice, p_addressID);

        SET orderID = LAST_INSERT_ID();

        -- Insert into OrderItem table for each cart item
        INSERT INTO OrderItem (OrderID, VariantID, Quantity)
        SELECT orderID, ci.VariantID, ci.Quantity
        FROM CartItem ci
        WHERE ci.CartID = p_cartID;

        -- Empty the cart table
        DELETE FROM CartItem WHERE CartID = p_cartID;

        COMMIT;
        SELECT 'Order placed successfully' AS message;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveAllFromCart`(IN CID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error removing all from cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Remove all items from the cart
    DELETE FROM CartItem WHERE CartID = CID;

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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveFromCart`(IN VID INT, IN CID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error removing from cart' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Check if the product variant is in the cart
    IF EXISTS (SELECT * FROM CartItem WHERE VariantID = VID AND CartID = CID) THEN
        -- Check the quantity
        IF (SELECT Quantity FROM CartItem WHERE VariantID = VID AND CartID = CID) > 1 THEN
            -- Update the quantity
            UPDATE CartItem SET Quantity = Quantity - 1 WHERE VariantID = VID AND CartID = CID;
        ELSE
            -- Remove the product variant from the cart
            DELETE FROM CartItem WHERE VariantID = VID AND CartID = CID;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UnRegSetCart`(IN VariantID INT, IN CartID INT, IN Quantity INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error performing cart operation' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert or update the cart item
    INSERT INTO CartItem (VariantID, CartID, Quantity)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  0:50:31
