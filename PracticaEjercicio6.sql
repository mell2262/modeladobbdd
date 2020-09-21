-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: 6.practicafinal
-- ------------------------------------------------------
-- Server version	8.0.21

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
  `idAdress` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `door` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pc` varchar(10) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAdress`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'concili','78',1,'2','Barcelona','08018','España'),(2,'trento','84',2,'3','Barcelona','08001','España'),(3,'valencia','95',1,'1','Madrid','0265','España'),(4,'gran via','112',4,'b','bs as','7060','Argentina');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `idBrand` int NOT NULL AUTO_INCREMENT,
  `Supplier_idSupplier` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBrand`),
  KEY `fk_Marcas_Supplier1_idx` (`Supplier_idSupplier`),
  CONSTRAINT `fk_Marcas_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,1,'Polaroid'),(2,1,'Reef'),(3,2,'Rglass'),(4,1,'MiGfa');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Client_idClient` int DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de alta de cliente',
  PRIMARY KEY (`idClient`),
  KEY `fk_Client_Client1_idx` (`Client_idClient`),
  CONSTRAINT `fk_Client_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,NULL,'Marta','22565','marta@mi','2020-09-21 10:53:44'),(2,NULL,'Jorge','1554258','jorji@mi','2020-09-21 10:54:20'),(3,1,'Xavi','4587569','xavi@mimi','2020-09-21 10:54:52');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `idGlasses` int NOT NULL AUTO_INCREMENT,
  `Brand_idBrand` int NOT NULL,
  `graduation` decimal(10,2) DEFAULT NULL COMMENT 'Graduacion de cristales ',
  `frame` enum('Flotante','Pasta','Metalica') DEFAULT NULL,
  `frameColor` varchar(45) DEFAULT NULL,
  `glassesColor` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_Gafas_Marcas1_idx` (`Brand_idBrand`),
  CONSTRAINT `fk_Gafas_Marcas1` FOREIGN KEY (`Brand_idBrand`) REFERENCES `brand` (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,0.25,'Flotante','Blanco','Negro',20),(2,1,0.75,'Pasta','Negro','Azul',49),(3,3,1.00,'Pasta','Amarillo','Negro',53);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses_has_order`
--

DROP TABLE IF EXISTS `glasses_has_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses_has_order` (
  `Glasses_idGlasses` int NOT NULL,
  `Order_idOrder` int NOT NULL,
  PRIMARY KEY (`Glasses_idGlasses`,`Order_idOrder`),
  KEY `fk_Glasses_has_Order_Order1_idx` (`Order_idOrder`),
  KEY `fk_Glasses_has_Order_Glasses1_idx` (`Glasses_idGlasses`),
  CONSTRAINT `fk_Glasses_has_Order_Glasses1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `glasses` (`idGlasses`),
  CONSTRAINT `fk_Glasses_has_Order_Order1` FOREIGN KEY (`Order_idOrder`) REFERENCES `order` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses_has_order`
--

LOCK TABLES `glasses_has_order` WRITE;
/*!40000 ALTER TABLE `glasses_has_order` DISABLE KEYS */;
INSERT INTO `glasses_has_order` VALUES (1,1),(1,2),(3,2),(2,3);
/*!40000 ALTER TABLE `glasses_has_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `Client_idClient` int NOT NULL,
  `employer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_Order_Client1_idx` (`Client_idClient`),
  CONSTRAINT `fk_Order_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'Valeria'),(2,2,'Vanesa'),(3,2,'Laura'),(4,3,'Laura');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `Adress_idAdress` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `nif` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSupplier`),
  KEY `fk_Supplier_Adress1_idx` (`Adress_idAdress`),
  CONSTRAINT `fk_Supplier_Adress1` FOREIGN KEY (`Adress_idAdress`) REFERENCES `address` (`idAdress`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,1,'Juan','123456','t1255y','123456'),(2,3,'Pedro','25468','ttt254','22536'),(3,2,'Lili','987563','sds55331w','219985');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-21 13:18:18
