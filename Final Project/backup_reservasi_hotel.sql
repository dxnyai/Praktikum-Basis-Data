-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: reservasi_kamar_hotel
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
-- Table structure for table `detail_reservasi`
--

DROP TABLE IF EXISTS `detail_reservasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_reservasi` (
  `id_detail` char(5) NOT NULL,
  `id_reservasi` char(5) NOT NULL,
  `id_kamar` char(5) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `fk_detail_reservasi` (`id_reservasi`),
  KEY `fk_detail_kamar` (`id_kamar`),
  CONSTRAINT `fk_detail_kamar` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`),
  CONSTRAINT `fk_detail_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_reservasi`
--

LOCK TABLES `detail_reservasi` WRITE;
/*!40000 ALTER TABLE `detail_reservasi` DISABLE KEYS */;
INSERT INTO `detail_reservasi` VALUES ('D001','R001','K001'),('D002','R001','K002'),('D003','R002','K003'),('D004','R003','K004'),('D005','R003','K005'),('D006','R004','K006'),('D007','R005','K007'),('D008','R005','K001');
/*!40000 ALTER TABLE `detail_reservasi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_detail_reservasi
AFTER INSERT ON detail_reservasi
FOR EACH ROW
BEGIN
    UPDATE kamar
    SET status_kamar = 'Dipesan'
    WHERE id_kamar = NEW.id_kamar;

    INSERT INTO log_aktivitas (aksi, keterangan)
    VALUES (
        'INSERT DETAIL RESERVASI',
        CONCAT('Kamar ', NEW.id_kamar, ' dipesan pada reservasi ', NEW.id_reservasi)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kamar`
--

DROP TABLE IF EXISTS `kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kamar` (
  `id_kamar` char(5) NOT NULL,
  `id_tipe` char(5) NOT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `status_kamar` varchar(20) DEFAULT 'Tersedia',
  PRIMARY KEY (`id_kamar`),
  UNIQUE KEY `nomor_kamar` (`nomor_kamar`),
  KEY `fk_kamar_tipe` (`id_tipe`),
  CONSTRAINT `fk_kamar_tipe` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_kamar` (`id_tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamar`
--

LOCK TABLES `kamar` WRITE;
/*!40000 ALTER TABLE `kamar` DISABLE KEYS */;
INSERT INTO `kamar` VALUES ('K001','TP002','101','Dipesan'),('K002','TP002','102','Tersedia'),('K003','TP003','201','Tersedia'),('K004','TP001','103','Tersedia'),('K005','TP001','104','Tersedia'),('K006','TP003','202','Tersedia'),('K007','TP001','105','Tersedia');
/*!40000 ALTER TABLE `kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aktivitas`
--

DROP TABLE IF EXISTS `log_aktivitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_aktivitas` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aktivitas`
--

LOCK TABLES `log_aktivitas` WRITE;
/*!40000 ALTER TABLE `log_aktivitas` DISABLE KEYS */;
INSERT INTO `log_aktivitas` VALUES (1,'INSERT DETAIL RESERVASI','Kamar K001 dipesan pada reservasi R005','2026-06-21 15:02:44');
/*!40000 ALTER TABLE `log_aktivitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservasi`
--

DROP TABLE IF EXISTS `reservasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservasi` (
  `id_reservasi` char(5) NOT NULL,
  `id_tamu` char(5) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `tanggal_checkout` date NOT NULL,
  PRIMARY KEY (`id_reservasi`),
  KEY `fk_reservasi_tamu` (`id_tamu`),
  CONSTRAINT `fk_reservasi_tamu` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id_tamu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservasi`
--

LOCK TABLES `reservasi` WRITE;
/*!40000 ALTER TABLE `reservasi` DISABLE KEYS */;
INSERT INTO `reservasi` VALUES ('R001','T001','2026-05-05','2026-05-07'),('R002','T002','2026-05-06','2026-05-08'),('R003','T003','2026-05-10','2026-05-12'),('R004','T004','2026-05-11','2026-05-13'),('R005','T005','2026-05-15','2026-05-17');
/*!40000 ALTER TABLE `reservasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamu`
--

DROP TABLE IF EXISTS `tamu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamu` (
  `id_tamu` char(5) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_tamu`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_unique_email` (`email`),
  KEY `idx_nama_tamu` (`nama_tamu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamu`
--

LOCK TABLES `tamu` WRITE;
/*!40000 ALTER TABLE `tamu` DISABLE KEYS */;
INSERT INTO `tamu` VALUES ('T001','Dany Akhdan','dany@gmail.com','81234567891','Bogor'),('T002','Ella Freya','ella@gmail.com','82345678912','Bandung'),('T003','Nafis Rabbani','nafis@gmail.com','83456789123','Borobudur'),('T004','Euaggelion Purnomo','euaggelion@gmail.com','84567891234','Metroyudan'),('T005','Hanif Raharjo','hanif@gmail.com','85678912345','Sleman');
/*!40000 ALTER TABLE `tamu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe_kamar`
--

DROP TABLE IF EXISTS `tipe_kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipe_kamar` (
  `id_tipe` char(5) NOT NULL,
  `nama_tipe` varchar(50) NOT NULL,
  `harga_per_malam` decimal(12,2) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  PRIMARY KEY (`id_tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe_kamar`
--

LOCK TABLES `tipe_kamar` WRITE;
/*!40000 ALTER TABLE `tipe_kamar` DISABLE KEYS */;
INSERT INTO `tipe_kamar` VALUES ('TP001','Standard',300000.00,2),('TP002','Deluxe',500000.00,2),('TP003','Suite',800000.00,4);
/*!40000 ALTER TABLE `tipe_kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `id_transaksi` char(5) NOT NULL,
  `id_reservasi` char(5) NOT NULL,
  `metode_pembayaran` varchar(30) DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL,
  `total_bayar` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `fk_transaksi_reservasi` (`id_reservasi`),
  CONSTRAINT `fk_transaksi_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES ('P001','R001','Transfer Bank','Lunas','2026-05-05',1000000.00),('P002','R002','Kartu Kredit','Lunas','2026-05-06',800000.00),('P003','R003','Cash','Pending',NULL,600000.00),('P004','R004','Transfer Bank','Lunas','2026-05-11',800000.00),('P005','R005','Cash','Pending',NULL,300000.00);
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_reservasi_hotel`
--

DROP TABLE IF EXISTS `v_reservasi_hotel`;
/*!50001 DROP VIEW IF EXISTS `v_reservasi_hotel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_reservasi_hotel` AS SELECT
 1 AS `id_reservasi`,
  1 AS `nama_tamu`,
  1 AS `no_telepon`,
  1 AS `tanggal_checkin`,
  1 AS `tanggal_checkout`,
  1 AS `nomor_kamar`,
  1 AS `nama_tipe`,
  1 AS `harga_per_malam`,
  1 AS `metode_pembayaran`,
  1 AS `status_pembayaran`,
  1 AS `total_bayar` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_reservasi_hotel`
--

/*!50001 DROP VIEW IF EXISTS `v_reservasi_hotel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_reservasi_hotel` AS select `r`.`id_reservasi` AS `id_reservasi`,`t`.`nama_tamu` AS `nama_tamu`,`t`.`no_telepon` AS `no_telepon`,`r`.`tanggal_checkin` AS `tanggal_checkin`,`r`.`tanggal_checkout` AS `tanggal_checkout`,`k`.`nomor_kamar` AS `nomor_kamar`,`tk`.`nama_tipe` AS `nama_tipe`,`tk`.`harga_per_malam` AS `harga_per_malam`,`tr`.`metode_pembayaran` AS `metode_pembayaran`,`tr`.`status_pembayaran` AS `status_pembayaran`,`tr`.`total_bayar` AS `total_bayar` from (((((`reservasi` `r` join `tamu` `t` on(`r`.`id_tamu` = `t`.`id_tamu`)) join `detail_reservasi` `dr` on(`r`.`id_reservasi` = `dr`.`id_reservasi`)) join `kamar` `k` on(`dr`.`id_kamar` = `k`.`id_kamar`)) join `tipe_kamar` `tk` on(`k`.`id_tipe` = `tk`.`id_tipe`)) join `transaksi` `tr` on(`r`.`id_reservasi` = `tr`.`id_reservasi`)) */;
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

-- Dump completed on 2026-06-21 22:08:24
