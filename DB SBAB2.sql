CREATE DATABASE  IF NOT EXISTS `bibliotecasbac`;
USE `bibliotecasbac`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: bibliotecasbac
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--



--
-- Table structure for table `bibliotecario`
--

DROP TABLE IF EXISTS `bibliotecario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `bibliotecario` (
  `nome_bib` varchar(50) NOT NULL,
  `matricula_bib` bigint(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `telefone_bib` varchar(20) NOT NULL,
  `chave` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula_bib`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecario`
--



--
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `devolucao` (
  `id_dev` bigint(20) NOT NULL,
  `data_dev` char(12) NOT NULL,
  `cod_tomb` bigint(20) NOT NULL,
  `matricula_bib` bigint(20) NOT NULL,
  `matricula_leitor` bigint(20) NOT NULL,
  PRIMARY KEY (`id_dev`,`data_dev`),
  KEY `matricula_leitor` (`matricula_leitor`),
  KEY `cod_tomb` (`cod_tomb`),
  KEY `matricula_bib` (`matricula_bib`),
  CONSTRAINT `devolucao_ibfk_1` FOREIGN KEY (`matricula_leitor`) REFERENCES `leitor` (`matricula_leitor`),
  CONSTRAINT `devolucao_ibfk_2` FOREIGN KEY (`cod_tomb`) REFERENCES `item` (`cod_tomb`),
  CONSTRAINT `devolucao_ibfk_3` FOREIGN KEY (`matricula_bib`) REFERENCES `bibliotecario` (`matricula_bib`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `emprestimos` (
  `id_emp` int(11) NOT NULL AUTO_INCREMENT,
  `dat_emp` char(12) NOT NULL,
  `dat_dev` char(12) NOT NULL,
  `cod_tomb` bigint(20) NOT NULL,
  `matricula_bib` bigint(20) NOT NULL,
  `matricula_leitor` bigint(20) NOT NULL,
  PRIMARY KEY (`id_emp`),
  KEY `matricula_leitor` (`matricula_leitor`),
  KEY `cod_tomb` (`cod_tomb`),
  KEY `matricula_bib` (`matricula_bib`),
  CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`matricula_leitor`) REFERENCES `leitor` (`matricula_leitor`),
  CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`cod_tomb`) REFERENCES `item` (`cod_tomb`),
  CONSTRAINT `emprestimos_ibfk_3` FOREIGN KEY (`matricula_bib`) REFERENCES `bibliotecario` (`matricula_bib`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--



--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `titulo` varchar(50) DEFAULT NULL,
  `origem` varchar(50) NOT NULL,
  `data_aq` char(12) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `cod_tomb` bigint(20) NOT NULL,
  `editora` varchar(50) NOT NULL,
  `satus` bit(1) NOT NULL,
  PRIMARY KEY (`cod_tomb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--


--
-- Table structure for table `leitor`
--

DROP TABLE IF EXISTS `leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `leitor` (
  `nome_leitor` varchar(50) NOT NULL,
  `matricula_leitor` bigint(20) NOT NULL,
  `email_leitor` varchar(60) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `satus` bit(1) NOT NULL,
  `turma` varchar(20) DEFAULT NULL,
  `telefone_leitor` varchar(20) NOT NULL,
  PRIMARY KEY (`matricula_leitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--



--
-- Dumping events for database 'bibliotecasbac'
--

--
-- Dumping routines for database 'bibliotecasbac'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-03 20:38:54
