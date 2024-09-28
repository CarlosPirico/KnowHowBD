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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.answer: ~1 rows (aproximadamente)
INSERT INTO `answer` (`id`, `answer`, `question_id`) VALUES
	(1, 'sim', 1);

-- Copiando estrutura para tabela master.excercice - Exercicio
CREATE TABLE IF NOT EXISTS `excercice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL DEFAULT (0),
  `tip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `nivel` decimal(20,0) NOT NULL DEFAULT '1',
  `description exercice` varchar(150) NOT NULL DEFAULT '',
  `solution` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subject_id` (`subject_id`),
  KEY `nivel` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.excercice:
INSERT INTO `excercice` (`id`, `subject_id`, `tip`, `content`, `nivel`, `description exercice`, `solution`) VALUES
	(1, 1, 'tete', 'tete', 1, 'tata', 'tete');

-- Copiando estrutura para tabela master.history_answer - Historicos de respostas de cada usuario
CREATE TABLE IF NOT EXISTS `history_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `answer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.history_answer:
INSERT INTO `history_answer` (`id`, `user_id`, `answer_id`) VALUES
	(1, 1, 1);

-- Copiando estrutura para tabela master.history_excercice - Historicos de exercicio de cada usuario
CREATE TABLE IF NOT EXISTS `history_excercice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `excercice_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `excercice_id` (`excercice_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.history_excercice:
INSERT INTO `history_excercice` (`id`, `user_id`, `excercice_id`) VALUES
	(1, 1, 1);

-- Copiando estrutura para tabela master.question - Perguntas
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questions` varchar(300) NOT NULL,
  `nivel` int NOT NULL DEFAULT '1',
  `subject_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `nivel` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.question:
INSERT INTO `question` (`id`, `questions`, `nivel`, `subject_id`) VALUES
	(1, 'Voce sabe POO?', 1, 1);

-- Copiando estrutura para tabela master.subject - Materia
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL DEFAULT (0),
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.subject:
INSERT INTO `subject` (`id`, `name`, `abbreviation`) VALUES
	(1, 'Programação Orientada a Objeto', 'POO'),
	(2, 'Select Query Language', 'SQL');

-- Copiando estrutura para tabela master.user - Usuario
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nivel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nivel` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.user: 
INSERT INTO `user` (`id`, `name`, `password`, `nivel`) VALUES
	(1, 'Carlos Pirico', '803b8c8816765e9da52433f96caef906', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
