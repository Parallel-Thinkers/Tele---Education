CREATE DATABASE  IF NOT EXISTS `TELE_EDU_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TELE_EDU_DB`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: TELE_EDU_DB
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
  CONSTRAINT `fk_ATTENDANCE_2` FOREIGN KEY (`S_ID`) REFERENCES `STUDENT` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATTENDANCE_1` FOREIGN KEY (`LECTURE_CALENDER_ID`) REFERENCES `LECTURE_CALENDER` (`LECTURE_CALENDER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `MESSAGE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BROADCAST_ID`),
  KEY `fk_BROADCAST_1_idx` (`MESSAGE_ID`),
  CONSTRAINT `fk_BROADCAST_1` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `MESSAGES` (`MESSAGES_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROADCAST`
--

LOCK TABLES `BROADCAST` WRITE;
/*!40000 ALTER TABLE `BROADCAST` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLASS`
--

LOCK TABLES `CLASS` WRITE;
/*!40000 ALTER TABLE `CLASS` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISSUES`
--

LOCK TABLES `ISSUES` WRITE;
/*!40000 ALTER TABLE `ISSUES` DISABLE KEYS */;
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
  `TAGS_ID` int(11) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEVEL1_TAG_ID`),
  KEY `fk_LEVEL1_TAG_1_idx` (`TAGS_ID`),
  CONSTRAINT `fk_LEVEL1_TAG_1` FOREIGN KEY (`TAGS_ID`) REFERENCES `TAGS` (`TAGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEVEL1_TAG`
--

LOCK TABLES `LEVEL1_TAG` WRITE;
/*!40000 ALTER TABLE `LEVEL1_TAG` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEVEL2_TAG`
--

LOCK TABLES `LEVEL2_TAG` WRITE;
/*!40000 ALTER TABLE `LEVEL2_TAG` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MARKS`
--

LOCK TABLES `MARKS` WRITE;
/*!40000 ALTER TABLE `MARKS` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NE`
--

LOCK TABLES `NE` WRITE;
/*!40000 ALTER TABLE `NE` DISABLE KEYS */;
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
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`),
  KEY `fk_PERSONAL_MESSAGE_1_idx` (`RECIVER_ID`),
  KEY `fk_PERSONAL_MESSAGE_2_idx` (`MESSAGE_ID`),
  CONSTRAINT `fk_PERSONAL_MESSAGE_1` FOREIGN KEY (`RECIVER_ID`) REFERENCES `TI` (`TI_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_MESSAGE_2` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `MESSAGES` (`MESSAGES_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL_MESSAGE`
--

LOCK TABLES `PERSONAL_MESSAGE` WRITE;
/*!40000 ALTER TABLE `PERSONAL_MESSAGE` DISABLE KEYS */;
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
  CONSTRAINT `fk_POST_6` FOREIGN KEY (`TI_ID`) REFERENCES `TI` (`TI_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_1` FOREIGN KEY (`TAG_ID`) REFERENCES `TAGS` (`TAGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_2` FOREIGN KEY (`SHC_ID`) REFERENCES `SCHOOL` (`SHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_3` FOREIGN KEY (`S_ID`) REFERENCES `STUDENT` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_4` FOREIGN KEY (`LEVEL1_TAG_ID`) REFERENCES `LEVEL1_TAG` (`LEVEL1_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_POST_5` FOREIGN KEY (`LEVEL2_TAG_ID`) REFERENCES `LEVEL2_TAG` (`LEVEL2_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `fk_SC_2` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SC_1` FOREIGN KEY (`SHC_ID`) REFERENCES `SCHOOL` (`SHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SC`
--

LOCK TABLES `SC` WRITE;
/*!40000 ALTER TABLE `SC` DISABLE KEYS */;
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
  CONSTRAINT `fk_SCHOOL_2` FOREIGN KEY (`NE_ID`) REFERENCES `NE` (`NE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SCHOOL_1` FOREIGN KEY (`TALUQ_ID`) REFERENCES `TALUQ` (`TALUQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHOOL`
--

LOCK TABLES `SCHOOL` WRITE;
/*!40000 ALTER TABLE `SCHOOL` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT`
--

LOCK TABLES `STUDENT` WRITE;
/*!40000 ALTER TABLE `STUDENT` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAGS`
--

LOCK TABLES `TAGS` WRITE;
/*!40000 ALTER TABLE `TAGS` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TALUQ`
--

LOCK TABLES `TALUQ` WRITE;
/*!40000 ALTER TABLE `TALUQ` DISABLE KEYS */;
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
  `TEST_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`TEST_ID`),
  KEY `fk_TEST_1_idx` (`CLASS_ID`),
  KEY `fk_TEST_2_idx` (`LEVEL2_TAGS_ID`),
  CONSTRAINT `fk_TEST_2` FOREIGN KEY (`LEVEL2_TAGS_ID`) REFERENCES `LEVEL2_TAG` (`LEVEL2_TAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TEST_1` FOREIGN KEY (`CLASS_ID`) REFERENCES `CLASS` (`CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST`
--

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
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
  CONSTRAINT `fk_TI_2` FOREIGN KEY (`TALUQ_ID`) REFERENCES `TALUQ` (`TALUQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TI_1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TI`
--

LOCK TABLES `TI` WRITE;
/*!40000 ALTER TABLE `TI` DISABLE KEYS */;
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
  `MOBILE` int(12) DEFAULT NULL,
  `ADDRESS` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `APPROVED` varchar(45) DEFAULT NULL,
  `ROLE` varchar(45) DEFAULT NULL,
  `LOGOUT_TIMESTAMP` datetime DEFAULT NULL,
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

-- Dump completed on 2015-06-17 19:06:12
