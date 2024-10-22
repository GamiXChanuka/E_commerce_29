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
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1','suboda road','Moratuwa','12345','Colombo');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'admin123','Admin','User','adminpassword','admin@example.com');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Color'),(2,'Storage'),(3,'RAM'),(4,'GPU'),(5,'CPU'),(6,'Size'),(7,'Bluetooth'),(8,'Capacity'),(9,'Pieces');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `backorders`
--

LOCK TABLES `backorders` WRITE;
/*!40000 ALTER TABLE `backorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `backorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (1,1,2),(11,1,2);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics',NULL),(2,'Mobile Phones',1),(3,'Laptops',1),(4,'Home Appliances',NULL),(5,'Toys',NULL),(6,'Action Figures',5),(7,'Dolls',5),(8,'Educational Toys',5),(9,'Gaming Device',1),(10,'TV',1),(11,'Ear buds',1),(12,'Powerbank',1),(13,'Headset',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `deliverymodule`
--

LOCK TABLES `deliverymodule` WRITE;
/*!40000 ALTER TABLE `deliverymodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverymodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-14-pro/iphone-14-pro-deep-purple.jpg',1),(2,'https://celltronics.lk/wp-content/uploads/2022/09/Apple-iPhone-14-pro-2.jpg',2),(3,'https://img.drz.lazcdn.com/static/lk/p/8b2d5fdf01f0562a6c7c2065e0c2ff9d.jpg_200x200q80.jpg_.webp',3),(4,'https://img.drz.lazcdn.com/static/lk/p/292aa54e558f4b630ce4855478f65f88.jpg_200x200q80.jpg_.webp',4),(7,'https://img.drz.lazcdn.com/static/lk/p/a337b7a6699a1f8cc10650bbc5b02c6b.jpg_200x200q80.jpg_.webp',5),(8,'https://img.drz.lazcdn.com/static/lk/p/b006cd13bcdc791ce6b91f4b05e1c988.jpg_200x200q80.jpg_.webp',6),(9,'https://img.drz.lazcdn.com/static/lk/p/0414db07b3b792e896410bd830b0fc05.jpg_200x200q80.jpg_.webp',7),(10,'https://img.drz.lazcdn.com/g/kf/S64f080ae314d4e32b7f1952a3f21da4eG.jpg_200x200q80.jpg_.webp',8),(11,'https://ae-pic-a1.aliexpress-media.com/kf/S4c420d7254b84636b6f29fd69ee21c210.jpg_640x640.jpg_.webp',9),(12,'https://ae-pic-a1.aliexpress-media.com/kf/Sae45a069c13c46329873a8dab6396d56Q.jpg_640x640.jpg_.webp',10),(13,'https://img.drz.lazcdn.com/static/lk/p/87c426910ba267680285aed42c2ec520.jpg_720x720q80.jpg_.webp',12),(14,'https://img.drz.lazcdn.com/static/lk/p/acba5ee28b71820a32004761c0848d5b.jpg_720x720q80.jpg_.webp',11),(15,'https://img.drz.lazcdn.com/static/lk/p/acba5ee28b71820a32004761c0848d5b.jpg_720x720q80.jpg_.webp',13),(16,'https://img.drz.lazcdn.com/g/kf/Sd195d712838943fe8563c2c46fc76a1dE.jpg_720x720q80.jpg_.webp',14),(17,'https://img.drz.lazcdn.com/g/kf/Sd195d712838943fe8563c2c46fc76a1dE.jpg_720x720q80.jpg_.webp',15),(18,'https://img.drz.lazcdn.com/static/lk/p/33754a42b0a59ea632116848c0c175ef.jpg_720x720q80.jpg_.webp',16),(19,'https://img.drz.lazcdn.com/static/lk/p/bf6756da5926795caddb3b495e48fd30.png_720x720q80.png_.webp',17),(20,'https://img.drz.lazcdn.com/static/lk/p/bf6756da5926795caddb3b495e48fd30.png_720x720q80.png_.webp',18),(21,'https://img.drz.lazcdn.com/static/lk/p/992ca4ec74d378d4b656ea5ba8f7bdcb.jpg_720x720q80.jpg_.webp',20),(22,'https://img.drz.lazcdn.com/static/lk/p/7e4b74d48823e775e199057d3ee5df4e.png_720x720q80.png_.webp',19),(23,'https://img.drz.lazcdn.com/static/lk/p/d5940041153812bfc7d208ca57e35d09.jpg_720x720q80.jpg_.webp',22),(24,'https://img.drz.lazcdn.com/static/lk/p/e56eefabebd565aaf359b6a0a2ad358b.jpg_720x720q80.jpg_.webp',24),(25,'https://img.drz.lazcdn.com/static/lk/p/457218b6a0e7aaacb0864617bdfdfdea.jpg_720x720q80.jpg_.webp',25),(26,'https://img.drz.lazcdn.com/static/lk/p/b5b938b0bfd064259117d5bd939dbb4e.jpg_720x720q80.jpg_.webp',23),(27,'https://img.drz.lazcdn.com/g/kf/S65e357aef28a405c9d8915ff5185de3dC.jpg_720x720q80.jpg_.webp',26),(28,'https://img.drz.lazcdn.com/g/kf/S678a01c1a22e4457b1d60826eca52b97B.jpg_720x720q80.jpg_.webp',29),(29,'https://img.drz.lazcdn.com/static/lk/p/88c530851a99e67a617d154986b0687e.jpg_720x720q80.jpg_.webp',28),(30,'https://img.drz.lazcdn.com/g/kf/S1d71bdc9152c46a09afbf61458ff2d26E.jpg_720x720q80.jpg_.webp',27),(31,'https://img.drz.lazcdn.com/static/lk/p/f67989654348a1103aa3d68049ae71ea.jpg_720x720q80.jpg_.webp',31),(32,'https://img.drz.lazcdn.com/g/kf/S3985f0a8a4294d0e83234dd461a7a934E.jpg_720x720q80.jpg_.webp',30),(33,'https://img.drz.lazcdn.com/g/kf/S9fbb74c3036a4836ba9660063a407359H.png_720x720q80.png_.webp',32),(34,'https://img.drz.lazcdn.com/static/lk/p/ef3c4a8bd1ebb28513d86e8ff2845083.jpg_720x720q80.jpg_.webp',33),(35,'https://img.drz.lazcdn.com/static/lk/p/419895494e319233090cc80a64302cdc.jpg_720x720q80.jpg_.webp',34),(36,'https://img.drz.lazcdn.com/g/kf/S20157e1e7fba4a689507e8bd362fe06ev.jpg_720x720q80.jpg_.webp',35),(37,'https://img.drz.lazcdn.com/g/kf/S1abb5013ee524ce28e4643759ecf72ba3.jpg_720x720q80.jpg_.webp',36),(38,'https://img.drz.lazcdn.com/g/kf/Sf49bbd6762614116bf79f6764a29e3dc0.jpg_720x720q80.jpg_.webp',38),(39,'https://img.drz.lazcdn.com/g/kf/Sb5415c0bd56d4cf8b3700407b22c346fc.jpg_720x720q80.jpg_.webp',39),(40,'https://img.drz.lazcdn.com/g/kf/Sfdcee3d62d17475fb5c39aff49cf2f61V.jpg_720x720q80.jpg_.webp',37),(41,'https://img.drz.lazcdn.com/g/kf/S2962a20060bb44b9adc5ae0cfc1ab54cg.jpg_720x720q80.jpg_.webp',40),(42,'https://img.drz.lazcdn.com/g/kf/Sa7e4de4a7caf4a478b5e93fa8b7e4a55r.jpg_720x720q80.jpg_.webp',41),(43,'https://img.drz.lazcdn.com/static/lk/p/c68bbcd1661dd79b4ba22045d9288f58.jpg_720x720q80.jpg_.webp',42),(44,'https://img.drz.lazcdn.com/static/lk/p/0233876b4ad7e00ca02b25558039cef2.png_720x720q80.png_.webp',21);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (5,1,'2024-10-22','delivery','COD',59.99,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (5,5,1);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 14 Pro'),(2,'MacBook Pro'),(3,'Washing Machine'),(5,'Lego Building Set'),(6,'Barbie Doll'),(7,'Action Figure Set'),(8,'Educational Board Game'),(9,'Redmi A3'),(10,'Samsung Galaxy A05'),(11,'MSI Vector'),(12,'Samsung Galaxy A15'),(13,'Solstar LED Digital Television'),(14,'Samsung Smart TV'),(15,'M-Series Earbuds'),(16,'Samsung HDR 4K Smart TV'),(17,'ASPOR Powerbank'),(18,'Multi-Jointed Shapeshift Robot'),(19,'MSI Headset'),(20,'AirPods Pro'),(21,'Marvel Superhero'),(22,'Rubic cube'),(23,'Game Controller - Joystick'),(24,'Children Montessori Clock'),(25,'VR Headset');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productattribute`
--

LOCK TABLES `productattribute` WRITE;
/*!40000 ALTER TABLE `productattribute` DISABLE KEYS */;
INSERT INTO `productattribute` VALUES (1,1,1,'Black'),(2,2,1,'128GB'),(3,1,2,'Silver'),(4,2,2,'256GB'),(5,3,3,'16GB'),(6,1,5,'Multi-Color'),(7,2,5,'1500 Pieces'),(8,1,6,'Pink'),(10,1,7,'Various'),(12,1,8,'Multi-Color'),(14,1,9,'black'),(15,1,10,'blue'),(16,2,9,'128GB'),(17,2,10,'128GB'),(18,2,11,'64GB'),(19,1,11,'Black'),(20,3,11,'4GB'),(21,1,12,'Gray'),(22,4,12,'RTX 4070'),(23,5,12,'Core i9'),(24,2,13,'128GB'),(25,1,13,'Black'),(26,3,13,'4GB'),(27,2,14,'128GB'),(28,1,14,'Black'),(29,3,14,'6GB'),(30,2,15,'64GB'),(31,1,15,'Black'),(32,3,15,'4GB'),(33,1,16,'Black'),(34,4,16,'RTX 4070'),(35,5,16,'Core i7'),(36,6,17,'43 inch'),(37,6,18,'32 inch'),(38,1,20,'Silver'),(39,2,20,'8 GB'),(40,3,20,'256 GB'),(41,6,19,'55 inch'),(42,1,19,'Black'),(43,1,22,'Black'),(44,7,22,'5.0'),(45,6,21,'44 inch'),(46,8,24,'10000mAh'),(47,1,24,'Black'),(48,8,25,'20000mAh'),(49,1,25,'White'),(50,1,23,'Blue'),(51,7,23,'4.0'),(52,1,26,'Blue'),(53,1,27,'White'),(54,1,28,'Blue'),(55,7,28,'3.0'),(56,1,29,'Blue'),(57,1,30,'Red'),(58,1,32,'White'),(59,1,33,'Black'),(60,1,31,'Red'),(61,7,31,'4.0'),(62,1,34,'White'),(63,1,35,'Multicolour'),(64,1,36,'Black'),(65,1,37,'Yellow'),(66,1,38,'Blue'),(67,1,39,'Blue'),(68,9,40,'585 pcs'),(69,9,41,'554 pcs'),(70,1,42,'White');
/*!40000 ALTER TABLE `productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,2),(1,9),(2,3),(3,4),(5,5),(6,7),(7,6),(8,8),(9,2),(9,9),(10,2),(11,3),(12,2),(13,10),(14,10),(15,11),(16,10),(17,12),(18,6),(19,13),(20,11),(21,6),(22,8),(23,9),(24,5),(25,9);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `registeredcustomer`
--

LOCK TABLES `registeredcustomer` WRITE;
/*!40000 ALTER TABLE `registeredcustomer` DISABLE KEYS */;
INSERT INTO `registeredcustomer` VALUES (1,'Naveen','forapikey6@gmail.com','$2a$10$xapUFuFG5nGG3thvEmNM8ujNXecxfnd6s/V6dsSrJ6jAEDBGQsCYG',1);
/*!40000 ALTER TABLE `registeredcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'0766869075','Naveen','Jayasooriya','Registered');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,'iPhone 14 Pro - 128GB','The latest iPhone with 128GB storage',1,'IP14P128',999.99,0),(2,'iPhone 14 Pro - 256GB','The latest iPhone with 256GB storage',1,'IP14P256',1099.99,0),(3,'MacBook Pro - 16GB RAM','MacBook Pro with M2 chip and 16GB RAM',2,'MBP16',2399.99,0),(4,'Washing Machine - 8kg','Front-load washing machine with 8kg capacity',3,'WM8KG',499.99,7),(5,'Lego Building Set - 1500 Pieces','A large Lego set for building multiple models',5,'Lego1500',59.99,9),(6,'Barbie Doll - Classic','A classic Barbie doll with accessories',6,'BarbieClassic',24.99,17),(7,'Action Figure Set - Superheroes','Set of 5 action figures from popular superhero movies',7,'AFSuperheroes',39.99,9),(8,'Educational Board Game - Math Whiz','A fun board game to learn math skills',8,'MathWhizGame',29.99,3),(9,'Redmi A3','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bc',30.99,6),(10,'Redmi A3','Brand New , Sealed Pack , Fingerprint, 6.71\" Bigg Display , Type c port ',9,'R A3 bl',32.99,10),(11,'Samsung Galaxy A05','Samsung Galaxy A05 4GB 64GB (Brand New, Sealed pack)',10,'SAM-A05-4GB-64GB',32490.00,20),(12,'MSI Vector 16 HX','Experience unparalleled performance with the MSI Vector 16 HX A14V. Powered by the latest Intel Core i9 14th Gen processor and NVIDIA GeForce RTX 4070 graphics, this laptop is designed for gamers and professionals who demand the best.',11,'MSI-V16HX-A14V-4070',885472.00,5),(13,'Samsung Galaxy A05','Powered by the Mediatek Helio G85 processor and featuring a 6.7-inch display, this smartphone is perfect for everyday use. With 4GB RAM and storage options of 64GB or 128GB, expandable via microSD, you’ll have plenty of space for all your needs. Capture stunning photos with the 50MP dual rear cameras and enjoy long-lasting battery life with the 5000mAh battery and 25W fast charging. Running on Android 13, the Galaxy A05 offers the latest features and security updates.',10,'SAM-A05-4GB-128GB',34980.00,10),(14,'Samsung Galaxy A15','Powered by the Mediatek Helio G85 processor and featuring a 6.5-inch Super AMOLED display, this smartphone is perfect for both work and play. With 6GB RAM and 128GB storage, expandable via microSD, you’ll have ample space for all your needs. Capture stunning photos with the triple camera setup, including a 50MP main sensor. Enjoy long-lasting battery life with the 5000mAh battery and fast charging capabilities. Running on the latest Android OS, the Galaxy A15 offers cutting-edge features and security updates.',12,'SAM-A15-6GB-128GB',49990.00,20),(15,'Samsung Galaxy A15','Powered by the Mediatek Helio G85 processor and featuring a 6.5-inch Super AMOLED display, this smartphone is perfect for both work and play. With 4GB RAM and 64GB storage, expandable via microSD, you’ll have ample space for all your needs. Capture stunning photos with the triple camera setup, including a 50MP main sensor. Enjoy long-lasting battery life with the 5000mAh battery and fast charging capabilities. Running on the latest Android OS, the Galaxy A15 offers cutting-edge features and security updates.',12,'SAM-A15-4GB-64GB',45990.00,20),(16,'MSI Vector 17 HX','Experience unparalleled performance with the MSI Vector 17 HX. Powered by the latest Intel Core i7 14th Gen processor and NVIDIA GeForce RTX 4070 graphics, this laptop is designed for gamers and professionals who demand the best.',11,'MSI-V17HX-A14V-4070',999995.00,2),(17,'Solstar 43\" FHD LED Digital Television','Experience stunning visuals with the Solstar 43\" FHD LED TV. With a 43-inch Full HD display and multiple connectivity options (HDMI, USB, VGA), it’s perfect for all your entertainment needs. Enjoy high-quality audio with 2x6W speakers and a sleek design that fits any space.',13,'SOL-LED43HD6100SS',73990.00,20),(18,'Solstar 32\" FHD LED Digital Television','Experience stunning visuals with the Solstar 32\" FHD LED TV. With a 32-inch Full HD display and multiple connectivity options (HDMI, USB, VGA), it’s perfect for all your entertainment needs. Enjoy high-quality audio with 2x6W speakers and a sleek design that fits any space.',13,'SOL-LED32HD6100SS',63990.00,20),(19,'Samsung Crystal UHD Smart TV','Experience breathtaking visuals with the Samsung 55\" Crystal UHD Smart TV. Featuring a 4K UHD resolution and Dynamic Crystal Color technology, this TV delivers vibrant and lifelike images. The Crystal Processor 4K ensures smooth performance, while the sleek AirSlim design adds a modern touch to any room. Enjoy seamless streaming and smart features powered by Tizen OS.',14,'SAM-UA55BU8100KXXT',228605.00,20),(20,'Apple Macbook Air M1','Experience the power of the Apple MacBook Air M1. With 8GB RAM, 256GB SSD, and the M1 chip, it delivers exceptional performance and stunning visuals in a sleek, portable design.',2,'APP-MBA-M1-8GB-256GB',277550.00,4),(21,'Samsung HDR 4K Smart TV','This TV features Quantum Dot technology, delivering 100% Color Volume for vivid, lifelike colors at any brightness level. The Quantum Processor Lite with 4K Upscaling enhances clarity and depth in every scene. Dual LED backlights provide balanced colors and stronger contrast. Quantum HDR goes beyond standard HDR to create deep blacks and impressive contrast. Motion Xcelerator ensures smooth motion and improved clarity for high-intensity sports, movies, and games.',14,'QN43Q60CAFXZA',199990.00,15),(22,'M19 Earbuds Mic Full Set with Box','Enjoy high-quality sound with the M19 Earbuds. Featuring Bluetooth 5.0 for a stable connection, these earbuds offer stereo sound, a built-in mic, and a flashlight. Perfect for on-the-go use, they come with a charging case for convenience.',15,'M19-TWS-BT50',1500.00,20),(23,'M10 TWS Wireless Earbuds','Enjoy high-fidelity sound with the M10 TWS Wireless Earbuds. Featuring Bluetooth 4.0, touch control, and an LED digital display, these earbuds offer a seamless audio experience. With a built-in microphone and power bank, they are perfect for on-the-go use.',15,'M10-TWS-BT50',2350.00,2),(24,'ASPOR A323 Powerbank','The ASPOR A323 Powerbank offers 10000mAh capacity, fast charging, dual USB outputs, LED display, and two input options (Micro USB and Type-C) for versatile recharging.',17,'A323',1779.00,20),(25,'ASPOR A324 Powerbank','The ASPOR A324 Powerbank offers 20000mAh capacity, fast charging, dual USB outputs, LED display, and two input options (Micro USB and Type-C) for versatile recharging.',17,'A324',1979.00,20),(26,'13-Piece Multi-Jointed Shapeshift Robot','Unleash creativity with this 13-piece Multi-Jointed Shapeshift Robot 3D Printed Action Figure Set. Perfect for kids, adults, and parent-child bonding, these highly articulated action figures offer endless fun. Designed to mimic real-life movements, each figure is fully customizable and ideal for imaginative games, DIY crafting, or collector\'s display.',18,'MJ-SR-13-2024',600.00,20),(27,'13-Piece Multi-Jointed Shapeshift Robot','Unleash creativity with this 13-piece Multi-Jointed Shapeshift Robot 3D Printed Action Figure Set. Perfect for kids, adults, and parent-child bonding, these highly articulated action figures offer endless fun. Designed to mimic real-life movements, each figure is fully customizable and ideal for imaginative games, DIY crafting, or collector\'s display.',18,'MJ-SR-13-2024',500.00,10),(28,'Airpods Pro- Blue','Experience Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio with AirPods Pro 2. Dust, sweat, and water-resistant, with MagSafe Charging Case for up to 6 hours of listening.',20,'AP-PRO2-ADPT-AUD',12300.00,10),(29,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3355.00,20),(30,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3465.00,20),(31,'Airpods Pro - Red','Experience the ultimate in audio innovation with the AirPods Pro 3. Featuring Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio with dynamic head tracking, these earbuds offer an immersive listening experience. Dust, sweat, and water resistant, with a MagSafe Charging Case (USB-C) that includes a speaker and lanyard loop, they provide up to 6 hours of listening time on a single charge.',20,'AP-PRO3-ADPT-AUD',12500.00,10),(32,'MSI Wired Gaming Headset','Wired gaming headset with 120° adjustable noise-cancelling microphone, compatible with PS4, PS5, Xbox, smartphones, and PCs. Provides immersive sound and comfortable design for long sessions.',19,'GH120NC',3035.00,20),(33,'Marvel Superhero Iron Spider','Bring the excitement of Marvel superheroes to life with these building block action figures featuring Gwen Stacy, Miles Morales, and Iron Spider. Perfect for children and collectors alike, these figures are designed to be compatible with major building block sets. Made with high-quality materials, they’re great for imaginative play or as part of a display collection.',21,'KT1069-MSF',800.00,10),(34,'Marvel Superhero Iron Spider','Bring the excitement of Marvel superheroes to life with these building block action figures featuring Gwen Stacy, Miles Morales, and Iron Spider. Perfect for children and collectors alike, these figures are designed to be compatible with major building block sets. Made with high-quality materials, they’re great for imaginative play or as part of a display collection.',21,'KT1069-MSF',800.00,10),(35,'Rubic Cube','Professional 3x3x3 speed cube with 5.6 cm size, high-quality rotation, and durable design.',22,'SC5603',199.00,20),(36,'Wired USB PC Game Controller','Master your games with the Wired USB PC Game Controller. Compatible with Windows XP, 7, 8, and 10, this gamepad offers a comfortable and ergonomic design. Featuring plug-and-play functionality, it provides precise control with its responsive buttons and joystick. Perfect for PC gaming, this black game controller ensures an immersive gaming experience.',23,'USB-GAMEPAD-WIN',5500.00,5),(37,'Children Montessori Clock','Colorful Montessori clock toy for kids to learn hours, minutes, and seconds.',24,'MCET123Y',522.00,20),(38,'Children Montessori Clock','Colorful Montessori clock toy for kids to learn hours, minutes, and seconds.',24,'MCET123B',540.00,20),(39,'DualShock Wireless Controller','Elevate your gaming experience with the PS4 DualShock Wireless Controller. Designed for PlayStation, PC, laptops, and mobile devices, this AAA-grade controller offers precise control and comfort. With Bluetooth connectivity, it ensures seamless gameplay across multiple platforms.',23,'DS4-WL-AAA',7700.00,10),(40,'Lego set 585Pcs City Police Station SWAT Truck','SWAT Truck Car Building Blocks DIY Toys for Boys. Compatible with Lego and perfect for boys who love building their city police stations.',5,'LB585SWATp',5001.00,20),(41,'Lego set 585Pcs City Police Station SWAT Truck','SWAT Truck Car Building Blocks DIY Toys for Boys. Compatible with Lego and perfect for boys who love building their city police stations.',5,'LB554SWATp',4396.00,20),(42,'Mini 3D Glasses VR Headset','Immerse yourself in virtual reality with the BOX 5 Mini 3D Glasses. Designed for use with smartphones, this white VR headset offers a 360° unobstructed view and adjustable lenses for optimal comfort. Made from durable ABS material, it is lightweight and portable, perfect for on-the-go entertainment.',25,'BOX5-VR-WHT',3699.00,5);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  0:49:03
