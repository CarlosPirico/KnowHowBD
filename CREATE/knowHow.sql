-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.39 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
/*!40101 SET NAMES utf8 */
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
/*!40103 SET TIME_ZONE='+00:00' */
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

-- Copiando estrutura do banco de dados para master
CREATE DATABASE IF NOT EXISTS `master` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `master`;

-- Tabela: answer
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer_text` varchar(300) DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela: level_system
CREATE TABLE IF NOT EXISTS `level_system` (
  `level` int NOT NULL,
  `min_points` int NOT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `level_system` (`level`, `min_points`) VALUES
  (1, 0),
  (2, 100);

-- Tabela: question
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(300) NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `subject_id` bigint NOT NULL DEFAULT '1', -- Mudei para bigint
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela: ranking
CREATE TABLE IF NOT EXISTS `ranking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rank_position` int NOT NULL,
  `total_points` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela: subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `subject` (`id`, `name`) VALUES
  (1, 'Programação Orientada a Objeto'),
  (2, 'Select Query Language');

-- Tabela: user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ra` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ra` (`ra`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela: answer_history
CREATE TABLE IF NOT EXISTS `answer_history` (
  `answer_history_id` int NOT NULL AUTO_INCREMENT,
  `total_points` int NOT NULL,
  `user_id` int NOT NULL,
  `answer_id` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`answer_history_id`),
  KEY `user_id` (`user_id`),
  KEY `answer_id` (`answer_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `answer_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `answer_history_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`),
  CONSTRAINT `answer_history_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `level_system` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela: exercise_history
CREATE TABLE IF NOT EXISTS `exercise_history` (
  `exercise_history_id` int NOT NULL AUTO_INCREMENT,
  `exercise_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`exercise_history_id`),
  KEY `exercise_id` (`exercise_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `exercise_history_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`),
  CONSTRAINT `exercise_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela: exercise
CREATE TABLE IF NOT EXISTS `exercise` (
  `exercise_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NOT NULL, -- Mudei para bigint
  `content` varchar(500) NOT NULL,
  `level` int NOT NULL,
  `exercise_description` varchar(150) NOT NULL,
  `solution` varchar(200) NOT NULL,
  `exercise_type` varchar(50) DEFAULT 'multiple_choice',
  PRIMARY KEY (`exercise_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`id`, `ra`, `name`, `password`) VALUES
  (7, 248700, 'Teste2 31-10-2024', 'paodequeijo');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
