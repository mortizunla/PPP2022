CREATE DATABASE  IF NOT EXISTS `sgh` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sgh`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: sgh
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sso_id` (`sso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (10,'Romina','$2a$10$gj7A7PNSXq8qfwRw0oPRJecnSP0.J/3YMr8WGFoU9s96FPlWvOI8S','Romina (admin)','Mansilla','romina@gmail.com'),(11,'Damian','$2a$10$ZLxaTRB5lPxpCrbP1nfcweH2AEolZYYBtMp1H85MDqDb4RpoHGH6C','Damian (dba)','Cuda','damian@gmail.com'),(12,'Pedro','$2a$10$I3NmUqzA71nVUfxdrIRuMOXFLqTO82bd0FfGbBFYJhWJE7GIP1X36','Pedro (usuario)','Lopez','pedro@gmail.com'),(13,'Fernando','$2a$10$zWdAuBi68ig0Mpvn./vL4.RJGff73C4gvQ2sWSJlnrvfCdz3F08gO','Fernando','Perez','fernando@gmail.com'),(14,'AdminSGH','$2a$10$uS.ico0tIQhiSZH0wqN11uXqwgH6auNZLCeboqGr2Xi5zKzPKQIRy','Administrador ','SGH','SistemaGestionHotelera.unla@gmail.com');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_user_profile`
--

DROP TABLE IF EXISTS `app_user_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_user_profile`
--

LOCK TABLES `app_user_user_profile` WRITE;
/*!40000 ALTER TABLE `app_user_user_profile` DISABLE KEYS */;
INSERT INTO `app_user_user_profile` VALUES (12,4),(10,5),(13,5),(14,5),(11,6);
/*!40000 ALTER TABLE `app_user_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_caracteristicasporhabitacion`
--

DROP TABLE IF EXISTS `aux_caracteristicasporhabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aux_caracteristicasporhabitacion` (
  `idHabitacion` int(10) unsigned NOT NULL DEFAULT '0',
  `idCaracteristica` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idHabitacion`,`idCaracteristica`),
  KEY `habitacion_idx` (`idHabitacion`),
  KEY `caracteristica_idx` (`idCaracteristica`),
  CONSTRAINT `caracteristica` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicahabitacion` (`idCaracteristicaHabitacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `habitacion` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_caracteristicasporhabitacion`
--

LOCK TABLES `aux_caracteristicasporhabitacion` WRITE;
/*!40000 ALTER TABLE `aux_caracteristicasporhabitacion` DISABLE KEYS */;
INSERT INTO `aux_caracteristicasporhabitacion` VALUES (3,2),(5,1);
/*!40000 ALTER TABLE `aux_caracteristicasporhabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_caracteristicasporpasajero`
--

DROP TABLE IF EXISTS `aux_caracteristicasporpasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aux_caracteristicasporpasajero` (
  `idPasajero` int(10) unsigned NOT NULL DEFAULT '0',
  `idCaracteristicaPasajero` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPasajero`,`idCaracteristicaPasajero`),
  KEY `id_caracteristicas_pasajero_idx` (`idCaracteristicaPasajero`),
  CONSTRAINT `aux_a_caracteristica` FOREIGN KEY (`idCaracteristicaPasajero`) REFERENCES `caracteristicapasajero` (`idCaracteristicaPasajero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aux_a_pasajero` FOREIGN KEY (`idPasajero`) REFERENCES `pasajero` (`idContacto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_caracteristicasporpasajero`
--

LOCK TABLES `aux_caracteristicasporpasajero` WRITE;
/*!40000 ALTER TABLE `aux_caracteristicasporpasajero` DISABLE KEYS */;
INSERT INTO `aux_caracteristicasporpasajero` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `aux_caracteristicasporpasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_serviciosporplan`
--

DROP TABLE IF EXISTS `aux_serviciosporplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aux_serviciosporplan` (
  `idServicio` int(10) unsigned NOT NULL,
  `idPlanAlojamiento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idServicio`,`idPlanAlojamiento`),
  KEY `aux_a_plan_idx` (`idPlanAlojamiento`),
  CONSTRAINT `aux_a_plan` FOREIGN KEY (`idPlanAlojamiento`) REFERENCES `planalojamiento` (`idPlanAlojamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aux_a_servicios` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_serviciosporplan`
--

LOCK TABLES `aux_serviciosporplan` WRITE;
/*!40000 ALTER TABLE `aux_serviciosporplan` DISABLE KEYS */;
INSERT INTO `aux_serviciosporplan` VALUES (3,2),(3,3),(4,3);
/*!40000 ALTER TABLE `aux_serviciosporplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicahabitacion`
--

DROP TABLE IF EXISTS `caracteristicahabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicahabitacion` (
  `idCaracteristicaHabitacion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCaracteristicaHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicahabitacion`
--

LOCK TABLES `caracteristicahabitacion` WRITE;
/*!40000 ALTER TABLE `caracteristicahabitacion` DISABLE KEYS */;
INSERT INTO `caracteristicahabitacion` VALUES (1,'Comodidad Extrema'),(2,'Standard'),(4,'Lujosa');
/*!40000 ALTER TABLE `caracteristicahabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicapasajero`
--

DROP TABLE IF EXISTS `caracteristicapasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicapasajero` (
  `idCaracteristicaPasajero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCaracteristicaPasajero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicapasajero`
--

LOCK TABLES `caracteristicapasajero` WRITE;
/*!40000 ALTER TABLE `caracteristicapasajero` DISABLE KEYS */;
INSERT INTO `caracteristicapasajero` VALUES (1,'Celiaco'),(7,'Vegetariano'),(8,'Silla de Ruedas'),(9,'Obeso');
/*!40000 ALTER TABLE `caracteristicapasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `idCuenta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saldo` double DEFAULT NULL,
  `idCliente` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadia`
--

DROP TABLE IF EXISTS `estadia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadia` (
  `idEstadia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEstadoEstadia` int(10) unsigned NOT NULL,
  `idPlanAlojamiento` int(10) unsigned NOT NULL,
  `precioPorNoche` bigint(8) DEFAULT NULL,
  `idCuenta` int(10) unsigned DEFAULT NULL,
  `diaCheckIn` datetime DEFAULT NULL,
  `diaCheckOut` datetime DEFAULT NULL,
  PRIMARY KEY (`idEstadia`),
  KEY `estadia_con_cuenta_idx` (`idCuenta`),
  KEY `estadia_con_estado_idx` (`idEstadoEstadia`),
  KEY `estadia_con_plan_idx` (`idPlanAlojamiento`),
  CONSTRAINT `estadia_con_cuenta` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estadia_con_estado` FOREIGN KEY (`idEstadoEstadia`) REFERENCES `estadoestadia` (`idEstadoEstadia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadia`
--

LOCK TABLES `estadia` WRITE;
/*!40000 ALTER TABLE `estadia` DISABLE KEYS */;
INSERT INTO `estadia` VALUES (1,7,2,200,NULL,'2017-01-16 00:00:00','2017-01-26 00:00:00'),(4,7,3,300,NULL,'2017-02-04 00:00:00','2017-02-13 00:00:00'),(6,1,2,500,NULL,'2017-06-15 00:00:00','2017-06-30 00:00:00'),(7,2,2,200,NULL,'2017-06-20 00:00:00','2017-06-24 00:00:00'),(8,3,2,200,NULL,'2017-06-20 00:00:00','2017-06-24 00:00:00'),(9,6,3,300,NULL,'2017-06-26 00:00:00','2017-07-02 00:00:00'),(10,3,2,200,NULL,'2017-06-23 00:00:00','2017-06-27 00:00:00'),(11,4,2,300,NULL,'2017-06-17 00:00:00','2017-06-22 00:00:00'),(12,1,2,100,NULL,'2017-06-21 00:00:00','2017-06-23 00:00:00');
/*!40000 ALTER TABLE `estadia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoestadia`
--

DROP TABLE IF EXISTS `estadoestadia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoestadia` (
  `idEstadoEstadia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstadoEstadia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoestadia`
--

LOCK TABLES `estadoestadia` WRITE;
/*!40000 ALTER TABLE `estadoestadia` DISABLE KEYS */;
INSERT INTO `estadoestadia` VALUES (1,'Solicitada','coral'),(2,'Reservada','aquamarine'),(3,'Bloqueada','darkgreen'),(4,'Cancelada','crimson'),(6,'CheckIn','dodgerBlue'),(7,'CheckOut','gray');
/*!40000 ALTER TABLE `estadoestadia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadohabitacion`
--

DROP TABLE IF EXISTS `estadohabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadohabitacion` (
  `idEstadoHabitacion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstadoHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadohabitacion`
--

LOCK TABLES `estadohabitacion` WRITE;
/*!40000 ALTER TABLE `estadohabitacion` DISABLE KEYS */;
INSERT INTO `estadohabitacion` VALUES (1,'En Reparacion'),(2,'Disponible'),(3,'En Reformas');
/*!40000 ALTER TABLE `estadohabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `idHabitacion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEstadoHabitacion` int(10) unsigned DEFAULT NULL,
  `idTipoHabitacion` int(10) unsigned NOT NULL,
  `idHotel` int(10) unsigned NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idHabitacion`),
  KEY `id_hotel_idx` (`idHotel`),
  KEY `h_a_estado_idx` (`idEstadoHabitacion`),
  KEY `h_a_tipo_habitacion_idx` (`idTipoHabitacion`),
  CONSTRAINT `h_a_estado` FOREIGN KEY (`idEstadoHabitacion`) REFERENCES `estadohabitacion` (`idEstadoHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `h_a_hotel` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `h_a_tipo_habitacion` FOREIGN KEY (`idTipoHabitacion`) REFERENCES `tipohabitacion` (`idTipoHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (2,1,2,1,'Hab. 101'),(3,2,1,1,'Hab. 102'),(4,1,1,1,'Hab. 103'),(5,2,3,1,'Hab. 104'),(6,2,1,1,'Hab. 105'),(7,2,1,1,'Hab. 106'),(8,2,2,1,'Hab. 107'),(9,2,3,1,'Hab. 108'),(10,2,1,1,'Hab. 109'),(11,2,2,1,'Hab. 110'),(12,2,3,1,'Hab. 111'),(13,2,1,1,'Hab. 112'),(14,2,2,1,'Hab. 113'),(15,2,3,1,'Hab. 114');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `idHotel` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreHotel` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `eMail` varchar(45) DEFAULT NULL,
  `paginaWeb` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Pipinas Viva','Calle sin numero 123',42356798,'pipinasviva@gmail.com','www.pipinasviva.com.ar'),(2,'Hotel','aaaaa 111',999999,'hotel@gmail.com','www.hotel.com.ar');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizacion` (
  `idContacto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `telefono` varchar(45) DEFAULT NULL,
  `eMail` varchar(45) DEFAULT NULL,
  `razonSocial` varchar(150) DEFAULT NULL,
  `cuit` mediumtext,
  `idCuenta` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idContacto`),
  KEY `pasajero_a_cuenta_idx` (`idCuenta`),
  CONSTRAINT `organizacion_a_cuenta` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacion`
--

LOCK TABLES `organizacion` WRITE;
/*!40000 ALTER TABLE `organizacion` DISABLE KEYS */;
INSERT INTO `organizacion` VALUES (1,'999999999','lastresmarias@gmail.com','Las tres Marias ','23-47658736-4',NULL),(2,'111111','lanueva@gmail.com','La nueva sociedad','23-99999999-4',NULL);
/*!40000 ALTER TABLE `organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasajero` (
  `idContacto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `telefono` varchar(45) DEFAULT NULL,
  `eMail` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `nacimiento` datetime DEFAULT NULL,
  `idCuenta` int(10) unsigned DEFAULT NULL,
  `idTipoDocumento` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`idContacto`),
  KEY `pasajero_a_cuenta_idx` (`idCuenta`),
  KEY `pasajero_a_tipodoc_idx` (`idTipoDocumento`),
  CONSTRAINT `pasajero_a_cuenta` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pasajero_a_tipodoc` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
INSERT INTO `pasajero` VALUES (1,'99999999','romina@gmail.com','Romina','Mansilla','99999999','2017-01-29 00:00:00',NULL,1),(2,'999999999','daniela@gmail.com','Daniela','Llorens','99999999','2017-01-13 00:00:00',NULL,1),(4,'999999999','fernando@gmail.com','Fernando','Mansilla','999999999','2017-01-06 00:00:00',NULL,1);
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajeroestadia`
--

DROP TABLE IF EXISTS `pasajeroestadia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasajeroestadia` (
  `idPasajeroEstadia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPasajero` int(10) unsigned DEFAULT '0',
  `idEstadia` int(10) unsigned NOT NULL DEFAULT '0',
  `idHabitacion` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPasajeroEstadia`,`idEstadia`,`idHabitacion`),
  KEY `pe_a_habitacion_idx` (`idHabitacion`),
  KEY `pe_a_estadia` (`idEstadia`),
  KEY `pe_a_pasajero` (`idPasajero`),
  CONSTRAINT `pe_a_estadia` FOREIGN KEY (`idEstadia`) REFERENCES `estadia` (`idEstadia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pe_a_habitacion` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pe_a_pasajero` FOREIGN KEY (`idPasajero`) REFERENCES `pasajero` (`idContacto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajeroestadia`
--

LOCK TABLES `pasajeroestadia` WRITE;
/*!40000 ALTER TABLE `pasajeroestadia` DISABLE KEYS */;
INSERT INTO `pasajeroestadia` VALUES (17,NULL,4,2),(18,NULL,6,2),(19,NULL,6,3),(20,NULL,6,3),(21,NULL,6,4),(22,NULL,6,4),(23,NULL,6,4),(24,NULL,6,3),(25,NULL,6,5),(26,NULL,7,12),(27,NULL,8,7),(28,NULL,8,7),(29,NULL,8,7),(30,NULL,8,8),(31,NULL,8,9),(32,NULL,8,9),(33,NULL,7,12),(34,NULL,7,12),(35,NULL,9,12),(36,NULL,9,12),(37,NULL,9,13),(38,NULL,9,13),(39,NULL,10,14),(40,NULL,10,15),(42,NULL,11,6),(43,NULL,12,10),(45,NULL,7,13),(46,NULL,7,13),(47,NULL,7,13),(48,NULL,12,10),(49,NULL,12,11),(50,NULL,7,12),(51,NULL,1,2),(2,1,1,4),(7,1,1,4),(9,1,1,4),(11,1,1,3),(52,1,7,6),(10,2,1,2),(16,2,1,3);
/*!40000 ALTER TABLE `pasajeroestadia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planalojamiento`
--

DROP TABLE IF EXISTS `planalojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planalojamiento` (
  `idPlanAlojamiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan` varchar(45) DEFAULT NULL,
  `precioExtraPorNoche` double DEFAULT NULL,
  PRIMARY KEY (`idPlanAlojamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planalojamiento`
--

LOCK TABLES `planalojamiento` WRITE;
/*!40000 ALTER TABLE `planalojamiento` DISABLE KEYS */;
INSERT INTO `planalojamiento` VALUES (2,'Desayuno Incluido',20),(3,'Media Pension',50);
/*!40000 ALTER TABLE `planalojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idServicio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tipoServicio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `servicio_a_tipo_idx` (`tipoServicio`),
  CONSTRAINT `servicio_a_tipo` FOREIGN KEY (`tipoServicio`) REFERENCES `tiposervicio` (`idTipoServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (3,'Desayuno',15,1),(4,'Almuerzo',30,1),(5,'Masajes',150,2),(6,'Sauna',75,2);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'Pasaporte'),(2,'DNI (Documento Unico)'),(4,'Libreta de Enrolamiento'),(5,'Cedula Policial');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipohabitacion`
--

DROP TABLE IF EXISTS `tipohabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipohabitacion` (
  `idTipoHabitacion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreTipoHabitacion` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipoHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipohabitacion`
--

LOCK TABLES `tipohabitacion` WRITE;
/*!40000 ALTER TABLE `tipohabitacion` DISABLE KEYS */;
INSERT INTO `tipohabitacion` VALUES (1,'Triple','Comodidad Extrema',3),(2,'Single','Con Mini-Bar.',1),(3,'Cuadruple','Muy Amplia',4);
/*!40000 ALTER TABLE `tipohabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposervicio`
--

DROP TABLE IF EXISTS `tiposervicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposervicio` (
  `idTipoServicio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposervicio`
--

LOCK TABLES `tiposervicio` WRITE;
/*!40000 ALTER TABLE `tiposervicio` DISABLE KEYS */;
INSERT INTO `tiposervicio` VALUES (1,'Alimentacion'),(2,'Spa');
/*!40000 ALTER TABLE `tiposervicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (5,'ADMIN'),(6,'DBA'),(4,'USER');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sgh'
--

--
-- Dumping routines for database 'sgh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-13 15:50:56
