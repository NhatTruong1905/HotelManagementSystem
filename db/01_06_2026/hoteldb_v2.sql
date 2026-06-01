-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hoteldb_v2
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `expected_check_in` date NOT NULL,
  `expected_check_out` date NOT NULL,
  `actual_check_in` datetime DEFAULT NULL,
  `actual_check_out` datetime DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT '0.00',
  `special_request` text,
  `status` enum('PENDING','CONFIRMED','CHECKED_IN','CHECKED_OUT','CANCELLED') DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_dates` CHECK ((`expected_check_out` > `expected_check_in`))
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,'2026-05-20','2026-05-22','2026-05-20 14:05:00','2026-05-22 11:30:00',1400000.00,'Xin phòng tầng thấp, yên tĩnh','CHECKED_OUT','2026-05-24 09:50:46','2026-05-24 09:50:46'),(2,2,'2026-05-23','2026-05-25','2026-05-23 15:10:00',NULL,3600000.00,'Kỷ niệm ngày cưới, setup hoa hồng trên giường','CHECKED_IN','2026-05-24 09:50:46','2026-05-24 09:50:46'),(3,3,'2026-06-01','2026-06-05',NULL,NULL,10000000.00,'Cần xuất hóa đơn VAT cho công ty','CONFIRMED','2026-05-24 09:50:46','2026-05-24 09:50:46'),(4,4,'2026-05-26','2026-05-28',NULL,NULL,1800000.00,NULL,'CANCELLED','2026-05-24 09:50:46','2026-05-24 09:50:46'),(5,5,'2026-05-15','2026-05-16',NULL,NULL,0.00,'Bận lịch đột xuất nên hủy','CANCELLED','2026-05-24 09:50:46','2026-05-24 09:50:46'),(42,33,'2026-05-30','2026-05-31',NULL,NULL,2000000.00,NULL,'CANCELLED','2026-05-30 01:28:53','2026-05-30 01:28:53'),(43,39,'2026-05-30','2026-05-31',NULL,NULL,2000000.00,NULL,'CONFIRMED','2026-05-30 01:29:42','2026-05-30 01:29:42'),(44,38,'2026-06-13','2026-06-14',NULL,NULL,2565000.00,NULL,'CANCELLED','2026-05-30 01:35:34','2026-05-30 01:35:34'),(45,40,'2026-06-13','2026-06-14',NULL,NULL,2565000.00,NULL,'CANCELLED','2026-05-30 01:36:35','2026-05-30 01:36:35'),(46,41,'2026-06-06','2026-06-07',NULL,NULL,2565000.00,NULL,'CONFIRMED','2026-05-30 01:38:04','2026-05-30 01:38:04'),(47,35,'2026-06-06','2026-06-07',NULL,NULL,2565000.00,NULL,'CONFIRMED','2026-05-30 11:44:56','2026-05-30 19:01:38'),(48,33,'2026-05-30','2026-05-31',NULL,NULL,3320000.00,NULL,'CANCELLED','2026-05-30 12:03:57','2026-05-30 12:03:57'),(49,38,'2026-06-06','2026-06-07',NULL,NULL,3320000.00,NULL,'CANCELLED','2026-05-30 12:04:56','2026-05-30 12:04:56'),(50,33,'2026-06-20','2026-06-25',NULL,NULL,12590000.00,NULL,'CANCELLED','2026-05-30 12:09:36','2026-05-30 12:09:36'),(51,35,'2026-06-20','2026-06-25',NULL,NULL,12590000.00,NULL,'CANCELLED','2026-05-30 12:09:53','2026-05-30 12:09:53'),(52,35,'2026-06-20','2026-06-25',NULL,NULL,13320000.00,NULL,'CANCELLED','2026-05-30 12:18:59','2026-05-30 12:18:59'),(53,33,'2026-06-20','2026-06-25',NULL,NULL,14900000.00,NULL,'CANCELLED','2026-05-30 12:25:49','2026-05-30 12:25:49'),(54,33,'2026-06-01','2026-06-06',NULL,NULL,13345000.00,NULL,'CANCELLED','2026-05-31 18:56:08','2026-05-31 18:56:08'),(55,33,'2026-06-01','2026-06-06',NULL,NULL,38300000.00,NULL,'CANCELLED','2026-05-31 19:22:14','2026-05-31 19:22:14'),(56,36,'2026-06-01','2026-06-06',NULL,NULL,25900000.00,NULL,'CANCELLED','2026-05-31 20:04:55','2026-05-31 20:04:55'),(57,36,'2026-06-01','2026-06-06',NULL,NULL,25900000.00,NULL,'CANCELLED','2026-05-31 20:05:09','2026-05-31 20:05:09'),(58,36,'2026-06-01','2026-06-06',NULL,NULL,25900000.00,NULL,'CANCELLED','2026-05-31 20:07:34','2026-05-31 20:07:34'),(59,36,'2026-06-01','2026-06-06',NULL,NULL,25000000.00,NULL,'CANCELLED','2026-05-31 20:14:26','2026-05-31 20:14:26'),(60,36,'2026-06-01','2026-06-06',NULL,NULL,25800000.00,NULL,'CANCELLED','2026-05-31 20:26:01','2026-05-31 20:26:01'),(61,36,'2026-06-01','2026-06-06',NULL,NULL,25800000.00,NULL,'CANCELLED','2026-05-31 20:26:21','2026-05-31 20:26:21'),(62,36,'2026-06-01','2026-06-06',NULL,NULL,25800000.00,NULL,'CANCELLED','2026-05-31 20:26:33','2026-05-31 20:26:33'),(63,36,'2026-06-01','2026-06-06',NULL,NULL,25065000.00,NULL,'CANCELLED','2026-05-31 21:10:29','2026-05-31 21:10:29'),(64,36,'2026-06-01','2026-06-06',NULL,NULL,25065000.00,NULL,'PENDING','2026-06-01 01:34:09','2026-06-01 01:34:09'),(65,36,'2026-06-01','2026-06-06',NULL,NULL,12565000.00,NULL,'CONFIRMED','2026-06-01 01:35:23','2026-06-01 01:35:23'),(66,36,'2026-06-01','2026-06-06',NULL,NULL,12565000.00,NULL,'CONFIRMED','2026-06-01 01:53:21','2026-06-01 01:53:21');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_room`
--

DROP TABLE IF EXISTS `booking_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `room_id` int NOT NULL,
  `price_at_booking` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `booking_room_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `booking_room_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_room`
--

LOCK TABLES `booking_room` WRITE;
/*!40000 ALTER TABLE `booking_room` DISABLE KEYS */;
INSERT INTO `booking_room` VALUES (1,1,2,700000.00),(2,2,5,1200000.00),(3,3,7,2500000.00),(44,43,5,1200000.00),(47,46,8,2500000.00),(75,64,28,2500000.00),(76,64,29,2500000.00),(77,65,30,2500000.00),(78,66,8,2500000.00);
/*!40000 ALTER TABLE `booking_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_service`
--

DROP TABLE IF EXISTS `booking_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `service_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `price_at_usage` decimal(15,2) NOT NULL,
  `note` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `booking_service_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `booking_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_service`
--

LOCK TABLES `booking_service` WRITE;
/*!40000 ALTER TABLE `booking_service` DISABLE KEYS */;
INSERT INTO `booking_service` VALUES (1,1,1,2,150000.00,'Ăn sáng buffet 2 người ngày 21/05','2026-05-24 09:50:46'),(2,1,6,2,20000.00,'Sử dụng 2 chai nước suối trong minibar','2026-05-24 09:50:46'),(3,2,4,1,550000.00,'Gói massage tinh dầu cho vợ','2026-05-24 09:50:46'),(4,2,3,1,350000.00,'Đón tại sân bay Tân Sơn Nhất chuyến 14h, mã chuyến bay VN204','2026-05-24 09:50:46'),(5,2,8,1,800000.00,'Set menu tối ngày kỷ niệm tại nhà hàng','2026-05-24 09:50:46'),(39,43,8,1,800000.00,NULL,'2026-05-30 01:29:42'),(44,46,7,1,45000.00,NULL,'2026-05-30 01:38:04'),(45,46,6,1,20000.00,NULL,'2026-05-30 01:38:04'),(71,64,7,1,45000.00,NULL,'2026-06-01 01:34:11'),(72,64,6,1,20000.00,NULL,'2026-06-01 01:34:11'),(73,65,7,1,45000.00,NULL,'2026-06-01 01:35:23'),(74,65,6,1,20000.00,NULL,'2026-06-01 01:35:23'),(75,66,7,1,45000.00,NULL,'2026-06-01 01:53:21'),(76,66,6,1,20000.00,NULL,'2026-06-01 01:53:21');
/*!40000 ALTER TABLE `booking_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text,
  `user_id` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nguyễn Văn A','nguyenvana@gmail.com','0945678901','123 Lê Lợi, Quận 1, TP.HCM',5,1),(2,'Phạm Tiến B','phamtien@yahoo.com','0956789012','456 Điện Biên Phủ, Bình Thạnh, TP.HCM',6,1),(3,'Lê Thị C','lethic123@gmail.com','0967890123','789 Nguyễn Trãi, Quận 5, TP.HCM',NULL,1),(4,'Trần Minh D','tranminhd@hotmail.com','0978901234','321 Võ Văn Ngân, Thủ Đức, TP.HCM',NULL,1),(5,'Hoàng Anh E','hoang.anh@company.vn','0989012345','654 Quang Trung, Gò Vấp, TP.HCM',NULL,1),(32,'Trần Chí Vĩ','cuuvi985@gmail.com','0967294349',NULL,39,1),(33,'Trường Nguyễn Đinh Nhật','tn699@gmail.com','0965487559',NULL,43,1),(34,'Lê Minh Heo','ndieep2336@gmail.com','0965487559',NULL,43,1),(35,'u11','tn696199@gmail.com','0965487559',NULL,43,1),(36,'tn696199@gmail.com','tn696199@gmail.com','0967294349',NULL,38,1),(37,'u11','tn69199@gmail.com','0965487559',NULL,43,1),(38,'Nhật Trường','tn696199@gmail.com','0967294349',NULL,43,1),(39,'HAHAHAHA','tn696199@gmail.com','0967294439',NULL,43,1),(40,'TUẤN LÀ THẰNG NGU','tn696199@gmail.com','0845784219',NULL,43,1),(41,'TUẤN LÀ THẰNG BÉO NGU NHƯ LỢN','tn696199@gmail.com','0965478559',NULL,43,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` enum('MOMO','VNPAY','CASH','BANK_TRANSFER') NOT NULL,
  `payment_context` enum('PAYMENT','REFUND') NOT NULL,
  `status` enum('PENDING','COMPLETED','FAILED') DEFAULT 'PENDING',
  `transaction_code` varchar(255) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `booking_id` (`booking_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,2,1400000.00,'VNPAY','PAYMENT','COMPLETED','VNPAY20260510_12345','Khách thanh toán 100% tiền phòng lúc đặt online','2026-05-10 02:15:00'),(2,1,2,340000.00,'CASH','PAYMENT','COMPLETED','CASH20260522_98765','Thanh toán tiền dịch vụ phát sinh (Ăn sáng + Minibar) tại quầy','2026-05-22 04:25:00'),(3,2,3,1800000.00,'MOMO','PAYMENT','COMPLETED','MOMO20260515_55566','Chuyển khoản cọc 50% tiền phòng giữ chỗ','2026-05-15 07:30:00'),(4,3,2,5000000.00,'BANK_TRANSFER','PAYMENT','PENDING','BANK20260524_11122','Khách báo đã chuyển khoản qua Vietcombank, chờ check biến động số dư','2026-05-24 03:00:00'),(21,43,NULL,2000000.00,'VNPAY','PAYMENT','COMPLETED','15562188','Thanh toán thành công qua VNPAY',NULL),(23,46,NULL,2565000.00,'VNPAY','PAYMENT','COMPLETED','15562211','Thanh toán thành công qua VNPAY',NULL),(24,52,NULL,13320000.00,'VNPAY','PAYMENT','PENDING',NULL,'Đang chờ thanh toán qua VNPAY',NULL),(25,64,NULL,25065000.00,'VNPAY','PAYMENT','PENDING',NULL,'Đang chờ thanh toán qua VNPAY',NULL),(26,65,NULL,12565000.00,'VNPAY','PAYMENT','COMPLETED','15564637','Thanh toán thành công qua VNPAY',NULL),(27,66,NULL,12565000.00,'VNPAY','PAYMENT','COMPLETED','15564652','Thanh toán thành công qua VNPAY',NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `floor` int DEFAULT NULL,
  `type_id` int NOT NULL,
  `status` enum('VACANT_CLEAN','VACANT_DIRTY','OCCUPIED_CLEAN','OCCUPIED_DIRTY') DEFAULT 'VACANT_CLEAN',
  `availability_status` enum('READY','MAINTENANCE') DEFAULT 'READY',
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_number` (`room_number`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `room_type` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'101',1,1,'VACANT_CLEAN','READY',1),(2,'102',1,2,'VACANT_CLEAN','READY',1),(3,'103',1,2,'OCCUPIED_CLEAN','READY',1),(4,'201',2,3,'VACANT_DIRTY','READY',1),(5,'202',2,4,'VACANT_CLEAN','READY',1),(6,'203',2,4,'VACANT_CLEAN','MAINTENANCE',1),(7,'301',3,5,'OCCUPIED_DIRTY','READY',1),(8,'302',3,5,'VACANT_CLEAN','READY',1),(9,'104',1,1,'VACANT_CLEAN','READY',1),(10,'105',1,1,'OCCUPIED_CLEAN','READY',1),(11,'106',1,1,'VACANT_DIRTY','READY',1),(12,'107',1,1,'VACANT_CLEAN','READY',1),(13,'108',1,2,'VACANT_CLEAN','READY',1),(14,'109',1,2,'OCCUPIED_DIRTY','READY',1),(15,'110',1,2,'VACANT_CLEAN','MAINTENANCE',1),(16,'111',1,2,'VACANT_CLEAN','READY',1),(17,'112',1,2,'OCCUPIED_CLEAN','READY',1),(18,'204',2,3,'VACANT_CLEAN','READY',1),(19,'205',2,3,'VACANT_DIRTY','READY',1),(20,'206',2,3,'OCCUPIED_CLEAN','READY',1),(21,'207',2,3,'VACANT_CLEAN','READY',1),(22,'208',2,3,'VACANT_CLEAN','MAINTENANCE',1),(23,'209',2,4,'OCCUPIED_DIRTY','READY',1),(24,'210',2,4,'VACANT_CLEAN','READY',1),(25,'303',3,4,'VACANT_CLEAN','READY',1),(26,'304',3,4,'VACANT_DIRTY','READY',1),(27,'305',3,4,'OCCUPIED_CLEAN','READY',1),(28,'306',3,5,'VACANT_CLEAN','READY',1),(29,'307',3,5,'OCCUPIED_DIRTY','READY',1),(30,'401',4,5,'VACANT_CLEAN','READY',1),(31,'402',4,5,'VACANT_CLEAN','MAINTENANCE',1),(32,'403',4,5,'OCCUPIED_CLEAN','READY',1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_inventory`
--

DROP TABLE IF EXISTS `room_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_type_id` int NOT NULL,
  `inventory_date` date NOT NULL,
  `total_rooms` int NOT NULL,
  `available_rooms` int NOT NULL,
  `reserved_rooms` int DEFAULT '0',
  `maintenance_rooms` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_type_id` (`room_type_id`,`inventory_date`),
  CONSTRAINT `room_inventory_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_inventory`
--

LOCK TABLES `room_inventory` WRITE;
/*!40000 ALTER TABLE `room_inventory` DISABLE KEYS */;
INSERT INTO `room_inventory` VALUES (1,1,'2026-05-24',1,1,0,0),(2,2,'2026-05-24',2,1,1,0),(3,3,'2026-05-24',1,1,0,0),(4,4,'2026-05-24',2,1,0,1),(5,5,'2026-05-24',2,1,1,0),(6,2,'2026-05-25',2,0,2,0);
/*!40000 ALTER TABLE `room_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `base_price` decimal(15,2) NOT NULL,
  `capacity` int DEFAULT '2',
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `room_type_chk_1` CHECK ((`base_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'Standard Single',500000.00,1,'Phòng tiêu chuẩn dành cho 1 người, diện tích 20m2, cửa sổ nhỏ.','https://images.unsplash.com/photo-1631049307264-da0ec9d70304?q=80&w=1080&auto=format&fit=crop',1),(2,'Standard Double',700000.00,2,'Phòng tiêu chuẩn dành cho 2 người, 1 giường đôi lớn, diện tích 25m2.','https://images.unsplash.com/photo-1566665797739-1674de7a421a?q=80&w=1080&auto=format&fit=crop',1),(3,'Superior Twin',900000.00,2,'Phòng Superior view thành phố, 2 giường đơn, ban công riêng.','https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=1080&auto=format&fit=crop',1),(4,'Deluxe City View',1200000.00,2,'Phòng Deluxe không gian rộng rãi 40m2, bồn tắm nằm, view toàn cảnh.','https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?q=80&w=1080&auto=format&fit=crop',1),(5,'Family Suite',2500000.00,4,'Phòng Suite cao cấp dành cho gia đình, 2 phòng ngủ, 1 phòng khách.','https://images.unsplash.com/photo-1578683010236-d716f9a3f461?q=80&w=1080&auto=format&fit=crop',1);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Buffet Sáng',150000.00,1),(2,'Giặt ủi (Combo 5kg)',120000.00,1),(3,'Xe đưa đón sân bay (4 chỗ)',350000.00,1),(4,'Spa & Massage Body (60 phút)',550000.00,1),(5,'Thuê xe máy tay ga (1 ngày)',150000.00,1),(6,'Minibar - Nước suối',20000.00,1),(7,'Minibar - Bia Heineken',45000.00,1),(8,'Set menu tối lãng mạn',800000.00,1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` enum('ROLE_ADMIN','ROLE_STAFF','ROLE_HOUSEKEEPING','ROLE_CUSTOMER') DEFAULT 'ROLE_CUSTOMER',
  `avatar` varchar(255) DEFAULT 'https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$12$QizkemSjp5BEqNmtar1LUuu.Ivi6nD0FUCj.MVH0ghJnX9Ag.5ln.','admin@hotel.com','0901234567','ROLE_ADMIN','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-24 09:50:46'),(2,'staff_le','$2a$12$QizkemSjp5BEqNmtar1LUuu.Ivi6nD0FUCj.MVH0ghJnX9Ag.5ln.','reception1@hotel.com','0912345678','ROLE_STAFF','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-24 09:50:46'),(3,'staff_tran','$2a$12$QizkemSjp5BEqNmtar1LUuu.Ivi6nD0FUCj.MVH0ghJnX9Ag.5ln.','reception2@hotel.com','0923456789','ROLE_STAFF','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-24 09:50:46'),(4,'hk_mai','$2a$12$QizkemSjp5BEqNmtar1LUuu.Ivi6nD0FUCj.MVH0ghJnX9Ag.5ln.','housekeeping@hotel.com','0934567890','ROLE_HOUSEKEEPING','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-24 09:50:46'),(5,'user_nguyen','$2a$12$QizkemSjp5BEqNmtar1LUuu.Ivi6nD0FUCj.MVH0ghJnX9Ag.5ln.','nguyenvana@gmail.com','0945678901','ROLE_CUSTOMER','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-24 09:50:46'),(6,'user_pham','$2a$12$QizkemSjp5BEqNmtar1LUuu.Ivi6nD0FUCj.MVH0ghJnX9Ag.5ln.','phamtien@yahoo.com','0956789012','ROLE_CUSTOMER','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-24 09:50:46'),(38,'tn696199@gmail.com','$2a$10$b6JD6RSsPKvkzFqMV9HBP.ihBxMoEQnCGjw58osU6.uNOu7SKxLRa','tn696199@gmail.com','0967294349','ROLE_CUSTOMER','https://lh3.googleusercontent.com/a/ACg8ocLJjx4UidqD6PPhEvvsUkI3Z5euNnuAZAPNFOg2Xz775VTw5oOjWw=s96-c',1,'2026-05-26 01:48:00'),(39,'Nhật Trường','$2a$10$CJ4J4uLcXcdsT/Cts20jEudRaIIdGbNGrDD1HZyiL7TJQLf4uHQuC','1766183164547004@facebook.com','0000000000','ROLE_CUSTOMER','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1766183164547004&height=200&width=200&ext=1782556162&hash=Afv99UmBickC-YtUlp5esnuN',1,'2026-05-26 01:48:55'),(43,'u11','$2a$10$OpiRCf0QHpfjYhNwhvCaNuZE7I5yfp1RdyuRf72cuwdgcqBzts6sW','tn699@gmail.com','0965487559','ROLE_CUSTOMER','https://res.cloudinary.com/dt1pa28g2/image/upload/v1766659167/dhtavt_r2rxdm.jpg',1,'2026-05-27 23:28:16');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-01 16:33:56
