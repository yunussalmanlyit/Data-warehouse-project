CREATE DATABASE  IF NOT EXISTS `salmaninsurance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salmaninsurance`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: salmaninsurance
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agent` (
  `agent_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `agent_type` varchar(14) NOT NULL,
  `date` date NOT NULL,
  `location_id` int(10) NOT NULL,
  `pincode` int(10) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_dim`
--

DROP TABLE IF EXISTS `agent_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agent_dim` (
  `agent_dim_id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `agent_type` varchar(14) NOT NULL,
  `scd_start_date` datetime NOT NULL,
  `scd_end_date` datetime DEFAULT NULL,
  `scd_active` tinyint(1) NOT NULL,
  `scd_version` int(11) NOT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`agent_dim_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `agent_dim_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_stage`
--

DROP TABLE IF EXISTS `agent_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agent_stage` (
  `agent_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `agent_type` varchar(14) NOT NULL,
  `date` date NOT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `agent_stage_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calender_dim`
--

DROP TABLE IF EXISTS `calender_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `calender_dim` (
  `date_key` int(10) NOT NULL AUTO_INCREMENT,
  `day` int(2) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `weekday` varchar(3) NOT NULL,
  `month_words` varchar(3) NOT NULL,
  `weekday_num` int(10) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`date_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5845 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `pincode` varchar(8) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19202123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_dim`
--

DROP TABLE IF EXISTS `customer_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_dim` (
  `customer_dim_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `pincode` varchar(8) NOT NULL,
  `dob` datetime NOT NULL,
  `scd_start_date` datetime NOT NULL,
  `scd_end_date` datetime DEFAULT NULL,
  `scd_active` tinyint(1) NOT NULL,
  `scd_version` int(11) NOT NULL,
  PRIMARY KEY (`customer_dim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `location_id` int(10) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_dim`
--

DROP TABLE IF EXISTS `location_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location_dim` (
  `location_id` int(10) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policy_fact`
--

DROP TABLE IF EXISTS `policy_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `policy_fact` (
  `policy_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `transaction_type` varchar(14) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `sales_channel` varchar(14) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `customer_dim_id` int(10) NOT NULL,
  `agent_dim_id` int(10) NOT NULL,
  `date_key` int(10) NOT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `push`
--

DROP TABLE IF EXISTS `push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `push` (
  `transaction_type` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `transaction_amt` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(14) NOT NULL,
  `transaction_amt` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `sales_channel` varchar(14) DEFAULT NULL,
  `payment_method` varchar(10) NOT NULL,
  `Customer_id` int(10) NOT NULL,
  `Agent_id` int(10) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Agent_id` (`Agent_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`Agent_id`) REFERENCES `agent` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9036 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_business_rule`
--

DROP TABLE IF EXISTS `transaction_business_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction_business_rule` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(14) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `sales_channel` varchar(14) DEFAULT NULL,
  `payment_method` varchar(10) NOT NULL,
  `Customer_id` int(10) NOT NULL,
  `Agent_id` int(10) NOT NULL,
  `Ready_indicator` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`transaction_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Agent_id` (`Agent_id`),
  CONSTRAINT `transaction_business_rule_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `transaction_business_rule_ibfk_2` FOREIGN KEY (`Agent_id`) REFERENCES `agent` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9036 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_dummy`
--

DROP TABLE IF EXISTS `transaction_dummy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction_dummy` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(14) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `sales_channel` varchar(14) DEFAULT NULL,
  `payment_method` varchar(10) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'salmaninsurance'
--

--
-- Dumping routines for database 'salmaninsurance'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19 13:23:53
