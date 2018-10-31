-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Valdivia
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Current Database: `Valdivia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Valdivia` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Valdivia`;

--
-- Table structure for table `DESPLAZARSE`
--

DROP TABLE IF EXISTS `DESPLAZARSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESPLAZARSE` (
  `idD` int(11) NOT NULL AUTO_INCREMENT,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `id_rut` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idD`),
  KEY `fk_id_rut` (`id_rut`),
  CONSTRAINT `fk_id_rut` FOREIGN KEY (`id_rut`) REFERENCES `PERSONA` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESPLAZARSE`
--

LOCK TABLES `DESPLAZARSE` WRITE;
/*!40000 ALTER TABLE `DESPLAZARSE` DISABLE KEYS */;
INSERT INTO `DESPLAZARSE` VALUES (23,34.56,23.12,17372,'2006-12-12 00:01:02'),(24,34.56,23.12,17372,'2006-12-12 00:03:02'),(25,34.56,23.12,17372,'2006-12-12 00:04:02'),(26,34.56,23.12,17372,'2006-12-13 00:04:02'),(27,34.56,23.12,17372,'2006-12-13 00:05:02');
/*!40000 ALTER TABLE `DESPLAZARSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LUGARDEINTERES`
--

DROP TABLE IF EXISTS `LUGARDEINTERES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LUGARDEINTERES` (
  `idLugar` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(60) DEFAULT NULL,
  `descripcion` char(200) DEFAULT NULL,
  `categoria` char(60) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  PRIMARY KEY (`idLugar`)
) ENGINE=InnoDB AUTO_INCREMENT=17657466 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LUGARDEINTERES`
--

LOCK TABLES `LUGARDEINTERES` WRITE;
/*!40000 ALTER TABLE `LUGARDEINTERES` DISABLE KEYS */;
INSERT INTO `LUGARDEINTERES` VALUES (12312,'casita','una casita','casa',34.12,56.32),(12342,'arbolito','un arbolito','un arbol',34.21,78.32),(767562,'casita3','otra casa','casa',3.67,7.56),(12312321,'anti','un binario como cualquiera','arbol binario',234.67,245.56),(17657465,'casita2','otra casa','casa',23.67,67.56);
/*!40000 ALTER TABLE `LUGARDEINTERES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONA`
--

DROP TABLE IF EXISTS `PERSONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(60) DEFAULT NULL,
  `edad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483647 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONA`
--

LOCK TABLES `PERSONA` WRITE;
/*!40000 ALTER TABLE `PERSONA` DISABLE KEYS */;
INSERT INTO `PERSONA` VALUES (17372,'ksdla',122),(183923,'X',12),(4343322,'IAIJD',22),(183923891,'bodoque',234),(2147483647,'OPSAO',24);
/*!40000 ALTER TABLE `PERSONA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-12 22:17:21
