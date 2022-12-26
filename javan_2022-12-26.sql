# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.17-MariaDB)
# Database: javan
# Generation Time: 2022-12-26 05:55:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL DEFAULT 0,
  `person_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `price` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `family_id`, `person_id`, `name`, `price`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'Samsung Universe 9',1249,'2022-12-26 11:01:29','2022-12-26 11:01:29'),
	(2,1,2,'Samsung Galaxy Book',1499,'2022-12-26 11:02:03','2022-12-26 11:02:03'),
	(3,2,6,'iPhone 9',549,'2022-12-26 11:03:01','2022-12-26 11:03:01'),
	(4,2,7,'iPhone X',899,'2022-12-26 11:03:52','2022-12-26 11:03:52'),
	(5,1,3,'Huawei P30',499,'2022-12-26 11:04:47','2022-12-26 11:04:47'),
	(6,3,8,'Samsung Universe 9',1249,'2022-12-26 11:05:35','2022-12-26 11:05:35'),
	(7,3,9,'Huawei P30',499,'2022-12-26 11:06:38','2022-12-26 11:06:38'),
	(8,3,9,'iPhone X',899,'2022-12-26 11:06:55','2022-12-26 11:06:55'),
	(9,1,4,'Samsung Universe 9',1249,'2022-12-26 11:07:43','2022-12-26 11:07:43'),
	(10,4,10,'Samsung Galaxy Book',1499,'2022-12-26 11:08:31','2022-12-26 11:08:31'),
	(11,1,5,'Huawei P30',499,'2022-12-26 11:09:07','2022-12-26 11:09:07'),
	(12,5,11,'iPhone X',899,'2022-12-26 11:09:42','2022-12-26 11:09:42'),
	(13,5,11,'iPhone X',899,'2022-12-26 11:52:32','2022-12-26 11:52:32'),
	(14,5,11,'iPhone X',899,'2022-12-26 11:52:38','2022-12-26 11:52:38'),
	(15,5,11,'iPhone X',899,'2022-12-26 11:55:01','2022-12-26 11:55:01');

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table families
# ------------------------------------------------------------

DROP TABLE IF EXISTS `families`;

CREATE TABLE `families` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `gender` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;

INSERT INTO `families` (`id`, `parent_id`, `name`, `gender`, `created_at`, `updated_at`)
VALUES
	(1,0,'Bani',1,'2022-12-26 10:50:26','2022-12-26 10:50:26'),
	(2,1,'Budi',1,'2022-12-26 10:50:44','2022-12-26 10:50:44'),
	(3,1,'Nada',2,'2022-12-26 10:50:52','2022-12-26 10:50:52'),
	(4,1,'Andi',1,'2022-12-26 10:51:00','2022-12-26 10:51:00'),
	(5,1,'Sigit',1,'2022-12-26 10:51:28','2022-12-26 10:51:28'),
	(6,2,'Hari',1,'2022-12-26 10:51:55','2022-12-26 10:51:55'),
	(7,2,'Siti',2,'2022-12-26 10:52:03','2022-12-26 10:52:03'),
	(8,3,'Bila',2,'2022-12-26 10:52:19','2022-12-26 10:52:19'),
	(9,3,'Lesti',2,'2022-12-26 10:52:25','2022-12-26 10:52:25'),
	(10,4,'Diki',1,'2022-12-26 10:52:39','2022-12-26 10:52:39'),
	(11,5,'Doni',1,'2022-12-26 10:53:08','2022-12-26 10:53:08'),
	(12,5,'Toni',1,'2022-12-26 10:53:15','2022-12-26 10:53:15');

/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `name`, `password`, `created_at`, `updated_at`)
VALUES
	(2,'admin@admin.com','admin','$2a$14$0FWogl8clw1m7M6Nh2Kyd.ADGAttQ3XcgaEX/.UBjQBit59PYl4pe',NULL,'2022-12-26 09:13:28');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
