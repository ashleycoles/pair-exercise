# ************************************************************
# Sequel Ace SQL dump
# Version 20031
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.27)
# Database: beatles
# Generation Time: 2022-03-29 14:40:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table basket_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `basket_products`;

CREATE TABLE `basket_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table order_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_products`;

CREATE TABLE `order_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `img_url` varchar(250) DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `sale_active` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `cost`, `price`, `description`, `qty`, `img_url`, `sale_price`, `sale_active`, `deleted`)
VALUES
	(1,'Magical Mystery Tour',14.5,35.99,'Magical Mystery Tour is a record by the English rock band the Beatles that was released as a double EP in the United Kingdom and an LP in the United States. It includes the soundtrack to the 1967 television film of the same name. The EP was issued in the UK on 8 December 1967 on the Parlophone label, while the Capitol Records LP release in the US and Canada occurred on 27 November and featured an additional five songs that were originally released as singles that year. In 1976, Parlophone released the eleven-track LP in the UK.',102,'https://upload.wikimedia.org/wikipedia/en/e/e8/MagicalMysteryTourDoubleEPcover.jpg',27.99,0,0),
	(2,'Let It Be (LP)',13.45,34.5,'Let It Be is the twelfth and final studio album by the English rock band the Beatles. It was released on 8 May 1970, almost a month after the group\'s break-up, in tandem with the documentary of the same name. Concerned about recent friction within the band, Paul McCartney had conceived the project as an attempt to reinvigorate the group by returning to simpler rock \'n\' roll configurations. The album topped charts in many countries, including both the US and the UK, but the critical response was generally unfavourable, and Let It Be came to be regarded as one of the most controversial rock albums in history.',14,'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg',26.75,1,NULL),
	(3,'Let It Be (LP)',13.45,34.5,'Let It Be is the twelfth and final studio album by the English rock band the Beatles. It was released on 8 May 1970, almost a month after the group\'s break-up, in tandem with the documentary of the same name. Concerned about recent friction within the band, Paul McCartney had conceived the project as an attempt to reinvigorate the group by returning to simpler rock \'n\' roll configurations. The album topped charts in many countries, including both the US and the UK, but the critical response was generally unfavourable, and Let It Be came to be regarded as one of the most controversial rock albums in history.',14,'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg',26.75,0,NULL),
	(4,'Let It Be (LP)',13.45,34.5,'Let It Be is the twelfth and final studio album by the English rock band the Beatles. It was released on 8 May 1970, almost a month after the group\'s break-up, in tandem with the documentary of the same name. Concerned about recent friction within the band, Paul McCartney had conceived the project as an attempt to reinvigorate the group by returning to simpler rock \'n\' roll configurations. The album topped charts in many countries, including both the US and the UK, but the critical response was generally unfavourable, and Let It Be came to be regarded as one of the most controversial rock albums in history.',0,'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg',26.75,1,NULL),
	(5,'Let It Be (LP)',13.45,34.5,'Let It Be is the twelfth and final studio album by the English rock band the Beatles. It was released on 8 May 1970, almost a month after the group\'s break-up, in tandem with the documentary of the same name. Concerned about recent friction within the band, Paul McCartney had conceived the project as an attempt to reinvigorate the group by returning to simpler rock \'n\' roll configurations. The album topped charts in many countries, including both the US and the UK, but the critical response was generally unfavourable, and Let It Be came to be regarded as one of the most controversial rock albums in history.',14,'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg',26.75,0,NULL);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `email`, `password`)
VALUES
	(1,'ash','a@a.com','password');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
