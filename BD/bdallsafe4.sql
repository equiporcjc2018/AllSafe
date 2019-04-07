CREATE DATABASE  IF NOT EXISTS `bdallsafe4` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdallsafe4`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdallsafe4
-- ------------------------------------------------------
-- Server version	5.6.43-log

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
-- Table structure for table `asignacantidadepp`
--

DROP TABLE IF EXISTS `asignacantidadepp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacantidadepp` (
  `idEppProceso` int(11) NOT NULL AUTO_INCREMENT,
  `fechaCreacionEppProceso` varchar(45) NOT NULL,
  `tallaEppProceso` varchar(45) NOT NULL,
  `unidadEppProceso` int(11) NOT NULL,
  `cantidadEppProceso` int(11) NOT NULL,
  `precioUnitarioEppProceso` int(11) NOT NULL,
  `EstadosProyecto_idEstadosProyecto` int(11) NOT NULL,
  `tipodecarga_idtipodecarga` int(11) NOT NULL,
  `asignaeppaproyecto_idasignaeppaproyecto` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idEppProceso`),
  KEY `fk_EppProceso_EstadosProyecto1_idx` (`EstadosProyecto_idEstadosProyecto`),
  KEY `fk_asignaeppproyecto_tipodecarga1_idx` (`tipodecarga_idtipodecarga`),
  KEY `fk_asignacantidadepp_asignaeppaproyecto1_idx` (`asignaeppaproyecto_idasignaeppaproyecto`),
  CONSTRAINT `fk_EppProceso_EstadosProyecto1` FOREIGN KEY (`EstadosProyecto_idEstadosProyecto`) REFERENCES `estadosproyecto` (`idEstadosProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacantidadepp_asignaeppaproyecto1` FOREIGN KEY (`asignaeppaproyecto_idasignaeppaproyecto`) REFERENCES `asignaeppaproyecto` (`idasignaeppaproyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignaeppproyecto_tipodecarga1` FOREIGN KEY (`tipodecarga_idtipodecarga`) REFERENCES `tipodecarga` (`idtipodecarga`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacantidadepp`
--

LOCK TABLES `asignacantidadepp` WRITE;
/*!40000 ALTER TABLE `asignacantidadepp` DISABLE KEYS */;
INSERT INTO `asignacantidadepp` VALUES (1,'2019/01/29 14:39:17','43',1,100,1000,1,1,15,'Y'),(2,'2019/01/29 14:55:02','43',1,20,1000,1,1,15,'Y'),(3,'2019/01/29 15:11:01','43',1,30,1000,1,1,16,'Y'),(4,'2019/01/29 15:11:23','43',1,30,1000,1,1,16,'Y'),(5,'2019/01/29 15:11:53','43',1,20,1000,1,1,16,'Y'),(6,'2019/01/29 16:14:03','43',1,20,1000,1,1,16,'Y'),(7,'2019/02/02 01:56:36','43',1,50,1000,1,1,17,'Y'),(8,'2019/02/02 01:56:48','43',1,20,1000,1,1,17,'Y'),(9,'2019/02/04 20:13:25','43',1,1000,1000,1,1,22,'Y');
/*!40000 ALTER TABLE `asignacantidadepp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaeppaproyecto`
--

DROP TABLE IF EXISTS `asignaeppaproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaeppaproyecto` (
  `idasignaeppaproyecto` int(11) NOT NULL AUTO_INCREMENT,
  `epp_idEPP` int(11) NOT NULL,
  `proyecto_idProyecto` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idasignaeppaproyecto`),
  KEY `fk_asignaeppaproyecto_epp1_idx` (`epp_idEPP`),
  KEY `fk_asignaeppaproyecto_proyecto1_idx` (`proyecto_idProyecto`),
  CONSTRAINT `fk_asignaeppaproyecto_epp1` FOREIGN KEY (`epp_idEPP`) REFERENCES `epp` (`idEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignaeppaproyecto_proyecto1` FOREIGN KEY (`proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaeppaproyecto`
--

LOCK TABLES `asignaeppaproyecto` WRITE;
/*!40000 ALTER TABLE `asignaeppaproyecto` DISABLE KEYS */;
INSERT INTO `asignaeppaproyecto` VALUES (15,2,1,'Y'),(16,6,1,'Y'),(17,11,2,'Y'),(18,7,3,'Y'),(19,2,2,'Y'),(20,7,2,'Y'),(21,11,2,'Y'),(22,14,2,'Y'),(23,2,1,'Y'),(24,7,1,'Y'),(25,11,1,'Y');
/*!40000 ALTER TABLE `asignaeppaproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatrabajadorproyecto`
--

DROP TABLE IF EXISTS `asignatrabajadorproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatrabajadorproyecto` (
  `idasignatrabajadorproyecto` int(11) NOT NULL AUTO_INCREMENT,
  `persona_rutPasaportePersona` varchar(45) NOT NULL,
  `proyecto_idProyecto` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idasignatrabajadorproyecto`),
  KEY `fk_asignatrabajadorproyecto_persona1_idx` (`persona_rutPasaportePersona`),
  KEY `fk_asignatrabajadorproyecto_proyecto1_idx` (`proyecto_idProyecto`),
  CONSTRAINT `fk_asignatrabajadorproyecto_persona1` FOREIGN KEY (`persona_rutPasaportePersona`) REFERENCES `persona` (`rutPasaportePersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatrabajadorproyecto_proyecto1` FOREIGN KEY (`proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatrabajadorproyecto`
--

LOCK TABLES `asignatrabajadorproyecto` WRITE;
/*!40000 ALTER TABLE `asignatrabajadorproyecto` DISABLE KEYS */;
INSERT INTO `asignatrabajadorproyecto` VALUES (1,'10.000.000-1',1,'Y'),(2,'10.000.000-1',1,'Y'),(3,'77.777.777-7',3,'Y'),(4,'12.222.222-2',1,'Y'),(5,'17.779.184-9',1,'Y'),(6,'10.000.000-1',3,'Y'),(8,'11.111.111-1',4,'Y'),(9,'12.222.222-2',1,'Y'),(10,'88.888.888-8',1,'Y');
/*!40000 ALTER TABLE `asignatrabajadorproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionCargo` varchar(100) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Administrador','Y');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(200) NOT NULL,
  `Pais_idPais` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idCiudad`),
  KEY `fk_Ciudad_Pais1_idx` (`Pais_idPais`),
  CONSTRAINT `fk_Ciudad_Pais1` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Santiago',1,'Y');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `rutEmpresa` varchar(15) NOT NULL,
  `razonSocialEmpresa` varchar(255) NOT NULL,
  `direccionEmpresa` varchar(255) NOT NULL,
  `sitioWebEmpresa` varchar(255) NOT NULL,
  `telefonoEmpresa` int(11) NOT NULL,
  `giroEmpresa` varchar(255) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'22.222.222-2','Colbun','Rancagua','www.colbun.cl',123456,'Central Hydroelectrica','Y');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epp`
--

DROP TABLE IF EXISTS `epp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epp` (
  `idEPP` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEPPcol` varchar(100) NOT NULL,
  `descripcionEPP` varchar(255) NOT NULL,
  `TipoEPP_idTipoEPP` int(11) NOT NULL,
  `vigenteepp` varchar(2) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idEPP`),
  KEY `fk_EPP_TipoEPP1_idx` (`TipoEPP_idTipoEPP`),
  CONSTRAINT `fk_EPP_TipoEPP1` FOREIGN KEY (`TipoEPP_idTipoEPP`) REFERENCES `tipoepp` (`idTipoEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epp`
--

LOCK TABLES `epp` WRITE;
/*!40000 ALTER TABLE `epp` DISABLE KEYS */;
INSERT INTO `epp` VALUES (2,'Casco','Negro',1,'No','Y'),(3,'Casco','Verde',2,'No','Y'),(4,'Pantalon','Azul',2,'Si','Y'),(6,'Guantes','Alto Impacto',1,'Si','Y'),(7,'Antiparra','Lentes',1,'Si','Y'),(8,'Antiparra','Lentes',2,'Si','Y'),(9,'Overol','Ignifugo',2,'Si','Y'),(10,'Parka','Parka',1,'Si','Y'),(11,'Bototo','Talla 43',1,'Si','Y'),(12,'Bototo','Talla 43 Basico',2,'Si','Y'),(13,'Parka2','Talla 43',1,'Si','Y'),(14,'prueba','prueba',1,'Si','Y'),(15,'prueba2','prueba2',2,'Si','Y'),(16,'prueba3','prueba3',2,'No','Y'),(17,'Perro','Labrador',1,'Si','Y');
/*!40000 ALTER TABLE `epp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eppsolicitudterreno`
--

DROP TABLE IF EXISTS `eppsolicitudterreno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eppsolicitudterreno` (
  `idEppSolicitudTerreno` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEppSolicitudTerreno` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `EPP_idEPP` int(11) NOT NULL,
  `estadoEppSolicitudTerreno` varchar(45) NOT NULL,
  `cantidadEppSolicitudTerreno` int(11) NOT NULL,
  `Proyecto_idProyecto` int(11) NOT NULL,
  `obervacionEppSolicitudTerreno` varchar(255) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idEppSolicitudTerreno`),
  KEY `fk_EppSolicitudTerreno_EPP1_idx` (`EPP_idEPP`),
  KEY `fk_EppSolicitudTerreno_Proyecto1_idx` (`Proyecto_idProyecto`),
  KEY `fk_EppSolicitudTerreno_UsuarioAllsafe1_idx` (`idUsuario`),
  CONSTRAINT `fk_EppSolicitudTerreno_EPP1` FOREIGN KEY (`EPP_idEPP`) REFERENCES `epp` (`idEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EppSolicitudTerreno_Proyecto1` FOREIGN KEY (`Proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EppSolicitudTerreno_UsuarioAllsafe1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarioallsafe` (`idUsuarioAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eppsolicitudterreno`
--

LOCK TABLES `eppsolicitudterreno` WRITE;
/*!40000 ALTER TABLE `eppsolicitudterreno` DISABLE KEYS */;
/*!40000 ALTER TABLE `eppsolicitudterreno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eppterreno`
--

DROP TABLE IF EXISTS `eppterreno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eppterreno` (
  `idEppTerreno` int(11) NOT NULL AUTO_INCREMENT,
  `Persona_rutPasaportePersona` varchar(45) NOT NULL,
  `fechaEppTerreno` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Proyecto_idProyecto` int(11) NOT NULL,
  `EstadoEppTerreno` varchar(45) NOT NULL,
  `EPP_idEPP` int(11) NOT NULL,
  `CantidadEppTerreno` int(11) NOT NULL,
  `TallaEppTerreno` varchar(45) NOT NULL,
  `observacionEppTerreno` varchar(255) NOT NULL,
  `firmaEppTerreno` blob NOT NULL,
  `tipoEntregaEppTerreno` varchar(45) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idEppTerreno`),
  KEY `fk_EppEntregaTerreno_Persona1_rutPasaportePersonax` (`Persona_rutPasaportePersona`),
  KEY `fk_EppTerreno_Proyecto1_idx` (`Proyecto_idProyecto`),
  KEY `fk_EppTerreno_EPP1_idx` (`EPP_idEPP`),
  KEY `fk_EppTerreno_UsuarioAllsafe1_idx` (`idUsuario`),
  CONSTRAINT `fk_EppEntregaTerreno_Persona1` FOREIGN KEY (`Persona_rutPasaportePersona`) REFERENCES `persona` (`rutPasaportePersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EppTerreno_EPP1` FOREIGN KEY (`EPP_idEPP`) REFERENCES `epp` (`idEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EppTerreno_Proyecto1` FOREIGN KEY (`Proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EppTerreno_UsuarioAllsafe1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarioallsafe` (`idUsuarioAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eppterreno`
--

LOCK TABLES `eppterreno` WRITE;
/*!40000 ALTER TABLE `eppterreno` DISABLE KEYS */;
INSERT INTO `eppterreno` VALUES (1,'10.000.000-1','2019-02-08',1,2,'123',12,123,'123','1232','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0J\0	\0\0\0\0\0!1Qa\"Aq¡#2Rbr±Á$BCc²\Ñ3S\Òá¢£\Âð4Tdst³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0:\0\0\0\0\0\0!1Q\"Aaq2¡±Á\Ñ#BR\áðbñ34Cr¢ÿ\Ú\0\0\0?\0\î(-KS=7±¾óß\é·U^\ìL¼oÇ¨Û¶ªk\ê«\ÚQ\Ö\ãE©V\êøH\Üz\êTÿ\0û£ýS´£¬¡\Ô\Çýº¾öCSõ±\ìxö\\\×|¢by0Unº}\èýT¨                     Ö±ü¸¡¢»_/+(¿\àw±½¥a®ýsOI²5Z4Ó\ë<?¼´[:\ÕR\\SE\r\ès¼ì \î+R½]S\î\ÆM\ìÕxÝªj~Z\Ûñ\ÌJµÁ½L\Î;pþ\ëû\Î32\ëÆC¥§zi¦\ë8ú\Ë)A\Êù¹\Òòp´\Êý\'þ\ß\Æ\Ë%:Ks\àÑ½\í\×\n3W¤pø\Î¸sX>½^¿f\Õ\Ë$hz\Õòs\êö®\×Æ¯\ì¹&j\Ûõj\ÝjòrN?«\äS\íe_\Íkÿ\0¯\ì\ÆV\æÒ¶.t2E5¶h¸\ÄþÀ\í^+Z:\ã\'\äß³\í6\ç´\Í?¶c\åøbb¸{´-T¡²9§«J\í#©bß»nq30\èÓ¦\Ù\Ú\Úw©¦½9ü±0\Ï\á9Ó©Â¢(\çn«¹¾iößª\à÷eq\ïF\\\ÍO²\Ö+\ãf©¦|ø\Ç\å½\àYmCYf¶^JSo571\Ä\îc»\nÛ·¨¢¿\Öl]^Tæ±\Çû\ÃdYÜ(òNwó:6\ÆI²ßÔ±Ü¹Mnhô7µUnÛYðÊ\àUÖ\Æ8\ÓS\Ü\Ú8\Épöß´õ¡sQU~Pöz\rcOª\êº\Ï/\Ú\ZZ\î\Ü7\È)*Cf©Ò­¬\Z¥o\×\è7\Öz7­«Zi¯\\!ç¶ß¢\ÄÍ»\êºøG\æ]C\Ã!¦g\'L½:#[¸¹\Û\\z\Öý4SDbx\ÝF¦î¢­ûµLÏ\Ú9C\Ú\Z¬Àj	@ U$s0\Ç+#Ö½¡Ã¸¨ªª1,®\×j¨®\Ü\ÌOXs|¬Í½¦¡¹\ZË©\Ünm÷g§\Ý=ýBöhø~\Ãf{Kz¿ý¿?ø9»\ØA- 	b\ÚZ/aÏYuWDC\ãQ\ÅãZ=mZ\ÂØµ¨®8qv\Â\Ój³TF\í]c\ï\äº\æNe56 \Í(_gÏö3³¤q£jõ7#\Â\ëöeýX¹<&9K2²¹\â\r7.ò\æ<9¦(´e¬su3kb\ë\Éoô¬¯E#¯³6Uzª·ª\áG^¾\Ä+å©\ÓO#¤\Ç[o\Ø7sªªj\Ë\ÜØ±E\"qªØE\Í\æH\ÖÔ¶\í\ÛN\Z÷h\Ü:v­\Í5÷\êý[nmy¦gMfxÿ\04ý£Ï¯NNÐ·=q¡¸	\0@ AT\Z6p²0Tµ\ÕT\í¥\ï`·h½q\ã³r\Ó\Ô\é÷»\Ôóú½6\Â\ÛS§ª,^\äò\é\ÇÓ\Í{õ\ÊZ\Âö\É\Ý7k\ÚHp=j\Ñ3c»j´\Í\Æb|%\×r/\ÛU£OT[F\Æ<sc²\î=FÆ§{»W7\Úû­6n\Ø\ãGx\Ç\æ>=[\â\Ûy¡Lµn#	¬¼Ñ´B\Óö\ã¸,¯nF#¯²öl\ê«Þ«Ü\å\Ã&\Ò=\Ò=\Å\ï{\ç¹\Î&ä¹\Ó9\ã/snh¦)¦1P\ÍþF\à[T\Ø\Ý~E`>÷aÞ²Y·\ÚW?j\ë¿I§£Þ\ë\×ö\æ\î\0\0\0\0\0\0\0,\0\Zr\ê¾s339ö ¸\Ô\Zh$¨*gG\'\Å5@©¶¤\à¦L5¸v\íüKªµ»Vôr«\è>\Í\í¿fl\×=\ê>tø|9|\ZB\ÖzB\è¬Ã¬f\ã-\Ì\Ú4Uo¼»!\Ç\\£\Ôy?[q\é\ë\Û\Ð\Ój3Ü©\áö\îÅY\ÔX\ïtó.½=9teºò\r{-ò¢<2\Èl\évA¬ûzNöGO`\éX\îÜ#-\Ý­U\Ý\Ø\å\ã>_\Ï5O#\æ\ÅòH\â\ç¹\Æ\äòà¹33{\Û6©·LQDb!l(lBABð\ëY²\Ã\ÄT±ú¯m|	kG~\í]\r-£=^\ÚL\Ü\ÕvqÊù\Ïû7V²\á/5Æ ¸\Ô	@@@A\Ël,UP\Ï®ö°\Ëý6k\ë«\rú7\í\Ì:[#U:meºü&q>þeÀW!õ!\08$n\ÔA\Þ©TD\Æ%\Ûóu~_%)úT-\Z}«6	ñ\ë]==\íø\ÄóÎ¶\Þ\Ëý%\Ýú#¹W/)\éøne\ÃFG\âl\0$>ÎL²\ât%f\ìzZZ\×?Qþ/e°÷?Mcg>¿\ì\Ô\ÂÀ\îBaBðª^\ï§\ä©\é\ãõ)\â¯@_\Åu\èSùª\çi~\å}j«\'\Z³]y¥Ö\ZP\\&U\×\ÔvE\áó~+O\ÉTO\î\ç?\Âò>KTbf\\\Ó\\\í,\Ñ_Xø\ÃÊªÎ¢3,Í¯¥\äv·i6x#¤h\Ýdµúp\çmZmÎ\ïi1?\èvº\â\ë°ùr¨09CYw\Zw9ÿ\0&üûr¼\ëR\ÙÔ³µD\ã\î¸9¿\ËOUb^\Ù\ë.[ô·Ù¡¨ôÐP¼*¢VÐkm\ê7òÙËª\ç>¯Thæ ¸\n(.4 ($¨*|ñ¾²\Û<®nðò\ã]÷\êõ}Sf\æ4v³ý1ôb\Â!·f²Ä£wD1K/nñ\Ø\ÒÓ\ä\á{GwsCTT\Ä}þ\Î\Õ´]nñ]G\ÎÞª§±\Ò;cZOôA¥G){÷zNq\'¬ \Õó¦\Û\Ò@\îUnø\Ýü«[U\îÇ«»°\'øõGú~ð\æ!h½t$x.\î7W\Ê\ÒSI{\éS\Æ¼Ñ¢|A][s\"_8\×[\ìõ7)ÿ\0Tüø³,*\íUö A0P\\iA0PLPFIAq\Ø\Ð\\z¹D\Å3T\ÄC\æº\ê,²\Êv\É+\Þ\Äü\×g3Ö¬\Ñ\ÙÛ¦ðXP\Ê èõ.õi\Ú;\ßýÞ;\Ó\èò¾\ÕUüq\çöuI¥\Ñx\è¤\Ðzv´kù]Uf2!µ\î\Òwº\ß\ën\ä(J\rk:\èQ\æ3ÿ\0[U\îG«µ°\êjÿ\0\Æ~°\æ\0­\'¯HÄª\n-é¹¯\Å4áúP»g\ÞuÛ©ßn\éj\á4¼´\Z}Û´ÞUpXü\ÇÑ¾\Æõ´ó\ÏK\è(&HL9J\è5|\äbâP\r¤¨ó<\á\Ï=¿xZú÷h>\Æ\Ã\ÒöúºfySÞÛ\ÍÂ®¹¢\äº\'*\ÝºFe«ÿ\0µ\ær\Ü\Ñû\Õ<§µ_ò\íz\Ï\ÒM\ãR\ßxÅºWYÅ»\ÅûPz\Ðh¹AS\ÊU?s-\ì\Û\âJQ\Z¦s\åú4\r\ßS¥\Ý\æZÚv=]ÍÇª|¾\îl\n\Òz¸E\âRº²\È\à«¨\ê#ºôM\ß]S\Ý\ãej+*¡­¬\ÓS©³U¹ñ\å\å>\í´U7iFö5\ÛÁøp]H\Ì>r\ÝV\ë+Ls{\"È\èz	µ\è&\n\nA\È&\n	i\0	&Àu\07\"3\Â+8I\åõD°ý\Çµ¯\'ñ\0*ý\Íú¼D\Ø\Ú\ÒX\ï{\Õq´~\Íf\ë¯nDN]3SÚ®vt¾\ãø^\ß\Õmi\'¿1\äó^\ÓÑ=t«\ëºWE\âY¢\àwá ¸\ì\0\Ôs.T¹\Å\Çk\\zÉº\\nA¢g:®òS\Â£\ä#\Þu\ä+SS<baQk¯¬\ã\áþ\í(ªô1*¡hE¢Uº\å´dfT7rR\Ý\Ô\ÏuÍµ]\ë´tã·¯=»\'µ6ljiß£ßý¥Õ©\ê\Zöµ\ìpskn\×\rà®Nx\Ã\ÇUL\Ó3MQ¥¢«\í\ÆÈbD zz]L¸QR>ñ\ìf\ì|möw­º\Zù\î\ÒõûdM¹÷ãtó?£]j=FK¢r­\Ñ9\ËhÍµg%\Ó\ë³d/\ÜCl?Ë§\\+n[\í4Uùb~øË»\Õ|\í\å¨=®»\Z}\á©\Ô,jM\Zy\Ý;\ÄY8=½,\Êú\î^²gv±Üzªý÷=«B\ì\ïW/c³mvZzc\ÆxüXpV\'B% T-­\Ñl«ue[¢r\ÍdöSODlÃ§7t/\'Dñiú§ñY-ÝªM\rnÏµª\ÕÂ®±þqt+©*l»ðv\Ç­Kv\Ô\ÔòÚ¨±\Æc1\Ö?\á°6U\Ï\\l\È.¶d*f/`ò\Ó\r>£ó»Dz=¶X\ë»Må¹¦\Ðj5ü:xuþz9®T\å\Ôõ¡\ÑGzzcpX\Ów\Ê>ñÛ½«­i]¿U|#=f\Ï\Øö´Ø®¾õ]|#\Ò>\íR\ë]\ÚÊ·D\å[¢\Ù.Ê·Pez¥\ÑH\É[\éG#\ßy®x18\ã\nÜ¦.Q4O)|_JQ\Õ6hã\Ù,m½Nù®\ÄNc0ùu\Ësn¹¢®q8ø#P¥E\ì4ó:\á\âÔ_ð³{0oòh$ü\à\Ýq\êo\ëØ©][´Ì¶4¶{k´\Ññôñr\îõ öq%\Ô\'y[¢\Û\Ê\Ý0\åtam\åt	\Þ4a;\Ê\é&\r\æBª§\Õò0ªvþ©^ê§µ\î\él^÷\èúüYrö¹¢\Åñ¿¢mü,¯\ëiÕ±´\Ê&?tÝ\n\ã°\Ä\Þ\"!óº~¢²6.:üX\ÚÜ§­ZJK}VOcl*¹]\\\å¹kA¥µ9¦úýX \å\r\í\åt-¼¨r-%¤¡;\Ê\Ý\ÞVèP«t[.ÉLlMH\êW9L\îo^IÎ¸\íK^i\Ý\èñ^\Ði{;ñv9Uõ\çR\å´\à/aG}óð=¨<\ë/M0û·\í$\é;\Ël\\M(ñ\ÂM\È\Øù:OP\ÙÞ´\ïW½8¥\Ùz^ÎÒ®sôkK¦ ]An\Þ4	\ÞWI¼i&\r\åt	\Þ4`\ß4	\ßWI0õCamõt	Q¢µC\ÅI(Z*WI\ÞT9BwE¢¥n¡m\æ[%ñ·PUGPÛ¶F¯½&ü\Ç\í×¹VZ\í5:«[~R\î\Ñ\Ö2X\Û$n\íc\ÂÓ±u\"bc0ù\ítUESMQlû;\ï{\ÉJ¯rsÇ¦\Ç0\ìs\\\Þñd+²¦×[dp?²Aõþ{0]»\ë\ì\íÜ¹r;¾\×û}\\ýj=P¢ º#%\Ñ\"\n¢E\0U ª\Ñ9T9F¤^+H9F\ÒP¼T¨r¢¤´m\åt	\Þmù\r¾H|bM3\Ýv»Y\äz}\Ã\Ò;w\ß=»\'µ¶w\ê#µ·\ïG\Î?=>ï¶\Ð\Ç\Óv\\kK_\Ío¼\'©\Íù\Ð\Â\r&\'P-fL\ï(q\Ö\î\çi-´â§¬\Ù\×{Kõ\rL¬m\Õ\n!B¥\n\"¢.M$Á¼«nM$VnDsd\ér~²]m¦\Û\Ü91ý\ë*\ÍQUk-SÎ¦R­v\Ñ=\é?^Ò)\Ú6£«\Ð\Ü\ÞV~òñ\Ëü;XGüJ\ßIù~Sÿ\0w5¼¦ürÿ\0\"v°Ä­ô\å	3y^6r÷e·\æ;ZV£kÍ«\É,B+R\Ê\à:c_\ÈJ´WOVjujþf\ZhÃ¢ö¹õ\\\Ò\Ó\ÜU\é®*\ã, H9F\ÒL/¤£\ÅJ\é(\Â\ÛÌNaÆ®®¿k3\Z\î½\Ü{\Z\nµ\ïUÁ©¿\ÙZª¾ú\r X\0\0\è]7\Ì\å$@\ç\'\rU ª·\î6\Ú\è¦8\ÚÁÝa¿Fc.¦\Ë\Ôvww\'ý\\i½2D*Ì¢J9©õ8RnD=~5G \Û7\×w5½ý=8­\Ý]6\Ì/#\â2¹ÒÃ\Ï\Ô÷¬uWÑ¥^¶\å\\¸6\Ü?!h\ãc=Æ\Övg-Yªª¹\ÎV`\ÊjC09\Ú\ääº\ä%\í $\Ù{\ê\Ý}WV5\î\ï+\Æp\ÙÕuÖümD¯ª+t²dt\í\r2\â|G7\ÑÕ®\ÚÍµ¬\ÔX®¨\Ì)5\ÄNY©a©6)\ã{C\\\ÖJ\Ç44\r\î<\ÌK%5Lq¦Z¶1ºIn\è´\é\ì8\ïÅ\äB\ÉM\Ùñm\Û\×]£\ä}]%\ÜY\ËD/\ç\"»\ÜÝ­øqY©®*t,\ëm\×Ãùµû«·2(J ¢bR\ÒL-¼\ëù\É\Ò9LFF\í\Z{î¿x6ü¶lQü\Î\Ø\Õgc\Ö~Î¶¶\\!\ÐA\\b°F\ä<g7#\ÔcC\ä\ÄG\Ù?iøÃ©i]·»>OS³õ½µ{\Ñóói%co\Ê\ÛÜ­ÁUK.@\ÖN \ÒU\â\Z.\á°\àø\Ôù\èg\Õo½¼ðUª®e\ÝMUp¥¸\ÑC³\Ã2×j%ed±·º\ZJ£4\Ïa·QÞª «J¹GGLÌc×²70²\ë\íº\éf8uk\âs-¢\Ò1?]w{Aù®4\Î\'\r·µb®ò3\ÍÃeô¤\êÉ¿\r;7-F\â\î1Ï«.\0{`\0vÙ·¦#\Ê\Zõfg0¿0ö²)\ê`oG;\Ú\ÑøtGb\æ\êc%£lRR+\æ%\ãha¢\åVDE>Á>³¨Z)´¢xÕ\ÛV5u\Û\á<a\Ëja|Otr4±\ì6sN\ÐV\Ç7^±Tfb¤,\Ør\'%\å\Å*D-»bm<½\Çü\Æ\Äú+QFôá­«\ÕS§£3\ÏÁô­\r$pE1428\Ø\Ö1£`hz#Jº¦º¦©\ç+\êUy1\\6\Z¸_O;H\Û9§\âAD\ÄLbW·r«uET\Ï|ûQ8\È\Ð\é¨Ë¹³®;\ìll<vv\æG¤\Òë¨¿4!\ã!T\áò¹\Ç^E¸v÷­W\'\'UTòntp\ì\ËQ²aô\'R\ÃUKD3ô`,S+\Ä<Ywn]oùGø\ìOñ)õE\Ïv\\\Ç%À]\Ì\àºQ\æ\äú\'\n!÷1þ@¸\ÕsOA¥B¸@ ùÂ	«°umX=³=v1\Â=!jy:e_¥8ÿ\0\×\Õþp´µ^ú­ð«/<Ô¡\Êi¹Õ­ \"\ê\ÑS$by9.uh\Z\Ñö³ô\ÌN>³tt~«õ·b|z:\æ*\\ù®Y¦Jjl\ÙX¤0·B&$\Ã\Í\Ç\Ã\Úwà¦sTðRþ²ñ\ç\ÑôFL\äý>i\é\Û`5½\æ\Úr¿¥\î=\'\à·)¦)C\Í_¿]\ê÷ªeD6¹¥®\Íp!\Íp8 ´\"bq\Æ\Ï+³AOQ¥-,\ä\ÄAt<:Y\ÙqÁaª\Ìx:6vQ¹\Æ>m$«0\é$mTZú<Ãø\äµ\ï¢\á\Ö5\äM<\ÍE\Ú.bh{Z×ªX!²Rj²\ÃR\ì¤.TÜ·i~\\Ñ¬9m\Ø\Ý/½)õV¿v\\\Z¢_£-]Xó\Ïuõ5¦0ncsB\á\Ï6|p{\Z\äRaq®E&%ù¸\è\Öb-õq\ZÁþ3b=\Ú}!4ø»6ec¶õ\êjþ1oùV®£{Z\ÙH Y\Å)Ëg?\'*+YT¤5\ÄÖ41À¹\Î$\0.F\Ý\ëoI30Ù·]4U½T¬\äfZ\Â$\Äd¾O	pgñI¨B\Ýk£z¦\îÑb\Ü~\î¯EI¶(XØ£`³XÀ\ZÖ\0,±sjªj\Õ<WÔª          \ÕsI\ÊRµ\àkv¸û¤\rDwr\Énx´(e¡-RUI²1J±¬¿3[+½±\Ìvý\Å#\äql; \ëü²:Yb>LÉ_Q«t-u\î\rö-m·+¥V¢\Í\è=\ZñEY\Ã\è8eñ7\\\Ó\Ò\ÙY¥q²(ViL½J»®,\Ä\'4t\ï\Z×m\äp\íy\'®\æ\æ\Â\Åt\ì_£³ªy1\Í3Á\Ù2G\nò\n*jK:Z×¸lt^G\r\"W>\í{õ\ÍI\Ý\àËº¥E¢&FH¥s\ç:G\î\Ñhø\éh)÷ª`¿<¡]¸\Ï_J&H²F9½W{j§z&Ë\Ë£s£p³\â\× \Ùr¦18\ÜqM\Êõ\ÃQ½Va/[\'UÀô\ÇP¡/Tu*¸N^U(\ÂWR£\ëj`\ÂBp\å\Ñ°¡\Ô&ª®ÁZ l¸U9&´úG\ïx\ë·f\Î\ÅÛ³oruoU­eP@@@@@@@@@@@@Aª\åv\0dúD\"\ï\Î0mx8\Ý+SQfg½K5ºñ\ÂZP+E[ d!\ÆÔJó+nz[\ÅF\êr¾\Ú\Þ*0eqµ¼Ta9LW\r\ê7L«þ\Ð\Ót\Ê\Ûñ1½NélTt)Qg&°·\Ì\æ\ÔLcik\ÏCÑ½oi¬qÞ·<!·­ö¸\r\ä\Ü$»\\R®\Ëk>\ÓvÁr\Å5ñ\å,ÜZ­nI\ÕGrÀÙ\ì~|Zµi«\\Y¢\í2\ÃTSI´\È\Ïyh\ïØ°M3\áxK!\áW)ÂºJL\ZHa]>(`\å8\0e\â\áò1û\rs¾\nb&y\æ\ËQ\ä½\\¶»M\ß!±ü\"\ç\à³Ó§¹>Lsrl\ØVJC	ò\Ï\Zù\Â\Ìz{n¶­é©§ñbª\ì\Ï&Â¶!|*ON\Ä\Æ\Ë÷\ÙRm\Ñ<\âªù3D~Á£\Ý/oÀª~\ßDöuZvIQ³p\êO\ÕWô\Öú\'µ©AT»qþ\Ñÿ\0ª~\ßCµ©u¹/D>Á§­\Ï?§ôöú­]^¨pjVz4ð¿mû\ì¯¨Q\n\ÍuO\ÚÖ,\0p\"ª                                                                     ÿ\Ù','123','Y'),(2,'10.000.000-1','2019-02-08',1,2,'123',6,555,'16','1232','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0J\0	\0\0\0\0\0!1Qa\"Aq¡#2Rbr±Á$BCc²\Ñ3S\Òá¢£\Âð4Tdst³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0:\0\0\0\0\0\0!1Q\"Aaq2¡±Á\Ñ#BR\áðbñ34Cr¢ÿ\Ú\0\0\0?\0\î(-KS=7±¾óß\é·U^\ìL¼oÇ¨Û¶ªk\ê«\ÚQ\Ö\ãE©V\êøH\Üz\êTÿ\0û£ýS´£¬¡\Ô\Çýº¾öCSõ±\ìxö\\\×|¢by0Unº}\èýT¨                     Ö±ü¸¡¢»_/+(¿\àw±½¥a®ýsOI²5Z4Ó\ë<?¼´[:\ÕR\\SE\r\ès¼ì \î+R½]S\î\ÆM\ìÕxÝªj~Z\Ûñ\ÌJµÁ½L\Î;pþ\ëû\Î32\ëÆC¥§zi¦\ë8ú\Ë)A\Êù¹\Òòp´\Êý\'þ\ß\Æ\Ë%:Ks\àÑ½\í\×\n3W¤pø\Î¸sX>½^¿f\Õ\Ë$hz\Õòs\êö®\×Æ¯\ì¹&j\Ûõj\ÝjòrN?«\äS\íe_\Íkÿ\0¯\ì\ÆV\æÒ¶.t2E5¶h¸\ÄþÀ\í^+Z:\ã\'\äß³\í6\ç´\Í?¶c\åøbb¸{´-T¡²9§«J\í#©bß»nq30\èÓ¦\Ù\Ú\Úw©¦½9ü±0\Ï\á9Ó©Â¢(\çn«¹¾iößª\à÷eq\ïF\\\ÍO²\Ö+\ãf©¦|ø\Ç\å½\àYmCYf¶^JSo571\Ä\îc»\nÛ·¨¢¿\Öl]^Tæ±\Çû\ÃdYÜ(òNwó:6\ÆI²ßÔ±Ü¹Mnhô7µUnÛYðÊ\àUÖ\Æ8\ÓS\Ü\Ú8\Épöß´õ¡sQU~Pöz\rcOª\êº\Ï/\Ú\ZZ\î\Ü7\È)*Cf©Ò­¬\Z¥o\×\è7\Öz7­«Zi¯\\!ç¶ß¢\ÄÍ»\êºøG\æ]C\Ã!¦g\'L½:#[¸¹\Û\\z\Öý4SDbx\ÝF¦î¢­ûµLÏ\Ú9C\Ú\Z¬Àj	@ U$s0\Ç+#Ö½¡Ã¸¨ªª1,®\×j¨®\Ü\ÌOXs|¬Í½¦¡¹\ZË©\Ünm÷g§\Ý=ýBöhø~\Ãf{Kz¿ý¿?ø9»\ØA- 	b\ÚZ/aÏYuWDC\ãQ\ÅãZ=mZ\ÂØµ¨®8qv\Â\Ój³TF\í]c\ï\äº\æNe56 \Í(_gÏö3³¤q£jõ7#\Â\ëöeýX¹<&9K2²¹\â\r7.ò\æ<9¦(´e¬su3kb\ë\Éoô¬¯E#¯³6Uzª·ª\áG^¾\Ä+å©\ÓO#¤\Ç[o\Ø7sªªj\Ë\ÜØ±E\"qªØE\Í\æH\ÖÔ¶\í\ÛN\Z÷h\Ü:v­\Í5÷\êý[nmy¦gMfxÿ\04ý£Ï¯NNÐ·=q¡¸	\0@ AT\Z6p²0Tµ\ÕT\í¥\ï`·h½q\ã³r\Ó\Ô\é÷»\Ôóú½6\Â\ÛS§ª,^\äò\é\ÇÓ\Í{õ\ÊZ\Âö\É\Ý7k\ÚHp=j\Ñ3c»j´\Í\Æb|%\×r/\ÛU£OT[F\Æ<sc²\î=FÆ§{»W7\Úû­6n\Ø\ãGx\Ç\æ>=[\â\Ûy¡Lµn#	¬¼Ñ´B\Óö\ã¸,¯nF#¯²öl\ê«Þ«Ü\å\Ã&\Ò=\Ò=\Å\ï{\ç¹\Î&ä¹\Ó9\ã/snh¦)¦1P\ÍþF\à[T\Ø\Ý~E`>÷aÞ²Y·\ÚW?j\ë¿I§£Þ\ë\×ö\æ\î\0\0\0\0\0\0\0,\0\Zr\ê¾s339ö ¸\Ô\Zh$¨*gG\'\Å5@©¶¤\à¦L5¸v\íüKªµ»Vôr«\è>\Í\í¿fl\×=\ê>tø|9|\ZB\ÖzB\è¬Ã¬f\ã-\Ì\Ú4Uo¼»!\Ç\\£\Ôy?[q\é\ë\Û\Ð\Ój3Ü©\áö\îÅY\ÔX\ïtó.½=9teºò\r{-ò¢<2\Èl\évA¬ûzNöGO`\éX\îÜ#-\Ý­U\Ý\Ø\å\ã>_\Ï5O#\æ\ÅòH\â\ç¹\Æ\äòà¹33{\Û6©·LQDb!l(lBABð\ëY²\Ã\ÄT±ú¯m|	kG~\í]\r-£=^\ÚL\Ü\ÕvqÊù\Ïû7V²\á/5Æ ¸\Ô	@@@A\Ël,UP\Ï®ö°\Ëý6k\ë«\rú7\í\Ì:[#U:meºü&q>þeÀW!õ!\08$n\ÔA\Þ©TD\Æ%\Ûóu~_%)úT-\Z}«6	ñ\ë]==\íø\ÄóÎ¶\Þ\Ëý%\Ýú#¹W/)\éøne\ÃFG\âl\0$>ÎL²\ât%f\ìzZZ\×?Qþ/e°÷?Mcg>¿\ì\Ô\ÂÀ\îBaBðª^\ï§\ä©\é\ãõ)\â¯@_\Åu\èSùª\çi~\å}j«\'\Z³]y¥Ö\ZP\\&U\×\ÔvE\áó~+O\ÉTO\î\ç?\Âò>KTbf\\\Ó\\\í,\Ñ_Xø\ÃÊªÎ¢3,Í¯¥\äv·i6x#¤h\Ýdµúp\çmZmÎ\ïi1?\èvº\â\ë°ùr¨09CYw\Zw9ÿ\0&üûr¼\ëR\ÙÔ³µD\ã\î¸9¿\ËOUb^\Ù\ë.[ô·Ù¡¨ôÐP¼*¢VÐkm\ê7òÙËª\ç>¯Thæ ¸\n(.4 ($¨*|ñ¾²\Û<®nðò\ã]÷\êõ}Sf\æ4v³ý1ôb\Â!·f²Ä£wD1K/nñ\Ø\ÒÓ\ä\á{GwsCTT\Ä}þ\Î\Õ´]nñ]G\ÎÞª§±\Ò;cZOôA¥G){÷zNq\'¬ \Õó¦\Û\Ò@\îUnø\Ýü«[U\îÇ«»°\'øõGú~ð\æ!h½t$x.\î7W\Ê\ÒSI{\éS\Æ¼Ñ¢|A][s\"_8\×[\ìõ7)ÿ\0Tüø³,*\íUö A0P\\iA0PLPFIAq\Ø\Ð\\z¹D\Å3T\ÄC\æº\ê,²\Êv\É+\Þ\Äü\×g3Ö¬\Ñ\ÙÛ¦ðXP\Ê èõ.õi\Ú;\ßýÞ;\Ó\èò¾\ÕUüq\çöuI¥\Ñx\è¤\Ðzv´kù]Uf2!µ\î\Òwº\ß\ën\ä(J\rk:\èQ\æ3ÿ\0[U\îG«µ°\êjÿ\0\Æ~°\æ\0­\'¯HÄª\n-é¹¯\Å4áúP»g\ÞuÛ©ßn\éj\á4¼´\Z}Û´ÞUpXü\ÇÑ¾\Æõ´ó\ÏK\è(&HL9J\è5|\äbâP\r¤¨ó<\á\Ï=¿xZú÷h>\Æ\Ã\ÒöúºfySÞÛ\ÍÂ®¹¢\äº\'*\ÝºFe«ÿ\0µ\ær\Ü\Ñû\Õ<§µ_ò\íz\Ï\ÒM\ãR\ßxÅºWYÅ»\ÅûPz\Ðh¹AS\ÊU?s-\ì\Û\âJQ\Z¦s\åú4\r\ßS¥\Ý\æZÚv=]ÍÇª|¾\îl\n\Òz¸E\âRº²\È\à«¨\ê#ºôM\ß]S\Ý\ãej+*¡­¬\ÓS©³U¹ñ\å\å>\í´U7iFö5\ÛÁøp]H\Ì>r\ÝV\ë+Ls{\"È\èz	µ\è&\n\nA\È&\n	i\0	&Àu\07\"3\Â+8I\åõD°ý\Çµ¯\'ñ\0*ý\Íú¼D\Ø\Ú\ÒX\ï{\Õq´~\Íf\ë¯nDN]3SÚ®vt¾\ãø^\ß\Õmi\'¿1\äó^\ÓÑ=t«\ëºWE\âY¢\àwá ¸\ì\0\Ôs.T¹\Å\Çk\\zÉº\\nA¢g:®òS\Â£\ä#\Þu\ä+SS<baQk¯¬\ã\áþ\í(ªô1*¡hE¢Uº\å´dfT7rR\Ý\Ô\ÏuÍµ]\ë´tã·¯=»\'µ6ljiß£ßý¥Õ©\ê\Zöµ\ìpskn\×\rà®Nx\Ã\ÇUL\Ó3MQ¥¢«\í\ÆÈbD zz]L¸QR>ñ\ìf\ì|möw­º\Zù\î\ÒõûdM¹÷ãtó?£]j=FK¢r­\Ñ9\ËhÍµg%\Ó\ë³d/\ÜCl?Ë§\\+n[\í4Uùb~øË»\Õ|\í\å¨=®»\Z}\á©\Ô,jM\Zy\Ý;\ÄY8=½,\Êú\î^²gv±Üzªý÷=«B\ì\ïW/c³mvZzc\ÆxüXpV\'B% T-­\Ñl«ue[¢r\ÍdöSODlÃ§7t/\'Dñiú§ñY-ÝªM\rnÏµª\ÕÂ®±þqt+©*l»ðv\Ç­Kv\Ô\ÔòÚ¨±\Æc1\Ö?\á°6U\Ï\\l\È.¶d*f/`ò\Ó\r>£ó»Dz=¶X\ë»Må¹¦\Ðj5ü:xuþz9®T\å\Ôõ¡\ÑGzzcpX\Ów\Ê>ñÛ½«­i]¿U|#=f\Ï\Øö´Ø®¾õ]|#\Ò>\íR\ë]\ÚÊ·D\å[¢\Ù.Ê·Pez¥\ÑH\É[\éG#\ßy®x18\ã\nÜ¦.Q4O)|_JQ\Õ6hã\Ù,m½Nù®\ÄNc0ùu\Ësn¹¢®q8ø#P¥E\ì4ó:\á\âÔ_ð³{0oòh$ü\à\Ýq\êo\ëØ©][´Ì¶4¶{k´\Ññôñr\îõ öq%\Ô\'y[¢\Û\Ê\Ý0\åtam\åt	\Þ4a;\Ê\é&\r\æBª§\Õò0ªvþ©^ê§µ\î\él^÷\èúüYrö¹¢\Åñ¿¢mü,¯\ëiÕ±´\Ê&?tÝ\n\ã°\Ä\Þ\"!óº~¢²6.:üX\ÚÜ§­ZJK}VOcl*¹]\\\å¹kA¥µ9¦úýX \å\r\í\åt-¼¨r-%¤¡;\Ê\Ý\ÞVèP«t[.ÉLlMH\êW9L\îo^IÎ¸\íK^i\Ý\èñ^\Ði{;ñv9Uõ\çR\å´\à/aG}óð=¨<\ë/M0û·\í$\é;\Ël\\M(ñ\ÂM\È\Øù:OP\ÙÞ´\ïW½8¥\Ùz^ÎÒ®sôkK¦ ]An\Þ4	\ÞWI¼i&\r\åt	\Þ4`\ß4	\ßWI0õCamõt	Q¢µC\ÅI(Z*WI\ÞT9BwE¢¥n¡m\æ[%ñ·PUGPÛ¶F¯½&ü\Ç\í×¹VZ\í5:«[~R\î\Ñ\Ö2X\Û$n\íc\ÂÓ±u\"bc0ù\ítUESMQlû;\ï{\ÉJ¯rsÇ¦\Ç0\ìs\\\Þñd+²¦×[dp?²Aõþ{0]»\ë\ì\íÜ¹r;¾\×û}\\ýj=P¢ º#%\Ñ\"\n¢E\0U ª\Ñ9T9F¤^+H9F\ÒP¼T¨r¢¤´m\åt	\Þmù\r¾H|bM3\Ýv»Y\äz}\Ã\Ò;w\ß=»\'µ¶w\ê#µ·\ïG\Î?=>ï¶\Ð\Ç\Óv\\kK_\Ío¼\'©\Íù\Ð\Â\r&\'P-fL\ï(q\Ö\î\çi-´â§¬\Ù\×{Kõ\rL¬m\Õ\n!B¥\n\"¢.M$Á¼«nM$VnDsd\ér~²]m¦\Û\Ü91ý\ë*\ÍQUk-SÎ¦R­v\Ñ=\é?^Ò)\Ú6£«\Ð\Ü\ÞV~òñ\Ëü;XGüJ\ßIù~Sÿ\0w5¼¦ürÿ\0\"v°Ä­ô\å	3y^6r÷e·\æ;ZV£kÍ«\É,B+R\Ê\à:c_\ÈJ´WOVjujþf\ZhÃ¢ö¹õ\\\Ò\Ó\ÜU\é®*\ã, H9F\ÒL/¤£\ÅJ\é(\Â\ÛÌNaÆ®®¿k3\Z\î½\Ü{\Z\nµ\ïUÁ©¿\ÙZª¾ú\r X\0\0\è]7\Ì\å$@\ç\'\rU ª·\î6\Ú\è¦8\ÚÁÝa¿Fc.¦\Ë\Ôvww\'ý\\i½2D*Ì¢J9©õ8RnD=~5G \Û7\×w5½ý=8­\Ý]6\Ì/#\â2¹ÒÃ\Ï\Ô÷¬uWÑ¥^¶\å\\¸6\Ü?!h\ãc=Æ\Övg-Yªª¹\ÎV`\ÊjC09\Ú\ääº\ä%\í $\Ù{\ê\Ý}WV5\î\ï+\Æp\ÙÕuÖümD¯ª+t²dt\í\r2\â|G7\ÑÕ®\ÚÍµ¬\ÔX®¨\Ì)5\ÄNY©a©6)\ã{C\\\ÖJ\Ç44\r\î<\ÌK%5Lq¦Z¶1ºIn\è´\é\ì8\ïÅ\äB\ÉM\Ùñm\Û\×]£\ä}]%\ÜY\ËD/\ç\"»\ÜÝ­øqY©®*t,\ëm\×Ãùµû«·2(J ¢bR\ÒL-¼\ëù\É\Ò9LFF\í\Z{î¿x6ü¶lQü\Î\Ø\Õgc\Ö~Î¶¶\\!\ÐA\\b°F\ä<g7#\ÔcC\ä\ÄG\Ù?iøÃ©i]·»>OS³õ½µ{\Ñóói%co\Ê\ÛÜ­ÁUK.@\ÖN \ÒU\â\Z.\á°\àø\Ôù\èg\Õo½¼ðUª®e\ÝMUp¥¸\ÑC³\Ã2×j%ed±·º\ZJ£4\Ïa·QÞª «J¹GGLÌc×²70²\ë\íº\éf8uk\âs-¢\Ò1?]w{Aù®4\Î\'\r·µb®ò3\ÍÃeô¤\êÉ¿\r;7-F\â\î1Ï«.\0{`\0vÙ·¦#\Ê\Zõfg0¿0ö²)\ê`oG;\Ú\ÑøtGb\æ\êc%£lRR+\æ%\ãha¢\åVDE>Á>³¨Z)´¢xÕ\ÛV5u\Û\á<a\Ëja|Otr4±\ì6sN\ÐV\Ç7^±Tfb¤,\Ør\'%\å\Å*D-»bm<½\Çü\Æ\Äú+QFôá­«\ÕS§£3\ÏÁô­\r$pE1428\Ø\Ö1£`hz#Jº¦º¦©\ç+\êUy1\\6\Z¸_O;H\Û9§\âAD\ÄLbW·r«uET\Ï|ûQ8\È\Ð\é¨Ë¹³®;\ìll<vv\æG¤\Òë¨¿4!\ã!T\áò¹\Ç^E¸v÷­W\'\'UTòntp\ì\ËQ²aô\'R\ÃUKD3ô`,S+\Ä<Ywn]oùGø\ìOñ)õE\Ïv\\\Ç%À]\Ì\àºQ\æ\äú\'\n!÷1þ@¸\ÕsOA¥B¸@ ùÂ	«°umX=³=v1\Â=!jy:e_¥8ÿ\0\×\Õþp´µ^ú­ð«/<Ô¡\Êi¹Õ­ \"\ê\ÑS$by9.uh\Z\Ñö³ô\ÌN>³tt~«õ·b|z:\æ*\\ù®Y¦Jjl\ÙX¤0·B&$\Ã\Í\Ç\Ã\Úwà¦sTðRþ²ñ\ç\ÑôFL\äý>i\é\Û`5½\æ\Úr¿¥\î=\'\à·)¦)C\Í_¿]\ê÷ªeD6¹¥®\Íp!\Íp8 ´\"bq\Æ\Ï+³AOQ¥-,\ä\ÄAt<:Y\ÙqÁaª\Ìx:6vQ¹\Æ>m$«0\é$mTZú<Ãø\äµ\ï¢\á\Ö5\äM<\ÍE\Ú.bh{Z×ªX!²Rj²\ÃR\ì¤.TÜ·i~\\Ñ¬9m\Ø\Ý/½)õV¿v\\\Z¢_£-]Xó\Ïuõ5¦0ncsB\á\Ï6|p{\Z\äRaq®E&%ù¸\è\Öb-õq\ZÁþ3b=\Ú}!4ø»6ec¶õ\êjþ1oùV®£{Z\ÙH Y\Å)Ëg?\'*+YT¤5\ÄÖ41À¹\Î$\0.F\Ý\ëoI30Ù·]4U½T¬\äfZ\Â$\Äd¾O	pgñI¨B\Ýk£z¦\îÑb\Ü~\î¯EI¶(XØ£`³XÀ\ZÖ\0,±sjªj\Õ<WÔª          \ÕsI\ÊRµ\àkv¸û¤\rDwr\Énx´(e¡-RUI²1J±¬¿3[+½±\Ìvý\Å#\äql; \ëü²:Yb>LÉ_Q«t-u\î\rö-m·+¥V¢\Í\è=\ZñEY\Ã\è8eñ7\\\Ó\Ò\ÙY¥q²(ViL½J»®,\Ä\'4t\ï\Z×m\äp\íy\'®\æ\æ\Â\Åt\ì_£³ªy1\Í3Á\Ù2G\nò\n*jK:Z×¸lt^G\r\"W>\í{õ\ÍI\Ý\àËº¥E¢&FH¥s\ç:G\î\Ñhø\éh)÷ª`¿<¡]¸\Ï_J&H²F9½W{j§z&Ë\Ë£s£p³\â\× \Ùr¦18\ÜqM\Êõ\ÃQ½Va/[\'UÀô\ÇP¡/Tu*¸N^U(\ÂWR£\ëj`\ÂBp\å\Ñ°¡\Ô&ª®ÁZ l¸U9&´úG\ïx\ë·f\Î\ÅÛ³oruoU­eP@@@@@@@@@@@@Aª\åv\0dúD\"\ï\Î0mx8\Ý+SQfg½K5ºñ\ÂZP+E[ d!\ÆÔJó+nz[\ÅF\êr¾\Ú\Þ*0eqµ¼Ta9LW\r\ê7L«þ\Ð\Ót\Ê\Ûñ1½NélTt)Qg&°·\Ì\æ\ÔLcik\ÏCÑ½oi¬qÞ·<!·­ö¸\r\ä\Ü$»\\R®\Ëk>\ÓvÁr\Å5ñ\å,ÜZ­nI\ÕGrÀÙ\ì~|Zµi«\\Y¢\í2\ÃTSI´\È\Ïyh\ïØ°M3\áxK!\áW)ÂºJL\ZHa]>(`\å8\0e\â\áò1û\rs¾\nb&y\æ\ËQ\ä½\\¶»M\ß!±ü\"\ç\à³Ó§¹>Lsrl\ØVJC	ò\Ï\Zù\Â\Ìz{n¶­é©§ñbª\ì\Ï&Â¶!|*ON\Ä\Æ\Ë÷\ÙRm\Ñ<\âªù3D~Á£\Ý/oÀª~\ßDöuZvIQ³p\êO\ÕWô\Öú\'µ©AT»qþ\Ñÿ\0ª~\ßCµ©u¹/D>Á§­\Ï?§ôöú­]^¨pjVz4ð¿mû\ì¯¨Q\n\ÍuO\ÚÖ,\0p\"ª                                                                     ÿ\Ù','123','Y'),(3,'11.111.111-1','2019-02-06',2,3,'123',6,555,'16','1232','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0J\0	\0\0\0\0\0!1Qa\"Aq¡#2Rbr±Á$BCc²\Ñ3S\Òá¢£\Âð4Tdst³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0:\0\0\0\0\0\0!1Q\"Aaq2¡±Á\Ñ#BR\áðbñ34Cr¢ÿ\Ú\0\0\0?\0\î(-KS=7±¾óß\é·U^\ìL¼oÇ¨Û¶ªk\ê«\ÚQ\Ö\ãE©V\êøH\Üz\êTÿ\0û£ýS´£¬¡\Ô\Çýº¾öCSõ±\ìxö\\\×|¢by0Unº}\èýT¨                     Ö±ü¸¡¢»_/+(¿\àw±½¥a®ýsOI²5Z4Ó\ë<?¼´[:\ÕR\\SE\r\ès¼ì \î+R½]S\î\ÆM\ìÕxÝªj~Z\Ûñ\ÌJµÁ½L\Î;pþ\ëû\Î32\ëÆC¥§zi¦\ë8ú\Ë)A\Êù¹\Òòp´\Êý\'þ\ß\Æ\Ë%:Ks\àÑ½\í\×\n3W¤pø\Î¸sX>½^¿f\Õ\Ë$hz\Õòs\êö®\×Æ¯\ì¹&j\Ûõj\ÝjòrN?«\äS\íe_\Íkÿ\0¯\ì\ÆV\æÒ¶.t2E5¶h¸\ÄþÀ\í^+Z:\ã\'\äß³\í6\ç´\Í?¶c\åøbb¸{´-T¡²9§«J\í#©bß»nq30\èÓ¦\Ù\Ú\Úw©¦½9ü±0\Ï\á9Ó©Â¢(\çn«¹¾iößª\à÷eq\ïF\\\ÍO²\Ö+\ãf©¦|ø\Ç\å½\àYmCYf¶^JSo571\Ä\îc»\nÛ·¨¢¿\Öl]^Tæ±\Çû\ÃdYÜ(òNwó:6\ÆI²ßÔ±Ü¹Mnhô7µUnÛYðÊ\àUÖ\Æ8\ÓS\Ü\Ú8\Épöß´õ¡sQU~Pöz\rcOª\êº\Ï/\Ú\ZZ\î\Ü7\È)*Cf©Ò­¬\Z¥o\×\è7\Öz7­«Zi¯\\!ç¶ß¢\ÄÍ»\êºøG\æ]C\Ã!¦g\'L½:#[¸¹\Û\\z\Öý4SDbx\ÝF¦î¢­ûµLÏ\Ú9C\Ú\Z¬Àj	@ U$s0\Ç+#Ö½¡Ã¸¨ªª1,®\×j¨®\Ü\ÌOXs|¬Í½¦¡¹\ZË©\Ünm÷g§\Ý=ýBöhø~\Ãf{Kz¿ý¿?ø9»\ØA- 	b\ÚZ/aÏYuWDC\ãQ\ÅãZ=mZ\ÂØµ¨®8qv\Â\Ój³TF\í]c\ï\äº\æNe56 \Í(_gÏö3³¤q£jõ7#\Â\ëöeýX¹<&9K2²¹\â\r7.ò\æ<9¦(´e¬su3kb\ë\Éoô¬¯E#¯³6Uzª·ª\áG^¾\Ä+å©\ÓO#¤\Ç[o\Ø7sªªj\Ë\ÜØ±E\"qªØE\Í\æH\ÖÔ¶\í\ÛN\Z÷h\Ü:v­\Í5÷\êý[nmy¦gMfxÿ\04ý£Ï¯NNÐ·=q¡¸	\0@ AT\Z6p²0Tµ\ÕT\í¥\ï`·h½q\ã³r\Ó\Ô\é÷»\Ôóú½6\Â\ÛS§ª,^\äò\é\ÇÓ\Í{õ\ÊZ\Âö\É\Ý7k\ÚHp=j\Ñ3c»j´\Í\Æb|%\×r/\ÛU£OT[F\Æ<sc²\î=FÆ§{»W7\Úû­6n\Ø\ãGx\Ç\æ>=[\â\Ûy¡Lµn#	¬¼Ñ´B\Óö\ã¸,¯nF#¯²öl\ê«Þ«Ü\å\Ã&\Ò=\Ò=\Å\ï{\ç¹\Î&ä¹\Ó9\ã/snh¦)¦1P\ÍþF\à[T\Ø\Ý~E`>÷aÞ²Y·\ÚW?j\ë¿I§£Þ\ë\×ö\æ\î\0\0\0\0\0\0\0,\0\Zr\ê¾s339ö ¸\Ô\Zh$¨*gG\'\Å5@©¶¤\à¦L5¸v\íüKªµ»Vôr«\è>\Í\í¿fl\×=\ê>tø|9|\ZB\ÖzB\è¬Ã¬f\ã-\Ì\Ú4Uo¼»!\Ç\\£\Ôy?[q\é\ë\Û\Ð\Ój3Ü©\áö\îÅY\ÔX\ïtó.½=9teºò\r{-ò¢<2\Èl\évA¬ûzNöGO`\éX\îÜ#-\Ý­U\Ý\Ø\å\ã>_\Ï5O#\æ\ÅòH\â\ç¹\Æ\äòà¹33{\Û6©·LQDb!l(lBABð\ëY²\Ã\ÄT±ú¯m|	kG~\í]\r-£=^\ÚL\Ü\ÕvqÊù\Ïû7V²\á/5Æ ¸\Ô	@@@A\Ël,UP\Ï®ö°\Ëý6k\ë«\rú7\í\Ì:[#U:meºü&q>þeÀW!õ!\08$n\ÔA\Þ©TD\Æ%\Ûóu~_%)úT-\Z}«6	ñ\ë]==\íø\ÄóÎ¶\Þ\Ëý%\Ýú#¹W/)\éøne\ÃFG\âl\0$>ÎL²\ât%f\ìzZZ\×?Qþ/e°÷?Mcg>¿\ì\Ô\ÂÀ\îBaBðª^\ï§\ä©\é\ãõ)\â¯@_\Åu\èSùª\çi~\å}j«\'\Z³]y¥Ö\ZP\\&U\×\ÔvE\áó~+O\ÉTO\î\ç?\Âò>KTbf\\\Ó\\\í,\Ñ_Xø\ÃÊªÎ¢3,Í¯¥\äv·i6x#¤h\Ýdµúp\çmZmÎ\ïi1?\èvº\â\ë°ùr¨09CYw\Zw9ÿ\0&üûr¼\ëR\ÙÔ³µD\ã\î¸9¿\ËOUb^\Ù\ë.[ô·Ù¡¨ôÐP¼*¢VÐkm\ê7òÙËª\ç>¯Thæ ¸\n(.4 ($¨*|ñ¾²\Û<®nðò\ã]÷\êõ}Sf\æ4v³ý1ôb\Â!·f²Ä£wD1K/nñ\Ø\ÒÓ\ä\á{GwsCTT\Ä}þ\Î\Õ´]nñ]G\ÎÞª§±\Ò;cZOôA¥G){÷zNq\'¬ \Õó¦\Û\Ò@\îUnø\Ýü«[U\îÇ«»°\'øõGú~ð\æ!h½t$x.\î7W\Ê\ÒSI{\éS\Æ¼Ñ¢|A][s\"_8\×[\ìõ7)ÿ\0Tüø³,*\íUö A0P\\iA0PLPFIAq\Ø\Ð\\z¹D\Å3T\ÄC\æº\ê,²\Êv\É+\Þ\Äü\×g3Ö¬\Ñ\ÙÛ¦ðXP\Ê èõ.õi\Ú;\ßýÞ;\Ó\èò¾\ÕUüq\çöuI¥\Ñx\è¤\Ðzv´kù]Uf2!µ\î\Òwº\ß\ën\ä(J\rk:\èQ\æ3ÿ\0[U\îG«µ°\êjÿ\0\Æ~°\æ\0­\'¯HÄª\n-é¹¯\Å4áúP»g\ÞuÛ©ßn\éj\á4¼´\Z}Û´ÞUpXü\ÇÑ¾\Æõ´ó\ÏK\è(&HL9J\è5|\äbâP\r¤¨ó<\á\Ï=¿xZú÷h>\Æ\Ã\ÒöúºfySÞÛ\ÍÂ®¹¢\äº\'*\ÝºFe«ÿ\0µ\ær\Ü\Ñû\Õ<§µ_ò\íz\Ï\ÒM\ãR\ßxÅºWYÅ»\ÅûPz\Ðh¹AS\ÊU?s-\ì\Û\âJQ\Z¦s\åú4\r\ßS¥\Ý\æZÚv=]ÍÇª|¾\îl\n\Òz¸E\âRº²\È\à«¨\ê#ºôM\ß]S\Ý\ãej+*¡­¬\ÓS©³U¹ñ\å\å>\í´U7iFö5\ÛÁøp]H\Ì>r\ÝV\ë+Ls{\"È\èz	µ\è&\n\nA\È&\n	i\0	&Àu\07\"3\Â+8I\åõD°ý\Çµ¯\'ñ\0*ý\Íú¼D\Ø\Ú\ÒX\ï{\Õq´~\Íf\ë¯nDN]3SÚ®vt¾\ãø^\ß\Õmi\'¿1\äó^\ÓÑ=t«\ëºWE\âY¢\àwá ¸\ì\0\Ôs.T¹\Å\Çk\\zÉº\\nA¢g:®òS\Â£\ä#\Þu\ä+SS<baQk¯¬\ã\áþ\í(ªô1*¡hE¢Uº\å´dfT7rR\Ý\Ô\ÏuÍµ]\ë´tã·¯=»\'µ6ljiß£ßý¥Õ©\ê\Zöµ\ìpskn\×\rà®Nx\Ã\ÇUL\Ó3MQ¥¢«\í\ÆÈbD zz]L¸QR>ñ\ìf\ì|möw­º\Zù\î\ÒõûdM¹÷ãtó?£]j=FK¢r­\Ñ9\ËhÍµg%\Ó\ë³d/\ÜCl?Ë§\\+n[\í4Uùb~øË»\Õ|\í\å¨=®»\Z}\á©\Ô,jM\Zy\Ý;\ÄY8=½,\Êú\î^²gv±Üzªý÷=«B\ì\ïW/c³mvZzc\ÆxüXpV\'B% T-­\Ñl«ue[¢r\ÍdöSODlÃ§7t/\'Dñiú§ñY-ÝªM\rnÏµª\ÕÂ®±þqt+©*l»ðv\Ç­Kv\Ô\ÔòÚ¨±\Æc1\Ö?\á°6U\Ï\\l\È.¶d*f/`ò\Ó\r>£ó»Dz=¶X\ë»Må¹¦\Ðj5ü:xuþz9®T\å\Ôõ¡\ÑGzzcpX\Ów\Ê>ñÛ½«­i]¿U|#=f\Ï\Øö´Ø®¾õ]|#\Ò>\íR\ë]\ÚÊ·D\å[¢\Ù.Ê·Pez¥\ÑH\É[\éG#\ßy®x18\ã\nÜ¦.Q4O)|_JQ\Õ6hã\Ù,m½Nù®\ÄNc0ùu\Ësn¹¢®q8ø#P¥E\ì4ó:\á\âÔ_ð³{0oòh$ü\à\Ýq\êo\ëØ©][´Ì¶4¶{k´\Ññôñr\îõ öq%\Ô\'y[¢\Û\Ê\Ý0\åtam\åt	\Þ4a;\Ê\é&\r\æBª§\Õò0ªvþ©^ê§µ\î\él^÷\èúüYrö¹¢\Åñ¿¢mü,¯\ëiÕ±´\Ê&?tÝ\n\ã°\Ä\Þ\"!óº~¢²6.:üX\ÚÜ§­ZJK}VOcl*¹]\\\å¹kA¥µ9¦úýX \å\r\í\åt-¼¨r-%¤¡;\Ê\Ý\ÞVèP«t[.ÉLlMH\êW9L\îo^IÎ¸\íK^i\Ý\èñ^\Ði{;ñv9Uõ\çR\å´\à/aG}óð=¨<\ë/M0û·\í$\é;\Ël\\M(ñ\ÂM\È\Øù:OP\ÙÞ´\ïW½8¥\Ùz^ÎÒ®sôkK¦ ]An\Þ4	\ÞWI¼i&\r\åt	\Þ4`\ß4	\ßWI0õCamõt	Q¢µC\ÅI(Z*WI\ÞT9BwE¢¥n¡m\æ[%ñ·PUGPÛ¶F¯½&ü\Ç\í×¹VZ\í5:«[~R\î\Ñ\Ö2X\Û$n\íc\ÂÓ±u\"bc0ù\ítUESMQlû;\ï{\ÉJ¯rsÇ¦\Ç0\ìs\\\Þñd+²¦×[dp?²Aõþ{0]»\ë\ì\íÜ¹r;¾\×û}\\ýj=P¢ º#%\Ñ\"\n¢E\0U ª\Ñ9T9F¤^+H9F\ÒP¼T¨r¢¤´m\åt	\Þmù\r¾H|bM3\Ýv»Y\äz}\Ã\Ò;w\ß=»\'µ¶w\ê#µ·\ïG\Î?=>ï¶\Ð\Ç\Óv\\kK_\Ío¼\'©\Íù\Ð\Â\r&\'P-fL\ï(q\Ö\î\çi-´â§¬\Ù\×{Kõ\rL¬m\Õ\n!B¥\n\"¢.M$Á¼«nM$VnDsd\ér~²]m¦\Û\Ü91ý\ë*\ÍQUk-SÎ¦R­v\Ñ=\é?^Ò)\Ú6£«\Ð\Ü\ÞV~òñ\Ëü;XGüJ\ßIù~Sÿ\0w5¼¦ürÿ\0\"v°Ä­ô\å	3y^6r÷e·\æ;ZV£kÍ«\É,B+R\Ê\à:c_\ÈJ´WOVjujþf\ZhÃ¢ö¹õ\\\Ò\Ó\ÜU\é®*\ã, H9F\ÒL/¤£\ÅJ\é(\Â\ÛÌNaÆ®®¿k3\Z\î½\Ü{\Z\nµ\ïUÁ©¿\ÙZª¾ú\r X\0\0\è]7\Ì\å$@\ç\'\rU ª·\î6\Ú\è¦8\ÚÁÝa¿Fc.¦\Ë\Ôvww\'ý\\i½2D*Ì¢J9©õ8RnD=~5G \Û7\×w5½ý=8­\Ý]6\Ì/#\â2¹ÒÃ\Ï\Ô÷¬uWÑ¥^¶\å\\¸6\Ü?!h\ãc=Æ\Övg-Yªª¹\ÎV`\ÊjC09\Ú\ääº\ä%\í $\Ù{\ê\Ý}WV5\î\ï+\Æp\ÙÕuÖümD¯ª+t²dt\í\r2\â|G7\ÑÕ®\ÚÍµ¬\ÔX®¨\Ì)5\ÄNY©a©6)\ã{C\\\ÖJ\Ç44\r\î<\ÌK%5Lq¦Z¶1ºIn\è´\é\ì8\ïÅ\äB\ÉM\Ùñm\Û\×]£\ä}]%\ÜY\ËD/\ç\"»\ÜÝ­øqY©®*t,\ëm\×Ãùµû«·2(J ¢bR\ÒL-¼\ëù\É\Ò9LFF\í\Z{î¿x6ü¶lQü\Î\Ø\Õgc\Ö~Î¶¶\\!\ÐA\\b°F\ä<g7#\ÔcC\ä\ÄG\Ù?iøÃ©i]·»>OS³õ½µ{\Ñóói%co\Ê\ÛÜ­ÁUK.@\ÖN \ÒU\â\Z.\á°\àø\Ôù\èg\Õo½¼ðUª®e\ÝMUp¥¸\ÑC³\Ã2×j%ed±·º\ZJ£4\Ïa·QÞª «J¹GGLÌc×²70²\ë\íº\éf8uk\âs-¢\Ò1?]w{Aù®4\Î\'\r·µb®ò3\ÍÃeô¤\êÉ¿\r;7-F\â\î1Ï«.\0{`\0vÙ·¦#\Ê\Zõfg0¿0ö²)\ê`oG;\Ú\ÑøtGb\æ\êc%£lRR+\æ%\ãha¢\åVDE>Á>³¨Z)´¢xÕ\ÛV5u\Û\á<a\Ëja|Otr4±\ì6sN\ÐV\Ç7^±Tfb¤,\Ør\'%\å\Å*D-»bm<½\Çü\Æ\Äú+QFôá­«\ÕS§£3\ÏÁô­\r$pE1428\Ø\Ö1£`hz#Jº¦º¦©\ç+\êUy1\\6\Z¸_O;H\Û9§\âAD\ÄLbW·r«uET\Ï|ûQ8\È\Ð\é¨Ë¹³®;\ìll<vv\æG¤\Òë¨¿4!\ã!T\áò¹\Ç^E¸v÷­W\'\'UTòntp\ì\ËQ²aô\'R\ÃUKD3ô`,S+\Ä<Ywn]oùGø\ìOñ)õE\Ïv\\\Ç%À]\Ì\àºQ\æ\äú\'\n!÷1þ@¸\ÕsOA¥B¸@ ùÂ	«°umX=³=v1\Â=!jy:e_¥8ÿ\0\×\Õþp´µ^ú­ð«/<Ô¡\Êi¹Õ­ \"\ê\ÑS$by9.uh\Z\Ñö³ô\ÌN>³tt~«õ·b|z:\æ*\\ù®Y¦Jjl\ÙX¤0·B&$\Ã\Í\Ç\Ã\Úwà¦sTðRþ²ñ\ç\ÑôFL\äý>i\é\Û`5½\æ\Úr¿¥\î=\'\à·)¦)C\Í_¿]\ê÷ªeD6¹¥®\Íp!\Íp8 ´\"bq\Æ\Ï+³AOQ¥-,\ä\ÄAt<:Y\ÙqÁaª\Ìx:6vQ¹\Æ>m$«0\é$mTZú<Ãø\äµ\ï¢\á\Ö5\äM<\ÍE\Ú.bh{Z×ªX!²Rj²\ÃR\ì¤.TÜ·i~\\Ñ¬9m\Ø\Ý/½)õV¿v\\\Z¢_£-]Xó\Ïuõ5¦0ncsB\á\Ï6|p{\Z\äRaq®E&%ù¸\è\Öb-õq\ZÁþ3b=\Ú}!4ø»6ec¶õ\êjþ1oùV®£{Z\ÙH Y\Å)Ëg?\'*+YT¤5\ÄÖ41À¹\Î$\0.F\Ý\ëoI30Ù·]4U½T¬\äfZ\Â$\Äd¾O	pgñI¨B\Ýk£z¦\îÑb\Ü~\î¯EI¶(XØ£`³XÀ\ZÖ\0,±sjªj\Õ<WÔª          \ÕsI\ÊRµ\àkv¸û¤\rDwr\Énx´(e¡-RUI²1J±¬¿3[+½±\Ìvý\Å#\äql; \ëü²:Yb>LÉ_Q«t-u\î\rö-m·+¥V¢\Í\è=\ZñEY\Ã\è8eñ7\\\Ó\Ò\ÙY¥q²(ViL½J»®,\Ä\'4t\ï\Z×m\äp\íy\'®\æ\æ\Â\Åt\ì_£³ªy1\Í3Á\Ù2G\nò\n*jK:Z×¸lt^G\r\"W>\í{õ\ÍI\Ý\àËº¥E¢&FH¥s\ç:G\î\Ñhø\éh)÷ª`¿<¡]¸\Ï_J&H²F9½W{j§z&Ë\Ë£s£p³\â\× \Ùr¦18\ÜqM\Êõ\ÃQ½Va/[\'UÀô\ÇP¡/Tu*¸N^U(\ÂWR£\ëj`\ÂBp\å\Ñ°¡\Ô&ª®ÁZ l¸U9&´úG\ïx\ë·f\Î\ÅÛ³oruoU­eP@@@@@@@@@@@@Aª\åv\0dúD\"\ï\Î0mx8\Ý+SQfg½K5ºñ\ÂZP+E[ d!\ÆÔJó+nz[\ÅF\êr¾\Ú\Þ*0eqµ¼Ta9LW\r\ê7L«þ\Ð\Ót\Ê\Ûñ1½NélTt)Qg&°·\Ì\æ\ÔLcik\ÏCÑ½oi¬qÞ·<!·­ö¸\r\ä\Ü$»\\R®\Ëk>\ÓvÁr\Å5ñ\å,ÜZ­nI\ÕGrÀÙ\ì~|Zµi«\\Y¢\í2\ÃTSI´\È\Ïyh\ïØ°M3\áxK!\áW)ÂºJL\ZHa]>(`\å8\0e\â\áò1û\rs¾\nb&y\æ\ËQ\ä½\\¶»M\ß!±ü\"\ç\à³Ó§¹>Lsrl\ØVJC	ò\Ï\Zù\Â\Ìz{n¶­é©§ñbª\ì\Ï&Â¶!|*ON\Ä\Æ\Ë÷\ÙRm\Ñ<\âªù3D~Á£\Ý/oÀª~\ßDöuZvIQ³p\êO\ÕWô\Öú\'µ©AT»qþ\Ñÿ\0ª~\ßCµ©u¹/D>Á§­\Ï?§ôöú­]^¨pjVz4ð¿mû\ì¯¨Q\n\ÍuO\ÚÖ,\0p\"ª                                                                     ÿ\Ù','123','Y'),(4,'10.000.000-1','2019-02-07',2,2,'123',6,555,'16','1232','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0J\0	\0\0\0\0\0!1Qa\"Aq¡#2Rbr±Á$BCc²\Ñ3S\Òá¢£\Âð4Tdst³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0:\0\0\0\0\0\0!1Q\"Aaq2¡±Á\Ñ#BR\áðbñ34Cr¢ÿ\Ú\0\0\0?\0\î(-KS=7±¾óß\é·U^\ìL¼oÇ¨Û¶ªk\ê«\ÚQ\Ö\ãE©V\êøH\Üz\êTÿ\0û£ýS´£¬¡\Ô\Çýº¾öCSõ±\ìxö\\\×|¢by0Unº}\èýT¨                     Ö±ü¸¡¢»_/+(¿\àw±½¥a®ýsOI²5Z4Ó\ë<?¼´[:\ÕR\\SE\r\ès¼ì \î+R½]S\î\ÆM\ìÕxÝªj~Z\Ûñ\ÌJµÁ½L\Î;pþ\ëû\Î32\ëÆC¥§zi¦\ë8ú\Ë)A\Êù¹\Òòp´\Êý\'þ\ß\Æ\Ë%:Ks\àÑ½\í\×\n3W¤pø\Î¸sX>½^¿f\Õ\Ë$hz\Õòs\êö®\×Æ¯\ì¹&j\Ûõj\ÝjòrN?«\äS\íe_\Íkÿ\0¯\ì\ÆV\æÒ¶.t2E5¶h¸\ÄþÀ\í^+Z:\ã\'\äß³\í6\ç´\Í?¶c\åøbb¸{´-T¡²9§«J\í#©bß»nq30\èÓ¦\Ù\Ú\Úw©¦½9ü±0\Ï\á9Ó©Â¢(\çn«¹¾iößª\à÷eq\ïF\\\ÍO²\Ö+\ãf©¦|ø\Ç\å½\àYmCYf¶^JSo571\Ä\îc»\nÛ·¨¢¿\Öl]^Tæ±\Çû\ÃdYÜ(òNwó:6\ÆI²ßÔ±Ü¹Mnhô7µUnÛYðÊ\àUÖ\Æ8\ÓS\Ü\Ú8\Épöß´õ¡sQU~Pöz\rcOª\êº\Ï/\Ú\ZZ\î\Ü7\È)*Cf©Ò­¬\Z¥o\×\è7\Öz7­«Zi¯\\!ç¶ß¢\ÄÍ»\êºøG\æ]C\Ã!¦g\'L½:#[¸¹\Û\\z\Öý4SDbx\ÝF¦î¢­ûµLÏ\Ú9C\Ú\Z¬Àj	@ U$s0\Ç+#Ö½¡Ã¸¨ªª1,®\×j¨®\Ü\ÌOXs|¬Í½¦¡¹\ZË©\Ünm÷g§\Ý=ýBöhø~\Ãf{Kz¿ý¿?ø9»\ØA- 	b\ÚZ/aÏYuWDC\ãQ\ÅãZ=mZ\ÂØµ¨®8qv\Â\Ój³TF\í]c\ï\äº\æNe56 \Í(_gÏö3³¤q£jõ7#\Â\ëöeýX¹<&9K2²¹\â\r7.ò\æ<9¦(´e¬su3kb\ë\Éoô¬¯E#¯³6Uzª·ª\áG^¾\Ä+å©\ÓO#¤\Ç[o\Ø7sªªj\Ë\ÜØ±E\"qªØE\Í\æH\ÖÔ¶\í\ÛN\Z÷h\Ü:v­\Í5÷\êý[nmy¦gMfxÿ\04ý£Ï¯NNÐ·=q¡¸	\0@ AT\Z6p²0Tµ\ÕT\í¥\ï`·h½q\ã³r\Ó\Ô\é÷»\Ôóú½6\Â\ÛS§ª,^\äò\é\ÇÓ\Í{õ\ÊZ\Âö\É\Ý7k\ÚHp=j\Ñ3c»j´\Í\Æb|%\×r/\ÛU£OT[F\Æ<sc²\î=FÆ§{»W7\Úû­6n\Ø\ãGx\Ç\æ>=[\â\Ûy¡Lµn#	¬¼Ñ´B\Óö\ã¸,¯nF#¯²öl\ê«Þ«Ü\å\Ã&\Ò=\Ò=\Å\ï{\ç¹\Î&ä¹\Ó9\ã/snh¦)¦1P\ÍþF\à[T\Ø\Ý~E`>÷aÞ²Y·\ÚW?j\ë¿I§£Þ\ë\×ö\æ\î\0\0\0\0\0\0\0,\0\Zr\ê¾s339ö ¸\Ô\Zh$¨*gG\'\Å5@©¶¤\à¦L5¸v\íüKªµ»Vôr«\è>\Í\í¿fl\×=\ê>tø|9|\ZB\ÖzB\è¬Ã¬f\ã-\Ì\Ú4Uo¼»!\Ç\\£\Ôy?[q\é\ë\Û\Ð\Ój3Ü©\áö\îÅY\ÔX\ïtó.½=9teºò\r{-ò¢<2\Èl\évA¬ûzNöGO`\éX\îÜ#-\Ý­U\Ý\Ø\å\ã>_\Ï5O#\æ\ÅòH\â\ç¹\Æ\äòà¹33{\Û6©·LQDb!l(lBABð\ëY²\Ã\ÄT±ú¯m|	kG~\í]\r-£=^\ÚL\Ü\ÕvqÊù\Ïû7V²\á/5Æ ¸\Ô	@@@A\Ël,UP\Ï®ö°\Ëý6k\ë«\rú7\í\Ì:[#U:meºü&q>þeÀW!õ!\08$n\ÔA\Þ©TD\Æ%\Ûóu~_%)úT-\Z}«6	ñ\ë]==\íø\ÄóÎ¶\Þ\Ëý%\Ýú#¹W/)\éøne\ÃFG\âl\0$>ÎL²\ât%f\ìzZZ\×?Qþ/e°÷?Mcg>¿\ì\Ô\ÂÀ\îBaBðª^\ï§\ä©\é\ãõ)\â¯@_\Åu\èSùª\çi~\å}j«\'\Z³]y¥Ö\ZP\\&U\×\ÔvE\áó~+O\ÉTO\î\ç?\Âò>KTbf\\\Ó\\\í,\Ñ_Xø\ÃÊªÎ¢3,Í¯¥\äv·i6x#¤h\Ýdµúp\çmZmÎ\ïi1?\èvº\â\ë°ùr¨09CYw\Zw9ÿ\0&üûr¼\ëR\ÙÔ³µD\ã\î¸9¿\ËOUb^\Ù\ë.[ô·Ù¡¨ôÐP¼*¢VÐkm\ê7òÙËª\ç>¯Thæ ¸\n(.4 ($¨*|ñ¾²\Û<®nðò\ã]÷\êõ}Sf\æ4v³ý1ôb\Â!·f²Ä£wD1K/nñ\Ø\ÒÓ\ä\á{GwsCTT\Ä}þ\Î\Õ´]nñ]G\ÎÞª§±\Ò;cZOôA¥G){÷zNq\'¬ \Õó¦\Û\Ò@\îUnø\Ýü«[U\îÇ«»°\'øõGú~ð\æ!h½t$x.\î7W\Ê\ÒSI{\éS\Æ¼Ñ¢|A][s\"_8\×[\ìõ7)ÿ\0Tüø³,*\íUö A0P\\iA0PLPFIAq\Ø\Ð\\z¹D\Å3T\ÄC\æº\ê,²\Êv\É+\Þ\Äü\×g3Ö¬\Ñ\ÙÛ¦ðXP\Ê èõ.õi\Ú;\ßýÞ;\Ó\èò¾\ÕUüq\çöuI¥\Ñx\è¤\Ðzv´kù]Uf2!µ\î\Òwº\ß\ën\ä(J\rk:\èQ\æ3ÿ\0[U\îG«µ°\êjÿ\0\Æ~°\æ\0­\'¯HÄª\n-é¹¯\Å4áúP»g\ÞuÛ©ßn\éj\á4¼´\Z}Û´ÞUpXü\ÇÑ¾\Æõ´ó\ÏK\è(&HL9J\è5|\äbâP\r¤¨ó<\á\Ï=¿xZú÷h>\Æ\Ã\ÒöúºfySÞÛ\ÍÂ®¹¢\äº\'*\ÝºFe«ÿ\0µ\ær\Ü\Ñû\Õ<§µ_ò\íz\Ï\ÒM\ãR\ßxÅºWYÅ»\ÅûPz\Ðh¹AS\ÊU?s-\ì\Û\âJQ\Z¦s\åú4\r\ßS¥\Ý\æZÚv=]ÍÇª|¾\îl\n\Òz¸E\âRº²\È\à«¨\ê#ºôM\ß]S\Ý\ãej+*¡­¬\ÓS©³U¹ñ\å\å>\í´U7iFö5\ÛÁøp]H\Ì>r\ÝV\ë+Ls{\"È\èz	µ\è&\n\nA\È&\n	i\0	&Àu\07\"3\Â+8I\åõD°ý\Çµ¯\'ñ\0*ý\Íú¼D\Ø\Ú\ÒX\ï{\Õq´~\Íf\ë¯nDN]3SÚ®vt¾\ãø^\ß\Õmi\'¿1\äó^\ÓÑ=t«\ëºWE\âY¢\àwá ¸\ì\0\Ôs.T¹\Å\Çk\\zÉº\\nA¢g:®òS\Â£\ä#\Þu\ä+SS<baQk¯¬\ã\áþ\í(ªô1*¡hE¢Uº\å´dfT7rR\Ý\Ô\ÏuÍµ]\ë´tã·¯=»\'µ6ljiß£ßý¥Õ©\ê\Zöµ\ìpskn\×\rà®Nx\Ã\ÇUL\Ó3MQ¥¢«\í\ÆÈbD zz]L¸QR>ñ\ìf\ì|möw­º\Zù\î\ÒõûdM¹÷ãtó?£]j=FK¢r­\Ñ9\ËhÍµg%\Ó\ë³d/\ÜCl?Ë§\\+n[\í4Uùb~øË»\Õ|\í\å¨=®»\Z}\á©\Ô,jM\Zy\Ý;\ÄY8=½,\Êú\î^²gv±Üzªý÷=«B\ì\ïW/c³mvZzc\ÆxüXpV\'B% T-­\Ñl«ue[¢r\ÍdöSODlÃ§7t/\'Dñiú§ñY-ÝªM\rnÏµª\ÕÂ®±þqt+©*l»ðv\Ç­Kv\Ô\ÔòÚ¨±\Æc1\Ö?\á°6U\Ï\\l\È.¶d*f/`ò\Ó\r>£ó»Dz=¶X\ë»Må¹¦\Ðj5ü:xuþz9®T\å\Ôõ¡\ÑGzzcpX\Ów\Ê>ñÛ½«­i]¿U|#=f\Ï\Øö´Ø®¾õ]|#\Ò>\íR\ë]\ÚÊ·D\å[¢\Ù.Ê·Pez¥\ÑH\É[\éG#\ßy®x18\ã\nÜ¦.Q4O)|_JQ\Õ6hã\Ù,m½Nù®\ÄNc0ùu\Ësn¹¢®q8ø#P¥E\ì4ó:\á\âÔ_ð³{0oòh$ü\à\Ýq\êo\ëØ©][´Ì¶4¶{k´\Ññôñr\îõ öq%\Ô\'y[¢\Û\Ê\Ý0\åtam\åt	\Þ4a;\Ê\é&\r\æBª§\Õò0ªvþ©^ê§µ\î\él^÷\èúüYrö¹¢\Åñ¿¢mü,¯\ëiÕ±´\Ê&?tÝ\n\ã°\Ä\Þ\"!óº~¢²6.:üX\ÚÜ§­ZJK}VOcl*¹]\\\å¹kA¥µ9¦úýX \å\r\í\åt-¼¨r-%¤¡;\Ê\Ý\ÞVèP«t[.ÉLlMH\êW9L\îo^IÎ¸\íK^i\Ý\èñ^\Ði{;ñv9Uõ\çR\å´\à/aG}óð=¨<\ë/M0û·\í$\é;\Ël\\M(ñ\ÂM\È\Øù:OP\ÙÞ´\ïW½8¥\Ùz^ÎÒ®sôkK¦ ]An\Þ4	\ÞWI¼i&\r\åt	\Þ4`\ß4	\ßWI0õCamõt	Q¢µC\ÅI(Z*WI\ÞT9BwE¢¥n¡m\æ[%ñ·PUGPÛ¶F¯½&ü\Ç\í×¹VZ\í5:«[~R\î\Ñ\Ö2X\Û$n\íc\ÂÓ±u\"bc0ù\ítUESMQlû;\ï{\ÉJ¯rsÇ¦\Ç0\ìs\\\Þñd+²¦×[dp?²Aõþ{0]»\ë\ì\íÜ¹r;¾\×û}\\ýj=P¢ º#%\Ñ\"\n¢E\0U ª\Ñ9T9F¤^+H9F\ÒP¼T¨r¢¤´m\åt	\Þmù\r¾H|bM3\Ýv»Y\äz}\Ã\Ò;w\ß=»\'µ¶w\ê#µ·\ïG\Î?=>ï¶\Ð\Ç\Óv\\kK_\Ío¼\'©\Íù\Ð\Â\r&\'P-fL\ï(q\Ö\î\çi-´â§¬\Ù\×{Kõ\rL¬m\Õ\n!B¥\n\"¢.M$Á¼«nM$VnDsd\ér~²]m¦\Û\Ü91ý\ë*\ÍQUk-SÎ¦R­v\Ñ=\é?^Ò)\Ú6£«\Ð\Ü\ÞV~òñ\Ëü;XGüJ\ßIù~Sÿ\0w5¼¦ürÿ\0\"v°Ä­ô\å	3y^6r÷e·\æ;ZV£kÍ«\É,B+R\Ê\à:c_\ÈJ´WOVjujþf\ZhÃ¢ö¹õ\\\Ò\Ó\ÜU\é®*\ã, H9F\ÒL/¤£\ÅJ\é(\Â\ÛÌNaÆ®®¿k3\Z\î½\Ü{\Z\nµ\ïUÁ©¿\ÙZª¾ú\r X\0\0\è]7\Ì\å$@\ç\'\rU ª·\î6\Ú\è¦8\ÚÁÝa¿Fc.¦\Ë\Ôvww\'ý\\i½2D*Ì¢J9©õ8RnD=~5G \Û7\×w5½ý=8­\Ý]6\Ì/#\â2¹ÒÃ\Ï\Ô÷¬uWÑ¥^¶\å\\¸6\Ü?!h\ãc=Æ\Övg-Yªª¹\ÎV`\ÊjC09\Ú\ääº\ä%\í $\Ù{\ê\Ý}WV5\î\ï+\Æp\ÙÕuÖümD¯ª+t²dt\í\r2\â|G7\ÑÕ®\ÚÍµ¬\ÔX®¨\Ì)5\ÄNY©a©6)\ã{C\\\ÖJ\Ç44\r\î<\ÌK%5Lq¦Z¶1ºIn\è´\é\ì8\ïÅ\äB\ÉM\Ùñm\Û\×]£\ä}]%\ÜY\ËD/\ç\"»\ÜÝ­øqY©®*t,\ëm\×Ãùµû«·2(J ¢bR\ÒL-¼\ëù\É\Ò9LFF\í\Z{î¿x6ü¶lQü\Î\Ø\Õgc\Ö~Î¶¶\\!\ÐA\\b°F\ä<g7#\ÔcC\ä\ÄG\Ù?iøÃ©i]·»>OS³õ½µ{\Ñóói%co\Ê\ÛÜ­ÁUK.@\ÖN \ÒU\â\Z.\á°\àø\Ôù\èg\Õo½¼ðUª®e\ÝMUp¥¸\ÑC³\Ã2×j%ed±·º\ZJ£4\Ïa·QÞª «J¹GGLÌc×²70²\ë\íº\éf8uk\âs-¢\Ò1?]w{Aù®4\Î\'\r·µb®ò3\ÍÃeô¤\êÉ¿\r;7-F\â\î1Ï«.\0{`\0vÙ·¦#\Ê\Zõfg0¿0ö²)\ê`oG;\Ú\ÑøtGb\æ\êc%£lRR+\æ%\ãha¢\åVDE>Á>³¨Z)´¢xÕ\ÛV5u\Û\á<a\Ëja|Otr4±\ì6sN\ÐV\Ç7^±Tfb¤,\Ør\'%\å\Å*D-»bm<½\Çü\Æ\Äú+QFôá­«\ÕS§£3\ÏÁô­\r$pE1428\Ø\Ö1£`hz#Jº¦º¦©\ç+\êUy1\\6\Z¸_O;H\Û9§\âAD\ÄLbW·r«uET\Ï|ûQ8\È\Ð\é¨Ë¹³®;\ìll<vv\æG¤\Òë¨¿4!\ã!T\áò¹\Ç^E¸v÷­W\'\'UTòntp\ì\ËQ²aô\'R\ÃUKD3ô`,S+\Ä<Ywn]oùGø\ìOñ)õE\Ïv\\\Ç%À]\Ì\àºQ\æ\äú\'\n!÷1þ@¸\ÕsOA¥B¸@ ùÂ	«°umX=³=v1\Â=!jy:e_¥8ÿ\0\×\Õþp´µ^ú­ð«/<Ô¡\Êi¹Õ­ \"\ê\ÑS$by9.uh\Z\Ñö³ô\ÌN>³tt~«õ·b|z:\æ*\\ù®Y¦Jjl\ÙX¤0·B&$\Ã\Í\Ç\Ã\Úwà¦sTðRþ²ñ\ç\ÑôFL\äý>i\é\Û`5½\æ\Úr¿¥\î=\'\à·)¦)C\Í_¿]\ê÷ªeD6¹¥®\Íp!\Íp8 ´\"bq\Æ\Ï+³AOQ¥-,\ä\ÄAt<:Y\ÙqÁaª\Ìx:6vQ¹\Æ>m$«0\é$mTZú<Ãø\äµ\ï¢\á\Ö5\äM<\ÍE\Ú.bh{Z×ªX!²Rj²\ÃR\ì¤.TÜ·i~\\Ñ¬9m\Ø\Ý/½)õV¿v\\\Z¢_£-]Xó\Ïuõ5¦0ncsB\á\Ï6|p{\Z\äRaq®E&%ù¸\è\Öb-õq\ZÁþ3b=\Ú}!4ø»6ec¶õ\êjþ1oùV®£{Z\ÙH Y\Å)Ëg?\'*+YT¤5\ÄÖ41À¹\Î$\0.F\Ý\ëoI30Ù·]4U½T¬\äfZ\Â$\Äd¾O	pgñI¨B\Ýk£z¦\îÑb\Ü~\î¯EI¶(XØ£`³XÀ\ZÖ\0,±sjªj\Õ<WÔª          \ÕsI\ÊRµ\àkv¸û¤\rDwr\Énx´(e¡-RUI²1J±¬¿3[+½±\Ìvý\Å#\äql; \ëü²:Yb>LÉ_Q«t-u\î\rö-m·+¥V¢\Í\è=\ZñEY\Ã\è8eñ7\\\Ó\Ò\ÙY¥q²(ViL½J»®,\Ä\'4t\ï\Z×m\äp\íy\'®\æ\æ\Â\Åt\ì_£³ªy1\Í3Á\Ù2G\nò\n*jK:Z×¸lt^G\r\"W>\í{õ\ÍI\Ý\àËº¥E¢&FH¥s\ç:G\î\Ñhø\éh)÷ª`¿<¡]¸\Ï_J&H²F9½W{j§z&Ë\Ë£s£p³\â\× \Ùr¦18\ÜqM\Êõ\ÃQ½Va/[\'UÀô\ÇP¡/Tu*¸N^U(\ÂWR£\ëj`\ÂBp\å\Ñ°¡\Ô&ª®ÁZ l¸U9&´úG\ïx\ë·f\Î\ÅÛ³oruoU­eP@@@@@@@@@@@@Aª\åv\0dúD\"\ï\Î0mx8\Ý+SQfg½K5ºñ\ÂZP+E[ d!\ÆÔJó+nz[\ÅF\êr¾\Ú\Þ*0eqµ¼Ta9LW\r\ê7L«þ\Ð\Ót\Ê\Ûñ1½NélTt)Qg&°·\Ì\æ\ÔLcik\ÏCÑ½oi¬qÞ·<!·­ö¸\r\ä\Ü$»\\R®\Ëk>\ÓvÁr\Å5ñ\å,ÜZ­nI\ÕGrÀÙ\ì~|Zµi«\\Y¢\í2\ÃTSI´\È\Ïyh\ïØ°M3\áxK!\áW)ÂºJL\ZHa]>(`\å8\0e\â\áò1û\rs¾\nb&y\æ\ËQ\ä½\\¶»M\ß!±ü\"\ç\à³Ó§¹>Lsrl\ØVJC	ò\Ï\Zù\Â\Ìz{n¶­é©§ñbª\ì\Ï&Â¶!|*ON\Ä\Æ\Ë÷\ÙRm\Ñ<\âªù3D~Á£\Ý/oÀª~\ßDöuZvIQ³p\êO\ÕWô\Öú\'µ©AT»qþ\Ñÿ\0ª~\ßCµ©u¹/D>Á§­\Ï?§ôöú­]^¨pjVz4ð¿mû\ì¯¨Q\n\ÍuO\ÚÖ,\0p\"ª                                                                     ÿ\Ù','123','Y');
/*!40000 ALTER TABLE `eppterreno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosproyecto`
--

DROP TABLE IF EXISTS `estadosproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadosproyecto` (
  `idEstadosProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionEstadosProyecto` varchar(10) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idEstadosProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosproyecto`
--

LOCK TABLES `estadosproyecto` WRITE;
/*!40000 ALTER TABLE `estadosproyecto` DISABLE KEYS */;
INSERT INTO `estadosproyecto` VALUES (1,'Vigente','Y');
/*!40000 ALTER TABLE `estadosproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuallsafe`
--

DROP TABLE IF EXISTS `menuallsafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuallsafe` (
  `idMenuAllsafe` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMenuAllsafe` varchar(100) NOT NULL,
  `padreMenuAllsafe` int(11) NOT NULL,
  `destinoMenuAllsafe` varchar(255) NOT NULL,
  `PerfilAllSafe_idPerfilAllSafe` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idMenuAllsafe`),
  KEY `fk_MenuAllsafe_PerfilAllSafe1_idx` (`PerfilAllSafe_idPerfilAllSafe`),
  CONSTRAINT `fk_MenuAllsafe_PerfilAllSafe1` FOREIGN KEY (`PerfilAllSafe_idPerfilAllSafe`) REFERENCES `perfilallsafe` (`idPerfilAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuallsafe`
--

LOCK TABLES `menuallsafe` WRITE;
/*!40000 ALTER TABLE `menuallsafe` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuallsafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  `nacionalidadPais` varchar(100) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Chile','Chilena','Y');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametro` (
  `idparametro` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `llave` int(11) NOT NULL,
  `valor` varchar(5000) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idparametro`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Parametros de configuracion del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES (4,'Correo del remitente del mail de recuperacion de clave de usuario',1,'alvaro.sanmartinh@gmail.com','Y'),(5,'Asunto del mail de recuperacion de clave de usuario',2,'Enlace para cambiar clave AllSafe','Y'),(6,'Cuerpo del mail de recuperacion de clave de usuario',3,'Hola {{3}} <br><br> Te hemos enviado este correo porque has solicitado recuperar tu clave de AllSafe. <br> Si has sido tÃº, debes seguir <a href=\'http://{{0}}/AllSafe/CambiarClave.jsp?codigo={{1}}&id={{2}}\'>este enlace</a> para poder reestablecer tu clave. <br><br> Si el enlace no funciona, copia y pega esto en tu navegador: <br><br>http://{{0}}/AllSafe/CambiarClave.jsp?codigo={{1}}&id={{2}}<br><br>Si no has solicitado el cambio de tu clave, alguien puede estar intentando acceder a tu cuenta, te recomendamos usar una clave segura y no compartirla con nadie.','Y'),(7,'Clave del correo del remitente del mail de recuperacion de clave de usuario',4,'clave','Y'),(8,'Ip y Puerto del servidor de aplicaciones (Puede ser un DNS)',5,'localhost:8080','Y');
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfilallsafe`
--

DROP TABLE IF EXISTS `perfilallsafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfilallsafe` (
  `idPerfilAllSafe` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePerfilAllSafe` varchar(100) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idPerfilAllSafe`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilallsafe`
--

LOCK TABLES `perfilallsafe` WRITE;
/*!40000 ALTER TABLE `perfilallsafe` DISABLE KEYS */;
INSERT INTO `perfilallsafe` VALUES (1,'Administrador','Y');
/*!40000 ALTER TABLE `perfilallsafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `rutPasaportePersona` varchar(45) NOT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `nombresPersona` varchar(100) NOT NULL,
  `apePatPersona` varchar(45) NOT NULL,
  `apeMatPersona` varchar(45) NOT NULL,
  `fechaNacPersona` varchar(10) NOT NULL,
  `nacionalidadPersona` varchar(45) NOT NULL,
  `TipoPlanta_idTipoPlanta` int(11) NOT NULL,
  `correoPersona` varchar(100) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL,
  `tallaZApato_idtallaZApato` int(11) DEFAULT NULL,
  `tallaPoleraCamisa_idtallaPoleraCamisa` int(11) DEFAULT NULL,
  `TallaPantalon_idTallaPantalon` int(11) DEFAULT NULL,
  `TallaOberol_idTallaOberol` int(11) DEFAULT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`rutPasaportePersona`),
  KEY `fk_Persona_Cargo1_idx` (`Cargo_idCargo`),
  KEY `fk_Persona_TipoPlanta1_idx` (`TipoPlanta_idTipoPlanta`),
  KEY `fk_Persona_tallaZApato1_idx` (`tallaZApato_idtallaZApato`),
  KEY `fk_Persona_tallaPoleraCamisa1_idx` (`tallaPoleraCamisa_idtallaPoleraCamisa`),
  KEY `fk_Persona_TallaPantalon1_idx` (`TallaPantalon_idTallaPantalon`),
  KEY `fk_Persona_TallaOberol1_idx` (`TallaOberol_idTallaOberol`),
  CONSTRAINT `FK_persona_Cargo_idCargo` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `FK_persona_TallaOberol_idTallaOberol` FOREIGN KEY (`TallaOberol_idTallaOberol`) REFERENCES `tallaoberol` (`idTallaOberol`),
  CONSTRAINT `FK_persona_TallaPantalon_idTallaPantalon` FOREIGN KEY (`TallaPantalon_idTallaPantalon`) REFERENCES `tallapantalon` (`idTallaPantalon`),
  CONSTRAINT `FK_persona_TipoPlanta_idTipoPlanta` FOREIGN KEY (`TipoPlanta_idTipoPlanta`) REFERENCES `tipoplanta` (`idTipoPlanta`),
  CONSTRAINT `FK_persona_tallaPoleraCamisa_idtallaPoleraCamisa` FOREIGN KEY (`tallaPoleraCamisa_idtallaPoleraCamisa`) REFERENCES `tallapoleracamisa` (`idTallaPoleraCamisa`),
  CONSTRAINT `FK_persona_tallaZApato_idtallaZApato` FOREIGN KEY (`tallaZApato_idtallaZApato`) REFERENCES `tallazapato` (`idTallaZapato`),
  CONSTRAINT `fk_Persona_Cargo1` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_TallaOberol1` FOREIGN KEY (`TallaOberol_idTallaOberol`) REFERENCES `tallaoberol` (`idTallaOberol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_TallaPantalon1` FOREIGN KEY (`TallaPantalon_idTallaPantalon`) REFERENCES `tallapantalon` (`idTallaPantalon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_TipoPlanta1` FOREIGN KEY (`TipoPlanta_idTipoPlanta`) REFERENCES `tipoplanta` (`idTipoPlanta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_tallaPoleraCamisa1` FOREIGN KEY (`tallaPoleraCamisa_idtallaPoleraCamisa`) REFERENCES `tallapoleracamisa` (`idTallaPoleraCamisa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_tallaZApato1` FOREIGN KEY (`tallaZApato_idtallaZApato`) REFERENCES `tallazapato` (`idTallaZapato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('10.000.000-1',NULL,'Diez','pa','ma','2019-01-01','Paraguayo',1,'correo@correo.cl',1,1,1,1,1,'Y'),('11.111.111-1',123,'Diego','MuÃ±oz','MuÃ±oz2','11-06-1982','Chilena',1,'alvaro.sanmartinh@gmail.com',1,1,1,1,1,'Y'),('12.222.222-2',NULL,'Once','Once','Once','2019-01-01','Argentino',1,'correo@correo.cl',1,1,1,1,1,'Y'),('17.779.184-9',NULL,'Nadia','Aranguiz','Fernandez','1991-01-26','Chilena',1,'correo@correo.cl',1,1,1,1,1,'Y'),('22.222.222-2',NULL,'Elhana','Machado','Ma','2019-01-01','BrazileÃ±a',1,'correo@correo.cl',1,1,1,1,1,'Y'),('33.333.333-3',NULL,'Tres','Tres3','TresIII','2019-01-01','Chilena',1,'correo@correo.cl',1,1,1,1,1,'Y'),('44.444.444-4',NULL,'Cuatro','Cuatro','Cuatro','2019-01-01','Chilena',1,'correo@correo.cl',1,1,1,1,1,'Y'),('55.555.555-5',NULL,'Jose','Beltran','h','2019-01-01','Mexicano',1,'correo@correo.cl',1,1,1,1,1,'Y'),('66.666.666-6',NULL,'Seis','Seis','nuk','2019-01-01','Boliviano',1,'correo@correo.cl',1,1,1,1,1,'Y'),('77.777.777-7',NULL,'Siete','SietePa','SieteMa','2019-01-01','Colombiano',1,'correo@correo.cl',1,1,1,1,1,'Y'),('88.888.888-8',NULL,'Ocho','Pa','Ma','2019-01-01','Argentino',1,'correo@correo.cl',1,1,1,1,1,'Y'),('99.999.999-9',NULL,'Nueve','Pa','Ma','2019-01-01','Norteamericano',1,'correo@correo.cl',1,1,1,1,1,'Y');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `numeroProyecto` int(11) NOT NULL,
  `nombreProyecto` varchar(200) NOT NULL,
  `ubicacionProyecto` varchar(255) NOT NULL,
  `fechaInicioProyecto` varchar(45) NOT NULL,
  `fechaTerminoProyecto` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  `Empresa_idEmpresa` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idProyecto`),
  KEY `fk_Proyecto_Ciudad1_idx` (`Ciudad_idCiudad`),
  KEY `fk_Proyecto_Empresa1_idx` (`Empresa_idEmpresa`),
  CONSTRAINT `fk_Proyecto_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Empresa1` FOREIGN KEY (`Empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,125000,'Nueva Aldea','Nueva Aldea','2019-01-01','2019-01-31',1,1,'Y'),(2,126000,'Candelaria','Rancagua','2019-01-01','2019-01-31',1,1,'Y'),(3,127000,'Proyecto 3','Tercer Proyecto','2019-01-01','2019-01-30',1,1,'Y'),(4,128000,'Proy 8 ','Rancagua','2019-01-01','2019-03-31',1,1,'Y');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallaoberol`
--

DROP TABLE IF EXISTS `tallaoberol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tallaoberol` (
  `idTallaOberol` int(11) NOT NULL AUTO_INCREMENT,
  `numeroTallaOberol` int(11) NOT NULL,
  `letraTallaOberol` varchar(3) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idTallaOberol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallaoberol`
--

LOCK TABLES `tallaoberol` WRITE;
/*!40000 ALTER TABLE `tallaoberol` DISABLE KEYS */;
INSERT INTO `tallaoberol` VALUES (1,50,'L','Y');
/*!40000 ALTER TABLE `tallaoberol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallapantalon`
--

DROP TABLE IF EXISTS `tallapantalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tallapantalon` (
  `idTallaPantalon` int(11) NOT NULL AUTO_INCREMENT,
  `numeroTallaPantalon` int(11) NOT NULL,
  `letraTallaPantalon` varchar(3) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idTallaPantalon`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallapantalon`
--

LOCK TABLES `tallapantalon` WRITE;
/*!40000 ALTER TABLE `tallapantalon` DISABLE KEYS */;
INSERT INTO `tallapantalon` VALUES (1,50,'L','Y');
/*!40000 ALTER TABLE `tallapantalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallapoleracamisa`
--

DROP TABLE IF EXISTS `tallapoleracamisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tallapoleracamisa` (
  `idTallaPoleraCamisa` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPoleraCamisa` int(11) NOT NULL,
  `letraPoleraCamisa` varchar(3) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idTallaPoleraCamisa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallapoleracamisa`
--

LOCK TABLES `tallapoleracamisa` WRITE;
/*!40000 ALTER TABLE `tallapoleracamisa` DISABLE KEYS */;
INSERT INTO `tallapoleracamisa` VALUES (1,50,'L','Y');
/*!40000 ALTER TABLE `tallapoleracamisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallazapato`
--

DROP TABLE IF EXISTS `tallazapato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tallazapato` (
  `idTallaZapato` int(11) NOT NULL AUTO_INCREMENT,
  `numeroZapato` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idTallaZapato`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallazapato`
--

LOCK TABLES `tallazapato` WRITE;
/*!40000 ALTER TABLE `tallazapato` DISABLE KEYS */;
INSERT INTO `tallazapato` VALUES (1,43,'Y');
/*!40000 ALTER TABLE `tallazapato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodecarga`
--

DROP TABLE IF EXISTS `tipodecarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodecarga` (
  `idtipodecarga` int(11) NOT NULL,
  `nombretipodecargac` varchar(100) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idtipodecarga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodecarga`
--

LOCK TABLES `tipodecarga` WRITE;
/*!40000 ALTER TABLE `tipodecarga` DISABLE KEYS */;
INSERT INTO `tipodecarga` VALUES (1,'Carga Inicial','Y'),(2,'DevoluciÃ³n ToolCenter','Y');
/*!40000 ALTER TABLE `tipodecarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoepp`
--

DROP TABLE IF EXISTS `tipoepp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoepp` (
  `idTipoEPP` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionTipoEPP` varchar(100) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idTipoEPP`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoepp`
--

LOCK TABLES `tipoepp` WRITE;
/*!40000 ALTER TABLE `tipoepp` DISABLE KEYS */;
INSERT INTO `tipoepp` VALUES (1,'EstÃ¡ndar','Y'),(2,'No EstÃ¡ndar','Y');
/*!40000 ALTER TABLE `tipoepp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoplanta`
--

DROP TABLE IF EXISTS `tipoplanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoplanta` (
  `idTipoPlanta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionTipoPlanta` varchar(45) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idTipoPlanta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoplanta`
--

LOCK TABLES `tipoplanta` WRITE;
/*!40000 ALTER TABLE `tipoplanta` DISABLE KEYS */;
INSERT INTO `tipoplanta` VALUES (1,'Planta','Y');
/*!40000 ALTER TABLE `tipoplanta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioallsafe`
--

DROP TABLE IF EXISTS `usuarioallsafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioallsafe` (
  `idUsuarioAllSafe` int(11) NOT NULL AUTO_INCREMENT,
  `loginUsuarioAllSafe` varchar(45) NOT NULL,
  `passUsuarioAllSafe` varchar(45) NOT NULL,
  `Persona_rutPasaportePersona` varchar(45) NOT NULL,
  `PerfilAllSafe_idPerfilAllSafe` int(11) NOT NULL,
  `vigencia` char(1) DEFAULT 'Y',
  PRIMARY KEY (`idUsuarioAllSafe`),
  KEY `fk_UsuarioAllSafe_Persona1_rutPasaportePersonax` (`Persona_rutPasaportePersona`),
  KEY `fk_UsuarioAllSafe_PerfilAllSafe1_idx` (`PerfilAllSafe_idPerfilAllSafe`),
  CONSTRAINT `fk_UsuarioAllSafe_PerfilAllSafe1` FOREIGN KEY (`PerfilAllSafe_idPerfilAllSafe`) REFERENCES `perfilallsafe` (`idPerfilAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioAllSafe_Persona1` FOREIGN KEY (`Persona_rutPasaportePersona`) REFERENCES `persona` (`rutPasaportePersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioallsafe`
--

LOCK TABLES `usuarioallsafe` WRITE;
/*!40000 ALTER TABLE `usuarioallsafe` DISABLE KEYS */;
INSERT INTO `usuarioallsafe` VALUES (1,'admin','827ccb0eea8a706c4c34a16891f84e7b','11.111.111-1',1,'Y'),(2,'asd','202cb962ac59075b964b07152d234b70','33.333.333-3',1,'Y');
/*!40000 ALTER TABLE `usuarioallsafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioclavehistorial`
--

DROP TABLE IF EXISTS `usuarioclavehistorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioclavehistorial` (
  `idusuarioclavehistorial` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(200) NOT NULL,
  `fechacreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  PRIMARY KEY (`idusuarioclavehistorial`),
  UNIQUE KEY `idusuariohistorialclave_UNIQUE` (`idusuarioclavehistorial`),
  KEY `IDUSUARIO_idx` (`usuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`usuario`) REFERENCES `usuarioallsafe` (`idUsuarioAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Contiene el historial de las claves que ha usado el usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioclavehistorial`
--

LOCK TABLES `usuarioclavehistorial` WRITE;
/*!40000 ALTER TABLE `usuarioclavehistorial` DISABLE KEYS */;
INSERT INTO `usuarioclavehistorial` VALUES (7,'81dc9bdb52d04dc20036dbd8313ed055','2019-04-06 15:29:05',1,'I'),(8,'827ccb0eea8a706c4c34a16891f84e7b','2019-04-06 15:30:07',1,'A');
/*!40000 ALTER TABLE `usuarioclavehistorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioclaverecuperar`
--

DROP TABLE IF EXISTS `usuarioclaverecuperar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioclaverecuperar` (
  `idusuarioclaverecuperar` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `codigo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idusuarioclaverecuperar`),
  UNIQUE KEY `idusuariorecuperarclave_UNIQUE` (`idusuarioclaverecuperar`),
  KEY `idUsuario_idx` (`usuario`),
  CONSTRAINT `idUsuarioRecuperar` FOREIGN KEY (`usuario`) REFERENCES `usuarioallsafe` (`idUsuarioAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioclaverecuperar`
--

LOCK TABLES `usuarioclaverecuperar` WRITE;
/*!40000 ALTER TABLE `usuarioclaverecuperar` DISABLE KEYS */;
INSERT INTO `usuarioclaverecuperar` VALUES (27,1,'2019-04-06 15:24:14','m49YHKmLH022nkeCMCAeY4xehgKxGL5lEVzWhLw2HAJaa1jvBk'),(31,1,'2019-04-06 17:58:02','9qdSMWh4q0Und5gR1MnN3jTT75iRZXBhPbQ5L0U7y7xC3kCLxb'),(32,1,'2019-04-06 18:00:00','camg8bo6RbJ1uGqnruqhyWhLbtxnHLnhQH6CJoMkChzBBoJjZP'),(33,1,'2019-04-06 18:01:51','BqqcYsHauW7kkyFeS2HzjfuHGMDbTYxkqAXlCYQ844FCmFx9No'),(34,1,'2019-04-06 18:06:17','SAnqk8GazyoDPng3H4jIsrg2BSfYSqpUj449QPZD7r9M4Lgh5Q');
/*!40000 ALTER TABLE `usuarioclaverecuperar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-07  9:36:44
