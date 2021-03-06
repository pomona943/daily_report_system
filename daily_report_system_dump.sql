-- MySQL dump 10.13  Distrib 5.7.30, for macos10.14 (x86_64)
--
-- Host: localhost    Database: daily_report_system
-- ------------------------------------------------------
-- Server version	5.7.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_flag` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3um79qgwg340lpaw7phtwudtc` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,0,'1','2020-07-01 07:19:32',0,'田中','DCFC0244FCE43E05B3D5187F71D2E837C0422E71CBEEA28A09BCCBDCF5AA3C89','2020-07-01 07:19:32'),(2,0,'2','2020-07-01 07:20:10',0,'鈴木','531501B8819D23F59403EE1F23DF7EAA0C6420F86331600CEEEE9EF7B22784C6','2020-07-01 07:20:10'),(3,0,'3','2020-07-01 07:20:40',0,'坂本','784B7A511CE84B48422AECDB4D01A8E2F1CE290EE87F7B9B8840F6EE0820BC79','2020-07-01 07:20:40'),(4,0,'4','2020-07-01 07:21:04',0,'岡本','9ED77AEC9CD7D1B44E6285F27C265991FBA934527253BF1AF0517EF2E4AA028D','2020-07-01 07:21:04'),(5,0,'5','2020-07-01 07:21:34',0,' 菅野トモユキ','6D3E324778577A8B16F07327FF1D6A56C9849032867E39B21224807F89B620FC','2020-07-06 07:18:21'),(6,0,'7','2020-07-01 07:22:06',1,'亀山','9D553CA9CCBDD6C170DE787256FDC2C6C13B0AE79D4F3979C5BBD01FF6D8957A','2020-07-04 04:45:50'),(7,1,'9','2020-07-07 06:45:33',0,'松尾','C68D5576E8F0B1A5008B215B6E690D8CB7BE4E0DDA07D0FC40AB3ABA7ADA9E3A','2020-07-07 06:45:33');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `report_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7m58c0h3phjcm6bco7aqikfen` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'雨のため、室内練習場で打撃調整。','2020-07-08 19:27:44','2020-07-08','日報です。','2020-07-08 19:27:44',3),(2,'甲子園へ移動。','2020-07-08 22:28:11','2020-07-06','日報です。','2020-07-09 06:38:13',3),(3,'雨で試合中止だよぉ。\r\n晴れること放棄するなよぉ。','2020-07-09 06:39:50','2020-07-09','日報だよぉ。','2020-07-09 06:39:50',5);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-14 23:11:38
