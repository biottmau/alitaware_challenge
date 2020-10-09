-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: alitaware
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `total` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `payments_FK` (`user_id`),
  CONSTRAINT `payments_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de registros de los pagos realizados por los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'2020-10-09 09:47:35',1,50),(2,'2020-10-09 09:47:35',1,50),(3,'2020-10-09 09:47:35',1,400),(4,'2020-10-09 09:47:35',1,30),(5,'2020-10-09 09:47:35',2,100),(6,'2020-10-09 09:47:35',2,80),(7,'2020-10-09 09:47:35',3,25),(8,'2020-10-09 09:47:35',2,500),(9,'2020-10-09 09:47:35',3,2500),(10,'2020-10-09 09:47:35',1,7000),(11,'2020-10-09 09:47:35',2,50),(12,'2020-10-09 09:47:35',5,50),(13,'2020-10-09 09:47:35',4,899),(14,'2020-10-09 09:47:35',4,60),(15,'2020-10-09 09:47:35',5,79),(16,'2020-10-09 09:47:35',2,500),(17,'2020-10-09 09:47:35',5,900),(18,'2020-10-09 09:47:35',3,2654);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_suscriptions`
--

DROP TABLE IF EXISTS `payments_suscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_suscriptions` (
  `payments_id` int NOT NULL,
  `suscriptions_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `paymetns_suscripcions_FK` (`payments_id`),
  KEY `paymetns_suscripcions_FK_1` (`suscriptions_id`),
  CONSTRAINT `paymetns_suscripcions_FK` FOREIGN KEY (`payments_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `paymetns_suscripcions_FK_1` FOREIGN KEY (`suscriptions_id`) REFERENCES `suscriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de las suscripciones adquiridas con el pago';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_suscriptions`
--

LOCK TABLES `payments_suscriptions` WRITE;
/*!40000 ALTER TABLE `payments_suscriptions` DISABLE KEYS */;
INSERT INTO `payments_suscriptions` VALUES (1,1,1),(2,1,2),(3,3,3),(4,2,4),(5,2,5),(6,1,6),(7,3,7),(8,3,8),(9,3,9),(10,1,10),(11,2,11),(12,2,12),(13,2,13),(14,1,14),(15,3,15),(16,2,16),(17,3,17),(18,1,18);
/*!40000 ALTER TABLE `payments_suscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_team`
--

DROP TABLE IF EXISTS `payments_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_team` (
  `payments_id` int NOT NULL,
  `teams_id` int NOT NULL,
  PRIMARY KEY (`payments_id`),
  KEY `payments_team_FK` (`teams_id`),
  CONSTRAINT `payments_team_FK` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `payments_team_FK_1` FOREIGN KEY (`payments_id`) REFERENCES `payments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='En caso de que el pago haya sigo asignado a un equipo , registro el mismo aqui. Se considera un pago por un equipo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_team`
--

LOCK TABLES `payments_team` WRITE;
/*!40000 ALTER TABLE `payments_team` DISABLE KEYS */;
INSERT INTO `payments_team` VALUES (1,1),(2,1),(3,1),(5,1),(9,1),(14,1),(17,1),(18,1);
/*!40000 ALTER TABLE `payments_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad de servicios incliidos en la App';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'aplicacion 1'),(2,'libro de cocina'),(3,'Ebook de programacion'),(4,'Applicacion iOS 1'),(5,'Juego de PS4'),(6,'Juego de PS5'),(7,'Bebida Energizante'),(8,'otro producto'),(9,'Otro Servicio'),(10,'Producto sin nombre');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriber_account`
--

DROP TABLE IF EXISTS `suscriber_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscriber_account` (
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `suscriber_account_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Datos de la cuenta de cada usuario/suscriptor. Es una relación 1 a 1 debido a que son datos que se pueden completar despues de la creación del usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriber_account`
--

LOCK TABLES `suscriber_account` WRITE;
/*!40000 ALTER TABLE `suscriber_account` DISABLE KEYS */;
INSERT INTO `suscriber_account` VALUES (1,'Administrador','2233344',NULL);
/*!40000 ALTER TABLE `suscriber_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriptions`
--

DROP TABLE IF EXISTS `suscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad donde define las distintas suscripciones posbiles .';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriptions`
--

LOCK TABLES `suscriptions` WRITE;
/*!40000 ALTER TABLE `suscriptions` DISABLE KEYS */;
INSERT INTO `suscriptions` VALUES (1,'Suscripcion 1',50),(2,'Suscripcion 2',20),(3,'Suscripcion 3',5);
/*!40000 ALTER TABLE `suscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriptions_prices_team`
--

DROP TABLE IF EXISTS `suscriptions_prices_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscriptions_prices_team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suscriptions_id` int NOT NULL,
  `count_from` int NOT NULL DEFAULT '1',
  `count_to` int NOT NULL DEFAULT '1',
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suscriptions_prices_team_FK` (`suscriptions_id`),
  CONSTRAINT `suscriptions_prices_team_FK` FOREIGN KEY (`suscriptions_id`) REFERENCES `suscriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de los precios especiales para  equipos de suscriptores. Se asocia a una suscripcion base';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriptions_prices_team`
--

LOCK TABLES `suscriptions_prices_team` WRITE;
/*!40000 ALTER TABLE `suscriptions_prices_team` DISABLE KEYS */;
INSERT INTO `suscriptions_prices_team` VALUES (1,1,10,100,45),(2,1,100,1000,40),(3,1,1000,99999999,35);
/*!40000 ALTER TABLE `suscriptions_prices_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriptions_services`
--

DROP TABLE IF EXISTS `suscriptions_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscriptions_services` (
  `suscriptions_id` int NOT NULL,
  `services_id` int NOT NULL,
  PRIMARY KEY (`suscriptions_id`,`services_id`),
  KEY `suscriptions_services_FK_1` (`services_id`),
  CONSTRAINT `suscriptions_services_FK` FOREIGN KEY (`suscriptions_id`) REFERENCES `suscriptions` (`id`),
  CONSTRAINT `suscriptions_services_FK_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad de relación para determinar que servicios incluye cada suscripcion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriptions_services`
--

LOCK TABLES `suscriptions_services` WRITE;
/*!40000 ALTER TABLE `suscriptions_services` DISABLE KEYS */;
INSERT INTO `suscriptions_services` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(3,8),(3,9),(3,10);
/*!40000 ALTER TABLE `suscriptions_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_FK` (`user_id`),
  CONSTRAINT `teams_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de equipos creados por  usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Equipo 1','Alguna descripcion ',1);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_users`
--

DROP TABLE IF EXISTS `teams_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teams_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_users_FK` (`user_id`),
  KEY `teams_users_FK_1` (`teams_id`),
  CONSTRAINT `teams_users_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `teams_users_FK_1` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relación de los usuarios pertenecientes a un equipo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_users`
--

LOCK TABLES `teams_users` WRITE;
/*!40000 ALTER TABLE `teams_users` DISABLE KEYS */;
INSERT INTO `teams_users` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `teams_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabla de usuarios del aplicativo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','1','2',NULL,'admin@gmail.com',10,1,1),(2,'biottmau','1','2',NULL,'biottmau@gmail.com',10,1,1),(3,'biottux','1','2',NULL,'mauro@biott.com.ar',10,1,1),(4,'exercise1','1','2',NULL,'exer1@gmail.com',10,1,1),(5,'usernull','1','3',NULL,'usernul@gmail.com',10,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access`
--

DROP TABLE IF EXISTS `user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitud` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_access_FK` (`user_id`),
  CONSTRAINT `user_access_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad encargada de registrar el momento y desde que lugar accede a la App un usuario.  Se determina registrar muchos accesos por usuario con el fin de dejar previsto datos estadisticos a futuro, y a su vez determinar cuando fue la ultima vez y de donde entra un usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access`
--

LOCK TABLES `user_access` WRITE;
/*!40000 ALTER TABLE `user_access` DISABLE KEYS */;
INSERT INTO `user_access` VALUES (1,'2020-10-08 19:59:19',1,-54.8198,-68.3333),(2,'2020-10-08 20:01:15',2,-51.6327,-69.2886),(3,'2020-10-08 20:03:09',3,-43.2545,-65.3067),(4,'2020-10-08 20:03:09',4,-36.6124,-64.2983),(5,'2020-10-09 03:41:59',2,-51.6179,-69.2186);
/*!40000 ALTER TABLE `user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'alitaware'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 15:56:56
