-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: motivation_assistant
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `clen_hierarhije`
--

DROP TABLE IF EXISTS `clen_hierarhije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clen_hierarhije` (
  `id_clena_hierarhije` int(11) NOT NULL AUTO_INCREMENT,
  `id_nadrejenega_clena_hierarhije` int(11) DEFAULT NULL,
  `ime_clena_hierarhije` varchar(100) DEFAULT NULL,
  `nadpomenka` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_clena_hierarhije`),
  KEY `FK_je_nadrejen` (`id_nadrejenega_clena_hierarhije`),
  CONSTRAINT `FK_je_nadrejen` FOREIGN KEY (`id_nadrejenega_clena_hierarhije`) REFERENCES `clen_hierarhije` (`id_clena_hierarhije`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clen_hierarhije`
--

LOCK TABLES `clen_hierarhije` WRITE;
/*!40000 ALTER TABLE `clen_hierarhije` DISABLE KEYS */;
INSERT INTO `clen_hierarhije` VALUES (1,20,'Strokovna služba',NULL),(3,1,'Glavna pisarna',NULL),(4,1,'Dekanat',NULL),(5,1,'Referat',NULL),(6,1,'Recepcija',NULL),(7,1,'Mednarodna dejavnost',NULL),(8,4,'Tajnik fakultete',NULL),(9,4,'Poslovni sekretar',NULL),(10,4,'Pomočnik tajnika za finančne in gospodarske zadeve',NULL),(11,4,'Samostojni strokovni delavec',NULL),(12,20,'Katedra',NULL),(13,12,'Katedra za ekonomiko in management javnega sektorja',NULL),(14,12,'Katedra za upravno-pravno področje',NULL),(15,12,'Katedra za organizacijo in informatiko',NULL),(16,12,'Zunanji sodelavci',NULL),(17,5,'Predstojnik',NULL),(18,5,'Samostojni strokovni delavec',NULL),(19,5,'Strokovni delavec',NULL),(20,NULL,'Zaposleni',NULL);
/*!40000 ALTER TABLE `clen_hierarhije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `je_nadrejena`
--

DROP TABLE IF EXISTS `je_nadrejena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `je_nadrejena` (
  `userid` int(10) unsigned NOT NULL,
  `userid_nadrejenega` int(10) unsigned NOT NULL,
  `id_clena_hierarhije` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`userid_nadrejenega`,`id_clena_hierarhije`),
  KEY `FK_glede_na` (`id_clena_hierarhije`),
  KEY `FK_nadrejenost` (`userid_nadrejenega`),
  CONSTRAINT `FK_glede_na` FOREIGN KEY (`id_clena_hierarhije`) REFERENCES `clen_hierarhije` (`id_clena_hierarhije`),
  CONSTRAINT `FK_nadrejenost` FOREIGN KEY (`userid_nadrejenega`) REFERENCES `oseba` (`userid`),
  CONSTRAINT `FK_podrejenost` FOREIGN KEY (`userid`) REFERENCES `oseba` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `je_nadrejena`
--

LOCK TABLES `je_nadrejena` WRITE;
/*!40000 ALTER TABLE `je_nadrejena` DISABLE KEYS */;
/*!40000 ALTER TABLE `je_nadrejena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `je_spodbudila`
--

DROP TABLE IF EXISTS `je_spodbudila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `je_spodbudila` (
  `userid_pobudnika` int(10) unsigned NOT NULL,
  `userid_spodbujene_osebe` int(10) unsigned NOT NULL,
  `id_zadolzitve` int(11) NOT NULL,
  PRIMARY KEY (`userid_pobudnika`,`userid_spodbujene_osebe`,`id_zadolzitve`),
  KEY `FK_je_spodbudila2` (`userid_spodbujene_osebe`,`id_zadolzitve`),
  CONSTRAINT `FK_je_spodbudila` FOREIGN KEY (`userid_pobudnika`) REFERENCES `oseba` (`userid`),
  CONSTRAINT `FK_je_spodbudila2` FOREIGN KEY (`userid_spodbujene_osebe`, `id_zadolzitve`) REFERENCES `zadolzitve` (`userid`, `id_zadolzitve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `je_spodbudila`
--

LOCK TABLES `je_spodbudila` WRITE;
/*!40000 ALTER TABLE `je_spodbudila` DISABLE KEYS */;
INSERT INTO `je_spodbudila` VALUES (8,7,4),(9,7,4),(3,22,3),(5,22,3),(6,22,3),(7,22,3),(8,22,3),(9,22,3),(10,22,3),(11,22,3),(12,22,3),(13,22,3),(14,22,3),(15,22,3),(3,24,1),(5,24,1),(11,24,1),(19,24,1),(20,24,1),(25,24,1),(4,24,2),(6,24,2),(14,24,2),(15,24,2),(16,24,2),(17,24,2),(18,24,2),(21,24,2),(22,24,2),(23,24,2);
/*!40000 ALTER TABLE `je_spodbudila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oseba`
--

DROP TABLE IF EXISTS `oseba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oseba` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  `ime` varchar(30) DEFAULT NULL,
  `priimek` varchar(30) DEFAULT NULL,
  `rojstvo` date DEFAULT NULL,
  `izobrazba` varchar(40) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `opis` text,
  `slika` varchar(300) DEFAULT '/assets/img/profile_pics/no-image.gif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `mail` (`email`),
  UNIQUE KEY `mail_2` (`email`),
  KEY `stari_kljuc` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oseba`
--

LOCK TABLES `oseba` WRITE;
/*!40000 ALTER TABLE `oseba` DISABLE KEYS */;
INSERT INTO `oseba` VALUES (23,'red. prof. dr.','Mirjana','','2015-09-01',NULL,'01 5805 500','','',NULL,NULL,'/assets/img/profile_pics/23.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(16,'izr. prof. dr.','Aleksander','Aristovnik','2015-09-01',NULL,'01 580 55 48','aleksander.aristovnik@fu.uni-l','',NULL,NULL,'/assets/img/profile_pics/16.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(4,'d.m. str. delavec','Anamarija','Leben','2015-09-01',NULL,NULL,'anamarija.leben@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/4.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(3,'mag.','Barbara','Leskovšek','2015-09-01',NULL,'01 580 55 25','barbara.leskovsek@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/3.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(21,'doc. dr.','Bojan','Peček','2015-09-01',NULL,'01 580 55 45','bojan.pecek@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/21.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(19,'doc. dr.','Gregor','Virant','2015-09-01',NULL,'01 580 55 62','gregor.virant@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/19.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(22,'izr. prof. dr.','Janez','Stare','2015-09-22',NULL,'01 580 55 72, 01 580','janez.stare@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/22.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(8,NULL,'Janja','Juršič','2015-09-01',NULL,'01 580 55 01','janja.jursic@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/8.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(5,NULL,'Jasna ','Lorger','2015-09-01',NULL,'01 580 54 26','jasna.lorger@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/5.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(12,NULL,'Katarina','Rihtaršič','2015-09-01',NULL,'01 580 55 01','katarina.rihtarsic@fu.uni-lj.s','',NULL,NULL,'/assets/img/profile_pics/12.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(25,'izr. prof. dr.','Ljupčo','Todorovski','2015-09-01',NULL,'01 580 55 46','ljupco.todorovski@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/25.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(15,'red. prof. dr.','Marko','Hočevar','2015-09-01',NULL,NULL,'marko.hocevar@ef.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/15.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(13,NULL,'Mateja','Setnikar','2015-09-01',NULL,'01 580 55 04','mateja.setnikar@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/13.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(11,NULL,'Metka','Pivk','2015-09-01',NULL,'01 580 55 01','metka.pivk@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/11.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(20,'red. prof. dr.','Mirko','Vintar','2015-09-01',NULL,'01 580 55 43','mirko.vintar@fu.uni-lj.si','$2y$10$WQJwIrE3uhcOqgL9Pn14M.UHjnquGKNyaIcpvpj.L.siUDnTclcEe','fd4WW0YkZ7jiUO992iwktt4jokdjqMpw2GNQwgAokfDytfOv3k1f5kG360LW',NULL,'/assets/img/profile_pics/20.jpg','2015-08-29 21:49:58','2015-09-05 01:13:19',NULL),(24,'doc. dr.','mitja','Dečman','2015-09-01','8. stopnja','01 580 55 53','mitja.decman@fu.uni-lj.si','$2y$10$RoLtoE4CPL06QJgqsLf5O.Gh/wwyIpwKb/ZUHkSYOSI2zvb9KyW12','3IwJwkhLUrDIp55pKrimRjR5QIGk6rHgLVwjtT3HPBhddGldk6zleHvQ7JPt','','/assets/img/profile_pics/24.jpg','2015-07-30 17:58:08','2015-09-24 09:16:16',NULL),(6,NULL,'Mojca','Robas','2015-09-01',NULL,'01 580 55 85','mojca.robas@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/6.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(7,NULL,'Nataša','Ferderber','2015-09-01',NULL,'01 580 55 01','natasa.ferderber@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/7.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(9,NULL,'Petra','Kisovec','2015-09-01',NULL,'01 580 55 04','petra.kisovec@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/9.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(18,'izr. prof. dr.','Polonca','Kovač','2015-09-01',NULL,'01 580 55 14','polona.kovac@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/18.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(17,'izr. prof. dr.','Primož','Pevcin','2015-09-01',NULL,'01 580 55 84','primoz.pevcin@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/17.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(10,NULL,'','Krivec','2015-09-01',NULL,'01 580 55 01','romana.krivec@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/10.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(14,'red. prof. dr. ','Srečko','Devjak','2015-09-01','dr.','01 580 55 22','srecko.devjak@fu.uni-lj.si','',NULL,NULL,'/assets/img/profile_pics/14.jpg','2015-07-30 17:58:08','2015-08-30 17:58:08',NULL),(2,'dipl. inž. Upravne informatike','vid','Mahovič','1993-01-09','univerzitetna (5. stopnja)','0401234561','vid.mahovic@gmail.com','$2y$10$O.Gx.RxRqcAkAP21YPdZzu8bHcM38cGvnvhcW7RMjo.6LI9SWOn9O','ujGlgItHfsuzP3GTkDpKRR41yV3S28yb20RrB1cFfW1wdiXcDUSu2ziIa8oL','V organizaciji počnem:\r\n- SQL\r\n- Laravel\r\n- PHP\r\n- Artisan\r\n- Blade','/assets/img/profile_pics/2.jpg','2015-07-30 17:58:08','2015-09-24 12:24:25',NULL);
/*!40000 ALTER TABLE `oseba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_blobs`
--

DROP TABLE IF EXISTS `qa_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_blobs`
--

LOCK TABLES `qa_blobs` WRITE;
/*!40000 ALTER TABLE `qa_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cache`
--

DROP TABLE IF EXISTS `qa_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cache`
--

LOCK TABLES `qa_cache` WRITE;
/*!40000 ALTER TABLE `qa_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categories`
--

DROP TABLE IF EXISTS `qa_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categories`
--

LOCK TABLES `qa_categories` WRITE;
/*!40000 ALTER TABLE `qa_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categorymetas`
--

DROP TABLE IF EXISTS `qa_categorymetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`),
  CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categorymetas`
--

LOCK TABLES `qa_categorymetas` WRITE;
/*!40000 ALTER TABLE `qa_categorymetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categorymetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_contentwords`
--

DROP TABLE IF EXISTS `qa_contentwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_contentwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_contentwords`
--

LOCK TABLES `qa_contentwords` WRITE;
/*!40000 ALTER TABLE `qa_contentwords` DISABLE KEYS */;
INSERT INTO `qa_contentwords` VALUES (1,2,1,'Q',1),(2,8,1,'Q',2),(2,9,1,'Q',2),(2,10,1,'Q',2),(2,7,1,'Q',2),(2,11,1,'Q',2),(2,12,1,'Q',2),(5,22,1,'Q',5),(6,23,1,'A',5),(6,24,1,'A',5),(6,25,1,'A',5),(6,26,1,'A',5),(6,27,1,'A',5),(6,28,1,'A',5),(7,31,1,'Q',7),(7,32,1,'Q',7),(7,33,1,'Q',7),(7,34,1,'Q',7),(7,35,1,'Q',7),(7,36,1,'Q',7),(7,37,1,'Q',7),(7,38,1,'Q',7),(8,16,1,'Q',8),(8,45,1,'Q',8),(8,18,1,'Q',8),(8,33,1,'Q',8),(8,34,1,'Q',8),(8,46,1,'Q',8),(8,47,1,'Q',8),(8,48,1,'Q',8),(10,55,1,'Q',10),(10,56,1,'Q',10),(10,32,1,'Q',10),(10,57,1,'Q',10),(10,58,1,'Q',10),(10,59,1,'Q',10),(10,60,1,'Q',10),(10,61,1,'Q',10),(10,62,1,'Q',10),(10,63,1,'Q',10),(10,13,1,'Q',10),(10,64,1,'Q',10),(10,65,1,'Q',10),(10,34,1,'Q',10),(10,66,1,'Q',10),(10,67,1,'Q',10),(10,18,1,'Q',10),(10,68,1,'Q',10),(10,69,1,'Q',10),(10,70,1,'Q',10),(10,71,1,'Q',10),(10,72,1,'Q',10),(10,73,1,'Q',10),(10,74,1,'Q',10),(10,75,1,'Q',10),(52,84,1,'Q',52),(64,85,1,'NOTE',52),(66,88,1,'Q',66),(66,89,1,'Q',66),(66,90,1,'Q',66),(66,91,1,'Q',66),(66,56,1,'Q',66),(66,55,1,'Q',66),(66,13,1,'Q',66),(66,92,1,'Q',66),(66,86,1,'Q',66),(66,93,1,'Q',66),(66,94,1,'Q',66),(66,95,1,'Q',66),(66,96,1,'Q',66),(66,16,1,'Q',66),(67,99,1,'Q',67),(68,101,1,'Q',68),(69,103,1,'Q',69),(70,105,1,'Q',70),(71,107,1,'Q',71),(74,109,1,'Q',74),(78,111,1,'Q',78),(96,55,1,'Q',96),(96,56,1,'Q',96),(96,18,1,'Q',96),(96,58,1,'Q',96),(96,112,1,'Q',96),(96,113,1,'Q',96),(96,32,1,'Q',96),(96,114,1,'Q',96),(96,115,1,'Q',96),(97,19,1,'Q',97),(97,56,1,'Q',97),(97,91,1,'Q',97),(97,118,1,'Q',97),(97,55,1,'Q',97),(97,13,1,'Q',97),(97,119,1,'Q',97),(97,115,1,'Q',97),(100,121,1,'Q',100),(106,123,1,'Q',106),(108,127,1,'Q',108),(108,55,1,'Q',108),(108,56,1,'Q',108),(108,128,1,'Q',108),(108,58,1,'Q',108),(108,129,1,'Q',108),(108,130,1,'Q',108),(108,131,1,'Q',108),(108,86,1,'Q',108),(108,132,1,'Q',108),(108,126,1,'Q',108),(110,55,1,'Q',110),(110,56,1,'Q',110),(110,32,1,'Q',110),(110,58,1,'Q',110),(110,133,1,'Q',110),(110,134,1,'Q',110),(112,44,1,'C',110),(112,135,1,'C',110),(112,136,1,'C',110);
/*!40000 ALTER TABLE `qa_contentwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cookies`
--

DROP TABLE IF EXISTS `qa_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cookies`
--

LOCK TABLES `qa_cookies` WRITE;
/*!40000 ALTER TABLE `qa_cookies` DISABLE KEYS */;
INSERT INTO `qa_cookies` VALUES (14861790931607580270,'2015-04-20 20:12:00',2130706433,'2015-05-05 19:20:42',2130706433);
/*!40000 ALTER TABLE `qa_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_iplimits`
--

DROP TABLE IF EXISTS `qa_iplimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_iplimits` (
  `ip` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_iplimits`
--

LOCK TABLES `qa_iplimits` WRITE;
/*!40000 ALTER TABLE `qa_iplimits` DISABLE KEYS */;
INSERT INTO `qa_iplimits` VALUES (2130706433,'A',400345,1),(2130706433,'C',400868,1),(2130706433,'Q',400860,1),(2130706433,'V',400419,5);
/*!40000 ALTER TABLE `qa_iplimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_options`
--

DROP TABLE IF EXISTS `qa_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_options`
--

LOCK TABLES `qa_options` WRITE;
/*!40000 ALTER TABLE `qa_options` DISABLE KEYS */;
INSERT INTO `qa_options` VALUES ('allow_close_questions','1'),('allow_multi_answers','1'),('allow_private_messages','1'),('allow_self_answer','1'),('avatar_message_list_size','20'),('avatar_q_list_size','0'),('avatar_q_page_a_size','40'),('avatar_q_page_c_size','20'),('avatar_q_page_q_size','50'),('avatar_users_size','30'),('block_bad_words',''),('block_ips_write',''),('cache_acount','6'),('cache_ccount','2'),('cache_flaggedcount',''),('cache_qcount','12'),('cache_queuedcount',''),('cache_tagcount','6'),('cache_unaqcount','10'),('cache_unselqcount','12'),('cache_unupaqcount','12'),('cache_userpointscount','3'),('captcha_module','reCAPTCHA'),('captcha_on_anon_post','1'),('captcha_on_unconfirmed','0'),('columns_tags','3'),('columns_users','2'),('comment_on_as','1'),('comment_on_qs','0'),('confirm_user_emails','1'),('custom_answer',''),('custom_ask',''),('custom_comment',''),('custom_footer','<h1>asdasddadsa</h1>'),('custom_header',''),('custom_home_content',''),('custom_home_heading',''),('custom_in_head','<p>asdasdasda</p>'),('custom_sidebar','Forum Motivation Assistant je forum, kjer lahko postavljate vprašanja, namenjena sodelavcem, ti pa na njih odgovorijo v najkrašem možnem času.'),('custom_sidepanel',''),('db_version','58'),('default_avatar_show',''),('do_ask_check_qs','0'),('do_close_on_select',''),('do_complete_tags','1'),('do_count_q_views','1'),('do_example_tags','1'),('editor_for_as','WYSIWYG Editor'),('editor_for_cs',''),('editor_for_qs','WYSIWYG Editor'),('event_logger_to_database',''),('event_logger_to_files',''),('extra_field_active',''),('extra_field_display',''),('extra_field_label',''),('extra_field_prompt',''),('feedback_enabled','1'),('feed_for_activity','1'),('feed_for_hot',''),('feed_for_qa','1'),('feed_for_questions','1'),('feed_for_tag_qs',''),('feed_for_unanswered','1'),('feed_full_text','1'),('feed_number_items','50'),('feed_per_category','1'),('flagging_hide_after','5'),('flagging_of_posts','1'),('flatbox_author','Q2A Market'),('flatbox_author_url','http://www.q2amarket.com'),('flatbox_version','1.0.1-beta'),('follow_on_as','1'),('form_security_salt','tjlpj5gam9l2yaov0gds69q53hiyu6ta'),('home_description',''),('hot_weight_answers','100'),('hot_weight_a_age','100'),('hot_weight_q_age','100'),('hot_weight_views','100'),('hot_weight_votes','100'),('it_custom_css',''),('it_custom_style_created',''),('it_enable_except',''),('it_excerpt_field_enable',''),('it_favicon_url',''),('it_featured_url_abs',''),('it_feature_img_enable',''),('it_infinite_scroll_auto_enable',''),('it_infinite_scroll_qa_enable',''),('it_layout_choose',''),('it_layout_lists',''),('it_layout_masonry_list',''),('it_nav_fixed',''),('it_nav_type',''),('it_new_cat_icon',''),('it_typo_googlefonts',''),('links_in_new_window',''),('logo_height',''),('logo_show','0'),('logo_url',''),('logo_width',''),('match_ask_check_qs','3'),('match_example_tags','3'),('max_len_q_title','120'),('max_num_q_tags','5'),('max_rate_ip_as','50'),('max_rate_ip_cs','40'),('max_rate_ip_qs','20'),('max_rate_ip_votes','600'),('max_rate_user_as','25'),('max_rate_user_cs','20'),('max_rate_user_qs','10'),('max_rate_user_votes','300'),('max_store_user_updates','50'),('min_len_a_content','12'),('min_len_c_content','12'),('min_len_q_content','0'),('min_len_q_title','12'),('min_num_q_tags','0'),('moderate_anon_post',''),('moderate_by_points',''),('moderate_edited_again',''),('moderate_unconfirmed',''),('moderate_users',''),('mouseover_content_on',''),('nav_activity',''),('nav_ask','1'),('nav_categories',''),('nav_home',''),('nav_hot',''),('nav_qa_is_home',''),('nav_questions','1'),('nav_tags','1'),('nav_unanswered','1'),('nav_users','1'),('neat_urls','5'),('notice_visitor',''),('notify_admin_q_post',''),('notify_users_default','1'),('pages_prev_next','3'),('page_size_activity','20'),('page_size_ask_check_qs','5'),('page_size_ask_tags','5'),('page_size_home','20'),('page_size_qs','20'),('page_size_q_as','10'),('page_size_tags','30'),('page_size_tag_qs','20'),('page_size_una_qs','20'),('page_size_users','30'),('permit_anon_view_ips','70'),('permit_close_q','70'),('permit_delete_hidden','40'),('permit_edit_a','100'),('permit_edit_c','70'),('permit_edit_q','70'),('permit_edit_silent','40'),('permit_flag','110'),('permit_hide_show','70'),('permit_moderate','100'),('permit_post_a','150'),('permit_post_c','150'),('permit_post_q','150'),('permit_retag_cat','70'),('permit_select_a','100'),('permit_view_q_page','150'),('permit_view_voters_flaggers','20'),('permit_vote_a','120'),('permit_vote_down','120'),('permit_vote_q','120'),('points_a_selected','30'),('points_a_voted_max_gain','20'),('points_a_voted_max_loss','5'),('points_base','100'),('points_multiple','10'),('points_per_a_voted',''),('points_per_a_voted_down','2'),('points_per_a_voted_up','2'),('points_per_q_voted',''),('points_per_q_voted_down','1'),('points_per_q_voted_up','1'),('points_post_a','4'),('points_post_q','2'),('points_q_voted_max_gain','10'),('points_q_voted_max_loss','3'),('points_select_a','3'),('points_to_titles',''),('points_vote_down_a','1'),('points_vote_down_q','1'),('points_vote_on_a',''),('points_vote_on_q',''),('points_vote_up_a','1'),('points_vote_up_q','1'),('qam_flatbox_above_footer_custom_content',''),('qam_flatbox_ask_search_box_color',''),('qam_flatbox_facebook','https://www.facebook.com/q2amarket'),('qam_flatbox_fb_height','250'),('qam_flatbox_fixed_topbar',''),('qam_flatbox_footer_advert_code','Add your custom <code>HTML</code> here'),('qam_flatbox_github','https://github.com/q2amarket'),('qam_flatbox_gplus','https://plus.google.com/+Q2amarket/about'),('qam_flatbox_header_custom_content',''),('qam_flatbox_icons_info','1'),('qam_flatbox_linkedin','https://www.linkedin.com/in/q2amarket'),('qam_flatbox_pinterest','http://www.pinterest.com/q2amarket/'),('qam_flatbox_twitter','https://twitter.com/Q2AMarket'),('qam_flatbox_twitter_height','250'),('qam_flatbox_twitter_id','Q2AMarket'),('qam_flatbox_twitter_widget_id','362121220734464000'),('qam_flatbox_vimeo','https://vimeo.com/q2amarket'),('qam_flatbox_welcome_widget_color',''),('qam_flatbox_wordpress','http://www.pixelngrain.com'),('qam_flatbox_youtube','https://www.youtube.com/user/q2amarket'),('q_urls_remove_accents',''),('q_urls_title_length','50'),('recaptcha_private_key',''),('recaptcha_public_key',''),('show_a_c_links','1'),('show_a_form_immediate','if_no_as'),('show_custom_answer',''),('show_custom_ask',''),('show_custom_comment',''),('show_custom_footer','0'),('show_custom_header','0'),('show_custom_home','0'),('show_custom_in_head','0'),('show_custom_sidebar','1'),('show_custom_sidepanel','0'),('show_c_reply_buttons','1'),('show_fewer_cs_count','5'),('show_fewer_cs_from','10'),('show_full_date_days','7'),('show_home_description','0'),('show_message_history','1'),('show_notice_visitor',''),('show_post_update_meta','1'),('show_selected_first','1'),('show_url_links','1'),('show_user_points','1'),('show_user_titles','1'),('show_view_counts',''),('show_view_count_q_page',''),('show_when_created','1'),('site_language',''),('site_maintenance','0'),('site_text_direction','ltr'),('site_theme','FlatBox'),('site_theme_mobile','Classic'),('site_title',''),('site_url','http://localhost/question2answer/'),('sort_answers_by','created'),('tags_or_categories','tc'),('tag_separator_comma',''),('votes_separated',''),('voting_on_as','1'),('voting_on_qs','1'),('voting_on_q_page_only',''),('wysiwyg_editor_upload_images','');
/*!40000 ALTER TABLE `qa_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_pages`
--

DROP TABLE IF EXISTS `qa_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_pages` (
  `pageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `position` (`position`),
  KEY `tags` (`tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_pages`
--

LOCK TABLES `qa_pages` WRITE;
/*!40000 ALTER TABLE `qa_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_postmetas`
--

DROP TABLE IF EXISTS `qa_postmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_postmetas` (
  `postid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`),
  CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_postmetas`
--

LOCK TABLES `qa_postmetas` WRITE;
/*!40000 ALTER TABLE `qa_postmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_postmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posts`
--

DROP TABLE IF EXISTS `qa_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posts` (
  `postid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `catidpath1` int(10) unsigned DEFAULT NULL,
  `catidpath2` int(10) unsigned DEFAULT NULL,
  `catidpath3` int(10) unsigned DEFAULT NULL,
  `acount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `selchildid` int(10) unsigned DEFAULT NULL,
  `closedbyid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `lastip` int(10) unsigned DEFAULT NULL,
  `upvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` int(10) unsigned DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`),
  CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posts`
--

LOCK TABLES `qa_posts` WRITE;
/*!40000 ALTER TABLE `qa_posts` DISABLE KEYS */;
INSERT INTO `qa_posts` VALUES (1,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,5,14861790931607580270,2130706433,NULL,NULL,0,0,0,2130706433,1,33451700000,0,'','2015-07-04 20:12:00',NULL,NULL,'Kako narediti potni nalog?','Lep pozdrav. Ker sem nov v službi in ne vem, kako se izdela potni nalog, bi nekoga prosil, če mi lahko pomaga. Vnaprej hvala :)','','',NULL),(2,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,20,14861790931607580270,2130706433,NULL,NULL,0,0,0,2130706433,1,33552700000,0,'','2015-07-09 16:23:48',NULL,NULL,'Kje so svinčniki?','Zmanjkalo mi je svinčnikov in nekaterih drugih pisal. Na koga se lahko ozrem, da mi jih priskrbi?','help','',NULL),(5,'Q',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,14861790931607580270,2130706433,NULL,NULL,0,0,0,2130706433,1,33793500000,0,'','2015-07-06 19:20:41',NULL,NULL,'Novi stoli','Pozdravljeni. Ker je moj pisalni stol že popolnoma uničen (in sklepam, da drugi niso nič boljši), predlagam, da se čim prej zamenja pisalne stole. Kdor se strinja, naj upvote-a mojo objavo. Mogoče bomo pa le koga prepričali!','suggest','',NULL),(7,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,2,2130706433,0,0,0,2130706433,1,33951800000,0,'','2015-07-01 18:40:02','2015-07-01 18:40:30','T','Preverjanje tagov','Za hall of fame ta mesec predlagam Miho Ščurka, saj si je (vsaj zame) vzel ogromno časa, da mi je pomagal pri težavah, ki sem jih imel. Hvala Miha :)','predlog,hof,20',NULL,NULL),(8,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,2130706433,1,34310200000,0,'','2015-07-08 12:31:47',NULL,NULL,'Kava?','Danes bi se lahko dobili na kavi. Kaj pravite?','suggest',NULL,'@'),(9,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,NULL,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-01 05:01:34','2015-09-01 05:01:34',NULL,'Kdaj bo sonce?','Zanima me, kdaj bo konno posijalo sonce...','help',NULL,NULL),(10,'Q',NULL,NULL,NULL,NULL,NULL,5,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,1,0,1,2130706433,1,35830200000,0,'','2015-09-03 02:02:13',NULL,NULL,'Kdaj bo diplomska naloga pregledana','Zanima me, kako hiter je tehnični pregled diplomskih nalog in ali bom uspel v roku zagovarjati, če diplomsko nalogo oddam jutri.\n\n \n\n \n\nHvala za pomoč, Vid','help',NULL,NULL),(48,'C',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-03 20:55:55',NULL,NULL,NULL,'Vi niste normalni.... to ni forum za bedarije!',NULL,NULL,NULL),(54,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 02:44:51',NULL,NULL,NULL,'Zato',NULL,NULL,NULL),(55,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 02:45:08',NULL,NULL,NULL,'Zato',NULL,NULL,NULL),(56,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 02:46:10',NULL,NULL,NULL,'sdasdadas',NULL,NULL,NULL),(57,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 02:46:37',NULL,NULL,NULL,'fsfdfdsfsd',NULL,NULL,NULL),(58,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 02:56:59',NULL,NULL,NULL,'Zato',NULL,NULL,NULL),(59,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 02:59:40',NULL,NULL,NULL,'aaaaaaaaaaaaaa',NULL,NULL,NULL),(60,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 03:00:31',NULL,NULL,NULL,'aaaaaaaaaaaaaaaaa',NULL,NULL,NULL),(61,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 03:02:10',NULL,NULL,NULL,'Zato',NULL,NULL,NULL),(62,'NOTE',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-04 03:02:58',NULL,NULL,NULL,'Zato',NULL,NULL,NULL),(66,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,20,NULL,2130706433,NULL,NULL,1,0,1,2130706433,1,35875000000,0,'','2015-09-06 05:20:46',NULL,NULL,'Kako je kaj pri vas?','Testiram taost notificatione pa me zanima, ali delujejo pri uporabniku vid@aaa.com? Upam, da...','test',NULL,NULL),(96,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,2130706433,1,36153600000,0,'','2015-09-24 04:47:11',NULL,NULL,'Je kdo doma?','Zanima me, če je kdo doma.... Kako so toasti?','',NULL,NULL),(97,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,2130706433,1,36153600000,0,'','2015-09-24 04:50:08',NULL,NULL,'Je še enkrat kdo doma?','Sedaj me pa res zanima, ali delajo toasti...','',NULL,NULL),(108,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,24,NULL,2130706433,NULL,NULL,0,0,0,2130706433,1,36158200000,0,'','2015-09-24 11:11:42',NULL,NULL,'Kako se ovcenjuje izpite pri ISVU','Spoštovani,\n\nZanima me, kakšen je kriterij ocenjevanja izpitov pri predmetu ISVU.','',NULL,NULL),(110,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,24,NULL,2130706433,NULL,NULL,0,0,0,2130706433,1,36160600000,0,'','2015-09-24 14:27:27',NULL,NULL,'kako je na DSU','Zanima me, kako je na DSU...','',NULL,'@'),(111,'A',110,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-24 14:27:53',NULL,NULL,NULL,'Vse štima......',NULL,NULL,'@'),(112,'C',111,NULL,NULL,NULL,NULL,0,0,NULL,NULL,24,NULL,2130706433,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2015-09-24 22:46:44',NULL,NULL,NULL,'a ma nemoj...........',NULL,NULL,NULL);
/*!40000 ALTER TABLE `qa_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posttags`
--

DROP TABLE IF EXISTS `qa_posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posttags` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`),
  CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posttags`
--

LOCK TABLES `qa_posttags` WRITE;
/*!40000 ALTER TABLE `qa_posttags` DISABLE KEYS */;
INSERT INTO `qa_posttags` VALUES (7,39,'2015-05-19 18:40:02'),(7,40,'2015-05-19 18:40:02'),(7,41,'2015-05-19 18:40:02'),(8,49,'2015-06-09 12:31:47'),(10,76,'2015-09-03 02:02:13'),(66,97,'2015-09-06 05:20:46');
/*!40000 ALTER TABLE `qa_posttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_sharedevents`
--

DROP TABLE IF EXISTS `qa_sharedevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_sharedevents`
--

LOCK TABLES `qa_sharedevents` WRITE;
/*!40000 ALTER TABLE `qa_sharedevents` DISABLE KEYS */;
INSERT INTO `qa_sharedevents` VALUES ('Q',1,1,1,NULL,NULL,'2015-04-20 20:12:00'),('Q',2,2,2,NULL,NULL,'2015-04-26 16:23:48'),('Q',3,3,3,NULL,NULL,'2015-05-04 11:21:45'),('Q',4,4,4,NULL,NULL,'2015-05-04 11:24:28'),('Q',5,5,5,NULL,NULL,'2015-05-05 19:20:42'),('Q',5,5,6,NULL,2,'2015-05-13 13:52:29'),('Q',7,7,7,NULL,2,'2015-05-19 18:40:02'),('Q',7,7,7,'T',2,'2015-05-19 18:40:30'),('T',41,7,7,'T',2,'2015-05-19 18:40:30'),('T',40,7,7,'T',2,'2015-05-19 18:40:30'),('T',39,7,7,'T',2,'2015-05-19 18:40:30'),('Q',8,8,8,NULL,2,'2015-06-09 12:31:47'),('T',49,8,8,NULL,2,'2015-06-09 12:31:47'),('Q',10,10,10,NULL,2,'2015-09-03 02:02:13'),('T',76,10,10,NULL,2,'2015-09-03 02:02:13'),('Q',10,10,15,NULL,20,'2015-09-03 03:37:50'),('Q',52,52,52,NULL,20,'2015-09-04 02:29:55'),('Q',52,52,52,'E',20,'2015-09-04 02:30:25'),('Q',52,52,52,'C',2,'2015-09-04 03:05:13'),('Q',52,52,52,'C',2,'2015-09-04 03:06:14'),('Q',52,52,52,'C',2,'2015-09-04 03:06:27'),('Q',66,66,66,NULL,20,'2015-09-06 05:20:46'),('T',97,66,66,NULL,20,'2015-09-06 05:20:46'),('Q',67,67,67,NULL,20,'2015-09-06 05:22:29'),('Q',68,68,68,NULL,20,'2015-09-06 05:25:00'),('Q',69,69,69,NULL,20,'2015-09-06 05:26:21'),('Q',70,70,70,NULL,20,'2015-09-06 05:27:44'),('Q',71,71,71,NULL,20,'2015-09-06 05:28:03'),('Q',74,74,74,NULL,2,'2015-09-06 05:36:56'),('Q',78,78,78,NULL,20,'2015-09-14 18:11:17'),('Q',96,96,96,NULL,2,'2015-09-24 04:47:11'),('Q',97,97,97,NULL,2,'2015-09-24 04:50:08'),('Q',100,100,100,NULL,2,'2015-09-24 05:15:12'),('Q',106,106,106,NULL,24,'2015-09-24 05:44:30'),('Q',108,108,108,NULL,24,'2015-09-24 11:11:42'),('Q',110,110,110,NULL,24,'2015-09-24 14:27:28'),('Q',110,110,112,'N',24,'2015-09-24 22:46:44');
/*!40000 ALTER TABLE `qa_sharedevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagmetas`
--

DROP TABLE IF EXISTS `qa_tagmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagmetas`
--

LOCK TABLES `qa_tagmetas` WRITE;
/*!40000 ALTER TABLE `qa_tagmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagwords`
--

DROP TABLE IF EXISTS `qa_tagwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagwords`
--

LOCK TABLES `qa_tagwords` WRITE;
/*!40000 ALTER TABLE `qa_tagwords` DISABLE KEYS */;
INSERT INTO `qa_tagwords` VALUES (7,39),(7,40),(7,41),(8,49),(10,76),(66,97);
/*!40000 ALTER TABLE `qa_tagwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_titlewords`
--

DROP TABLE IF EXISTS `qa_titlewords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_titlewords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_titlewords`
--

LOCK TABLES `qa_titlewords` WRITE;
/*!40000 ALTER TABLE `qa_titlewords` DISABLE KEYS */;
INSERT INTO `qa_titlewords` VALUES (1,1),(2,3),(2,4),(2,5),(2,6),(2,7),(5,21),(7,29),(7,30),(8,29),(8,42),(8,43),(8,44),(10,50),(10,51),(10,52),(10,53),(10,54),(52,82),(66,32),(66,58),(66,23),(66,86),(66,87),(67,98),(68,100),(69,102),(70,104),(71,106),(74,108),(78,110),(96,58),(96,112),(96,113),(97,58),(97,116),(97,117),(97,112),(97,113),(100,120),(106,122),(108,32),(108,33),(108,124),(108,125),(108,86),(108,126),(110,32),(110,58),(110,133),(110,134);
/*!40000 ALTER TABLE `qa_titlewords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userevents`
--

DROP TABLE IF EXISTS `qa_userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userevents` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userevents`
--

LOCK TABLES `qa_userevents` WRITE;
/*!40000 ALTER TABLE `qa_userevents` DISABLE KEYS */;
INSERT INTO `qa_userevents` VALUES (2,'-',0,10,15,NULL,20,'2015-09-03 03:37:50'),(20,'-',0,52,52,'C',2,'2015-09-04 03:05:13'),(20,'-',0,52,52,'C',2,'2015-09-04 03:06:14'),(20,'-',0,52,52,'C',2,'2015-09-04 03:06:27'),(2,'-',0,110,112,'N',24,'2015-09-24 22:46:44');
/*!40000 ALTER TABLE `qa_userevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfavorites`
--

DROP TABLE IF EXISTS `qa_userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userfavorites` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `nouserevents` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfavorites`
--

LOCK TABLES `qa_userfavorites` WRITE;
/*!40000 ALTER TABLE `qa_userfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userfavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlevels`
--

DROP TABLE IF EXISTS `qa_userlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlevels` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  KEY `entitytype` (`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlevels`
--

LOCK TABLES `qa_userlevels` WRITE;
/*!40000 ALTER TABLE `qa_userlevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlimits`
--

DROP TABLE IF EXISTS `qa_userlimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlimits` (
  `userid` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlimits`
--

LOCK TABLES `qa_userlimits` WRITE;
/*!40000 ALTER TABLE `qa_userlimits` DISABLE KEYS */;
INSERT INTO `qa_userlimits` VALUES (2,'A',397643,1),(2,'Q',400851,1),(2,'V',400419,4),(20,'A',400345,1),(20,'Q',400624,1),(20,'V',400419,1),(24,'C',400868,1),(24,'Q',400860,1);
/*!40000 ALTER TABLE `qa_userlimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usermetas`
--

DROP TABLE IF EXISTS `qa_usermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usermetas` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usermetas`
--

LOCK TABLES `qa_usermetas` WRITE;
/*!40000 ALTER TABLE `qa_usermetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usernotices`
--

DROP TABLE IF EXISTS `qa_usernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usernotices`
--

LOCK TABLES `qa_usernotices` WRITE;
/*!40000 ALTER TABLE `qa_usernotices` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usernotices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userpoints`
--

DROP TABLE IF EXISTS `qa_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userpoints` (
  `userid` int(10) unsigned NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userpoints`
--

LOCK TABLES `qa_userpoints` WRITE;
/*!40000 ALTER TABLE `qa_userpoints` DISABLE KEYS */;
INSERT INTO `qa_userpoints` VALUES (2,370,9,1,0,0,0,4,0,0,0,1,0,2,1,0),(20,570,10,5,0,0,0,2,1,0,0,4,0,4,0,0),(24,140,2,0,1,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `qa_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_uservotes`
--

DROP TABLE IF EXISTS `qa_uservotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_uservotes` (
  `postid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`),
  CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_uservotes`
--

LOCK TABLES `qa_uservotes` WRITE;
/*!40000 ALTER TABLE `qa_uservotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_uservotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_widgets`
--

DROP TABLE IF EXISTS `qa_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_widgets`
--

LOCK TABLES `qa_widgets` WRITE;
/*!40000 ALTER TABLE `qa_widgets` DISABLE KEYS */;
INSERT INTO `qa_widgets` VALUES (1,'SH',1,'qa,activity,hot,unanswered','Activity Count');
/*!40000 ALTER TABLE `qa_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_words`
--

DROP TABLE IF EXISTS `qa_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_words` (
  `wordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) unsigned NOT NULL DEFAULT '0',
  `contentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_words`
--

LOCK TABLES `qa_words` WRITE;
/*!40000 ALTER TABLE `qa_words` DISABLE KEYS */;
INSERT INTO `qa_words` VALUES (1,'ssssssssssssssssssss',1,0,0,0),(2,'dsdasdasdasdsad',0,1,0,0),(3,'fsdafdffds',1,0,0,0),(4,'af',1,0,0,0),(5,'dsa',1,0,0,0),(6,'fs',1,0,0,0),(7,'fsd',1,1,0,0),(8,'fdasfsadf',0,1,0,0),(9,'asdf',0,1,0,0),(10,'sd',0,1,0,0),(11,'fsda',0,1,0,0),(12,'f',0,1,0,0),(13,'ali',2,3,0,0),(14,'$_session',2,1,0,0),(15,'deluje',2,1,0,0),(16,'da',0,2,0,0),(17,'vidimo',0,1,0,0),(18,'če',0,3,0,0),(19,'sedaj',1,1,0,0),(20,'sdasdasd',0,1,0,0),(21,'sdsdsadasasdsadsadad',1,0,0,0),(22,'dasdsadsadasdasdasdasdasdasdasdsa',0,1,0,0),(23,'kaj',1,1,0,0),(24,'si',0,1,0,0),(25,'hotel',0,1,0,0),(26,'s',0,1,0,0),(27,'tem',0,1,0,0),(28,'povedati',0,1,0,0),(29,'preverjanje',2,0,0,0),(30,'tagov',1,0,0,0),(31,'preverjam',0,1,0,0),(32,'kako',3,4,0,0),(33,'se',1,2,0,0),(34,'v',0,3,0,0),(35,'bazo',0,1,0,0),(36,'zapisujejo',0,1,0,0),(37,'tag',0,1,0,0),(38,'i',0,1,0,0),(39,'predlog',0,0,1,1),(40,'hof',0,0,1,1),(41,'20',0,0,1,1),(42,'user',1,0,0,0),(43,'log',1,0,0,0),(44,'a',1,1,0,0),(45,'pogledamo',0,1,0,0),(46,'user_log',0,1,0,0),(47,'zapiše',0,1,0,0),(48,'postid',0,1,0,0),(49,'suggest',0,0,1,1),(50,'kdaj',1,0,0,0),(51,'bo',1,0,0,0),(52,'diplomska',1,0,0,0),(53,'naloga',1,0,0,0),(54,'pregledana',1,0,0,0),(55,'zanima',0,6,0,0),(56,'me',0,6,0,0),(57,'hiter',0,1,0,0),(58,'je',4,4,0,0),(59,'tehnični',0,1,0,0),(60,'pregled',0,1,0,0),(61,'diplomskih',0,1,0,0),(62,'nalog',0,1,0,0),(63,'in',0,1,0,0),(64,'bom',0,1,0,0),(65,'uspel',0,1,0,0),(66,'roku',0,1,0,0),(67,'zagovarjati',0,1,0,0),(68,'diplomsko',0,1,0,0),(69,'nalogo',0,1,0,0),(70,'oddam',0,1,0,0),(71,'jutri',0,1,0,0),(72,'hvala',0,1,0,0),(73,'za',0,1,0,0),(74,'pomoč',0,1,0,0),(75,'vid',0,1,0,0),(76,'help',0,0,1,1),(77,'boooo',0,1,0,0),(78,'ne',0,1,0,0),(79,'vem',0,1,0,0),(80,'ampak',0,1,0,0),(81,'aaa',0,1,0,0),(82,'asfdasdasdsadadadadadasdad',1,0,0,0),(83,'hfdgdfgdfgfdgdfgdfgdfgdfgdfgdfgdfgdfg',0,0,0,0),(84,'hfdgdfgdfgfdgdfgdfgdfgdfgdfgdfgdfgdfgdddd',0,1,0,0),(85,'zato',0,1,0,0),(86,'pri',2,2,0,0),(87,'vas',1,0,0,0),(88,'testiram',0,1,0,0),(89,'taost',0,1,0,0),(90,'notificatione',0,1,0,0),(91,'pa',0,2,0,0),(92,'delujejo',0,1,0,0),(93,'uporabniku',0,1,0,0),(94,'vid@aaa',0,1,0,0),(95,'com',0,1,0,0),(96,'upam',0,1,0,0),(97,'test',0,0,1,1),(98,'sdafasdsadadsadasd',1,0,0,0),(99,'sadasdsadasdsadasdsadasdsadsadsadsadsad',0,1,0,0),(100,'sadasdsadsadasdasdsad',1,0,0,0),(101,'sadasdsadsadasdsadsadasdsadsadsadasdsad',0,1,0,0),(102,'asdsadasdasdsadasdasdsadsad',1,0,0,0),(103,'asdsadsadasdsadsadsadsadasdsadasdasdsa',0,1,0,0),(104,'dsadasdasdasdasdsadasd',1,0,0,0),(105,'asdsadsadasdasdasdsad',0,1,0,0),(106,'asdsadsadsadasdasdsdsadasdasdsad',1,0,0,0),(107,'asdasdasdasdasdasdasdasdasdasdasdadaas',0,1,0,0),(108,'sadsaddasdasdasdsad',1,0,0,0),(109,'dasdasdasdasdasdasdasdasdadasd',0,1,0,0),(110,'dfdsfsdfsfsfsdffsdfsdfsdfsdfsdfsd',1,0,0,0),(111,'fsffsdfsdfsdfsdfsdfsdfsdfsdfsdfsdffsdfsdfsdfsd',0,1,0,0),(112,'kdo',2,1,0,0),(113,'doma',2,1,0,0),(114,'so',0,1,0,0),(115,'toasti',0,2,0,0),(116,'še',1,0,0,0),(117,'enkrat',1,0,0,0),(118,'res',0,1,0,0),(119,'delajo',0,1,0,0),(120,'asdasdasdasdasd',1,0,0,0),(121,'dasdasdasdadasdasdasdsad',0,1,0,0),(122,'fsaddadasdadasdasda',1,0,0,0),(123,'fsdfsdfafdsfdsfasdfasdfasdfadsfasdfsadfsdafsdafasdf',0,1,0,0),(124,'ovcenjuje',1,0,0,0),(125,'izpite',1,0,0,0),(126,'isvu',1,1,0,0),(127,'spoštovani',0,1,0,0),(128,'kakšen',0,1,0,0),(129,'kriterij',0,1,0,0),(130,'ocenjevanja',0,1,0,0),(131,'izpitov',0,1,0,0),(132,'predmetu',0,1,0,0),(133,'na',1,1,0,0),(134,'dsu',1,1,0,0),(135,'ma',0,1,0,0),(136,'nemoj',0,1,0,0);
/*!40000 ALTER TABLE `qa_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoutbox`
--

DROP TABLE IF EXISTS `shoutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoutbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_je_napisal` (`userid`),
  CONSTRAINT `FK_je_napisal` FOREIGN KEY (`userid`) REFERENCES `oseba` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoutbox`
--

LOCK TABLES `shoutbox` WRITE;
/*!40000 ALTER TABLE `shoutbox` DISABLE KEYS */;
INSERT INTO `shoutbox` VALUES (1,24,'Komaj čakam na razglasitev zmagovalcev tekmovanja za uporabno rešitev!!','2015-04-25 18:04:39',NULL,NULL),(2,18,'Me prav zanima kako se bodo odrezali študentje na kolokviju naslednji teden','2015-04-26 19:04:39',NULL,NULL),(3,17,'Uf ne govori, moji imajo že izpit, me prav skrbi...','2015-04-26 19:08:29',NULL,NULL),(4,19,'A gre kdo na sladoled?','2015-04-27 19:09:46',NULL,NULL),(5,7,'Že spet je dež :(','2015-04-27 19:12:13',NULL,NULL),(6,2,'Končno sem pogruntal, kako deluje jQuery... :/','2015-05-27 21:31:03',NULL,NULL),(7,2,NULL,'2015-09-23 21:55:55','2015-09-23 21:55:55',NULL),(8,2,'Delam zadnje popravke. Kaj pa vi?','2015-09-23 21:55:55','2015-09-23 21:55:55',NULL),(9,2,'Zadnji popravki.','2015-09-23 21:56:46','2015-09-23 21:56:46',NULL),(10,2,'@Vid Jaz pa ne.','2015-09-23 21:56:56','2015-09-23 21:56:56',NULL),(11,2,'Rešitev je narejena!','2015-09-24 00:32:13','2015-09-24 00:32:13',NULL),(12,24,'Kako smo kolegi?','2015-09-24 09:12:54','2015-09-24 09:12:54',NULL),(13,2,'dsdsd','2015-09-24 12:24:49','2015-09-24 12:24:49',NULL),(14,24,'hello','2015-09-24 20:43:58','2015-09-24 20:43:58',NULL),(15,24,'@Vid kaj','2015-09-24 20:45:33','2015-09-24 20:45:33',NULL),(16,2,'aaaa','2016-08-01 07:34:50','2016-08-01 07:34:50',NULL);
/*!40000 ALTER TABLE `shoutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spada_v`
--

DROP TABLE IF EXISTS `spada_v`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spada_v` (
  `userid` int(10) unsigned NOT NULL,
  `id_clena_hierarhije` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`id_clena_hierarhije`),
  KEY `FK_spada_v2` (`id_clena_hierarhije`),
  CONSTRAINT `FK_spada_v` FOREIGN KEY (`userid`) REFERENCES `oseba` (`userid`),
  CONSTRAINT `FK_spada_v2` FOREIGN KEY (`id_clena_hierarhije`) REFERENCES `clen_hierarhije` (`id_clena_hierarhije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spada_v`
--

LOCK TABLES `spada_v` WRITE;
/*!40000 ALTER TABLE `spada_v` DISABLE KEYS */;
INSERT INTO `spada_v` VALUES (3,8),(6,9),(5,10),(4,11),(14,13),(15,13),(16,13),(17,13),(18,14),(19,14),(20,15),(21,15),(22,15),(24,15),(25,15),(23,16),(7,17),(8,18),(9,18),(10,18),(12,18),(13,18),(11,19);
/*!40000 ALTER TABLE `spada_v` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` enum('app','forum') NOT NULL,
  `type` enum('question','answer','vote','closed','endorse','user_endorse','reopened') DEFAULT NULL,
  `postid` int(10) unsigned DEFAULT NULL,
  `id_zadolzitve` int(11) DEFAULT NULL,
  `userid_aktiven` int(10) unsigned DEFAULT NULL,
  `userid_pasiven` int(10) unsigned DEFAULT NULL,
  `user_log_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` text,
  `neuporabno` int(10) unsigned DEFAULT NULL,
  `ze_videno` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_aktivna_oseba` (`userid_aktiven`),
  KEY `FK_pasivna_oseba` (`userid_pasiven`),
  KEY `FK_lahko_spada_zadolzitve` (`neuporabno`,`id_zadolzitve`),
  CONSTRAINT `FK_aktivna_oseba` FOREIGN KEY (`userid_aktiven`) REFERENCES `oseba` (`userid`),
  CONSTRAINT `FK_lahko_spada_zadolzitve` FOREIGN KEY (`neuporabno`, `id_zadolzitve`) REFERENCES `zadolzitve` (`userid`, `id_zadolzitve`),
  CONSTRAINT `FK_pasivna_oseba` FOREIGN KEY (`userid_pasiven`) REFERENCES `oseba` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (93,'forum','vote',51,NULL,2,20,'2015-09-05 21:13:29','http://localhost:8000/question2answer/index.php?qa=51&qa_1=asfdasdasdsadadadadadasdad',NULL,0),(94,'forum','question',51,NULL,2,NULL,'2015-09-05 23:44:24','http://localhost:8000/question2answer/index.php?qa=51&qa_1=asfdasdasdsadadadadadasdad',NULL,0),(95,'forum','question',51,NULL,2,NULL,'2015-09-05 23:44:40','http://localhost:8000/question2answer/index.php?qa=51&qa_1=asfdasdasdsadadadadadasdad',NULL,0),(96,'forum','question',69,NULL,20,NULL,'2015-09-06 03:26:21','http://localhost:8000/question2answer/index.php?qa=69&qa_1=asdsadasdasdsadasdasdsadsad',NULL,0),(97,'forum','question',70,NULL,20,NULL,'2015-09-06 03:27:44','http://localhost:8000/question2answer/index.php?qa=70&qa_1=dsadasdasdasdasdsadasd',NULL,0),(98,'forum','question',71,NULL,20,NULL,'2015-09-06 03:28:03','http://localhost:8000/question2answer/index.php?qa=71&qa_1=asdsadsadsadasdasdsdsadasdasdsad',NULL,0),(99,'forum','question',74,NULL,2,NULL,'2015-09-06 03:36:56','http://localhost:8000/question2answer/index.php?qa=74&qa_1=sadsaddasdasdasdsad',NULL,0),(100,'forum','question',78,NULL,20,NULL,'2015-09-14 16:11:17','http://localhost:8000/question2answer/index.php?qa=78&qa_1=dfdsfsdfsfsfsdffsdfsdfsdfsdfsdfsd',NULL,0),(101,'app','endorse',NULL,1,20,2,'2015-09-23 23:52:29',NULL,NULL,1),(104,'app','endorse',NULL,1,2,24,'2015-09-24 02:41:04',NULL,NULL,1),(105,'app','endorse',NULL,2,2,24,'2015-09-24 02:43:16',NULL,NULL,1),(106,'app','endorse',NULL,2,2,24,'2015-09-24 02:46:17',NULL,NULL,1),(107,'forum','question',96,NULL,2,NULL,'2015-09-24 02:47:11','http://localhost:8000/question2answer/index.php?qa=96&qa_1=je-kdo-doma',NULL,0),(108,'forum','question',97,NULL,2,NULL,'2015-09-24 02:50:08','http://localhost:8000/question2answer/index.php?qa=97&qa_1=je-se-enkrat-kdo-doma',NULL,0),(109,'forum','question',100,NULL,2,NULL,'2015-09-24 03:15:12','http://localhost:8000/question2answer/index.php?qa=100&qa_1=asdasdasdasdasd',NULL,0),(110,'forum','question',100,NULL,2,NULL,'2015-09-24 03:15:12','http://localhost:8000/question2answer/index.php?qa=100&qa_1=asdasdasdasdasd',NULL,0),(111,'forum','question',106,NULL,24,NULL,'2015-09-24 03:44:30','http://localhost:8000/question2answer/index.php?qa=106&qa_1=fsaddadasdadasdasda',NULL,0),(112,'app','endorse',NULL,5,24,2,'2015-09-24 09:10:36',NULL,NULL,1),(113,'forum','question',108,NULL,24,NULL,'2015-09-24 09:11:42','http://localhost:8000/question2answer/index.php?qa=108&qa_1=kako-se-ovcenjuje-izpite-pri-isvu',NULL,0),(114,'forum','question',110,NULL,24,NULL,'2015-09-24 12:27:28','http://localhost:8000/question2answer/index.php?qa=110&qa_1=kako-je-na-dsu',NULL,0);
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadolzitve`
--

DROP TABLE IF EXISTS `zadolzitve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadolzitve` (
  `userid` int(10) unsigned NOT NULL,
  `id_zadolzitve` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT NULL,
  `content` text,
  `st_glasov` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_zadolzitve`,`userid`),
  KEY `FK_ima_zadolzitev` (`userid`),
  CONSTRAINT `FK_ima_zadolzitev` FOREIGN KEY (`userid`) REFERENCES `oseba` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadolzitve`
--

LOCK TABLES `zadolzitve` WRITE;
/*!40000 ALTER TABLE `zadolzitve` DISABLE KEYS */;
INSERT INTO `zadolzitve` VALUES (24,1,1,'Ukvarjam se z projektom za uporabno rešitev',8,'2015-08-12 12:41:28','2015-09-24 02:36:51'),(24,2,0,'Popravljam izpite ISU',28,'2015-08-21 09:30:38','2015-09-24 02:46:05'),(22,3,1,'Pripravljam govor za podelitev diplom',12,'2015-09-03 12:16:27',NULL),(7,4,0,'Opraviti moram intervju z dvema študentoma',2,'2015-09-01 09:26:14',NULL),(2,5,NULL,'Neki pac delam....',1,'2015-09-01 22:41:59','2015-09-24 09:10:23');
/*!40000 ALTER TABLE `zadolzitve` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-01  9:41:15
