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
  `answer_text` varchar(300) DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.answer: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.curso: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.excercice
CREATE TABLE IF NOT EXISTS `excercice` (
  `subject_id` int NOT NULL,
  `Tip` varchar(50) NOT NULL,
  `Content` varchar(500) NOT NULL DEFAULT '',
  `level` decimal(20,0) NOT NULL DEFAULT '1',
  `exercise_description` varchar(150) NOT NULL DEFAULT '',
  `solution` varchar(200) NOT NULL DEFAULT '',
  `exercise_type` varchar(50) DEFAULT 'multiple_choice',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.excercice: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.level_system
CREATE TABLE IF NOT EXISTS `level_system` (
  `level` int NOT NULL,
  `min_points` int NOT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.level_system: ~2 rows (aproximadamente)
INSERT INTO `level_system` (`level`, `min_points`) VALUES
	(1, 0),
	(2, 100);

-- Copiando estrutura para tabela master.question
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(300) NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `subject_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.question: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.ranking
CREATE TABLE IF NOT EXISTS `ranking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rank_position` int NOT NULL,
  `total_points` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.ranking: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.study_material
CREATE TABLE IF NOT EXISTS `study_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(500) NOT NULL DEFAULT 'eegertert',
  `object` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `class` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `attributes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `method` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `instance` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.study_material: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela master.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` tinytext,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.subject: ~2 rows (aproximadamente)
INSERT INTO `subject` (`id`, `name`, `abbreviation`, `description`) VALUES
	(1, 'Programação Orientada a Objeto', 'POO', NULL),
	(2, 'Select Query Language', 'SQL', NULL);

-- Copiando estrutura para tabela master.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ra` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ra` (`ra`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela master.user: ~5 rows (aproximadamente)
INSERT INTO `user` (`id`, `ra`, `name`, `password`, `course_id`) VALUES
	(1, 248701, 'Carlos Pirico', 'aa1bf4646de67fd9086cf6c79007026c', NULL),
	(8, 249257, 'Murilo', '7d94f57c71d653da782c037df1d38d78', NULL),
	(10, 249592, 'Taynara', '803b8c8816765e9da52433f96caef906', 1),
	(11, 465465, 'Lucas', '09e66236109f39970792d6670763e477', 2),
	(12, 987654, 'Abimael', 'fc9aaec8b2630a263a3a58be2148d76e', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
