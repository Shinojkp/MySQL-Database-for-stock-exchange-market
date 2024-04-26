-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stock_exchange_market
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,100.00),(2,2,1200.00),(3,3,1200.00),(4,4,1600.00),(5,5,1400.00),(6,6,2000.00),(7,7,2500.00),(8,8,1000.00),(9,9,560.00),(10,10,2500.00);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientportfolio`
--

DROP TABLE IF EXISTS `clientportfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientportfolio` (
  `portfolio_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`portfolio_id`),
  KEY `client_id` (`client_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `clientportfolio_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `clientportfolio_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientportfolio`
--

LOCK TABLES `clientportfolio` WRITE;
/*!40000 ALTER TABLE `clientportfolio` DISABLE KEYS */;
INSERT INTO `clientportfolio` VALUES (1,1,1,1),(2,2,1,1);
/*!40000 ALTER TABLE `clientportfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Alex','kkakl'),(2,'Sam','kokjj'),(3,'Bob','kjjhdjah'),(4,'Aravind','dfdf'),(5,'Shyam','sdf'),(6,'Bran','osahd'),(7,'Lijo','djjfjf'),(8,'Nas','osdhaoshfs'),(9,'Ibeh','sijafif'),(10,'Jose','jdsfg');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricehistory`
--

DROP TABLE IF EXISTS `pricehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricehistory` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `pricehistory_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricehistory`
--

LOCK TABLES `pricehistory` WRITE;
/*!40000 ALTER TABLE `pricehistory` DISABLE KEYS */;
INSERT INTO `pricehistory` VALUES (1,1,250.00,'2023-02-19 23:00:00'),(2,1,300.00,'2023-02-20 23:00:00'),(3,2,200.00,'2023-02-24 23:00:00'),(4,2,250.00,'2023-02-24 23:00:00');
/*!40000 ALTER TABLE `pricehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `price_id` int NOT NULL,
  `stock_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`price_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,1,300.00,'2023-02-20 23:00:00'),(2,2,250.00,'2023-02-24 23:00:00'),(3,3,280.00,'2023-06-23 22:00:00'),(4,4,600.00,'2023-05-22 22:00:00'),(5,5,500.00,'2023-05-23 22:00:00'),(6,6,1200.00,'2023-05-20 21:00:00'),(7,7,2400.00,'2023-06-02 08:20:00'),(8,8,540.00,'2023-02-04 23:00:00'),(9,9,560.00,'2023-06-24 22:00:00'),(10,10,550.00,'2023-06-24 18:03:00');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stock_id` int NOT NULL,
  `stock_name` varchar(255) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,'HP','HP','IT'),(2,'MCD','MD','MOTOR'),(3,'HOG','HG','FOOD'),(4,'TESLA','TS','MULTI'),(5,'BMW','BW','VEHICLE'),(6,'AAB','A','AUTO'),(7,'BAB','BA','BANK'),(8,'CCJ','CS','AIR'),(9,'L NT','LT','BUSINESS'),(10,'TCS','TC','IT');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `transaction_type` varchar(10) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,1,'Buy','2023-05-28 11:22:32'),(2,1,1,1,'Buy','2023-05-28 11:24:07'),(3,1,1,1,'Buy','2023-05-28 12:21:20'),(4,1,1,1,'Buy','2023-05-28 12:22:48'),(5,2,1,1,'Buy','2023-05-29 20:43:42');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-26 23:32:25
