-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (x86_64)
--
-- Host: localhost    Database: nfc
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` longtext,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Quai de Tilsitt','Angers','2022-06-18 20:49:09.880000','Chuck Norris can spawn threads that complete before they are started.','hugo.meunier@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/13.png','Picard et Picard','02 11 68 19 20',NULL,'3465'),(2,'Avenue de Caumartin','Lille','2022-06-18 20:49:09.989000','Chuck Norris burst the dot com bubble.','lisa.perez@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/10.png','Dubois EURL','03 95 60 85 56',NULL,'701'),(3,'Passage Royale','Drancy','2022-06-18 20:49:10.093000','The class object inherits from Chuck Norris.','mathilde.bertrand@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/3.png','Giraud SAS','0367781883',NULL,'2442'),(4,'Boulevard Delesseux','Aubervilliers','2022-06-18 20:49:10.201000','Chuck Norris\'s first program was kill -9.','romain.gaillard@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/10.png','Picard et Picard','01 36 28 18 96',NULL,'04'),(5,'Rue des Panoramas','Clermont-Ferrand','2022-06-18 20:49:10.304000','No statement can catch the ChuckNorrisException.','benjamin.muller@gmail.com','https://pigment.github.io/fake-logos/logos/medium/color/11.png','Brunet SARL','+33 335439076',NULL,'9');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `type_company` varchar(31) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` longtext,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('Orderer',1,'Boulevard du Havre','Pau','2022-06-18 20:48:56.982000','Voluptates perferendis molestiae dolor ratione.Nostrum esse non libero.Quidem deleniti aut qui quis.','lena.giraud@gmail.com','https://pigment.github.io/fake-logos/logos/medium/color/1.png','Martinez SARL','05 76 34 78 84',NULL,'4'),('Orderer',2,'Boulevard du Bac','Saint-Quentin','2022-06-18 20:48:57.209000','Qui facere nostrum repellendus vel aut quas.Corporis ipsam tempora et qui aut.Quidem sint quia qui e','juliette.carre@gmail.com','https://pigment.github.io/fake-logos/logos/medium/color/9.png','Fabre SCOP','03 78 40 88 57',NULL,'7730'),('Orderer',3,'Impasse Adolphe Mille','Cayenne','2022-06-18 20:48:57.338000','Nisi quos porro.Deleniti aliquam exercitationem.Omnis eos veniam aut a nobis ut quo.Eum qui eos iste','tom.faure@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/4.png','Laine et Laine','0146832655',NULL,'056'),('Orderer',4,'Avenue Bonaparte','Lorient','2022-06-18 20:48:57.461000','Voluptas quia hic qui omnis incidunt itaque.Neque ut quae dolor numquam natus sapiente.Modi ea repel','chloé.le roux@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/5.png','Girard SAS','0280514351',NULL,'142'),('Orderer',5,'Rue de Montmorency','Nanterre','2022-06-18 20:48:57.569000','A nobis odit excepturi magni modi autem dolor.Itaque iusto velit nisi.Ipsam ab ipsum qui temporibus ','hugo.dubois@gmail.com','https://pigment.github.io/fake-logos/logos/medium/color/4.png','Berger EI','0912708682',NULL,'0166'),('Provider',6,'Impasse Pastourelle','Rouen','2022-06-18 20:48:57.675000','Ut ipsa beatae laudantium corporis voluptas inventore qui.Dolores omnis at temporibus.Itaque et volu','victor.girard@hotmail.fr','https://pigment.github.io/fake-logos/logos/medium/color/4.png','Thomas et Thomas','+33 2 02 16 92 00',NULL,'79'),('Provider',7,'Allée, Voie de la Bûcherie','Aubervilliers','2022-06-18 20:48:57.783000','Cupiditate officiis hic qui perferendis incidunt iusto.Delectus dolorum rem consequuntur.Quam quos d','lucas.renaud@gmail.com','https://pigment.github.io/fake-logos/logos/medium/color/4.png','Chevalier SAS','+33 502306009',NULL,'763'),('Provider',8,'Passage Montorgueil','Perpignan','2022-06-18 20:48:57.898000','Voluptas ratione sint nihil.Harum magni nisi.Doloremque similique fugiat atque.Ut minima optio iste ','louise.poirier@hotmail.fr','https://pigment.github.io/fake-logos/logos/medium/color/8.png','Gauthier et Gauthier','0126972567',NULL,'20'),('Provider',9,'Impasse Saint-Bernard','Angers','2022-06-18 20:48:58.004000','Labore porro eaque reiciendis vitae.Et culpa ab.Molestiae et ratione consectetur odio a.Aut occaecat','clément.lecomte@yahoo.fr','https://pigment.github.io/fake-logos/logos/medium/color/6.png','Dumas EURL','+33 523747536',NULL,'9281'),('Provider',10,'Quai de Richelieu','Saint-Étienne','2022-06-18 20:48:58.134000','Quaerat velit non.Ad labore ipsa.In vero magni laudantium aut molestiae et sit.Possimus at aspernatu','thomas.renaud@gmail.com','https://pigment.github.io/fake-logos/logos/medium/color/4.png','Blanc et Blanc','+33 1 32 88 32 60',NULL,'7554');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etape`
--

DROP TABLE IF EXISTS `etape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etape` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext,
  `data` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `internal_validation` varchar(255) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `intervention_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrl81jx04teer91kudftesfw4i` (`intervention_id`),
  CONSTRAINT `FKrl81jx04teer91kudftesfw4i` FOREIGN KEY (`intervention_id`) REFERENCES `intervention` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etape`
--

LOCK TABLES `etape` WRITE;
/*!40000 ALTER TABLE `etape` DISABLE KEYS */;
/*!40000 ALTER TABLE `etape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installation`
--

DROP TABLE IF EXISTS `installation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `installation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `utilisateur_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcv3c5hn3r0a4s6rmv7x4550gt` (`client_id`),
  KEY `FK7kuvl8pjv4f4b9t2sjshacl7a` (`utilisateur_id`),
  CONSTRAINT `FK7kuvl8pjv4f4b9t2sjshacl7a` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `FKcv3c5hn3r0a4s6rmv7x4550gt` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation`
--

LOCK TABLES `installation` WRITE;
/*!40000 ALTER TABLE `installation` DISABLE KEYS */;
/*!40000 ALTER TABLE `installation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervention` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `detail` longtext,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `installation_id` bigint DEFAULT NULL,
  `utilisateur_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn1ux8lll5mmtkko6j50t5lvry` (`installation_id`),
  KEY `FKehy292hxfssge7ub5s2546run` (`utilisateur_id`),
  CONSTRAINT `FKehy292hxfssge7ub5s2546run` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `FKn1ux8lll5mmtkko6j50t5lvry` FOREIGN KEY (`installation_id`) REFERENCES `installation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervention`
--

LOCK TABLES `intervention` WRITE;
/*!40000 ALTER TABLE `intervention` DISABLE KEYS */;
/*!40000 ALTER TABLE `intervention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_TRAVAILLEUR'),(2,'ROLE_CHEF'),(3,'ROLE_MODERATOR'),(4,'ROLE_ADMIN'),(5,'ROLE_USER'),(6,'ROLE_ADJOIN_CHEF');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKfhg6g8mbl6gcwupy69tajpvjm` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(73,1),(80,1),(81,1),(83,1),(87,1),(88,1),(89,1),(91,1),(93,1),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(51,4),(52,4),(53,4),(54,4),(55,4),(56,4),(57,4),(58,4),(59,4),(60,4);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKc68xm0uykgh24nqfefurtkrh3` (`user_name`),
  UNIQUE KEY `UKrma38wvnqfaf66vvmi57c71lo` (`email`),
  KEY `FKac4j5tgj5aubt5gskl417mj0n` (`company_id`),
  CONSTRAINT `FKac4j5tgj5aubt5gskl417mj0n` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'2022-06-18 20:48:58.674000','alexandre.marchal@yahoo.fr','Maeva','Leclerc','04 60 75 43 86','$2a$10$LY6X7t/q.YyqopRnEaSLS.TmaII44T3QKKDtqFMPDvAij3cI1U/Ha',NULL,'lilou.robert',1),(2,'2022-06-18 20:48:58.958000','clément.fournier@gmail.com','Léo','Dubois','0290780900','$2a$10$guOnpi9qJhpcPIqGgmnp4OZcWkhkUVaszH1yhOsFr8SyQfKeulrdK',NULL,'hugo.menard',1),(3,'2022-06-18 20:48:59.217000','emilie.jean@gmail.com','Carla','Gaillard','04 59 78 19 38','$2a$10$HFRA9WgTRr7sLKYaDhHUd.FktJDNNxE189AU74UuGpgNrwQX41Sem',NULL,'nicolas.roy',1),(4,'2022-06-18 20:48:59.437000','arthur.martin@yahoo.fr','Mathis','Paris','+33 298902214','$2a$10$A.Qgw2rcmwSJIXAwybUhlurSgz/Z5YuDEkbpLKdO1QA4qvtW7/Ufi',NULL,'nicolas.robin',1),(5,'2022-06-18 20:48:59.656000','raphaël.fernandez@hotmail.fr','Maëlys','Vincent','0104046721','$2a$10$/cbJLtrccuXLWJLCvweG7.L4Ls8nPvurkpeR2rTxbWkWw/wQnuDue',NULL,'mélissa.schmitt',1),(6,'2022-06-18 20:48:59.877000','océane.roger@hotmail.fr','Laura','Michel','05 90 91 37 94','$2a$10$JF6qYYFeIi0TVruwzIBb7eofjYTDtnOA.VGyhu0Wcu4m9DIV5qlK2',NULL,'maxence.louis',2),(7,'2022-06-18 20:49:00.095000','clément.durand@hotmail.fr','Maxime','Fabre','+33 5 69 02 08 08','$2a$10$mpY3mlMc3rzU5ebasn/2VOJnVFJ2tOadN3/0BpQfhBZwMLzhLgWC.',NULL,'mélissa.renaud',2),(8,'2022-06-18 20:49:00.313000','mattéo.morel@yahoo.fr','Océane','Garnier','04 39 35 25 05','$2a$10$kQ2dYn1z3bZqGoA1bYy9suufvO2l0xLkg8F9yMCNTkGNNTdW.83oG',NULL,'baptiste.paul',2),(9,'2022-06-18 20:49:00.532000','enzo.fleury@yahoo.fr','Mael','Richard','01 63 77 74 50','$2a$10$WiQIYYjEgDUUVRDUHU7VmuD7wRqaBot/dbUTqT3SVNiQz.0GhNoHC',NULL,'pauline.renault',2),(10,'2022-06-18 20:49:00.753000','jade.lacroix@gmail.com','Antoine','Lambert','+33 543307518','$2a$10$zy5/LQNaP/.ltJjv.XNpjeLIGhEMLHPc9n8grm1dhxhoZF0nVqKVm',NULL,'nathan.renard',2),(11,'2022-06-18 20:49:00.970000','noah.roche@gmail.com','Manon','Arnaud','+33 9 08 60 06 67','$2a$10$lX.8S4tKABwGZg39ojl0feDgXqnP5ddOusddYnrm4FQdry86p7kvO',NULL,'quentin.schneider',3),(12,'2022-06-18 20:49:01.190000','lucie.schneider@yahoo.fr','Sarah','Lecomte','+33 556960823','$2a$10$RG14mOOf1hpJsfd0DA3Kp.hMh5WL/7y1HU4KZJWQ5HCAu15Kyoa76',NULL,'maëlle.moulin',3),(13,'2022-06-18 20:49:01.406000','adam.paris@yahoo.fr','Tom','Andre','+33 1 61 94 29 87','$2a$10$cGoMmKxOqVh884q9mZBAoO3wssKIL/so3CNjr5O2i5Gx/hIG9SHca',NULL,'baptiste.guyot',3),(14,'2022-06-18 20:49:01.664000','lucas.moreau@gmail.com','Romane','Charles','03 19 34 11 15','$2a$10$yec6TV5DH2wPkn5F9TbRcubDO8ASMaJheQiX.5QvSctEAolZErUZW',NULL,'charlotte.dumont',3),(15,'2022-06-18 20:49:01.883000','maëlys.huet@hotmail.fr','Enzo','Guerin','+33 2 92 86 32 10','$2a$10$U7kXoljTt8Cr3Ms.FPdNauc2X44LRa80FfyUnvMIOuBEUb1DgsJeG',NULL,'zoe.lemaire',3),(16,'2022-06-18 20:49:02.102000','louna.caron@yahoo.fr','Mohamed','Rolland','+33 394724201','$2a$10$yt7geW3mQKbqVgcEmXMP..BiTdS4US0pU5p.1kR5V0KhTTH.eFk3S',NULL,'zoe.sanchez',4),(17,'2022-06-18 20:49:02.321000','gabriel.boyer@gmail.com','Thomas','Roy','0514227441','$2a$10$aZBApck.tpIjvuFuz7drJOgsrMNEH6whpZjg0VpPHlHdf94ksPoHu',NULL,'justine.poirier',4),(18,'2022-06-18 20:49:02.540000','noa.moreau@hotmail.fr','Raphaël','Boyer','0900927610','$2a$10$QYuHYpNGTeytEfGsvQJF2ed2cSdceyepzOsEz.j.Q1ppqRw.KFQsu',NULL,'rayan.collet',4),(19,'2022-06-18 20:49:02.755000','mathis.meyer@hotmail.fr','Rayan','Hubert','0248448030','$2a$10$DnG9Kr8Caie/2He5gM6jzOdJ8OE4/w4RH79YHzQ24OTEEQlL0PLsS',NULL,'adam.moulin',4),(20,'2022-06-18 20:49:02.990000','alicia.fontaine@gmail.com','Nathan','Nguyen','0130132541','$2a$10$G76Kmqddog3v5e1glIt.qeMzolsSNaw8ZA8qwNyTUd60tti3XTvtq',NULL,'sarah.morel',4),(21,'2022-06-18 20:49:03.222000','charlotte.bourgeois@gmail.com','Léo','Lemaire','+33 228436935','$2a$10$nzmWw.AGqTIZgmLm5S781ucDFBJAj81eKf3fNB0EuP6ERquDDrmyu',NULL,'charlotte.perrin',5),(22,'2022-06-18 20:49:03.444000','raphaël.petit@yahoo.fr','Mael','Clement','+33 5 53 11 51 92','$2a$10$pHQqXNMZJC7t6/gNCCBtkeLlZCX7L.NL.sb3Z5N5rAoN61LR4iGCm',NULL,'noah.julien',5),(23,'2022-06-18 20:49:03.660000','alexandre.cousin@yahoo.fr','Lisa','Robert','+33 560873137','$2a$10$Jat5QBg5UTGXgPdyQj8Da.QtKU/40LNNNqR2zlNfwY04bAdIQXYIW',NULL,'clémence.martinez',5),(24,'2022-06-18 20:49:03.914000','juliette.thomas@gmail.com','Léo','Richard','+33 952086823','$2a$10$Ekzi93Rb/4Q8XNzPppSYbeqkuS06Iqbige6a9pz7TZQlPfzZtrSki',NULL,'lucas.le roux',5),(25,'2022-06-18 20:49:04.130000','hugo.legrand@yahoo.fr','Clément','Martinez','03 63 18 97 61','$2a$10$AkPwf3D4ulATkngeYAE7PevOUpc5tBQCIq0U1YVpsRb0ZofcJfF8W',NULL,'lola.robin',5),(26,'2022-06-18 20:49:04.355000','thomas.le roux@hotmail.fr','Justine','Philippe','+33 581849559','$2a$10$THuDYuTFZUWZBjuj7812mevbEJKXruVa5zHd4wE1R8oYcbv/q8BNC',NULL,'marie.morin',6),(27,'2022-06-18 20:49:04.572000','benjamin.fontaine@yahoo.fr','Axel','Nguyen','03 87 75 92 52','$2a$10$v46EHbJRqM9d4vMpG5WfCuT/nu12Wjp94e42tb//vxvwaL5qmYwPa',NULL,'pauline.masson',6),(28,'2022-06-18 20:49:04.788000','clémence.thomas@hotmail.fr','Ethan','Dubois','05 51 92 28 53','$2a$10$gw1wsCVCgU9GO0Z5q8s.Hu6CgRZdz6iDezEWNpXOIEVQiDh0sloD6',NULL,'justine.marchand',6),(29,'2022-06-18 20:49:05.018000','louna.fournier@gmail.com','Célia','Sanchez','+33 9 74 56 83 25','$2a$10$xUK7uM2Ui4yZ.ItZ8KTF6Op8EqB40DHXpHsYWeAfd.aMC9b28kdYy',NULL,'célia.fernandez',6),(30,'2022-06-18 20:49:05.234000','célia.dubois@yahoo.fr','Mattéo','Collet','09 46 05 59 26','$2a$10$D8tUnoG.jav.2iLoUIDsVO.BTsgRR6oS3eogpvuHXZ1TZwAbGTYbK',NULL,'lena.lemoine',6),(31,'2022-06-18 20:49:05.449000','lisa.julien@gmail.com','Thomas','Gautier','+33 3 60 65 01 76','$2a$10$c5pB9caDAPqjQRAoQKCUse5pnoVg9J7Bm78L5YGbjjILyqBM4zmJy',NULL,'alice.duval',7),(32,'2022-06-18 20:49:05.665000','lou.lacroix@gmail.com','Lucas','Roux','0122043193','$2a$10$RlNnO0jLDzZFyeJBbTFnxuHeUY6qJx9275gNX6SE6oOwZNS4ZU0HG',NULL,'ines.paris',7),(33,'2022-06-18 20:49:05.880000','gabriel.royer@hotmail.fr','Enzo','Guillaume','+33 941910249','$2a$10$2JphHB9nP0p2f.szzPHkEeZzWkeydzm4yv/7rAScag.aW/2HKbwpe',NULL,'alicia.marty',7),(34,'2022-06-18 20:49:06.097000','anaïs.vincent@yahoo.fr','Julie','Poirier','+33 1 17 19 81 12','$2a$10$zItbFnxgQngCwCB1M00hYOHjgPk9PsAHjaHC2iRBcMAP88npO50.6',NULL,'antoine.lemaire',7),(35,'2022-06-18 20:49:06.311000','clément.picard@hotmail.fr','Noah','Menard','+33 4 41 98 97 41','$2a$10$vtf3Goqs757OcpSYLyso/OyYk.KGtijIKP1zC4s1Dp79rQPabkqyq',NULL,'lisa.le roux',7),(36,'2022-06-18 20:49:06.528000','mélissa.adam@yahoo.fr','Lola','Barbier','+33 922957703','$2a$10$br6X1UX.0GPyjEvuf7N8F.R6i/XZcoC8FuKhiavwkQ5g0koXmMnC.',NULL,'pauline.jean',8),(37,'2022-06-18 20:49:06.744000','rayan.colin@gmail.com','Maëlys','Leclercq','+33 490949536','$2a$10$frWO1XmikdEOJDdyvq48U.nW11LZ6XSO8tH7ntfhLHvlkEapNqS2C',NULL,'théo.masson',8),(38,'2022-06-18 20:49:06.960000','kylian.brunet@hotmail.fr','Sarah','Dufour','+33 193050507','$2a$10$ekYiubgIAzJU5aF4ez2J7.c00JDnrWb5R3pHKcLcUnxVzssMmaF/i',NULL,'juliette.roche',8),(39,'2022-06-18 20:49:07.175000','noah.barre@hotmail.fr','Raphaël','Roux','+33 483663560','$2a$10$N8yZXkuMZyUxOH/px3w2BuiyF.nEHGG7CXDPRy1nUq2NHAF5/fXiC',NULL,'théo.guerin',8),(40,'2022-06-18 20:49:07.390000','mélissa.henry@hotmail.fr','Lisa','Hubert','+33 311352506','$2a$10$ebYtxa8pt9J9bPWJiuaFse9LtbWzF7h6iD3TF0jNyTlFSxY0w6fXe',NULL,'jules.perrin',8),(41,'2022-06-18 20:49:07.606000','benjamin.morin@hotmail.fr','Mathilde','Fabre','0324745299','$2a$10$NJ2rOsckvypelpHIPEDw/uJs6XH2wbgLVFtMvd.Q3tjEzZZZ5q9/.',NULL,'alice.breton',9),(42,'2022-06-18 20:49:07.907000','justine.deschamps@gmail.com','Antoine','Pierre','+33 4 73 15 10 98','$2a$10$1lOsVFWnnuWdfrfiJWvpY.hbGjeNeXKLR8t77sIHoYCjp7WA2/9/u',NULL,'raphaël.moulin',9),(43,'2022-06-18 20:49:08.123000','mathilde.gauthier@gmail.com','Ambre','Philippe','+33 9 41 96 92 38','$2a$10$ys03E3RirH7nlMp.bNu7l.L6/7sDvSBTJbZxUxwNuVaxdMtaXbyYW',NULL,'célia.pierre',9),(44,'2022-06-18 20:49:08.340000','anaïs.rodriguez@yahoo.fr','Gabriel','Meyer','0148006315','$2a$10$6523swf2/jwtvOjcqkb1HeyAmkF9QMT6bQvXXeQPjhxvfanKZZTsC',NULL,'clément.renaud',9),(45,'2022-06-18 20:49:08.556000','clément.rey@gmail.com','Clémence','Leroy','+33 4 07 09 96 50','$2a$10$b.YKMNxiiWCfcQm0s6Bo7ugMVoEhKeTgMpqP8iPx7jNtK4HlVQ.TG',NULL,'romane.gerard',9),(46,'2022-06-18 20:49:08.773000','maëlys.gonzalez@hotmail.fr','Enzo','Brun','+33 177490876','$2a$10$TCAka2dMOTW3UZMoJhuj6eFhxfLGJhRbhdzKUWfiSCotnVdW/.cKa',NULL,'clémence.laine',10),(47,'2022-06-18 20:49:08.988000','rayan.aubert@hotmail.fr','Ambre','Fontaine','+33 357379592','$2a$10$bIJ0Tkaasj2iI2nn0sdDw.49dWuFGplwXcyopLUyEbJwmPOnymHlG',NULL,'adrien.le gall',10),(48,'2022-06-18 20:49:09.206000','maxence.jean@yahoo.fr','Lou','Marie','+33 1 30 29 19 04','$2a$10$HewmJVnL7DFX9dQMx2M2S.xhunfoNJPyxqrKQy3o/um7Gncga.kPG',NULL,'anaïs.noel',10),(49,'2022-06-18 20:49:09.446000','elisa.morel@hotmail.fr','Rayan','Morin','0431821462','$2a$10$ChW8oog8TcngbpIE.qhWoetj3mM0kqtwYOpRmVlMwefD/mSueKriW',NULL,'maxence.bonnet',10),(50,'2022-06-18 20:49:09.665000','clément.robert@gmail.com','Gabriel','Breton','+33 1 58 61 92 08','$2a$10$2F618K7E8SPpDF7RSemr4u0xtCF0a/6sdCVW0taDoOLl558FcFjAy',NULL,'mattéo.schneider',10),(51,'2022-06-18 22:43:39.338000','hugo.gauthier@hotmail.fr','Pierre','Petit','0951767700','$2a$10$L9NuQqPSyaMCbwiM7ljLp.dS0UT3OPblbVeGXoI33MFwMUI2lEFFi',NULL,'baptiste.deschamps',1),(52,'2022-06-18 22:43:39.622000','chloé.barre@gmail.com','Maeva','Bonnet','+33 549566591','$2a$10$wvG8Q8usVZ66SAa8Pw85merjb.HFBY82Fsu63J2W2cc6oelCdTYFe',NULL,'maxime.faure',2),(53,'2022-06-18 22:43:39.794000','léa.guillot@yahoo.fr','Noa','Fontaine','0142601909','$2a$10$eLaGg8nkUzH8EyzWpzecgO5Zai.rFFR6wgxcd32cnP40qPEoNHUSa',NULL,'adam.francois',3),(54,'2022-06-18 22:43:39.972000','alexandre.aubry@yahoo.fr','Laura','Fontaine','+33 100119203','$2a$10$93MgJqhQl5MN6cSphMxLpuSCaJjnaXafoKtRlS96zWG7ITS4sPz/e',NULL,'nathan.marie',4),(55,'2022-06-18 22:43:40.144000','hugo.robert@gmail.com','Julie','Leclerc','+33 2 00 55 34 86','$2a$10$Fsj5Bh9/pxNWXqrbmLZwXu2nud3/QgKbi/wzLKVCvb8e5E5ReE1PO',NULL,'thomas.fontaine',5),(56,'2022-06-18 22:43:40.334000','arthur.martinez@gmail.com','Sacha','Boyer','0947803771','$2a$10$WqpgNUtG6Z7Y8sPTz3L2SejyV5C9M0CvOLNeKvBfEo5sIlH4g1HOa',NULL,'nicolas.garnier',6),(57,'2022-06-18 22:43:40.514000','lina.clement@gmail.com','Maeva','Thomas','0490683461','$2a$10$oFCpwRCSHpmrTMRJL3K7P.KsX5Wa2Jr.WhTwgToAQsw9X2C/6mIq2',NULL,'océane.breton',7),(58,'2022-06-18 22:43:40.692000','mathis.laine@gmail.com','Alexandre','Prevost','0317061070','$2a$10$MVhTACYcD/oKcs0dzDyJiOTbALJsx2kXaXf3PjCzZrNIPDofCsIPC',NULL,'hugo.moulin',8),(59,'2022-06-18 22:43:40.864000','chloé.lucas@gmail.com','Léa','Roche','+33 555982876','$2a$10$FNH8SF/n4Jw.orPlF5xi2etPnRKtbJQsBeEKuBzt.StZTfufn0UqG',NULL,'mael.moulin',9),(60,'2022-06-18 22:43:41.037000','mathéo.renard@gmail.com','Thomas','Sanchez','0358134223','$2a$10$CmdvSx3wAu9J4TG0Xcaht.s1Q5Ru.4LLmlzr9GFlCPJxW2LKYbFxa',NULL,'antoine.olivier',10),(61,'2022-06-18 22:54:40.539000','charlotte.leclercq@hotmail.fr','Eva','Lemaire','01 32 31 21 00','$2a$10$G2ZElkGI9WMJ/7ka9ofbruCukKto90bm47yZhx3xG5s1hOF3lrLm.',NULL,'juliette.bertrand',1),(62,'2022-06-18 22:54:40.816000','maxime.david@yahoo.fr','Tom','Leroy','+33 1 90 89 51 14','$2a$10$OpVx6OkTKVlyt3tqmEjEHeYrHwQ9DVkXp3nlEsDmI0hzQOpm45Bo6',NULL,'zoe.marty',2),(63,'2022-06-18 22:54:40.996000','quentin.legrand@hotmail.fr','Mohamed','Giraud','09 77 32 18 14','$2a$10$gmbwsENWa/cYbDn23D0J8.2Vrvxh/VmVfv4I8myVykAnqo95hxvfq',NULL,'maxime.fleury',3),(64,'2022-06-18 22:54:41.206000','enzo.morel@hotmail.fr','Maëlys','Pierre','0234357268','$2a$10$Xu372oZ.Z4tDSFh.nahpNeWhojuKgyIIGlTM4hQ6xOkBT/AZTTZBG',NULL,'noah.morel',4),(65,'2022-06-18 22:54:41.409000','lina.morin@hotmail.fr','Léa','Durand','+33 547120393','$2a$10$tPJIk4KleCvPzJfQNLuUv.6xfTuyePXfvPH3wBTYqaop3RDmkqAem',NULL,'tom.vidal',5),(66,'2022-06-18 22:54:41.617000','célia.rey@hotmail.fr','Tom','Carre','+33 177084450','$2a$10$hGK6h3tJGrOqEsFPxHoZM.6ITa048aQQOThgjQFujMFREyxd/gsea',NULL,'gabriel.fontaine',6),(67,'2022-06-18 22:54:41.815000','léa.dumas@gmail.com','Lucas','Girard','0903297301','$2a$10$PopX5nNPM3WLjB7saxKAKuzfJgd1S8YgKWwqa.YnaNwZi06OnQO6e',NULL,'julie.lemoine',7),(68,'2022-06-18 22:54:42.018000','jules.legrand@hotmail.fr','Louna','Mercier','05 08 54 83 06','$2a$10$SHRRuxUOd0Uhwq5DwSPLEe4mXvw2ZnKnnQqsSk4xFQX0o2fTD3KXi',NULL,'mathilde.moulin',8),(69,'2022-06-18 22:54:42.210000','alicia.lambert@yahoo.fr','Louise','Aubry','03 74 85 26 13','$2a$10$RTx8Mo6Idkqys4yj8tzyruocc/lW74ODPfuMRaDs35KF1X95YtxdW',NULL,'laura.laine',9),(70,'2022-06-18 22:54:42.396000','lola.fontaine@gmail.com','Lucie','Lefevre','+33 312236289','$2a$10$YMbNkNxw3lZs0ID2z2AFXuRjD28/W/DM7wxm7vGRZ9vnDLmf1Soxq',NULL,'lilou.colin',10),(73,'2022-06-18 23:26:03.746000','teste@teste.com','teste','teste','0280514352','$2a$10$hZqu3GojBXCSzb3TBOOvgekQicuUHWPrB02UhBNdsKqWmWspjA9Wq',NULL,'teste',4),(74,'2022-06-18 23:43:54.030000','tester2@teste.com','teste2','teste2','0280514353','$2a$10$IJ6ZhlkGNFqm9XbUXrbwvujg39TS.qC1QH3U0Bjguuz.pOPS8To4q',NULL,'tester2',4),(75,'2022-06-19 14:37:44.653000','dareine.maiddima@teste.com','Dareine','Amoa','0280514355','$2a$10$keWmwvxI0VNN/Nrw41KM1.GHdnSqEp25QSIUaZOx8HxsDanQQq4vy',NULL,'dareine.maiddima',1),(80,'2022-06-19 15:21:11.199000','satsonsadath@gmail.com','Sadath','Agoro','0280514355','$2a$10$fAGCs/3tPSphtVDZZrrGBuyOJcwKdi2M8Msyo9A9reOxY492OQrvW',NULL,'sadath.agoro',1),(81,'2022-06-19 16:13:31.525000','abdouazizdioufzzzz75@gmail.com','Sadath','Agoro','0280514355','$2a$10$zS424GBCYiwqjyC7LoT.E.cQvrpqAlM0zi2LWMy6onlKnBvGhB.mG',NULL,'sadath.arrgoro',1),(83,'2022-06-19 16:22:36.613000','alex.boudri@gmail.com','Sadssath','Agoro','0280514355','$2a$10$hlOoRCHdgr2OatRefySmzeGvZP56glLvW8zzQvoqPCbBSSbKXG2Gy',NULL,'sadath.arsrgoro',1),(87,'2022-06-19 23:31:53.240000','alex.boudssriii@gmail.com','Sadssssath','Agoro','0280514355','$2a$10$VjyflBUdd0crWogGEoNwYe.egWD1iv6nxMK2YgN8v0t0kj1zoI12a',NULL,'sadatxssssddh.arsrgoro',1),(88,'2022-06-19 23:41:24.770000','alex.boudsddsriii@gmail.com','Sadssssath','Agoro','0280514355','$2a$10$LaHSxislot2db84JU/vGbeIYePSWRvpCWuehooynqmVwOmot13ghy',NULL,'sadatdddxssssddh.arsrgoro',1),(89,'2022-06-19 23:43:09.144000','alex.boudsddsxxriii@gmail.com','Sadssssath','Agoro','0280514355','$2a$10$yxBoM9K8MH45BDO/HeWeX.zx4zTAFM8tVQk7mV/uJG3iKMUjW/u76',NULL,'sadatdddxxxxssssddh.arsrgoro',1),(91,'2022-06-19 23:49:44.017000','sssssss@gmail.com','Sadath','Agoro','0280514355','$2a$10$FB3axsVLdkEv3cqX8kzEv.8HjXQYFShShaq4BuE.dVOMZZ4ps51Oq',NULL,'sadathsdaz.arrgoro',1),(93,'2022-06-19 23:52:32.422000','abdouazizdiouf75@gmail.com','Sadath','Agoro','0280514355','$2a$10$mDNaoGZ7enCUpS7uYjjRAem1tlV0QYrShXOzz8XuljksOdMDeQXVS',NULL,'sadathdrsdaz.arrgoro',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 17:39:14
