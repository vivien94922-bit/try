-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopdb
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '5a7388a0-1152-11f1-9bcd-d8bbc172bc6a:1-1867';

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `size` varchar(10) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`,`size`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,1,'2026-06-10 15:36:08','M'),(6,4,1,1,'2026-06-12 08:28:52','M');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `id` int NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,293);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_member_product` (`member_id`,`product_id`),
  KEY `fk_fav_product` (`product_id`),
  CONSTRAINT `fk_fav_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fav_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (22,5,1,'2026-06-14 17:34:04'),(36,7,2,'2026-06-14 18:41:41'),(37,7,3,'2026-06-14 18:41:42'),(64,9,1,'2026-06-18 06:18:47');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'admin','f779c166dcadf4974f12c83bce5e471bc52497efbf76e479de64ac9b71257306','e34b7027807746239bc4a8749f24ff4c','管理員','admin@standardday.com','0900000000','admin','2026-06-10 07:53:35'),(2,'demo','2b6eb4b86c9996febd1b89f901a9efccfdb23a63a04c8ef079d06ab21f78ddd3','1122334455667788','示範會員','demo@standardday.com','0911111111','user','2026-06-10 07:53:35'),(3,'vivien','8d76f6a1596ac79dee2ed235f4c18d15462ba96aacbbceab494214f9f87908a3','2ec974b53f0ea192838581155f670c9b','測試者1','demo@standardday.com','031254678','user','2026-06-10 08:00:10'),(4,'hello','818087703bbf36389200843bef2cacd02a57246148721a1e0929a0538ed8c924','127a641fcd877da0e700c044d0100cfb','安安','dmiejmf456418@gmail.com','0912345687','user','2026-06-12 08:27:46'),(5,'willy','48913eb4f3a71a4551684fbc84e8491726c1ffc0dc557ed290212504f733a190','4a0316c95589ce3b4f468819d3bdb1b6','1','1@2','0911111111','user','2026-06-14 16:56:00'),(7,'l','13eae443e3d1e7cd3a407cf7c3a41992d56b36dd44ae64695bce965055b1dbdf','6af595ba8f50bccffad0fdf6c7fb841f','嗨嗨','2@2','0912345687','user','2026-06-14 18:41:06'),(9,'kit','fdaad71869c307e3887db7a3ffefb22dc7dc3a2d6a28fa6ef1284fda974f36b9','26a2019d719911f36a0f1cb62d2a30c7','1','1@2','0958293922','user','2026-06-18 06:18:08');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_order` (`order_id`),
  KEY `fk_item_product` (`product_id`),
  CONSTRAINT `fk_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (22,23,2,'百搭基礎牛仔褲',960,'M',1),(23,24,3,'時尚週限定條紋長裙',840,'M',2),(24,25,1,'VANTERA Edge Pro 極鋒商務行李箱',1280,'M',2),(25,26,1,'VANTERA Edge Pro 極鋒商務行李箱',1280,'M',1),(26,27,2,'VANTERA Wave Lite 流光輕旅行李箱',960,'M',1),(27,28,1,'VANTERA Edge Pro 極鋒商務行李箱',1280,'M',2),(28,29,1,'VANTERA Edge Pro 極鋒商務行李箱',1280,'M',2),(29,30,1,'VANTERA Edge Pro 極鋒商務行李箱',12800,'M',1),(30,31,1,'VANTERA Edge Pro 極鋒商務行李箱',12800,'M',1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `member_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payment` varchar(20) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,21,'0978945612','測試者2','桃園市中壢區','credit',1280,'pending','2026-06-14 18:44:08'),(3,22,'09123456789','測','新北市','credit',1100,'pending','2026-06-15 06:35:15'),(3,23,'1','測試者1','1','credit',2020,'pending','2026-06-15 07:07:50'),(3,24,'0978945612','現在測試','桃園市楊梅區','credit',3460,'pending','2026-06-15 07:08:35'),(3,25,'1','測試者2','桃園市中壢區','credit',5120,'pending','2026-06-17 21:31:28'),(3,26,'0978945612','測試者1','1','credit',2660,'pending','2026-06-17 23:04:31'),(3,27,'2','2','2','credit',2020,'pending','2026-06-17 23:40:46'),(3,28,'3','3','3','credit',5120,'pending','2026-06-17 23:43:00'),(3,29,'3','3','3','credit',5120,'pending','2026-06-18 05:10:49'),(9,30,'1','測試者1','桃園市中壢區','linepay',25600,'pending','2026-06-18 06:20:45'),(3,31,'0978945612','測試者1','1@1','credit',25600,'pending','2026-06-19 09:43:21');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `category` varchar(20) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'VANTERA Edge Pro 極鋒商務行李箱',12800,'images/01_0.png','專為高階商務人士打造。採用俐落的硬派線條與前開式快取設計，內建獨立筆電防震層，讓您在高鐵與機場安檢時優雅通關，展現極致的都會專業魅力。','boarding',6,'2026-06-10 07:53:35'),(2,'VANTERA Wave Lite 流光輕旅行李箱',9600,'images/02_0.png','主打極致輕量化與流線型美學。羽量級的外殼大幅減輕出行負擔，搭配頂級複合抗壓材質與靜音萬向輪，是您週末隨興出遊、城市輕旅行的最佳美型夥伴。','boarding',28,'2026-06-10 07:53:35'),(3,'VANTERA Ocean Flow 深海律動行李箱',8400,'images/03_0.png','以深海漸進浪韻為靈感設計。外殼具備極高彈性與耐衝擊防護，大容量高覆蓋率收納空間，最適合海島度假與全家放鬆行程，隨時感受自由律動。','family',15,'2026-06-10 07:53:35'),(4,'VANTERA Crystal Air 晶鑽輕航行李箱',5900,'images/04_0.png','獨特的立體晶鑽切面外殼，在光線下折射出輕奢質感。兼具極輕量化空航規格與高剛性防刮塗層，深受女性與頻繁飛行者喜愛，讓每一次登機都是時尚亮點。','boarding',24,'2026-06-10 07:53:35'),(5,'VANTERA Carbon Elite 碳纖旗艦行李箱',11000,'images/05_0.png','頂級工藝與尖端材料的結晶。採用碳纖維紋理複合結構，具備全系列最高階的抗壓、防震與耐低溫性能，能完美保護箱內貴重物品，無懼任何惡劣託運環境。','travel',14,'2026-06-10 07:53:35'),(6,'VANTERA Urban Black 都會極簡行李箱',12800,'images/06_0.png','沉穩霧黑低調設計，不帶一絲多餘線條。極簡主義外觀下擁有高效率的雙面減震隔板與魔術收納空間，完美融入現代都會的各種移動與出差情境。','boarding',13,'2026-06-10 07:53:35'),(7,'VANTERA Cube White 純境方格行李箱',12800,'images/07_0.png','採用大受好評的 3:7 比例深層胖胖箱設計。純白純淨方格美學，超深主艙能輕鬆塞入電器、厚重衣物或孩童大玩具，全家度假、海外代購一箱搞定。','family',22,'2026-06-10 07:53:35'),(8,'VANTERA Titan Gold 鈦金尊爵行李箱',5900,'images/08_0.png','象徵尊榮地位的鈦金色調，搭配四角全金屬防撞包角。高剛性鋁合金框架與強化防盜鎖具，提供鋼鐵般的極致防護，專為長途蜜月、高階奢華度假量身打造。','travel',40,'2026-06-10 07:53:35'),(9,'VANTERA Smart Pocket 智慧前開商務箱',6800,'images/09_0.png','直立式前開專利口袋設計，免將行李箱躺平即可快速取放 15.6 吋筆電、護照與隨身行動電源。內建一體化防盜海關鎖，智慧出行、出差效率再升級。','boarding',35,'2026-06-10 07:53:35'),(10,'VANTERA Steel Line 鋼曜旅行行李箱',6900,'images/10_0.png','剛毅的鋼曜線條塗層，外殼具備業界頂級的防刮、耐磨損特性。多段式加粗鋁合金拉桿與防爆拉鍊設計，專為高頻率跨國壯遊設計，禁得起每一次地勤託運考驗。','travel',28,'2026-06-10 07:53:35'),(11,'VANTERA Forest Metal 森嶼金屬行李箱',7400,'images/11_0.png','採用全鋁鎂合金硬殼框架，無拉鍊的密封式金屬防盜鎖扣，徹底杜絕被原子筆劃開的風險。森林系輕奢配色，兼具極致防禦力與戶外野性美學。','travel',26,'2026-06-10 07:53:35'),(12,'VANTERA Platinum Classic 鉑金經典行李箱',7300,'images/12_0.png','致敬百年旅行傳統的經典條紋設計。高雅鉑金光澤外殼，內部配備豐富的雙面全包覆式網袋與X型束帶，大容量、好推拉，是不可或缺的長途跨國經典託運箱。','travel',12,'2026-06-10 07:53:35'),(13,'VANTERA Executive Black 尊榮商務行李箱',11900,'images/13_0.png','專為企業主管與跨國商務艙常客定製。極致黑高彈性箱體與隱藏式吊掛吊帶，內部採用奢華抗菌內襯，完美收納西裝與商務正裝，彰顯不凡的商務風範。','boarding',14,'2026-06-10 07:53:35'),(14,'VANTERA Graphite Prime 曜石旗艦行李箱',3500,'images/14_0.png','石墨灰曜石質感外殼，導入最新微奈米防刮微粒塗層。全箱配備一體成型頂級避震輪，面對石磚路或顛簸路面依然絲滑靜音，是追求完美細節者的旗艦首選。','travel',33,'2026-06-10 07:53:35'),(15,'VANTERA Champagne Luxe 香檳奢旅行李箱',12000,'images/15_0.png','優雅迷人的香檳金網美色調。擁有頂級雙面全隔板豪華收納系統，方便大衣、保養品與紀念品分類分類。高顏值外觀，讓您在旅途中隨手一拍都是時尚大片。','family',31,'2026-06-10 07:53:35');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `content` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_comment_product` (`product_id`),
  KEY `fk_comment_member` (`user_id`),
  CONSTRAINT `fk_comment_member` FOREIGN KEY (`user_id`) REFERENCES `members` (`id`),
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` VALUES (1,1,2,'demo',5,'高 CP 值的精品級行李箱','2026-06-01 02:00:00'),(2,1,2,'demo',4,'售後服務跟出貨速度都很棒','2026-06-03 06:30:00'),(3,1,2,'demo',5,'帶小孩出門的收納救星','2026-06-05 01:15:00'),(4,1,1,'vivien',5,'出國五天，M 碼非常夠裝！','2026-06-10 14:37:59'),(5,1,1,'vivien',5,'霧面鈦金質感絕佳，空間隔層很貼心','2026-06-10 14:41:28'),(6,1,1,'vivien',5,'全鋁鎂合金的保護力就是安心','2026-06-10 14:41:38'),(13,2,3,'vivien',5,'很喜歡','2026-06-17 22:49:45'),(15,4,3,'vivien',5,'1','2026-06-18 05:11:19');
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'VANTERA Edge Pro 極鋒商務行李箱',1280,8,'images/01.jpg','專為高階商務人士打造。採用俐落的硬派線條與前開式快取設計，內建獨立筆電防震層，讓您在高鐵與機場安檢時優雅通關，展現極致的都會專業魅力。','boarding'),(2,'VANTERA Wave Lite 流光輕旅行李箱',960,10,'images/02.jpg','主打極致輕量化與流線型美學。羽量級的外殼大幅減輕出行負擔，搭配頂級複合抗壓材質與靜音萬向輪，是您週末隨興出遊、城市輕旅行的最佳美型夥伴。','boarding'),(3,'VANTERA Ocean Flow 深海律動行李箱',840,10,'images/03.jpg','以深海漸進浪韻為靈感設計。外殼具備極高彈性與耐衝擊防護，大容量高覆蓋率收納空間，最適合海島度假與全家放鬆行程，隨時感受自由律動。','family'),(4,'VANTERA Crystal Air 晶鑽輕航行李箱',550,10,'images/04.jpg','獨特的立體晶鑽切面外殼，在光線下折射出輕奢質感。兼具極輕量化空航規格與高剛性防刮塗層，深受女性與頻繁飛行者喜愛，讓每一次登機都是時尚亮點。','boarding'),(5,'VANTERA Carbon Elite 碳纖旗艦行李箱',1100,10,'images/05.jpg','頂級工藝與尖端材料的結晶。採用碳纖維紋理複合結構，具備全系列最高階的抗壓、防震與耐低溫性能，能完美保護箱內貴重物品，無懼任何惡劣託運環境。','travel'),(6,'VANTERA Urban Black 都會極簡行李箱',1280,10,'images/06.jpg','沉穩霧黑低調設計，不帶一絲多餘線條。極簡主義外觀下擁有高效率的雙面減震隔板與魔術收納空間，完美融入現代都會的各種移動與出差情境。','boarding'),(7,'VANTERA Cube White 純境方格行李箱',1280,10,'images/07.jpg','採用大受好評的 3:7 比例深層胖胖箱設計。純白純淨方格美學，超深主艙能輕鬆塞入電器、厚重衣物或孩童大玩具，全家度假、海外代購一箱搞定。','family'),(8,'VANTERA Titan Gold 鈦金尊爵行李箱',590,10,'images/08.jpg','象徵尊榮地位的鈦金色調，搭配四角全金屬防撞包角。高剛性鋁合金框架與強化防盜鎖具，提供鋼鐵般的極致防護，專為長途蜜月、高階奢華度假量身打造。','travel'),(9,'VANTERA Smart Pocket 智慧前開商務箱',690,10,'images/09.jpg','直立式前開專利口袋設計，免將行李箱躺平即可快速取放 15.6 吋筆電、護照與隨身行動電源。內建一體化防盜海關鎖，智慧出行、出差效率再升級。','boarding'),(10,'VANTERA Steel Line 鋼曜旅行行李箱',690,10,'images/10.jpg','剛毅的鋼曜線條塗層，外殼具備業界頂級的防刮、耐磨損特性。多段式加粗鋁合金拉桿與防爆拉鍊設計，專為高頻率跨國壯遊設計，禁得起每一次地勤託運考驗。','travel'),(11,'VANTERA Forest Metal 森嶼金屬行李箱',730,10,'images/11.jpg','採用全鋁鎂合金硬殼框架，無拉鍊的密封式金屬防盜鎖扣，徹底杜絕被原子筆劃開的風險。森林系輕奢配色，兼具極致防禦力與戶外野性美學。','travel'),(12,'VANTERA Platinum Classic 鉑金經典行李箱',730,10,'images/12.jpg','致敬百年旅行傳統的經典條紋設計。高雅鉑金光澤外殼，內部配備豐富的雙面全包覆式網袋與X型束帶，大容量、好推拉，是不可或缺的長途跨國經典託運箱。','travel'),(13,'VANTERA Executive Black 尊榮商務行李箱',1190,10,'images/13.jpg','專為企業主管與跨國商務艙常客定製。極致黑高彈性箱體與隱藏式吊掛吊帶，內部採用奢華抗菌內襯，完美收納西裝與商務正裝，彰顯不凡的商務風範。','boarding'),(14,'VANTERA Graphite Prime 曜石旗艦行李箱',350,20,'images/14.jpg','石墨灰曜石質感外殼，導入最新微奈米防刮微粒塗層。全箱配備一體成型頂級避震輪，面對石磚路或顛簸路面依然絲滑靜音，是追求完美細節者的旗艦首選。','travel'),(15,'VANTERA Champagne Luxe 香檳奢旅行李箱',440,20,'images/15.jpg','優雅迷人的香檳金網美色調。擁有頂級雙面全隔板豪華收納系統，方便大衣、保養品與紀念品分類分類。高顏值外觀，讓您在旅途中隨手一拍都是時尚大片。','family');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','1234','admin','2026-06-12 17:18:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-19 17:54:40
