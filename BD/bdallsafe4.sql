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
INSERT INTO `asignaeppaproyecto` VALUES (15,2,1,'Y'),(16,6,1,'Y'),(17,11,2,'N'),(18,7,3,'Y'),(19,2,2,'Y'),(20,7,2,'Y'),(21,11,2,'Y'),(22,14,2,'Y'),(23,2,1,'Y'),(24,7,1,'Y'),(25,11,1,'Y');
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
INSERT INTO `asignatrabajadorproyecto` VALUES (1,'10.000.000-1',1,'N'),(2,'10.000.000-1',1,'Y'),(3,'77.777.777-7',3,'Y'),(4,'12.222.222-2',1,'Y'),(5,'17.779.184-9',1,'Y'),(6,'10.000.000-1',3,'Y'),(8,'11.111.111-1',4,'Y'),(9,'12.222.222-2',1,'Y'),(10,'88.888.888-8',1,'Y');
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
INSERT INTO `epp` VALUES (2,'Casco','Negro',1,'No','Y'),(3,'Casco','Verde',2,'No','Y'),(4,'Pantalon','Azul',2,'Si','Y'),(6,'Guantes','Alto Impacto',1,'Si','Y'),(7,'Antiparra','Lentes',1,'Si','Y'),(8,'Antiparra','Lentes',2,'Si','Y'),(9,'Overol','Ignifugo',2,'Si','Y'),(10,'Parka','Parka',1,'Si','Y'),(11,'Bototo','Talla 43',1,'Si','Y'),(12,'Bototo','Talla 43 Basico',2,'Si','N'),(13,'Parka2','Talla 43',1,'Si','N'),(14,'prueba','prueba',1,'Si','Y'),(15,'prueba2','prueba2',2,'Si','Y'),(16,'prueba3','prueba3',2,'No','Y'),(17,'Perro','Labrador',1,'Si','Y');
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
INSERT INTO `eppterreno` VALUES (1,'10.000.000-1','2019-02-08',1,2,'123',12,123,'123','1232','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------��\0\0\�\0\�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0J\0	\0\0\0\0\0!1Qa\"Aq���#2Rbr��$BCc��\�3S�\�ტ�\��4Tdst���\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0:\0\0\0\0\0\0!1Q\"Aaq2����\��#BR\��b�34Cr���\�\0\0\0?\0\�(-KS=7���ߊ���\�U^\�L�oǨ۶��k\�\�Q\�\�E��V\��H\�z�\�T�\0���S����\�\�����CS��\�x�\\\�|�by0Un�}\���T�                     ֱ�����_/+(����\�w���a��s�OI�5Z�4ӈ\�<?��[:\�R\\SE\r\�s�쟠\�+R�]S\�\��M\�Պxݪj��~Z\��\�J����L\�;p�\���\�32\�ƏC��zi��\�8�\�)A�\���\��p�\��\'�\�\�\�%:K�s\�ѽ\��\�\n3W�p�\��sX>�^�f\�\�$hz\��s\����\�Ư\�&j\��j\�j�rN�?�\�S\�e_\�k�\0�\�\�V\�Ҷ.t2E5�h�\���\�^+Z:\�\'\�߳\�6�\��\�?�c\��b�b�{�-T��9��J\�#�b߻nq30\�Ӧ\�\�\�w����9��0\�\�9ө�¢(\�n���i�ߪ\����eq\�F\\\�O�\�+\�f��|�\�\�\�YmCYf�^JSo571\�\�c�\n۷����\�l]^��T枱\��\�dYܑ(��Nw�:6\�I�ߙԱܹM�nh�7�UnۏY��ʌ\�U֒\�8\�S\�\�8\�p�ߴ��sQU~P�z\r�cO���\�\�/\�\Z�Z\�\�7��\�)*Cf�҆��\Z��o\�\�7�\�z7��Zi��\\!綞ߢ\�ͻ\��G\�]C\�!�g\'L��:#[��\�\\z\��4SDb�x\�F���Lϟ\�9C\�\Z���j	��@ �U$s0\�+#ֽ�ø����1,��\�j��\�\�OXs|�ͽ����\Z˩\�nm�g�\�=�B��h�~\�f{K��z���?��9�\�A- �	b\�Z/a�ϓYuWDC\�Q\�㐒Z=�mZ\�ص���8qv�\�\�j�TF\�]c\�\�\�Ne56 \�(_g�ω�3��q�j�7#�\�\��e�X�<&9K2��\�\r7.�\�<9�(�e�su3kb\�\�o���E#���6Uz���\�G^���\�+婑\�O#��\�[�o\�7s��j�\�\�رE�\"�q����؇E\�\�H��\�Զ\�\�N\Z���h\�:v�\�5��\���[nmy�gMfx�\04��ϯNN�з�=q��	\0�@ �AT\Z6p�0T�\�T\���\�`�h�q\�r\�\�\���\����6\�\�S��,^�\��\�\�ӛ�\�{�\�Z�\��\�\��7k\�Hp=j\�3�c�j��\�\�b|%\�r/\�U�OT[F\�<sc���\�=�FƧ{�W7�\���6n\�\�G�x\�\�>�=[\�\�y���L�n#	���ѴB\���\�,�nF#����l\�ޫ܏��\�\�&�\�=\�=\�\�{��\��\�&䒹\�9\�/sn�h�)�1�P\��F\��[T\�\�~E�����`>���a޲Y�\�W�?j\�I���ޞ\�\��\�\�\0\0\0\0\0\0\0,\0\Z�r\�s339����\�\Z�h$��*��gG\'\�5@������\��L5�v\��K����V�r��\�>\�\��fl\�=\�>t�|9|\ZB\�zB\�ìf\�-\�\�4Uo��!�\�\\�\�y?[q\�\�\�\�\�j3ܩ\��\�ŋY\�X�\�t�.�=9te��\r{-�<2�\�l\�vA��zN�GO`\�X\�܊#-\���U\�\�\�\�>_�\�5��O#\�\��H\�\�\�\��๓33�{\�6��LQDb!l(lBAB�\�Y�\�\�T�����m|�	kG~�\�]\r-�=^\�L\�\�vqʘ�\��7V�\�/5Ơ�\�	@@@A�\�l,UP\����\��6k\��\r�7\�\�:[#U:me��&q>��e�W!�!\08�$n\�A\��TD\�%\��u�~_%)�T-\Z}�6	��\�]==\��\��ζ\�\��%\��#�W/)\��ne\�FG��\�l\0$�>ΕL�\�t�%��f\����zZZ\�?Q��/e��?M�c�g>�\�\�\��\�BaB�^\��\�\�\��)\��@_\�u\�S���\�i~\�}j��\'\Z�]y�֔\ZP\\&U\�\�vE\��~+O\�TO\�\�?\��>K�Tbf\\\�\\\�,\�_X��\�ʪ΢�3,ͯ�\���v��i6x#�h\�d���p\�mZmΎ\�i1?�\�v�\�\��r�09CYw\Zw9�\0&���r�\�R\�Գ��D\�\�9��\�OUb^�\�\�.[���١��ИP�*�V�Аkm\�7�ه˪\�>�Th�核\n�(.4��($��*|���\�<�n���\�]�\��}Sf\�4v��1�b�\�!�f���ģwD1K/n����\�\�ӛ�\�\�{GwsCTT\�}�\�\��]n��]G\�ބ���\�;cZO�A�G){��zNq\'��\��\�\�@\�Un�\���[U\�ǫ��\'��G�~�\�!h�t$x��.\�7W\�\�SI{\�S\��Ѣ|A][s�\"_8\�[\��7)�\0T���,*\�U���A0P\\iA0PLPFIAq\�\�\\z��D\�3T\�C\�\�,�\�v\�+\��\��\�g3�֬\�\�ۦ���XP\� 虙��.�i\�;\��ގ;\�\��\�U�q\��uI��\�x�\��\�zv�k�]Uf2!�\�\�w�\�\�n\�(J\rk:\�Q\�3�\0��[U\�G���\�j�\0\�~�\�\0�\'��HĪ\n-鹯\�4ᒘ�P��g\�u۩ߙn\�j\�4���\Z}۴ގUp�X�\�Ѿ\����\�K�\�(&H��L9��J\�5|\�b▂P\r���<\�\�=��xZ���h�>\�\�\����fySޟۗ\�®���\�\'*\��Fe����\0�\�r\�\��\�<��_�\�z\�\�M\�R\�xźWYŻ\��Pz\�h�AS\�U?s-\�\�\�JQ\Z�s\��4\r\�S�\�\�Zڟv=]̓Ǫ|�\�l\n\�z���E\�R���\�\���\�#���M�\�]�S�\�\�ej+�*����\�S��U��\�\�>\��U����7iF��5\����p]H��\�>r\�V\�+�Ls{\"��Ȃ\�z	�\�&\n\n��A\�&\n	i\0	&��u\07�\"3\�+8I\��D��\����\'�\0*�\����D\�\�\�X\�{\�q��~\�f\���n�DN]3Sڮvt��\��^\�\�mi\'�1\��^\�ѝ=t�\��WE\�Y�\�w�ᠸ\�\0�\�s.T�\�\�k�\\zɺ\\nA�g:��S\��\�#\�u�\�+SS<b�aQ�k��\�\��\�(��1*��h��E�U��\�dfT�7rR\�\�\�u͵�]\�t�㷯=���\'���6ljiߣߏ����թ\�\Z��\�psk�n\�\r஄Nx\�\�UL\�3MQ������\�\�ȂbD �z�z]�L��QR>�\�f\�|m�w����\Z��\�\���dM���㏄t�?��]j=FK�r�\�9\�h͵g%�\�\�d/�\�C�l?�˧�\\�+n[\�4U�b~�˻�\�|\�\�=���\Z}�\�\�,jM\Zy�\�;\�Y8=�,\��\�^�gv�ܓz����=�B\�\�W/c�mvZzc\�x�XpV\'B% T-�\�l�ue[�r\�d�SODlç7t/\'D�i����Y-ݪ�M\rnϵ��\�®��qt�+�*l��������v\��Kv�\�\��ڝ���\�c1\�?\�6U�\�\\l\�.�d*f/��`�\�\r>����Dz=�X\�M幦\�j5�:xu��z9�T\�\���\�GzzcpX\�w\�>�۽���i]�U|#�=f\�\���خ��]|#\�>\�R\�]\�ʷD\�[�\�.�ʷPez��\�H\�[\�G#\�y�x�18\�\nܦ.Q4O)�|_JQ\�6h㙚\�,m��N��\�Nc0�u\�sn���q8�#P�E\�4�:�\�\�Ԁ���_�{�0���o�h$��\�\�q�\�o\�ة][�̶4�{k�\����r�\����q%\�\'y[�\�\�\�0�\�t�am\�t�	\�4�a;\�\�&\r\�B���\��0�v��^�꧔�\�\�l^�\���Y�r���\�񿋢m�,�\�iձ��\�&?tݜ\n\�\�\�\"!�~��6.�:�X\�ܧ��ZJ�K}V�Ocl*�]\\\�kA��9����X�\�\r\�\�t�-��r-%��;\�\�\�V蜗P��t[.ɚLlMH\�W9L\�o^Iθ\�K^i\�\��^\�i{;�v9U��\�R\�\�/aG�}��=�<\�/M0��\�$\�;\�l\\M(���\�M\�\��:OP\�޴\�W�8��\�z^ΎҮs�kK� ]A�n�\�4�	\�WI�i&\r\�t�	\�4�`\�4�	\�WI0��C�am�t�	��Q���C�\�I(Z*WI\�T9Bw�E��n�m\�[%�PUGPۖ��F���&�\�\�׹VZ�\�5:�[�~R\�\�\�2X\�$n�\�c�\�ӱu\"bc0�\�tUESMQ��l��;\�{�\�J�rsǦ\�0\�s\\\��d+�����ן[dp?�A��{0]��\�\�\�ܘ�r;�\��}\\�j=�P� �#%\�\"\n�E\0�U �\�9T9F��^+H9F�\�P�T�r�����m\�t�	\�m�\r��H|�bM3\�v�Y\�z}\�\�;w\�=���\'����w\�#��\�G\�?=>\�\�\�v\\kK_\�o��\'�\��\�\�\r&\'P-fL\�(�q\�\�\�i-�⧬\�\�{K��\rL�m\�\n!B�\n\"�.�M$���nM�$����VnDsd\�r~�]m��\�\�91�\�*\�QUk-SΦR��v\�=\�?�^Җ)\�6��\�\�\�V~��\���;XG�J\�I�~S�\0w5����r�\0\"v�ĭ���\�	3y^6r�e�\�;ZV��k͍�\�,B+�R\�\�:c_\�J�WOVju�j�f\Zh�â����\\\�\�\�U�\�*\��, ��H9F�\�L/��\�J\�(\�\�̖NaƮ����k3\Z\��\�{\Z\n�\�U���\�Z������\r�X\0\0�\�]7��\�\�$@����\�\'\rU �����\�6\�\��8\��݅a�Fc.�\�\�vww\'��\\i�2�D�*̢J�9��8RnD=�~5G�\�7\�w5��=�8��\�]6\�/#\�2�ҝØ\�\���uWѥ^�\�\\�6\�?�!h\�c=Ɔ�\�v��g-Y���\�V`\�jC0�9\�\�䄺\�%\��$\�{\�\�}WV�5\�\�+\�p\�Ձuօ�mD���+��t��dt�\�\r2\�|���G7\�ծ\�͵�\�X��\�)5\�NY�a��6)\�{C�\\\�J\�4��4��\r\�<\�K%5Lq�Z�1��In\�\�\�8\�Ň\�B\�M\��m\�\�]����\�}]%\�Y\�D/\�\"��\�ݭ�qY��*t,\�m\�Ô�����2(J��bR\�L-�\���\�\�9LFF\�\Z{�x6��lQ�\�\�\�gc\�~ζ�\\!\�A\\b�F\�<g7#��\�cC�\�\�G\�?i���éi]��>OS�����{\���i%co\�\�ܭ�UK.@\�N�\�U\�\Z�.\�\��\����\�g\�o���U���e\�MUp��\�C���\�2׆j�%�ed���\ZJ���4\��a��Qު ��J�GGL̙cײ�70���\�\��\�f8uk\�s-���\�1�?]�w{A��4\�\'\r���b��3\�Ôe��\�ɿ\r;7-�F\�\�1ϗ�.\0�{�`\0vٷ��#\�\Z�fg0���0��)\�`oG;\�\��tGb\�\�c%���lRR��+\�%\�h�a�\�VDE>���>��Z)��x�՚��\�V5u\�\�<a\�ja|Otr4�\�6sN\�V\�7^��Tfb��,\�r\'%\�\�*D-�bm�<�\��\�\��+QF�᭫\�S��3\����\r$pE1428\�\�1�`hz#J�����\�+\�Uy1\\6\Z�_O;�H\�9�\�AD\�LbW�r�uET\�|���Q�8\�\�\�˹��;\�l�l<v�v\�G�\�먿���4�!�\�!�T\��\�^�E�v��W\'\'UT�ntp\�\�Q�a�\'R\�UKD3��`,S+\�<Ywn]o�G��\�O�)�E\�v\\�\�%���]\�\�Q\�\��\'\n�!�1�@�\�s�OA�B��@���	���umX=�=v1\�=!jy:�e_��8�\0\�\��p��^������/<ԡ\�i�Ո��\"\�\�S$by9.uh\Z\����\�N>�tt�~���b|z:\�*�\\��Y�Jjl\��X��0�B&�$�\�\�\�\�\�wছsT�R����\�\��FL\��>i\�\�`5�\�\�r��\�=\'\�)�)�C\�_�]\���e��D�6���\�p!\�p8���\"bq\�\�+�AOQ�-�,�\�\�At<:Y\�q�a�\�x:6v�Q�\�>m�$�0\�$mTZ�<�Ú�\�\�\�\�5�\�M<\�E\�.bh�{�ZתX!�Rj�\�R\�.T��ܷi~\\Ѭ�9m\�\�/���)�V�v\\\Z�_��-]X��\�u�5�0ncsB\�\�6|p{\Z\�Raq�E&%���\�\�b-�q\Z��3�b=\�}!4��6ec��\�j��1o�V����{Z\�H�Y�\�)˛g?\'*+YT��5\�ֆ41��\�$\0.F\�\�oI30ٷ]4U�T�\�fZ\�$\�d�O	pg�I���B\�k�z�\�ќb\�~\�EI�(Xأ`�X�\Z֎\0,�sj�j�\�<WԪ          \�s�I\�R�\�k�v����\rDwr\�nx�(e�-�R�UI��1J���3[+��\�v�\�#�\�ql; \���:Yb>Lɚ_Q��t-u\�\r��-m�+�V��\�\�=\Z�EY\�\�8e�7\\��\�\�\�Y�q�(ViL�J���,�\�\'4�t\�\Z׉�m\�p\�y\'��\�\�\�\�t\�_����y1\�3�\�2G\n�\n*jK�:Z׸lt�^G\r\"W>\�{�\�I\�\�˙���E���&FH�s\�:G\�\�h���\�h)��`�<��]�������������\�_J&�H��F9�W{j�z&�˓\��s�p��\�\� \�r�18�\�qM�\��\�Q�Va/[\'U��\�P�/Tu*�N^�U(\�W�R�\�j`\�Bp�\�\������\�&����Z l�U9�&��G�\�x\�f\�\�۳or���uoU��eP@@@@@@@@@@@@A�\�v\0d�D\"\�\�0mx8�\�+SQfg�K5��\�ZP+E�[��d!\�ԕJ�+n�z[\�F\�r�\�\�*0eq��Ta9LW\r\�7L��\�\�t\�\��1�N闖lTt)�Q�g&��\�\�\�Lci��k\�C�ѽoi�qޖ�<!�������������������\r�\�\�$�\\R�\�k>\�v��r\�5�\�,�ܚZ�nI\�Gr�ٛ\�~|�Z�i��\\Y�\�2\�TSI��\�\�y�h\�ذM3\�x��K!\�W)ºJL\ZHa]>(`\�8�\0e\�\��1���\rs�\nb&y�\�\�Q\�\\��M\�!��\"\�\�ӧ�>Lsr�l\�VJC	��\�\Z�\�\��z{n��驧��b�\�\�&¶�!�|*�ON�\�\�\��\�Rm\�<\������3D~��\�/o��~�\�D��uZvIQ��p\�O\�W�\��\'��A�T�q�\��\0�~�\�C��u�/D>���\�?�����]^�pjVz4����m�\���Q\n\�uO�\�ր,\0p\"��                                                                    �\�','123','Y'),(2,'10.000.000-1','2019-02-08',1,2,'123',6,555,'16','1232','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------��\0\0\�\0\�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0J\0	\0\0\0\0\0!1Qa\"Aq���#2Rbr��$BCc��\�3S�\�ტ�\��4Tdst���\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0:\0\0\0\0\0\0!1Q\"Aaq2����\��#BR\��b�34Cr���\�\0\0\0?\0\�(-KS=7���ߊ���\�U^\�L�oǨ۶��k\�\�Q\�\�E��V\��H\�z�\�T�\0���S����\�\�����CS��\�x�\\\�|�by0Un�}\���T�                     ֱ�����_/+(����\�w���a��s�OI�5Z�4ӈ\�<?��[:\�R\\SE\r\�s�쟠\�+R�]S\�\��M\�Պxݪj��~Z\��\�J����L\�;p�\���\�32\�ƏC��zi��\�8�\�)A�\���\��p�\��\'�\�\�\�%:K�s\�ѽ\��\�\n3W�p�\��sX>�^�f\�\�$hz\��s\����\�Ư\�&j\��j\�j�rN�?�\�S\�e_\�k�\0�\�\�V\�Ҷ.t2E5�h�\���\�^+Z:\�\'\�߳\�6�\��\�?�c\��b�b�{�-T��9��J\�#�b߻nq30\�Ӧ\�\�\�w����9��0\�\�9ө�¢(\�n���i�ߪ\����eq\�F\\\�O�\�+\�f��|�\�\�\�YmCYf�^JSo571\�\�c�\n۷����\�l]^��T枱\��\�dYܑ(��Nw�:6\�I�ߙԱܹM�nh�7�UnۏY��ʌ\�U֒\�8\�S\�\�8\�p�ߴ��sQU~P�z\r�cO���\�\�/\�\Z�Z\�\�7��\�)*Cf�҆��\Z��o\�\�7�\�z7��Zi��\\!綞ߢ\�ͻ\��G\�]C\�!�g\'L��:#[��\�\\z\��4SDb�x\�F���Lϟ\�9C\�\Z���j	��@ �U$s0\�+#ֽ�ø����1,��\�j��\�\�OXs|�ͽ����\Z˩\�nm�g�\�=�B��h�~\�f{K��z���?��9�\�A- �	b\�Z/a�ϓYuWDC\�Q\�㐒Z=�mZ\�ص���8qv�\�\�j�TF\�]c\�\�\�Ne56 \�(_g�ω�3��q�j�7#�\�\��e�X�<&9K2��\�\r7.�\�<9�(�e�su3kb\�\�o���E#���6Uz���\�G^���\�+婑\�O#��\�[�o\�7s��j�\�\�رE�\"�q����؇E\�\�H��\�Զ\�\�N\Z���h\�:v�\�5��\���[nmy�gMfx�\04��ϯNN�з�=q��	\0�@ �AT\Z6p�0T�\�T\���\�`�h�q\�r\�\�\���\����6\�\�S��,^�\��\�\�ӛ�\�{�\�Z�\��\�\��7k\�Hp=j\�3�c�j��\�\�b|%\�r/\�U�OT[F\�<sc���\�=�FƧ{�W7�\���6n\�\�G�x\�\�>�=[\�\�y���L�n#	���ѴB\���\�,�nF#����l\�ޫ܏��\�\�&�\�=\�=\�\�{��\��\�&䒹\�9\�/sn�h�)�1�P\��F\��[T\�\�~E�����`>���a޲Y�\�W�?j\�I���ޞ\�\��\�\�\0\0\0\0\0\0\0,\0\Z�r\�s339����\�\Z�h$��*��gG\'\�5@������\��L5�v\��K����V�r��\�>\�\��fl\�=\�>t�|9|\ZB\�zB\�ìf\�-\�\�4Uo��!�\�\\�\�y?[q\�\�\�\�\�j3ܩ\��\�ŋY\�X�\�t�.�=9te��\r{-�<2�\�l\�vA��zN�GO`\�X\�܊#-\���U\�\�\�\�>_�\�5��O#\�\��H\�\�\�\��๓33�{\�6��LQDb!l(lBAB�\�Y�\�\�T�����m|�	kG~�\�]\r-�=^\�L\�\�vqʘ�\��7V�\�/5Ơ�\�	@@@A�\�l,UP\����\��6k\��\r�7\�\�:[#U:me��&q>��e�W!�!\08�$n\�A\��TD\�%\��u�~_%)�T-\Z}�6	��\�]==\��\��ζ\�\��%\��#�W/)\��ne\�FG��\�l\0$�>ΕL�\�t�%��f\����zZZ\�?Q��/e��?M�c�g>�\�\�\��\�BaB�^\��\�\�\��)\��@_\�u\�S���\�i~\�}j��\'\Z�]y�֔\ZP\\&U\�\�vE\��~+O\�TO\�\�?\��>K�Tbf\\\�\\\�,\�_X��\�ʪ΢�3,ͯ�\���v��i6x#�h\�d���p\�mZmΎ\�i1?�\�v�\�\��r�09CYw\Zw9�\0&���r�\�R\�Գ��D\�\�9��\�OUb^�\�\�.[���١��ИP�*�V�Аkm\�7�ه˪\�>�Th�核\n�(.4��($��*|���\�<�n���\�]�\��}Sf\�4v��1�b�\�!�f���ģwD1K/n����\�\�ӛ�\�\�{GwsCTT\�}�\�\��]n��]G\�ބ���\�;cZO�A�G){��zNq\'��\��\�\�@\�Un�\���[U\�ǫ��\'��G�~�\�!h�t$x��.\�7W\�\�SI{\�S\��Ѣ|A][s�\"_8\�[\��7)�\0T���,*\�U���A0P\\iA0PLPFIAq\�\�\\z��D\�3T\�C\�\�,�\�v\�+\��\��\�g3�֬\�\�ۦ���XP\� 虙��.�i\�;\��ގ;\�\��\�U�q\��uI��\�x�\��\�zv�k�]Uf2!�\�\�w�\�\�n\�(J\rk:\�Q\�3�\0��[U\�G���\�j�\0\�~�\�\0�\'��HĪ\n-鹯\�4ᒘ�P��g\�u۩ߙn\�j\�4���\Z}۴ގUp�X�\�Ѿ\����\�K�\�(&H��L9��J\�5|\�b▂P\r���<\�\�=��xZ���h�>\�\�\����fySޟۗ\�®���\�\'*\��Fe����\0�\�r\�\��\�<��_�\�z\�\�M\�R\�xźWYŻ\��Pz\�h�AS\�U?s-\�\�\�JQ\Z�s\��4\r\�S�\�\�Zڟv=]̓Ǫ|�\�l\n\�z���E\�R���\�\���\�#���M�\�]�S�\�\�ej+�*����\�S��U��\�\�>\��U����7iF��5\����p]H��\�>r\�V\�+�Ls{\"��Ȃ\�z	�\�&\n\n��A\�&\n	i\0	&��u\07�\"3\�+8I\��D��\����\'�\0*�\����D\�\�\�X\�{\�q��~\�f\���n�DN]3Sڮvt��\��^\�\�mi\'�1\��^\�ѝ=t�\��WE\�Y�\�w�ᠸ\�\0�\�s.T�\�\�k�\\zɺ\\nA�g:��S\��\�#\�u�\�+SS<b�aQ�k��\�\��\�(��1*��h��E�U��\�dfT�7rR\�\�\�u͵�]\�t�㷯=���\'���6ljiߣߏ����թ\�\Z��\�psk�n\�\r஄Nx\�\�UL\�3MQ������\�\�ȂbD �z�z]�L��QR>�\�f\�|m�w����\Z��\�\���dM���㏄t�?��]j=FK�r�\�9\�h͵g%�\�\�d/�\�C�l?�˧�\\�+n[\�4U�b~�˻�\�|\�\�=���\Z}�\�\�,jM\Zy�\�;\�Y8=�,\��\�^�gv�ܓz����=�B\�\�W/c�mvZzc\�x�XpV\'B% T-�\�l�ue[�r\�d�SODlç7t/\'D�i����Y-ݪ�M\rnϵ��\�®��qt�+�*l��������v\��Kv�\�\��ڝ���\�c1\�?\�6U�\�\\l\�.�d*f/��`�\�\r>����Dz=�X\�M幦\�j5�:xu��z9�T\�\���\�GzzcpX\�w\�>�۽���i]�U|#�=f\�\���خ��]|#\�>\�R\�]\�ʷD\�[�\�.�ʷPez��\�H\�[\�G#\�y�x�18\�\nܦ.Q4O)�|_JQ\�6h㙚\�,m��N��\�Nc0�u\�sn���q8�#P�E\�4�:�\�\�Ԁ���_�{�0���o�h$��\�\�q�\�o\�ة][�̶4�{k�\����r�\����q%\�\'y[�\�\�\�0�\�t�am\�t�	\�4�a;\�\�&\r\�B���\��0�v��^�꧔�\�\�l^�\���Y�r���\�񿋢m�,�\�iձ��\�&?tݜ\n\�\�\�\"!�~��6.�:�X\�ܧ��ZJ�K}V�Ocl*�]\\\�kA��9����X�\�\r\�\�t�-��r-%��;\�\�\�V蜗P��t[.ɚLlMH\�W9L\�o^Iθ\�K^i\�\��^\�i{;�v9U��\�R\�\�/aG�}��=�<\�/M0��\�$\�;\�l\\M(���\�M\�\��:OP\�޴\�W�8��\�z^ΎҮs�kK� ]A�n�\�4�	\�WI�i&\r\�t�	\�4�`\�4�	\�WI0��C�am�t�	��Q���C�\�I(Z*WI\�T9Bw�E��n�m\�[%�PUGPۖ��F���&�\�\�׹VZ�\�5:�[�~R\�\�\�2X\�$n�\�c�\�ӱu\"bc0�\�tUESMQ��l��;\�{�\�J�rsǦ\�0\�s\\\��d+�����ן[dp?�A��{0]��\�\�\�ܘ�r;�\��}\\�j=�P� �#%\�\"\n�E\0�U �\�9T9F��^+H9F�\�P�T�r�����m\�t�	\�m�\r��H|�bM3\�v�Y\�z}\�\�;w\�=���\'����w\�#��\�G\�?=>\�\�\�v\\kK_\�o��\'�\��\�\�\r&\'P-fL\�(�q\�\�\�i-�⧬\�\�{K��\rL�m\�\n!B�\n\"�.�M$���nM�$����VnDsd\�r~�]m��\�\�91�\�*\�QUk-SΦR��v\�=\�?�^Җ)\�6��\�\�\�V~��\���;XG�J\�I�~S�\0w5����r�\0\"v�ĭ���\�	3y^6r�e�\�;ZV��k͍�\�,B+�R\�\�:c_\�J�WOVju�j�f\Zh�â����\\\�\�\�U�\�*\��, ��H9F�\�L/��\�J\�(\�\�̖NaƮ����k3\Z\��\�{\Z\n�\�U���\�Z������\r�X\0\0�\�]7��\�\�$@����\�\'\rU �����\�6\�\��8\��݅a�Fc.�\�\�vww\'��\\i�2�D�*̢J�9��8RnD=�~5G�\�7\�w5��=�8��\�]6\�/#\�2�ҝØ\�\���uWѥ^�\�\\�6\�?�!h\�c=Ɔ�\�v��g-Y���\�V`\�jC0�9\�\�䄺\�%\��$\�{\�\�}WV�5\�\�+\�p\�Ձuօ�mD���+��t��dt�\�\r2\�|���G7\�ծ\�͵�\�X��\�)5\�NY�a��6)\�{C�\\\�J\�4��4��\r\�<\�K%5Lq�Z�1��In\�\�\�8\�Ň\�B\�M\��m\�\�]����\�}]%\�Y\�D/\�\"��\�ݭ�qY��*t,\�m\�Ô�����2(J��bR\�L-�\���\�\�9LFF\�\Z{�x6��lQ�\�\�\�gc\�~ζ�\\!\�A\\b�F\�<g7#��\�cC�\�\�G\�?i���éi]��>OS�����{\���i%co\�\�ܭ�UK.@\�N�\�U\�\Z�.\�\��\����\�g\�o���U���e\�MUp��\�C���\�2׆j�%�ed���\ZJ���4\��a��Qު ��J�GGL̙cײ�70���\�\��\�f8uk\�s-���\�1�?]�w{A��4\�\'\r���b��3\�Ôe��\�ɿ\r;7-�F\�\�1ϗ�.\0�{�`\0vٷ��#\�\Z�fg0���0��)\�`oG;\�\��tGb\�\�c%���lRR��+\�%\�h�a�\�VDE>���>��Z)��x�՚��\�V5u\�\�<a\�ja|Otr4�\�6sN\�V\�7^��Tfb��,\�r\'%\�\�*D-�bm�<�\��\�\��+QF�᭫\�S��3\����\r$pE1428\�\�1�`hz#J�����\�+\�Uy1\\6\Z�_O;�H\�9�\�AD\�LbW�r�uET\�|���Q�8\�\�\�˹��;\�l�l<v�v\�G�\�먿���4�!�\�!�T\��\�^�E�v��W\'\'UT�ntp\�\�Q�a�\'R\�UKD3��`,S+\�<Ywn]o�G��\�O�)�E\�v\\�\�%���]\�\�Q\�\��\'\n�!�1�@�\�s�OA�B��@���	���umX=�=v1\�=!jy:�e_��8�\0\�\��p��^������/<ԡ\�i�Ո��\"\�\�S$by9.uh\Z\����\�N>�tt�~���b|z:\�*�\\��Y�Jjl\��X��0�B&�$�\�\�\�\�\�wছsT�R����\�\��FL\��>i\�\�`5�\�\�r��\�=\'\�)�)�C\�_�]\���e��D�6���\�p!\�p8���\"bq\�\�+�AOQ�-�,�\�\�At<:Y\�q�a�\�x:6v�Q�\�>m�$�0\�$mTZ�<�Ú�\�\�\�\�5�\�M<\�E\�.bh�{�ZתX!�Rj�\�R\�.T��ܷi~\\Ѭ�9m\�\�/���)�V�v\\\Z�_��-]X��\�u�5�0ncsB\�\�6|p{\Z\�Raq�E&%���\�\�b-�q\Z��3�b=\�}!4��6ec��\�j��1o�V����{Z\�H�Y�\�)˛g?\'*+YT��5\�ֆ41��\�$\0.F\�\�oI30ٷ]4U�T�\�fZ\�$\�d�O	pg�I���B\�k�z�\�ќb\�~\�EI�(Xأ`�X�\Z֎\0,�sj�j�\�<WԪ          \�s�I\�R�\�k�v����\rDwr\�nx�(e�-�R�UI��1J���3[+��\�v�\�#�\�ql; \���:Yb>Lɚ_Q��t-u\�\r��-m�+�V��\�\�=\Z�EY\�\�8e�7\\��\�\�\�Y�q�(ViL�J���,�\�\'4�t\�\Z׉�m\�p\�y\'��\�\�\�\�t\�_����y1\�3�\�2G\n�\n*jK�:Z׸lt�^G\r\"W>\�{�\�I\�\�˙���E���&FH�s\�:G\�\�h���\�h)��`�<��]�������������\�_J&�H��F9�W{j�z&�˓\��s�p��\�\� \�r�18�\�qM�\��\�Q�Va/[\'U��\�P�/Tu*�N^�U(\�W�R�\�j`\�Bp�\�\������\�&����Z l�U9�&��G�\�x\�f\�\�۳or���uoU��eP@@@@@@@@@@@@A�\�v\0d�D\"\�\�0mx8�\�+SQfg�K5��\�ZP+E�[��d!\�ԕJ�+n�z[\�F\�r�\�\�*0eq��Ta9LW\r\�7L��\�\�t\�\��1�N闖lTt)�Q�g&��\�\�\�Lci��k\�C�ѽoi�qޖ�<!�������������������\r�\�\�$�\\R�\�k>\�v��r\�5�\�,�ܚZ�nI\�Gr�ٛ\�~|�Z�i��\\Y�\�2\�TSI��\�\�y�h\�ذM3\�x��K!\�W)ºJL\ZHa]>(`\�8�\0e\�\��1���\rs�\nb&y�\�\�Q\�\\��M\�!��\"\�\�ӧ�>Lsr�l\�VJC	��\�\Z�\�\��z{n��驧��b�\�\�&¶�!�|*�ON�\�\�\��\�Rm\�<\������3D~��\�/o��~�\�D��uZvIQ��p\�O\�W�\��\'��A�T�q�\��\0�~�\�C��u�/D>���\�?�����]^�pjVz4����m�\���Q\n\�uO�\�ր,\0p\"��                                                                    �\�','123','Y'),(3,'11.111.111-1','2019-02-06',2,3,'123',6,555,'16','1232','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------��\0\0\�\0\�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0J\0	\0\0\0\0\0!1Qa\"Aq���#2Rbr��$BCc��\�3S�\�ტ�\��4Tdst���\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0:\0\0\0\0\0\0!1Q\"Aaq2����\��#BR\��b�34Cr���\�\0\0\0?\0\�(-KS=7���ߊ���\�U^\�L�oǨ۶��k\�\�Q\�\�E��V\��H\�z�\�T�\0���S����\�\�����CS��\�x�\\\�|�by0Un�}\���T�                     ֱ�����_/+(����\�w���a��s�OI�5Z�4ӈ\�<?��[:\�R\\SE\r\�s�쟠\�+R�]S\�\��M\�Պxݪj��~Z\��\�J����L\�;p�\���\�32\�ƏC��zi��\�8�\�)A�\���\��p�\��\'�\�\�\�%:K�s\�ѽ\��\�\n3W�p�\��sX>�^�f\�\�$hz\��s\����\�Ư\�&j\��j\�j�rN�?�\�S\�e_\�k�\0�\�\�V\�Ҷ.t2E5�h�\���\�^+Z:\�\'\�߳\�6�\��\�?�c\��b�b�{�-T��9��J\�#�b߻nq30\�Ӧ\�\�\�w����9��0\�\�9ө�¢(\�n���i�ߪ\����eq\�F\\\�O�\�+\�f��|�\�\�\�YmCYf�^JSo571\�\�c�\n۷����\�l]^��T枱\��\�dYܑ(��Nw�:6\�I�ߙԱܹM�nh�7�UnۏY��ʌ\�U֒\�8\�S\�\�8\�p�ߴ��sQU~P�z\r�cO���\�\�/\�\Z�Z\�\�7��\�)*Cf�҆��\Z��o\�\�7�\�z7��Zi��\\!綞ߢ\�ͻ\��G\�]C\�!�g\'L��:#[��\�\\z\��4SDb�x\�F���Lϟ\�9C\�\Z���j	��@ �U$s0\�+#ֽ�ø����1,��\�j��\�\�OXs|�ͽ����\Z˩\�nm�g�\�=�B��h�~\�f{K��z���?��9�\�A- �	b\�Z/a�ϓYuWDC\�Q\�㐒Z=�mZ\�ص���8qv�\�\�j�TF\�]c\�\�\�Ne56 \�(_g�ω�3��q�j�7#�\�\��e�X�<&9K2��\�\r7.�\�<9�(�e�su3kb\�\�o���E#���6Uz���\�G^���\�+婑\�O#��\�[�o\�7s��j�\�\�رE�\"�q����؇E\�\�H��\�Զ\�\�N\Z���h\�:v�\�5��\���[nmy�gMfx�\04��ϯNN�з�=q��	\0�@ �AT\Z6p�0T�\�T\���\�`�h�q\�r\�\�\���\����6\�\�S��,^�\��\�\�ӛ�\�{�\�Z�\��\�\��7k\�Hp=j\�3�c�j��\�\�b|%\�r/\�U�OT[F\�<sc���\�=�FƧ{�W7�\���6n\�\�G�x\�\�>�=[\�\�y���L�n#	���ѴB\���\�,�nF#����l\�ޫ܏��\�\�&�\�=\�=\�\�{��\��\�&䒹\�9\�/sn�h�)�1�P\��F\��[T\�\�~E�����`>���a޲Y�\�W�?j\�I���ޞ\�\��\�\�\0\0\0\0\0\0\0,\0\Z�r\�s339����\�\Z�h$��*��gG\'\�5@������\��L5�v\��K����V�r��\�>\�\��fl\�=\�>t�|9|\ZB\�zB\�ìf\�-\�\�4Uo��!�\�\\�\�y?[q\�\�\�\�\�j3ܩ\��\�ŋY\�X�\�t�.�=9te��\r{-�<2�\�l\�vA��zN�GO`\�X\�܊#-\���U\�\�\�\�>_�\�5��O#\�\��H\�\�\�\��๓33�{\�6��LQDb!l(lBAB�\�Y�\�\�T�����m|�	kG~�\�]\r-�=^\�L\�\�vqʘ�\��7V�\�/5Ơ�\�	@@@A�\�l,UP\����\��6k\��\r�7\�\�:[#U:me��&q>��e�W!�!\08�$n\�A\��TD\�%\��u�~_%)�T-\Z}�6	��\�]==\��\��ζ\�\��%\��#�W/)\��ne\�FG��\�l\0$�>ΕL�\�t�%��f\����zZZ\�?Q��/e��?M�c�g>�\�\�\��\�BaB�^\��\�\�\��)\��@_\�u\�S���\�i~\�}j��\'\Z�]y�֔\ZP\\&U\�\�vE\��~+O\�TO\�\�?\��>K�Tbf\\\�\\\�,\�_X��\�ʪ΢�3,ͯ�\���v��i6x#�h\�d���p\�mZmΎ\�i1?�\�v�\�\��r�09CYw\Zw9�\0&���r�\�R\�Գ��D\�\�9��\�OUb^�\�\�.[���١��ИP�*�V�Аkm\�7�ه˪\�>�Th�核\n�(.4��($��*|���\�<�n���\�]�\��}Sf\�4v��1�b�\�!�f���ģwD1K/n����\�\�ӛ�\�\�{GwsCTT\�}�\�\��]n��]G\�ބ���\�;cZO�A�G){��zNq\'��\��\�\�@\�Un�\���[U\�ǫ��\'��G�~�\�!h�t$x��.\�7W\�\�SI{\�S\��Ѣ|A][s�\"_8\�[\��7)�\0T���,*\�U���A0P\\iA0PLPFIAq\�\�\\z��D\�3T\�C\�\�,�\�v\�+\��\��\�g3�֬\�\�ۦ���XP\� 虙��.�i\�;\��ގ;\�\��\�U�q\��uI��\�x�\��\�zv�k�]Uf2!�\�\�w�\�\�n\�(J\rk:\�Q\�3�\0��[U\�G���\�j�\0\�~�\�\0�\'��HĪ\n-鹯\�4ᒘ�P��g\�u۩ߙn\�j\�4���\Z}۴ގUp�X�\�Ѿ\����\�K�\�(&H��L9��J\�5|\�b▂P\r���<\�\�=��xZ���h�>\�\�\����fySޟۗ\�®���\�\'*\��Fe����\0�\�r\�\��\�<��_�\�z\�\�M\�R\�xźWYŻ\��Pz\�h�AS\�U?s-\�\�\�JQ\Z�s\��4\r\�S�\�\�Zڟv=]̓Ǫ|�\�l\n\�z���E\�R���\�\���\�#���M�\�]�S�\�\�ej+�*����\�S��U��\�\�>\��U����7iF��5\����p]H��\�>r\�V\�+�Ls{\"��Ȃ\�z	�\�&\n\n��A\�&\n	i\0	&��u\07�\"3\�+8I\��D��\����\'�\0*�\����D\�\�\�X\�{\�q��~\�f\���n�DN]3Sڮvt��\��^\�\�mi\'�1\��^\�ѝ=t�\��WE\�Y�\�w�ᠸ\�\0�\�s.T�\�\�k�\\zɺ\\nA�g:��S\��\�#\�u�\�+SS<b�aQ�k��\�\��\�(��1*��h��E�U��\�dfT�7rR\�\�\�u͵�]\�t�㷯=���\'���6ljiߣߏ����թ\�\Z��\�psk�n\�\r஄Nx\�\�UL\�3MQ������\�\�ȂbD �z�z]�L��QR>�\�f\�|m�w����\Z��\�\���dM���㏄t�?��]j=FK�r�\�9\�h͵g%�\�\�d/�\�C�l?�˧�\\�+n[\�4U�b~�˻�\�|\�\�=���\Z}�\�\�,jM\Zy�\�;\�Y8=�,\��\�^�gv�ܓz����=�B\�\�W/c�mvZzc\�x�XpV\'B% T-�\�l�ue[�r\�d�SODlç7t/\'D�i����Y-ݪ�M\rnϵ��\�®��qt�+�*l��������v\��Kv�\�\��ڝ���\�c1\�?\�6U�\�\\l\�.�d*f/��`�\�\r>����Dz=�X\�M幦\�j5�:xu��z9�T\�\���\�GzzcpX\�w\�>�۽���i]�U|#�=f\�\���خ��]|#\�>\�R\�]\�ʷD\�[�\�.�ʷPez��\�H\�[\�G#\�y�x�18\�\nܦ.Q4O)�|_JQ\�6h㙚\�,m��N��\�Nc0�u\�sn���q8�#P�E\�4�:�\�\�Ԁ���_�{�0���o�h$��\�\�q�\�o\�ة][�̶4�{k�\����r�\����q%\�\'y[�\�\�\�0�\�t�am\�t�	\�4�a;\�\�&\r\�B���\��0�v��^�꧔�\�\�l^�\���Y�r���\�񿋢m�,�\�iձ��\�&?tݜ\n\�\�\�\"!�~��6.�:�X\�ܧ��ZJ�K}V�Ocl*�]\\\�kA��9����X�\�\r\�\�t�-��r-%��;\�\�\�V蜗P��t[.ɚLlMH\�W9L\�o^Iθ\�K^i\�\��^\�i{;�v9U��\�R\�\�/aG�}��=�<\�/M0��\�$\�;\�l\\M(���\�M\�\��:OP\�޴\�W�8��\�z^ΎҮs�kK� ]A�n�\�4�	\�WI�i&\r\�t�	\�4�`\�4�	\�WI0��C�am�t�	��Q���C�\�I(Z*WI\�T9Bw�E��n�m\�[%�PUGPۖ��F���&�\�\�׹VZ�\�5:�[�~R\�\�\�2X\�$n�\�c�\�ӱu\"bc0�\�tUESMQ��l��;\�{�\�J�rsǦ\�0\�s\\\��d+�����ן[dp?�A��{0]��\�\�\�ܘ�r;�\��}\\�j=�P� �#%\�\"\n�E\0�U �\�9T9F��^+H9F�\�P�T�r�����m\�t�	\�m�\r��H|�bM3\�v�Y\�z}\�\�;w\�=���\'����w\�#��\�G\�?=>\�\�\�v\\kK_\�o��\'�\��\�\�\r&\'P-fL\�(�q\�\�\�i-�⧬\�\�{K��\rL�m\�\n!B�\n\"�.�M$���nM�$����VnDsd\�r~�]m��\�\�91�\�*\�QUk-SΦR��v\�=\�?�^Җ)\�6��\�\�\�V~��\���;XG�J\�I�~S�\0w5����r�\0\"v�ĭ���\�	3y^6r�e�\�;ZV��k͍�\�,B+�R\�\�:c_\�J�WOVju�j�f\Zh�â����\\\�\�\�U�\�*\��, ��H9F�\�L/��\�J\�(\�\�̖NaƮ����k3\Z\��\�{\Z\n�\�U���\�Z������\r�X\0\0�\�]7��\�\�$@����\�\'\rU �����\�6\�\��8\��݅a�Fc.�\�\�vww\'��\\i�2�D�*̢J�9��8RnD=�~5G�\�7\�w5��=�8��\�]6\�/#\�2�ҝØ\�\���uWѥ^�\�\\�6\�?�!h\�c=Ɔ�\�v��g-Y���\�V`\�jC0�9\�\�䄺\�%\��$\�{\�\�}WV�5\�\�+\�p\�Ձuօ�mD���+��t��dt�\�\r2\�|���G7\�ծ\�͵�\�X��\�)5\�NY�a��6)\�{C�\\\�J\�4��4��\r\�<\�K%5Lq�Z�1��In\�\�\�8\�Ň\�B\�M\��m\�\�]����\�}]%\�Y\�D/\�\"��\�ݭ�qY��*t,\�m\�Ô�����2(J��bR\�L-�\���\�\�9LFF\�\Z{�x6��lQ�\�\�\�gc\�~ζ�\\!\�A\\b�F\�<g7#��\�cC�\�\�G\�?i���éi]��>OS�����{\���i%co\�\�ܭ�UK.@\�N�\�U\�\Z�.\�\��\����\�g\�o���U���e\�MUp��\�C���\�2׆j�%�ed���\ZJ���4\��a��Qު ��J�GGL̙cײ�70���\�\��\�f8uk\�s-���\�1�?]�w{A��4\�\'\r���b��3\�Ôe��\�ɿ\r;7-�F\�\�1ϗ�.\0�{�`\0vٷ��#\�\Z�fg0���0��)\�`oG;\�\��tGb\�\�c%���lRR��+\�%\�h�a�\�VDE>���>��Z)��x�՚��\�V5u\�\�<a\�ja|Otr4�\�6sN\�V\�7^��Tfb��,\�r\'%\�\�*D-�bm�<�\��\�\��+QF�᭫\�S��3\����\r$pE1428\�\�1�`hz#J�����\�+\�Uy1\\6\Z�_O;�H\�9�\�AD\�LbW�r�uET\�|���Q�8\�\�\�˹��;\�l�l<v�v\�G�\�먿���4�!�\�!�T\��\�^�E�v��W\'\'UT�ntp\�\�Q�a�\'R\�UKD3��`,S+\�<Ywn]o�G��\�O�)�E\�v\\�\�%���]\�\�Q\�\��\'\n�!�1�@�\�s�OA�B��@���	���umX=�=v1\�=!jy:�e_��8�\0\�\��p��^������/<ԡ\�i�Ո��\"\�\�S$by9.uh\Z\����\�N>�tt�~���b|z:\�*�\\��Y�Jjl\��X��0�B&�$�\�\�\�\�\�wছsT�R����\�\��FL\��>i\�\�`5�\�\�r��\�=\'\�)�)�C\�_�]\���e��D�6���\�p!\�p8���\"bq\�\�+�AOQ�-�,�\�\�At<:Y\�q�a�\�x:6v�Q�\�>m�$�0\�$mTZ�<�Ú�\�\�\�\�5�\�M<\�E\�.bh�{�ZתX!�Rj�\�R\�.T��ܷi~\\Ѭ�9m\�\�/���)�V�v\\\Z�_��-]X��\�u�5�0ncsB\�\�6|p{\Z\�Raq�E&%���\�\�b-�q\Z��3�b=\�}!4��6ec��\�j��1o�V����{Z\�H�Y�\�)˛g?\'*+YT��5\�ֆ41��\�$\0.F\�\�oI30ٷ]4U�T�\�fZ\�$\�d�O	pg�I���B\�k�z�\�ќb\�~\�EI�(Xأ`�X�\Z֎\0,�sj�j�\�<WԪ          \�s�I\�R�\�k�v����\rDwr\�nx�(e�-�R�UI��1J���3[+��\�v�\�#�\�ql; \���:Yb>Lɚ_Q��t-u\�\r��-m�+�V��\�\�=\Z�EY\�\�8e�7\\��\�\�\�Y�q�(ViL�J���,�\�\'4�t\�\Z׉�m\�p\�y\'��\�\�\�\�t\�_����y1\�3�\�2G\n�\n*jK�:Z׸lt�^G\r\"W>\�{�\�I\�\�˙���E���&FH�s\�:G\�\�h���\�h)��`�<��]�������������\�_J&�H��F9�W{j�z&�˓\��s�p��\�\� \�r�18�\�qM�\��\�Q�Va/[\'U��\�P�/Tu*�N^�U(\�W�R�\�j`\�Bp�\�\������\�&����Z l�U9�&��G�\�x\�f\�\�۳or���uoU��eP@@@@@@@@@@@@A�\�v\0d�D\"\�\�0mx8�\�+SQfg�K5��\�ZP+E�[��d!\�ԕJ�+n�z[\�F\�r�\�\�*0eq��Ta9LW\r\�7L��\�\�t\�\��1�N闖lTt)�Q�g&��\�\�\�Lci��k\�C�ѽoi�qޖ�<!�������������������\r�\�\�$�\\R�\�k>\�v��r\�5�\�,�ܚZ�nI\�Gr�ٛ\�~|�Z�i��\\Y�\�2\�TSI��\�\�y�h\�ذM3\�x��K!\�W)ºJL\ZHa]>(`\�8�\0e\�\��1���\rs�\nb&y�\�\�Q\�\\��M\�!��\"\�\�ӧ�>Lsr�l\�VJC	��\�\Z�\�\��z{n��驧��b�\�\�&¶�!�|*�ON�\�\�\��\�Rm\�<\������3D~��\�/o��~�\�D��uZvIQ��p\�O\�W�\��\'��A�T�q�\��\0�~�\�C��u�/D>���\�?�����]^�pjVz4����m�\���Q\n\�uO�\�ր,\0p\"��                                                                    �\�','123','Y'),(4,'10.000.000-1','2019-02-07',2,2,'123',6,555,'16','1232','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\r( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z-% &----+---------+----------+-+----------------------��\0\0\�\0\�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0J\0	\0\0\0\0\0!1Qa\"Aq���#2Rbr��$BCc��\�3S�\�ტ�\��4Tdst���\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0:\0\0\0\0\0\0!1Q\"Aaq2����\��#BR\��b�34Cr���\�\0\0\0?\0\�(-KS=7���ߊ���\�U^\�L�oǨ۶��k\�\�Q\�\�E��V\��H\�z�\�T�\0���S����\�\�����CS��\�x�\\\�|�by0Un�}\���T�                     ֱ�����_/+(����\�w���a��s�OI�5Z�4ӈ\�<?��[:\�R\\SE\r\�s�쟠\�+R�]S\�\��M\�Պxݪj��~Z\��\�J����L\�;p�\���\�32\�ƏC��zi��\�8�\�)A�\���\��p�\��\'�\�\�\�%:K�s\�ѽ\��\�\n3W�p�\��sX>�^�f\�\�$hz\��s\����\�Ư\�&j\��j\�j�rN�?�\�S\�e_\�k�\0�\�\�V\�Ҷ.t2E5�h�\���\�^+Z:\�\'\�߳\�6�\��\�?�c\��b�b�{�-T��9��J\�#�b߻nq30\�Ӧ\�\�\�w����9��0\�\�9ө�¢(\�n���i�ߪ\����eq\�F\\\�O�\�+\�f��|�\�\�\�YmCYf�^JSo571\�\�c�\n۷����\�l]^��T枱\��\�dYܑ(��Nw�:6\�I�ߙԱܹM�nh�7�UnۏY��ʌ\�U֒\�8\�S\�\�8\�p�ߴ��sQU~P�z\r�cO���\�\�/\�\Z�Z\�\�7��\�)*Cf�҆��\Z��o\�\�7�\�z7��Zi��\\!綞ߢ\�ͻ\��G\�]C\�!�g\'L��:#[��\�\\z\��4SDb�x\�F���Lϟ\�9C\�\Z���j	��@ �U$s0\�+#ֽ�ø����1,��\�j��\�\�OXs|�ͽ����\Z˩\�nm�g�\�=�B��h�~\�f{K��z���?��9�\�A- �	b\�Z/a�ϓYuWDC\�Q\�㐒Z=�mZ\�ص���8qv�\�\�j�TF\�]c\�\�\�Ne56 \�(_g�ω�3��q�j�7#�\�\��e�X�<&9K2��\�\r7.�\�<9�(�e�su3kb\�\�o���E#���6Uz���\�G^���\�+婑\�O#��\�[�o\�7s��j�\�\�رE�\"�q����؇E\�\�H��\�Զ\�\�N\Z���h\�:v�\�5��\���[nmy�gMfx�\04��ϯNN�з�=q��	\0�@ �AT\Z6p�0T�\�T\���\�`�h�q\�r\�\�\���\����6\�\�S��,^�\��\�\�ӛ�\�{�\�Z�\��\�\��7k\�Hp=j\�3�c�j��\�\�b|%\�r/\�U�OT[F\�<sc���\�=�FƧ{�W7�\���6n\�\�G�x\�\�>�=[\�\�y���L�n#	���ѴB\���\�,�nF#����l\�ޫ܏��\�\�&�\�=\�=\�\�{��\��\�&䒹\�9\�/sn�h�)�1�P\��F\��[T\�\�~E�����`>���a޲Y�\�W�?j\�I���ޞ\�\��\�\�\0\0\0\0\0\0\0,\0\Z�r\�s339����\�\Z�h$��*��gG\'\�5@������\��L5�v\��K����V�r��\�>\�\��fl\�=\�>t�|9|\ZB\�zB\�ìf\�-\�\�4Uo��!�\�\\�\�y?[q\�\�\�\�\�j3ܩ\��\�ŋY\�X�\�t�.�=9te��\r{-�<2�\�l\�vA��zN�GO`\�X\�܊#-\���U\�\�\�\�>_�\�5��O#\�\��H\�\�\�\��๓33�{\�6��LQDb!l(lBAB�\�Y�\�\�T�����m|�	kG~�\�]\r-�=^\�L\�\�vqʘ�\��7V�\�/5Ơ�\�	@@@A�\�l,UP\����\��6k\��\r�7\�\�:[#U:me��&q>��e�W!�!\08�$n\�A\��TD\�%\��u�~_%)�T-\Z}�6	��\�]==\��\��ζ\�\��%\��#�W/)\��ne\�FG��\�l\0$�>ΕL�\�t�%��f\����zZZ\�?Q��/e��?M�c�g>�\�\�\��\�BaB�^\��\�\�\��)\��@_\�u\�S���\�i~\�}j��\'\Z�]y�֔\ZP\\&U\�\�vE\��~+O\�TO\�\�?\��>K�Tbf\\\�\\\�,\�_X��\�ʪ΢�3,ͯ�\���v��i6x#�h\�d���p\�mZmΎ\�i1?�\�v�\�\��r�09CYw\Zw9�\0&���r�\�R\�Գ��D\�\�9��\�OUb^�\�\�.[���١��ИP�*�V�Аkm\�7�ه˪\�>�Th�核\n�(.4��($��*|���\�<�n���\�]�\��}Sf\�4v��1�b�\�!�f���ģwD1K/n����\�\�ӛ�\�\�{GwsCTT\�}�\�\��]n��]G\�ބ���\�;cZO�A�G){��zNq\'��\��\�\�@\�Un�\���[U\�ǫ��\'��G�~�\�!h�t$x��.\�7W\�\�SI{\�S\��Ѣ|A][s�\"_8\�[\��7)�\0T���,*\�U���A0P\\iA0PLPFIAq\�\�\\z��D\�3T\�C\�\�,�\�v\�+\��\��\�g3�֬\�\�ۦ���XP\� 虙��.�i\�;\��ގ;\�\��\�U�q\��uI��\�x�\��\�zv�k�]Uf2!�\�\�w�\�\�n\�(J\rk:\�Q\�3�\0��[U\�G���\�j�\0\�~�\�\0�\'��HĪ\n-鹯\�4ᒘ�P��g\�u۩ߙn\�j\�4���\Z}۴ގUp�X�\�Ѿ\����\�K�\�(&H��L9��J\�5|\�b▂P\r���<\�\�=��xZ���h�>\�\�\����fySޟۗ\�®���\�\'*\��Fe����\0�\�r\�\��\�<��_�\�z\�\�M\�R\�xźWYŻ\��Pz\�h�AS\�U?s-\�\�\�JQ\Z�s\��4\r\�S�\�\�Zڟv=]̓Ǫ|�\�l\n\�z���E\�R���\�\���\�#���M�\�]�S�\�\�ej+�*����\�S��U��\�\�>\��U����7iF��5\����p]H��\�>r\�V\�+�Ls{\"��Ȃ\�z	�\�&\n\n��A\�&\n	i\0	&��u\07�\"3\�+8I\��D��\����\'�\0*�\����D\�\�\�X\�{\�q��~\�f\���n�DN]3Sڮvt��\��^\�\�mi\'�1\��^\�ѝ=t�\��WE\�Y�\�w�ᠸ\�\0�\�s.T�\�\�k�\\zɺ\\nA�g:��S\��\�#\�u�\�+SS<b�aQ�k��\�\��\�(��1*��h��E�U��\�dfT�7rR\�\�\�u͵�]\�t�㷯=���\'���6ljiߣߏ����թ\�\Z��\�psk�n\�\r஄Nx\�\�UL\�3MQ������\�\�ȂbD �z�z]�L��QR>�\�f\�|m�w����\Z��\�\���dM���㏄t�?��]j=FK�r�\�9\�h͵g%�\�\�d/�\�C�l?�˧�\\�+n[\�4U�b~�˻�\�|\�\�=���\Z}�\�\�,jM\Zy�\�;\�Y8=�,\��\�^�gv�ܓz����=�B\�\�W/c�mvZzc\�x�XpV\'B% T-�\�l�ue[�r\�d�SODlç7t/\'D�i����Y-ݪ�M\rnϵ��\�®��qt�+�*l��������v\��Kv�\�\��ڝ���\�c1\�?\�6U�\�\\l\�.�d*f/��`�\�\r>����Dz=�X\�M幦\�j5�:xu��z9�T\�\���\�GzzcpX\�w\�>�۽���i]�U|#�=f\�\���خ��]|#\�>\�R\�]\�ʷD\�[�\�.�ʷPez��\�H\�[\�G#\�y�x�18\�\nܦ.Q4O)�|_JQ\�6h㙚\�,m��N��\�Nc0�u\�sn���q8�#P�E\�4�:�\�\�Ԁ���_�{�0���o�h$��\�\�q�\�o\�ة][�̶4�{k�\����r�\����q%\�\'y[�\�\�\�0�\�t�am\�t�	\�4�a;\�\�&\r\�B���\��0�v��^�꧔�\�\�l^�\���Y�r���\�񿋢m�,�\�iձ��\�&?tݜ\n\�\�\�\"!�~��6.�:�X\�ܧ��ZJ�K}V�Ocl*�]\\\�kA��9����X�\�\r\�\�t�-��r-%��;\�\�\�V蜗P��t[.ɚLlMH\�W9L\�o^Iθ\�K^i\�\��^\�i{;�v9U��\�R\�\�/aG�}��=�<\�/M0��\�$\�;\�l\\M(���\�M\�\��:OP\�޴\�W�8��\�z^ΎҮs�kK� ]A�n�\�4�	\�WI�i&\r\�t�	\�4�`\�4�	\�WI0��C�am�t�	��Q���C�\�I(Z*WI\�T9Bw�E��n�m\�[%�PUGPۖ��F���&�\�\�׹VZ�\�5:�[�~R\�\�\�2X\�$n�\�c�\�ӱu\"bc0�\�tUESMQ��l��;\�{�\�J�rsǦ\�0\�s\\\��d+�����ן[dp?�A��{0]��\�\�\�ܘ�r;�\��}\\�j=�P� �#%\�\"\n�E\0�U �\�9T9F��^+H9F�\�P�T�r�����m\�t�	\�m�\r��H|�bM3\�v�Y\�z}\�\�;w\�=���\'����w\�#��\�G\�?=>\�\�\�v\\kK_\�o��\'�\��\�\�\r&\'P-fL\�(�q\�\�\�i-�⧬\�\�{K��\rL�m\�\n!B�\n\"�.�M$���nM�$����VnDsd\�r~�]m��\�\�91�\�*\�QUk-SΦR��v\�=\�?�^Җ)\�6��\�\�\�V~��\���;XG�J\�I�~S�\0w5����r�\0\"v�ĭ���\�	3y^6r�e�\�;ZV��k͍�\�,B+�R\�\�:c_\�J�WOVju�j�f\Zh�â����\\\�\�\�U�\�*\��, ��H9F�\�L/��\�J\�(\�\�̖NaƮ����k3\Z\��\�{\Z\n�\�U���\�Z������\r�X\0\0�\�]7��\�\�$@����\�\'\rU �����\�6\�\��8\��݅a�Fc.�\�\�vww\'��\\i�2�D�*̢J�9��8RnD=�~5G�\�7\�w5��=�8��\�]6\�/#\�2�ҝØ\�\���uWѥ^�\�\\�6\�?�!h\�c=Ɔ�\�v��g-Y���\�V`\�jC0�9\�\�䄺\�%\��$\�{\�\�}WV�5\�\�+\�p\�Ձuօ�mD���+��t��dt�\�\r2\�|���G7\�ծ\�͵�\�X��\�)5\�NY�a��6)\�{C�\\\�J\�4��4��\r\�<\�K%5Lq�Z�1��In\�\�\�8\�Ň\�B\�M\��m\�\�]����\�}]%\�Y\�D/\�\"��\�ݭ�qY��*t,\�m\�Ô�����2(J��bR\�L-�\���\�\�9LFF\�\Z{�x6��lQ�\�\�\�gc\�~ζ�\\!\�A\\b�F\�<g7#��\�cC�\�\�G\�?i���éi]��>OS�����{\���i%co\�\�ܭ�UK.@\�N�\�U\�\Z�.\�\��\����\�g\�o���U���e\�MUp��\�C���\�2׆j�%�ed���\ZJ���4\��a��Qު ��J�GGL̙cײ�70���\�\��\�f8uk\�s-���\�1�?]�w{A��4\�\'\r���b��3\�Ôe��\�ɿ\r;7-�F\�\�1ϗ�.\0�{�`\0vٷ��#\�\Z�fg0���0��)\�`oG;\�\��tGb\�\�c%���lRR��+\�%\�h�a�\�VDE>���>��Z)��x�՚��\�V5u\�\�<a\�ja|Otr4�\�6sN\�V\�7^��Tfb��,\�r\'%\�\�*D-�bm�<�\��\�\��+QF�᭫\�S��3\����\r$pE1428\�\�1�`hz#J�����\�+\�Uy1\\6\Z�_O;�H\�9�\�AD\�LbW�r�uET\�|���Q�8\�\�\�˹��;\�l�l<v�v\�G�\�먿���4�!�\�!�T\��\�^�E�v��W\'\'UT�ntp\�\�Q�a�\'R\�UKD3��`,S+\�<Ywn]o�G��\�O�)�E\�v\\�\�%���]\�\�Q\�\��\'\n�!�1�@�\�s�OA�B��@���	���umX=�=v1\�=!jy:�e_��8�\0\�\��p��^������/<ԡ\�i�Ո��\"\�\�S$by9.uh\Z\����\�N>�tt�~���b|z:\�*�\\��Y�Jjl\��X��0�B&�$�\�\�\�\�\�wছsT�R����\�\��FL\��>i\�\�`5�\�\�r��\�=\'\�)�)�C\�_�]\���e��D�6���\�p!\�p8���\"bq\�\�+�AOQ�-�,�\�\�At<:Y\�q�a�\�x:6v�Q�\�>m�$�0\�$mTZ�<�Ú�\�\�\�\�5�\�M<\�E\�.bh�{�ZתX!�Rj�\�R\�.T��ܷi~\\Ѭ�9m\�\�/���)�V�v\\\Z�_��-]X��\�u�5�0ncsB\�\�6|p{\Z\�Raq�E&%���\�\�b-�q\Z��3�b=\�}!4��6ec��\�j��1o�V����{Z\�H�Y�\�)˛g?\'*+YT��5\�ֆ41��\�$\0.F\�\�oI30ٷ]4U�T�\�fZ\�$\�d�O	pg�I���B\�k�z�\�ќb\�~\�EI�(Xأ`�X�\Z֎\0,�sj�j�\�<WԪ          \�s�I\�R�\�k�v����\rDwr\�nx�(e�-�R�UI��1J���3[+��\�v�\�#�\�ql; \���:Yb>Lɚ_Q��t-u\�\r��-m�+�V��\�\�=\Z�EY\�\�8e�7\\��\�\�\�Y�q�(ViL�J���,�\�\'4�t\�\Z׉�m\�p\�y\'��\�\�\�\�t\�_����y1\�3�\�2G\n�\n*jK�:Z׸lt�^G\r\"W>\�{�\�I\�\�˙���E���&FH�s\�:G\�\�h���\�h)��`�<��]�������������\�_J&�H��F9�W{j�z&�˓\��s�p��\�\� \�r�18�\�qM�\��\�Q�Va/[\'U��\�P�/Tu*�N^�U(\�W�R�\�j`\�Bp�\�\������\�&����Z l�U9�&��G�\�x\�f\�\�۳or���uoU��eP@@@@@@@@@@@@A�\�v\0d�D\"\�\�0mx8�\�+SQfg�K5��\�ZP+E�[��d!\�ԕJ�+n�z[\�F\�r�\�\�*0eq��Ta9LW\r\�7L��\�\�t\�\��1�N闖lTt)�Q�g&��\�\�\�Lci��k\�C�ѽoi�qޖ�<!�������������������\r�\�\�$�\\R�\�k>\�v��r\�5�\�,�ܚZ�nI\�Gr�ٛ\�~|�Z�i��\\Y�\�2\�TSI��\�\�y�h\�ذM3\�x��K!\�W)ºJL\ZHa]>(`\�8�\0e\�\��1���\rs�\nb&y�\�\�Q\�\\��M\�!��\"\�\�ӧ�>Lsr�l\�VJC	��\�\Z�\�\��z{n��驧��b�\�\�&¶�!�|*�ON�\�\�\��\�Rm\�<\������3D~��\�/o��~�\�D��uZvIQ��p\�O\�W�\��\'��A�T�q�\��\0�~�\�C��u�/D>���\�?�����]^�pjVz4����m�\���Q\n\�uO�\�ր,\0p\"��                                                                    �\�','123','Y');
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
INSERT INTO `parametro` VALUES (4,'Correo del remitente del mail de recuperacion de clave de usuario',1,'alvaro.sanmartinh@gmail.com','Y'),(5,'Asunto del mail de recuperacion de clave de usuario',2,'Enlace para cambiar clave AllSafe','Y'),(6,'Cuerpo del mail de recuperacion de clave de usuario',3,'Hola {{3}} <br><br> Te hemos enviado este correo porque has solicitado recuperar tu clave de AllSafe. <br> Si has sido tú, debes seguir <a href=\'http://{{0}}/AllSafe/CambiarClave.jsp?codigo={{1}}&id={{2}}\'>este enlace</a> para poder reestablecer tu clave. <br><br> Si el enlace no funciona, copia y pega esto en tu navegador: <br><br>http://{{0}}/AllSafe/CambiarClave.jsp?codigo={{1}}&id={{2}}<br><br>Si no has solicitado el cambio de tu clave, alguien puede estar intentando acceder a tu cuenta, te recomendamos usar una clave segura y no compartirla con nadie.','Y'),(7,'Clave del correo del remitente del mail de recuperacion de clave de usuario',4,'clave','Y'),(8,'Ip y Puerto del servidor de aplicaciones (Puede ser un DNS)',5,'localhost:8080','Y');
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
INSERT INTO `persona` VALUES ('10.000.000-1',NULL,'Diez','pa','ma','2019-01-01','Paraguayo',1,'correo@correo.cl',1,1,1,1,1,'Y'),('11.111.111-1',123,'Diego','Muñoz','Muñoz2','11-06-1982','Chilena',1,'alvaro.sanmartinh@gmail.com',1,1,1,1,1,'Y'),('12.222.222-2',NULL,'Once','Once','Once','2019-01-01','Argentino',1,'correo@correo.cl',1,1,1,1,1,'Y'),('17.779.184-9',NULL,'Nadia','Aranguiz','Fernandez','1991-01-26','Chilena',1,'correo@correo.cl',1,1,1,1,1,'Y'),('22.222.222-2',NULL,'Elhana','Machado','Ma','2019-01-01','Brazileña',1,'correo@correo.cl',1,1,1,1,1,'Y'),('33.333.333-3',NULL,'Tres','Tres3','TresIII','2019-01-01','Chilena',1,'correo@correo.cl',1,1,1,1,1,'Y'),('44.444.444-4',NULL,'Cuatro','Cuatro','Cuatro','2019-01-01','Chilena',1,'correo@correo.cl',1,1,1,1,1,'Y'),('55.555.555-5',NULL,'Jose','Beltran','h','2019-01-01','Mexicano',1,'correo@correo.cl',1,1,1,1,1,'Y'),('66.666.666-6',NULL,'Seis','Seis','nuk','2019-01-01','Boliviano',1,'correo@correo.cl',1,1,1,1,1,'Y'),('77.777.777-7',NULL,'Siete','SietePa','SieteMa','2019-01-01','Colombiano',1,'correo@correo.cl',1,1,1,1,1,'Y'),('88.888.888-8',NULL,'Ocho','Pa','Ma','2019-01-01','Argentino',1,'correo@correo.cl',1,1,1,1,1,'Y'),('99.999.999-9',NULL,'Nueve','Pa','Ma','2019-01-01','Norteamericano',1,'correo@correo.cl',1,1,1,1,1,'Y');
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
INSERT INTO `proyecto` VALUES (1,125000,'Nueva Aldea','Nueva Aldea','2019-01-01','2019-01-31',1,1,'N'),(2,126000,'Candelaria','Rancagua','2019-01-01','2019-01-31',1,1,'N'),(3,127000,'Proyecto 3','Tercer Proyecto','2019-01-01','2019-01-30',1,1,'Y'),(4,128000,'Proy 8 ','Rancagua','2019-01-01','2019-03-31',1,1,'Y');
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
INSERT INTO `tipodecarga` VALUES (1,'Carga Inicial','Y'),(2,'Devolución ToolCenter','Y');
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
INSERT INTO `tipoepp` VALUES (1,'Estándar','Y'),(2,'No Estándar','Y');
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

-- Dump completed on 2019-04-10 22:02:12
