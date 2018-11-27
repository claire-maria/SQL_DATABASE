CREATE DATABASE  IF NOT EXISTS `ddb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `ddb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: ddb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL,
  `disease_name_short` varchar(30) NOT NULL,
  `disease_name_long` varchar(300) NOT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'AIP','Acute Intermittent Porphyria'),(2,'cEDS','Classical Ehlers-Danlos Syndrome'),(3,'N/a','bacterial meningitis'),(4,'elevated potassium','hyperkalemia'),(5,'CFS/ME','myalgic encephalomyeltis'),(6,'CF','Cystic Fibrosis');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `disease_AFTER_INSERT` AFTER INSERT ON `disease` FOR EACH ROW BEGIN

INSERT INTO updates(u1,u2) VALUES (new.disease_id, new.disease_name_long);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `disease_medication`
--

DROP TABLE IF EXISTS `disease_medication`;
/*!50001 DROP VIEW IF EXISTS `disease_medication`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `disease_medication` AS SELECT 
 1 AS `disease_name`,
 1 AS `d_id1`,
 1 AS `d_id2`,
 1 AS `med_id`,
 1 AS `medication_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `disease_meds`
--

DROP TABLE IF EXISTS `disease_meds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disease_meds` (
  `med_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  UNIQUE KEY `med_id` (`med_id`,`disease_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `disease_meds_ibfk_1` FOREIGN KEY (`med_id`) REFERENCES `meds` (`med_id`),
  CONSTRAINT `disease_meds_ibfk_2` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_meds`
--

LOCK TABLES `disease_meds` WRITE;
/*!40000 ALTER TABLE `disease_meds` DISABLE KEYS */;
INSERT INTO `disease_meds` VALUES (1,1),(2,2),(3,3),(4,4),(5,4),(6,4),(7,4),(8,4),(9,5),(10,5),(11,5),(13,5),(14,5),(15,6),(16,6),(17,6);
/*!40000 ALTER TABLE `disease_meds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_symptoms`
--

DROP TABLE IF EXISTS `disease_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disease_symptoms` (
  `disease_id` int(11) NOT NULL,
  `symptom_id` int(11) NOT NULL,
  UNIQUE KEY `disease_id` (`disease_id`,`symptom_id`),
  KEY `symptom_id` (`symptom_id`),
  CONSTRAINT `disease_symptoms_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`),
  CONSTRAINT `disease_symptoms_ibfk_2` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`symptom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_symptoms`
--

LOCK TABLES `disease_symptoms` WRITE;
/*!40000 ALTER TABLE `disease_symptoms` DISABLE KEYS */;
INSERT INTO `disease_symptoms` VALUES (1,1),(1,2),(5,2),(1,3),(1,4),(3,4),(4,4),(1,5),(5,5),(1,6),(4,6),(5,6),(1,7),(4,7),(1,8),(4,8),(1,9),(1,10),(5,10),(1,11),(1,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(3,23),(5,23),(3,24),(3,25),(5,25),(3,26),(5,26),(5,27),(5,28),(5,29),(5,30),(6,31),(6,32),(6,33),(6,34);
/*!40000 ALTER TABLE `disease_symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_treatment`
--

DROP TABLE IF EXISTS `disease_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disease_treatment` (
  `t_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  UNIQUE KEY `disease_id` (`disease_id`,`t_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `disease_treatment_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`),
  CONSTRAINT `disease_treatment_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `treatment` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_treatment`
--

LOCK TABLES `disease_treatment` WRITE;
/*!40000 ALTER TABLE `disease_treatment` DISABLE KEYS */;
INSERT INTO `disease_treatment` VALUES (1,1),(2,2),(3,2),(4,2),(5,3),(6,4),(7,4),(7,5),(8,5),(9,5),(10,5),(11,5),(12,6),(13,6);
/*!40000 ALTER TABLE `disease_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `disease_treatments`
--

DROP TABLE IF EXISTS `disease_treatments`;
/*!50001 DROP VIEW IF EXISTS `disease_treatments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `disease_treatments` AS SELECT 
 1 AS `disease_name_long`,
 1 AS `treatment_name`,
 1 AS `d_id1`,
 1 AS `d_id2`,
 1 AS `t_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `meds`
--

DROP TABLE IF EXISTS `meds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `meds` (
  `med_id` int(11) NOT NULL,
  `med_name` varchar(150) NOT NULL,
  PRIMARY KEY (`med_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meds`
--

LOCK TABLES `meds` WRITE;
/*!40000 ALTER TABLE `meds` DISABLE KEYS */;
INSERT INTO `meds` VALUES (1,'Hemin/Panhematin'),(2,'non steroidal anti inflammatory medication'),(3,'Antibiotics'),(4,'insulin'),(5,'sodium bicarbonate'),(6,'beta agonists'),(7,'diuretics'),(8,'sodium polystyrene sulfonate'),(9,'adderal'),(10,'vyvanse'),(11,'ritalin'),(12,'amitriptyline'),(13,'antidepressants'),(14,'painkillers - OTC'),(15,'bronchodialaters'),(16,'mucus thinners'),(17,'digestive enzymes');
/*!40000 ALTER TABLE `meds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rare_diseases`
--

DROP TABLE IF EXISTS `rare_diseases`;
/*!50001 DROP VIEW IF EXISTS `rare_diseases`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `rare_diseases` AS SELECT 
 1 AS `disease_name_long`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rarity`
--

DROP TABLE IF EXISTS `rarity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rarity` (
  `disease_id` int(11) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `rarity_type` enum('common','rare','ultra_rare') DEFAULT NULL,
  PRIMARY KEY (`rarity_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `rarity_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rarity`
--

LOCK TABLES `rarity` WRITE;
/*!40000 ALTER TABLE `rarity` DISABLE KEYS */;
INSERT INTO `rarity` VALUES (1,1,'ultra_rare'),(2,2,'rare'),(3,3,'rare'),(4,4,'rare'),(5,5,'rare'),(6,6,'rare');
/*!40000 ALTER TABLE `rarity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rarity_diseases`
--

DROP TABLE IF EXISTS `rarity_diseases`;
/*!50001 DROP VIEW IF EXISTS `rarity_diseases`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `rarity_diseases` AS SELECT 
 1 AS `disease_name_long`,
 1 AS `rarity_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `severe_diseases`
--

DROP TABLE IF EXISTS `severe_diseases`;
/*!50001 DROP VIEW IF EXISTS `severe_diseases`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `severe_diseases` AS SELECT 
 1 AS `disease_name_long`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `severity`
--

DROP TABLE IF EXISTS `severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `severity` (
  `disease_id` int(11) NOT NULL,
  `severity_id` int(11) NOT NULL,
  `severity_type` enum('mild','moderate','severe') DEFAULT NULL,
  PRIMARY KEY (`severity_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `severity_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `severity`
--

LOCK TABLES `severity` WRITE;
/*!40000 ALTER TABLE `severity` DISABLE KEYS */;
INSERT INTO `severity` VALUES (1,1,'severe'),(2,2,'severe'),(3,3,'severe'),(4,4,'moderate'),(5,5,'moderate'),(6,6,'severe');
/*!40000 ALTER TABLE `severity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `severity_diseases`
--

DROP TABLE IF EXISTS `severity_diseases`;
/*!50001 DROP VIEW IF EXISTS `severity_diseases`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `severity_diseases` AS SELECT 
 1 AS `disease_name_long`,
 1 AS `severity_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_disease`
--

DROP TABLE IF EXISTS `show_disease`;
/*!50001 DROP VIEW IF EXISTS `show_disease`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `show_disease` AS SELECT 
 1 AS `disease_id`,
 1 AS `disease_name_short`,
 1 AS `disease_name_long`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `symptom_view`
--

DROP TABLE IF EXISTS `symptom_view`;
/*!50001 DROP VIEW IF EXISTS `symptom_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `symptom_view` AS SELECT 
 1 AS `symptom_id`,
 1 AS `symptom_name`,
 1 AS `symptom_desc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `symptoms` (
  `symptom_id` int(11) NOT NULL,
  `symptom_name` varchar(200) NOT NULL,
  `symptom_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`symptom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms`
--

LOCK TABLES `symptoms` WRITE;
/*!40000 ALTER TABLE `symptoms` DISABLE KEYS */;
INSERT INTO `symptoms` VALUES (1,'Severe Abdominal Pain','severe pain in abdomin'),(2,'chest/leg/back pain',NULL),(3,'bowel problems','constipation, diarrhea'),(4,'nausea/vomiting',NULL),(5,'mental changes','anxiety, confusion, paranoia, disorientation, hallucinations'),(6,'muscle issues','pain in muscles, tingling, weakness, numbness or paralysis are all symptoms'),(7,'dark urine',NULL),(8,'breathing problems',NULL),(9,'urination problems',NULL),(10,'irregular heartbeat','heart palpitations, rapid heartrate'),(11,'high blood pressure',NULL),(12,'seizures',NULL),(13,'skin abnormalities','smooth velevty skin that is highly elastic and bruises easily'),(14,'abnormal wound healing','may result in wide atrophic scars (flat/depressed scars)'),(15,'joint hypermobility',NULL),(16,'molluscoid psuedotumors','calcified hemotomas over pressure points such as the elbow'),(17,'subcutaneos spheroids','fat containing cysts often found on the shins/forearms'),(18,'hypotonia','poor muscle tone at birth'),(19,'delayed moter development',NULL),(20,'fragile tissue','can result in ruptured organs, hernia ect'),(21,'cardiovascular abnormabities','such as mitral valve prolapse'),(22,'pregnancy complications','rupture of womb in late term pregnancy'),(23,'headache',NULL),(24,'stiff neck',NULL),(25,'photophobia','increased sensitivity to light'),(26,'altered mental state','confusion'),(27,'brain fog','trouble thinking and concentrating'),(28,'muscle/joint pain',NULL),(29,'dizzyness',NULL),(30,'noise sensitivity','some frequences may be unbearable, and some noises may seem much louser than they are'),(31,'persistant cough',NULL),(32,'respiratory issues','wheezing, breathlessness, exercise intolerance, repeated lung infections'),(33,'poor weight gain and growth',NULL),(34,'severe constipation',NULL);
/*!40000 ALTER TABLE `symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `symptomsforeach`
--

DROP TABLE IF EXISTS `symptomsforeach`;
/*!50001 DROP VIEW IF EXISTS `symptomsforeach`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `symptomsforeach` AS SELECT 
 1 AS `disease_name_long`,
 1 AS `symptom_name`,
 1 AS `dis_id1`,
 1 AS `symptom_id`,
 1 AS `dis_id2`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `treatment` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(100) NOT NULL,
  `t_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'diet','during an attack, a carbohydrate based diet should be given to the patient'),(2,'occupational therapy','the use of particular activities as an aid to recouperation from physical or mental illness'),(3,'extra treatment required for wounds','Dermal wounds must be closed without tension, deeper wounds require extra stitching'),(4,'non steroidal anti inflammatory medication',NULL),(5,'antibiotics','must be treated ASAP'),(6,'hemodialiysis','machine to remove waste from blood,filters blood'),(7,'medication','see medication table'),(8,'CBT','cognitive behavioural therapy'),(9,'GET','graded exercise therapy'),(10,'activity management','setting goals, gradually trying to increase activity level, knowing own ability and acting accordingly'),(11,'equipment needs','potential need for wheelchar,parking pass ect'),(12,'airway clearing techniques','these include: active deep breathing techniques, gentle controlled breathing techniques to clear muscus from the lungs ect.'),(13,'lung transplant','may be required when symptoms severe');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `u1` int(11) DEFAULT NULL,
  `u2` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES (2,6,'Cystic Fibrosis');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ddb'
--

--
-- Dumping routines for database 'ddb'
--

--
-- Final view structure for view `disease_medication`
--

/*!50001 DROP VIEW IF EXISTS `disease_medication`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_medication` AS select `d`.`disease_name_long` AS `disease_name`,`d`.`disease_id` AS `d_id1`,`dm`.`disease_id` AS `d_id2`,`dm`.`med_id` AS `med_id`,`m`.`med_name` AS `medication_name` from ((`disease` `d` join `disease_meds` `dm`) join `meds` `m`) where ((`d`.`disease_id` = `dm`.`disease_id`) and (`m`.`med_id` = `dm`.`med_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disease_treatments`
--

/*!50001 DROP VIEW IF EXISTS `disease_treatments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_treatments` AS select `d`.`disease_name_long` AS `disease_name_long`,`t`.`t_name` AS `treatment_name`,`d`.`disease_id` AS `d_id1`,`dt`.`disease_id` AS `d_id2`,`dt`.`t_id` AS `t_id` from ((`disease` `d` join `disease_treatment` `dt`) join `treatment` `t`) where ((`d`.`disease_id` = `dt`.`disease_id`) and (`t`.`t_id` = `dt`.`t_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rare_diseases`
--

/*!50001 DROP VIEW IF EXISTS `rare_diseases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rare_diseases` AS select `d`.`disease_name_long` AS `disease_name_long` from (`disease` `d` join `rarity` `r` on((`r`.`rarity_id` = `d`.`disease_id`))) where (`r`.`rarity_type` = 'rare') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rarity_diseases`
--

/*!50001 DROP VIEW IF EXISTS `rarity_diseases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rarity_diseases` AS select `d`.`disease_name_long` AS `disease_name_long`,`r`.`rarity_type` AS `rarity_type` from (`disease` `d` join `rarity` `r` on((`r`.`rarity_id` = `d`.`disease_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `severe_diseases`
--

/*!50001 DROP VIEW IF EXISTS `severe_diseases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `severe_diseases` AS select `d`.`disease_name_long` AS `disease_name_long` from (`disease` `d` join `severity` `s` on((`s`.`severity_id` = `d`.`disease_id`))) where (`s`.`severity_type` = 'severe') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `severity_diseases`
--

/*!50001 DROP VIEW IF EXISTS `severity_diseases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `severity_diseases` AS select `d`.`disease_name_long` AS `disease_name_long`,`s`.`severity_type` AS `severity_type` from (`disease` `d` join `severity` `s` on((`s`.`severity_id` = `d`.`disease_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_disease`
--

/*!50001 DROP VIEW IF EXISTS `show_disease`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_disease` AS select `disease`.`disease_id` AS `disease_id`,`disease`.`disease_name_short` AS `disease_name_short`,`disease`.`disease_name_long` AS `disease_name_long` from `disease` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `symptom_view`
--

/*!50001 DROP VIEW IF EXISTS `symptom_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `symptom_view` AS select `symptoms`.`symptom_id` AS `symptom_id`,`symptoms`.`symptom_name` AS `symptom_name`,`symptoms`.`symptom_desc` AS `symptom_desc` from `symptoms` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `symptomsforeach`
--

/*!50001 DROP VIEW IF EXISTS `symptomsforeach`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `symptomsforeach` AS select `d`.`disease_name_long` AS `disease_name_long`,`s`.`symptom_name` AS `symptom_name`,`d`.`disease_id` AS `dis_id1`,`ds`.`symptom_id` AS `symptom_id`,`ds`.`disease_id` AS `dis_id2` from ((`disease` `d` join `disease_symptoms` `ds`) join `symptoms` `s`) where ((`d`.`disease_id` = `ds`.`disease_id`) and (`s`.`symptom_id` = `ds`.`symptom_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-27 18:04:22
