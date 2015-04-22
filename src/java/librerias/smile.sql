CREATE DATABASE  IF NOT EXISTS `smilesystemv2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smilesystemv2`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: smilesystemv2
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acciones` (
  `idaccion` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `estado` binary(1) NOT NULL DEFAULT '1',
  `url` varchar(90) NOT NULL DEFAULT '/',
  `parent` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
INSERT INTO `acciones` VALUES (1,'Gestion Usuarios','1','',0),(2,'Modificar  Usuario','1','perfil.jsp',1),(3,'Registrar Paciente','1','registro.jsp',1),(4,'Crear Citas','1','../../GestionCitas?ci=1',1),(5,' Ingresar Historial','1','ingresarhistorial.jsp',1),(6,'Agenda Medico','1','agendamedico.jsp',1),(7,'Eliminar Usuario','1','eliminar.jsp',1),(8,'Gestion Reportes','1','',0),(9,'Reporte historial','1','Reportes.jsp',8),(10,'Reporte  de Citas','1','citas.jsp',7),(11,'Modificar Historial','1','',0),(12,'Modificar Historial Paciente','1','historial.jsp',11);
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrativos`
--

DROP TABLE IF EXISTS `administrativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrativos` (
  `Documento` bigint(20) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla usuarios, con la cardinalidad de uno a uno, siendo así llave primaria.',
  `idcargo` int(11) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla cargos.',
  PRIMARY KEY (`Documento`),
  KEY `documento_idx` (`Documento`),
  KEY `idcargo_idx` (`idcargo`),
  CONSTRAINT `documento` FOREIGN KEY (`Documento`) REFERENCES `usuarios` (`documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idcargo` FOREIGN KEY (`idcargo`) REFERENCES `cargos` (`idCargos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativos`
--

LOCK TABLES `administrativos` WRITE;
/*!40000 ALTER TABLE `administrativos` DISABLE KEYS */;
INSERT INTO `administrativos` VALUES (1024498573,1),(1081407221,2);
/*!40000 ALTER TABLE `administrativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alergias`
--

DROP TABLE IF EXISTS `alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alergias` (
  `idAlergias` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este es el único identificador de la tabla alergias, es decir su llave primaria.',
  `Descripcion` varchar(80) NOT NULL COMMENT 'En este campo se almacenara la descripción de la alergia.',
  PRIMARY KEY (`idAlergias`),
  KEY `alergia` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergias`
--

LOCK TABLES `alergias` WRITE;
/*!40000 ALTER TABLE `alergias` DISABLE KEYS */;
INSERT INTO `alergias` VALUES (3,'Acetaminofem'),(1,'Ninguna'),(4,'Penisilina'),(2,'Polvo');
/*!40000 ALTER TABLE `alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `idCargos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Esta es el único identificador de la tabla cargos, es decir es su llave primaria.',
  `Descripcion` varchar(45) NOT NULL COMMENT 'En este campo se almacenara la descripción del cargo.',
  PRIMARY KEY (`idCargos`),
  KEY `descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (2,'Auxiliar Administrativo'),(1,'Gerente');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartadental`
--

DROP TABLE IF EXISTS `cartadental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartadental` (
  `idCartaDental` int(11) NOT NULL COMMENT 'Este es el único identificador de la tabla CartaDental, es decir su llave primaria.',
  `Descripcion` varchar(45) NOT NULL COMMENT 'En este campo se almacenara la descripcion.',
  PRIMARY KEY (`idCartaDental`),
  KEY `descripcion` (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartadental`
--

LOCK TABLES `cartadental` WRITE;
/*!40000 ALTER TABLE `cartadental` DISABLE KEYS */;
INSERT INTO `cartadental` VALUES (13,'Canino'),(23,'Canino'),(33,'Canino'),(43,'Canino'),(11,'Central'),(21,'Central'),(31,'Central'),(41,'Central'),(12,'Lateral'),(22,'Lateral'),(32,'Lateral'),(42,'Lateral'),(14,'Primer Bicuspide'),(24,'Primer Bicuspide'),(34,'Primer Bicuspide'),(44,'Primer Bicuspide'),(16,'Primer Molar'),(26,'Primer Molar'),(36,'Primer Molar'),(46,'Primer Molar'),(15,'Segundo Bicuspide'),(25,'Segundo Bicuspide'),(35,'Segundo Bicuspide'),(45,'Segundo Bicuspide'),(17,'Segundo Molar'),(27,'Segundo Molar'),(37,'Segundo Molar'),(47,'Segundo Molar'),(18,'Tercer Molar'),(28,'Tercer Molar'),(38,'Tercer Molar'),(48,'Tercer Molar');
/*!40000 ALTER TABLE `cartadental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas` (
  `fecha` date NOT NULL COMMENT 'Este campo es llave primaria y foreign, en este campo se almacenara la fecha de la cita.',
  `idPaciente` bigint(20) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla pacientes, con la cardinalidad de uno a muchos, es una llave primaria y foreign.',
  `idOdontologo` bigint(20) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla odontólogos, con la cardinalidad de uno a muchos.',
  `idEstados` int(11) NOT NULL COMMENT 'Esta es el identificador para la relación con la tabla estados, donde una cita solo puede tener un estado.',
  `idJornada` int(11) NOT NULL,
  `observacion` varchar(200) NOT NULL,
  PRIMARY KEY (`fecha`,`idPaciente`),
  KEY `idOdontologo_idx` (`idOdontologo`),
  KEY `idEstado_idx` (`idEstados`),
  KEY `idPacientes_idx` (`idPaciente`),
  KEY `idJornada_idx` (`idJornada`),
  CONSTRAINT `idEstadocita` FOREIGN KEY (`idEstados`) REFERENCES `estados` (`idEstado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idOdontologocita` FOREIGN KEY (`idOdontologo`) REFERENCES `odontologos` (`idOdontologo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idPacientescita` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES ('2014-12-04',1081407241,1081407271,4,2,'proxima extracion'),('2015-03-15',1081407241,1081407271,3,2,'proxima extracion'),('2015-04-01',1081407241,1081407271,4,2,'proxima extracion'),('2015-04-13',1081407241,1081407271,2,10,''),('2015-04-15',1081407241,1081407271,2,13,''),('2015-04-17',1081407241,1081407271,2,15,''),('2015-04-21',1081407241,1081407271,2,14,''),('2015-04-22',1081407241,1081407271,2,4,''),('2015-04-23',1081407241,1081407271,2,1,''),('2015-05-01',1081407241,1081407271,3,3,'proxima extracion'),('2015-05-02',1081407241,1081407271,3,3,'proxima extracion'),('2015-05-04',1081407241,1081407271,3,3,'proxima extracion');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especializaciones`
--

DROP TABLE IF EXISTS `especializaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especializaciones` (
  `idEspecializacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este es el único identificador, es decirla llave  primaria de la tabla especializaciones.',
  `Descripcion` varchar(45) NOT NULL COMMENT 'En este campo se almacenara la descripción de la especialización del odontólogo.',
  PRIMARY KEY (`idEspecializacion`),
  KEY `especializacion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especializaciones`
--

LOCK TABLES `especializaciones` WRITE;
/*!40000 ALTER TABLE `especializaciones` DISABLE KEYS */;
INSERT INTO `especializaciones` VALUES (7,'Cirugía Maxilofacial'),(3,'Endodoncia'),(6,'Odontogeriatría'),(1,'Odontología'),(4,'Odontopediatría'),(5,'Ortodoncia'),(2,'Periodoncia');
/*!40000 ALTER TABLE `especializaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este es el único identificador de la tabla estados, es decir su llave primaria.',
  `Descripcion` varchar(45) NOT NULL COMMENT 'En este campo se almacenara la descripción del estado de la cita.',
  PRIMARY KEY (`idEstado`),
  KEY `estado` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (3,'Cancelado'),(1,'Finalizado'),(4,'No Asiste'),(2,'Reservado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornadas`
--

DROP TABLE IF EXISTS `jornadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornadas` (
  `idJornada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este es el único identificador de la tabla jornadas, es decir su llave primaria.',
  `horario` time NOT NULL COMMENT 'En este campo se almacenara el horario que tiene el odontologo.',
  PRIMARY KEY (`idJornada`),
  KEY `jornada` (`horario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornadas`
--

LOCK TABLES `jornadas` WRITE;
/*!40000 ALTER TABLE `jornadas` DISABLE KEYS */;
INSERT INTO `jornadas` VALUES (10,'01:00:00'),(11,'01:30:00'),(12,'02:00:00'),(13,'02:30:00'),(14,'03:00:00'),(15,'03:30:00'),(16,'04:00:00'),(17,'04:30:00'),(18,'05:00:00'),(19,'05:30:00'),(20,'06:00:00'),(1,'08:00:00'),(2,'08:30:00'),(3,'09:30:00'),(4,'10:00:00'),(5,'10:30:00'),(6,'11:00:00'),(7,'11:30:00'),(8,'12:00:00'),(9,'12:30:00');
/*!40000 ALTER TABLE `jornadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odontoespec`
--

DROP TABLE IF EXISTS `odontoespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odontoespec` (
  `idOdontologo` bigint(20) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla odontólogos, con su cardianalidad de uno a uno. Es una llave primaria y foreign.',
  `idEspecializacion` int(11) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla especializaciones, con la cardinalidad de que un odontólogo puede tener muchas especializaciones. \nEs una llave primaria y foreign.\n',
  PRIMARY KEY (`idOdontologo`,`idEspecializacion`),
  KEY `especializacion_idx` (`idEspecializacion`),
  CONSTRAINT `especializacion` FOREIGN KEY (`idEspecializacion`) REFERENCES `especializaciones` (`idEspecializacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `odontologo` FOREIGN KEY (`idOdontologo`) REFERENCES `odontologos` (`idOdontologo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odontoespec`
--

LOCK TABLES `odontoespec` WRITE;
/*!40000 ALTER TABLE `odontoespec` DISABLE KEYS */;
/*!40000 ALTER TABLE `odontoespec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odontologos`
--

DROP TABLE IF EXISTS `odontologos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odontologos` (
  `idOdontologo` bigint(20) NOT NULL COMMENT 'Este es el único identificador de la tabla odontólogos, es key primary y foreign.',
  `tarjetaProfesional` varchar(12) NOT NULL,
  `idjornada` int(11) NOT NULL,
  PRIMARY KEY (`idOdontologo`),
  KEY `tarjeta` (`tarjetaProfesional`),
  KEY `jornadast_idx` (`idjornada`),
  CONSTRAINT `idOdontologo` FOREIGN KEY (`idOdontologo`) REFERENCES `usuarios` (`documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jornadast` FOREIGN KEY (`idjornada`) REFERENCES `jornadas` (`idJornada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odontologos`
--

LOCK TABLES `odontologos` WRITE;
/*!40000 ALTER TABLE `odontologos` DISABLE KEYS */;
INSERT INTO `odontologos` VALUES (1081407271,'55768736',1);
/*!40000 ALTER TABLE `odontologos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientealergias`
--

DROP TABLE IF EXISTS `pacientealergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientealergias` (
  `idPaciente` bigint(20) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla pacientes, es llave primaria y foreign, su cardinalidad es de uno a muchos.',
  `idAlergia` int(11) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla alergias, es llave primaria y foreign. \nDonde un pacientes puede tener uno o muchas alergias.\n',
  PRIMARY KEY (`idPaciente`,`idAlergia`),
  KEY `Paciente_idx` (`idPaciente`),
  KEY `alergia_idx` (`idAlergia`),
  CONSTRAINT `Paciente` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alergia` FOREIGN KEY (`idAlergia`) REFERENCES `alergias` (`idAlergias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientealergias`
--

LOCK TABLES `pacientealergias` WRITE;
/*!40000 ALTER TABLE `pacientealergias` DISABLE KEYS */;
INSERT INTO `pacientealergias` VALUES (1024498576,1),(1081407241,3);
/*!40000 ALTER TABLE `pacientealergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `idPaciente` bigint(20) NOT NULL COMMENT 'Este es el único identificador de la tabla pacientes, es decir su llave primaria.',
  `idRh` int(11) NOT NULL COMMENT 'En este campo se almacenara el tipo de sangre que tiene nuestro paciente.',
  `FechaIngreso` date DEFAULT NULL COMMENT 'En este campo se almacenara la fecha de ingreso de nuestro paciente.',
  PRIMARY KEY (`idPaciente`),
  KEY `fecha` (`FechaIngreso`),
  KEY `idRh_idx` (`idRh`),
  CONSTRAINT `idPaciente` FOREIGN KEY (`idPaciente`) REFERENCES `usuarios` (`documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idRh` FOREIGN KEY (`idRh`) REFERENCES `rh` (`idRh`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1024498576,3,NULL),(1081407241,2,'1990-10-12');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfilaccion`
--

DROP TABLE IF EXISTS `perfilaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfilaccion` (
  `perfilid` int(11) NOT NULL,
  `accionid` int(11) NOT NULL,
  `estado` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`perfilid`,`accionid`),
  KEY `acciontb_idx` (`accionid`),
  CONSTRAINT `acciontb` FOREIGN KEY (`accionid`) REFERENCES `acciones` (`idaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiltb` FOREIGN KEY (`perfilid`) REFERENCES `perfiles` (`idperfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilaccion`
--

LOCK TABLES `perfilaccion` WRITE;
/*!40000 ALTER TABLE `perfilaccion` DISABLE KEYS */;
INSERT INTO `perfilaccion` VALUES (1,1,'1'),(1,2,'1'),(1,4,'1'),(1,5,'1'),(1,8,'1'),(1,9,'1'),(1,10,'1'),(2,1,'1'),(2,2,'1'),(2,4,'1'),(2,5,'1'),(2,6,'1'),(2,8,'1'),(2,9,'1'),(2,10,'1'),(2,11,'1'),(2,12,'1'),(3,1,'1'),(3,2,'1'),(3,3,'1'),(3,4,'1'),(3,5,'1'),(3,8,'1'),(3,9,'1'),(3,10,'1'),(4,1,'1'),(4,2,'1'),(4,3,'1'),(4,4,'1'),(4,5,'1'),(4,6,'1'),(4,7,'1'),(4,8,'1'),(4,9,'1'),(4,10,'1'),(4,11,'1'),(4,12,'1');
/*!40000 ALTER TABLE `perfilaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `idperfil` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idperfil`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'Paciente','1'),(2,'Medico','1'),(3,'Secretaria','1'),(4,'Administrador','1');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimientos`
--

DROP TABLE IF EXISTS `procedimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimientos` (
  `fechaProcCita` date NOT NULL COMMENT 'En este campo se almacenara la fecha del procedimiento de la cita, es una llave primaria y foreign. ',
  `idProcPac` bigint(20) NOT NULL COMMENT 'Esta es el único identificador de la tabla procedimientos, es decir la llave primaria, que a su vez también es foreign.',
  `idCartadental` int(11) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla CartaDental, su cardinalidad es de uno a muchos.',
  `idCatalogo` int(11) NOT NULL COMMENT 'Esta es la relación que se tiene con la tabla procedimientosCatálogos, su cardinalidad es de uno a muchos.',
  `observacion` varchar(200) DEFAULT NULL,
  `detalle` int(11) NOT NULL,
  KEY `idCarta_idx` (`idCartadental`),
  KEY `idCatalogo_idx` (`idCatalogo`),
  KEY `fechaPaciente` (`fechaProcCita`,`idProcPac`),
  CONSTRAINT `idCartaDental` FOREIGN KEY (`idCartadental`) REFERENCES `cartadental` (`idCartaDental`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idCatalogo` FOREIGN KEY (`idCatalogo`) REFERENCES `procedimientoscatalogos` (`idCatalogo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `procCitas` FOREIGN KEY (`fechaProcCita`, `idProcPac`) REFERENCES `citas` (`fecha`, `idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimientos`
--

LOCK TABLES `procedimientos` WRITE;
/*!40000 ALTER TABLE `procedimientos` DISABLE KEYS */;
INSERT INTO `procedimientos` VALUES ('2014-12-04',1081407241,11,2,'pendiente por observar',1),('2014-12-04',1081407241,16,1,'este es',1),('2015-03-15',1081407241,14,3,'pendiente por observar',1),('2015-04-01',1081407241,21,4,'pendiente por observar',1),('2015-04-17',1081407241,11,1,'  listo el pollo                                               \r\n                                                  \r\n                                            ',1),('2015-04-17',1081407241,12,4,'completo                                                 \r\n                                                  \r\n                                            ',1),('2015-04-17',1081407241,11,5,'HORA SI                                                \r\n                                                  \r\n                                            ',1),('2015-04-17',1081407241,11,8,'  true                                               \r\n                                                  \r\n                                            ',1),('2015-04-17',1081407241,12,3,'  rrrrr                                               \r\n                                                  \r\n                                            ',1),('2015-04-17',1081407241,11,9,' fail                                                \r\n                                                  \r\n                                            ',1),('2015-04-17',1081407241,13,8,' pro                                                \r\n                                                  \r\n                                            ',1);
/*!40000 ALTER TABLE `procedimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimientoscatalogos`
--

DROP TABLE IF EXISTS `procedimientoscatalogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimientoscatalogos` (
  `idCatalogo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Esta es el único identificador, es decir la llave primaria.',
  `procedimiento` varchar(45) NOT NULL COMMENT 'En este campo se almacenara el catalogo.',
  `duracion` time NOT NULL COMMENT 'En este campo se almacenara la duración.',
  PRIMARY KEY (`idCatalogo`),
  KEY `Procedimiento` (`procedimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimientoscatalogos`
--

LOCK TABLES `procedimientoscatalogos` WRITE;
/*!40000 ALTER TABLE `procedimientoscatalogos` DISABLE KEYS */;
INSERT INTO `procedimientoscatalogos` VALUES (1,'Resinas en foto curado','00:20:00'),(2,'Amalgamas','00:20:00'),(3,'Coronas en porcelana','00:20:00'),(4,'Parciales fijas en metal','00:20:00'),(5,'Parciales fijas en acrilico','00:20:00'),(6,'Parciales removibles en metal','00:20:00'),(7,'Parciales removibles en acrilico','00:20:00'),(8,'Exodoncias','00:20:00'),(9,'Endodoncias','00:20:00');
/*!40000 ALTER TABLE `procedimientoscatalogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rh`
--

DROP TABLE IF EXISTS `rh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh` (
  `idRh` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Esta el la llave primaria del RH',
  `Descripcion` varchar(4) NOT NULL COMMENT 'Aquí se almacenara el tipo de Rh',
  PRIMARY KEY (`idRh`),
  KEY `Rh` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rh`
--

LOCK TABLES `rh` WRITE;
/*!40000 ALTER TABLE `rh` DISABLE KEYS */;
INSERT INTO `rh` VALUES (1,'A+'),(2,'A-'),(8,'AB+'),(7,'AB-'),(5,'B+'),(6,'B-'),(3,'O+'),(4,'O-');
/*!40000 ALTER TABLE `rh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `idTelefono` varchar(15) NOT NULL COMMENT 'Esta es llave primaria y foreign,  identificador único de la tabla teléfonos.',
  `documentoid` bigint(20) NOT NULL COMMENT 'Esta es key primary y foreign, esta es la relación que se tiene con la tabla usuario, donde un usuario tiene muchos teléfonos.',
  PRIMARY KEY (`idTelefono`,`documentoid`),
  KEY `usuario` (`documentoid`),
  CONSTRAINT `DocUsu` FOREIGN KEY (`documentoid`) REFERENCES `usuarios` (`documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES ('310436543',1024498573),('321465132',1024498576),('3114365432',1081407221),('3132010029',1081407241),('3132465765',1081407271);
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `documento` bigint(20) NOT NULL COMMENT 'Se almacenara el documento del usuario, único identificador de la tabla usuarios, es decir su llave primaria.',
  `tipoDoc` varchar(10) NOT NULL DEFAULT 'CC',
  `nombres` varchar(45) NOT NULL COMMENT 'En este campo se almacenara el  nombre del usuario.',
  `apellidos` varchar(45) NOT NULL COMMENT 'En este campo se almacenara el apellido del usuario.',
  `direccion` varchar(80) NOT NULL COMMENT 'En este campo se almacenara la dirección del usuario.',
  `fechadenacimiento` date NOT NULL COMMENT 'En este campo se almacenara la fecha de nacimiento del usuario.',
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `genero` enum('F','M','O') NOT NULL,
  `correo` varchar(45) NOT NULL,
  `lugarDeNacimiento` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`documento`),
  KEY `apellidoUsuario` (`apellidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1024498573,'CC','Juan Manuel','Vargas Liz','calle 113 nO 43-54','1990-12-10','jvargas','1024498573','M','jmvargas19@misena.edu.co','Neiva','La plata'),(1024498576,'CC','jose  carlos','sdfsdfsdfdf','3212251','2015-04-12','jvargas','448ab7d8ca2414c876f09167313fd008','M','asdasd@hotmail.com','Barranquilla','Bogota'),(1081407221,'TC','Laura Camila ','Torres Daza','calle 45 no.56-43','1996-08-02','ltorres','1081407251','F','lalatorres@misena.edu.co','Bogota','Bogota'),(1081407241,'CC','Mayerly','Lopez  Bueno','calle 23 No. 54-65 sur','1996-10-08','mlopez','1081407231','F','maye19@hotmail.com','Bogota','Bogota'),(1081407271,'CC','Jose  Carlos',' Torregroza','calle 43 No. 56-65','1990-08-07','jtorregroza','1024498573','M','jctorregroza7@misena.edu.co','Bogota','Bogota');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariosperfiles`
--

DROP TABLE IF EXISTS `usuariosperfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuariosperfiles` (
  `usuarioid` bigint(20) NOT NULL,
  `perfilid` int(11) NOT NULL,
  `estado` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`usuarioid`,`perfilid`),
  KEY `documentoUsuario2_idx` (`perfilid`),
  CONSTRAINT `perfilt` FOREIGN KEY (`perfilid`) REFERENCES `perfiles` (`idperfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuariost` FOREIGN KEY (`usuarioid`) REFERENCES `usuarios` (`documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariosperfiles`
--

LOCK TABLES `usuariosperfiles` WRITE;
/*!40000 ALTER TABLE `usuariosperfiles` DISABLE KEYS */;
INSERT INTO `usuariosperfiles` VALUES (1024498573,4,'1'),(1024498576,1,'1'),(1081407221,3,'1'),(1081407241,1,'1'),(1081407271,2,'1');
/*!40000 ALTER TABLE `usuariosperfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smilesystemv2'
--
/*!50003 DROP PROCEDURE IF EXISTS `cancelarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelarCita`(in paciente bigint, in fecha date , out sal int)
begin
declare msg int default 0;

select  timestampdiff(hour,jornadas.horario,time(now())) into msg
from citas
join jornadas on citas.idJornada =jornadas.idJornada
where citas.fecha=fecha and citas.idPaciente=paciente;
if (msg<24)
then 	
update citas set idEstados=3 
where citas.fecha=fecha and citas.idPaciente= paciente;
set sal=1;
else
set sal=2;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crearProcedimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crearProcedimiento`(in idpa bigint ,in idcarta int,  in esta int,in obser varchar(60),in idpro int, out salida int)
begin
declare idc int;
insert into procedimientos (fechaProcCita,idProcPac,idCartadental,idCatalogo,observacion) values ('2014-12-04',idpa,idcarta,idpro,obser);
select idCartaDental into idc from procedimientos where fechaProcCita='2014-12-04'and idProcPac=idpa and idCartaDental=idcarta;
if (idc > 0) then
update cartadental set estado=esta where idCartaDental=idc;
set salida=1;
else
set salida=2;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-21 21:06:22
