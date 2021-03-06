-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: essentialoilsshop
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CustomerID` int NOT NULL,
  `ProductID` int NOT NULL,
  `ProductQuantity` int DEFAULT NULL,
  `ProductPrice` float DEFAULT NULL,
  UNIQUE KEY `UK_cutomerId_ProductID` (`CustomerID`,`ProductID`),
  CONSTRAINT `FK_cart_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100) DEFAULT NULL,
  `CustomerCountry` varchar(100) DEFAULT NULL,
  `CustomerAdress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Tom Johson','France','Rue de l\'Eglise 42-51, 4320 Paris'),(2,'Maria Anderson','France','Rue de la Fontaine 12, 4587 Lyon '),(3,'Alexis Star','Switzerland','Aarbergergasse 85, 8692 Bern'),(4,'Julia Magnus','Switzerland','Langstrasse 25, 8796 Zurich'),(5,'Melvin Senker','Germany','Chausseestrasse 45-14, 78956 Berlin');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `newCustomer_Before_Insert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
	 SET NEW.CustomerName =
	 CONCAT(
	 CONCAT(UPPER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', 1 ),1,1)),
	 LOWER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', 1 ) FROM 2))),
	 " ",
	 CONCAT(UPPER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', -1 ),1,1)),
	 LOWER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', -1 ) FROM 2)))
	 );
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `ProductQuantity` int DEFAULT NULL,
  `ProductPrice` float DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  KEY `FK_orders` (`OrderID`),
  KEY `FK_product` (`ProductID`),
  CONSTRAINT `FK_orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `FK_product` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,5,1,8.5,'Delivered'),(1,14,2,7.3,'Delivered'),(1,10,3,7.2,'Delivered'),(1,11,1,5.2,'Delivered'),(1,8,1,4.5,'Delivered'),(1,9,1,4.2,'Delivered'),(1,22,2,9.5,'Delivered'),(1,5,2,8.5,'Delivered'),(2,13,3,10.2,'Delivered'),(2,18,1,4,'Delivered'),(2,17,1,4.2,'Delivered'),(2,32,1,10.5,'Delivered'),(2,30,2,6.2,'Delivered'),(2,27,1,5.2,'Delivered'),(3,11,2,5.2,'Delivered'),(3,18,2,4,'Delivered'),(3,23,1,9.2,'Delivered'),(3,31,2,12.5,'Delivered'),(3,30,2,6.2,'Delivered'),(3,27,3,5.2,'Delivered'),(3,18,1,4,'Delivered'),(3,14,1,7.3,'Delivered'),(3,7,3,7.6,'Delivered'),(3,8,2,4.5,'Delivered'),(4,23,2,9.2,'Delivered'),(4,24,1,10.5,'Delivered'),(4,11,1,5.2,'Delivered'),(4,15,4,5.4,'Delivered'),(4,12,2,8.6,'Delivered'),(4,7,1,7.6,'Delivered'),(5,21,1,5.2,'Delivered'),(5,7,1,7.6,'Delivered'),(5,13,1,10.2,'Delivered'),(5,11,1,5.2,'Delivered'),(5,22,3,9.5,'Delivered'),(5,33,1,12.5,'Delivered'),(6,31,3,12.5,'Delivered'),(6,30,3,6.2,'Delivered'),(7,31,2,12.5,'Delivered'),(7,28,1,10.4,'Delivered'),(7,6,3,10.5,'Delivered'),(7,11,1,5.2,'Delivered'),(8,11,1,5.2,'Accepted'),(8,26,1,7.2,'Accepted'),(8,25,1,10.5,'Accepted'),(8,6,1,10.5,'Accepted'),(8,8,1,4.5,'Accepted'),(8,15,1,5.4,'Accepted'),(8,9,1,4.2,'Accepted'),(9,11,1,5.2,'Accepted'),(9,25,1,10.5,'Accepted'),(9,26,1,7.2,'Accepted'),(9,22,1,9.5,'Accepted'),(9,17,1,4.2,'Accepted'),(9,13,1,10.2,'Accepted'),(9,32,1,10.5,'Accepted'),(9,33,1,12.5,'Accepted'),(10,33,1,12.5,'Accepted'),(10,13,3,10.2,'Accepted'),(10,14,1,7.3,'Accepted'),(10,8,1,4.5,'Accepted');
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderStatus` varchar(100) DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_orders_customer` (`CustomerID`),
  CONSTRAINT `FK_orders_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2021-10-10','Delivered','2021-10-20'),(2,1,'2021-11-10','Delivered','2021-11-20'),(3,2,'2021-11-11','Delivered','2021-11-21'),(4,3,'2021-11-15','Delivered','2021-11-25'),(5,4,'2021-11-15','Delivered','2021-11-30'),(6,4,'2021-11-18','Delivered','2021-11-25'),(7,1,'2021-11-20','Delivered','2021-11-25'),(8,4,'2021-12-01','Accepted',NULL),(9,3,'2021-12-02','Accepted',NULL),(10,4,'2021-12-03','Accepted',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `PaymentStatus` varchar(50) DEFAULT NULL,
  `PaymentType` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_payment_order` (`OrderID`),
  CONSTRAINT `FK_payment_order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'Paid','Card','2021-10-10'),(2,2,'Paid','Card','2021-11-10'),(3,3,'Paid','PayPal','2021-11-12'),(4,4,'Paid','Card','2021-11-15'),(5,5,'Paid','Card','2021-11-15'),(6,6,'Paid','Paypal','2021-11-19'),(7,7,'Paid','Card','2021-11-20'),(8,8,'Unpaid','Card',NULL),(9,9,'Unpaid','Paypal',NULL),(10,10,'Unpaid','Card',NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) DEFAULT NULL,
  `ProductNameISCI` varchar(255) DEFAULT NULL,
  `Category` int DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `OriginalCountry` varchar(50) DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Quantity` int unsigned DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'flowery',NULL,NULL,'EssentialOil',NULL,NULL,NULL,NULL),(2,'fruity',NULL,NULL,'EssentialOil',NULL,NULL,NULL,NULL),(3,'wooden',NULL,NULL,'EssentialOil',NULL,NULL,NULL,NULL),(4,'rare and precious',NULL,NULL,'EssentialOil',NULL,NULL,NULL,NULL),(5,'German Chamomile','Matricaria recutita',1,'EssentialOil','India','2023-12-01',100,8.5),(6,'Roman Chamomile','Chamaemelum nobile',1,'EssentialOil','France','2024-12-01',50,10.5),(7,'Bourbon Geranium','Pelargonium graveolens var. Bourbon',1,'EssentialOil','Madagascar','2022-12-01',75,7.6),(8,'Lavender','Lavandula latifolia',1,'EssentialOil','Spain','2024-06-01',150,4.5),(9,'Lavender Provence','Lavandula angustifolia',1,'EssentialOil','France (Provence)','2023-12-01',200,4.2),(10,'Palmarosa','Cymbopogon martinii',1,'EssentialOil','India','2025-01-01',60,7.2),(11,'Patchouli','Pogostemon cablin',1,'EssentialOil','Sri Lanka','2024-12-01',160,5.2),(12,'Ylang-Ylang','Cananga odorata totum',1,'EssentialOil','Madagascar','2025-06-01',135,8.6),(13,'Anise','Pimpinella anisum',2,'Spain','EssentialOil','2024-12-01',160,10.2),(14,'Calabrian Bergamot','Citrus bergamia',2,'EssentialOil','Italy (Calabria)','2024-12-01',130,7.3),(15,'Sicilian Lemon','Citrus limonum',2,'EssentialOil','Italy (Sicily)','2023-12-01',90,5.4),(16,'Lime','Citrus aurantifolium',2,'EssentialOil','Mexico','2024-12-01',78,5),(17,'Mandarin','Citrus reticulata blanco',2,'EssentialOil','Spain','2024-12-01',75,4.2),(18,'Sweet Orange','Citrus sinensis var. pera',2,'EssentialOil','Brazil','2024-12-01',69,4),(19,'Grapefruit','Citrus paradisi',2,'EssentialOil','Italy','2024-12-01',85,5.2),(20,'Petitgrain Bigarade','Citrus aurantium var. amara',2,'EssentialOil','Paraguay','2024-12-01',87,3.2),(21,'Corsican Pomelo','Citrus x paradisi',2,'EssentialOil','France (Corsica)','2024-12-01',75,5.2),(22,'Amyris','Amyris balsamifera',3,'EssentialOil','Haiti','2023-10-01',40,9.5),(23,'Gaiac Wood','Bulnesia sarmienti ',3,'EssentialOil','Paraguay','2024-12-01',100,9.2),(24,'Rosewood','Aniba rosaeodora',3,'EssentialOil','Brazil','2024-12-01',20,10.5),(25,'Atlas Cedar','Cedrus atlantica',3,'EssentialOil','Morocco','2024-12-01',80,10.5),(26,'Evergreen Cypress','Cupressus sempervirens',3,'EssentialOil','Spain','2023-12-01',90,7.2),(27,'Kunzea','Kunzea ambigua',3,'EssentialOil','Australia','2023-12-01',40,5.2),(28,'Sandalwood Alba','Santalum album',3,'EssentialOil','Indonesia','2024-10-01',10,10.4),(29,'Siberian Fir','Abies sibirica',3,'EssentialOil','Russia','2022-10-01',100,5.2),(30,'Frankincense','Boswellia carterii',4,'EssentialOil','Somalia','2023-10-01',40,6.2),(31,'Yarrow','Achillea millefolium',4,'EssentialOil','Bulgaria','2022-10-01',50,12.5),(32,'Elemi','Canarium luzonicum',4,'EssentialOil','Philippines','2023-10-01',20,10.5),(33,'Fragrant Inule','Inula graveolens',4,'EssentialOil','Morocco','2023-10-01',46,12.5),(34,'Pistachio Lentisk','Pistacia lentiscus',4,'EssentialOil','Morocco','2023-10-01',50,14.5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_invoice`
--

DROP TABLE IF EXISTS `view_invoice`;
/*!50001 DROP VIEW IF EXISTS `view_invoice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_invoice` AS SELECT 
 1 AS `OrderID`,
 1 AS `CustomerName`,
 1 AS `OrderDate`,
 1 AS `ProductName`,
 1 AS `QuantityProduct`,
 1 AS `PaymentAmount`,
 1 AS `DeliveryDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_invoice`
--

/*!50001 DROP VIEW IF EXISTS `view_invoice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_invoice` AS select `o`.`ID` AS `OrderID`,`c`.`CustomerName` AS `CustomerName`,`o`.`OrderDate` AS `OrderDate`,`p`.`ProductName` AS `ProductName`,`oi`.`ProductQuantity` AS `QuantityProduct`,`CalculatePayment`(`o`.`ID`) AS `PaymentAmount`,`o`.`DeliveryDate` AS `DeliveryDate` from ((((`orderitems` `oi` join `orders` `o` on((`oi`.`OrderID` = `o`.`ID`))) join `products` `p` on((`oi`.`ProductID` = `p`.`ID`))) join `payment` `pp` on((`oi`.`OrderID` = `pp`.`ID`))) join `customer` `c` on((`o`.`CustomerID` = `c`.`ID`))) where (`o`.`DeliveryDate` is not null) */;
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

-- Dump completed on 2021-12-15 23:37:51
