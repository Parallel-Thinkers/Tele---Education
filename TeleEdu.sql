CREATE DATABASE  IF NOT EXISTS `TELE_EDU_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TELE_EDU_DB`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: TELE_EDU_DB
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `ANSWERS`
--

DROP TABLE IF EXISTS `ANSWERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANSWERS` (
  `ANSWERS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANSWERS` varchar(500) DEFAULT NULL,
  `UP_VOTE` int(11) DEFAULT NULL,
  `DOWN_VOTE` varchar(500) DEFAULT NULL,
  `TEXT_ID` int(11) DEFAULT NULL,
  `USER_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ANSWERS_ID`),
  KEY `fk_ANSWERS_1_idx` (`USER_ID`),
  KEY `fk_ANSWERS_2_idx` (`TEXT_ID`),
  CONSTRAINT `fk_ANSWERS_1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANSWERS_2` FOREIGN KEY (`TEXT_ID`) REFERENCES `TEXT` (`TEXT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANSWERS`
--

LOCK TABLES `ANSWERS` WRITE;
/*!40000 ALTER TABLE `ANSWERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ANSWERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTENDANCE`
--

DROP TABLE IF EXISTS `ATTENDANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTENDANCE` (
  `ATTENDANCE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LECTURE_CALENDER_ID` int(11) DEFAULT NULL,
  `S_ID` int(11) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ATTENDANCE_ID`),
  KEY `fk_ATTENDANCE_1_idx` (`LECTURE_CALENDER_ID`),
  KEY `fk_ATTENDANCE_2_idx` (`S_ID`),
  CONSTRAINT `fk_ATTENDANCE_1` FOREIGN KEY (`LECTURE_CALENDER_ID`) REFERENCES `LECTURE_CALENDER` (`LECTURE_CALENDER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATTENDANCE_2` FOREIGN KEY (`S_ID`) REFERENCES `STUDENT` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTENDANCE`
--

LOCK TABLES `ATTENDANCE` WRITE;
/*!40000 ALTER TABLE `ATTENDANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTENDANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROADCAST`
--

DROP TABLE IF EXISTS `BROADCAST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROADCAST` (
  `BROADCAST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_BODY` varchar(500) DEFAULT NULL,
  `TI_ID` int(11) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`BROADCAST_ID`),
  KEY `fk_BROADCAST_1_idx` (`MESSAGE_BODY`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROADCAST`
--

LOCK TABLES `BROADCAST` WRITE;
/*!40000 ALTER TABLE `BROADCAST` DISABLE KEYS */;
INSERT INTO `BROADCAST` VALUES (1,'Re-upload Data of test 1',1,'2015-07-16 04:23:42'),(2,'Upload Marks',1,'2015-07-16 04:51:18'),(3,'Meeting of All SC was cancelled',1,'2015-07-16 07:20:05'),(4,'send doc asap',1,'2015-07-16 09:36:55'),(5,'hello sc',1,'2015-07-16 11:17:18');
/*!40000 ALTER TABLE `BROADCAST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLASS`
--

DROP TABLE IF EXISTS `CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLASS` (
  `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SHC_ID` int(11) DEFAULT NULL,
  `TAGS_ID` int(11) DEFAULT NULL,
  `CLASS` int(11) DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`),
  KEY `fk_CLASS_1_idx` (`TAGS_ID`),
  KEY `fk_CLASS_2_idx` (`SHC_ID`),
  CONSTRAINT `fk_CLASS_1` FOREIGN KEY (`TAGS_ID`) REFERENCES `TAGS` (`TAGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLASS_2` FOREIGN KEY (`SHC_ID`) REFERENCES `SCHOOL` (`SHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLASS`
--

LOCK TABLES `CLASS` WRITE;
/*!40000 ALTER TABLE `CLASS` DISABLE KEYS */;
INSERT INTO `CLASS` VALUES (105,108,101,5),(205,108,201,5),(305,108,201,6),(405,108,101,6),(505,108,501,6),(605,208,101,5),(705,208,201,5),(805,208,101,6),(905,208,201,6),(1005,208,501,6),(1015,308,501,5),(1020,308,101,6),(1025,308,201,6),(1030,308,401,6),(1035,308,501,6),(1040,308,101,5),(1045,308,101,5),(1050,308,201,5),(1105,408,101,5),(1110,408,201,5),(1115,408,501,5),(1120,408,101,6),(1125,408,201,6),(1130,408,301,6),(1135,408,401,6),(1140,408,501,6);
/*!40000 ALTER TABLE `CLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HA`
--

DROP TABLE IF EXISTS `HA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HA` (
  `HA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HA_ID`),
  KEY `fk_HA_1_idx` (`USER_ID`),
  CONSTRAINT `fk_HA_1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HA`
--

LOCK TABLES `HA` WRITE;
/*!40000 ALTER TABLE `HA` DISABLE KEYS */;
/*!40000 ALTER TABLE `HA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ISSUES`
--

DROP TABLE IF EXISTS `ISSUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISSUES` (
  `ISSUES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SC_ID` int(11) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `TITLE` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ISSUES_ID`),
  KEY `fk_ISSUES_1_idx` (`SC_ID`),
  CONSTRAINT `fk_ISSUES_1` FOREIGN KEY (`SC_ID`) REFERENCES `SC` (`SC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISSUES`
--

LOCK TABLES `ISSUES` WRITE;
/*!40000 ALTER TABLE `ISSUES` DISABLE KEYS */;
INSERT INTO `ISSUES` VALUES (1,1,NULL,'Issue 1','Monitor not working','1'),(2,1,NULL,'Issue 2','Low Internet speed','0'),(3,1,NULL,'Issue 3','Mouse not working','1'),(4,5,NULL,'Issue4','Low Internet Speed','1'),(5,5,NULL,'issue5','system not working','0'),(6,1,NULL,'Issue8','Problem in accessing system','0'),(7,1,NULL,'Issue8','Problem in accessing system','0'),(8,1,NULL,'Issue7','Something went wrong','0'),(9,1,NULL,'Issue 14','System not working','0');
/*!40000 ALTER TABLE `ISSUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LECTURE_CALENDER`
--

DROP TABLE IF EXISTS `LECTURE_CALENDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LECTURE_CALENDER` (
  `LECTURE_CALENDER_ID` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `TAGS_ID` int(11) DEFAULT NULL,
  `SUB_TOPIC` varchar(45) DEFAULT NULL,
  `CLASS` int(11) DEFAULT NULL,
  `TEACHER` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LECTURE_CALENDER_ID`),
  KEY `fk_LECTURE_CALENDER_1_idx` (`TAGS_ID`),
  CONSTRAINT `fk_LECTURE_CALENDER_1` FOREIGN KEY (`TAGS_ID`) REFERENCES `TAGS` (`TAGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LECTURE_CALENDER`
--

LOCK TABLES `LECTURE_CALENDER` WRITE;
/*!40000 ALTER TABLE `LECTURE_CALENDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `LECTURE_CALENDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEVEL1_TAG`
--

DROP TABLE IF EXISTS `LEVEL1_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LEVEL1_TAG` (
  `LEVEL1_TAG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_ID` int(11) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEVEL1_TAG_ID`),
  KEY `fk_LEVEL1_TAG_1_idx` (`CLASS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEVEL1_TAG`
--

LOCK TABLES `LEVEL1_TAG` WRITE;
/*!40000 ALTER TABLE `LEVEL1_TAG` DISABLE KEYS */;
INSERT INTO `LEVEL1_TAG` VALUES (1,305,'grammer'),(2,305,'essay'),(3,405,'trignometry'),(4,105,'algebra'),(5,405,'algebra'),(6,405,'geometry'),(7,805,'Trignometry'),(8,805,'Geometry'),(9,805,'algebra'),(10,905,'grammer'),(11,905,'essay'),(12,1020,'trignometry'),(13,1020,'geometry'),(14,1020,'algebra'),(15,1025,'essay'),(16,1025,'grammer'),(17,1120,'algebra'),(18,1120,'geometry'),(19,1120,'trignometry'),(20,1125,'essay'),(21,1125,'grammer');
/*!40000 ALTER TABLE `LEVEL1_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEVEL2_TAG`
--

DROP TABLE IF EXISTS `LEVEL2_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LEVEL2_TAG` (
  `LEVEL2_TAG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LEVEL1_TAG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEVEL2_TAG_ID`),
  KEY `fk_LEVEL2_TAG_1_idx` (`LEVEL1_TAG_ID`),
  CONSTRAINT `fk_LEVEL2_TAG_1` FOREIGN KEY (`LEVEL1_TAG_ID`) REFERENCES `LEVEL1_TAG` (`LEVEL1_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEVEL2_TAG`
--

LOCK TABLES `LEVEL2_TAG` WRITE;
/*!40000 ALTER TABLE `LEVEL2_TAG` DISABLE KEYS */;
INSERT INTO `LEVEL2_TAG` VALUES (1,1,'grm1'),(2,6,'trigo1'),(3,6,'trigo1'),(4,5,'matrix'),(5,5,'matrix'),(6,6,'trigo1'),(7,5,'deteminent'),(8,5,'deteminent'),(9,5,'equation'),(10,5,'eq2'),(11,6,'trigo1, '),(12,5,'three variable'),(13,5,'three variable'),(14,1,'article'),(15,5,'eqn in two variable'),(16,5,'alg5'),(17,3,'trigo123'),(18,6,'geo123'),(19,7,'trig7'),(20,7,'trigo108'),(21,11,'apj abdul kalam'),(22,5,'alg7'),(23,5,'alg9');
/*!40000 ALTER TABLE `LEVEL2_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MARKS`
--

DROP TABLE IF EXISTS `MARKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MARKS` (
  `MARKS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `S_ID` int(11) DEFAULT NULL,
  `TEST_ID` int(11) DEFAULT NULL,
  `MARKS_OBTAINED` int(11) DEFAULT NULL,
  PRIMARY KEY (`MARKS_ID`),
  KEY `fk_MARKS_1_idx` (`S_ID`),
  KEY `fk_MARKS_2_idx` (`TEST_ID`),
  CONSTRAINT `fk_MARKS_1` FOREIGN KEY (`S_ID`) REFERENCES `STUDENT` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MARKS_2` FOREIGN KEY (`TEST_ID`) REFERENCES `TEST` (`TEST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MARKS`
--

LOCK TABLES `MARKS` WRITE;
/*!40000 ALTER TABLE `MARKS` DISABLE KEYS */;
INSERT INTO `MARKS` VALUES (1,1,1,90),(2,5,7,12),(3,6,7,56),(4,7,7,45),(5,12,7,13),(6,13,7,13),(7,14,7,1),(8,15,7,89),(9,21,7,6),(10,22,7,65),(11,25,7,45),(12,5,15,45),(13,6,15,1),(14,7,15,21),(15,12,15,13),(16,13,15,12),(17,14,15,13),(18,15,15,1),(19,21,15,31),(20,22,15,21),(21,25,15,31),(22,26,15,321),(23,27,15,3),(24,5,13,45),(25,6,13,78),(26,7,13,56),(27,12,13,12),(28,13,13,32),(29,14,13,45),(30,15,13,96),(31,21,13,78),(32,22,13,85),(33,25,13,32),(34,26,13,65),(35,27,13,100),(38,18,16,65),(39,19,16,12),(40,20,16,13),(41,33,16,13),(42,18,18,40),(43,19,18,34),(44,20,18,36),(45,33,18,42),(46,18,18,40),(47,19,18,34),(48,20,18,36),(49,33,18,42),(50,5,19,45),(51,6,19,50),(52,7,19,55),(53,12,19,60),(54,13,19,78),(55,14,19,56),(56,15,19,45),(57,21,19,12),(58,22,19,63),(59,25,19,78),(60,26,19,45),(61,27,19,12),(62,34,19,78),(63,35,19,96),(64,5,20,45),(65,6,20,50),(66,7,20,45),(67,12,20,50),(68,13,20,12),(69,14,20,63),(70,15,20,75),(71,21,20,12),(72,22,20,45),(73,25,20,63),(74,26,20,12),(75,27,20,78),(76,34,20,45),(77,35,20,12),(78,37,20,56),(79,38,20,45);
/*!40000 ALTER TABLE `MARKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDIA`
--

DROP TABLE IF EXISTS `MEDIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDIA` (
  `MEDIA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  `TITLE` varchar(45) DEFAULT NULL,
  `UP_VOTE` int(11) DEFAULT NULL,
  `DOWN_VOTE` int(11) DEFAULT NULL,
  `AV_LINK` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `fk_MEDIA_1_idx` (`POST_ID`),
  CONSTRAINT `fk_MEDIA_1` FOREIGN KEY (`POST_ID`) REFERENCES `POST` (`POST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDIA`
--

LOCK TABLES `MEDIA` WRITE;
/*!40000 ALTER TABLE `MEDIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEDIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MESSAGES`
--

DROP TABLE IF EXISTS `MESSAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGES` (
  `MESSAGES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_BODY` varchar(45) DEFAULT NULL,
  `TIME_STAMP` timestamp NULL DEFAULT NULL,
  `TI_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MESSAGES_ID`),
  KEY `fk_MESSAGES_1_idx` (`TI_ID`),
  CONSTRAINT `fk_MESSAGES_1` FOREIGN KEY (`TI_ID`) REFERENCES `TI` (`TI_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MESSAGES`
--

LOCK TABLES `MESSAGES` WRITE;
/*!40000 ALTER TABLE `MESSAGES` DISABLE KEYS */;
/*!40000 ALTER TABLE `MESSAGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NE`
--

DROP TABLE IF EXISTS `NE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NE` (
  `NE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `MOBILE` int(11) DEFAULT NULL,
  `TI_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`NE_ID`),
  KEY `fk_NE_1_idx` (`TI_ID`),
  CONSTRAINT `fk_NE_1` FOREIGN KEY (`TI_ID`) REFERENCES `TI` (`TI_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NE`
--

LOCK TABLES `NE` WRITE;
/*!40000 ALTER TABLE `NE` DISABLE KEYS */;
INSERT INTO `NE` VALUES (1,'mujahid',98934339,1),(2,'amar',97586354,4);
/*!40000 ALTER TABLE `NE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL_MESSAGE`
--

DROP TABLE IF EXISTS `PERSONAL_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAL_MESSAGE` (
  `PERSONAL_MESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` int(11) DEFAULT NULL,
  `RECIVER_ID` int(11) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `MESSAGE_BODY` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL_MESSAGE`
--

LOCK TABLES `PERSONAL_MESSAGE` WRITE;
/*!40000 ALTER TABLE `PERSONAL_MESSAGE` DISABLE KEYS */;
INSERT INTO `PERSONAL_MESSAGE` VALUES (5,1,7,'sended','hello'),(6,1,3,'sended','Please upload the answer of question 12?'),(7,3,1,'sended','I already uploaded the answer, please check the forum.'),(8,1,4,'sended','hello arpit'),(9,4,1,'sended','hey buddy'),(10,1,3,'sended','ok');
/*!40000 ALTER TABLE `PERSONAL_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POST`
--

DROP TABLE IF EXISTS `POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POST` (
  `POST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIME_STAMP` timestamp NULL DEFAULT NULL,
  `TAG_ID` int(11) DEFAULT NULL,
  `TI_ID` int(11) DEFAULT NULL,
  `SHC_ID` int(11) DEFAULT NULL,
  `REFRENCES` varchar(45) DEFAULT NULL,
  `S_ID` int(11) DEFAULT NULL,
  `LEVEL1_TAG_ID` int(11) DEFAULT NULL,
  `LEVEL2_TAG_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`POST_ID`),
  KEY `fk_POST_1_idx` (`TAG_ID`),
  KEY `fk_POST_2_idx` (`SHC_ID`),
  KEY `fk_POST_3_idx` (`S_ID`),
  KEY `fk_POST_4_idx` (`LEVEL1_TAG_ID`),
  KEY `fk_POST_5_idx` (`LEVEL2_TAG_ID`),
  KEY `fk_POST_6_idx` (`TI_ID`),
  CONSTRAINT `fk_POST_1` FOREIGN KEY (`TAG_ID`) REFERENCES `TAGS` (`TAGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_2` FOREIGN KEY (`SHC_ID`) REFERENCES `SCHOOL` (`SHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_3` FOREIGN KEY (`S_ID`) REFERENCES `STUDENT` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_4` FOREIGN KEY (`LEVEL1_TAG_ID`) REFERENCES `LEVEL1_TAG` (`LEVEL1_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_5` FOREIGN KEY (`LEVEL2_TAG_ID`) REFERENCES `LEVEL2_TAG` (`LEVEL2_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_6` FOREIGN KEY (`TI_ID`) REFERENCES `TI` (`TI_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST`
--

LOCK TABLES `POST` WRITE;
/*!40000 ALTER TABLE `POST` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SC`
--

DROP TABLE IF EXISTS `SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SC` (
  `SC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SHC_ID` int(11) DEFAULT NULL,
  `USER_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `fk_SC_1_idx` (`SHC_ID`),
  KEY `fk_SC_2_idx` (`USER_ID`),
  CONSTRAINT `fk_SC_1` FOREIGN KEY (`SHC_ID`) REFERENCES `SCHOOL` (`SHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SC_2` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SC`
--

LOCK TABLES `SC` WRITE;
/*!40000 ALTER TABLE `SC` DISABLE KEYS */;
INSERT INTO `SC` VALUES (1,108,'2'),(2,308,'3'),(5,208,'hamidali483@gmail.com'),(6,408,'Ali@gmail.com'),(7,208,'sc22@gmail.com'),(8,208,'sc232@gmail.com');
/*!40000 ALTER TABLE `SC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHOOL`
--

DROP TABLE IF EXISTS `SCHOOL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCHOOL` (
  `SHC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SH_ID` varchar(45) DEFAULT NULL,
  `SH_NAME` varchar(45) DEFAULT NULL,
  `NE_ID` int(11) DEFAULT NULL,
  `TALUQ_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SHC_ID`),
  KEY `fk_SCHOOL_1_idx` (`TALUQ_ID`),
  KEY `fk_SCHOOL_2_idx` (`NE_ID`),
  CONSTRAINT `fk_SCHOOL_1` FOREIGN KEY (`TALUQ_ID`) REFERENCES `TALUQ` (`TALUQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SCHOOL_2` FOREIGN KEY (`NE_ID`) REFERENCES `NE` (`NE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHOOL`
--

LOCK TABLES `SCHOOL` WRITE;
/*!40000 ALTER TABLE `SCHOOL` DISABLE KEYS */;
INSERT INTO `SCHOOL` VALUES (108,'108','abc school',1,10),(208,'208','efg school',1,10),(308,'308','jk school',1,10),(408,'408','xl public school',2,15);
/*!40000 ALTER TABLE `SCHOOL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENT`
--

DROP TABLE IF EXISTS `STUDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STUDENT` (
  `S_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLLNO` varchar(45) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `CLASS_ID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`S_ID`),
  KEY `fk_STUDENT_1_idx` (`CLASS_ID`),
  CONSTRAINT `fk_STUDENT_1` FOREIGN KEY (`CLASS_ID`) REFERENCES `CLASS` (`CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT`
--

LOCK TABLES `STUDENT` WRITE;
/*!40000 ALTER TABLE `STUDENT` DISABLE KEYS */;
INSERT INTO `STUDENT` VALUES (1,'101','arpit',105,'ndskvhdsvj'),(2,'20','RAM',105,'INDORE'),(3,'123','tanay',105,'banglore'),(4,'456','gopal',105,'vijaywada'),(5,'12','abhi',305,'puna'),(6,'13','shankar',305,'nagpur'),(7,'14','rajeev',305,'raipur'),(8,'45','dsvvd',105,'dffdbdfb'),(9,'78','fgth',105,'yjyumjhm'),(10,'23','qwe',105,'dwff'),(11,'43','dfghtyui',105,'dfghj'),(12,'51','kaustav',305,'kolkata'),(13,'52','arpit',305,'indore'),(14,'265','baba',305,'lukhnow'),(15,'352','piyush',305,'roorkee'),(17,'1234','chetan',605,'in'),(18,'57','monic',805,'vijaywara'),(19,'4567','majnoo',805,'indore , saket nagar'),(20,'6542','muju',805,'ajad nagar'),(21,'2315','majnoo',305,'indore , saket nagar'),(22,'4587','muju',305,'ajad nagar'),(23,'555','amit',105,'banglore'),(24,'556','aparna',105,'mumbai'),(25,'601','bhalu',305,'indore'),(26,'654','bala',305,'bhopal'),(27,'176','naganand',305,'banglore'),(30,'5011','HAMID',605,'INDORE'),(31,'5012','ali',605,'bhopal'),(32,'5013','pavanrr',605,'banglore'),(33,'6011','ramK',805,'chennai'),(34,'6005','apurva',305,'bhilai'),(35,'6006','hulesh',305,'bhilai'),(36,'5005','kanika',105,'agra'),(37,'5019','fghj',305,'indore'),(38,'5020','qwer',305,'bhopal');
/*!40000 ALTER TABLE `STUDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAGS`
--

DROP TABLE IF EXISTS `TAGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAGS` (
  `TAGS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TAGS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAGS`
--

LOCK TABLES `TAGS` WRITE;
/*!40000 ALTER TABLE `TAGS` DISABLE KEYS */;
INSERT INTO `TAGS` VALUES (101,'maths'),(201,'english'),(301,'science'),(401,'hindi'),(501,'social science'),(502,NULL);
/*!40000 ALTER TABLE `TAGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TALUQ`
--

DROP TABLE IF EXISTS `TALUQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TALUQ` (
  `TALUQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TALUQ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TALUQ`
--

LOCK TABLES `TALUQ` WRITE;
/*!40000 ALTER TABLE `TALUQ` DISABLE KEYS */;
INSERT INTO `TALUQ` VALUES (10,'taluq'),(15,'Athani'),(16,'Chikodi'),(17,'Hukeeri'),(18,'Khanapur'),(19,'Supa'),(20,'karwar'),(21,'Halyal'),(22,NULL);
/*!40000 ALTER TABLE `TALUQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST`
--

DROP TABLE IF EXISTS `TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEST` (
  `TEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_ID` int(11) DEFAULT NULL,
  `LEVEL2_TAGS_ID` int(11) DEFAULT NULL,
  `MAX_MARKS` int(11) DEFAULT NULL,
  `TEST_DATE` date DEFAULT NULL,
  PRIMARY KEY (`TEST_ID`),
  KEY `fk_TEST_1_idx` (`CLASS_ID`),
  KEY `fk_TEST_2_idx` (`LEVEL2_TAGS_ID`),
  CONSTRAINT `fk_TEST_1` FOREIGN KEY (`CLASS_ID`) REFERENCES `CLASS` (`CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TEST_2` FOREIGN KEY (`LEVEL2_TAGS_ID`) REFERENCES `LEVEL2_TAG` (`LEVEL2_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST`
--

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
INSERT INTO `TEST` VALUES (1,105,1,100,'2015-07-04'),(2,405,2,50,'2015-07-07'),(3,405,7,150,'2015-07-05'),(4,405,7,150,'2015-07-05'),(5,405,9,75,'2015-07-08'),(6,405,10,90,'2015-07-19'),(7,405,11,0,NULL),(8,405,12,95,'2015-07-10'),(9,405,12,0,NULL),(10,305,14,35,'2015-07-20'),(11,405,15,75,'2015-07-14'),(12,605,1,100,'2015-07-04'),(13,405,16,95,'2015-07-16'),(14,405,17,45,'2015-07-15'),(15,405,18,75,'2015-07-15'),(16,805,19,75,'2015-07-15'),(17,805,20,90,'2015-07-16'),(18,905,21,50,'2015-07-21'),(19,405,22,100,'2015-07-17'),(20,405,23,80,'2015-07-17');
/*!40000 ALTER TABLE `TEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEXT`
--

DROP TABLE IF EXISTS `TEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEXT` (
  `TEXT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUESTION` varchar(45) DEFAULT NULL,
  `POST_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TEXT_ID`),
  KEY `fk_TEXT_1_idx` (`POST_ID`),
  CONSTRAINT `fk_TEXT_1` FOREIGN KEY (`POST_ID`) REFERENCES `POST` (`POST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEXT`
--

LOCK TABLES `TEXT` WRITE;
/*!40000 ALTER TABLE `TEXT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEXT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TI`
--

DROP TABLE IF EXISTS `TI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TI` (
  `TI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(45) DEFAULT NULL,
  `POINTS` int(11) DEFAULT NULL,
  `TALUQ_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TI_ID`),
  KEY `fk_TI_1_idx` (`USER_ID`),
  KEY `fk_TI_2_idx` (`TALUQ_ID`),
  CONSTRAINT `fk_TI_1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TI_2` FOREIGN KEY (`TALUQ_ID`) REFERENCES `TALUQ` (`TALUQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TI`
--

LOCK TABLES `TI` WRITE;
/*!40000 ALTER TABLE `TI` DISABLE KEYS */;
INSERT INTO `TI` VALUES (1,'1',100,10),(2,NULL,NULL,NULL),(3,'mujahidali0611@gmail.com',NULL,18),(4,'TI1@gmail.com',NULL,21),(5,'TI2@gmail.com',NULL,19),(6,'TI3@gmail.com',NULL,18),(7,'TI4@gmail.com',NULL,16),(8,'M123@gmail.com',NULL,20),(9,'abhishek@gmail.com',NULL,17),(10,'Abc@gmail.com',NULL,17),(11,'arpit123@gmail.com',NULL,20),(13,'maj@gmail.com',NULL,21),(14,'arpit1123@gmail.com',NULL,21);
/*!40000 ALTER TABLE `TI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `USER_ID` varchar(45) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `MOBILE` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `APPROVED` varchar(45) DEFAULT NULL,
  `ROLE` varchar(45) DEFAULT NULL,
  `LOGOUT_TIMESTAMP` datetime DEFAULT NULL,
  `LOGIN_TIMESTAMP` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`),
  UNIQUE KEY `MOBILE_UNIQUE` (`MOBILE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1','ankit','','Bangalore','123','True','TI','2015-07-16 16:53:55','0001-01-01 00:00:00'),('2','karan','123456789','Bangalore','123','True','SC','2015-07-16 16:47:49','0001-01-01 00:00:00'),('3','rahul','456963','patana','123','True','SC','1000-01-01 00:00:00',NULL),('4','pavan','45632','hyderabad','45632','True','SC','2015-07-15 19:41:03','0001-01-01 00:00:00'),('Abc@gmail.com','Abc','9893433965','Bangalore','123','True','TI','2015-07-16 16:32:25','0001-01-01 00:00:00'),('abhishek@gmail.com','Abhishek','9893433963','Bangalore','123','True','TI','2015-07-16 13:03:17','0001-01-01 00:00:00'),('Ali@gmail.com','Ali','1200','Bangalore','123','True','SC','2015-07-15 19:42:09','2015-07-15 19:42:09'),('arpit1123@gmail.com','TI1','00011','Bangalore','123','False','TI','2015-07-31 12:28:59','2015-07-31 12:28:59'),('arpit123@gmail.com','Mujahid','123','Bangalore','123','False','TI','2015-07-30 12:30:17','2015-07-30 12:30:17'),('HA@gmail.com','HA','12345','Bangalore','123','True','HA','2015-07-16 16:32:13','0001-01-01 00:00:00'),('hamidali483@gmail.com','Hamid Ali','1232222','483 Madina Nagar Indore','123','True','SC','2015-07-16 10:00:13','0001-01-01 00:00:00'),('M123@gmail.com','Mayank','1230123','483 Madina Nagar Indore','123','True','TI','2015-07-13 18:12:53','2015-07-13 18:12:53'),('maj@gmail.com','Majeda','123245','483 Madina Nagar Indore','123','False','TI','2015-07-31 12:12:54','2015-07-31 12:12:54'),('mujahidali0611@gmail.com','Mujahid','9893433962','483 Madina Nagar Indore','123','True','TI','2015-07-31 12:41:29','0001-01-01 00:00:00'),('sc22@gmail.com','SC22','00123','Bangalore','123','False','SC','2015-07-31 12:13:49','2015-07-31 12:13:49'),('sc232@gmail.com','SC22','0012333','Bangalore','123','False','SC','2015-07-31 12:16:06','2015-07-31 12:16:06'),('TI1@gmail.com','Arpit','123456123','Bangalore','123','True','TI','2015-07-16 15:08:33','0001-01-01 00:00:00'),('TI2@gmail.com','Shan','1230','Bangalore','123','True','TI',NULL,NULL),('TI3@gmail.com','Karan','12000','Bangalore','123','True','TI','2015-07-13 16:42:56','0001-01-01 00:00:00'),('TI4@gmail.com','Tanay','123100','Bangalore','123','True','TI','2015-07-13 17:47:02','0001-01-01 00:00:00');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-31 12:44:43
