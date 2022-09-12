-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: calendar
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `break`
--

DROP TABLE IF EXISTS `break`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `break` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `break`
--

LOCK TABLES `break` WRITE;
/*!40000 ALTER TABLE `break` DISABLE KEYS */;
INSERT INTO `break` VALUES (1,'2022-12-24','2023-01-08');
/*!40000 ALTER TABLE `break` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `dayNumber` int DEFAULT NULL,
  `time` double DEFAULT NULL,
  `fk_hall` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_hall_id_fk` (`fk_hall`),
  CONSTRAINT `event_hall_id_fk` FOREIGN KEY (`fk_hall`) REFERENCES `hall` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opponent` varchar(32) DEFAULT NULL,
  `fk_hall` int DEFAULT NULL,
  `fk_team` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_hall_id_fk` (`fk_hall`),
  KEY `match_team_id_fk` (`fk_team`),
  CONSTRAINT `match_hall_id_fk` FOREIGN KEY (`fk_hall`) REFERENCES `hall` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_team_id_fk` FOREIGN KEY (`fk_team`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Rapid Bienne',1,2,'2022-10-22','20:30:00'),(2,'Rapid Bienne',3,2,'2022-11-24','19:00:00');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'Marly Grand-Pré'),(2,'CO de Pérolles'),(3,'Externe');
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'U18F'),(2,'U20F'),(3,'U16');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_team` int DEFAULT NULL,
  `fk_hall` int DEFAULT NULL,
  `dayNumber` int DEFAULT NULL,
  `time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_hall_id_fk` (`fk_hall`),
  KEY `training_team_id_fk` (`fk_team`),
  CONSTRAINT `training_hall_id_fk` FOREIGN KEY (`fk_hall`) REFERENCES `hall` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `training_team_id_fk` FOREIGN KEY (`fk_team`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,1,2,2,18),(2,1,2,4,19),(3,2,1,2,20.5),(4,2,2,4,19);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-12 13:47:44
