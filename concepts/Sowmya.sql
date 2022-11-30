-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: dbSowmyaSri
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
-- Table structure for table `BillDetails`
--

DROP TABLE IF EXISTS `BillDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillDetails` (
  `BillNumber` varchar(255) NOT NULL,
  `ItemID` varchar(255) NOT NULL,
  `SoldQty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`BillNumber`,`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillDetails`
--

LOCK TABLES `BillDetails` WRITE;
/*!40000 ALTER TABLE `BillDetails` DISABLE KEYS */;
INSERT INTO `BillDetails` VALUES ('010','MN78',2),('011','AB12',1),('011','BC',1),('012','OP53',3),('013','KL47',2),('014','OP53',1),('015','QR86',1),('016','IJ78',1),('017','MN78',1),('018','EF34',1),('019','AKD234',2),('019','BC',2),('019','QR86',1),('020','AB12',5);
/*!40000 ALTER TABLE `BillDetails` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Sowmya`@`%`*/ /*!50003 TRIGGER `triggerEntry` BEFORE INSERT ON `BillDetails` FOR EACH ROW begin if new.soldQty > (Select stockQty from Item where Item.ItemID = new.ItemID) then signal SQLSTATE '50001' set MESSAGE_TEXT = "Stock not available"; end if; end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Sowmya`@`%`*/ /*!50003 TRIGGER `triggerStockQty` AFTER INSERT ON `BillDetails` FOR EACH ROW begin update Item set StockQty = (Item.StockQty - new.SoldQty) where Item.ItemId = new.ItemId; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `BillHeader`
--

DROP TABLE IF EXISTS `BillHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillHeader` (
  `BillNumber` varchar(255) NOT NULL,
  `CustomerID` varchar(255) NOT NULL,
  `CashierID` varchar(255) NOT NULL,
  `BillDate` varchar(255) NOT NULL,
  PRIMARY KEY (`BillNumber`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CashierID` (`CashierID`),
  CONSTRAINT `BillHeader_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `BillHeader_ibfk_2` FOREIGN KEY (`CashierID`) REFERENCES `Cashier` (`CashierID`),
  CONSTRAINT `BillHeader_ibfk_3` FOREIGN KEY (`BillNumber`) REFERENCES `BillDetails` (`BillNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillHeader`
--

LOCK TABLES `BillHeader` WRITE;
/*!40000 ALTER TABLE `BillHeader` DISABLE KEYS */;
INSERT INTO `BillHeader` VALUES ('011','001','0108','18-0ct-2022'),('012','002','0111','14-0ct-2022'),('013','003','0108','18-0ct-2022'),('014','004','0111','17-0ct-2022'),('015','005','0117','17-0ct-2022'),('016','006','0122','16-0ct-2022'),('017','007','0123','16-0ct-2022'),('018','008','0123','15-0ct-2022'),('019','009','0117','15-oct-2022');
/*!40000 ALTER TABLE `BillHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cashier`
--

DROP TABLE IF EXISTS `Cashier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cashier` (
  `CashierID` varchar(255) NOT NULL,
  `CashierName` varchar(255) NOT NULL,
  PRIMARY KEY (`CashierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cashier`
--

LOCK TABLES `Cashier` WRITE;
/*!40000 ALTER TABLE `Cashier` DISABLE KEYS */;
INSERT INTO `Cashier` VALUES ('0108','Gowthami'),('0111','mukash'),('0117','Hari'),('0122','Navanitha'),('0123','Vinod');
/*!40000 ALTER TABLE `Cashier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` varchar(255) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('001','Sowmya'),('002','Tharun'),('003','Nagu'),('004','Apurva'),('005','Mallikarjun'),('006','Balaji'),('007','Pavan'),('008','Dheeraj'),('009','Ravi');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerDetails`
--

DROP TABLE IF EXISTS `CustomerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerDetails` (
  `AccountNumber` varchar(255) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `Balance` float DEFAULT NULL,
  PRIMARY KEY (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerDetails`
--

LOCK TABLES `CustomerDetails` WRITE;
/*!40000 ALTER TABLE `CustomerDetails` DISABLE KEYS */;
INSERT INTO `CustomerDetails` VALUES ('001','Sowmya',10000),('002','Sowmya',20000.3);
/*!40000 ALTER TABLE `CustomerDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dmart`
--

DROP TABLE IF EXISTS `Dmart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dmart` (
  `BillNumber` varchar(255) NOT NULL,
  `BillDate` varchar(10) NOT NULL,
  `ItemID` varchar(25) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `UnitPrice` float NOT NULL,
  `SoldQty` int NOT NULL DEFAULT '1',
  `TotalPrice` float NOT NULL,
  PRIMARY KEY (`BillNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dmart`
--

LOCK TABLES `Dmart` WRITE;
/*!40000 ALTER TABLE `Dmart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dmart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `ItemID` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `UnitPrice` float NOT NULL,
  `StockQty` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES ('1','milk','JJ4W',25,26),('12','Casio','USB35',899.9,25),('123','Ponds Coldcream','JJ4W',500,400),('999','milk','AB12',23,23),('AB12','milk','M5C4G3',25,45),('AZ98','XXXSoap','JJ4W',11,48),('BC','Pista','S12J',289,100),('EF34','Walnut','S12J',498,145),('GH56','Dates','YS55S',750,150),('IJ78','Rasagulla','UR234V',480,120),('KL47','Boondi Laddu','UR234V',520,130),('MN78','Pressure Cooker','P176HT',1666,30),('QR86','4 port Type C Hub','USB35',163.85,40);
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library`
--

DROP TABLE IF EXISTS `Library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library` (
  `StudentID` char(1) NOT NULL,
  `BorrowedBooksCount` int NOT NULL,
  `BorrowedBookName` char(1) NOT NULL,
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `Library_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `StudentInfo` (`StudentRollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library`
--

LOCK TABLES `Library` WRITE;
/*!40000 ALTER TABLE `Library` DISABLE KEYS */;
INSERT INTO `Library` VALUES ('5',1,'D');
/*!40000 ALTER TABLE `Library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENU`
--

DROP TABLE IF EXISTS `MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MENU` (
  `Menu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU`
--

LOCK TABLES `MENU` WRITE;
/*!40000 ALTER TABLE `MENU` DISABLE KEYS */;
INSERT INTO `MENU` VALUES ('1. Create an Account'),('2. Show all Accounts'),('3. Search an Account'),('4. Update Balance'),('5. Close an Account'),('6. Exit'),('3. Search an Account');
/*!40000 ALTER TABLE `MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentInfo`
--

DROP TABLE IF EXISTS `StudentInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentInfo` (
  `StudentRollNumber` char(1) NOT NULL,
  `StudentName` varchar(255) NOT NULL,
  `DOB` varchar(255) NOT NULL,
  `fee` int NOT NULL,
  `Branch` varchar(255) NOT NULL,
  `StudentPhoneNumber` int(10) unsigned zerofill DEFAULT NULL,
  `City` varchar(255) DEFAULT 'Hyderabad',
  PRIMARY KEY (`StudentRollNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentInfo`
--

LOCK TABLES `StudentInfo` WRITE;
/*!40000 ALTER TABLE `StudentInfo` DISABLE KEYS */;
INSERT INTO `StudentInfo` VALUES ('5','Sowmya Y','31-05-2001',20000,'ECE',0000007569,'');
/*!40000 ALTER TABLE `StudentInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `SupplierID` varchar(255) NOT NULL,
  `supplierName` varchar(255) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('JJ4W','Butterfly kitchen'),('M5C4G3','Amul Dairy'),('P176HT','Prestage'),('S12J','Premia'),('UR234V','Pulla Reddy Sweets'),('USB35','Quantum'),('YS55S','Solomon');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `getItemReport`
--

DROP TABLE IF EXISTS `getItemReport`;
/*!50001 DROP VIEW IF EXISTS `getItemReport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getItemReport` AS SELECT 
 1 AS `ItemID`,
 1 AS `Description`,
 1 AS `SupplierID`,
 1 AS `UnitPrice`,
 1 AS `StockQty`,
 1 AS `Edit`,
 1 AS `Delete`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getReport`
--

DROP TABLE IF EXISTS `getReport`;
/*!50001 DROP VIEW IF EXISTS `getReport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getReport` AS SELECT 
 1 AS `Bill Number`,
 1 AS `Bill Date`,
 1 AS `ItemID`,
 1 AS `Description`,
 1 AS `Unit Price`,
 1 AS `Sold Quantity`,
 1 AS `Total Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getReport1`
--

DROP TABLE IF EXISTS `getReport1`;
/*!50001 DROP VIEW IF EXISTS `getReport1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getReport1` AS SELECT 
 1 AS `Bill Number`,
 1 AS `Bill Date`,
 1 AS `Item ID`,
 1 AS `Description`,
 1 AS `Unit Price`,
 1 AS `Sold Quantity`,
 1 AS `Total Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Test MySQL Event 1','2022-10-25 10:05:19'),(2,'Test MySQL recurring Event','2022-10-25 10:07:45'),(3,'Test MySQL Event 2','2022-10-25 10:08:10'),(4,'Test MySQL recurring Event','2022-10-25 10:08:45'),(5,'Test MySQL recurring Event','2022-10-25 10:09:45'),(6,'Test MySQL recurring Event','2022-10-25 10:10:45'),(7,'Test MySQL recurring Event','2022-10-25 10:11:45'),(8,'Test MySQL recurring Event','2022-10-25 10:12:45'),(9,'Test MySQL recurring Event','2022-10-25 10:13:45'),(10,'Test MySQL recurring Event','2022-10-25 10:14:45'),(11,'Test MySQL recurring Event','2022-10-25 10:15:45'),(12,'Test MySQL recurring Event','2022-10-25 10:16:45'),(13,'Test MySQL recurring Event','2022-10-25 10:17:45'),(14,'Test MySQL recurring Event','2022-10-25 10:18:45'),(15,'Test MySQL recurring Event','2022-10-25 10:19:45'),(16,'Test MySQL recurring Event','2022-10-25 10:20:45'),(17,'Test MySQL recurring Event','2022-10-25 10:21:45'),(18,'Test MySQL recurring Event','2022-10-25 10:22:45'),(19,'Test MySQL recurring Event','2022-10-25 10:23:46'),(20,'Test MySQL recurring Event','2022-10-25 10:24:45'),(21,'Test MySQL recurring Event','2022-10-25 10:25:45'),(22,'Test MySQL recurring Event','2022-10-25 10:26:45'),(23,'Test MySQL recurring Event','2022-10-25 10:27:45'),(24,'Test MySQL recurring Event','2022-10-25 10:28:45'),(25,'Test MySQL recurring Event','2022-10-25 10:29:45'),(26,'Test MySQL recurring Event','2022-10-25 10:30:45'),(27,'Test MySQL recurring Event','2022-10-25 10:31:45'),(28,'Test MySQL recurring Event','2022-10-25 10:32:45'),(29,'Test MySQL recurring Event','2022-10-25 10:33:45'),(30,'Test MySQL recurring Event','2022-10-25 10:34:45'),(31,'Test MySQL recurring Event','2022-10-25 10:35:45'),(32,'Test MySQL recurring Event','2022-10-25 10:36:45'),(33,'Test MySQL recurring Event','2022-10-25 10:37:45'),(34,'Test MySQL recurring Event','2022-10-25 10:38:45'),(35,'Test MySQL recurring Event','2022-10-25 10:39:45'),(36,'Test MySQL recurring Event','2022-10-25 10:40:45'),(37,'Test MySQL recurring Event','2022-10-25 10:41:45'),(38,'Test MySQL recurring Event','2022-10-25 10:42:45'),(39,'Test MySQL recurring Event','2022-10-25 10:43:45'),(40,'Test MySQL recurring Event','2022-10-25 10:44:45'),(41,'Test MySQL recurring Event','2022-10-25 10:45:45'),(42,'Test MySQL recurring Event','2022-10-25 10:46:45'),(43,'Test MySQL recurring Event','2022-10-25 10:47:45'),(44,'Test MySQL recurring Event','2022-10-25 10:48:45'),(45,'Test MySQL recurring Event','2022-10-25 10:49:45'),(46,'Test MySQL recurring Event','2022-10-25 10:50:45'),(47,'Test MySQL recurring Event','2022-10-25 10:51:45'),(48,'Test MySQL recurring Event','2022-10-25 10:52:45'),(49,'Test MySQL recurring Event','2022-10-25 10:53:45'),(50,'Test MySQL recurring Event','2022-10-25 10:54:45'),(51,'Test MySQL recurring Event','2022-10-25 10:55:45'),(52,'Test MySQL recurring Event','2022-10-25 10:56:45'),(53,'Test MySQL recurring Event','2022-10-25 10:57:45'),(54,'Test MySQL recurring Event','2022-10-25 10:58:45'),(55,'Test MySQL recurring Event','2022-10-25 10:59:45'),(56,'Test MySQL recurring Event','2022-10-25 11:00:45'),(57,'Test MySQL recurring Event','2022-10-25 11:01:45'),(58,'Test MySQL recurring Event','2022-10-25 11:02:45'),(59,'Test MySQL recurring Event','2022-10-25 11:03:45'),(60,'Test MySQL recurring Event','2022-10-25 11:04:45'),(61,'Test MySQL recurring Event','2022-10-25 11:05:45'),(62,'Test MySQL recurring Event','2022-10-25 11:06:45'),(63,'Test MySQL recurring Event','2022-10-25 11:07:45');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `getItemReport`
--

/*!50001 DROP VIEW IF EXISTS `getItemReport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getItemReport` AS select `Item`.`ItemID` AS `ItemID`,`Item`.`Description` AS `Description`,`Item`.`SupplierID` AS `SupplierID`,`Item`.`UnitPrice` AS `UnitPrice`,`Item`.`StockQty` AS `StockQty`,'Edit' AS `Edit`,'Delete' AS `Delete` from `Item` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getReport`
--

/*!50001 DROP VIEW IF EXISTS `getReport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Sowmya`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getReport` AS select `BD`.`BillNumber` AS `Bill Number`,`BH`.`BillDate` AS `Bill Date`,`I`.`ItemID` AS `ItemID`,`I`.`Description` AS `Description`,`I`.`UnitPrice` AS `Unit Price`,`BD`.`SoldQty` AS `Sold Quantity`,(`I`.`UnitPrice` * `BD`.`SoldQty`) AS `Total Price` from ((`BillDetails` `BD` join `BillHeader` `BH`) join `Item` `I`) where ((`BD`.`BillNumber` = `BH`.`BillNumber`) and (`I`.`ItemID` = `BD`.`ItemID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getReport1`
--

/*!50001 DROP VIEW IF EXISTS `getReport1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Sowmya`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getReport1` AS select `BillDetails`.`BillNumber` AS `Bill Number`,`getBillDate`(`BillDetails`.`BillNumber`) AS `Bill Date`,`BillDetails`.`ItemID` AS `Item ID`,`getItemDescription`(`BillDetails`.`ItemID`) AS `Description`,`getUnitPrice`(`BillDetails`.`ItemID`) AS `Unit Price`,`BillDetails`.`SoldQty` AS `Sold Quantity`,(`getUnitPrice`(`BillDetails`.`ItemID`) * `BillDetails`.`SoldQty`) AS `Total Price` from `BillDetails` */;
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

-- Dump completed on 2022-11-28  8:59:42
