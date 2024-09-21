-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.39 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para master
CREATE DATABASE IF NOT EXISTS `master` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `master`;

-- Copiando estrutura para tabela master.answer
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(300) DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.answer: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.excercice
CREATE TABLE IF NOT EXISTS `excercice` (
  `Subjects` varchar(500) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `Tip` varchar(50) NOT NULL,
  `Content` varchar(500) NOT NULL DEFAULT '',
  `level` decimal(20,0) NOT NULL DEFAULT '1',
  `description exercice` varchar(150) NOT NULL DEFAULT '',
  `solution` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`Subjects`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.excercice: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.question
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questions` varchar(300) NOT NULL,
  `nivel` int NOT NULL DEFAULT '1',
  `subject_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.question: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.studing more
CREATE TABLE IF NOT EXISTS `studing more` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Topics` varchar(500) NOT NULL DEFAULT 'eegertert',
  `Object_java` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Class_java` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Attributes_java` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Method_java` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Instance_java` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.studing more: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `abbreviation` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.subject: ~2 rows (aproximadamente)
INSERT INTO `subject` (`id`, `name`, `abbreviation`) VALUES
	(1, 'Programação Orientada a Objeto', 'POO'),
	(2, 'Select Query Language', 'SQL');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
