# ************************************************************
# Sequel Ace SQL dump
# Version 20031
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.27)
# Database: beatles
# Generation Time: 2022-03-30 09:38:57 +0000
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
  `sale_active` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `cost`, `price`, `description`, `qty`, `img_url`, `sale_price`, `sale_active`, `deleted`)
VALUES
	(1,'Magical Mystery Tour',14.5,35.99,'Magical Mystery Tour is a record by the English rock band the Beatles that was released as a double EP in the United Kingdom and an LP in the United States. It includes the soundtrack to the 1967 television film of the same name. The EP was issued in the UK on 8 December 1967 on the Parlophone label, while the Capitol Records LP release in the US and Canada occurred on 27 November and featured an additional five songs that were originally released as singles that year. In 1976, Parlophone released the eleven-track LP in the UK.',102,'https://upload.wikimedia.org/wikipedia/en/e/e8/MagicalMysteryTourDoubleEPcover.jpg',27.99,0,0),
	(2,'Let It Be (LP)',13.45,34.5,'Let It Be is the twelfth and final studio album by the English rock band the Beatles. It was released on 8 May 1970, almost a month after the group\'s break-up, in tandem with the documentary of the same name. Concerned about recent friction within the band, Paul McCartney had conceived the project as an attempt to reinvigorate the group by returning to simpler rock \'n\' roll configurations. The album topped charts in many countries, including both the US and the UK, but the critical response was generally unfavourable, and Let It Be came to be regarded as one of the most controversial rock albums in history.',14,'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg',26.75,1,0),
	(6,'Sgt. Pepper\'s Lonely Hearts Club Band',12,32.99,'Sgt. Pepper\'s Lonely Hearts Club Band is the eighth studio album by the English rock band the Beatles. Released on 26 May 1967, it spent 27 weeks at number one on the Record Retailer chart in the United Kingdom and 15 weeks at number one on the Billboard Top LPs chart in the United States. It was lauded by critics for its innovations in songwriting, production and graphic design, for bridging a cultural divide between popular music and high art, and for reflecting the interests of contemporary youth and the counterculture. Its release was a defining moment in 1960s pop culture, heralding the Summer of Love, while the album\'s reception achieved full cultural legitimisation for pop music and recognition for the medium as a genuine art form.',0,'https://upload.wikimedia.org/wikipedia/en/5/50/Sgt._Pepper%27s_Lonely_Hearts_Club_Band.jpg',NULL,0,0),
	(7,'The Beatles',17,35.99,'The Beatles, also known colloquially as the White Album, is the ninth studio album and only double album by the English rock band the Beatles, released on 22 November 1968. Featuring a plain white sleeve, the cover contains no graphics or text other than the band\'s name embossed.[a] This was intended as a direct contrast to the vivid cover artwork of the band\'s previous LP Sgt. Pepper\'s Lonely Hearts Club Band. The Beatles is recognised for its fragmentary style and diverse range of genres, including folk, British blues, ska, music hall and the avant-garde. It has since been viewed by some critics as a postmodern work, as well as among the greatest albums of all time.',3,'https://upload.wikimedia.org/wikipedia/commons/2/20/TheBeatles68LP.jpg',29.99,1,0),
	(8,'Help!',17,35.99,'Help! is the fifth studio album by the English rock band the Beatles and the soundtrack to their film of the same name. It was released on 6 August 1965. Seven of the fourteen songs, including the singles \"Help!\" and \"Ticket to Ride\", appeared in the film and took up the first side of the vinyl album. The second side included \"Yesterday\", the most-covered song ever written.[3] The album was met with favourable critical reviews and topped the Australian, German, UK and US charts.',75,'https://upload.wikimedia.org/wikipedia/en/e/e7/Help%21_%28The_Beatles_album_-_cover_art%29.jpg',NULL,0,0),
	(9,'Revolver',18,37.45,'Revolver is the seventh studio album by the English rock band the Beatles. It was released on 5 August 1966, accompanied by the double A-side single \"Eleanor Rigby\" / \"Yellow Submarine\". The album was the Beatles\' final recording project before their retirement as live performers and marked the group\'s most overt use of studio technology to date, building on the advances of their late 1965 release Rubber Soul. It has since become regarded as one of the greatest and most innovative albums in the history of popular music, with recognition centred on its range of musical styles, diverse sounds, and lyrical content.',34,'https://upload.wikimedia.org/wikipedia/en/e/ec/Revolver_%28album_cover%29.jpg',NULL,0,0),
	(10,'Rubber Soul',14,33,'Rubber Soul is the sixth studio album by the English rock band the Beatles. It was released on 3 December 1965 in the United Kingdom, on EMI\'s Parlophone label, accompanied by the non-album double A-side single \"Day Tripper\" / \"We Can Work It Out\". The original North American release, issued by Capitol Records, contains ten of the fourteen songs and two tracks withheld from the band\'s Help! album. Rubber Soul met with a highly favourable critical response and topped sales charts in Britain and the United States for several weeks.',43,'https://upload.wikimedia.org/wikipedia/en/7/74/Rubber_Soul.jpg',29.99,1,0),
	(11,'Abbey Road',13,31.99,'Abbey Road is the eleventh studio album by the English rock band the Beatles, released on 26 September 1969 by Apple Records. Named after Abbey Road, London, the location of EMI Studios, the cover features the group walking across the street\'s zebra crossing, an image that became one of the most famous and imitated in popular music. The album\'s initially mixed reviews were contrasted by its immediate commercial success, topping record charts in the UK and US. The single \"Something\" / \"Come Together\" was released in October and topped the US charts.',11,'https://upload.wikimedia.org/wikipedia/en/4/42/Beatles_-_Abbey_Road.jpg',NULL,0,0),
	(12,'A Hard Day\'s Night',12.5,28.98,'A Hard Day\'s Night is the third studio album by the English rock band the Beatles, released on 10 July 1964 by Parlophone, with side one containing songs from the soundtrack to their film of the same name. The American version of the album was released two weeks earlier, on 26 June 1964 by United Artists Records, with a different track listing that included selections from George Martin\'s film score. In contrast to the Beatles\' first two albums, all 13 tracks on A Hard Day\'s Night were written by John Lennon and Paul McCartney, showcasing the development of their songwriting partnership.',23,'https://upload.wikimedia.org/wikipedia/en/e/e6/HardDayUK.jpg',NULL,0,0),
	(14,'Yellow Submarine',14.99,32.99,'Yellow Submarine is the tenth studio album by English rock band the Beatles, released on 13 January 1969 in the United States and on 17 January in the United Kingdom. It was issued as the soundtrack to the animated film of the same name, which premiered in London in July 1968. The album contains six songs by the Beatles, including four new songs and the previously released \"Yellow Submarine\" and \"All You Need Is Love\". The remainder of the album is a re-recording of the film\'s orchestral soundtrack by the band\'s producer, George Martin.',44,'https://upload.wikimedia.org/wikipedia/en/a/ac/TheBeatles-YellowSubmarinealbumcover.jpg',NULL,0,0),
	(15,'Beatles For Sale',14.99,32.99,'Beatles for Sale is the fourth studio album by the English rock band the Beatles. It was released on 4 December 1964 in the United Kingdom on EMI\'s Parlophone label. The album marked a departure from the upbeat tone that had characterised the Beatles\' previous work, partly due to the band\'s exhaustion after a series of tours that had established them as a worldwide phenomenon in 1964. Beatles for Sale was not widely available in the US until 1987, when the Beatles\' catalogue was standardised for release on CD. Instead, eight of the album\'s fourteen tracks appeared on Capitol Records\' concurrent release, Beatles \'65, issued in North America only.',56,'https://upload.wikimedia.org/wikipedia/en/4/40/Beatlesforsale.jpg',28.99,1,0),
	(16,'With The Beatles',15.99,33.99,'With the Beatles is the second studio album by the English rock band the Beatles. It was released on 22 November 1963 on Parlophone, eight months after the band\'s debut Please Please Me. Produced by George Martin, the album features eight original compositions (seven by Lennon–McCartney and \"Don\'t Bother Me\", George Harrison\'s first recorded solo composition and his first released on a Beatles album) and six covers (mostly of rock and roll and Motown R&B hits). The cover photograph was taken by the fashion photographer Robert Freeman and has since been mimicked by several music groups over the years. A different cover was used for the Australian release of the album, which the Beatles were displeased with.',33,'https://upload.wikimedia.org/wikipedia/en/0/0a/Withthebeatlescover.jpg',NULL,0,0),
	(17,'Please Please Me',15.99,32.5,'Please Please Me is the debut studio album by the English rock band the Beatles. Produced by George Martin, it was released on EMI\'s Parlophone label on 22 March 1963 in the United Kingdom, following the success of the band\'s first two singles \"Love Me Do\", which reached number 17 on the UK Singles Chart, and \"Please Please Me\" which reached number 1 on the NME and Melody Maker charts. The album topped Record Retailer\'s LP chart for 30 weeks, an unprecedented achievement for a pop album at that time.',57,'https://upload.wikimedia.org/wikipedia/en/c/c0/PleasePleaseMe_audio_cover.jpg',NULL,0,0);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
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
