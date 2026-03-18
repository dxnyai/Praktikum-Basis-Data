-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: modul4
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `npm` varchar(5) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `jurusan` varchar(32) NOT NULL,
  PRIMARY KEY (`npm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('25001','Chris Redfield','Teknik Mesin'),('25002','Jill Valentine','Teknik Mesin'),('25003','Rebecca Chambers','Kedokteran'),('25004','Billy Coen','Teknik Industri'),('25005','Claire Redfield','Akuntansi'),('25006','Leon Scott Kennedy','Teknik Industri'),('25007','Sherry Birkin','Teknik Informatika'),('25008','Ada Wong','Akuntansi'),('25009','Albert Wesker','Kedokteran'),('25010','Ashley Graham','Hukum'),('25011','Sheva Alomar','Teknik Mesin'),('25012','Helena Harper','Teknik Industri'),('25013','Piers Nivans','Teknik Mesin'),('25014','Carla Radames','Kedokteran'),('25015','Jake Wesker','Teknik Informatika'),('25016','Ethan Winters','Teknik Mesin'),('25017','Mia Winters','Akuntansi'),('25018','Evelyn','Kedokteran'),('25019','Zoe Baker','Teknik Informatika'),('25020','Carlos Oliveira','Teknik Industri'),('25021','Rosemary Winters','Hukum'),('25022','Grace Ashcroft','Hukum'),('25023','Victor Gideon','Kedokteran');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliah`
--

DROP TABLE IF EXISTS `mata_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mata_kuliah` (
  `kode` varchar(4) NOT NULL,
  `nama` varchar(67) NOT NULL,
  `sks` int(11) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliah`
--

LOCK TABLES `mata_kuliah` WRITE;
/*!40000 ALTER TABLE `mata_kuliah` DISABLE KEYS */;
INSERT INTO `mata_kuliah` VALUES ('MK01','Matematika',3),('MK02','Pancasila',2),('MK03','Fisika',3),('MK04','Kimia',3),('MK05','Bahasa Inggris',2);
/*!40000 ALTER TABLE `mata_kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npm` varchar(5) NOT NULL,
  `kode` varchar(4) NOT NULL,
  `nilai` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `npm` (`npm`),
  KEY `kode` (`kode`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`),
  CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `mata_kuliah` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilai`
--

LOCK TABLES `nilai` WRITE;
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` VALUES (1,'25001','MK01',78.00),(2,'25001','MK02',91.00),(3,'25001','MK03',85.00),(4,'25001','MK04',99.00),(5,'25001','MK05',76.00),(6,'25002','MK01',82.00),(7,'25002','MK02',97.00),(8,'25002','MK03',76.00),(9,'25002','MK04',89.00),(10,'25002','MK05',100.00),(11,'25003','MK01',88.00),(12,'25003','MK02',94.00),(13,'25003','MK03',79.00),(14,'25003','MK04',83.00),(15,'25003','MK05',97.00),(16,'25004','MK01',100.00),(17,'25004','MK02',92.00),(18,'25004','MK03',87.00),(19,'25004','MK04',81.00),(20,'25004','MK05',75.00),(21,'25005','MK01',86.00),(22,'25005','MK02',95.00),(23,'25005','MK03',90.00),(24,'25005','MK04',77.00),(25,'25005','MK05',82.00),(26,'25006','MK01',89.00),(27,'25006','MK02',93.00),(28,'25006','MK03',84.00),(29,'25006','MK04',96.00),(30,'25006','MK05',80.00),(31,'25007','MK01',91.00),(32,'25007','MK02',78.00),(33,'25007','MK03',88.00),(34,'25007','MK04',99.00),(35,'25007','MK05',85.00),(36,'25008','MK01',76.00),(37,'25008','MK02',83.00),(38,'25008','MK03',97.00),(39,'25008','MK04',92.00),(40,'25008','MK05',87.00),(41,'25009','MK01',90.00),(42,'25009','MK02',81.00),(43,'25009','MK03',75.00),(44,'25009','MK04',94.00),(45,'25009','MK05',86.00),(46,'25010','MK01',85.00),(47,'25010','MK02',88.00),(48,'25010','MK03',91.00),(49,'25010','MK04',79.00),(50,'25010','MK05',100.00),(51,'25011','MK01',82.00),(52,'25011','MK02',96.00),(53,'25011','MK03',84.00),(54,'25011','MK04',93.00),(55,'25011','MK05',77.00),(56,'25012','MK01',95.00),(57,'25012','MK02',89.00),(58,'25012','MK03',80.00),(59,'25012','MK04',78.00),(60,'25012','MK05',92.00),(61,'25013','MK01',87.00),(62,'25013','MK02',83.00),(63,'25013','MK03',90.00),(64,'25013','MK04',99.00),(65,'25013','MK05',76.00),(66,'25014','MK01',94.00),(67,'25014','MK02',82.00),(68,'25014','MK03',88.00),(69,'25014','MK04',85.00),(70,'25014','MK05',91.00),(71,'25015','MK01',79.00),(72,'25015','MK02',100.00),(73,'25015','MK03',86.00),(74,'25015','MK04',93.00),(75,'25015','MK05',84.00),(76,'25016','MK01',92.00),(77,'25016','MK02',77.00),(78,'25016','MK03',95.00),(79,'25016','MK04',81.00),(80,'25016','MK05',89.00),(81,'25017','MK01',83.00),(82,'25017','MK02',87.00),(83,'25017','MK03',90.00),(84,'25017','MK04',96.00),(85,'25017','MK05',78.00),(86,'25018','MK01',88.00),(87,'25018','MK02',94.00),(88,'25018','MK03',82.00),(89,'25018','MK04',85.00),(90,'25018','MK05',91.00),(91,'25019','MK01',76.00),(92,'25019','MK02',99.00),(93,'25019','MK03',89.00),(94,'25019','MK04',93.00),(95,'25019','MK05',80.00),(96,'25020','MK01',97.00),(97,'25020','MK02',84.00),(98,'25020','MK03',78.00),(99,'25020','MK04',92.00),(100,'25020','MK05',86.00),(101,'25021','MK01',90.00),(102,'25021','MK02',83.00),(103,'25021','MK03',75.00),(104,'25021','MK04',95.00),(105,'25021','MK05',88.00),(106,'25022','MK01',91.00),(107,'25022','MK02',87.00),(108,'25022','MK03',82.00),(109,'25022','MK04',96.00),(110,'25022','MK05',79.00),(111,'25023','MK01',85.00),(112,'25023','MK02',93.00),(113,'25023','MK03',88.00),(114,'25023','MK04',77.00),(115,'25023','MK05',100.00);
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 15:21:07
