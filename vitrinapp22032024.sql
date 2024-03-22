-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: vitrinaap
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_country` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `usrmk` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `usrmod` varchar(45) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKp738egrkomomgourst3hqfipb` (`code`),
  KEY `FK1dmt4f3nfuon26epr3ueg4e` (`id_country`),
  CONSTRAINT `FK1dmt4f3nfuon26epr3ueg4e` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `id_city` int(11) NOT NULL,
  `id_table_parameter_type_identification` int(11) NOT NULL,
  `identification` bigint(20) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usrmk` bigint(20) DEFAULT NULL,
  `usrmod` bigint(20) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `identification_UNIQUE` (`identification`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_city` int(11) NOT NULL,
  `id_sector_type` int(11) NOT NULL,
  `id_identification_type` int(11) NOT NULL,
  `identification` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` bigint(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `tittle` varchar(100) DEFAULT NULL,
  `url_photo` varchar(200) DEFAULT NULL,
  `advertising` varchar(400) DEFAULT NULL,
  `bg_color` varchar(45) DEFAULT NULL,
  `font_color` varchar(45) DEFAULT NULL,
  `usrmk` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `usrmod` varchar(45) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identification_UNIQUE` (`identification`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_companny_id_sector_idx` (`id_sector_type`),
  KEY `fk_companny_id_identification_type_idx` (`id_identification_type`),
  CONSTRAINT `fk_companny_id_city` FOREIGN KEY (`id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_companny_id_identification_type` FOREIGN KEY (`id_identification_type`) REFERENCES `table_parameter` (`id`),
  CONSTRAINT `fk_companny_id_sector` FOREIGN KEY (`id_sector_type`) REFERENCES `table_parameter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `usrmk` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `usrmod` varchar(45) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5s4ptnuqtd24d4p9au2rv53qm` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_table_parameter_type_item` int(11) NOT NULL,
  `id_compannyapp` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(400) NOT NULL,
  `value` int(11) NOT NULL,
  `availability` int(11) NOT NULL DEFAULT '0',
  `url_image` varchar(400) NOT NULL,
  `at_home` int(11) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `promo` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `usrmk` bigint(20) NOT NULL,
  `usrmod` bigint(20) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_trace`
--

DROP TABLE IF EXISTS `log_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  `method` varchar(200) NOT NULL,
  `data_request` json DEFAULT NULL,
  `data_response` json DEFAULT NULL,
  `data_attached` mediumblob,
  `data_attached_name` varchar(200) DEFAULT NULL,
  `data_attached_type` varchar(45) DEFAULT NULL,
  `data_attached_size` int(11) DEFAULT NULL,
  `http_response` int(11) DEFAULT NULL,
  `ip_client` varchar(200) DEFAULT NULL,
  `ip_server` varchar(200) DEFAULT NULL,
  `execution_time` bigint(20) DEFAULT NULL,
  `error` varchar(400) DEFAULT NULL,
  `usrmk` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `usrmod` varchar(45) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `id_rate` int(11) NOT NULL,
  `id_table_parameter_type_member` int(11) NOT NULL,
  `id_table_parameter_type_identification` int(11) NOT NULL,
  `identification` bigint(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usrmk` bigint(20) NOT NULL,
  `usrmod` bigint(20) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_member`),
  UNIQUE KEY `identification_UNIQUE` (`identification`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `peschuse` int(11) DEFAULT '0',
  `usrmk` bigint(20) NOT NULL,
  `usrmod` bigint(20) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_parameter`
--

DROP TABLE IF EXISTS `table_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `table` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `value` varchar(400) NOT NULL,
  `usrmk` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `usrmod` varchar(45) DEFAULT NULL,
  `datemk` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_type` int(11) NOT NULL,
  `id_identification_type` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `identification` bigint(20) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `url_photo` varchar(400) DEFAULT NULL,
  `pay` int(11) DEFAULT '0',
  `usrmk` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `usrmod` varchar(45) DEFAULT NULL,
  `datemk` datetime DEFAULT CURRENT_TIMESTAMP,
  `datemod` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identification_UNIQUE` (`identification`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_id_user_type_idx` (`id_user_type`),
  KEY `fk_user_id_identification_type_idx` (`id_identification_type`),
  KEY `fk_user_id_city_idx` (`id_city`),
  KEY `fk_user_id_company_idx` (`id_company`),
  CONSTRAINT `fk_user_id_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_user_id_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_user_id_identification_type` FOREIGN KEY (`id_identification_type`) REFERENCES `table_parameter` (`id`),
  CONSTRAINT `fk_user_id_user_type` FOREIGN KEY (`id_user_type`) REFERENCES `table_parameter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-22 11:10:07
