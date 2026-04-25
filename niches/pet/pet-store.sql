/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wp_pet
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 10,
  `args` varchar(191) DEFAULT NULL,
  `schedule` longtext DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_priority_scheduled_date_gmt` (`claim_id`,`status`,`priority`,`scheduled_date_gmt`),
  KEY `status_last_attempt_gmt` (`status`,`last_attempt_gmt`),
  KEY `status_claim_id` (`status`,`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_actions` VALUES
(6,'action_scheduler/migration_hook','complete','2026-04-18 11:33:08','2026-04-18 21:33:08',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776511988;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776511988;}',1,1,'2026-04-18 11:35:05','2026-04-18 21:35:05',3,NULL),
(7,'action_scheduler_run_recurring_actions_schedule_hook','complete','2026-04-18 11:35:03','2026-04-18 21:35:03',20,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776512103;s:18:\"\0*\0first_timestamp\";i:1776512103;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776512103;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',2,1,'2026-04-18 11:35:05','2026-04-18 21:35:05',3,NULL),
(8,'wc-admin_process_pending_orders_batch','complete','2026-04-18 11:35:04','2026-04-18 21:35:04',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776512104;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776512104;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-18 11:35:05','2026-04-18 21:35:05',3,NULL),
(9,'wc-admin_process_pending_orders_batch','complete','2026-04-18 23:35:05','2026-04-19 09:35:05',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776555305;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776555305;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(10,'woocommerce_scheduled_sales','complete','2026-04-18 14:00:00','2026-04-19 00:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776520800;s:18:\"\0*\0first_timestamp\";i:1776520800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776520800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-18 14:09:44','2026-04-19 00:09:44',35,NULL),
(11,'woocommerce_cancel_unpaid_orders','complete','2026-04-18 12:35:05','2026-04-18 22:35:05',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776515705;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776515705;}',4,1,'2026-04-18 13:24:48','2026-04-18 23:24:48',14,NULL),
(12,'woocommerce_cleanup_personal_data','complete','2026-04-18 11:35:15','2026-04-18 21:35:15',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776512115;s:18:\"\0*\0first_timestamp\";i:1776512115;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776512115;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-18 11:36:23','2026-04-18 21:36:23',6,NULL),
(13,'woocommerce_cleanup_logs','complete','2026-04-18 17:00:00','2026-04-19 03:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776531600;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776531600;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(14,'woocommerce_cleanup_sessions','complete','2026-04-18 20:00:00','2026-04-19 06:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776542400;s:18:\"\0*\0first_timestamp\";i:1776542400;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776542400;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(15,'woocommerce_geoip_updater','complete','2026-04-18 20:00:00','2026-04-19 06:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776542400;s:18:\"\0*\0first_timestamp\";i:1776542400;s:13:\"\0*\0recurrence\";i:1296000;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776542400;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:1296000;}',4,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(16,'woocommerce_cleanup_rate_limits_wrapper','complete','2026-04-18 17:00:00','2026-04-19 03:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776531600;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776531600;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(17,'wc_admin_daily_wrapper','complete','2026-04-18 11:35:05','2026-04-18 21:35:05',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776512105;s:18:\"\0*\0first_timestamp\";i:1776512105;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776512105;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-18 11:35:06','2026-04-18 21:35:06',4,NULL),
(18,'generate_category_lookup_table_wrapper','complete','2026-04-18 11:35:15','2026-04-18 21:35:15',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776512115;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776512115;}',4,1,'2026-04-18 11:36:23','2026-04-18 21:36:23',6,NULL),
(19,'woocommerce_refresh_order_count_cache','complete','2026-04-18 23:35:05','2026-04-19 09:35:05',10,'[\"shop_order\"]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776555305;s:18:\"\0*\0first_timestamp\";i:1776555305;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776555305;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',5,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(20,'action_scheduler_run_recurring_actions_schedule_hook','complete','2026-04-19 11:35:05','2026-04-19 21:35:05',20,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776598505;s:18:\"\0*\0first_timestamp\";i:1776512103;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776598505;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',2,1,'2026-04-19 11:55:43','2026-04-19 21:55:43',87,NULL),
(21,'wc_admin_daily_wrapper','complete','2026-04-19 11:35:06','2026-04-19 21:35:06',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776598506;s:18:\"\0*\0first_timestamp\";i:1776512105;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776598506;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-19 11:55:41','2026-04-19 21:55:41',87,NULL),
(22,'woocommerce_cleanup_personal_data','complete','2026-04-19 11:36:23','2026-04-19 21:36:23',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776598583;s:18:\"\0*\0first_timestamp\";i:1776512115;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776598583;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-19 11:55:42','2026-04-19 21:55:42',87,NULL),
(23,'woocommerce_cancel_unpaid_orders','complete','2026-04-18 14:24:48','2026-04-19 00:24:48',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776522288;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776522288;}',4,1,'2026-04-19 04:47:07','2026-04-19 14:47:07',37,NULL),
(24,'woocommerce_scheduled_sales','complete','2026-04-19 14:09:44','2026-04-20 00:09:44',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776607784;s:18:\"\0*\0first_timestamp\";i:1776520800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776607784;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-19 14:27:15','2026-04-20 00:27:15',125,NULL),
(25,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 05:47:07','2026-04-19 15:47:07',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776577627;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776577627;}',4,1,'2026-04-19 05:53:50','2026-04-19 15:53:50',54,NULL),
(26,'woocommerce_cleanup_logs','complete','2026-04-20 04:47:07','2026-04-20 14:47:07',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776660427;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776660427;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-20 11:32:22','2026-04-20 21:32:22',127,NULL),
(27,'woocommerce_cleanup_rate_limits_wrapper','complete','2026-04-20 04:47:07','2026-04-20 14:47:07',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776660427;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776660427;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-20 11:32:22','2026-04-20 21:32:22',127,NULL),
(29,'woocommerce_geoip_updater','pending','2026-05-04 04:47:07','2026-05-04 14:47:07',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777870027;s:18:\"\0*\0first_timestamp\";i:1776542400;s:13:\"\0*\0recurrence\";i:1296000;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777870027;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:1296000;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(30,'wc-admin_process_pending_orders_batch','complete','2026-04-19 16:47:07','2026-04-20 02:47:07',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776617227;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776617227;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-20 11:32:22','2026-04-20 21:32:22',127,NULL),
(31,'woocommerce_refresh_order_count_cache','complete','2026-04-19 16:47:07','2026-04-20 02:47:07',10,'[\"shop_order\"]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776617227;s:18:\"\0*\0first_timestamp\";i:1776555305;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776617227;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',5,1,'2026-04-20 11:32:22','2026-04-20 21:32:22',127,NULL),
(32,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 06:53:50','2026-04-19 16:53:50',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776581630;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776581630;}',4,1,'2026-04-19 08:01:12','2026-04-19 18:01:12',57,NULL),
(33,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 09:01:12','2026-04-19 19:01:12',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776589272;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776589272;}',4,1,'2026-04-19 09:29:18','2026-04-19 19:29:18',69,NULL),
(34,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 10:29:18','2026-04-19 20:29:18',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776594558;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776594558;}',4,1,'2026-04-19 10:41:32','2026-04-19 20:41:32',76,NULL),
(35,'action_scheduler/migration_hook','complete','2026-04-19 10:33:00','2026-04-19 20:33:00',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776594780;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776594780;}',1,1,'2026-04-19 10:41:32','2026-04-19 20:41:32',76,NULL),
(36,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 11:41:32','2026-04-19 21:41:32',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776598892;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776598892;}',4,1,'2026-04-19 11:55:42','2026-04-19 21:55:42',87,NULL),
(37,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:02:14','2026-04-19 21:02:14',10,'{\"obj_id\":41}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596534;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596534;}',6,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(38,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-19 11:02:10','2026-04-19 21:02:10',10,'[41,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596530;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596530;}',7,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(39,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:02:15','2026-04-19 21:02:15',10,'{\"obj_id\":42}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596535;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596535;}',6,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(40,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-19 11:02:11','2026-04-19 21:02:11',10,'[42,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596531;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596531;}',7,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(41,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:02:15','2026-04-19 21:02:15',10,'{\"obj_id\":43}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596535;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596535;}',6,1,'2026-04-19 11:12:19','2026-04-19 21:12:19',81,NULL),
(42,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-19 11:02:11','2026-04-19 21:02:11',10,'[43,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596531;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596531;}',7,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(43,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:02:16','2026-04-19 21:02:16',10,'{\"obj_id\":44}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596536;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596536;}',6,1,'2026-04-19 11:12:19','2026-04-19 21:12:19',81,NULL),
(44,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-19 11:02:12','2026-04-19 21:02:12',10,'[44,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596532;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596532;}',7,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(45,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:02:16','2026-04-19 21:02:16',10,'{\"obj_id\":45}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596536;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596536;}',6,1,'2026-04-19 11:12:19','2026-04-19 21:12:19',81,NULL),
(46,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-19 11:02:12','2026-04-19 21:02:12',10,'[45,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596532;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596532;}',7,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(47,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:02:17','2026-04-19 21:02:17',10,'{\"obj_id\":46}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596537;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596537;}',6,1,'2026-04-19 11:12:19','2026-04-19 21:12:19',81,NULL),
(48,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-19 11:02:13','2026-04-19 21:02:13',10,'[46,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776596533;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776596533;}',7,1,'2026-04-19 11:12:18','2026-04-19 21:12:18',81,NULL),
(50,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:19:44','2026-04-19 21:19:44',10,'{\"obj_id\":46}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776597584;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776597584;}',6,1,'2026-04-19 11:20:48','2026-04-19 21:20:48',84,NULL),
(52,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:19:48','2026-04-19 21:19:48',10,'{\"obj_id\":45}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776597588;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776597588;}',6,1,'2026-04-19 11:20:48','2026-04-19 21:20:48',84,NULL),
(54,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:19:52','2026-04-19 21:19:52',10,'{\"obj_id\":44}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776597592;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776597592;}',6,1,'2026-04-19 11:20:48','2026-04-19 21:20:48',84,NULL),
(56,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:19:56','2026-04-19 21:19:56',10,'{\"obj_id\":43}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776597596;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776597596;}',6,1,'2026-04-19 11:20:48','2026-04-19 21:20:48',84,NULL),
(58,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:20:00','2026-04-19 21:20:00',10,'{\"obj_id\":42}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776597600;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776597600;}',6,1,'2026-04-19 11:20:48','2026-04-19 21:20:48',84,NULL),
(60,'MailChimp_WooCommerce_Single_Product','complete','2026-04-19 11:20:04','2026-04-19 21:20:04',10,'{\"obj_id\":41}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776597604;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776597604;}',6,1,'2026-04-19 11:20:48','2026-04-19 21:20:48',84,NULL),
(61,'wc_admin_daily_wrapper','complete','2026-04-20 11:55:41','2026-04-20 21:55:41',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776686141;s:18:\"\0*\0first_timestamp\";i:1776512105;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776686141;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-20 12:00:20','2026-04-20 22:00:20',132,NULL),
(62,'woocommerce_cleanup_personal_data','complete','2026-04-20 11:55:42','2026-04-20 21:55:42',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776686142;s:18:\"\0*\0first_timestamp\";i:1776512115;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776686142;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-20 12:00:21','2026-04-20 22:00:21',132,NULL),
(63,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 12:55:42','2026-04-19 22:55:42',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776603342;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776603342;}',4,1,'2026-04-19 12:55:54','2026-04-19 22:55:54',104,NULL),
(64,'wc_stripe_database_cache_cleanup_async','complete','2026-04-20 01:00:00','2026-04-20 11:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776646800;s:18:\"\0*\0first_timestamp\";i:1776646800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776646800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',8,1,'2026-04-20 11:32:22','2026-04-20 21:32:22',127,NULL),
(65,'woocommerce_cleanup_sessions','complete','2026-04-19 20:00:00','2026-04-20 06:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776628800;s:18:\"\0*\0first_timestamp\";i:1776628800;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776628800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-20 11:32:22','2026-04-20 21:32:22',127,NULL),
(66,'generate_category_lookup_table_wrapper','complete','2026-04-19 11:55:53','2026-04-19 21:55:53',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776599753;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776599753;}',4,1,'2026-04-19 11:58:47','2026-04-19 21:58:47',89,NULL),
(67,'action_scheduler_run_recurring_actions_schedule_hook','complete','2026-04-20 11:55:43','2026-04-20 21:55:43',20,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776686143;s:18:\"\0*\0first_timestamp\";i:1776512103;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776686143;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',2,1,'2026-04-20 12:00:21','2026-04-20 22:00:21',132,NULL),
(68,'woocommerce_delete_legacy_report_transients','complete','2026-04-19 11:59:47','2026-04-19 21:59:47',10,'[0,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776599987;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776599987;}',4,1,'2026-04-19 12:00:36','2026-04-19 22:00:36',92,NULL),
(69,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 13:55:54','2026-04-19 23:55:54',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776606954;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776606954;}',4,1,'2026-04-19 14:27:15','2026-04-20 00:27:15',125,NULL),
(70,'woocommerce_delete_legacy_report_transients','complete','2026-04-19 13:06:46','2026-04-19 23:06:46',10,'[53,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776604006;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776604006;}',4,1,'2026-04-19 13:08:23','2026-04-19 23:08:23',115,NULL),
(71,'woocommerce_cancel_unpaid_orders','complete','2026-04-19 15:27:15','2026-04-20 01:27:15',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776612435;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776612435;}',4,1,'2026-04-20 11:32:21','2026-04-20 21:32:21',127,NULL),
(72,'woocommerce_scheduled_sales','complete','2026-04-20 14:27:15','2026-04-21 00:27:15',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776695235;s:18:\"\0*\0first_timestamp\";i:1776520800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776695235;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-20 21:52:52','2026-04-21 07:52:52',163,NULL),
(73,'woocommerce_cancel_unpaid_orders','complete','2026-04-20 12:32:21','2026-04-20 22:32:21',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776688341;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776688341;}',4,1,'2026-04-20 13:59:14','2026-04-20 23:59:14',161,NULL),
(74,'wc-admin_process_pending_orders_batch','complete','2026-04-20 23:32:22','2026-04-21 09:32:22',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776727942;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776727942;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-22 13:09:59','2026-04-22 23:09:59',165,NULL),
(75,'woocommerce_refresh_order_count_cache','complete','2026-04-20 23:32:22','2026-04-21 09:32:22',10,'[\"shop_order\"]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776727942;s:18:\"\0*\0first_timestamp\";i:1776555305;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776727942;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',5,1,'2026-04-22 13:09:59','2026-04-22 23:09:59',165,NULL),
(77,'wc_stripe_database_cache_cleanup_async','complete','2026-04-21 11:32:22','2026-04-21 21:32:22',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776771142;s:18:\"\0*\0first_timestamp\";i:1776646800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776771142;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',8,1,'2026-04-22 13:09:59','2026-04-22 23:09:59',165,NULL),
(78,'woocommerce_cleanup_logs','complete','2026-04-21 11:32:22','2026-04-21 21:32:22',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776771142;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776771142;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-22 13:10:00','2026-04-22 23:10:00',165,NULL),
(79,'woocommerce_cleanup_rate_limits_wrapper','complete','2026-04-21 11:32:22','2026-04-21 21:32:22',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776771142;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776771142;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-22 13:10:00','2026-04-22 23:10:00',165,NULL),
(80,'wc_admin_daily_wrapper','complete','2026-04-21 12:00:20','2026-04-21 22:00:20',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776772820;s:18:\"\0*\0first_timestamp\";i:1776512105;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776772820;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-22 13:10:03','2026-04-22 23:10:03',165,NULL),
(81,'woocommerce_cleanup_personal_data','complete','2026-04-21 12:00:21','2026-04-21 22:00:21',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776772821;s:18:\"\0*\0first_timestamp\";i:1776512115;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776772821;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-22 13:10:04','2026-04-22 23:10:04',165,NULL),
(82,'woocommerce_cleanup_sessions','complete','2026-04-20 20:00:00','2026-04-21 06:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776715200;s:18:\"\0*\0first_timestamp\";i:1776715200;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776715200;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-20 21:52:52','2026-04-21 07:52:52',163,NULL),
(83,'generate_category_lookup_table_wrapper','complete','2026-04-20 12:00:31','2026-04-20 22:00:31',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686431;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686431;}',4,1,'2026-04-20 12:04:26','2026-04-20 22:04:26',134,NULL),
(84,'action_scheduler_run_recurring_actions_schedule_hook','complete','2026-04-21 12:00:21','2026-04-21 22:00:21',20,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776772821;s:18:\"\0*\0first_timestamp\";i:1776512103;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776772821;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',2,1,'2026-04-22 13:10:05','2026-04-22 23:10:05',165,NULL),
(86,'MailChimp_WooCommerce_Single_Product','complete','2026-04-20 12:00:40','2026-04-20 22:00:40',10,'{\"obj_id\":61}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686440;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686440;}',6,1,'2026-04-20 12:04:26','2026-04-20 22:04:26',134,NULL),
(87,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-20 12:00:36','2026-04-20 22:00:36',10,'[61,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686436;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686436;}',7,1,'2026-04-20 12:04:26','2026-04-20 22:04:26',134,NULL),
(89,'MailChimp_WooCommerce_Single_Product','complete','2026-04-20 12:01:26','2026-04-20 22:01:26',10,'{\"obj_id\":64}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686486;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686486;}',6,1,'2026-04-20 12:04:27','2026-04-20 22:04:27',134,NULL),
(90,'woocommerce_run_product_attribute_lookup_update_callback','complete','2026-04-20 12:01:22','2026-04-20 22:01:22',10,'[64,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686482;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686482;}',7,1,'2026-04-20 12:04:27','2026-04-20 22:04:27',134,NULL),
(91,'woocommerce_delete_legacy_report_transients','complete','2026-04-20 12:06:10','2026-04-20 22:06:10',10,'[0,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686770;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686770;}',4,1,'2026-04-20 12:06:36','2026-04-20 22:06:36',137,NULL),
(92,'woocommerce_delete_legacy_report_transients','complete','2026-04-20 12:07:37','2026-04-20 22:07:37',10,'[66,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686857;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686857;}',4,1,'2026-04-20 12:08:35','2026-04-20 22:08:35',140,NULL),
(93,'wc_schedule_pending_batch_processes','complete','2026-04-20 12:06:57','2026-04-20 22:06:57',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686817;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686817;}',9,1,'2026-04-20 12:08:35','2026-04-20 22:08:35',140,NULL),
(94,'wc_run_batch_process','complete','2026-04-20 12:08:35','2026-04-20 22:08:35',10,'[\"Automattic\\\\WooCommerce\\\\Internal\\\\Logging\\\\OrderLogsDeletionProcessor\"]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776686915;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776686915;}',10,1,'2026-04-20 12:08:35','2026-04-20 22:08:35',141,NULL),
(95,'woocommerce_delete_legacy_report_transients','complete','2026-04-20 12:12:17','2026-04-20 22:12:17',10,'[66,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776687137;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776687137;}',4,1,'2026-04-20 12:14:58','2026-04-20 22:14:58',148,NULL),
(96,'wc_schedule_pending_batch_processes','complete','2026-04-20 12:11:43','2026-04-20 22:11:43',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776687103;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776687103;}',9,1,'2026-04-20 12:12:09','2026-04-20 22:12:09',145,NULL),
(97,'wc_run_batch_process','complete','2026-04-20 12:12:09','2026-04-20 22:12:09',10,'[\"Automattic\\\\WooCommerce\\\\Internal\\\\Logging\\\\OrderLogsDeletionProcessor\"]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776687129;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776687129;}',10,1,'2026-04-20 12:12:09','2026-04-20 22:12:09',146,NULL),
(98,'woocommerce_delete_legacy_report_transients','complete','2026-04-20 12:21:50','2026-04-20 22:21:50',10,'[66,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776687710;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776687710;}',4,1,'2026-04-20 12:25:55','2026-04-20 22:25:55',157,NULL),
(99,'woocommerce_delete_legacy_report_transients','complete','2026-04-20 12:29:12','2026-04-20 22:29:12',10,'[66,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776688152;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776688152;}',4,1,'2026-04-20 12:31:02','2026-04-20 22:31:02',159,NULL),
(100,'woocommerce_cancel_unpaid_orders','complete','2026-04-20 14:59:12','2026-04-21 00:59:12',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776697152;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776697152;}',4,1,'2026-04-20 21:52:52','2026-04-21 07:52:52',163,NULL),
(101,'woocommerce_scheduled_sales','complete','2026-04-21 21:52:52','2026-04-22 07:52:52',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776808372;s:18:\"\0*\0first_timestamp\";i:1776520800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776808372;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-22 13:10:05','2026-04-22 23:10:05',165,NULL),
(102,'woocommerce_cancel_unpaid_orders','complete','2026-04-20 22:52:52','2026-04-21 08:52:52',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776725572;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776725572;}',4,1,'2026-04-22 13:09:58','2026-04-22 23:09:58',165,NULL),
(103,'woocommerce_cleanup_sessions','complete','2026-04-21 09:52:52','2026-04-21 19:52:52',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776765172;s:18:\"\0*\0first_timestamp\";i:1776715200;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776765172;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-22 13:09:59','2026-04-22 23:09:59',165,NULL),
(104,'woocommerce_cancel_unpaid_orders','complete','2026-04-22 14:09:58','2026-04-23 00:09:58',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776866998;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776866998;}',4,1,'2026-04-23 02:34:44','2026-04-23 12:34:44',169,NULL),
(105,'wc-admin_process_pending_orders_batch','complete','2026-04-23 01:09:59','2026-04-23 11:09:59',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776906599;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776906599;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-23 02:34:44','2026-04-23 12:34:44',169,NULL),
(106,'woocommerce_refresh_order_count_cache','complete','2026-04-23 01:09:59','2026-04-23 11:09:59',10,'[\"shop_order\"]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776906599;s:18:\"\0*\0first_timestamp\";i:1776555305;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776906599;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',5,1,'2026-04-23 02:34:44','2026-04-23 12:34:44',169,NULL),
(109,'woocommerce_cleanup_logs','complete','2026-04-23 13:10:00','2026-04-23 23:10:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776949800;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776949800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-24 10:32:40','2026-04-24 20:32:40',226,NULL),
(110,'woocommerce_cleanup_rate_limits_wrapper','complete','2026-04-23 13:10:00','2026-04-23 23:10:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776949800;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776949800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-24 10:32:40','2026-04-24 20:32:40',226,NULL),
(111,'wc_admin_daily_wrapper','complete','2026-04-23 13:10:03','2026-04-23 23:10:03',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776949803;s:18:\"\0*\0first_timestamp\";i:1776512105;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776949803;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-24 10:32:42','2026-04-24 20:32:42',226,NULL),
(112,'woocommerce_cleanup_personal_data','complete','2026-04-23 13:10:05','2026-04-23 23:10:05',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776949805;s:18:\"\0*\0first_timestamp\";i:1776512115;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776949805;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-24 10:32:44','2026-04-24 20:32:44',226,NULL),
(113,'woocommerce_scheduled_sales','complete','2026-04-23 13:10:05','2026-04-23 23:10:05',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776949805;s:18:\"\0*\0first_timestamp\";i:1776520800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776949805;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,1,'2026-04-24 10:32:44','2026-04-24 20:32:44',226,NULL),
(114,'woocommerce_cleanup_sessions','complete','2026-04-22 20:00:00','2026-04-23 06:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776888000;s:18:\"\0*\0first_timestamp\";i:1776888000;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776888000;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-23 02:34:44','2026-04-23 12:34:44',169,NULL),
(115,'generate_category_lookup_table_wrapper','complete','2026-04-22 13:10:15','2026-04-22 23:10:15',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776863415;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776863415;}',4,1,'2026-04-22 13:16:55','2026-04-22 23:16:55',167,NULL),
(116,'action_scheduler_run_recurring_actions_schedule_hook','complete','2026-04-23 13:10:05','2026-04-23 23:10:05',20,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776949805;s:18:\"\0*\0first_timestamp\";i:1776512103;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776949805;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',2,1,'2026-04-24 10:32:44','2026-04-24 20:32:44',226,NULL),
(117,'woocommerce_cancel_unpaid_orders','complete','2026-04-23 03:34:44','2026-04-23 13:34:44',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776915284;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776915284;}',4,1,'2026-04-23 03:36:15','2026-04-23 13:36:15',192,NULL),
(118,'woocommerce_cleanup_sessions','complete','2026-04-23 14:34:44','2026-04-24 00:34:44',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776954884;s:18:\"\0*\0first_timestamp\";i:1776888000;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776954884;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-24 10:32:44','2026-04-24 20:32:44',226,NULL),
(119,'wc-admin_process_pending_orders_batch','complete','2026-04-23 14:34:44','2026-04-24 00:34:44',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1776954884;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1776954884;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-24 10:32:44','2026-04-24 20:32:44',226,NULL),
(121,'action_scheduler/migration_hook','complete','2026-04-23 03:09:40','2026-04-23 13:09:40',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776913780;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776913780;}',1,1,'2026-04-23 03:10:10','2026-04-23 13:10:10',180,NULL),
(122,'woocommerce_cancel_unpaid_orders','complete','2026-04-23 04:36:15','2026-04-23 14:36:15',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776918975;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776918975;}',4,1,'2026-04-23 05:28:03','2026-04-23 15:28:03',212,NULL),
(123,'action_scheduler/migration_hook','complete','2026-04-23 03:47:24','2026-04-23 13:47:24',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776916044;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776916044;}',1,1,'2026-04-23 03:51:16','2026-04-23 13:51:16',199,NULL),
(124,'woocommerce_run_product_attribute_lookup_regeneration_callback','complete','2026-04-23 03:54:04','2026-04-23 13:54:04',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776916444;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776916444;}',7,1,'2026-04-23 03:54:57','2026-04-23 13:54:57',202,NULL),
(125,'action_scheduler/migration_hook','complete','2026-04-23 03:55:05','2026-04-23 13:55:05',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776916505;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776916505;}',1,1,'2026-04-23 03:55:57','2026-04-23 13:55:57',204,NULL),
(126,'woocommerce_cancel_unpaid_orders','complete','2026-04-23 06:28:03','2026-04-23 16:28:03',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1776925683;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1776925683;}',4,1,'2026-04-24 10:32:40','2026-04-24 20:32:40',226,NULL),
(127,'woocommerce_run_product_attribute_lookup_regeneration_callback','complete','2026-04-24 10:32:28','2026-04-24 20:32:28',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777026748;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777026748;}',7,1,'2026-04-24 10:32:44','2026-04-24 20:32:44',226,NULL),
(128,'action_scheduler/migration_hook','complete','2026-04-24 10:33:40','2026-04-24 20:33:40',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777026820;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777026820;}',1,1,'2026-04-24 10:33:52','2026-04-24 20:33:52',228,NULL),
(129,'woocommerce_cancel_unpaid_orders','complete','2026-04-24 11:32:40','2026-04-24 21:32:40',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777030360;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777030360;}',4,1,'2026-04-24 11:38:01','2026-04-24 21:38:01',249,NULL),
(130,'woocommerce_cleanup_logs','pending','2026-04-25 10:32:40','2026-04-25 20:32:40',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777113160;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777113160;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(131,'woocommerce_cleanup_rate_limits_wrapper','pending','2026-04-25 10:32:40','2026-04-25 20:32:40',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777113160;s:18:\"\0*\0first_timestamp\";i:1776531600;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777113160;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(132,'wc_admin_daily_wrapper','pending','2026-04-25 10:32:42','2026-04-25 20:32:42',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777113162;s:18:\"\0*\0first_timestamp\";i:1776512105;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777113162;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(133,'woocommerce_cleanup_personal_data','pending','2026-04-25 10:32:44','2026-04-25 20:32:44',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777113164;s:18:\"\0*\0first_timestamp\";i:1776512115;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777113164;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(134,'woocommerce_scheduled_sales','pending','2026-04-25 10:32:44','2026-04-25 20:32:44',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777113164;s:18:\"\0*\0first_timestamp\";i:1776520800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777113164;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(136,'wc-admin_process_pending_orders_batch','complete','2026-04-24 22:32:44','2026-04-25 08:32:44',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777069964;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777069964;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,1,'2026-04-25 01:20:25','2026-04-25 11:20:25',260,NULL),
(137,'wc_stripe_database_cache_cleanup_async','complete','2026-04-25 01:00:00','2026-04-25 11:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777078800;s:18:\"\0*\0first_timestamp\";i:1777078800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777078800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',8,1,'2026-04-25 01:20:25','2026-04-25 11:20:25',260,NULL),
(138,'woocommerce_cleanup_sessions','complete','2026-04-24 20:00:00','2026-04-25 06:00:00',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777060800;s:18:\"\0*\0first_timestamp\";i:1777060800;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777060800;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,1,'2026-04-25 01:20:25','2026-04-25 11:20:25',260,NULL),
(139,'generate_category_lookup_table_wrapper','complete','2026-04-24 10:32:54','2026-04-24 20:32:54',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777026774;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777026774;}',4,1,'2026-04-24 10:33:52','2026-04-24 20:33:52',228,NULL),
(140,'woocommerce_refresh_order_count_cache','complete','2026-04-24 22:32:44','2026-04-25 08:32:44',10,'[\"shop_order\"]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777069964;s:18:\"\0*\0first_timestamp\";i:1777069964;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777069964;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',5,1,'2026-04-25 01:20:25','2026-04-25 11:20:25',260,NULL),
(141,'action_scheduler_run_recurring_actions_schedule_hook','pending','2026-04-25 10:32:44','2026-04-25 20:32:44',20,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777113164;s:18:\"\0*\0first_timestamp\";i:1776512103;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777113164;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(142,'woocommerce_cancel_unpaid_orders','complete','2026-04-24 12:38:01','2026-04-24 22:38:01',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777034281;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777034281;}',4,1,'2026-04-24 12:41:05','2026-04-24 22:41:05',254,NULL),
(143,'woocommerce_cancel_unpaid_orders','complete','2026-04-24 13:41:05','2026-04-24 23:41:05',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777038065;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777038065;}',4,1,'2026-04-24 14:24:02','2026-04-25 00:24:02',257,NULL),
(144,'woocommerce_cancel_unpaid_orders','complete','2026-04-24 15:24:02','2026-04-25 01:24:02',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777044242;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777044242;}',4,1,'2026-04-25 01:20:25','2026-04-25 11:20:25',260,NULL),
(145,'woocommerce_cancel_unpaid_orders','pending','2026-04-25 02:20:24','2026-04-25 12:20:24',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777083624;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777083624;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(146,'woocommerce_cleanup_sessions','pending','2026-04-25 13:20:25','2026-04-25 23:20:25',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777123225;s:18:\"\0*\0first_timestamp\";i:1777060800;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777123225;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',4,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(147,'wc-admin_process_pending_orders_batch','pending','2026-04-25 13:20:25','2026-04-25 23:20:25',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777123225;s:18:\"\0*\0first_timestamp\";i:1776512104;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777123225;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(148,'woocommerce_refresh_order_count_cache','pending','2026-04-25 13:20:25','2026-04-25 23:20:25',10,'[\"shop_order\"]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777123225;s:18:\"\0*\0first_timestamp\";i:1777069964;s:13:\"\0*\0recurrence\";i:43200;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777123225;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:43200;}',5,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(149,'wc_stripe_database_cache_cleanup_async','pending','2026-04-26 01:20:25','2026-04-26 11:20:25',10,'[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1777166425;s:18:\"\0*\0first_timestamp\";i:1777078800;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1777166425;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',8,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(150,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:19','2026-04-25 11:25:19',10,'{\"obj_id\":64}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080319;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080319;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(151,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:19','2026-04-25 11:25:19',10,'{\"obj_id\":61}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080319;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080319;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(152,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:19','2026-04-25 11:25:19',10,'{\"obj_id\":46}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080319;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080319;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(153,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:19','2026-04-25 11:25:19',10,'{\"obj_id\":45}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080319;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080319;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(154,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:19','2026-04-25 11:25:19',10,'{\"obj_id\":44}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080319;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080319;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(155,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:20','2026-04-25 11:25:20',10,'{\"obj_id\":43}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080320;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080320;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(156,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:20','2026-04-25 11:25:20',10,'{\"obj_id\":42}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080320;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080320;}',6,1,'2026-04-25 02:11:10','2026-04-25 12:11:10',262,NULL),
(157,'MailChimp_WooCommerce_Single_Product','complete','2026-04-25 01:25:20','2026-04-25 11:25:20',10,'{\"obj_id\":41}','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777080320;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777080320;}',6,1,'2026-04-25 02:11:11','2026-04-25 12:11:11',262,NULL),
(158,'woocommerce_delete_legacy_report_transients','complete','2026-04-25 02:12:51','2026-04-25 12:12:51',10,'[0,false]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1777083171;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1777083171;}',4,1,'2026-04-25 02:16:58','2026-04-25 12:16:58',265,NULL);
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_claims`
--

LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES
(1,'action-scheduler-migration'),
(2,'ActionScheduler'),
(3,'wc-admin-data'),
(4,'woocommerce'),
(5,'count'),
(6,'mc-woocommerce'),
(7,'woocommerce-db-updates'),
(8,'woocommerce-gateway-stripe'),
(9,'wc_batch_processes'),
(10,'');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_logs` VALUES
(1,6,'action created','2026-04-18 11:32:08','2026-04-18 21:32:08'),
(2,7,'action created','2026-04-18 11:35:03','2026-04-18 21:35:03'),
(3,8,'action created','2026-04-18 11:35:04','2026-04-18 21:35:04'),
(4,6,'action started via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(5,6,'action complete via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(6,8,'action started via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(7,8,'action complete via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(8,9,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(9,7,'action started via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(10,10,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(11,11,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(12,12,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(13,13,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(14,14,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(15,15,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(16,16,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(17,17,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(18,18,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(19,19,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(20,7,'action complete via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(21,20,'action created','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(22,17,'action started via Async Request','2026-04-18 11:35:05','2026-04-18 21:35:05'),
(23,17,'action complete via Async Request','2026-04-18 11:35:06','2026-04-18 21:35:06'),
(24,21,'action created','2026-04-18 11:35:07','2026-04-18 21:35:07'),
(25,12,'action started via Async Request','2026-04-18 11:36:23','2026-04-18 21:36:23'),
(26,12,'action complete via Async Request','2026-04-18 11:36:23','2026-04-18 21:36:23'),
(27,22,'action created','2026-04-18 11:36:23','2026-04-18 21:36:23'),
(28,18,'action started via Async Request','2026-04-18 11:36:23','2026-04-18 21:36:23'),
(29,18,'action complete via Async Request','2026-04-18 11:36:23','2026-04-18 21:36:23'),
(30,11,'action started via Async Request','2026-04-18 13:24:48','2026-04-18 23:24:48'),
(31,23,'action created','2026-04-18 13:24:48','2026-04-18 23:24:48'),
(32,11,'action complete via Async Request','2026-04-18 13:24:48','2026-04-18 23:24:48'),
(33,10,'action started via WP Cron','2026-04-18 14:09:44','2026-04-19 00:09:44'),
(34,10,'action complete via WP Cron','2026-04-18 14:09:44','2026-04-19 00:09:44'),
(35,24,'action created','2026-04-18 14:09:44','2026-04-19 00:09:44'),
(36,23,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(37,25,'action created','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(38,23,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(39,13,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(40,13,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(41,26,'action created','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(42,16,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(43,16,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(44,27,'action created','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(45,14,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(46,14,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(48,15,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(49,15,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(50,29,'action created','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(51,9,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(52,9,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(53,30,'action created','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(54,19,'action started via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(55,19,'action complete via WP Cron','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(56,31,'action created','2026-04-19 04:47:07','2026-04-19 14:47:07'),
(57,25,'action started via WP Cron','2026-04-19 05:53:50','2026-04-19 15:53:50'),
(58,32,'action created','2026-04-19 05:53:50','2026-04-19 15:53:50'),
(59,25,'action complete via WP Cron','2026-04-19 05:53:50','2026-04-19 15:53:50'),
(60,32,'action started via WP Cron','2026-04-19 08:01:12','2026-04-19 18:01:12'),
(61,33,'action created','2026-04-19 08:01:12','2026-04-19 18:01:12'),
(62,32,'action complete via WP Cron','2026-04-19 08:01:12','2026-04-19 18:01:12'),
(63,33,'action started via WP Cron','2026-04-19 09:29:18','2026-04-19 19:29:18'),
(64,34,'action created','2026-04-19 09:29:18','2026-04-19 19:29:18'),
(65,33,'action complete via WP Cron','2026-04-19 09:29:18','2026-04-19 19:29:18'),
(66,35,'action created','2026-04-19 10:32:00','2026-04-19 20:32:00'),
(67,34,'action started via WP Cron','2026-04-19 10:41:32','2026-04-19 20:41:32'),
(68,36,'action created','2026-04-19 10:41:32','2026-04-19 20:41:32'),
(69,34,'action complete via WP Cron','2026-04-19 10:41:32','2026-04-19 20:41:32'),
(70,35,'action started via WP Cron','2026-04-19 10:41:32','2026-04-19 20:41:32'),
(71,35,'action complete via WP Cron','2026-04-19 10:41:32','2026-04-19 20:41:32'),
(72,37,'action created','2026-04-19 11:02:09','2026-04-19 21:02:09'),
(73,38,'action created','2026-04-19 11:02:09','2026-04-19 21:02:09'),
(74,39,'action created','2026-04-19 11:02:10','2026-04-19 21:02:10'),
(75,40,'action created','2026-04-19 11:02:10','2026-04-19 21:02:10'),
(76,41,'action created','2026-04-19 11:02:10','2026-04-19 21:02:10'),
(77,42,'action created','2026-04-19 11:02:10','2026-04-19 21:02:10'),
(78,43,'action created','2026-04-19 11:02:11','2026-04-19 21:02:11'),
(79,44,'action created','2026-04-19 11:02:11','2026-04-19 21:02:11'),
(80,45,'action created','2026-04-19 11:02:11','2026-04-19 21:02:11'),
(81,46,'action created','2026-04-19 11:02:11','2026-04-19 21:02:11'),
(82,47,'action created','2026-04-19 11:02:12','2026-04-19 21:02:12'),
(83,48,'action created','2026-04-19 11:02:12','2026-04-19 21:02:12'),
(84,38,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(85,38,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(86,40,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(87,40,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(88,42,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(89,42,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(90,44,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(91,44,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(92,46,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(93,46,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(94,48,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(95,48,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(96,37,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(97,37,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(98,39,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(99,39,'action complete via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(100,41,'action started via WP Cron','2026-04-19 11:12:18','2026-04-19 21:12:18'),
(101,41,'action complete via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(102,43,'action started via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(103,43,'action complete via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(104,45,'action started via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(105,45,'action complete via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(106,47,'action started via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(107,47,'action complete via WP Cron','2026-04-19 11:12:19','2026-04-19 21:12:19'),
(110,50,'action created','2026-04-19 11:19:39','2026-04-19 21:19:39'),
(113,52,'action created','2026-04-19 11:19:43','2026-04-19 21:19:43'),
(116,54,'action created','2026-04-19 11:19:47','2026-04-19 21:19:47'),
(119,56,'action created','2026-04-19 11:19:51','2026-04-19 21:19:51'),
(122,58,'action created','2026-04-19 11:19:55','2026-04-19 21:19:55'),
(125,60,'action created','2026-04-19 11:19:59','2026-04-19 21:19:59'),
(126,50,'action started via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(127,50,'action complete via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(128,52,'action started via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(129,52,'action complete via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(130,54,'action started via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(131,54,'action complete via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(132,56,'action started via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(133,56,'action complete via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(134,58,'action started via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(135,58,'action complete via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(136,60,'action started via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(137,60,'action complete via WP Cron','2026-04-19 11:20:48','2026-04-19 21:20:48'),
(138,21,'action started via WP Cron','2026-04-19 11:55:37','2026-04-19 21:55:37'),
(139,21,'action complete via WP Cron','2026-04-19 11:55:41','2026-04-19 21:55:41'),
(140,61,'action created','2026-04-19 11:55:41','2026-04-19 21:55:41'),
(141,22,'action started via WP Cron','2026-04-19 11:55:41','2026-04-19 21:55:41'),
(142,22,'action complete via WP Cron','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(143,62,'action created','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(144,36,'action started via WP Cron','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(145,63,'action created','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(146,36,'action complete via WP Cron','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(147,20,'action started via WP Cron','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(148,64,'action created','2026-04-19 11:55:42','2026-04-19 21:55:42'),
(150,65,'action created','2026-04-19 11:55:43','2026-04-19 21:55:43'),
(151,66,'action created','2026-04-19 11:55:43','2026-04-19 21:55:43'),
(152,20,'action complete via WP Cron','2026-04-19 11:55:43','2026-04-19 21:55:43'),
(153,67,'action created','2026-04-19 11:55:43','2026-04-19 21:55:43'),
(154,66,'action started via WP Cron','2026-04-19 11:58:47','2026-04-19 21:58:47'),
(155,66,'action complete via WP Cron','2026-04-19 11:58:47','2026-04-19 21:58:47'),
(156,68,'action created','2026-04-19 11:58:47','2026-04-19 21:58:47'),
(157,68,'action started via WP Cron','2026-04-19 12:00:36','2026-04-19 22:00:36'),
(158,68,'action complete via WP Cron','2026-04-19 12:00:36','2026-04-19 22:00:36'),
(159,63,'action started via WP Cron','2026-04-19 12:55:54','2026-04-19 22:55:54'),
(160,69,'action created','2026-04-19 12:55:54','2026-04-19 22:55:54'),
(161,63,'action complete via WP Cron','2026-04-19 12:55:54','2026-04-19 22:55:54'),
(162,70,'action created','2026-04-19 13:05:46','2026-04-19 23:05:46'),
(163,70,'action started via WP Cron','2026-04-19 13:08:23','2026-04-19 23:08:23'),
(164,70,'action complete via WP Cron','2026-04-19 13:08:23','2026-04-19 23:08:23'),
(165,69,'action started via WP Cron','2026-04-19 14:27:14','2026-04-20 00:27:14'),
(166,71,'action created','2026-04-19 14:27:15','2026-04-20 00:27:15'),
(167,69,'action complete via WP Cron','2026-04-19 14:27:15','2026-04-20 00:27:15'),
(168,24,'action started via WP Cron','2026-04-19 14:27:15','2026-04-20 00:27:15'),
(169,24,'action complete via WP Cron','2026-04-19 14:27:15','2026-04-20 00:27:15'),
(170,72,'action created','2026-04-19 14:27:15','2026-04-20 00:27:15'),
(171,71,'action started via WP Cron','2026-04-20 11:32:21','2026-04-20 21:32:21'),
(172,73,'action created','2026-04-20 11:32:21','2026-04-20 21:32:21'),
(173,71,'action complete via WP Cron','2026-04-20 11:32:21','2026-04-20 21:32:21'),
(174,30,'action started via WP Cron','2026-04-20 11:32:21','2026-04-20 21:32:21'),
(175,30,'action complete via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(176,74,'action created','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(177,31,'action started via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(178,31,'action complete via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(179,75,'action created','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(180,65,'action started via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(181,65,'action complete via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(183,64,'action started via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(184,64,'action complete via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(185,77,'action created','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(186,26,'action started via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(187,26,'action complete via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(188,78,'action created','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(189,27,'action started via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(190,27,'action complete via WP Cron','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(191,79,'action created','2026-04-20 11:32:22','2026-04-20 21:32:22'),
(192,61,'action started via WP Cron','2026-04-20 12:00:18','2026-04-20 22:00:18'),
(193,61,'action complete via WP Cron','2026-04-20 12:00:20','2026-04-20 22:00:20'),
(194,80,'action created','2026-04-20 12:00:20','2026-04-20 22:00:20'),
(195,62,'action started via WP Cron','2026-04-20 12:00:20','2026-04-20 22:00:20'),
(196,62,'action complete via WP Cron','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(197,81,'action created','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(198,67,'action started via WP Cron','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(200,82,'action created','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(201,83,'action created','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(202,67,'action complete via WP Cron','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(203,84,'action created','2026-04-20 12:00:21','2026-04-20 22:00:21'),
(206,86,'action created','2026-04-20 12:00:35','2026-04-20 22:00:35'),
(207,87,'action created','2026-04-20 12:00:35','2026-04-20 22:00:35'),
(210,89,'action created','2026-04-20 12:01:21','2026-04-20 22:01:21'),
(211,90,'action created','2026-04-20 12:01:21','2026-04-20 22:01:21'),
(212,83,'action started via WP Cron','2026-04-20 12:04:24','2026-04-20 22:04:24'),
(213,83,'action complete via WP Cron','2026-04-20 12:04:26','2026-04-20 22:04:26'),
(214,87,'action started via WP Cron','2026-04-20 12:04:26','2026-04-20 22:04:26'),
(215,87,'action complete via WP Cron','2026-04-20 12:04:26','2026-04-20 22:04:26'),
(216,86,'action started via WP Cron','2026-04-20 12:04:26','2026-04-20 22:04:26'),
(217,86,'action complete via WP Cron','2026-04-20 12:04:26','2026-04-20 22:04:26'),
(218,90,'action started via WP Cron','2026-04-20 12:04:27','2026-04-20 22:04:27'),
(219,90,'action complete via WP Cron','2026-04-20 12:04:27','2026-04-20 22:04:27'),
(220,89,'action started via WP Cron','2026-04-20 12:04:27','2026-04-20 22:04:27'),
(221,89,'action complete via WP Cron','2026-04-20 12:04:27','2026-04-20 22:04:27'),
(222,91,'action created','2026-04-20 12:05:10','2026-04-20 22:05:10'),
(223,91,'action started via Async Request','2026-04-20 12:06:36','2026-04-20 22:06:36'),
(224,91,'action complete via Async Request','2026-04-20 12:06:36','2026-04-20 22:06:36'),
(225,92,'action created','2026-04-20 12:06:37','2026-04-20 22:06:37'),
(226,93,'action created','2026-04-20 12:06:57','2026-04-20 22:06:57'),
(227,93,'action started via WP Cron','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(228,94,'action created','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(229,93,'action complete via WP Cron','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(230,92,'action started via WP Cron','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(231,92,'action complete via WP Cron','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(232,94,'action started via WP Cron','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(233,94,'action complete via WP Cron','2026-04-20 12:08:35','2026-04-20 22:08:35'),
(234,95,'action created','2026-04-20 12:11:17','2026-04-20 22:11:17'),
(235,96,'action created','2026-04-20 12:11:43','2026-04-20 22:11:43'),
(236,96,'action started via WP Cron','2026-04-20 12:12:09','2026-04-20 22:12:09'),
(237,97,'action created','2026-04-20 12:12:09','2026-04-20 22:12:09'),
(238,96,'action complete via WP Cron','2026-04-20 12:12:09','2026-04-20 22:12:09'),
(239,97,'action started via WP Cron','2026-04-20 12:12:09','2026-04-20 22:12:09'),
(240,97,'action complete via WP Cron','2026-04-20 12:12:09','2026-04-20 22:12:09'),
(241,95,'action started via WP Cron','2026-04-20 12:14:58','2026-04-20 22:14:58'),
(242,95,'action complete via WP Cron','2026-04-20 12:14:58','2026-04-20 22:14:58'),
(243,98,'action created','2026-04-20 12:20:50','2026-04-20 22:20:50'),
(244,98,'action started via WP Cron','2026-04-20 12:25:55','2026-04-20 22:25:55'),
(245,98,'action complete via WP Cron','2026-04-20 12:25:55','2026-04-20 22:25:55'),
(246,99,'action created','2026-04-20 12:28:12','2026-04-20 22:28:12'),
(247,99,'action started via WP Cron','2026-04-20 12:31:02','2026-04-20 22:31:02'),
(248,99,'action complete via WP Cron','2026-04-20 12:31:02','2026-04-20 22:31:02'),
(249,73,'action started via WP Cron','2026-04-20 13:59:11','2026-04-20 23:59:11'),
(250,100,'action created','2026-04-20 13:59:12','2026-04-20 23:59:12'),
(251,73,'action complete via WP Cron','2026-04-20 13:59:13','2026-04-20 23:59:13'),
(252,72,'action started via WP Cron','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(253,72,'action complete via WP Cron','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(254,101,'action created','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(255,100,'action started via WP Cron','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(256,102,'action created','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(257,100,'action complete via WP Cron','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(258,82,'action started via WP Cron','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(259,82,'action complete via WP Cron','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(260,103,'action created','2026-04-20 21:52:52','2026-04-21 07:52:52'),
(261,102,'action started via WP Cron','2026-04-22 13:09:58','2026-04-22 23:09:58'),
(262,104,'action created','2026-04-22 13:09:58','2026-04-22 23:09:58'),
(263,102,'action complete via WP Cron','2026-04-22 13:09:58','2026-04-22 23:09:58'),
(264,74,'action started via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(265,74,'action complete via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(266,105,'action created','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(267,75,'action started via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(268,75,'action complete via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(269,106,'action created','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(270,103,'action started via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(271,103,'action complete via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(273,77,'action started via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(274,77,'action complete via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(276,78,'action started via WP Cron','2026-04-22 13:09:59','2026-04-22 23:09:59'),
(277,78,'action complete via WP Cron','2026-04-22 13:10:00','2026-04-22 23:10:00'),
(278,109,'action created','2026-04-22 13:10:00','2026-04-22 23:10:00'),
(279,79,'action started via WP Cron','2026-04-22 13:10:00','2026-04-22 23:10:00'),
(280,79,'action complete via WP Cron','2026-04-22 13:10:00','2026-04-22 23:10:00'),
(281,110,'action created','2026-04-22 13:10:00','2026-04-22 23:10:00'),
(282,80,'action started via WP Cron','2026-04-22 13:10:00','2026-04-22 23:10:00'),
(283,80,'action complete via WP Cron','2026-04-22 13:10:03','2026-04-22 23:10:03'),
(284,111,'action created','2026-04-22 13:10:03','2026-04-22 23:10:03'),
(285,81,'action started via WP Cron','2026-04-22 13:10:03','2026-04-22 23:10:03'),
(286,81,'action complete via WP Cron','2026-04-22 13:10:04','2026-04-22 23:10:04'),
(287,112,'action created','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(288,101,'action started via WP Cron','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(289,101,'action complete via WP Cron','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(290,113,'action created','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(291,84,'action started via WP Cron','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(293,114,'action created','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(294,115,'action created','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(295,84,'action complete via WP Cron','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(296,116,'action created','2026-04-22 13:10:05','2026-04-22 23:10:05'),
(297,115,'action started via WP Cron','2026-04-22 13:16:55','2026-04-22 23:16:55'),
(298,115,'action complete via WP Cron','2026-04-22 13:16:55','2026-04-22 23:16:55'),
(299,104,'action started via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(300,117,'action created','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(301,104,'action complete via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(302,114,'action started via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(303,114,'action complete via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(304,118,'action created','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(305,105,'action started via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(306,105,'action complete via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(307,119,'action created','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(308,106,'action started via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(309,106,'action complete via WP Cron','2026-04-23 02:34:44','2026-04-23 12:34:44'),
(311,121,'action created','2026-04-23 03:08:40','2026-04-23 13:08:40'),
(312,121,'action started via WP Cron','2026-04-23 03:10:10','2026-04-23 13:10:10'),
(313,121,'action complete via WP Cron','2026-04-23 03:10:10','2026-04-23 13:10:10'),
(314,117,'action started via WP Cron','2026-04-23 03:36:15','2026-04-23 13:36:15'),
(315,122,'action created','2026-04-23 03:36:15','2026-04-23 13:36:15'),
(316,117,'action complete via WP Cron','2026-04-23 03:36:15','2026-04-23 13:36:15'),
(317,123,'action created','2026-04-23 03:46:24','2026-04-23 13:46:24'),
(318,123,'action started via WP Cron','2026-04-23 03:51:16','2026-04-23 13:51:16'),
(319,123,'action complete via WP Cron','2026-04-23 03:51:16','2026-04-23 13:51:16'),
(322,124,'action created','2026-04-23 03:54:03','2026-04-23 13:54:03'),
(323,125,'action created','2026-04-23 03:54:05','2026-04-23 13:54:05'),
(324,124,'action started via WP Cron','2026-04-23 03:54:57','2026-04-23 13:54:57'),
(325,124,'action complete via WP Cron','2026-04-23 03:54:57','2026-04-23 13:54:57'),
(326,125,'action started via WP Cron','2026-04-23 03:55:57','2026-04-23 13:55:57'),
(327,125,'action complete via WP Cron','2026-04-23 03:55:57','2026-04-23 13:55:57'),
(328,122,'action started via WP Cron','2026-04-23 05:28:03','2026-04-23 15:28:03'),
(329,126,'action created','2026-04-23 05:28:03','2026-04-23 15:28:03'),
(330,122,'action complete via WP Cron','2026-04-23 05:28:03','2026-04-23 15:28:03'),
(331,127,'action created','2026-04-24 10:32:27','2026-04-24 20:32:27'),
(332,128,'action created','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(333,126,'action started via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(334,129,'action created','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(335,126,'action complete via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(336,109,'action started via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(337,109,'action complete via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(338,130,'action created','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(339,110,'action started via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(340,110,'action complete via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(341,131,'action created','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(342,111,'action started via WP Cron','2026-04-24 10:32:40','2026-04-24 20:32:40'),
(343,111,'action complete via WP Cron','2026-04-24 10:32:42','2026-04-24 20:32:42'),
(344,132,'action created','2026-04-24 10:32:42','2026-04-24 20:32:42'),
(345,112,'action started via WP Cron','2026-04-24 10:32:42','2026-04-24 20:32:42'),
(346,112,'action complete via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(347,133,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(348,113,'action started via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(349,113,'action complete via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(350,134,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(351,118,'action started via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(352,118,'action complete via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(354,119,'action started via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(355,119,'action complete via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(356,136,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(357,127,'action started via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(358,127,'action complete via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(359,116,'action started via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(360,137,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(363,138,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(364,139,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(365,140,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(366,116,'action complete via WP Cron','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(367,141,'action created','2026-04-24 10:32:44','2026-04-24 20:32:44'),
(368,139,'action started via WP Cron','2026-04-24 10:33:52','2026-04-24 20:33:52'),
(369,139,'action complete via WP Cron','2026-04-24 10:33:52','2026-04-24 20:33:52'),
(370,128,'action started via WP Cron','2026-04-24 10:33:52','2026-04-24 20:33:52'),
(371,128,'action complete via WP Cron','2026-04-24 10:33:52','2026-04-24 20:33:52'),
(372,129,'action started via WP Cron','2026-04-24 11:38:00','2026-04-24 21:38:00'),
(373,142,'action created','2026-04-24 11:38:01','2026-04-24 21:38:01'),
(374,129,'action complete via WP Cron','2026-04-24 11:38:01','2026-04-24 21:38:01'),
(375,142,'action started via WP Cron','2026-04-24 12:41:04','2026-04-24 22:41:04'),
(376,143,'action created','2026-04-24 12:41:05','2026-04-24 22:41:05'),
(377,142,'action complete via WP Cron','2026-04-24 12:41:05','2026-04-24 22:41:05'),
(378,143,'action started via WP Cron','2026-04-24 14:24:02','2026-04-25 00:24:02'),
(379,144,'action created','2026-04-24 14:24:02','2026-04-25 00:24:02'),
(380,143,'action complete via WP Cron','2026-04-24 14:24:02','2026-04-25 00:24:02'),
(381,144,'action started via WP Cron','2026-04-25 01:20:24','2026-04-25 11:20:24'),
(382,145,'action created','2026-04-25 01:20:24','2026-04-25 11:20:24'),
(383,144,'action complete via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(384,138,'action started via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(385,138,'action complete via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(386,146,'action created','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(387,136,'action started via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(388,136,'action complete via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(389,147,'action created','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(390,140,'action started via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(391,140,'action complete via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(392,148,'action created','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(393,137,'action started via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(394,137,'action complete via WP Cron','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(395,149,'action created','2026-04-25 01:20:25','2026-04-25 11:20:25'),
(396,150,'action created','2026-04-25 01:25:14','2026-04-25 11:25:14'),
(397,151,'action created','2026-04-25 01:25:14','2026-04-25 11:25:14'),
(398,152,'action created','2026-04-25 01:25:14','2026-04-25 11:25:14'),
(399,153,'action created','2026-04-25 01:25:14','2026-04-25 11:25:14'),
(400,154,'action created','2026-04-25 01:25:14','2026-04-25 11:25:14'),
(401,155,'action created','2026-04-25 01:25:15','2026-04-25 11:25:15'),
(402,156,'action created','2026-04-25 01:25:15','2026-04-25 11:25:15'),
(403,157,'action created','2026-04-25 01:25:15','2026-04-25 11:25:15'),
(404,150,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(405,150,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(406,151,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(407,151,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(408,152,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(409,152,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(410,153,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(411,153,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(412,154,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(413,154,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(414,155,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(415,155,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(416,156,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(417,156,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(418,157,'action started via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(419,157,'action complete via WP Cron','2026-04-25 02:11:10','2026-04-25 12:11:10'),
(420,158,'action created','2026-04-25 02:11:51','2026-04-25 12:11:51'),
(421,158,'action started via WP Cron','2026-04-25 02:16:58','2026-04-25 12:16:58'),
(422,158,'action complete via WP Cron','2026-04-25 02:16:58','2026-04-25 12:16:58');
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
INSERT INTO `wp_commentmeta` VALUES
(1,3,'note_group','order_update');
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`),
  KEY `woo_idx_comment_date_type` (`comment_date_gmt`,`comment_type`,`comment_approved`,`comment_post_ID`),
  KEY `woo_idx_comment_approved_type` (`comment_approved`,`comment_type`,`comment_post_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES
(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2026-04-18 21:31:49','2026-04-18 11:31:49','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0),
(2,66,'WooCommerce','','','','2026-04-20 22:11:43','2026-04-20 12:11:43','Stripe payment intent created (Payment Intent ID: pi_3TOGfxA3dqys8x5W1ZRda71L)',0,'1','WooCommerce','order_note',0,0),
(3,66,'WooCommerce','','','','2026-04-20 22:12:09','2026-04-20 12:12:09','UPE payment failed: We\'re not able to process this payment. Please try again later. Order status changed from Pending payment to Failed.',0,'1','WooCommerce','order_note',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_mailchimp_carts`
--

DROP TABLE IF EXISTS `wp_mailchimp_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_mailchimp_carts` (
  `id` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_mailchimp_carts`
--

LOCK TABLES `wp_mailchimp_carts` WRITE;
/*!40000 ALTER TABLE `wp_mailchimp_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_mailchimp_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_mailchimp_jobs`
--

DROP TABLE IF EXISTS `wp_mailchimp_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_mailchimp_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_id` text DEFAULT NULL,
  `job` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_mailchimp_jobs`
--

LOCK TABLES `wp_mailchimp_jobs` WRITE;
/*!40000 ALTER TABLE `wp_mailchimp_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_mailchimp_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:18:{i:1777083445;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1777084310;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1777084328;a:1:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1777084358;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1777084509;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1777113152;a:1:{s:31:\"wpseo_permalink_structure_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1777113153;a:1:{s:30:\"wpseo_start_cleanup_indexables\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1777116709;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1777116712;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1777116728;a:1:{s:20:\"jetpack_v2_heartbeat\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1777116904;a:3:{s:13:\"wpseo-reindex\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:45:\"woocommerce_marketplace_cron_fetch_promotions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777116919;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1777116921;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1777120309;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777122109;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777123909;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1777203110;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','https://furlio.au','on'),
(3,'home','https://furlio.au','on'),
(4,'blogname','Furlio','on'),
(5,'blogdescription','Fast delivery on premium Aussie pet supplies — free shipping on orders over $75','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','hello@furlio.au','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','mail.example.com','on'),
(16,'mailserver_login','login@example.com','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','j F Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','j F Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','/%postname%/','on'),
(30,'rewrite_rules','a:185:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:21:\"^wc/file/transient/?$\";s:33:\"index.php?wc-transient-file-name=\";s:24:\"^wc/file/transient/(.+)$\";s:44:\"index.php?wc-transient-file-name=$matches[1]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:15:\"^checkout-link$\";s:28:\"index.php?checkout-link=true\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:43:\"category/(.+?)/wc/file/transient(/(.*))?/?$\";s:65:\"index.php?category_name=$matches[1]&wc/file/transient=$matches[3]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:40:\"tag/([^/]+)/wc/file/transient(/(.*))?/?$\";s:55:\"index.php?tag=$matches[1]&wc/file/transient=$matches[3]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:44:\"brand/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?product_brand=$matches[1]&feed=$matches[2]\";s:39:\"brand/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?product_brand=$matches[1]&feed=$matches[2]\";s:20:\"brand/(.+?)/embed/?$\";s:46:\"index.php?product_brand=$matches[1]&embed=true\";s:32:\"brand/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?product_brand=$matches[1]&paged=$matches[2]\";s:14:\"brand/(.+?)/?$\";s:35:\"index.php?product_brand=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:44:\"product/([^/]+)/wc/file/transient(/(.*))?/?$\";s:59:\"index.php?product=$matches[1]&wc/file/transient=$matches[3]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:61:\"product/[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=25&cpage=$matches[1]\";s:28:\"wc/file/transient(/(.*))?/?$\";s:40:\"index.php?&wc/file/transient=$matches[2]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:37:\"comments/wc/file/transient(/(.*))?/?$\";s:40:\"index.php?&wc/file/transient=$matches[2]\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:40:\"search/(.+)/wc/file/transient(/(.*))?/?$\";s:53:\"index.php?s=$matches[1]&wc/file/transient=$matches[3]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:43:\"author/([^/]+)/wc/file/transient(/(.*))?/?$\";s:63:\"index.php?author_name=$matches[1]&wc/file/transient=$matches[3]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc/file/transient(/(.*))?/?$\";s:93:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc/file/transient=$matches[5]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:52:\"([0-9]{4})/([0-9]{1,2})/wc/file/transient(/(.*))?/?$\";s:77:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc/file/transient=$matches[4]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:39:\"([0-9]{4})/wc/file/transient(/(.*))?/?$\";s:56:\"index.php?year=$matches[1]&wc/file/transient=$matches[3]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:36:\"(.?.+?)/wc/file/transient(/(.*))?/?$\";s:60:\"index.php?pagename=$matches[1]&wc/file/transient=$matches[3]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:42:\".?.+?/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:53:\".?.+?/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:36:\"([^/]+)/wc/file/transient(/(.*))?/?$\";s:56:\"index.php?name=$matches[1]&wc/file/transient=$matches[3]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:53:\"[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:9:{i:0;s:27:\"astra-sites/astra-sites.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";i:3;s:49:\"woo-variation-swatches/woo-variation-swatches.php\";i:4;s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";i:5;s:59:\"woocommerce-paypal-payments/woocommerce-paypal-payments.php\";i:6;s:27:\"woocommerce/woocommerce.php\";i:7;s:24:\"wordpress-seo/wp-seo.php\";i:8;s:27:\"wp-super-cache/wp-cache.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','https://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','astra','on'),
(42,'stylesheet','astra','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','60717','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','page','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:0:{}','on'),
(78,'widget_text','a:4:{s:12:\"_multiwidget\";i:1;i:1;a:3:{s:5:\"title\";s:6:\"Furlio\";s:4:\"text\";s:363:\"<p style=\"color:#D1D5DB;font-size:14px;line-height:1.7\">Your trusted Aussie source for premium pet supplies. Fast delivery nationwide. Free shipping on orders $75+.</p><p style=\"margin-top:16px\"><a href=\"/pet/shop/\" style=\"background:#FF6B35;color:#fff;padding:10px 20px;border-radius:30px;text-decoration:none;font-weight:700;font-size:13px\">Shop Now →</a></p>\";s:6:\"filter\";b:0;}i:2;a:3:{s:5:\"title\";s:11:\"Quick Links\";s:4:\"text\";s:1017:\"<ul style=\"padding:0;margin:0\">\n<li style=\"margin-bottom:8px\"><a href=\"/pet/shop/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">🛍️ Shop All Products</a></li>\n<li style=\"margin-bottom:8px\"><a href=\"/pet/about/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">ℹ️ About Us</a></li>\n<li style=\"margin-bottom:8px\"><a href=\"/pet/faq/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">❓ FAQ</a></li>\n<li style=\"margin-bottom:8px\"><a href=\"/pet/shipping-information/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">🚚 Shipping Info</a></li>\n<li style=\"margin-bottom:8px\"><a href=\"/pet/refund-and-returns-policy/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">↩️ Returns Policy</a></li>\n<li style=\"margin-bottom:8px\"><a href=\"/pet/contact-us/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">📞 Contact Us</a></li>\n<li><a href=\"/pet/privacy-policy/\" style=\"color:#D1D5DB;text-decoration:none;font-size:14px\">🔒 Privacy Policy</a></li>\n</ul>\";s:6:\"filter\";b:0;}i:3;a:3:{s:5:\"title\";s:21:\"Contact &amp; Support\";s:4:\"text\";s:1111:\"<ul style=\"padding:0;margin:0;color:#D1D5DB;font-size:14px\">\n<li style=\"margin-bottom:10px\">📧 <a href=\"mailto:hello@furlio.au\" style=\"color:#F18F01;text-decoration:none\">hello@furlio.au</a></li>\n<li style=\"margin-bottom:10px\">🕐 Mon–Fri 9am–5pm AEST</li>\n<li style=\"margin-bottom:16px\">📍 Shipping Australia-wide</li>\n</ul>\n<div style=\"margin-top:8px\">\n<p style=\"color:#9CA3AF;font-size:13px;margin:0 0 8px\">🔒 Secure payments via</p>\n<div style=\"display:flex;gap:8px;flex-wrap:wrap\">\n<span style=\"background:#1F2937;border:1px solid #374151;color:#D1D5DB;padding:4px 10px;border-radius:4px;font-size:12px;font-weight:700\">VISA</span>\n<span style=\"background:#1F2937;border:1px solid #374151;color:#D1D5DB;padding:4px 10px;border-radius:4px;font-size:12px;font-weight:700\">MC</span>\n<span style=\"background:#1F2937;border:1px solid #374151;color:#D1D5DB;padding:4px 10px;border-radius:4px;font-size:12px;font-weight:700\">AMEX</span>\n<span style=\"background:#1F2937;border:1px solid #374151;color:#D1D5DB;padding:4px 10px;border-radius:4px;font-size:12px;font-weight:700\">PayPal</span>\n</div>\n</div>\";s:6:\"filter\";b:0;}}','on'),
(79,'widget_rss','a:0:{}','on'),
(80,'uninstall_plugins','a:4:{s:24:\"wordpress-seo/wp-seo.php\";s:14:\"__return_false\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:56:\"ReallySimplePlugins\\RSS\\Core\\Bootstrap\\Plugin::uninstall\";s:27:\"wp-super-cache/wp-cache.php\";s:22:\"wpsupercache_uninstall\";s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";s:48:\"WC_Legacy_REST_API_Plugin::on_plugin_deactivated\";}','off'),
(81,'timezone_string','Australia/Sydney','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','25','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','0','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1792063909','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','1','on'),
(101,'wp_notes_notify','1','on'),
(102,'initial_db_version','60717','on'),
(103,'wp_user_roles','a:9:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:118:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:16:\"create_customers\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:15:\"manage_security\";b:1;s:23:\"manage_zip_ai_assistant\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:37:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:23:\"manage_zip_ai_assistant\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:93:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:16:\"create_customers\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:39:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:23:\"manage_zip_ai_assistant\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;s:23:\"view_site_health_checks\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:37:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:23:\"manage_zip_ai_assistant\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}','on'),
(104,'fresh_site','0','off'),
(105,'user_count','3','off'),
(106,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(107,'sidebars_widgets','a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:15:\"footer-widget-1\";a:1:{i:0;s:6:\"text-1\";}s:15:\"footer-widget-2\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:13:\"array_version\";i:3;}','auto'),
(108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(125,'theme_mods_twentytwentyfive','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1776519106;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','off'),
(128,'recovery_keys','a:0:{}','off'),
(135,'action_scheduler_hybrid_store_demarkation','5','auto'),
(136,'schema-ActionScheduler_StoreSchema','8.0.1776511925','auto'),
(137,'schema-ActionScheduler_LoggerSchema','3.0.1776511925','auto'),
(143,'woocommerce_newly_installed','no','auto'),
(144,'woocommerce_order_stats_has_fulfillment_column','no','off'),
(145,'woocommerce_schema_version','920','auto'),
(146,'woocommerce_store_address','1 Collins Street','on'),
(147,'woocommerce_store_address_2','','on'),
(148,'woocommerce_store_city','Melbourne','on'),
(149,'woocommerce_default_country','AU:VIC','on'),
(150,'woocommerce_store_postcode','3000','on'),
(151,'woocommerce_allowed_countries','specific','on'),
(152,'woocommerce_all_except_countries','','on'),
(153,'woocommerce_specific_allowed_countries','a:1:{i:0;s:2:\"AU\";}','on'),
(154,'woocommerce_ship_to_countries','specific','on'),
(155,'woocommerce_specific_ship_to_countries','a:1:{i:0;s:2:\"AU\";}','on'),
(156,'woocommerce_default_customer_address','base','on'),
(157,'woocommerce_address_autocomplete_enabled','no','on'),
(158,'woocommerce_calc_taxes','yes','on'),
(159,'woocommerce_enable_coupons','yes','on'),
(160,'woocommerce_calc_discounts_sequentially','no','off'),
(161,'woocommerce_currency','AUD','on'),
(162,'woocommerce_currency_pos','left','on'),
(163,'woocommerce_price_thousand_sep',',','on'),
(164,'woocommerce_price_decimal_sep','.','on'),
(165,'woocommerce_price_num_decimals','2','on'),
(166,'woocommerce_shop_page_id','6','on'),
(167,'woocommerce_cart_redirect_after_add','no','on'),
(168,'woocommerce_enable_ajax_add_to_cart','yes','on'),
(169,'woocommerce_placeholder_image','5','on'),
(170,'woocommerce_weight_unit','kg','on'),
(171,'woocommerce_dimension_unit','cm','on'),
(172,'woocommerce_enable_reviews','yes','on'),
(173,'woocommerce_review_rating_verification_label','yes','off'),
(174,'woocommerce_review_rating_verification_required','yes','off'),
(175,'woocommerce_enable_review_rating','yes','on'),
(176,'woocommerce_review_rating_required','yes','off'),
(177,'woocommerce_manage_stock','yes','on'),
(178,'woocommerce_hold_stock_minutes','60','off'),
(179,'woocommerce_notify_low_stock','yes','off'),
(180,'woocommerce_notify_no_stock','yes','off'),
(181,'woocommerce_stock_email_recipient','dsightstech@gmail.com','off'),
(182,'woocommerce_notify_low_stock_amount','2','off'),
(183,'woocommerce_notify_no_stock_amount','0','on'),
(184,'woocommerce_hide_out_of_stock_items','no','on'),
(185,'woocommerce_stock_format','','on'),
(186,'woocommerce_file_download_method','force','off'),
(187,'woocommerce_downloads_redirect_fallback_allowed','no','off'),
(188,'woocommerce_downloads_require_login','no','off'),
(189,'woocommerce_downloads_grant_access_after_payment','yes','off'),
(190,'woocommerce_downloads_deliver_inline','','off'),
(191,'woocommerce_downloads_add_hash_to_filename','yes','on'),
(192,'woocommerce_downloads_count_partial','yes','on'),
(194,'woocommerce_attribute_lookup_direct_updates','no','on'),
(195,'woocommerce_attribute_lookup_optimized_updates','no','on'),
(196,'woocommerce_product_match_featured_image_by_sku','no','on'),
(197,'woocommerce_prices_include_tax','no','on'),
(198,'woocommerce_tax_based_on','shipping','on'),
(199,'woocommerce_shipping_tax_class','inherit','on'),
(200,'woocommerce_tax_round_at_subtotal','no','on'),
(201,'woocommerce_tax_classes','','on'),
(202,'woocommerce_tax_display_shop','excl','on'),
(203,'woocommerce_tax_display_cart','excl','on'),
(204,'woocommerce_price_display_suffix','','on'),
(205,'woocommerce_tax_total_display','itemized','off'),
(206,'woocommerce_enable_shipping_calc','yes','off'),
(207,'woocommerce_shipping_cost_requires_address','no','on'),
(208,'woocommerce_shipping_hide_rates_when_free','no','off'),
(209,'woocommerce_ship_to_destination','billing','off'),
(210,'woocommerce_shipping_debug_mode','no','on'),
(211,'woocommerce_enable_guest_checkout','yes','off'),
(212,'woocommerce_enable_checkout_login_reminder','yes','off'),
(213,'woocommerce_enable_delayed_account_creation','no','off'),
(214,'woocommerce_enable_signup_and_login_from_checkout','yes','off'),
(215,'woocommerce_enable_myaccount_registration','yes','off'),
(216,'woocommerce_registration_generate_password','yes','off'),
(217,'woocommerce_registration_generate_username','yes','off'),
(218,'woocommerce_erasure_request_removes_order_data','no','off'),
(219,'woocommerce_erasure_request_removes_download_data','no','off'),
(220,'woocommerce_allow_bulk_remove_personal_data','no','off'),
(221,'woocommerce_registration_privacy_policy_text','Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].','on'),
(222,'woocommerce_checkout_privacy_policy_text','Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].','on'),
(223,'woocommerce_delete_inactive_accounts','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(224,'woocommerce_trash_pending_orders','','off'),
(225,'woocommerce_trash_failed_orders','','off'),
(226,'woocommerce_trash_cancelled_orders','','off'),
(227,'woocommerce_anonymize_refunded_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(228,'woocommerce_anonymize_completed_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(229,'woocommerce_email_from_address','hello@furlio.au','off'),
(230,'woocommerce_email_header_image','','off'),
(231,'woocommerce_email_header_image_width','120','on'),
(232,'woocommerce_email_header_alignment','left','on'),
(233,'woocommerce_email_font_family','Helvetica','on'),
(234,'woocommerce_email_footer_text','{site_title}<br />{store_address}','off'),
(235,'woocommerce_email_base_color','#8526ff','off'),
(236,'woocommerce_email_background_color','#ffffff','off'),
(237,'woocommerce_email_body_background_color','#ffffff','off'),
(238,'woocommerce_email_text_color','#1e1e1e','off'),
(239,'woocommerce_email_footer_text_color','#787c82','off'),
(240,'woocommerce_email_auto_sync_with_theme','yes','off'),
(241,'woocommerce_pos_store_address','','on'),
(242,'woocommerce_pos_store_phone','','on'),
(243,'woocommerce_pos_store_email','dsightstech@gmail.com','on'),
(244,'woocommerce_pos_refund_returns_policy','','on'),
(245,'woocommerce_cart_page_id','7','off'),
(246,'woocommerce_checkout_page_id','8','off'),
(247,'woocommerce_myaccount_page_id','9','off'),
(248,'woocommerce_terms_page_id','','off'),
(249,'woocommerce_force_ssl_checkout','no','on'),
(250,'woocommerce_unforce_ssl_checkout','no','on'),
(251,'woocommerce_checkout_pay_endpoint','order-pay','on'),
(252,'woocommerce_checkout_order_received_endpoint','order-received','on'),
(253,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','on'),
(254,'woocommerce_myaccount_delete_payment_method_endpoint','delete-payment-method','on'),
(255,'woocommerce_myaccount_set_default_payment_method_endpoint','set-default-payment-method','on'),
(256,'woocommerce_myaccount_orders_endpoint','orders','on'),
(257,'woocommerce_myaccount_view_order_endpoint','view-order','on'),
(258,'woocommerce_myaccount_downloads_endpoint','downloads','on'),
(259,'woocommerce_myaccount_edit_account_endpoint','edit-account','on'),
(260,'woocommerce_myaccount_edit_address_endpoint','edit-address','on'),
(261,'woocommerce_myaccount_payment_methods_endpoint','payment-methods','on'),
(262,'woocommerce_myaccount_lost_password_endpoint','lost-password','on'),
(263,'woocommerce_logout_endpoint','customer-logout','on'),
(264,'woocommerce_api_enabled','no','on'),
(265,'woocommerce_allow_tracking','no','on'),
(266,'woocommerce_show_marketplace_suggestions','yes','off'),
(267,'woocommerce_custom_orders_table_enabled','yes','on'),
(268,'woocommerce_analytics_enabled','yes','on'),
(269,'woocommerce_feature_rate_limit_checkout_enabled','no','on'),
(270,'woocommerce_feature_order_attribution_enabled','yes','on'),
(271,'woocommerce_feature_site_visibility_badge_enabled','yes','on'),
(272,'woocommerce_hpos_datastore_caching_enabled','no','on'),
(273,'woocommerce_feature_remote_logging_enabled','yes','on'),
(274,'woocommerce_feature_email_improvements_enabled','yes','on'),
(277,'woocommerce_email_improvements_disabled_count','1','auto'),
(278,'woocommerce_email_improvements_first_disabled_at','2026-04-18 11:32:06','auto'),
(279,'woocommerce_email_improvements_last_disabled_at','2026-04-18 11:32:06','auto'),
(280,'woocommerce_feature_blueprint_enabled','yes','on'),
(281,'woocommerce_feature_cost_of_goods_sold_enabled','no','on'),
(282,'woocommerce_hpos_fts_index_enabled','no','on'),
(283,'woocommerce_feature_block_email_editor_enabled','no','on'),
(284,'woocommerce_feature_point_of_sale_enabled','yes','on'),
(285,'woocommerce_feature_mcp_integration_enabled','no','on'),
(286,'woocommerce_feature_destroy-empty-sessions_enabled','no','on'),
(287,'woocommerce_feature_rest_api_caching_enabled','no','on'),
(288,'woocommerce_feature_product_instance_caching_enabled','no','on'),
(289,'woocommerce_single_image_width','600','on'),
(290,'woocommerce_thumbnail_image_width','300','on'),
(291,'woocommerce_checkout_highlight_required_fields','yes','on'),
(292,'woocommerce_demo_store','no','off'),
(293,'wc_downloads_approved_directories_mode','enabled','auto'),
(294,'woocommerce_permalinks','a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}','auto'),
(295,'current_theme_supports_woocommerce','yes','auto'),
(296,'woocommerce_queue_flush_rewrite_rules','no','auto'),
(301,'default_product_cat','15','auto'),
(302,'woocommerce_refund_returns_page_id','10','auto'),
(305,'woocommerce_paypal_settings','a:25:{s:7:\"enabled\";s:2:\"no\";s:5:\"title\";s:6:\"PayPal\";s:11:\"description\";s:85:\"Pay via PayPal; you can pay with your credit card if you don\'t have a PayPal account.\";s:5:\"email\";s:21:\"dsightstech@gmail.com\";s:8:\"advanced\";s:0:\"\";s:8:\"testmode\";s:2:\"no\";s:13:\"paymentaction\";s:4:\"sale\";s:14:\"paypal_buttons\";s:3:\"yes\";s:14:\"invoice_prefix\";s:3:\"WC-\";s:13:\"send_shipping\";s:3:\"yes\";s:16:\"address_override\";s:2:\"no\";s:5:\"debug\";s:2:\"no\";s:9:\"image_url\";s:0:\"\";s:16:\"ipn_notification\";s:3:\"yes\";s:14:\"receiver_email\";s:21:\"dsightstech@gmail.com\";s:14:\"identity_token\";s:0:\"\";s:11:\"api_details\";s:0:\"\";s:12:\"api_username\";s:0:\"\";s:12:\"api_password\";s:0:\"\";s:13:\"api_signature\";s:0:\"\";s:20:\"sandbox_api_username\";s:0:\"\";s:20:\"sandbox_api_password\";s:0:\"\";s:21:\"sandbox_api_signature\";s:0:\"\";s:28:\"transact_onboarding_complete\";s:2:\"no\";s:12:\"_should_load\";s:2:\"no\";}','on'),
(306,'woocommerce_version','10.7.0','auto'),
(307,'woocommerce_db_version','10.7.0','auto'),
(308,'woocommerce_store_id','2724ab5b-bceb-4110-94f8-7f8ce5d65f5e','auto'),
(309,'woocommerce_admin_install_timestamp','1776511927','auto'),
(310,'woocommerce_inbox_variant_assignment','8','auto'),
(311,'woocommerce_remote_variant_assignment','99','auto'),
(317,'woocommerce_maxmind_geolocation_settings','a:1:{s:15:\"database_prefix\";s:32:\"zYXOSmpxR0BCai4TUzsarU5nkhdt8fsv\";}','on'),
(319,'widget_woocommerce_widget_cart','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(320,'widget_woocommerce_layered_nav_filters','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(321,'widget_woocommerce_layered_nav','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:4:{s:5:\"title\";s:18:\"Filter by Category\";s:9:\"attribute\";s:0:\"\";s:12:\"display_type\";s:4:\"list\";s:10:\"query_type\";s:3:\"and\";}}','auto'),
(322,'widget_woocommerce_price_filter','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:1:{s:5:\"title\";s:15:\"Filter by Price\";}}','auto'),
(323,'widget_woocommerce_product_categories','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(324,'widget_woocommerce_product_search','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:1:{s:5:\"title\";s:0:\"\";}}','auto'),
(325,'widget_woocommerce_product_tag_cloud','a:2:{s:12:\"_multiwidget\";i:1;i:1;a:1:{s:5:\"title\";s:12:\"Popular Tags\";}}','auto'),
(326,'widget_woocommerce_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(327,'widget_woocommerce_recently_viewed_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(328,'widget_woocommerce_top_rated_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(329,'widget_woocommerce_recent_reviews','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(330,'widget_woocommerce_rating_filter','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(331,'widget_wc_brands_brand_description','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(332,'widget_woocommerce_brand_nav','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(333,'widget_wc_brands_brand_thumbnails','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(334,'_site_transient_timeout_woocommerce_blocks_patterns','1779103928','off'),
(336,'jetpack_options','a:1:{s:14:\"last_heartbeat\";i:1777030681;}','auto'),
(338,'_transient_timeout_woocommerce_blocks_asset_api_script_data','1779675111','off'),
(341,'woocommerce_admin_notices','a:2:{i:0;s:20:\"no_secure_connection\";i:1;s:14:\"template_files\";}','auto'),
(342,'woocommerce_checkout_phone_field','optional','auto'),
(343,'woocommerce_checkout_company_field','hidden','auto'),
(344,'woocommerce_checkout_address_2_field','optional','auto'),
(349,'yoast_migrations_free','a:1:{s:7:\"version\";s:4:\"27.4\";}','auto'),
(350,'wpseo','a:124:{s:8:\"tracking\";b:0;s:16:\"toggled_tracking\";b:0;s:22:\"license_server_version\";b:0;s:15:\"ms_defaults_set\";b:0;s:40:\"ignore_search_engines_discouraged_notice\";b:0;s:19:\"indexing_first_time\";b:0;s:16:\"indexing_started\";b:0;s:15:\"indexing_reason\";s:13:\"first_install\";s:29:\"indexables_indexing_completed\";b:0;s:13:\"index_now_key\";s:0:\"\";s:7:\"version\";s:4:\"27.4\";s:16:\"previous_version\";s:0:\"\";s:20:\"disableadvanced_meta\";b:0;s:30:\"enable_headless_rest_endpoints\";b:1;s:17:\"ryte_indexability\";b:0;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:12:\"ahrefsverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:0;s:23:\"keyword_analysis_active\";b:0;s:34:\"inclusive_language_analysis_active\";b:0;s:21:\"enable_admin_bar_menu\";b:0;s:26:\"enable_cornerstone_content\";b:0;s:18:\"enable_xml_sitemap\";b:0;s:24:\"enable_text_link_counter\";b:0;s:16:\"enable_index_now\";b:0;s:19:\"enable_ai_generator\";b:0;s:22:\"ai_enabled_pre_default\";b:0;s:22:\"show_onboarding_notice\";b:0;s:18:\"first_activated_on\";b:0;s:13:\"myyoast-oauth\";b:0;s:26:\"semrush_integration_active\";b:0;s:14:\"semrush_tokens\";a:0:{}s:20:\"semrush_country_code\";s:2:\"us\";s:19:\"permalink_structure\";s:12:\"/%postname%/\";s:8:\"home_url\";s:20:\"https://furlio.au\";s:18:\"dynamic_permalinks\";b:0;s:17:\"category_base_url\";s:0:\"\";s:12:\"tag_base_url\";s:0:\"\";s:21:\"custom_taxonomy_slugs\";a:8:{s:12:\"action-group\";s:12:\"action-group\";s:13:\"product_brand\";s:5:\"brand\";s:12:\"product_type\";s:12:\"product_type\";s:18:\"product_visibility\";s:18:\"product_visibility\";s:11:\"product_cat\";s:16:\"product-category\";s:11:\"product_tag\";s:11:\"product-tag\";s:22:\"product_shipping_class\";s:22:\"product_shipping_class\";s:22:\"pos_product_visibility\";s:22:\"pos_product_visibility\";}s:29:\"enable_enhanced_slack_sharing\";b:0;s:23:\"enable_metabox_insights\";b:0;s:23:\"enable_link_suggestions\";b:0;s:26:\"algolia_integration_active\";b:0;s:14:\"import_cursors\";a:0:{}s:13:\"workouts_data\";a:1:{s:13:\"configuration\";a:1:{s:13:\"finishedSteps\";a:0:{}}}s:28:\"configuration_finished_steps\";a:0:{}s:36:\"dismiss_configuration_workout_notice\";b:0;s:34:\"dismiss_premium_deactivated_notice\";b:0;s:19:\"importing_completed\";a:0:{}s:26:\"wincher_integration_active\";b:0;s:14:\"wincher_tokens\";a:0:{}s:36:\"wincher_automatically_add_keyphrases\";b:0;s:18:\"wincher_website_id\";s:0:\"\";s:18:\"first_time_install\";b:1;s:34:\"should_redirect_after_install_free\";b:0;s:34:\"activation_redirect_timestamp_free\";i:1777026753;s:18:\"remove_feed_global\";b:0;s:27:\"remove_feed_global_comments\";b:0;s:25:\"remove_feed_post_comments\";b:0;s:19:\"remove_feed_authors\";b:0;s:22:\"remove_feed_categories\";b:0;s:16:\"remove_feed_tags\";b:0;s:29:\"remove_feed_custom_taxonomies\";b:0;s:22:\"remove_feed_post_types\";b:0;s:18:\"remove_feed_search\";b:0;s:21:\"remove_atom_rdf_feeds\";b:0;s:17:\"remove_shortlinks\";b:0;s:21:\"remove_rest_api_links\";b:0;s:20:\"remove_rsd_wlw_links\";b:0;s:19:\"remove_oembed_links\";b:0;s:16:\"remove_generator\";b:0;s:20:\"remove_emoji_scripts\";b:0;s:24:\"remove_powered_by_header\";b:0;s:22:\"remove_pingback_header\";b:0;s:28:\"clean_campaign_tracking_urls\";b:0;s:16:\"clean_permalinks\";b:0;s:32:\"clean_permalinks_extra_variables\";s:0:\"\";s:14:\"search_cleanup\";b:0;s:20:\"search_cleanup_emoji\";b:0;s:23:\"search_cleanup_patterns\";b:0;s:22:\"search_character_limit\";i:50;s:20:\"deny_search_crawling\";b:0;s:21:\"deny_wp_json_crawling\";b:0;s:20:\"deny_adsbot_crawling\";b:0;s:19:\"deny_ccbot_crawling\";b:0;s:29:\"deny_google_extended_crawling\";b:0;s:20:\"deny_gptbot_crawling\";b:0;s:27:\"redirect_search_pretty_urls\";b:0;s:29:\"least_readability_ignore_list\";a:0:{}s:27:\"least_seo_score_ignore_list\";a:0:{}s:23:\"most_linked_ignore_list\";a:0:{}s:24:\"least_linked_ignore_list\";a:0:{}s:28:\"indexables_page_reading_list\";a:5:{i:0;b:0;i:1;b:0;i:2;b:0;i:3;b:0;i:4;b:0;}s:25:\"indexables_overview_state\";s:21:\"dashboard-not-visited\";s:28:\"last_known_public_post_types\";a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:7:\"product\";}s:28:\"last_known_public_taxonomies\";a:7:{i:0;s:8:\"category\";i:1;s:8:\"post_tag\";i:2;s:11:\"post_format\";i:3;s:13:\"product_brand\";i:4;s:11:\"product_cat\";i:5;s:11:\"product_tag\";i:6;s:22:\"product_shipping_class\";}s:23:\"last_known_no_unindexed\";a:3:{s:40:\"wpseo_total_unindexed_post_type_archives\";i:1776518700;s:31:\"wpseo_unindexed_post_link_count\";i:1776519331;s:31:\"wpseo_unindexed_term_link_count\";i:1776519331;}s:14:\"new_post_types\";a:0:{}s:14:\"new_taxonomies\";a:0:{}s:34:\"show_new_content_type_notification\";b:0;s:44:\"site_kit_configuration_permanently_dismissed\";b:0;s:18:\"site_kit_connected\";b:0;s:37:\"site_kit_tracking_setup_widget_loaded\";s:2:\"no\";s:41:\"site_kit_tracking_first_interaction_stage\";s:0:\"\";s:40:\"site_kit_tracking_last_interaction_stage\";s:0:\"\";s:52:\"site_kit_tracking_setup_widget_temporarily_dismissed\";s:2:\"no\";s:52:\"site_kit_tracking_setup_widget_permanently_dismissed\";s:2:\"no\";s:31:\"google_site_kit_feature_enabled\";b:0;s:25:\"ai_free_sparks_started_on\";N;s:15:\"enable_llms_txt\";b:0;s:15:\"last_updated_on\";b:0;s:17:\"default_seo_title\";a:3:{i:0;i:65;i:1;i:62;i:2;i:1;}s:21:\"default_seo_meta_desc\";a:3:{i:0;i:65;i:1;i:62;i:2;i:1;}s:18:\"first_activated_by\";b:0;s:34:\"enable_schema_aggregation_endpoint\";b:0;s:38:\"schema_aggregation_endpoint_enabled_on\";N;s:16:\"enable_task_list\";b:0;s:13:\"enable_schema\";b:0;}','auto'),
(351,'wpseo_titles','a:185:{s:17:\"forcerewritetitle\";b:1;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:56:\"Furlio — Premium Pet Supplies Australia | %%sitename%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:35:\"Page not found %%sep%% %%sitename%%\";s:25:\"social-title-author-wpseo\";s:8:\"%%name%%\";s:26:\"social-title-archive-wpseo\";s:8:\"%%date%%\";s:31:\"social-description-author-wpseo\";s:0:\"\";s:32:\"social-description-archive-wpseo\";s:0:\"\";s:29:\"social-image-url-author-wpseo\";s:0:\"\";s:30:\"social-image-url-archive-wpseo\";s:0:\"\";s:28:\"social-image-id-author-wpseo\";i:0;s:29:\"social-image-id-archive-wpseo\";i:0;s:19:\"metadesc-home-wpseo\";s:147:\"Shop premium pet supplies in Australia. Free shipping on orders $75+. Fast delivery nationwide. Dog food, cat accessories, pet beds, toys and more.\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:0;s:21:\"noindex-archive-wpseo\";b:0;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:0;s:20:\"breadcrumbs-404crumb\";s:25:\"Error 404: Page not found\";s:29:\"breadcrumbs-display-blog-page\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:12:\"Archives for\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:16:\"You searched for\";s:15:\"breadcrumbs-sep\";s:2:\"»\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:22:\"company_alternate_name\";s:0:\"\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:0;s:26:\"open_graph_frontpage_title\";s:12:\"%%sitename%%\";s:25:\"open_graph_frontpage_desc\";s:0:\"\";s:26:\"open_graph_frontpage_image\";s:0:\"\";s:24:\"publishing_principles_id\";i:0;s:25:\"ownership_funding_info_id\";i:0;s:29:\"actionable_feedback_policy_id\";i:0;s:21:\"corrections_policy_id\";i:0;s:16:\"ethics_policy_id\";i:0;s:19:\"diversity_policy_id\";i:0;s:28:\"diversity_staffing_report_id\";i:0;s:15:\"org-description\";s:0:\"\";s:9:\"org-email\";s:0:\"\";s:9:\"org-phone\";s:0:\"\";s:14:\"org-legal-name\";s:0:\"\";s:17:\"org-founding-date\";s:0:\"\";s:20:\"org-number-employees\";s:0:\"\";s:10:\"org-vat-id\";s:0:\"\";s:10:\"org-tax-id\";s:0:\"\";s:7:\"org-iso\";s:0:\"\";s:8:\"org-duns\";s:0:\"\";s:11:\"org-leicode\";s:0:\"\";s:9:\"org-naics\";s:0:\"\";s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:1;s:23:\"display-metabox-pt-post\";b:0;s:23:\"post_types-post-maintax\";i:0;s:21:\"schema-page-type-post\";s:7:\"WebPage\";s:24:\"schema-article-type-post\";s:7:\"Article\";s:17:\"social-title-post\";s:9:\"%%title%%\";s:23:\"social-description-post\";s:0:\"\";s:21:\"social-image-url-post\";s:0:\"\";s:20:\"social-image-id-post\";i:0;s:10:\"title-page\";s:18:\"%%title%% | Furlio\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:23:\"display-metabox-pt-page\";b:0;s:23:\"post_types-page-maintax\";i:0;s:21:\"schema-page-type-page\";s:7:\"WebPage\";s:24:\"schema-article-type-page\";s:4:\"None\";s:17:\"social-title-page\";s:9:\"%%title%%\";s:23:\"social-description-page\";s:0:\"\";s:21:\"social-image-url-page\";s:0:\"\";s:20:\"social-image-id-page\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:0;s:29:\"post_types-attachment-maintax\";i:0;s:27:\"schema-page-type-attachment\";s:7:\"WebPage\";s:30:\"schema-article-type-attachment\";s:4:\"None\";s:13:\"title-product\";s:18:\"%%title%% | Furlio\";s:16:\"metadesc-product\";s:11:\"%%excerpt%%\";s:15:\"noindex-product\";b:0;s:26:\"display-metabox-pt-product\";b:0;s:26:\"post_types-product-maintax\";i:0;s:24:\"schema-page-type-product\";s:7:\"WebPage\";s:27:\"schema-article-type-product\";s:4:\"None\";s:20:\"social-title-product\";s:9:\"%%title%%\";s:26:\"social-description-product\";s:0:\"\";s:24:\"social-image-url-product\";s:0:\"\";s:23:\"social-image-id-product\";i:0;s:23:\"title-ptarchive-product\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:26:\"metadesc-ptarchive-product\";s:0:\"\";s:25:\"bctitle-ptarchive-product\";s:0:\"\";s:25:\"noindex-ptarchive-product\";b:0;s:30:\"social-title-ptarchive-product\";s:21:\"%%pt_plural%% Archive\";s:36:\"social-description-ptarchive-product\";s:0:\"\";s:34:\"social-image-url-ptarchive-product\";s:0:\"\";s:33:\"social-image-id-ptarchive-product\";i:0;s:18:\"title-tax-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:0;s:20:\"noindex-tax-category\";b:0;s:25:\"social-title-tax-category\";s:23:\"%%term_title%% Archives\";s:31:\"social-description-tax-category\";s:0:\"\";s:29:\"social-image-url-tax-category\";s:0:\"\";s:28:\"social-image-id-tax-category\";i:0;s:26:\"taxonomy-category-ptparent\";i:0;s:18:\"title-tax-post_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:0;s:20:\"noindex-tax-post_tag\";b:0;s:25:\"social-title-tax-post_tag\";s:23:\"%%term_title%% Archives\";s:31:\"social-description-tax-post_tag\";s:0:\"\";s:29:\"social-image-url-tax-post_tag\";s:0:\"\";s:28:\"social-image-id-tax-post_tag\";i:0;s:26:\"taxonomy-post_tag-ptparent\";i:0;s:21:\"title-tax-post_format\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:0;s:23:\"noindex-tax-post_format\";b:0;s:28:\"social-title-tax-post_format\";s:23:\"%%term_title%% Archives\";s:34:\"social-description-tax-post_format\";s:0:\"\";s:32:\"social-image-url-tax-post_format\";s:0:\"\";s:31:\"social-image-id-tax-post_format\";i:0;s:29:\"taxonomy-post_format-ptparent\";i:0;s:23:\"title-tax-product_brand\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:26:\"metadesc-tax-product_brand\";s:0:\"\";s:33:\"display-metabox-tax-product_brand\";b:0;s:25:\"noindex-tax-product_brand\";b:0;s:30:\"social-title-tax-product_brand\";s:23:\"%%term_title%% Archives\";s:36:\"social-description-tax-product_brand\";s:0:\"\";s:34:\"social-image-url-tax-product_brand\";s:0:\"\";s:33:\"social-image-id-tax-product_brand\";i:0;s:31:\"taxonomy-product_brand-ptparent\";i:0;s:21:\"title-tax-product_cat\";s:40:\"%%term_title%% — Pet Supplies | Furlio\";s:24:\"metadesc-tax-product_cat\";s:0:\"\";s:31:\"display-metabox-tax-product_cat\";b:0;s:23:\"noindex-tax-product_cat\";b:0;s:28:\"social-title-tax-product_cat\";s:23:\"%%term_title%% Archives\";s:34:\"social-description-tax-product_cat\";s:0:\"\";s:32:\"social-image-url-tax-product_cat\";s:0:\"\";s:31:\"social-image-id-tax-product_cat\";i:0;s:29:\"taxonomy-product_cat-ptparent\";i:0;s:21:\"title-tax-product_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-product_tag\";s:0:\"\";s:31:\"display-metabox-tax-product_tag\";b:0;s:23:\"noindex-tax-product_tag\";b:0;s:28:\"social-title-tax-product_tag\";s:23:\"%%term_title%% Archives\";s:34:\"social-description-tax-product_tag\";s:0:\"\";s:32:\"social-image-url-tax-product_tag\";s:0:\"\";s:31:\"social-image-id-tax-product_tag\";i:0;s:29:\"taxonomy-product_tag-ptparent\";i:0;s:32:\"title-tax-product_shipping_class\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:35:\"metadesc-tax-product_shipping_class\";s:0:\"\";s:42:\"display-metabox-tax-product_shipping_class\";b:0;s:34:\"noindex-tax-product_shipping_class\";b:0;s:39:\"social-title-tax-product_shipping_class\";s:23:\"%%term_title%% Archives\";s:45:\"social-description-tax-product_shipping_class\";s:0:\"\";s:43:\"social-image-url-tax-product_shipping_class\";s:0:\"\";s:42:\"social-image-id-tax-product_shipping_class\";i:0;s:40:\"taxonomy-product_shipping_class-ptparent\";i:0;s:14:\"person_logo_id\";i:0;s:15:\"company_logo_id\";i:0;s:29:\"open_graph_frontpage_image_id\";i:0;s:12:\"noindex-cart\";b:1;s:16:\"noindex-checkout\";b:1;s:18:\"noindex-my-account\";b:1;}','auto'),
(352,'wpseo_social','a:20:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:41:\"Furlio — Premium Pet Supplies Australia\";s:17:\"og_frontpage_desc\";s:103:\"Your trusted Aussie source for premium pet supplies. Fast delivery, free shipping $75+, 30-day returns.\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:0;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:0;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:13:\"wikipedia_url\";s:0:\"\";s:17:\"other_social_urls\";a:0:{}s:12:\"mastodon_url\";s:0:\"\";}','auto'),
(353,'wpseo_llmstxt','a:7:{s:23:\"llms_txt_selection_mode\";s:4:\"auto\";s:13:\"about_us_page\";i:0;s:12:\"contact_page\";i:0;s:10:\"terms_page\";i:0;s:19:\"privacy_policy_page\";i:0;s:9:\"shop_page\";i:0;s:20:\"other_included_pages\";a:0:{}}','auto'),
(354,'wpseo_tracking_only','a:3:{s:25:\"task_list_first_opened_on\";s:0:\"\";s:22:\"task_first_actioned_on\";s:0:\"\";s:36:\"frontend_inspector_first_actioned_on\";s:0:\"\";}','auto'),
(357,'jetpack_connection_active_plugins','a:1:{s:11:\"woocommerce\";a:1:{s:4:\"name\";s:11:\"WooCommerce\";}}','auto'),
(364,'mailchimp-woocommerce','a:4:{s:24:\"mailchimp_permission_cap\";s:13:\"administrator\";s:33:\"woocommerce_settings_save_general\";b:1;s:19:\"store_currency_code\";s:3:\"AUD\";s:10:\"store_name\";s:31:\"Furlio — Premium Pet Supplies\";}','auto'),
(366,'mailchimp-woocommerce-store_id','69e36bd59203d','auto'),
(367,'mailchimp-woocommerce-store-id-last-verified','1777026754','auto'),
(370,'rsssl_encryption_keys_set','1','off'),
(372,'rsssl_show_onboarding','1','off'),
(373,'rsssl_redirect_to_settings_page','1','auto'),
(376,'rsssl_current_version','9.5.9','off'),
(379,'wp_super_cache_index_detected','1','off'),
(383,'wpcf7','a:2:{s:7:\"version\";s:5:\"6.1.5\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1776511976;s:7:\"version\";s:5:\"6.1.5\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}','auto'),
(392,'product_cat_children','a:0:{}','auto'),
(393,'mailchimp_woocommerce_version','6.0.2','auto'),
(395,'mailchimp-woocommerce_cart_table_add_index_update','1','auto'),
(396,'action_scheduler_lock_async-request-runner','69eb46cc503655.02785770|1777026824','no'),
(397,'woocommerce_hooked_blocks_version','10.7.0','auto'),
(398,'woocommerce_custom_orders_table_created','yes','auto'),
(399,'woocommerce_coming_soon','no','auto'),
(400,'woocommerce_store_pages_only','yes','auto'),
(401,'woocommerce_email_improvements_default_enabled','yes','auto'),
(402,'woocommerce_email_improvements_first_enabled_at','2026-04-18 11:35:04','auto'),
(403,'woocommerce_email_improvements_last_enabled_at','2026-04-18 11:35:04','auto'),
(404,'woocommerce_email_improvements_enabled_count','1','auto'),
(405,'woocommerce_back_in_stock_allow_signups','yes','auto'),
(406,'woocommerce_analytics_scheduled_import','yes','auto'),
(407,'woocommerce_admin_scheduler_last_processed_order_modified_date','2026-04-25 01:20:25','off'),
(408,'woocommerce_admin_scheduler_last_processed_order_id','0','off'),
(409,'woocommerce_initial_installed_version','10.7.0','off'),
(410,'wc_blocks_db_schema_version','260','auto'),
(411,'wc_remote_inbox_notifications_stored_state','O:8:\"stdClass\":2:{s:22:\"there_were_no_products\";b:1;s:22:\"there_are_now_products\";b:0;}','off'),
(413,'as_has_wp_comment_logs','no','on'),
(416,'woocommerce_admin_pes_incentive_woopayments_store_had_woopayments','no','auto'),
(422,'_transient_timeout_woocommerce_admin_payment_gateway_suggestions_specs','1777631562','off'),
(424,'_transient_timeout_woocommerce_admin_remote_free_extensions_specs','1777631562','off'),
(426,'_transient_timeout_woocommerce_admin_remote_inbox_notifications_specs','1777631562','off'),
(431,'woocommerce_gateway_order','a:6:{s:19:\"_wc_pes_woopayments\";i:0;s:25:\"_wc_pes_paypal_full_stack\";i:1;s:33:\"_wc_offline_payment_methods_group\";i:2;s:4:\"bacs\";i:3;s:6:\"cheque\";i:4;s:3:\"cod\";i:5;}','auto'),
(442,'_transient_timeout_rsssl_can_use_curl_headers_check','1777116919','off'),
(446,'rsssl_port_check_2082','fail','off'),
(449,'rsssl_htaccess_should_wrap','1','off'),
(465,'_site_transient_timeout_browser_4238b62bcd3c1a9c24ccf656e6ace824','1777116920','off'),
(467,'_site_transient_timeout_php_check_76d2cd2a5eb29facccd351abf19ed9c8','1777116921','off'),
(477,'can_compress_scripts','0','on'),
(490,'_transient_timeout_wc_shipping_method_count','1779279076','off'),
(497,'finished_updating_comment_type','1','auto'),
(502,'using_application_passwords','1','off'),
(520,'_transient_timeout_wc_blocks_query_5363a57d92ddac380bcea0733b79eaad','1779278709','off'),
(540,'current_theme','Astra','auto'),
(541,'theme_switched','','auto'),
(544,'theme_mods_storefront','a:18:{s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:21;}s:24:\"storefront_heading_color\";s:7:\"#1a3a4a\";s:21:\"storefront_text_color\";s:7:\"#333333\";s:23:\"storefront_accent_color\";s:7:\"#f47c20\";s:34:\"storefront_header_background_color\";s:7:\"#1a3a4a\";s:28:\"storefront_header_text_color\";s:7:\"#ffffff\";s:28:\"storefront_header_link_color\";s:7:\"#ffffff\";s:34:\"storefront_footer_background_color\";s:7:\"#1a3a4a\";s:31:\"storefront_footer_heading_color\";s:7:\"#f47c20\";s:28:\"storefront_footer_text_color\";s:7:\"#ccdddd\";s:28:\"storefront_footer_link_color\";s:7:\"#f47c20\";s:34:\"storefront_button_background_color\";s:7:\"#f47c20\";s:28:\"storefront_button_text_color\";s:7:\"#ffffff\";s:38:\"storefront_button_alt_background_color\";s:7:\"#1a3a4a\";s:32:\"storefront_button_alt_text_color\";s:7:\"#ffffff\";s:17:\"storefront_layout\";s:5:\"right\";s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1776520286;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:8:\"header-1\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}}}}','off'),
(545,'woocommerce_catalog_rows','4','auto'),
(546,'woocommerce_catalog_columns','3','auto'),
(547,'woocommerce_maybe_regenerate_images_hash','991b1ca641921cf0f5baf7a2fe85861b','auto'),
(549,'storefront_nux_fresh_site','0','auto'),
(556,'woocommerce_flat_rate_1_settings','a:3:{s:5:\"title\";s:17:\"Standard Shipping\";s:10:\"tax_status\";s:7:\"taxable\";s:4:\"cost\";s:4:\"8.95\";}','auto'),
(557,'woocommerce_free_shipping_2_settings','a:4:{s:5:\"title\";s:31:\"Free Shipping (orders over $75)\";s:8:\"requires\";s:10:\"min_amount\";s:10:\"min_amount\";s:2:\"75\";s:16:\"ignore_discounts\";s:2:\"no\";}','auto'),
(568,'woocommerce_shop_page_display','','auto'),
(569,'woocommerce_category_archive_display','','auto'),
(570,'woocommerce_default_catalog_orderby','popularity','auto'),
(585,'bsf_usage_migrated','1','off'),
(586,'theme_mods_astra','a:4:{s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:21;}s:18:\"astra-google-fonts\";s:51:\"Nunito:300,400,600,700,800|Playfair+Display:400,700\";s:18:\"custom_css_post_id\";i:26;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1776925205;s:4:\"data\";a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:15:\"footer-widget-1\";a:1:{i:0;s:6:\"text-1\";}s:15:\"footer-widget-2\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:24:\"advanced-footer-widget-1\";a:0:{}s:24:\"advanced-footer-widget-2\";a:0:{}s:24:\"advanced-footer-widget-3\";a:0:{}s:24:\"advanced-footer-widget-4\";a:0:{}s:22:\"astra-woo-shop-sidebar\";a:0:{}}}}','off'),
(588,'astra-settings','a:55:{s:18:\"theme-auto-version\";s:6:\"4.13.0\";s:22:\"is_theme_queue_running\";b:0;s:11:\"site-layout\";s:21:\"ast-full-width-layout\";s:18:\"site-content-width\";i:1200;s:22:\"ast-site-content-width\";i:1200;s:16:\"body-font-family\";s:6:\"Nunito\";s:16:\"body-font-weight\";s:3:\"400\";s:14:\"body-font-size\";a:6:{s:7:\"desktop\";i:16;s:6:\"tablet\";i:15;s:6:\"mobile\";i:14;s:12:\"desktop-unit\";s:2:\"px\";s:11:\"tablet-unit\";s:2:\"px\";s:11:\"mobile-unit\";s:2:\"px\";}s:16:\"body-line-height\";d:1.7;s:20:\"headings-font-family\";s:16:\"Playfair Display\";s:20:\"headings-font-weight\";s:3:\"700\";s:10:\"text-color\";s:7:\"#2D3748\";s:10:\"link-color\";s:7:\"#2E86AB\";s:12:\"link-h-color\";s:7:\"#F18F01\";s:11:\"theme-color\";s:7:\"#2E86AB\";s:26:\"global-custom-button-color\";s:7:\"#FF6B35\";s:29:\"global-custom-button-bg-color\";s:7:\"#FF6B35\";s:33:\"global-custom-button-border-color\";s:7:\"#FF6B35\";s:9:\"btn-color\";s:7:\"#ffffff\";s:12:\"btn-bg-color\";s:7:\"#FF6B35\";s:16:\"btn-border-color\";s:7:\"#FF6B35\";s:11:\"btn-h-color\";s:7:\"#ffffff\";s:14:\"btn-h-bg-color\";s:7:\"#e85d2e\";s:22:\"btn-padding-top-bottom\";i:14;s:22:\"btn-padding-left-right\";i:28;s:17:\"btn-border-radius\";i:30;s:15:\"header-bg-color\";s:7:\"#ffffff\";s:12:\"header-color\";s:7:\"#1F2937\";s:16:\"site-title-color\";s:7:\"#2E86AB\";s:18:\"site-tagline-color\";s:7:\"#6B7280\";s:27:\"transparent-header-bg-color\";s:22:\"rgba(255,255,255,0.97)\";s:22:\"sticky-header-bg-color\";s:7:\"#ffffff\";s:20:\"enable-sticky-header\";i:1;s:15:\"footer-bg-color\";s:7:\"#1F2937\";s:12:\"footer-color\";s:7:\"#D1D5DB\";s:17:\"footer-link-color\";s:7:\"#F18F01\";s:19:\"footer-link-h-color\";s:7:\"#ffffff\";s:20:\"footer-adv-wgt-title\";s:7:\"#ffffff\";s:17:\"footer-sml-layout\";s:19:\"footer-sml-layout-1\";s:16:\"content-bg-color\";s:7:\"#FFF9F2\";s:16:\"sidebar-bg-color\";s:7:\"#ffffff\";s:18:\"ast-global-color-0\";s:7:\"#2E86AB\";s:18:\"ast-global-color-1\";s:7:\"#F18F01\";s:18:\"ast-global-color-2\";s:7:\"#FF6B35\";s:18:\"ast-global-color-3\";s:7:\"#1F2937\";s:18:\"ast-global-color-4\";s:7:\"#FFF9F2\";s:18:\"ast-global-color-5\";s:7:\"#5C8001\";s:29:\"woocommerce-product-structure\";a:6:{i:0;s:20:\"single_product_title\";i:1;s:21:\"single_product_rating\";i:2;s:20:\"single_product_price\";i:3;s:19:\"single_product_desc\";i:4;s:26:\"single_product_add_to_cart\";i:5;s:19:\"single_product_meta\";}s:21:\"ast-shop-product-card\";s:6:\"border\";s:24:\"product-sale-badge-color\";s:7:\"#FF6B35\";s:27:\"product-sale-badge-bg-color\";s:7:\"#FF6B35\";s:11:\"blog-layout\";s:13:\"blog-layout-1\";s:20:\"footer-sml-copyright\";s:72:\"© 2026 Furlio — Premium Australian Pet Supplies. All Rights Reserved.\";s:22:\"header-main-rt-section\";s:11:\"woocommerce\";s:20:\"woo-header-cart-icon\";s:3:\"bag\";}','auto'),
(596,'astra-sites-auto-version','4.5.3','off'),
(597,'astra-header-desktop-items','a:3:{s:12:\"above_header\";a:2:{s:8:\"column-1\";a:0:{}s:8:\"column-2\";a:0:{}}s:6:\"header\";a:5:{s:8:\"column-1\";a:1:{i:0;a:1:{s:2:\"id\";s:13:\"site-identity\";}}s:8:\"column-2\";a:0:{}s:8:\"column-3\";a:1:{i:0;a:1:{s:2:\"id\";s:13:\"ast-hf-menu-1\";}}s:8:\"column-4\";a:1:{i:0;a:1:{s:2:\"id\";s:8:\"woo-cart\";}}s:8:\"column-5\";a:0:{}}s:12:\"below_header\";a:2:{s:8:\"column-1\";a:0:{}s:8:\"column-2\";a:0:{}}}','auto'),
(598,'astra-footer-desktop-items','a:3:{s:16:\"footer-above-bar\";a:2:{s:8:\"column-1\";a:0:{}s:8:\"column-2\";a:0:{}}s:6:\"footer\";a:3:{s:8:\"column-1\";a:1:{i:0;a:1:{s:2:\"id\";s:8:\"widget-1\";}}s:8:\"column-2\";a:1:{i:0;a:1:{s:2:\"id\";s:8:\"widget-2\";}}s:8:\"column-3\";a:1:{i:0;a:1:{s:2:\"id\";s:8:\"widget-3\";}}}s:16:\"footer-below-bar\";a:1:{s:8:\"column-1\";a:1:{i:0;a:1:{s:2:\"id\";s:16:\"ast-hf-copyright\";}}}}','auto'),
(601,'astra_sites_settings','a:1:{s:18:\"_import_timestamps\";a:1:{s:14:\"content_edited\";a:20:{i:0;i:1776520518;i:1;i:1776575418;i:2;i:1776575492;i:3;i:1776575607;i:4;i:1776575650;i:5;i:1776587483;i:6;i:1776587502;i:7;i:1776596529;i:8;i:1776596529;i:9;i:1776596530;i:10;i:1776596530;i:11;i:1776596531;i:12;i:1776596531;i:13;i:1776686435;i:14;i:1776686436;i:15;i:1776686481;i:16;i:1776686481;i:17;i:1777038782;i:18;i:1777080169;i:19;i:1777080268;}}}','off'),
(635,'wc_stripe_wh_monitor_began_at','1776574639','auto'),
(636,'wc_stripe_wh_last_success_at','0','auto'),
(637,'wc_stripe_wh_last_failure_at','0','auto'),
(638,'wc_stripe_wh_last_error','validation_succeeded','auto'),
(642,'woocommerce-ppcp-version','4.0.2','auto'),
(643,'woocommerce-ppcp-settings','a:1:{s:24:\"allow_local_apm_gateways\";b:1;}','auto'),
(644,'_transient_timeout_ppcp_has_ppec_subscriptions','1779166665','off'),
(646,'woocommerce_ppcp-axo-gateway_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','on'),
(647,'woocommerce_stripe_settings','a:20:{s:7:\"enabled\";s:3:\"yes\";s:15:\"publishable_key\";s:107:\"pk_live_51TODJwA3dqys8x5WeTSTxvfKxEXYR1Un4uf0UP2e4HrTILZnnjjLkczfsJxpdJd5qPgfMdmvkZ4HpAipCLyD9k9P00csNcvDha\";s:10:\"secret_key\";s:107:\"STRIPE_SECRET_KEY_INJECT_FROM_SERVER\";s:20:\"test_publishable_key\";s:0:\"\";s:15:\"test_secret_key\";s:0:\"\";s:8:\"testmode\";s:2:\"no\";s:7:\"logging\";s:2:\"no\";s:14:\"inline_cc_form\";s:2:\"no\";s:20:\"statement_descriptor\";s:0:\"\";s:7:\"capture\";s:3:\"yes\";s:15:\"payment_request\";s:3:\"yes\";s:27:\"payment_request_button_type\";s:3:\"buy\";s:28:\"payment_request_button_theme\";s:4:\"dark\";s:32:\"payment_request_button_locations\";a:1:{i:0;s:8:\"checkout\";}s:11:\"saved_cards\";s:3:\"yes\";s:31:\"stripe_upe_payment_method_order\";a:24:{i:0;s:4:\"card\";i:1;s:15:\"us_bank_account\";i:2;s:6:\"alipay\";i:3;s:10:\"amazon_pay\";i:4;s:4:\"blik\";i:5;s:7:\"giropay\";i:6;s:6:\"klarna\";i:7;s:6:\"affirm\";i:8;s:17:\"afterpay_clearpay\";i:9;s:3:\"eps\";i:10;s:10:\"bancontact\";i:11;s:6:\"boleto\";i:12;s:5:\"ideal\";i:13;s:4:\"oxxo\";i:14;s:10:\"sepa_debit\";i:15;s:3:\"p24\";i:16;s:6:\"sofort\";i:17;s:10:\"multibanco\";i:18;s:4:\"link\";i:19;s:10:\"wechat_pay\";i:20;s:7:\"cashapp\";i:21;s:10:\"acss_debit\";i:22;s:10:\"bacs_debit\";i:23;s:13:\"au_becs_debit\";}s:11:\"pmc_enabled\";s:2:\"no\";s:25:\"apple_pay_verified_domain\";s:9:\"localhost\";s:20:\"apple_pay_domain_set\";s:3:\"yes\";s:31:\"upe_checkout_experience_enabled\";s:2:\"no\";}','auto'),
(653,'wc_stripe_wh_test_monitor_began_at','1776574666','auto'),
(654,'wc_stripe_wh_test_last_success_at','0','auto'),
(655,'wc_stripe_wh_test_last_failure_at','0','auto'),
(656,'wc_stripe_wh_test_last_error','validation_succeeded','auto'),
(657,'woocommerce-ppcp-data-paylater-messaging','a:9:{s:17:\"messaging_enabled\";b:0;s:20:\"styling_per_location\";b:0;s:19:\"messaging_locations\";a:0:{}s:4:\"cart\";O:60:\"WooCommerce\\PayPalCommerce\\Settings\\DTO\\PayLaterMessagingDTO\":9:{s:8:\"location\";s:4:\"cart\";s:7:\"enabled\";b:0;s:6:\"layout\";s:4:\"text\";s:9:\"logo_type\";s:6:\"inline\";s:13:\"logo_position\";s:4:\"left\";s:10:\"text_color\";s:5:\"black\";s:9:\"text_size\";s:2:\"12\";s:10:\"flex_color\";s:5:\"black\";s:10:\"flex_ratio\";s:3:\"8x1\";}s:8:\"checkout\";O:60:\"WooCommerce\\PayPalCommerce\\Settings\\DTO\\PayLaterMessagingDTO\":9:{s:8:\"location\";s:8:\"checkout\";s:7:\"enabled\";b:0;s:6:\"layout\";s:4:\"text\";s:9:\"logo_type\";s:6:\"inline\";s:13:\"logo_position\";s:4:\"left\";s:10:\"text_color\";s:5:\"black\";s:9:\"text_size\";s:2:\"12\";s:10:\"flex_color\";s:5:\"black\";s:10:\"flex_ratio\";s:3:\"8x1\";}s:7:\"product\";O:60:\"WooCommerce\\PayPalCommerce\\Settings\\DTO\\PayLaterMessagingDTO\":9:{s:8:\"location\";s:7:\"product\";s:7:\"enabled\";b:0;s:6:\"layout\";s:4:\"text\";s:9:\"logo_type\";s:6:\"inline\";s:13:\"logo_position\";s:4:\"left\";s:10:\"text_color\";s:5:\"black\";s:9:\"text_size\";s:2:\"12\";s:10:\"flex_color\";s:5:\"black\";s:10:\"flex_ratio\";s:3:\"8x1\";}s:4:\"shop\";O:60:\"WooCommerce\\PayPalCommerce\\Settings\\DTO\\PayLaterMessagingDTO\":9:{s:8:\"location\";s:4:\"shop\";s:7:\"enabled\";b:0;s:6:\"layout\";s:4:\"flex\";s:9:\"logo_type\";s:6:\"inline\";s:13:\"logo_position\";s:4:\"left\";s:10:\"text_color\";s:5:\"black\";s:9:\"text_size\";s:2:\"12\";s:10:\"flex_color\";s:5:\"black\";s:10:\"flex_ratio\";s:3:\"8x1\";}s:4:\"home\";O:60:\"WooCommerce\\PayPalCommerce\\Settings\\DTO\\PayLaterMessagingDTO\":9:{s:8:\"location\";s:4:\"home\";s:7:\"enabled\";b:0;s:6:\"layout\";s:4:\"flex\";s:9:\"logo_type\";s:6:\"inline\";s:13:\"logo_position\";s:4:\"left\";s:10:\"text_color\";s:5:\"black\";s:9:\"text_size\";s:2:\"12\";s:10:\"flex_color\";s:5:\"black\";s:10:\"flex_ratio\";s:3:\"8x1\";}s:16:\"custom_placement\";O:60:\"WooCommerce\\PayPalCommerce\\Settings\\DTO\\PayLaterMessagingDTO\":9:{s:8:\"location\";s:16:\"custom_placement\";s:7:\"enabled\";b:0;s:6:\"layout\";s:4:\"text\";s:9:\"logo_type\";s:6:\"inline\";s:13:\"logo_position\";s:4:\"left\";s:10:\"text_color\";s:5:\"black\";s:9:\"text_size\";s:2:\"12\";s:10:\"flex_color\";s:5:\"black\";s:10:\"flex_ratio\";s:3:\"8x1\";}}','auto'),
(658,'wcstripe_payment_method_config_fetch_cooldown','1776686477','auto'),
(660,'woocommerce_bacs_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(661,'woocommerce_cheque_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(668,'WPLANG','en_AU','auto'),
(685,'custom_css_post_id','38','auto'),
(691,'woocommerce_email_from_name','Furlio','auto'),
(692,'woocommerce_new_order_settings','a:4:{s:7:\"enabled\";s:3:\"yes\";s:7:\"subject\";s:34:\"[Furlio] New order #{order_number}\";s:7:\"heading\";s:18:\"New customer order\";s:9:\"recipient\";s:15:\"hello@furlio.au\";}','auto'),
(693,'woocommerce_customer_processing_order_settings','a:3:{s:7:\"enabled\";s:3:\"yes\";s:7:\"subject\";s:36:\"Your Furlio order is being processed\";s:7:\"heading\";s:24:\"Thank you for your order\";}','auto'),
(694,'woocommerce_customer_completed_order_settings','a:3:{s:7:\"enabled\";s:3:\"yes\";s:7:\"subject\";s:30:\"Your Furlio order is complete!\";s:7:\"heading\";s:27:\"Your order is complete 🐾\";}','auto'),
(695,'wp_super_cache_enabled','1','auto'),
(697,'wpsupercache_rejected_strings','wp-admin\nwp-login\ncart\ncheckout\nmy-account\nwc-api\naddons\nlost-password','auto'),
(698,'wpsupercache_gc_time','1776593716','auto'),
(723,'recently_activated','a:15:{s:24:\"wordpress-seo/wp-seo.php\";i:1776925203;s:27:\"wp-super-cache/wp-cache.php\";i:1776925203;s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";i:1776925203;s:59:\"woocommerce-paypal-payments/woocommerce-paypal-payments.php\";i:1776925203;s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";i:1776925202;s:27:\"woocommerce/woocommerce.php\";i:1776925202;s:27:\"astra-sites/astra-sites.php\";i:1776925202;s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";i:1776925202;s:9:\"hello.php\";i:1776925202;s:36:\"contact-form-7/wp-contact-form-7.php\";i:1776925202;s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";i:1776925202;s:19:\"akismet/akismet.php\";i:1776925202;s:49:\"woo-variation-swatches/woo-variation-swatches.php\";i:1776916340;s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";i:1776916340;i:0;b:0;}','auto'),
(733,'rsssl_activation','1','off'),
(741,'_transient_timeout_woocommerce_blocks_asset_api_script_data_ssl','1779280093','off'),
(748,'woocommerce_task_list_tracked_completed_tasks','a:1:{i:0;s:8:\"products\";}','auto'),
(801,'product_brand_children','a:0:{}','auto'),
(815,'_transient_timeout_woocommerce_block_asset_resource_hints','1777687906','off'),
(839,'rsssl_404_cache','a:1:{s:3:\"::1\";a:2:{i:0;i:1776602832;i:1;i:1776602832;}}','off'),
(866,'wc_stripe_show_style_notice','no','auto'),
(867,'wc_stripe_show_sca_notice','no','auto'),
(868,'wc_stripe_amazon_pay_default_on','yes','auto'),
(869,'wc_stripe_version','10.5.3','auto'),
(901,'woocommerce_stripe_pmc_fallback_id_live','pmc_1TODKTA3dqys8x5WQKR1mXhG','auto'),
(903,'wcstripe_cache_live_account_data','a:3:{s:4:\"data\";a:15:{s:2:\"id\";s:21:\"acct_1TODJwA3dqys8x5W\";s:6:\"object\";s:7:\"account\";s:16:\"business_profile\";a:10:{s:14:\"annual_revenue\";N;s:22:\"estimated_worker_count\";N;s:3:\"mcc\";s:4:\"5818\";s:35:\"minority_owned_business_designation\";N;s:4:\"name\";s:28:\"Pratham Technologies Pty Ltd\";s:15:\"support_address\";N;s:13:\"support_email\";N;s:13:\"support_phone\";s:12:\"+61434945317\";s:11:\"support_url\";N;s:3:\"url\";s:10:\"pratham.au\";}s:13:\"business_type\";s:7:\"company\";s:12:\"capabilities\";a:12:{s:26:\"afterpay_clearpay_payments\";s:6:\"active\";s:19:\"bancontact_payments\";s:6:\"active\";s:13:\"blik_payments\";s:6:\"active\";s:13:\"card_payments\";s:6:\"active\";s:25:\"cartes_bancaires_payments\";s:7:\"pending\";s:12:\"eps_payments\";s:6:\"active\";s:15:\"klarna_payments\";s:6:\"active\";s:13:\"link_payments\";s:6:\"active\";s:15:\"mb_way_payments\";s:6:\"active\";s:12:\"pix_payments\";s:6:\"active\";s:9:\"transfers\";s:6:\"active\";s:12:\"zip_payments\";s:6:\"active\";}s:15:\"charges_enabled\";b:1;s:7:\"company\";a:2:{s:4:\"name\";s:28:\"Pratham Technologies Pty Ltd\";s:9:\"structure\";s:19:\"private_corporation\";}s:10:\"controller\";a:1:{s:4:\"type\";s:7:\"account\";}s:7:\"country\";s:2:\"AU\";s:16:\"default_currency\";s:3:\"aud\";s:17:\"details_submitted\";b:1;s:5:\"email\";s:21:\"savenest.au@gmail.com\";s:15:\"payouts_enabled\";b:0;s:8:\"settings\";a:9:{s:19:\"bacs_debit_payments\";a:2:{s:12:\"display_name\";N;s:19:\"service_user_number\";N;}s:8:\"branding\";a:4:{s:4:\"icon\";N;s:4:\"logo\";N;s:13:\"primary_color\";N;s:15:\"secondary_color\";N;}s:12:\"card_issuing\";a:1:{s:14:\"tos_acceptance\";a:2:{s:4:\"date\";N;s:2:\"ip\";N;}}s:13:\"card_payments\";a:3:{s:27:\"statement_descriptor_prefix\";N;s:32:\"statement_descriptor_prefix_kana\";N;s:33:\"statement_descriptor_prefix_kanji\";N;}s:9:\"dashboard\";a:2:{s:12:\"display_name\";s:28:\"Pratham Technologies Pty Ltd\";s:8:\"timezone\";s:16:\"Australia/Sydney\";}s:8:\"invoices\";a:2:{s:23:\"default_account_tax_ids\";N;s:26:\"hosted_payment_method_save\";s:5:\"offer\";}s:8:\"payments\";a:3:{s:20:\"statement_descriptor\";s:20:\"PRATHAM TECH DIGITAL\";s:25:\"statement_descriptor_kana\";N;s:26:\"statement_descriptor_kanji\";N;}s:7:\"payouts\";a:3:{s:23:\"debit_negative_balances\";b:1;s:8:\"schedule\";a:2:{s:10:\"delay_days\";i:2;s:8:\"interval\";s:6:\"manual\";}s:20:\"statement_descriptor\";N;}s:19:\"sepa_debit_payments\";a:0:{}}s:4:\"type\";s:8:\"standard\";}s:3:\"ttl\";i:7200;s:7:\"updated\";i:1777080024;}','off'),
(910,'woocommerce_sales_record_date','2026-04-19','auto'),
(911,'woocommerce_sales_record_amount','54.84','auto'),
(926,'wp_calendar_block_has_published_posts','1','auto'),
(929,'_transient_timeout_wc_term_counts','1779278675','off'),
(940,'wc_pending_batch_processes','a:0:{}','off'),
(951,'woocommerce_stripe_klarna_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(953,'woocommerce_stripe_blik_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(954,'woocommerce_stripe_eps_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(955,'woocommerce_stripe_bancontact_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(956,'woocommerce_stripe_link_settings','a:1:{s:7:\"enabled\";s:2:\"no\";}','auto'),
(1008,'ai1wm_secret_key','sMV2NCxojcyj','auto'),
(1021,'ai1wm_updater','a:0:{}','auto'),
(1082,'wpseo_llms_txt_content_hash','','auto'),
(1087,'theme_mods_twentytwentyfour','a:4:{s:19:\"wp_classic_sidebars\";a:3:{s:9:\"sidebar-1\";a:11:{s:4:\"name\";s:12:\"Main Sidebar\";s:2:\"id\";s:9:\"sidebar-1\";s:11:\"description\";s:0:\"\";s:5:\"class\";s:0:\"\";s:13:\"before_widget\";s:37:\"<aside id=\"%1$s\" class=\"widget %2$s\">\";s:12:\"after_widget\";s:8:\"</aside>\";s:12:\"before_title\";s:25:\"<h2 class=\"widget-title\">\";s:11:\"after_title\";s:5:\"</h2>\";s:14:\"before_sidebar\";s:0:\"\";s:13:\"after_sidebar\";s:0:\"\";s:12:\"show_in_rest\";b:0;}s:15:\"footer-widget-1\";a:11:{s:4:\"name\";s:20:\"Footer Bar Section 1\";s:2:\"id\";s:15:\"footer-widget-1\";s:11:\"description\";s:0:\"\";s:5:\"class\";s:0:\"\";s:13:\"before_widget\";s:37:\"<aside id=\"%1$s\" class=\"widget %2$s\">\";s:12:\"after_widget\";s:8:\"</aside>\";s:12:\"before_title\";s:25:\"<h2 class=\"widget-title\">\";s:11:\"after_title\";s:5:\"</h2>\";s:14:\"before_sidebar\";s:0:\"\";s:13:\"after_sidebar\";s:0:\"\";s:12:\"show_in_rest\";b:0;}s:15:\"footer-widget-2\";a:11:{s:4:\"name\";s:20:\"Footer Bar Section 2\";s:2:\"id\";s:15:\"footer-widget-2\";s:11:\"description\";s:0:\"\";s:5:\"class\";s:0:\"\";s:13:\"before_widget\";s:37:\"<aside id=\"%1$s\" class=\"widget %2$s\">\";s:12:\"after_widget\";s:8:\"</aside>\";s:12:\"before_title\";s:25:\"<h2 class=\"widget-title\">\";s:11:\"after_title\";s:5:\"</h2>\";s:14:\"before_sidebar\";s:0:\"\";s:13:\"after_sidebar\";s:0:\"\";s:12:\"show_in_rest\";b:0;}}s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1776916432;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:15:\"footer-widget-1\";a:1:{i:0;s:6:\"text-1\";}s:15:\"footer-widget-2\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}}}s:18:\"custom_css_post_id\";i:-1;}','on'),
(1093,'rss_core_activation_flag','1','off'),
(1094,'rss_core_activation_source_page','index.php','off'),
(1104,'woocommerce_autoinstalled_plugins','a:1:{s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";a:3:{s:7:\"version\";s:5:\"1.0.5\";s:4:\"date\";s:19:\"2026-04-23 13:54:03\";s:8:\"metadata\";a:1:{s:9:\"info_link\";s:119:\"https://developer.woocommerce.com/2023/10/03/the-legacy-rest-api-will-move-to-a-dedicated-extension-in-woocommerce-9-0/\";}}}','off'),
(1105,'woocommerce_history_of_autoinstalled_plugins','a:1:{s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";a:3:{s:7:\"version\";s:5:\"1.0.5\";s:4:\"date\";s:19:\"2026-04-23 13:54:03\";s:8:\"metadata\";a:1:{s:9:\"info_link\";s:119:\"https://developer.woocommerce.com/2023/10/03/the-legacy-rest-api-will-move-to-a-dedicated-extension-in-woocommerce-9-0/\";}}}','off'),
(1116,'widget_akismet_widget','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(1194,'_transient_timeout_as-post-store-dependencies-met','1777113145','off'),
(1203,'_transient_timeout__woocommerce_upload_directory_status','1777113147','off'),
(1205,'_transient_timeout_wc_stripe_redirect_to_settings','1777026777','off'),
(1208,'_transient_timeout_woocommerce_admin_pes_incentive_woopayments_store_has_orders','1777048361','off'),
(1210,'_transient_timeout_woocommerce_admin_pes_incentive_woopayments_cache','1777113161','off'),
(1213,'woocommerce_attribute_lookup_enabled','yes','auto'),
(1223,'action_scheduler_migration_status','complete','auto'),
(1237,'_site_transient_timeout_available_translations','1777037902','off'),
(1253,'_site_transient_timeout_wp_theme_files_patterns-57e89e453a3b4c6c705d298f8951f52b','1777030312','off'),
(1261,'nav_menu_locations','a:2:{s:7:\"primary\";i:21;s:11:\"footer_menu\";i:22;}','yes'),
(1262,'_transient_woocommerce_webhook_ids_status_active','a:0:{}','on'),
(1263,'_transient_ppcp_has_ppec_subscriptions','false','off'),
(1264,'_transient_wc_attribute_taxonomies','a:0:{}','on'),
(1265,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:5:\"6.9.4\";s:5:\"files\";a:584:{i:0;s:31:\"accordion-heading/style-rtl.css\";i:1;s:35:\"accordion-heading/style-rtl.min.css\";i:2;s:27:\"accordion-heading/style.css\";i:3;s:31:\"accordion-heading/style.min.css\";i:4;s:28:\"accordion-item/style-rtl.css\";i:5;s:32:\"accordion-item/style-rtl.min.css\";i:6;s:24:\"accordion-item/style.css\";i:7;s:28:\"accordion-item/style.min.css\";i:8;s:29:\"accordion-panel/style-rtl.css\";i:9;s:33:\"accordion-panel/style-rtl.min.css\";i:10;s:25:\"accordion-panel/style.css\";i:11;s:29:\"accordion-panel/style.min.css\";i:12;s:23:\"accordion/style-rtl.css\";i:13;s:27:\"accordion/style-rtl.min.css\";i:14;s:19:\"accordion/style.css\";i:15;s:23:\"accordion/style.min.css\";i:16;s:23:\"archives/editor-rtl.css\";i:17;s:27:\"archives/editor-rtl.min.css\";i:18;s:19:\"archives/editor.css\";i:19;s:23:\"archives/editor.min.css\";i:20;s:22:\"archives/style-rtl.css\";i:21;s:26:\"archives/style-rtl.min.css\";i:22;s:18:\"archives/style.css\";i:23;s:22:\"archives/style.min.css\";i:24;s:20:\"audio/editor-rtl.css\";i:25;s:24:\"audio/editor-rtl.min.css\";i:26;s:16:\"audio/editor.css\";i:27;s:20:\"audio/editor.min.css\";i:28;s:19:\"audio/style-rtl.css\";i:29;s:23:\"audio/style-rtl.min.css\";i:30;s:15:\"audio/style.css\";i:31;s:19:\"audio/style.min.css\";i:32;s:19:\"audio/theme-rtl.css\";i:33;s:23:\"audio/theme-rtl.min.css\";i:34;s:15:\"audio/theme.css\";i:35;s:19:\"audio/theme.min.css\";i:36;s:21:\"avatar/editor-rtl.css\";i:37;s:25:\"avatar/editor-rtl.min.css\";i:38;s:17:\"avatar/editor.css\";i:39;s:21:\"avatar/editor.min.css\";i:40;s:20:\"avatar/style-rtl.css\";i:41;s:24:\"avatar/style-rtl.min.css\";i:42;s:16:\"avatar/style.css\";i:43;s:20:\"avatar/style.min.css\";i:44;s:21:\"button/editor-rtl.css\";i:45;s:25:\"button/editor-rtl.min.css\";i:46;s:17:\"button/editor.css\";i:47;s:21:\"button/editor.min.css\";i:48;s:20:\"button/style-rtl.css\";i:49;s:24:\"button/style-rtl.min.css\";i:50;s:16:\"button/style.css\";i:51;s:20:\"button/style.min.css\";i:52;s:22:\"buttons/editor-rtl.css\";i:53;s:26:\"buttons/editor-rtl.min.css\";i:54;s:18:\"buttons/editor.css\";i:55;s:22:\"buttons/editor.min.css\";i:56;s:21:\"buttons/style-rtl.css\";i:57;s:25:\"buttons/style-rtl.min.css\";i:58;s:17:\"buttons/style.css\";i:59;s:21:\"buttons/style.min.css\";i:60;s:22:\"calendar/style-rtl.css\";i:61;s:26:\"calendar/style-rtl.min.css\";i:62;s:18:\"calendar/style.css\";i:63;s:22:\"calendar/style.min.css\";i:64;s:25:\"categories/editor-rtl.css\";i:65;s:29:\"categories/editor-rtl.min.css\";i:66;s:21:\"categories/editor.css\";i:67;s:25:\"categories/editor.min.css\";i:68;s:24:\"categories/style-rtl.css\";i:69;s:28:\"categories/style-rtl.min.css\";i:70;s:20:\"categories/style.css\";i:71;s:24:\"categories/style.min.css\";i:72;s:19:\"code/editor-rtl.css\";i:73;s:23:\"code/editor-rtl.min.css\";i:74;s:15:\"code/editor.css\";i:75;s:19:\"code/editor.min.css\";i:76;s:18:\"code/style-rtl.css\";i:77;s:22:\"code/style-rtl.min.css\";i:78;s:14:\"code/style.css\";i:79;s:18:\"code/style.min.css\";i:80;s:18:\"code/theme-rtl.css\";i:81;s:22:\"code/theme-rtl.min.css\";i:82;s:14:\"code/theme.css\";i:83;s:18:\"code/theme.min.css\";i:84;s:22:\"columns/editor-rtl.css\";i:85;s:26:\"columns/editor-rtl.min.css\";i:86;s:18:\"columns/editor.css\";i:87;s:22:\"columns/editor.min.css\";i:88;s:21:\"columns/style-rtl.css\";i:89;s:25:\"columns/style-rtl.min.css\";i:90;s:17:\"columns/style.css\";i:91;s:21:\"columns/style.min.css\";i:92;s:33:\"comment-author-name/style-rtl.css\";i:93;s:37:\"comment-author-name/style-rtl.min.css\";i:94;s:29:\"comment-author-name/style.css\";i:95;s:33:\"comment-author-name/style.min.css\";i:96;s:29:\"comment-content/style-rtl.css\";i:97;s:33:\"comment-content/style-rtl.min.css\";i:98;s:25:\"comment-content/style.css\";i:99;s:29:\"comment-content/style.min.css\";i:100;s:26:\"comment-date/style-rtl.css\";i:101;s:30:\"comment-date/style-rtl.min.css\";i:102;s:22:\"comment-date/style.css\";i:103;s:26:\"comment-date/style.min.css\";i:104;s:31:\"comment-edit-link/style-rtl.css\";i:105;s:35:\"comment-edit-link/style-rtl.min.css\";i:106;s:27:\"comment-edit-link/style.css\";i:107;s:31:\"comment-edit-link/style.min.css\";i:108;s:32:\"comment-reply-link/style-rtl.css\";i:109;s:36:\"comment-reply-link/style-rtl.min.css\";i:110;s:28:\"comment-reply-link/style.css\";i:111;s:32:\"comment-reply-link/style.min.css\";i:112;s:30:\"comment-template/style-rtl.css\";i:113;s:34:\"comment-template/style-rtl.min.css\";i:114;s:26:\"comment-template/style.css\";i:115;s:30:\"comment-template/style.min.css\";i:116;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:117;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:118;s:38:\"comments-pagination-numbers/editor.css\";i:119;s:42:\"comments-pagination-numbers/editor.min.css\";i:120;s:34:\"comments-pagination/editor-rtl.css\";i:121;s:38:\"comments-pagination/editor-rtl.min.css\";i:122;s:30:\"comments-pagination/editor.css\";i:123;s:34:\"comments-pagination/editor.min.css\";i:124;s:33:\"comments-pagination/style-rtl.css\";i:125;s:37:\"comments-pagination/style-rtl.min.css\";i:126;s:29:\"comments-pagination/style.css\";i:127;s:33:\"comments-pagination/style.min.css\";i:128;s:29:\"comments-title/editor-rtl.css\";i:129;s:33:\"comments-title/editor-rtl.min.css\";i:130;s:25:\"comments-title/editor.css\";i:131;s:29:\"comments-title/editor.min.css\";i:132;s:23:\"comments/editor-rtl.css\";i:133;s:27:\"comments/editor-rtl.min.css\";i:134;s:19:\"comments/editor.css\";i:135;s:23:\"comments/editor.min.css\";i:136;s:22:\"comments/style-rtl.css\";i:137;s:26:\"comments/style-rtl.min.css\";i:138;s:18:\"comments/style.css\";i:139;s:22:\"comments/style.min.css\";i:140;s:20:\"cover/editor-rtl.css\";i:141;s:24:\"cover/editor-rtl.min.css\";i:142;s:16:\"cover/editor.css\";i:143;s:20:\"cover/editor.min.css\";i:144;s:19:\"cover/style-rtl.css\";i:145;s:23:\"cover/style-rtl.min.css\";i:146;s:15:\"cover/style.css\";i:147;s:19:\"cover/style.min.css\";i:148;s:22:\"details/editor-rtl.css\";i:149;s:26:\"details/editor-rtl.min.css\";i:150;s:18:\"details/editor.css\";i:151;s:22:\"details/editor.min.css\";i:152;s:21:\"details/style-rtl.css\";i:153;s:25:\"details/style-rtl.min.css\";i:154;s:17:\"details/style.css\";i:155;s:21:\"details/style.min.css\";i:156;s:20:\"embed/editor-rtl.css\";i:157;s:24:\"embed/editor-rtl.min.css\";i:158;s:16:\"embed/editor.css\";i:159;s:20:\"embed/editor.min.css\";i:160;s:19:\"embed/style-rtl.css\";i:161;s:23:\"embed/style-rtl.min.css\";i:162;s:15:\"embed/style.css\";i:163;s:19:\"embed/style.min.css\";i:164;s:19:\"embed/theme-rtl.css\";i:165;s:23:\"embed/theme-rtl.min.css\";i:166;s:15:\"embed/theme.css\";i:167;s:19:\"embed/theme.min.css\";i:168;s:19:\"file/editor-rtl.css\";i:169;s:23:\"file/editor-rtl.min.css\";i:170;s:15:\"file/editor.css\";i:171;s:19:\"file/editor.min.css\";i:172;s:18:\"file/style-rtl.css\";i:173;s:22:\"file/style-rtl.min.css\";i:174;s:14:\"file/style.css\";i:175;s:18:\"file/style.min.css\";i:176;s:23:\"footnotes/style-rtl.css\";i:177;s:27:\"footnotes/style-rtl.min.css\";i:178;s:19:\"footnotes/style.css\";i:179;s:23:\"footnotes/style.min.css\";i:180;s:23:\"freeform/editor-rtl.css\";i:181;s:27:\"freeform/editor-rtl.min.css\";i:182;s:19:\"freeform/editor.css\";i:183;s:23:\"freeform/editor.min.css\";i:184;s:22:\"gallery/editor-rtl.css\";i:185;s:26:\"gallery/editor-rtl.min.css\";i:186;s:18:\"gallery/editor.css\";i:187;s:22:\"gallery/editor.min.css\";i:188;s:21:\"gallery/style-rtl.css\";i:189;s:25:\"gallery/style-rtl.min.css\";i:190;s:17:\"gallery/style.css\";i:191;s:21:\"gallery/style.min.css\";i:192;s:21:\"gallery/theme-rtl.css\";i:193;s:25:\"gallery/theme-rtl.min.css\";i:194;s:17:\"gallery/theme.css\";i:195;s:21:\"gallery/theme.min.css\";i:196;s:20:\"group/editor-rtl.css\";i:197;s:24:\"group/editor-rtl.min.css\";i:198;s:16:\"group/editor.css\";i:199;s:20:\"group/editor.min.css\";i:200;s:19:\"group/style-rtl.css\";i:201;s:23:\"group/style-rtl.min.css\";i:202;s:15:\"group/style.css\";i:203;s:19:\"group/style.min.css\";i:204;s:19:\"group/theme-rtl.css\";i:205;s:23:\"group/theme-rtl.min.css\";i:206;s:15:\"group/theme.css\";i:207;s:19:\"group/theme.min.css\";i:208;s:21:\"heading/style-rtl.css\";i:209;s:25:\"heading/style-rtl.min.css\";i:210;s:17:\"heading/style.css\";i:211;s:21:\"heading/style.min.css\";i:212;s:19:\"html/editor-rtl.css\";i:213;s:23:\"html/editor-rtl.min.css\";i:214;s:15:\"html/editor.css\";i:215;s:19:\"html/editor.min.css\";i:216;s:20:\"image/editor-rtl.css\";i:217;s:24:\"image/editor-rtl.min.css\";i:218;s:16:\"image/editor.css\";i:219;s:20:\"image/editor.min.css\";i:220;s:19:\"image/style-rtl.css\";i:221;s:23:\"image/style-rtl.min.css\";i:222;s:15:\"image/style.css\";i:223;s:19:\"image/style.min.css\";i:224;s:19:\"image/theme-rtl.css\";i:225;s:23:\"image/theme-rtl.min.css\";i:226;s:15:\"image/theme.css\";i:227;s:19:\"image/theme.min.css\";i:228;s:29:\"latest-comments/style-rtl.css\";i:229;s:33:\"latest-comments/style-rtl.min.css\";i:230;s:25:\"latest-comments/style.css\";i:231;s:29:\"latest-comments/style.min.css\";i:232;s:27:\"latest-posts/editor-rtl.css\";i:233;s:31:\"latest-posts/editor-rtl.min.css\";i:234;s:23:\"latest-posts/editor.css\";i:235;s:27:\"latest-posts/editor.min.css\";i:236;s:26:\"latest-posts/style-rtl.css\";i:237;s:30:\"latest-posts/style-rtl.min.css\";i:238;s:22:\"latest-posts/style.css\";i:239;s:26:\"latest-posts/style.min.css\";i:240;s:18:\"list/style-rtl.css\";i:241;s:22:\"list/style-rtl.min.css\";i:242;s:14:\"list/style.css\";i:243;s:18:\"list/style.min.css\";i:244;s:22:\"loginout/style-rtl.css\";i:245;s:26:\"loginout/style-rtl.min.css\";i:246;s:18:\"loginout/style.css\";i:247;s:22:\"loginout/style.min.css\";i:248;s:19:\"math/editor-rtl.css\";i:249;s:23:\"math/editor-rtl.min.css\";i:250;s:15:\"math/editor.css\";i:251;s:19:\"math/editor.min.css\";i:252;s:18:\"math/style-rtl.css\";i:253;s:22:\"math/style-rtl.min.css\";i:254;s:14:\"math/style.css\";i:255;s:18:\"math/style.min.css\";i:256;s:25:\"media-text/editor-rtl.css\";i:257;s:29:\"media-text/editor-rtl.min.css\";i:258;s:21:\"media-text/editor.css\";i:259;s:25:\"media-text/editor.min.css\";i:260;s:24:\"media-text/style-rtl.css\";i:261;s:28:\"media-text/style-rtl.min.css\";i:262;s:20:\"media-text/style.css\";i:263;s:24:\"media-text/style.min.css\";i:264;s:19:\"more/editor-rtl.css\";i:265;s:23:\"more/editor-rtl.min.css\";i:266;s:15:\"more/editor.css\";i:267;s:19:\"more/editor.min.css\";i:268;s:30:\"navigation-link/editor-rtl.css\";i:269;s:34:\"navigation-link/editor-rtl.min.css\";i:270;s:26:\"navigation-link/editor.css\";i:271;s:30:\"navigation-link/editor.min.css\";i:272;s:29:\"navigation-link/style-rtl.css\";i:273;s:33:\"navigation-link/style-rtl.min.css\";i:274;s:25:\"navigation-link/style.css\";i:275;s:29:\"navigation-link/style.min.css\";i:276;s:33:\"navigation-submenu/editor-rtl.css\";i:277;s:37:\"navigation-submenu/editor-rtl.min.css\";i:278;s:29:\"navigation-submenu/editor.css\";i:279;s:33:\"navigation-submenu/editor.min.css\";i:280;s:25:\"navigation/editor-rtl.css\";i:281;s:29:\"navigation/editor-rtl.min.css\";i:282;s:21:\"navigation/editor.css\";i:283;s:25:\"navigation/editor.min.css\";i:284;s:24:\"navigation/style-rtl.css\";i:285;s:28:\"navigation/style-rtl.min.css\";i:286;s:20:\"navigation/style.css\";i:287;s:24:\"navigation/style.min.css\";i:288;s:23:\"nextpage/editor-rtl.css\";i:289;s:27:\"nextpage/editor-rtl.min.css\";i:290;s:19:\"nextpage/editor.css\";i:291;s:23:\"nextpage/editor.min.css\";i:292;s:24:\"page-list/editor-rtl.css\";i:293;s:28:\"page-list/editor-rtl.min.css\";i:294;s:20:\"page-list/editor.css\";i:295;s:24:\"page-list/editor.min.css\";i:296;s:23:\"page-list/style-rtl.css\";i:297;s:27:\"page-list/style-rtl.min.css\";i:298;s:19:\"page-list/style.css\";i:299;s:23:\"page-list/style.min.css\";i:300;s:24:\"paragraph/editor-rtl.css\";i:301;s:28:\"paragraph/editor-rtl.min.css\";i:302;s:20:\"paragraph/editor.css\";i:303;s:24:\"paragraph/editor.min.css\";i:304;s:23:\"paragraph/style-rtl.css\";i:305;s:27:\"paragraph/style-rtl.min.css\";i:306;s:19:\"paragraph/style.css\";i:307;s:23:\"paragraph/style.min.css\";i:308;s:35:\"post-author-biography/style-rtl.css\";i:309;s:39:\"post-author-biography/style-rtl.min.css\";i:310;s:31:\"post-author-biography/style.css\";i:311;s:35:\"post-author-biography/style.min.css\";i:312;s:30:\"post-author-name/style-rtl.css\";i:313;s:34:\"post-author-name/style-rtl.min.css\";i:314;s:26:\"post-author-name/style.css\";i:315;s:30:\"post-author-name/style.min.css\";i:316;s:25:\"post-author/style-rtl.css\";i:317;s:29:\"post-author/style-rtl.min.css\";i:318;s:21:\"post-author/style.css\";i:319;s:25:\"post-author/style.min.css\";i:320;s:33:\"post-comments-count/style-rtl.css\";i:321;s:37:\"post-comments-count/style-rtl.min.css\";i:322;s:29:\"post-comments-count/style.css\";i:323;s:33:\"post-comments-count/style.min.css\";i:324;s:33:\"post-comments-form/editor-rtl.css\";i:325;s:37:\"post-comments-form/editor-rtl.min.css\";i:326;s:29:\"post-comments-form/editor.css\";i:327;s:33:\"post-comments-form/editor.min.css\";i:328;s:32:\"post-comments-form/style-rtl.css\";i:329;s:36:\"post-comments-form/style-rtl.min.css\";i:330;s:28:\"post-comments-form/style.css\";i:331;s:32:\"post-comments-form/style.min.css\";i:332;s:32:\"post-comments-link/style-rtl.css\";i:333;s:36:\"post-comments-link/style-rtl.min.css\";i:334;s:28:\"post-comments-link/style.css\";i:335;s:32:\"post-comments-link/style.min.css\";i:336;s:26:\"post-content/style-rtl.css\";i:337;s:30:\"post-content/style-rtl.min.css\";i:338;s:22:\"post-content/style.css\";i:339;s:26:\"post-content/style.min.css\";i:340;s:23:\"post-date/style-rtl.css\";i:341;s:27:\"post-date/style-rtl.min.css\";i:342;s:19:\"post-date/style.css\";i:343;s:23:\"post-date/style.min.css\";i:344;s:27:\"post-excerpt/editor-rtl.css\";i:345;s:31:\"post-excerpt/editor-rtl.min.css\";i:346;s:23:\"post-excerpt/editor.css\";i:347;s:27:\"post-excerpt/editor.min.css\";i:348;s:26:\"post-excerpt/style-rtl.css\";i:349;s:30:\"post-excerpt/style-rtl.min.css\";i:350;s:22:\"post-excerpt/style.css\";i:351;s:26:\"post-excerpt/style.min.css\";i:352;s:34:\"post-featured-image/editor-rtl.css\";i:353;s:38:\"post-featured-image/editor-rtl.min.css\";i:354;s:30:\"post-featured-image/editor.css\";i:355;s:34:\"post-featured-image/editor.min.css\";i:356;s:33:\"post-featured-image/style-rtl.css\";i:357;s:37:\"post-featured-image/style-rtl.min.css\";i:358;s:29:\"post-featured-image/style.css\";i:359;s:33:\"post-featured-image/style.min.css\";i:360;s:34:\"post-navigation-link/style-rtl.css\";i:361;s:38:\"post-navigation-link/style-rtl.min.css\";i:362;s:30:\"post-navigation-link/style.css\";i:363;s:34:\"post-navigation-link/style.min.css\";i:364;s:27:\"post-template/style-rtl.css\";i:365;s:31:\"post-template/style-rtl.min.css\";i:366;s:23:\"post-template/style.css\";i:367;s:27:\"post-template/style.min.css\";i:368;s:24:\"post-terms/style-rtl.css\";i:369;s:28:\"post-terms/style-rtl.min.css\";i:370;s:20:\"post-terms/style.css\";i:371;s:24:\"post-terms/style.min.css\";i:372;s:31:\"post-time-to-read/style-rtl.css\";i:373;s:35:\"post-time-to-read/style-rtl.min.css\";i:374;s:27:\"post-time-to-read/style.css\";i:375;s:31:\"post-time-to-read/style.min.css\";i:376;s:24:\"post-title/style-rtl.css\";i:377;s:28:\"post-title/style-rtl.min.css\";i:378;s:20:\"post-title/style.css\";i:379;s:24:\"post-title/style.min.css\";i:380;s:26:\"preformatted/style-rtl.css\";i:381;s:30:\"preformatted/style-rtl.min.css\";i:382;s:22:\"preformatted/style.css\";i:383;s:26:\"preformatted/style.min.css\";i:384;s:24:\"pullquote/editor-rtl.css\";i:385;s:28:\"pullquote/editor-rtl.min.css\";i:386;s:20:\"pullquote/editor.css\";i:387;s:24:\"pullquote/editor.min.css\";i:388;s:23:\"pullquote/style-rtl.css\";i:389;s:27:\"pullquote/style-rtl.min.css\";i:390;s:19:\"pullquote/style.css\";i:391;s:23:\"pullquote/style.min.css\";i:392;s:23:\"pullquote/theme-rtl.css\";i:393;s:27:\"pullquote/theme-rtl.min.css\";i:394;s:19:\"pullquote/theme.css\";i:395;s:23:\"pullquote/theme.min.css\";i:396;s:39:\"query-pagination-numbers/editor-rtl.css\";i:397;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:398;s:35:\"query-pagination-numbers/editor.css\";i:399;s:39:\"query-pagination-numbers/editor.min.css\";i:400;s:31:\"query-pagination/editor-rtl.css\";i:401;s:35:\"query-pagination/editor-rtl.min.css\";i:402;s:27:\"query-pagination/editor.css\";i:403;s:31:\"query-pagination/editor.min.css\";i:404;s:30:\"query-pagination/style-rtl.css\";i:405;s:34:\"query-pagination/style-rtl.min.css\";i:406;s:26:\"query-pagination/style.css\";i:407;s:30:\"query-pagination/style.min.css\";i:408;s:25:\"query-title/style-rtl.css\";i:409;s:29:\"query-title/style-rtl.min.css\";i:410;s:21:\"query-title/style.css\";i:411;s:25:\"query-title/style.min.css\";i:412;s:25:\"query-total/style-rtl.css\";i:413;s:29:\"query-total/style-rtl.min.css\";i:414;s:21:\"query-total/style.css\";i:415;s:25:\"query-total/style.min.css\";i:416;s:20:\"query/editor-rtl.css\";i:417;s:24:\"query/editor-rtl.min.css\";i:418;s:16:\"query/editor.css\";i:419;s:20:\"query/editor.min.css\";i:420;s:19:\"quote/style-rtl.css\";i:421;s:23:\"quote/style-rtl.min.css\";i:422;s:15:\"quote/style.css\";i:423;s:19:\"quote/style.min.css\";i:424;s:19:\"quote/theme-rtl.css\";i:425;s:23:\"quote/theme-rtl.min.css\";i:426;s:15:\"quote/theme.css\";i:427;s:19:\"quote/theme.min.css\";i:428;s:23:\"read-more/style-rtl.css\";i:429;s:27:\"read-more/style-rtl.min.css\";i:430;s:19:\"read-more/style.css\";i:431;s:23:\"read-more/style.min.css\";i:432;s:18:\"rss/editor-rtl.css\";i:433;s:22:\"rss/editor-rtl.min.css\";i:434;s:14:\"rss/editor.css\";i:435;s:18:\"rss/editor.min.css\";i:436;s:17:\"rss/style-rtl.css\";i:437;s:21:\"rss/style-rtl.min.css\";i:438;s:13:\"rss/style.css\";i:439;s:17:\"rss/style.min.css\";i:440;s:21:\"search/editor-rtl.css\";i:441;s:25:\"search/editor-rtl.min.css\";i:442;s:17:\"search/editor.css\";i:443;s:21:\"search/editor.min.css\";i:444;s:20:\"search/style-rtl.css\";i:445;s:24:\"search/style-rtl.min.css\";i:446;s:16:\"search/style.css\";i:447;s:20:\"search/style.min.css\";i:448;s:20:\"search/theme-rtl.css\";i:449;s:24:\"search/theme-rtl.min.css\";i:450;s:16:\"search/theme.css\";i:451;s:20:\"search/theme.min.css\";i:452;s:24:\"separator/editor-rtl.css\";i:453;s:28:\"separator/editor-rtl.min.css\";i:454;s:20:\"separator/editor.css\";i:455;s:24:\"separator/editor.min.css\";i:456;s:23:\"separator/style-rtl.css\";i:457;s:27:\"separator/style-rtl.min.css\";i:458;s:19:\"separator/style.css\";i:459;s:23:\"separator/style.min.css\";i:460;s:23:\"separator/theme-rtl.css\";i:461;s:27:\"separator/theme-rtl.min.css\";i:462;s:19:\"separator/theme.css\";i:463;s:23:\"separator/theme.min.css\";i:464;s:24:\"shortcode/editor-rtl.css\";i:465;s:28:\"shortcode/editor-rtl.min.css\";i:466;s:20:\"shortcode/editor.css\";i:467;s:24:\"shortcode/editor.min.css\";i:468;s:24:\"site-logo/editor-rtl.css\";i:469;s:28:\"site-logo/editor-rtl.min.css\";i:470;s:20:\"site-logo/editor.css\";i:471;s:24:\"site-logo/editor.min.css\";i:472;s:23:\"site-logo/style-rtl.css\";i:473;s:27:\"site-logo/style-rtl.min.css\";i:474;s:19:\"site-logo/style.css\";i:475;s:23:\"site-logo/style.min.css\";i:476;s:27:\"site-tagline/editor-rtl.css\";i:477;s:31:\"site-tagline/editor-rtl.min.css\";i:478;s:23:\"site-tagline/editor.css\";i:479;s:27:\"site-tagline/editor.min.css\";i:480;s:26:\"site-tagline/style-rtl.css\";i:481;s:30:\"site-tagline/style-rtl.min.css\";i:482;s:22:\"site-tagline/style.css\";i:483;s:26:\"site-tagline/style.min.css\";i:484;s:25:\"site-title/editor-rtl.css\";i:485;s:29:\"site-title/editor-rtl.min.css\";i:486;s:21:\"site-title/editor.css\";i:487;s:25:\"site-title/editor.min.css\";i:488;s:24:\"site-title/style-rtl.css\";i:489;s:28:\"site-title/style-rtl.min.css\";i:490;s:20:\"site-title/style.css\";i:491;s:24:\"site-title/style.min.css\";i:492;s:26:\"social-link/editor-rtl.css\";i:493;s:30:\"social-link/editor-rtl.min.css\";i:494;s:22:\"social-link/editor.css\";i:495;s:26:\"social-link/editor.min.css\";i:496;s:27:\"social-links/editor-rtl.css\";i:497;s:31:\"social-links/editor-rtl.min.css\";i:498;s:23:\"social-links/editor.css\";i:499;s:27:\"social-links/editor.min.css\";i:500;s:26:\"social-links/style-rtl.css\";i:501;s:30:\"social-links/style-rtl.min.css\";i:502;s:22:\"social-links/style.css\";i:503;s:26:\"social-links/style.min.css\";i:504;s:21:\"spacer/editor-rtl.css\";i:505;s:25:\"spacer/editor-rtl.min.css\";i:506;s:17:\"spacer/editor.css\";i:507;s:21:\"spacer/editor.min.css\";i:508;s:20:\"spacer/style-rtl.css\";i:509;s:24:\"spacer/style-rtl.min.css\";i:510;s:16:\"spacer/style.css\";i:511;s:20:\"spacer/style.min.css\";i:512;s:20:\"table/editor-rtl.css\";i:513;s:24:\"table/editor-rtl.min.css\";i:514;s:16:\"table/editor.css\";i:515;s:20:\"table/editor.min.css\";i:516;s:19:\"table/style-rtl.css\";i:517;s:23:\"table/style-rtl.min.css\";i:518;s:15:\"table/style.css\";i:519;s:19:\"table/style.min.css\";i:520;s:19:\"table/theme-rtl.css\";i:521;s:23:\"table/theme-rtl.min.css\";i:522;s:15:\"table/theme.css\";i:523;s:19:\"table/theme.min.css\";i:524;s:24:\"tag-cloud/editor-rtl.css\";i:525;s:28:\"tag-cloud/editor-rtl.min.css\";i:526;s:20:\"tag-cloud/editor.css\";i:527;s:24:\"tag-cloud/editor.min.css\";i:528;s:23:\"tag-cloud/style-rtl.css\";i:529;s:27:\"tag-cloud/style-rtl.min.css\";i:530;s:19:\"tag-cloud/style.css\";i:531;s:23:\"tag-cloud/style.min.css\";i:532;s:28:\"template-part/editor-rtl.css\";i:533;s:32:\"template-part/editor-rtl.min.css\";i:534;s:24:\"template-part/editor.css\";i:535;s:28:\"template-part/editor.min.css\";i:536;s:27:\"template-part/theme-rtl.css\";i:537;s:31:\"template-part/theme-rtl.min.css\";i:538;s:23:\"template-part/theme.css\";i:539;s:27:\"template-part/theme.min.css\";i:540;s:24:\"term-count/style-rtl.css\";i:541;s:28:\"term-count/style-rtl.min.css\";i:542;s:20:\"term-count/style.css\";i:543;s:24:\"term-count/style.min.css\";i:544;s:30:\"term-description/style-rtl.css\";i:545;s:34:\"term-description/style-rtl.min.css\";i:546;s:26:\"term-description/style.css\";i:547;s:30:\"term-description/style.min.css\";i:548;s:23:\"term-name/style-rtl.css\";i:549;s:27:\"term-name/style-rtl.min.css\";i:550;s:19:\"term-name/style.css\";i:551;s:23:\"term-name/style.min.css\";i:552;s:28:\"term-template/editor-rtl.css\";i:553;s:32:\"term-template/editor-rtl.min.css\";i:554;s:24:\"term-template/editor.css\";i:555;s:28:\"term-template/editor.min.css\";i:556;s:27:\"term-template/style-rtl.css\";i:557;s:31:\"term-template/style-rtl.min.css\";i:558;s:23:\"term-template/style.css\";i:559;s:27:\"term-template/style.min.css\";i:560;s:27:\"text-columns/editor-rtl.css\";i:561;s:31:\"text-columns/editor-rtl.min.css\";i:562;s:23:\"text-columns/editor.css\";i:563;s:27:\"text-columns/editor.min.css\";i:564;s:26:\"text-columns/style-rtl.css\";i:565;s:30:\"text-columns/style-rtl.min.css\";i:566;s:22:\"text-columns/style.css\";i:567;s:26:\"text-columns/style.min.css\";i:568;s:19:\"verse/style-rtl.css\";i:569;s:23:\"verse/style-rtl.min.css\";i:570;s:15:\"verse/style.css\";i:571;s:19:\"verse/style.min.css\";i:572;s:20:\"video/editor-rtl.css\";i:573;s:24:\"video/editor-rtl.min.css\";i:574;s:16:\"video/editor.css\";i:575;s:20:\"video/editor.min.css\";i:576;s:19:\"video/style-rtl.css\";i:577;s:23:\"video/style-rtl.min.css\";i:578;s:15:\"video/style.css\";i:579;s:19:\"video/style.min.css\";i:580;s:19:\"video/theme-rtl.css\";i:581;s:23:\"video/theme-rtl.min.css\";i:582;s:15:\"video/theme.css\";i:583;s:19:\"video/theme.min.css\";}}','on'),
(1268,'_site_transient_woocommerce_blocks_patterns','a:2:{s:7:\"version\";s:6:\"10.7.0\";s:8:\"patterns\";a:41:{i:0;a:11:{s:5:\"title\";s:6:\"Banner\";s:4:\"slug\";s:25:\"woocommerce-blocks/banner\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:10:\"banner.php\";}i:1;a:11:{s:5:\"title\";s:23:\"Coming Soon Entire Site\";s:4:\"slug\";s:35:\"woocommerce/coming-soon-entire-site\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"coming-soon-entire-site.php\";}i:2;a:11:{s:5:\"title\";s:22:\"Coming Soon Store Only\";s:4:\"slug\";s:34:\"woocommerce/coming-soon-store-only\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"coming-soon-store-only.php\";}i:3;a:11:{s:5:\"title\";s:11:\"Coming Soon\";s:4:\"slug\";s:23:\"woocommerce/coming-soon\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:15:\"coming-soon.php\";}i:4;a:11:{s:5:\"title\";s:29:\"Content Right with Image Left\";s:4:\"slug\";s:48:\"woocommerce-blocks/content-right-with-image-left\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, About\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:28:\"content-right-image-left.php\";}i:5;a:11:{s:5:\"title\";s:29:\"Featured Category Cover Image\";s:4:\"slug\";s:48:\"woocommerce-blocks/featured-category-cover-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:33:\"featured-category-cover-image.php\";}i:6;a:11:{s:5:\"title\";s:24:\"Featured Category Triple\";s:4:\"slug\";s:43:\"woocommerce-blocks/featured-category-triple\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:28:\"featured-category-triple.php\";}i:7;a:11:{s:5:\"title\";s:12:\"Large Footer\";s:4:\"slug\";s:31:\"woocommerce-blocks/footer-large\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:16:\"footer-large.php\";}i:8;a:11:{s:5:\"title\";s:23:\"Footer with Simple Menu\";s:4:\"slug\";s:37:\"woocommerce-blocks/footer-simple-menu\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:22:\"footer-simple-menu.php\";}i:9;a:11:{s:5:\"title\";s:19:\"Footer with 3 Menus\";s:4:\"slug\";s:38:\"woocommerce-blocks/footer-with-3-menus\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"footer-with-3-menus.php\";}i:10;a:11:{s:5:\"title\";s:28:\"Four Image Grid Content Left\";s:4:\"slug\";s:47:\"woocommerce-blocks/four-image-grid-content-left\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, About\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"four-image-grid-content-left.php\";}i:11;a:11:{s:5:\"title\";s:20:\"Centered Header Menu\";s:4:\"slug\";s:39:\"woocommerce-blocks/header-centered-menu\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"header-centered-pattern.php\";}i:12;a:11:{s:5:\"title\";s:23:\"Distraction Free Header\";s:4:\"slug\";s:42:\"woocommerce-blocks/header-distraction-free\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"header-distraction-free.php\";}i:13;a:11:{s:5:\"title\";s:16:\"Essential Header\";s:4:\"slug\";s:35:\"woocommerce-blocks/header-essential\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:20:\"header-essential.php\";}i:14;a:11:{s:5:\"title\";s:12:\"Large Header\";s:4:\"slug\";s:31:\"woocommerce-blocks/header-large\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:16:\"header-large.php\";}i:15;a:11:{s:5:\"title\";s:14:\"Minimal Header\";s:4:\"slug\";s:33:\"woocommerce-blocks/header-minimal\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:18:\"header-minimal.php\";}i:16;a:11:{s:5:\"title\";s:46:\"Heading with Three Columns of Content and Link\";s:4:\"slug\";s:66:\"woocommerce-blocks/heading-with-three-columns-of-content-with-link\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:21:\"WooCommerce, Services\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:51:\"heading-with-three-columns-of-content-with-link.php\";}i:17;a:11:{s:5:\"title\";s:20:\"Hero Product 3 Split\";s:4:\"slug\";s:39:\"woocommerce-blocks/hero-product-3-split\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:24:\"hero-product-3-split.php\";}i:18;a:11:{s:5:\"title\";s:23:\"Hero Product Chessboard\";s:4:\"slug\";s:42:\"woocommerce-blocks/hero-product-chessboard\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"hero-product-chessboard.php\";}i:19;a:11:{s:5:\"title\";s:18:\"Hero Product Split\";s:4:\"slug\";s:37:\"woocommerce-blocks/hero-product-split\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:22:\"hero-product-split.php\";}i:20;a:11:{s:5:\"title\";s:33:\"Centered Content with Image Below\";s:4:\"slug\";s:52:\"woocommerce-blocks/centered-content-with-image-below\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:43:\"intro-centered-content-with-image-below.php\";}i:21;a:11:{s:5:\"title\";s:22:\"Just Arrived Full Hero\";s:4:\"slug\";s:41:\"woocommerce-blocks/just-arrived-full-hero\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"just-arrived-full-hero.php\";}i:22;a:11:{s:5:\"title\";s:33:\"No Products Found - Clear Filters\";s:4:\"slug\";s:43:\"woocommerce/no-products-found-clear-filters\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:29:\"no-products-found-filters.php\";}i:23;a:11:{s:5:\"title\";s:17:\"No Products Found\";s:4:\"slug\";s:29:\"woocommerce/no-products-found\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:21:\"no-products-found.php\";}i:24;a:11:{s:5:\"title\";s:19:\"Default Coming Soon\";s:4:\"slug\";s:36:\"woocommerce/page-coming-soon-default\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:28:\"page-coming-soon-default.php\";}i:25;a:11:{s:5:\"title\";s:25:\"Coming Soon Image Gallery\";s:4:\"slug\";s:42:\"woocommerce/page-coming-soon-image-gallery\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:34:\"page-coming-soon-image-gallery.php\";}i:26;a:11:{s:5:\"title\";s:30:\"Coming Soon Minimal Left Image\";s:4:\"slug\";s:47:\"woocommerce/page-coming-soon-minimal-left-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:39:\"page-coming-soon-minimal-left-image.php\";}i:27;a:11:{s:5:\"title\";s:24:\"Coming Soon Modern Black\";s:4:\"slug\";s:41:\"woocommerce/page-coming-soon-modern-black\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:33:\"page-coming-soon-modern-black.php\";}i:28;a:11:{s:5:\"title\";s:29:\"Coming Soon Split Right Image\";s:4:\"slug\";s:46:\"woocommerce/page-coming-soon-split-right-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:38:\"page-coming-soon-split-right-image.php\";}i:29;a:11:{s:5:\"title\";s:34:\"Coming Soon with Header and Footer\";s:4:\"slug\";s:47:\"woocommerce/page-coming-soon-with-header-footer\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:39:\"page-coming-soon-with-header-footer.php\";}i:30;a:11:{s:5:\"title\";s:28:\"Product Collection 3 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-3-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-3-columns.php\";}i:31;a:11:{s:5:\"title\";s:28:\"Product Collection 4 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-4-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-4-columns.php\";}i:32;a:11:{s:5:\"title\";s:28:\"Product Collection 5 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-5-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-5-columns.php\";}i:33;a:11:{s:5:\"title\";s:47:\"Product Collection: Featured Products 5 Columns\";s:4:\"slug\";s:65:\"woocommerce-blocks/product-collection-featured-products-5-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:50:\"product-collection-featured-products-5-columns.php\";}i:34;a:11:{s:5:\"title\";s:15:\"Product Gallery\";s:4:\"slug\";s:48:\"woocommerce-blocks/product-query-product-gallery\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:36:\"core/query/woocommerce/product-query\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:33:\"product-query-product-gallery.php\";}i:35;a:11:{s:5:\"title\";s:14:\"Product Search\";s:4:\"slug\";s:31:\"woocommerce/product-search-form\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"product-search-form.php\";}i:36;a:11:{s:5:\"title\";s:16:\"Related Products\";s:4:\"slug\";s:35:\"woocommerce-blocks/related-products\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:20:\"related-products.php\";}i:37;a:11:{s:5:\"title\";s:33:\"Social: Follow Us on Social Media\";s:4:\"slug\";s:51:\"woocommerce-blocks/social-follow-us-in-social-media\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:25:\"WooCommerce, social-media\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:36:\"social-follow-us-in-social-media.php\";}i:38;a:11:{s:5:\"title\";s:22:\"Testimonials 3 Columns\";s:4:\"slug\";s:41:\"woocommerce-blocks/testimonials-3-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:20:\"WooCommerce, Reviews\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"testimonials-3-columns.php\";}i:39;a:11:{s:5:\"title\";s:18:\"Testimonial Single\";s:4:\"slug\";s:38:\"woocommerce-blocks/testimonials-single\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:20:\"WooCommerce, Reviews\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"testimonials-single.php\";}i:40;a:11:{s:5:\"title\";s:37:\"Three Columns with Images and Content\";s:4:\"slug\";s:56:\"woocommerce-blocks/three-columns-with-images-and-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:21:\"WooCommerce, Services\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:41:\"three-columns-with-images-and-content.php\";}}}','off'),
(1269,'_transient_jetpack_autoloader_plugin_paths','a:1:{i:0;s:29:\"{{WP_PLUGIN_DIR}}/woocommerce\";}','on'),
(1270,'_transient_woocommerce_blocks_asset_api_script_data','{\"script_data\":{\"assets\\/client\\/blocks\\/wc-settings.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-settings.js\",\"version\":\"a6cb3c938fd270888ce4\",\"dependencies\":[\"wc-types\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-types.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-types.js\",\"version\":\"f0cc692c0367e0930c80\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-entities.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-entities.js\",\"version\":\"cdb01de69fb7dbbbb30f\",\"dependencies\":[\"wc-settings\",\"wp-core-data\",\"wp-data\",\"wp-i18n\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-middleware.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-middleware.js\",\"version\":\"d79dedade2f2e4dc9df4\",\"dependencies\":[\"wp-api-fetch\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-data.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-data.js\",\"version\":\"ffb2849a705ee55d810e\",\"dependencies\":[\"wc-blocks-checkout-events\",\"wc-blocks-registry\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-data\",\"wp-data-controls\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-vendors.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-vendors.js\",\"version\":\"9b3f9ad7437063887d6c\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-registry.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-registry.js\",\"version\":\"6436a923b42f4d1b1f6d\",\"dependencies\":[\"react-jsx-runtime\",\"wc-settings\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks.js\",\"version\":\"0db759a8a6e010732c50\",\"dependencies\":[\"react-jsx-runtime\",\"wp-blocks\",\"wp-compose\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-context.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-context.js\",\"version\":\"621353d8a3a7c8d44b41\",\"dependencies\":[\"react-jsx-runtime\",\"wp-element\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\",\"version\":\"c18bbb2325f333897e6b\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-blocks-shared-context\",\"wc-types\",\"wp-data\",\"wp-element\",\"wp-is-shallow-equal\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/price-format.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/price-format.js\",\"version\":\"0df720e448f7ab3c5d0d\",\"dependencies\":[\"wc-settings\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\",\"version\":\"00b931bcc27024fa60ca\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\",\"version\":\"04a71982bb4ef85763c1\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\",\"version\":\"f669b3c33346e637602f\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-checkout.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout.js\",\"version\":\"da57c8c98d31b28d806e\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\",\"wp-warning\"]},\"assets\\/client\\/blocks\\/blocks-checkout-events.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout-events.js\",\"version\":\"2d0fd4590f6cc663947c\",\"dependencies\":[\"wc-types\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-components.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-components.js\",\"version\":\"8b64025baef8d338aa5e\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\"]},\"assets\\/client\\/blocks\\/wc-schema-parser.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-schema-parser.js\",\"version\":\"f762078aeb4207fe9c3d\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/admin\\/sanitize\\/index.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/sanitize\\/index.js\",\"version\":\"5e942711022623794947\",\"dependencies\":[]},\"assets\\/client\\/admin\\/customer-effort-score\\/index.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/customer-effort-score\\/index.js\",\"version\":\"ed4a4ae27866cf6eafe2\",\"dependencies\":[\"react\",\"wc-experimental\",\"wc-navigation\",\"wc-store-data\",\"wc-tracks\",\"wp-api-fetch\",\"wp-components\",\"wp-compose\",\"wp-data\",\"wp-data-controls\",\"wp-element\",\"wp-i18n\"]},\"assets\\/client\\/blocks\\/cart-frontend.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-frontend.js\",\"version\":\"38214368643f2bc1f44d\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-blocks-shared-context\",\"wc-blocks-shared-hocs\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-keycodes\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-style-engine\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/checkout-frontend.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-frontend.js\",\"version\":\"fd3b672b3e6033d2fcf3\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-blocks-shared-hocs\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-components\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-dom\",\"wp-dom-ready\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-url\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/cart-line-items-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-line-items-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/product-template.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/product-template.js\",\"version\":\"dc1e6689935eae5616fe\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-shared-context\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-element\",\"wp-i18n\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/product-collection.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/product-collection.js\",\"version\":\"a0893f120865a60de547\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-registry\",\"wc-customer-effort-score\",\"wc-price-format\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-editor\",\"wp-element\",\"wp-escape-html\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-polyfill\",\"wp-primitives\",\"wp-url\"]},\"assets\\/client\\/blocks\\/cart-items-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-items-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-heading-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-heading-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-coupon-form-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-coupon-form-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-subtotal-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-subtotal-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-fee-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-fee-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-discount-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-discount-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-shipping-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-shipping-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-taxes-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-taxes-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-order-summary-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-order-summary-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-express-payment-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-express-payment-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/proceed-to-checkout-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/proceed-to-checkout-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-accepted-payment-methods-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-accepted-payment-methods-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart-totals-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-totals-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/filled-cart-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/filled-cart-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/product-new.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/product-new.js\",\"version\":\"dc319ffe83e918c335e2\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-settings\",\"wp-api-fetch\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-element\",\"wp-escape-html\",\"wp-html-entities\",\"wp-i18n\",\"wp-polyfill\",\"wp-primitives\",\"wp-server-side-render\",\"wp-url\"]},\"assets\\/client\\/blocks\\/empty-cart-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/empty-cart-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/cart.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart.js\",\"version\":\"d7aab23deff6ea435917\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-blocks-shared-context\",\"wc-blocks-shared-hocs\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-keycodes\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-style-engine\",\"wp-url\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/checkout-express-payment-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-express-payment-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-contact-information-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-contact-information-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-shipping-method-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-shipping-method-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-pickup-options-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-pickup-options-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-shipping-address-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-shipping-address-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-billing-address-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-billing-address-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-shipping-methods-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-shipping-methods-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-payment-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-payment-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-additional-information-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-additional-information-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-note-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-note-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-terms-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-terms-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-actions-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-actions-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-fields-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-fields-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-cart-items-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-cart-items-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-coupon-form-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-coupon-form-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-subtotal-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-subtotal-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-fee-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-fee-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-discount-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-discount-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-shipping-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-shipping-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-taxes-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-taxes-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-order-summary-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-order-summary-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout-totals-block.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout-totals-block.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]},\"assets\\/client\\/blocks\\/checkout.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/checkout.js\",\"version\":\"7471eb95867dc92e87b9\",\"dependencies\":[\"react\",\"react-jsx-runtime\",\"wc-blocks-checkout\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-price-format\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-api-fetch\",\"wp-autop\",\"wp-block-editor\",\"wp-blocks\",\"wp-components\",\"wp-compose\",\"wp-core-data\",\"wp-data\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-keycodes\",\"wp-notices\",\"wp-plugins\",\"wp-polyfill\",\"wp-primitives\",\"wp-url\",\"wp-wordcount\"]},\"assets\\/client\\/blocks\\/cart-blocks\\/cart-express-payment--checkout-blocks\\/express-payment-frontend.js\":{\"src\":\"http:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/cart-blocks\\/cart-express-payment--checkout-blocks\\/express-payment-frontend.js\",\"version\":\"wc-10.7.0\",\"dependencies\":[]}},\"version\":\"wc-10.7.0\",\"hash\":\"de572956c6a981456fa90f6464f16ba1\"}','off'),
(1274,'_transient_wp_styles_for_blocks','a:2:{s:4:\"hash\";s:32:\"e8fb8042b19d9151de7dada07bbaf99c\";s:6:\"blocks\";a:6:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:18:\"core/term-template\";s:0:\"\";s:12:\"core/columns\";s:0:\"\";s:14:\"core/pullquote\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}','on'),
(1279,'_transient_timeout_woocommerce_marketplace_promotions_v2','1777166425','off'),
(1280,'_transient_woocommerce_marketplace_promotions_v2','a:1:{s:6:\"promos\";a:4:{i:0;a:9:{s:13:\"date_from_gmt\";s:16:\"2025-11-26 14:15\";s:11:\"date_to_gmt\";s:16:\"2025-12-02 13:59\";s:6:\"format\";s:10:\"promo-card\";s:5:\"pages\";a:1:{i:0;a:2:{s:4:\"path\";s:0:\"\";s:8:\"pathname\";s:33:\"/wp-admin/admin.php?page=wc-admin\";}}s:9:\"cta_label\";a:1:{s:5:\"en_US\";s:13:\"Shop the sale\";}s:8:\"cta_link\";s:52:\"/wp-admin/admin.php?page=wc-admin&path=%2Fextensions\";s:7:\"content\";a:1:{s:5:\"en_US\";s:240:\"Save up to 40% on themes and extensions in the WooCommerce Marketplace until December 2 at 14:00 UTC. <strong>Coupon applied at checkout.</strong> <a href=\"https://woocommerce.com/products/#sale-ts-and-cs\" target=\"_blank\">T&C</a>’s apply.\";}s:5:\"title\";a:1:{s:5:\"en_US\";s:29:\"Black Friday savings are live\";}s:4:\"icon\";s:7:\"percent\";}i:1;a:9:{s:13:\"date_from_gmt\";s:16:\"2025-11-26 14:15\";s:11:\"date_to_gmt\";s:16:\"2025-12-02 13:59\";s:6:\"format\";s:10:\"promo-card\";s:5:\"pages\";a:1:{i:0;a:2:{s:4:\"page\";s:8:\"wc-admin\";s:4:\"path\";s:10:\"/marketing\";}}s:9:\"cta_label\";a:1:{s:5:\"en_US\";s:23:\"Level up your marketing\";}s:8:\"cta_link\";s:52:\"/wp-admin/admin.php?page=wc-admin&path=%2Fextensions\";s:7:\"content\";a:1:{s:5:\"en_US\";s:223:\"Save up to 40% in the Woo BFCM sale. <strong>Coupon applied at checkout.</strong> Offer ends December 2 at 14:00 UTC. T&Cs apply. <a href=\"https://woocommerce.com/products/#sale-ts-and-cs\" target=\"_blank\">T&C</a>’s apply.\";}s:5:\"title\";a:1:{s:5:\"en_US\";s:43:\"Take up to 40% off marketing tools and more\";}s:4:\"icon\";s:7:\"percent\";}i:2;a:10:{s:13:\"date_from_gmt\";s:16:\"2025-11-26 14:15\";s:11:\"date_to_gmt\";s:16:\"2025-12-02 13:59\";s:6:\"format\";s:10:\"promo-card\";s:5:\"pages\";a:1:{i:0;a:2:{s:4:\"path\";s:0:\"\";s:8:\"pathname\";s:40:\"/wp-admin/edit.php?post_type=shop_coupon\";}}s:9:\"cta_label\";a:1:{s:5:\"en_US\";s:19:\"Upgrade your promos\";}s:8:\"cta_link\";s:52:\"/wp-admin/admin.php?page=wc-admin&path=%2Fextensions\";s:7:\"content\";a:1:{s:5:\"en_US\";s:211:\"Save up to 40% in the Woo BFCM sale. <strong>Coupon applied at checkout.</strong> Offer ends December 2 at 14:00 UTC. <a href=\"https://woocommerce.com/products/#sale-ts-and-cs\" target=\"_blank\">T&C</a>’s apply.\";}s:5:\"title\";a:1:{s:5:\"en_US\";s:46:\"Take up to 40% off coupon and promo extensions\";}s:5:\"style\";s:4:\"wide\";s:4:\"icon\";s:7:\"percent\";}i:3;a:10:{s:13:\"date_from_gmt\";s:16:\"2025-11-26 14:15\";s:11:\"date_to_gmt\";s:16:\"2025-12-02 13:59\";s:6:\"format\";s:10:\"promo-card\";s:5:\"pages\";a:1:{i:0;a:2:{s:4:\"page\";s:8:\"wc-admin\";s:4:\"path\";s:11:\"/extensions\";}}s:9:\"cta_label\";a:1:{s:5:\"en_US\";s:13:\"Shop the sale\";}s:8:\"cta_link\";s:52:\"/wp-admin/admin.php?page=wc-admin&path=%2Fextensions\";s:7:\"content\";a:1:{s:5:\"en_US\";s:233:\"Take up to 40% off WooCommerce Marketplace products this BFCM. <strong>Coupon applied at checkout.</strong> Sale ends December 2 at 14:00 UTC. <a href=\"https://woocommerce.com/products/#sale-ts-and-cs\" target=\"_blank\">T&Cs</a> apply.\";}s:5:\"title\";a:1:{s:5:\"en_US\";s:39:\"Save up to 40% on your next big upgrade\";}s:5:\"style\";s:14:\"has-background\";s:4:\"icon\";s:7:\"percent\";}}}','off'),
(1282,'_transient_wc_term_counts','a:38:{s:14:\"36_product_tag\";i:1;s:14:\"35_product_tag\";i:5;s:14:\"44_product_tag\";i:1;s:14:\"42_product_tag\";i:1;s:14:\"56_product_tag\";i:1;s:14:\"41_product_tag\";i:1;s:14:\"43_product_tag\";i:1;s:14:\"32_product_tag\";i:1;s:14:\"52_product_tag\";i:1;s:14:\"39_product_tag\";i:1;s:14:\"50_product_tag\";i:2;s:14:\"17_product_cat\";i:1;s:14:\"28_product_tag\";i:1;s:14:\"51_product_tag\";i:1;s:14:\"16_product_cat\";i:3;s:14:\"25_product_tag\";i:2;s:14:\"23_product_tag\";i:1;s:14:\"38_product_tag\";i:1;s:14:\"54_product_tag\";i:1;s:14:\"30_product_tag\";i:1;s:14:\"46_product_tag\";i:1;s:14:\"48_product_tag\";i:1;s:14:\"31_product_tag\";i:1;s:14:\"29_product_tag\";i:1;s:14:\"27_product_tag\";i:1;s:14:\"26_product_tag\";i:1;s:14:\"53_product_tag\";i:1;s:14:\"24_product_tag\";i:1;s:14:\"45_product_tag\";i:1;s:14:\"40_product_tag\";i:1;s:14:\"55_product_tag\";i:1;s:14:\"49_product_tag\";i:1;s:14:\"37_product_tag\";i:1;s:14:\"33_product_tag\";i:1;s:14:\"19_product_cat\";i:1;s:14:\"47_product_tag\";i:1;s:14:\"34_product_tag\";i:1;s:14:\"15_product_cat\";i:3;}','off'),
(1284,'_transient_orders-transient-version','1777083120','on'),
(1312,'_transient_woocommerce_blocks_asset_api_script_data_ssl','{\"script_data\":{\"assets\\/client\\/blocks\\/wc-settings.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-settings.js\",\"version\":\"a6cb3c938fd270888ce4\",\"dependencies\":[\"wc-types\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-types.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-types.js\",\"version\":\"f0cc692c0367e0930c80\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-entities.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-entities.js\",\"version\":\"cdb01de69fb7dbbbb30f\",\"dependencies\":[\"wc-settings\",\"wp-core-data\",\"wp-data\",\"wp-i18n\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-middleware.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-middleware.js\",\"version\":\"d79dedade2f2e4dc9df4\",\"dependencies\":[\"wp-api-fetch\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-data.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-data.js\",\"version\":\"ffb2849a705ee55d810e\",\"dependencies\":[\"wc-blocks-checkout-events\",\"wc-blocks-registry\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-data\",\"wp-data-controls\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-vendors.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-vendors.js\",\"version\":\"9b3f9ad7437063887d6c\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-registry.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-registry.js\",\"version\":\"6436a923b42f4d1b1f6d\",\"dependencies\":[\"react-jsx-runtime\",\"wc-settings\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks.js\",\"version\":\"0db759a8a6e010732c50\",\"dependencies\":[\"react-jsx-runtime\",\"wp-blocks\",\"wp-compose\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-context.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-context.js\",\"version\":\"621353d8a3a7c8d44b41\",\"dependencies\":[\"react-jsx-runtime\",\"wp-element\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\",\"version\":\"c18bbb2325f333897e6b\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-blocks-shared-context\",\"wc-types\",\"wp-data\",\"wp-element\",\"wp-is-shallow-equal\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/price-format.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/price-format.js\",\"version\":\"0df720e448f7ab3c5d0d\",\"dependencies\":[\"wc-settings\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\",\"version\":\"00b931bcc27024fa60ca\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\",\"version\":\"04a71982bb4ef85763c1\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\",\"version\":\"f669b3c33346e637602f\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-checkout.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout.js\",\"version\":\"da57c8c98d31b28d806e\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\",\"wp-warning\"]},\"assets\\/client\\/blocks\\/blocks-checkout-events.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout-events.js\",\"version\":\"2d0fd4590f6cc663947c\",\"dependencies\":[\"wc-types\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-components.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-components.js\",\"version\":\"8b64025baef8d338aa5e\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\"]},\"assets\\/client\\/blocks\\/wc-schema-parser.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-schema-parser.js\",\"version\":\"f762078aeb4207fe9c3d\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/admin\\/sanitize\\/index.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/sanitize\\/index.js\",\"version\":\"5e942711022623794947\",\"dependencies\":[]},\"assets\\/client\\/admin\\/customer-effort-score\\/index.js\":{\"src\":\"https:\\/\\/localhost\\/pet\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/customer-effort-score\\/index.js\",\"version\":\"ed4a4ae27866cf6eafe2\",\"dependencies\":[\"react\",\"wc-experimental\",\"wc-navigation\",\"wc-store-data\",\"wc-tracks\",\"wp-api-fetch\",\"wp-components\",\"wp-compose\",\"wp-data\",\"wp-data-controls\",\"wp-element\",\"wp-i18n\"]}},\"version\":\"wc-10.7.0\",\"hash\":\"de572956c6a981456fa90f6464f16ba1\"}','off'),
(1314,'_transient_product_query-transient-version','1777080315','on'),
(1325,'_transient_timeout_astra-theme-cron-test-ok','1777083623','off'),
(1326,'_transient_astra-theme-cron-test-ok','1','off'),
(1329,'_transient_timeout__woocommerce_helper_subscriptions','1777080931','off'),
(1330,'_transient__woocommerce_helper_subscriptions','a:0:{}','off'),
(1334,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/en_AU/wordpress-6.9.4.zip\";s:6:\"locale\";s:5:\"en_AU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/en_AU/wordpress-6.9.4.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.9.4\";s:7:\"version\";s:5:\"6.9.4\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1777080035;s:15:\"version_checked\";s:5:\"6.9.4\";s:12:\"translations\";a:0:{}}','off'),
(1335,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1777080036;s:7:\"checked\";a:6:{s:5:\"astra\";s:6:\"4.13.0\";s:10:\"storefront\";s:5:\"4.6.2\";s:16:\"twentytwentyfive\";s:3:\"1.4\";s:16:\"twentytwentyfour\";s:3:\"1.4\";s:17:\"twentytwentythree\";s:3:\"1.6\";s:15:\"twentytwentytwo\";s:3:\"2.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:6:{s:5:\"astra\";a:6:{s:5:\"theme\";s:5:\"astra\";s:11:\"new_version\";s:6:\"4.13.0\";s:3:\"url\";s:35:\"https://wordpress.org/themes/astra/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/theme/astra.4.13.0.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.3\";}s:10:\"storefront\";a:6:{s:5:\"theme\";s:10:\"storefront\";s:11:\"new_version\";s:5:\"4.6.2\";s:3:\"url\";s:40:\"https://wordpress.org/themes/storefront/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/storefront.4.6.2.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:5:\"5.6.0\";}s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.4.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.4.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.2.1.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:5:\"astra\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:6:\"4.13.0\";s:7:\"updated\";s:19:\"2025-11-10 08:13:55\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/translation/theme/astra/4.13.0/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:10:\"storefront\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"4.6.2\";s:7:\"updated\";s:19:\"2023-10-22 08:27:15\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/translation/theme/storefront/4.6.2/en_AU.zip\";s:10:\"autoupdate\";b:1;}}}','off'),
(1336,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1777080036;s:8:\"response\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:3:\"7.0\";s:12:\"requires_php\";s:3:\"7.2\";s:16:\"requires_plugins\";a:0:{}}s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:31:\"w.org/plugins/really-simple-ssl\";s:4:\"slug\";s:17:\"really-simple-ssl\";s:6:\"plugin\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:11:\"new_version\";s:6:\"9.5.10\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/really-simple-ssl/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/really-simple-ssl.9.5.10.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/really-simple-ssl/assets/icon-256x256.png?rev=2839720\";s:2:\"1x\";s:70:\"https://ps.w.org/really-simple-ssl/assets/icon-128x128.png?rev=2839720\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/really-simple-ssl/assets/banner-1544x500.png?rev=3100992\";s:2:\"1x\";s:72:\"https://ps.w.org/really-simple-ssl/assets/banner-772x250.png?rev=3100992\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.6\";s:6:\"tested\";s:3:\"7.0\";s:12:\"requires_php\";s:3:\"7.4\";s:16:\"requires_plugins\";a:0:{}}s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:40:\"w.org/plugins/woocommerce-gateway-stripe\";s:4:\"slug\";s:26:\"woocommerce-gateway-stripe\";s:6:\"plugin\";s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";s:11:\"new_version\";s:6:\"10.6.1\";s:3:\"url\";s:57:\"https://wordpress.org/plugins/woocommerce-gateway-stripe/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/woocommerce-gateway-stripe.10.6.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/woocommerce-gateway-stripe/assets/icon-256x256.png?rev=3177277\";s:2:\"1x\";s:79:\"https://ps.w.org/woocommerce-gateway-stripe/assets/icon-128x128.png?rev=3177277\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:82:\"https://ps.w.org/woocommerce-gateway-stripe/assets/banner-1544x500.png?rev=3234748\";s:2:\"1x\";s:81:\"https://ps.w.org/woocommerce-gateway-stripe/assets/banner-772x250.png?rev=3234748\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.7\";s:6:\"tested\";s:5:\"6.9.4\";s:12:\"requires_php\";s:3:\"7.4\";s:16:\"requires_plugins\";a:1:{i:0;s:11:\"woocommerce\";}}}s:12:\"translations\";a:8:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:23:\"all-in-one-wp-migration\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"7.105\";s:7:\"updated\";s:19:\"2021-08-31 05:35:55\";s:7:\"package\";s:90:\"https://downloads.wordpress.org/translation/plugin/all-in-one-wp-migration/7.105/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:14:\"contact-form-7\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"6.1.5\";s:7:\"updated\";s:19:\"2024-03-18 08:28:25\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/plugin/contact-form-7/6.1.5/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"hello-dolly\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"1.7.2\";s:7:\"updated\";s:19:\"2018-03-20 09:37:00\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/plugin/hello-dolly/1.7.2/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:3;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:17:\"really-simple-ssl\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"9.5.9\";s:7:\"updated\";s:19:\"2025-12-17 13:39:59\";s:7:\"package\";s:84:\"https://downloads.wordpress.org/translation/plugin/really-simple-ssl/9.5.9/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:4;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"woocommerce\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:6:\"10.7.0\";s:7:\"updated\";s:19:\"2026-04-10 23:57:24\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/plugin/woocommerce/10.7.0/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:5;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:26:\"woocommerce-gateway-stripe\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:6:\"10.5.3\";s:7:\"updated\";s:19:\"2022-12-24 03:44:10\";s:7:\"package\";s:94:\"https://downloads.wordpress.org/translation/plugin/woocommerce-gateway-stripe/10.5.3/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:6;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:14:\"wp-super-cache\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"3.1.0\";s:7:\"updated\";s:19:\"2026-04-20 05:14:56\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/plugin/wp-super-cache/3.1.0/en_AU.zip\";s:10:\"autoupdate\";b:1;}i:7;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:13:\"wordpress-seo\";s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:4:\"27.4\";s:7:\"updated\";s:19:\"2026-04-15 07:53:08\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/plugin/wordpress-seo/27.4/en_AU.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:11:{s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:37:\"w.org/plugins/all-in-one-wp-migration\";s:4:\"slug\";s:23:\"all-in-one-wp-migration\";s:6:\"plugin\";s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";s:11:\"new_version\";s:5:\"7.105\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/all-in-one-wp-migration/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/all-in-one-wp-migration.7.105.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/all-in-one-wp-migration/assets/icon-256x256.png?rev=2458334\";s:2:\"1x\";s:76:\"https://ps.w.org/all-in-one-wp-migration/assets/icon-128x128.png?rev=2458334\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/all-in-one-wp-migration/assets/banner-1544x500.png?rev=3490368\";s:2:\"1x\";s:78:\"https://ps.w.org/all-in-one-wp-migration/assets/banner-772x250.png?rev=3490368\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.3\";}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"6.1.5\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.6.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.7\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:39:\"w.org/plugins/mailchimp-for-woocommerce\";s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:6:\"plugin\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:11:\"new_version\";s:5:\"6.0.2\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/mailchimp-for-woocommerce/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/mailchimp-for-woocommerce.6.0.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";s:2:\"1x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-1544x500.png?rev=1950415\";s:2:\"1x\";s:80:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-772x250.jpg?rev=1950415\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.2\";}s:27:\"astra-sites/astra-sites.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/astra-sites\";s:4:\"slug\";s:11:\"astra-sites\";s:6:\"plugin\";s:27:\"astra-sites/astra-sites.php\";s:11:\"new_version\";s:5:\"4.5.3\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/astra-sites/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/astra-sites.4.5.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/astra-sites/assets/icon-256x256.gif?rev=3060571\";s:2:\"1x\";s:64:\"https://ps.w.org/astra-sites/assets/icon-256x256.gif?rev=3060571\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/astra-sites/assets/banner-1544x500.jpg?rev=3055258\";s:2:\"1x\";s:66:\"https://ps.w.org/astra-sites/assets/banner-772x250.jpg?rev=3055258\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.6\";}s:49:\"woo-variation-swatches/woo-variation-swatches.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:36:\"w.org/plugins/woo-variation-swatches\";s:4:\"slug\";s:22:\"woo-variation-swatches\";s:6:\"plugin\";s:49:\"woo-variation-swatches/woo-variation-swatches.php\";s:11:\"new_version\";s:5:\"2.2.3\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/woo-variation-swatches/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/woo-variation-swatches.2.2.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/woo-variation-swatches/assets/icon-256x256.gif?rev=3157951\";s:2:\"1x\";s:75:\"https://ps.w.org/woo-variation-swatches/assets/icon-128x128.gif?rev=3157951\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/woo-variation-swatches/assets/banner-1544x500.gif?rev=2741177\";s:2:\"1x\";s:77:\"https://ps.w.org/woo-variation-swatches/assets/banner-772x250.gif?rev=2741177\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:6:\"10.7.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/woocommerce.10.7.0.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:56:\"https://ps.w.org/woocommerce/assets/icon.svg?rev=3234504\";s:3:\"svg\";s:56:\"https://ps.w.org/woocommerce/assets/icon.svg?rev=3234504\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=3234504\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=3234504\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.8\";}s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:41:\"w.org/plugins/woocommerce-legacy-rest-api\";s:4:\"slug\";s:27:\"woocommerce-legacy-rest-api\";s:6:\"plugin\";s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";s:11:\"new_version\";s:5:\"1.0.5\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/woocommerce-legacy-rest-api/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/woocommerce-legacy-rest-api.1.0.5.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:72:\"https://ps.w.org/woocommerce-legacy-rest-api/assets/icon.svg?rev=3234501\";s:3:\"svg\";s:72:\"https://ps.w.org/woocommerce-legacy-rest-api/assets/icon.svg?rev=3234501\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.2\";}s:59:\"woocommerce-paypal-payments/woocommerce-paypal-payments.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:41:\"w.org/plugins/woocommerce-paypal-payments\";s:4:\"slug\";s:27:\"woocommerce-paypal-payments\";s:6:\"plugin\";s:59:\"woocommerce-paypal-payments/woocommerce-paypal-payments.php\";s:11:\"new_version\";s:5:\"4.0.2\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/woocommerce-paypal-payments/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/woocommerce-paypal-payments.4.0.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:80:\"https://ps.w.org/woocommerce-paypal-payments/assets/icon-256x256.png?rev=3234615\";s:2:\"1x\";s:80:\"https://ps.w.org/woocommerce-paypal-payments/assets/icon-128x128.png?rev=3234615\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:83:\"https://ps.w.org/woocommerce-paypal-payments/assets/banner-1544x500.png?rev=3234615\";s:2:\"1x\";s:82:\"https://ps.w.org/woocommerce-paypal-payments/assets/banner-772x250.png?rev=3234615\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.5\";}s:27:\"wp-super-cache/wp-cache.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/wp-super-cache\";s:4:\"slug\";s:14:\"wp-super-cache\";s:6:\"plugin\";s:27:\"wp-super-cache/wp-cache.php\";s:11:\"new_version\";s:5:\"3.1.0\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wp-super-cache/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wp-super-cache.3.1.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/wp-super-cache/assets/icon-256x256.png?rev=3506220\";s:2:\"1x\";s:67:\"https://ps.w.org/wp-super-cache/assets/icon-128x128.png?rev=3506220\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/wp-super-cache/assets/banner-1544x500.png?rev=3506220\";s:2:\"1x\";s:69:\"https://ps.w.org/wp-super-cache/assets/banner-772x250.png?rev=3506220\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.8\";}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:4:\"27.4\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wordpress-seo.27.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.gif?rev=3419908\";s:2:\"1x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-128x128.gif?rev=3419908\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=3257862\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=3257862\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=3257862\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=3257862\";}s:8:\"requires\";s:3:\"6.8\";}}s:7:\"checked\";a:14:{s:19:\"akismet/akismet.php\";s:3:\"5.6\";s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";s:5:\"7.105\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"6.1.5\";s:9:\"hello.php\";s:5:\"1.7.2\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:5:\"6.0.2\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:5:\"9.5.9\";s:27:\"astra-sites/astra-sites.php\";s:5:\"4.5.3\";s:49:\"woo-variation-swatches/woo-variation-swatches.php\";s:5:\"2.2.3\";s:27:\"woocommerce/woocommerce.php\";s:6:\"10.7.0\";s:59:\"woocommerce-legacy-rest-api/woocommerce-legacy-rest-api.php\";s:5:\"1.0.5\";s:59:\"woocommerce-paypal-payments/woocommerce-paypal-payments.php\";s:5:\"4.0.2\";s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";s:6:\"10.5.3\";s:27:\"wp-super-cache/wp-cache.php\";s:5:\"3.1.0\";s:24:\"wordpress-seo/wp-seo.php\";s:4:\"27.4\";}}','off'),
(1346,'_transient_product-transient-version','1777080315','on'),
(1347,'_transient_timeout_wc_related_64','1777169506','off'),
(1348,'_transient_wc_related_64','a:2:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=64\";a:5:{i:0;s:2:\"43\";i:1;s:2:\"44\";i:2;s:2:\"45\";i:3;s:2:\"46\";i:4;s:2:\"61\";}s:50:\"limit=4&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=64\";a:5:{i:0;s:2:\"43\";i:1;s:2:\"44\";i:2;s:2:\"45\";i:3;s:2:\"46\";i:4;s:2:\"61\";}}','off'),
(1349,'_transient_timeout_wc_related_61','1777166714','off'),
(1350,'_transient_wc_related_61','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=61\";a:5:{i:0;s:2:\"43\";i:1;s:2:\"44\";i:2;s:2:\"45\";i:3;s:2:\"46\";i:4;s:2:\"64\";}}','off'),
(1351,'_transient_timeout_wc_related_46','1777166714','off'),
(1352,'_transient_wc_related_46','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=46\";a:4:{i:0;s:2:\"43\";i:1;s:2:\"44\";i:2;s:2:\"61\";i:3;s:2:\"64\";}}','off'),
(1353,'_transient_timeout_wc_related_45','1777166714','off'),
(1354,'_transient_wc_related_45','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=45\";a:2:{i:0;s:2:\"61\";i:1;s:2:\"64\";}}','off'),
(1355,'_transient_timeout_wc_related_44','1777166714','off'),
(1356,'_transient_wc_related_44','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=44\";a:5:{i:0;s:2:\"41\";i:1;s:2:\"43\";i:2;s:2:\"46\";i:3;s:2:\"61\";i:4;s:2:\"64\";}}','off'),
(1357,'_transient_timeout_wc_related_43','1777166715','off'),
(1358,'_transient_wc_related_43','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=43\";a:5:{i:0;s:2:\"41\";i:1;s:2:\"44\";i:2;s:2:\"46\";i:3;s:2:\"61\";i:4;s:2:\"64\";}}','off'),
(1359,'_transient_timeout_wc_related_42','1777166715','off'),
(1360,'_transient_wc_related_42','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=42\";a:0:{}}','off'),
(1361,'_transient_timeout_wc_related_41','1777166715','off'),
(1362,'_transient_wc_related_41','a:1:{s:50:\"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=41\";a:2:{i:0;s:2:\"43\";i:1;s:2:\"44\";}}','off'),
(1363,'_site_transient_timeout_wp_theme_files_patterns-ff960fb092ec48ae032e263146fb288c','1777084870','off'),
(1364,'_site_transient_wp_theme_files_patterns-ff960fb092ec48ae032e263146fb288c','a:2:{s:7:\"version\";s:6:\"4.13.0\";s:8:\"patterns\";a:0:{}}','off'),
(1366,'_site_transient_timeout_theme_roots','1777084872','off'),
(1367,'_site_transient_theme_roots','a:6:{s:5:\"astra\";s:7:\"/themes\";s:10:\"storefront\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}','off'),
(1369,'_transient_shipping-transient-version','1777083094','on'),
(1370,'_transient_wc_shipping_method_count','a:4:{s:7:\"version\";s:10:\"1777083094\";s:6:\"legacy\";i:0;s:7:\"enabled\";i:2;s:8:\"disabled\";i:0;}','off'),
(1371,'_transient_woocommerce_block_asset_resource_hints','a:2:{s:5:\"files\";a:2:{s:13:\"cart-frontend\";a:45:{i:0;a:2:{s:4:\"href\";s:114:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/cart-frontend.js?ver=38214368643f2bc1f44d\";s:2:\"as\";s:6:\"script\";}i:1;a:2:{s:4:\"href\";s:131:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-base-frontend.js?ver=f669b3c33346e637602f\";s:2:\"as\";s:6:\"script\";}i:2;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/vendor/wp-polyfill.min.js?ver=3.15.0\";s:2:\"as\";s:6:\"script\";}i:3;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/i18n.min.js?ver=c26c3dc7bed366793375\";s:2:\"as\";s:6:\"script\";}i:4;a:2:{s:4:\"href\";s:78:\"https://furlio.au/wp-includes/js/dist/hooks.min.js?ver=dd5603f07f9220ed27f1\";s:2:\"as\";s:6:\"script\";}i:5;a:2:{s:4:\"href\";s:134:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-vendors-frontend.js?ver=04a71982bb4ef85763c1\";s:2:\"as\";s:6:\"script\";}i:6;a:2:{s:4:\"href\";s:73:\"https://furlio.au/wp-includes/js/dist/vendor/react.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:7;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/vendor/react-jsx-runtime.min.js?ver=18.3.1\";s:2:\"as\";s:6:\"script\";}i:8;a:2:{s:4:\"href\";s:116:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout.js?ver=da57c8c98d31b28d806e\";s:2:\"as\";s:6:\"script\";}i:9;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/vendor/react-dom.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:10;a:2:{s:4:\"href\";s:123:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout-events.js?ver=2d0fd4590f6cc663947c\";s:2:\"as\";s:6:\"script\";}i:11;a:2:{s:4:\"href\";s:109:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-types.js?ver=f0cc692c0367e0930c80\";s:2:\"as\";s:6:\"script\";}i:12;a:2:{s:4:\"href\";s:118:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/blocks-components.js?ver=8b64025baef8d338aa5e\";s:2:\"as\";s:6:\"script\";}i:13;a:2:{s:4:\"href\";s:115:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-data.js?ver=ffb2849a705ee55d810e\";s:2:\"as\";s:6:\"script\";}i:14;a:2:{s:4:\"href\";s:119:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-registry.js?ver=6436a923b42f4d1b1f6d\";s:2:\"as\";s:6:\"script\";}i:15;a:2:{s:4:\"href\";s:112:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-settings.js?ver=a6cb3c938fd270888ce4\";s:2:\"as\";s:6:\"script\";}i:16;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/api-fetch.min.js?ver=3a4d9af2b423048b0dee\";s:2:\"as\";s:6:\"script\";}i:17;a:2:{s:4:\"href\";s:76:\"https://furlio.au/wp-includes/js/dist/url.min.js?ver=9e178c9516d1222dc834\";s:2:\"as\";s:6:\"script\";}i:18;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/data.min.js?ver=f940198280891b0b6318\";s:2:\"as\";s:6:\"script\";}i:19;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/compose.min.js?ver=7a9b375d8c19cf9d3d9b\";s:2:\"as\";s:6:\"script\";}i:20;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/deprecated.min.js?ver=e1f84915c5e8ae38964c\";s:2:\"as\";s:6:\"script\";}i:21;a:2:{s:4:\"href\";s:76:\"https://furlio.au/wp-includes/js/dist/dom.min.js?ver=26edef3be6483da3de2e\";s:2:\"as\";s:6:\"script\";}i:22;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/element.min.js?ver=6a582b0c827fa25df3dd\";s:2:\"as\";s:6:\"script\";}i:23;a:2:{s:4:\"href\";s:84:\"https://furlio.au/wp-includes/js/dist/escape-html.min.js?ver=6561a406d2d232a6fbd2\";s:2:\"as\";s:6:\"script\";}i:24;a:2:{s:4:\"href\";s:89:\"https://furlio.au/wp-includes/js/dist/is-shallow-equal.min.js?ver=e0f9f1d78d83f5196979\";s:2:\"as\";s:6:\"script\";}i:25;a:2:{s:4:\"href\";s:81:\"https://furlio.au/wp-includes/js/dist/keycodes.min.js?ver=34c8fb5e7a594a1c8037\";s:2:\"as\";s:6:\"script\";}i:26;a:2:{s:4:\"href\";s:87:\"https://furlio.au/wp-includes/js/dist/priority-queue.min.js?ver=2d59d091223ee9a33838\";s:2:\"as\";s:6:\"script\";}i:27;a:2:{s:4:\"href\";s:85:\"https://furlio.au/wp-includes/js/dist/private-apis.min.js?ver=4f465748bda624774139\";s:2:\"as\";s:6:\"script\";}i:28;a:2:{s:4:\"href\";s:86:\"https://furlio.au/wp-includes/js/dist/redux-routine.min.js?ver=8bb92d45458b29590f53\";s:2:\"as\";s:6:\"script\";}i:29;a:2:{s:4:\"href\";s:86:\"https://furlio.au/wp-includes/js/dist/data-controls.min.js?ver=49f5587e8b90f9e7cc7e\";s:2:\"as\";s:6:\"script\";}i:30;a:2:{s:4:\"href\";s:86:\"https://furlio.au/wp-includes/js/dist/html-entities.min.js?ver=e8b78b18a162491d5e5f\";s:2:\"as\";s:6:\"script\";}i:31;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/notices.min.js?ver=f62fbf15dcc23301922f\";s:2:\"as\";s:6:\"script\";}i:32;a:2:{s:4:\"href\";s:121:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-middleware.js?ver=d79dedade2f2e4dc9df4\";s:2:\"as\";s:6:\"script\";}i:33;a:2:{s:4:\"href\";s:114:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/admin/sanitize/index.js?ver=5e942711022623794947\";s:2:\"as\";s:6:\"script\";}i:34;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/a11y.min.js?ver=cb460b4676c94bd228ed\";s:2:\"as\";s:6:\"script\";}i:35;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/dom-ready.min.js?ver=f77871ff7694fffea381\";s:2:\"as\";s:6:\"script\";}i:36;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/primitives.min.js?ver=0b5dcc337aa7cbf75570\";s:2:\"as\";s:6:\"script\";}i:37;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/warning.min.js?ver=d69bc18c456d01c11d5a\";s:2:\"as\";s:6:\"script\";}i:38;a:2:{s:4:\"href\";s:125:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-context.js?ver=621353d8a3a7c8d44b41\";s:2:\"as\";s:6:\"script\";}i:39;a:2:{s:4:\"href\";s:122:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-hocs.js?ver=c18bbb2325f333897e6b\";s:2:\"as\";s:6:\"script\";}i:40;a:2:{s:4:\"href\";s:113:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/price-format.js?ver=0df720e448f7ab3c5d0d\";s:2:\"as\";s:6:\"script\";}i:41;a:2:{s:4:\"href\";s:78:\"https://furlio.au/wp-includes/js/dist/autop.min.js?ver=9fb50649848277dd318d\";s:2:\"as\";s:6:\"script\";}i:42;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/plugins.min.js?ver=039ed87b5b9f7036ceee\";s:2:\"as\";s:6:\"script\";}i:43;a:2:{s:4:\"href\";s:85:\"https://furlio.au/wp-includes/js/dist/style-engine.min.js?ver=7c6fcedc37dadafb8a81\";s:2:\"as\";s:6:\"script\";}i:44;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/wordcount.min.js?ver=c5b97f11206928ea9130\";s:2:\"as\";s:6:\"script\";}}s:17:\"checkout-frontend\";a:48:{i:0;a:2:{s:4:\"href\";s:118:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/checkout-frontend.js?ver=fd3b672b3e6033d2fcf3\";s:2:\"as\";s:6:\"script\";}i:1;a:2:{s:4:\"href\";s:131:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-base-frontend.js?ver=f669b3c33346e637602f\";s:2:\"as\";s:6:\"script\";}i:2;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/vendor/wp-polyfill.min.js?ver=3.15.0\";s:2:\"as\";s:6:\"script\";}i:3;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/i18n.min.js?ver=c26c3dc7bed366793375\";s:2:\"as\";s:6:\"script\";}i:4;a:2:{s:4:\"href\";s:78:\"https://furlio.au/wp-includes/js/dist/hooks.min.js?ver=dd5603f07f9220ed27f1\";s:2:\"as\";s:6:\"script\";}i:5;a:2:{s:4:\"href\";s:134:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-cart-checkout-vendors-frontend.js?ver=04a71982bb4ef85763c1\";s:2:\"as\";s:6:\"script\";}i:6;a:2:{s:4:\"href\";s:73:\"https://furlio.au/wp-includes/js/dist/vendor/react.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:7;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/vendor/react-jsx-runtime.min.js?ver=18.3.1\";s:2:\"as\";s:6:\"script\";}i:8;a:2:{s:4:\"href\";s:116:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout.js?ver=da57c8c98d31b28d806e\";s:2:\"as\";s:6:\"script\";}i:9;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/vendor/react-dom.min.js?ver=18.3.1.1\";s:2:\"as\";s:6:\"script\";}i:10;a:2:{s:4:\"href\";s:123:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/blocks-checkout-events.js?ver=2d0fd4590f6cc663947c\";s:2:\"as\";s:6:\"script\";}i:11;a:2:{s:4:\"href\";s:109:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-types.js?ver=f0cc692c0367e0930c80\";s:2:\"as\";s:6:\"script\";}i:12;a:2:{s:4:\"href\";s:118:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/blocks-components.js?ver=8b64025baef8d338aa5e\";s:2:\"as\";s:6:\"script\";}i:13;a:2:{s:4:\"href\";s:115:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-data.js?ver=ffb2849a705ee55d810e\";s:2:\"as\";s:6:\"script\";}i:14;a:2:{s:4:\"href\";s:119:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-registry.js?ver=6436a923b42f4d1b1f6d\";s:2:\"as\";s:6:\"script\";}i:15;a:2:{s:4:\"href\";s:112:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-settings.js?ver=a6cb3c938fd270888ce4\";s:2:\"as\";s:6:\"script\";}i:16;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/api-fetch.min.js?ver=3a4d9af2b423048b0dee\";s:2:\"as\";s:6:\"script\";}i:17;a:2:{s:4:\"href\";s:76:\"https://furlio.au/wp-includes/js/dist/url.min.js?ver=9e178c9516d1222dc834\";s:2:\"as\";s:6:\"script\";}i:18;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/data.min.js?ver=f940198280891b0b6318\";s:2:\"as\";s:6:\"script\";}i:19;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/compose.min.js?ver=7a9b375d8c19cf9d3d9b\";s:2:\"as\";s:6:\"script\";}i:20;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/deprecated.min.js?ver=e1f84915c5e8ae38964c\";s:2:\"as\";s:6:\"script\";}i:21;a:2:{s:4:\"href\";s:76:\"https://furlio.au/wp-includes/js/dist/dom.min.js?ver=26edef3be6483da3de2e\";s:2:\"as\";s:6:\"script\";}i:22;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/element.min.js?ver=6a582b0c827fa25df3dd\";s:2:\"as\";s:6:\"script\";}i:23;a:2:{s:4:\"href\";s:84:\"https://furlio.au/wp-includes/js/dist/escape-html.min.js?ver=6561a406d2d232a6fbd2\";s:2:\"as\";s:6:\"script\";}i:24;a:2:{s:4:\"href\";s:89:\"https://furlio.au/wp-includes/js/dist/is-shallow-equal.min.js?ver=e0f9f1d78d83f5196979\";s:2:\"as\";s:6:\"script\";}i:25;a:2:{s:4:\"href\";s:81:\"https://furlio.au/wp-includes/js/dist/keycodes.min.js?ver=34c8fb5e7a594a1c8037\";s:2:\"as\";s:6:\"script\";}i:26;a:2:{s:4:\"href\";s:87:\"https://furlio.au/wp-includes/js/dist/priority-queue.min.js?ver=2d59d091223ee9a33838\";s:2:\"as\";s:6:\"script\";}i:27;a:2:{s:4:\"href\";s:85:\"https://furlio.au/wp-includes/js/dist/private-apis.min.js?ver=4f465748bda624774139\";s:2:\"as\";s:6:\"script\";}i:28;a:2:{s:4:\"href\";s:86:\"https://furlio.au/wp-includes/js/dist/redux-routine.min.js?ver=8bb92d45458b29590f53\";s:2:\"as\";s:6:\"script\";}i:29;a:2:{s:4:\"href\";s:86:\"https://furlio.au/wp-includes/js/dist/data-controls.min.js?ver=49f5587e8b90f9e7cc7e\";s:2:\"as\";s:6:\"script\";}i:30;a:2:{s:4:\"href\";s:86:\"https://furlio.au/wp-includes/js/dist/html-entities.min.js?ver=e8b78b18a162491d5e5f\";s:2:\"as\";s:6:\"script\";}i:31;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/notices.min.js?ver=f62fbf15dcc23301922f\";s:2:\"as\";s:6:\"script\";}i:32;a:2:{s:4:\"href\";s:121:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-middleware.js?ver=d79dedade2f2e4dc9df4\";s:2:\"as\";s:6:\"script\";}i:33;a:2:{s:4:\"href\";s:114:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/admin/sanitize/index.js?ver=5e942711022623794947\";s:2:\"as\";s:6:\"script\";}i:34;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/a11y.min.js?ver=cb460b4676c94bd228ed\";s:2:\"as\";s:6:\"script\";}i:35;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/dom-ready.min.js?ver=f77871ff7694fffea381\";s:2:\"as\";s:6:\"script\";}i:36;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/primitives.min.js?ver=0b5dcc337aa7cbf75570\";s:2:\"as\";s:6:\"script\";}i:37;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/warning.min.js?ver=d69bc18c456d01c11d5a\";s:2:\"as\";s:6:\"script\";}i:38;a:2:{s:4:\"href\";s:122:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-hocs.js?ver=c18bbb2325f333897e6b\";s:2:\"as\";s:6:\"script\";}i:39;a:2:{s:4:\"href\";s:125:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/wc-blocks-shared-context.js?ver=621353d8a3a7c8d44b41\";s:2:\"as\";s:6:\"script\";}i:40;a:2:{s:4:\"href\";s:113:\"https://furlio.au/wp-content/plugins/woocommerce/assets/client/blocks/price-format.js?ver=0df720e448f7ab3c5d0d\";s:2:\"as\";s:6:\"script\";}i:41;a:2:{s:4:\"href\";s:78:\"https://furlio.au/wp-includes/js/dist/autop.min.js?ver=9fb50649848277dd318d\";s:2:\"as\";s:6:\"script\";}i:42;a:2:{s:4:\"href\";s:83:\"https://furlio.au/wp-includes/js/dist/components.min.js?ver=0d72a218dfea8f6f442f\";s:2:\"as\";s:6:\"script\";}i:43;a:2:{s:4:\"href\";s:77:\"https://furlio.au/wp-includes/js/dist/date.min.js?ver=795a56839718d3ff7eae\";s:2:\"as\";s:6:\"script\";}i:44;a:2:{s:4:\"href\";s:72:\"https://furlio.au/wp-includes/js/dist/vendor/moment.min.js?ver=2.30.1\";s:2:\"as\";s:6:\"script\";}i:45;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/rich-text.min.js?ver=5bdbb44f3039529e3645\";s:2:\"as\";s:6:\"script\";}i:46;a:2:{s:4:\"href\";s:80:\"https://furlio.au/wp-includes/js/dist/plugins.min.js?ver=039ed87b5b9f7036ceee\";s:2:\"as\";s:6:\"script\";}i:47;a:2:{s:4:\"href\";s:82:\"https://furlio.au/wp-includes/js/dist/wordcount.min.js?ver=c5b97f11206928ea9130\";s:2:\"as\";s:6:\"script\";}}}s:7:\"version\";a:3:{s:11:\"woocommerce\";s:6:\"10.7.0\";s:9:\"wordpress\";s:5:\"6.9.4\";s:8:\"site_url\";s:20:\"https://furlio.au\";}}','off'),
(1372,'_transient_wc_blocks_query_5363a57d92ddac380bcea0733b79eaad','a:2:{s:7:\"version\";s:10:\"1777080315\";s:5:\"value\";a:4:{i:0;i:64;i:1;i:61;i:2;i:46;i:3;i:45;}}','off'),
(1373,'_transient_is_multi_author','0','on');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(2,3,'_wp_page_template','default'),
(3,5,'_wp_attached_file','woocommerce-placeholder.webp'),
(4,5,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:28:\"woocommerce-placeholder.webp\";s:8:\"filesize\";i:9892;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-300x300.webp\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:1486;}s:5:\"large\";a:5:{s:4:\"file\";s:38:\"woocommerce-placeholder-1024x1024.webp\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:4924;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:962;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-768x768.webp\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:3434;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5,11,'_form','<label> Your name\n    [text* your-name autocomplete:name] </label>\n\n<label> Your email\n    [email* your-email autocomplete:email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]'),
(6,11,'_mail','a:8:{s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:37:\"[_site_title] <dsightstech@gmail.com>\";s:4:\"body\";s:191:\"From: [your-name] [your-email]\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis is a notification that a contact form was submitted on your website ([_site_title] [_site_url]).\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(7,11,'_mail_2','a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:37:\"[_site_title] <dsightstech@gmail.com>\";s:4:\"body\";s:220:\"Message Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(8,11,'_messages','a:12:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:27:\"Please fill out this field.\";s:16:\"invalid_too_long\";s:32:\"This field has a too long input.\";s:17:\"invalid_too_short\";s:33:\"This field has a too short input.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:31:\"The uploaded file is too large.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";}'),
(9,11,'_additional_settings',''),
(10,11,'_locale','en_AU'),
(11,11,'_hash','96f1966ed78829e2cc8fe3d08319c02f4ad5d5a22bac205f993d01277a0b0f30'),
(52,28,'_menu_item_type','post_type'),
(53,28,'_menu_item_menu_item_parent','0'),
(54,28,'_menu_item_object_id','10'),
(55,28,'_menu_item_object','page'),
(56,28,'_menu_item_target',''),
(57,28,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(58,28,'_menu_item_xfn',''),
(59,28,'_menu_item_url',''),
(60,29,'_menu_item_type','post_type'),
(61,29,'_menu_item_menu_item_parent','0'),
(62,29,'_menu_item_object_id','3'),
(63,29,'_menu_item_object','page'),
(64,29,'_menu_item_target',''),
(65,29,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(66,29,'_menu_item_xfn',''),
(67,29,'_menu_item_url',''),
(68,30,'_menu_item_type','post_type'),
(69,30,'_menu_item_menu_item_parent','0'),
(70,30,'_menu_item_object_id','17'),
(71,30,'_menu_item_object','page'),
(72,30,'_menu_item_target',''),
(73,30,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(74,30,'_menu_item_xfn',''),
(75,30,'_menu_item_url',''),
(76,31,'_menu_item_type','post_type'),
(77,31,'_menu_item_menu_item_parent','0'),
(78,31,'_menu_item_object_id','15'),
(79,31,'_menu_item_object','page'),
(80,31,'_menu_item_target',''),
(81,31,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(82,31,'_menu_item_xfn',''),
(83,31,'_menu_item_url',''),
(84,32,'_menu_item_type','post_type'),
(85,32,'_menu_item_menu_item_parent','0'),
(86,32,'_menu_item_object_id','16'),
(87,32,'_menu_item_object','page'),
(88,32,'_menu_item_target',''),
(89,32,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(90,32,'_menu_item_xfn',''),
(91,32,'_menu_item_url',''),
(100,41,'_sku','APC-DOG-BED-OMF-001'),
(101,41,'_regular_price','71.45'),
(102,41,'total_sales','0'),
(103,41,'_tax_status','taxable'),
(104,41,'_tax_class',''),
(105,41,'_manage_stock','no'),
(106,41,'_backorders','no'),
(107,41,'_sold_individually','no'),
(108,41,'_virtual','no'),
(109,41,'_downloadable','no'),
(110,41,'_download_limit','-1'),
(111,41,'_download_expiry','-1'),
(112,41,'_stock',NULL),
(113,41,'_stock_status','instock'),
(114,41,'_wc_average_rating','0'),
(115,41,'_wc_review_count','0'),
(116,41,'_product_version','10.7.0'),
(117,41,'_price','71.45'),
(118,41,'_yoast_wpseo_title','Orthopedic Memory Foam Dog Bed | Furlio'),
(119,41,'_yoast_wpseo_metadesc','Shop the best orthopedic memory foam dog bed in Australia. Washable cover, non-slip base & fast Aussie shipping. Perfect for dogs of all sizes. Buy now!'),
(120,42,'_sku','APC-CAT-TOY-FWD-002'),
(121,42,'_regular_price','19.75'),
(122,42,'total_sales','0'),
(123,42,'_tax_status','taxable'),
(124,42,'_tax_class',''),
(125,42,'_manage_stock','no'),
(126,42,'_backorders','no'),
(127,42,'_sold_individually','no'),
(128,42,'_virtual','no'),
(129,42,'_downloadable','no'),
(130,42,'_download_limit','-1'),
(131,42,'_download_expiry','-1'),
(132,42,'_stock',NULL),
(133,42,'_stock_status','instock'),
(134,42,'_wc_average_rating','0'),
(135,42,'_wc_review_count','0'),
(136,42,'_product_version','10.7.0'),
(137,42,'_price','19.75'),
(138,42,'_yoast_wpseo_title','Interactive Feather Wand Cat Toy Australia | Furlio'),
(139,42,'_yoast_wpseo_metadesc','Australia\'s favourite interactive feather wand cat toy. Stimulates hunting instinct, reduces boredom & ships fast across straya. Shop Furlio today!'),
(140,43,'_sku','APC-DOG-BWL-SSF-003'),
(141,43,'_regular_price','29.65'),
(142,43,'total_sales','0'),
(143,43,'_tax_status','taxable'),
(144,43,'_tax_class',''),
(145,43,'_manage_stock','no'),
(146,43,'_backorders','no'),
(147,43,'_sold_individually','no'),
(148,43,'_virtual','no'),
(149,43,'_downloadable','no'),
(150,43,'_download_limit','-1'),
(151,43,'_download_expiry','-1'),
(152,43,'_stock',NULL),
(153,43,'_stock_status','instock'),
(154,43,'_wc_average_rating','0'),
(155,43,'_wc_review_count','0'),
(156,43,'_product_version','10.7.0'),
(157,43,'_price','29.65'),
(158,43,'_yoast_wpseo_title','Stainless Steel Slow Feeder Dog Bowl Australia | Furlio'),
(159,43,'_yoast_wpseo_metadesc','Vet-recommended slow feeder dog bowl in stainless steel. Reduces bloat risk, dishwasher safe & fast Aussie shipping. Shop Furlio now!'),
(160,44,'_sku','APC-GRM-BRS-SCL-004'),
(161,44,'_regular_price','27.45'),
(162,44,'total_sales','0'),
(163,44,'_tax_status','taxable'),
(164,44,'_tax_class',''),
(165,44,'_manage_stock','no'),
(166,44,'_backorders','no'),
(167,44,'_sold_individually','no'),
(168,44,'_virtual','no'),
(169,44,'_downloadable','no'),
(170,44,'_download_limit','-1'),
(171,44,'_download_expiry','-1'),
(172,44,'_stock',NULL),
(173,44,'_stock_status','instock'),
(174,44,'_wc_average_rating','0'),
(175,44,'_wc_review_count','0'),
(176,44,'_product_version','10.7.0'),
(177,44,'_price','27.45'),
(178,44,'_yoast_wpseo_title','Self-Cleaning Slicker Brush Dogs & Cats Australia | Furlio'),
(179,44,'_yoast_wpseo_metadesc','Australia\'s easiest pet grooming brush with self-cleaning button. Removes loose fur, detangles & ships fast across straya. Shop Furlio today!'),
(180,45,'_sku','APC-BRD-SWG-BDG-005'),
(181,45,'_regular_price','17.55'),
(182,45,'total_sales','0'),
(183,45,'_tax_status','taxable'),
(184,45,'_tax_class',''),
(185,45,'_manage_stock','no'),
(186,45,'_backorders','no'),
(187,45,'_sold_individually','no'),
(188,45,'_virtual','no'),
(189,45,'_downloadable','no'),
(190,45,'_download_limit','-1'),
(191,45,'_download_expiry','-1'),
(192,45,'_stock',NULL),
(193,45,'_stock_status','instock'),
(194,45,'_wc_average_rating','0'),
(195,45,'_wc_review_count','0'),
(196,45,'_product_version','10.7.0'),
(197,45,'_price','17.55'),
(198,45,'_yoast_wpseo_title','Hanging Budgie Bird Swing Perch Australia | Furlio'),
(199,45,'_yoast_wpseo_metadesc','Natural wood budgie swing perch with colourful beads. Bird-safe, easy to install & ships fast across Australia. Shop Furlio for happy birds!'),
(200,46,'_sku','APC-SML-TUN-GPH-006'),
(201,46,'_regular_price','31.85'),
(202,46,'total_sales','0'),
(203,46,'_tax_status','taxable'),
(204,46,'_tax_class',''),
(205,46,'_manage_stock','no'),
(206,46,'_backorders','no'),
(207,46,'_sold_individually','no'),
(208,46,'_virtual','no'),
(209,46,'_downloadable','no'),
(210,46,'_download_limit','-1'),
(211,46,'_download_expiry','-1'),
(212,46,'_stock',NULL),
(213,46,'_stock_status','instock'),
(214,46,'_wc_average_rating','0'),
(215,46,'_wc_review_count','0'),
(216,46,'_product_version','10.7.0'),
(217,46,'_price','31.85'),
(218,46,'_yoast_wpseo_title','Guinea Pig Hideout Tunnel Toy Australia | Furlio'),
(219,46,'_yoast_wpseo_metadesc','Natural seagrass guinea pig hideout tunnel – edible, eco-friendly & enriching. Fast Aussie shipping. Perfect for small animals. Shop Furlio now!'),
(220,47,'_wp_attached_file','2026/04/product-pet-46.jpg'),
(221,47,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:26:\"2026/04/product-pet-46.jpg\";s:8:\"filesize\";i:126099;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"product-pet-46-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22046;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-46-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8096;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"product-pet-46-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121524;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"product-pet-46-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28420;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"product-pet-46-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78913;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-46-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:24:\"product-pet-46-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1414;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:26:\"product-pet-46-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(222,46,'_thumbnail_id','47'),
(223,48,'_wp_attached_file','2026/04/product-pet-45.jpg'),
(224,48,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:26:\"2026/04/product-pet-45.jpg\";s:8:\"filesize\";i:126099;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"product-pet-45-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22046;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-45-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8096;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"product-pet-45-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121524;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"product-pet-45-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28420;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"product-pet-45-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78913;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-45-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:24:\"product-pet-45-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1414;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:26:\"product-pet-45-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(225,45,'_thumbnail_id','48'),
(226,49,'_wp_attached_file','2026/04/product-pet-44.jpg'),
(227,49,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:26:\"2026/04/product-pet-44.jpg\";s:8:\"filesize\";i:126099;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"product-pet-44-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22046;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-44-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8096;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"product-pet-44-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121524;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"product-pet-44-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28420;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"product-pet-44-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78913;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-44-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:24:\"product-pet-44-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1414;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:26:\"product-pet-44-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(228,44,'_thumbnail_id','49'),
(229,50,'_wp_attached_file','2026/04/product-pet-43.jpg'),
(230,50,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:26:\"2026/04/product-pet-43.jpg\";s:8:\"filesize\";i:126099;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"product-pet-43-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22046;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-43-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8096;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"product-pet-43-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121524;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"product-pet-43-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28420;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"product-pet-43-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78913;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-43-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:24:\"product-pet-43-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1414;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:26:\"product-pet-43-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(231,43,'_thumbnail_id','50'),
(232,51,'_wp_attached_file','2026/04/product-pet-42.jpg'),
(233,51,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:26:\"2026/04/product-pet-42.jpg\";s:8:\"filesize\";i:126099;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"product-pet-42-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22046;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-42-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8096;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"product-pet-42-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121524;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"product-pet-42-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28420;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"product-pet-42-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78913;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-42-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:24:\"product-pet-42-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1414;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:26:\"product-pet-42-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(234,42,'_thumbnail_id','51'),
(235,52,'_wp_attached_file','2026/04/product-pet-41.jpg'),
(236,52,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:26:\"2026/04/product-pet-41.jpg\";s:8:\"filesize\";i:126099;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:26:\"product-pet-41-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22046;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-41-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8096;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:26:\"product-pet-41-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121524;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:26:\"product-pet-41-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28420;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:26:\"product-pet-41-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:78913;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:26:\"product-pet-41-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:24:\"product-pet-41-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1414;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:26:\"product-pet-41-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3931;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(237,41,'_thumbnail_id','52'),
(238,25,'_astra_is_disable_page_title','1'),
(239,25,'_wp_page_template','page-fullwidth.php'),
(240,25,'site-post-title','disabled'),
(241,25,'astra-content-layout','fullwidth'),
(242,25,'astra-site-content-layout','fullwidth'),
(243,25,'ast-site-content-layout','full-width-container'),
(244,25,'site-sidebar-layout','no-sidebar'),
(253,60,'_wp_attached_file','2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg'),
(254,60,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:400;s:4:\"file\";s:43:\"2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg\";s:8:\"filesize\";i:23829;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:43:\"71CPMTTpPcL._AC_UL600_SR600400_-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8909;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:43:\"71CPMTTpPcL._AC_UL600_SR600400_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5477;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:43:\"71CPMTTpPcL._AC_UL600_SR600400_-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16895;s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:43:\"71CPMTTpPcL._AC_UL600_SR600400_-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2973;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:41:\"71CPMTTpPcL._AC_UL600_SR600400_-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1204;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:43:\"71CPMTTpPcL._AC_UL600_SR600400_-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2973;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(255,61,'_regular_price','27.5'),
(256,61,'total_sales','0'),
(257,61,'_tax_status','taxable'),
(258,61,'_tax_class',''),
(259,61,'_manage_stock','no'),
(260,61,'_backorders','no'),
(261,61,'_sold_individually','no'),
(262,61,'_virtual','no'),
(263,61,'_downloadable','no'),
(264,61,'_download_limit','-1'),
(265,61,'_download_expiry','-1'),
(266,61,'_thumbnail_id','60'),
(267,61,'_stock',NULL),
(268,61,'_stock_status','instock'),
(269,61,'_wc_average_rating','0'),
(270,61,'_wc_review_count','0'),
(271,61,'_product_version','10.7.0'),
(272,61,'_price','27.5'),
(273,61,'_yoast_wpseo_title','POOWEE! Lavender Cat Litter 15kg – Clumping & Odour Control'),
(274,61,'_yoast_wpseo_metadesc','POOWEE! Lavender Cat Litter 15kg – clumping, scoopable & odour-neutralising. #1 on Amazon AU. Fast Aussie shipping. Shop now at Furlio!'),
(277,63,'_wp_attached_file','2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg'),
(278,63,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:400;s:4:\"file\";s:43:\"2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg\";s:8:\"filesize\";i:17898;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:43:\"81gLdCfhJgL._AC_UL600_SR600400_-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6978;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:43:\"81gLdCfhJgL._AC_UL600_SR600400_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4400;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:43:\"81gLdCfhJgL._AC_UL600_SR600400_-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13006;s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:43:\"81gLdCfhJgL._AC_UL600_SR600400_-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2490;}s:29:\"variation_swatches_image_size\";a:5:{s:4:\"file\";s:41:\"81gLdCfhJgL._AC_UL600_SR600400_-50x50.jpg\";s:5:\"width\";i:50;s:6:\"height\";i:50;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1043;}s:31:\"variation_swatches_tooltip_size\";a:5:{s:4:\"file\";s:43:\"81gLdCfhJgL._AC_UL600_SR600400_-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2490;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(279,64,'_regular_price','20.86'),
(280,64,'total_sales','0'),
(281,64,'_tax_status','taxable'),
(282,64,'_tax_class',''),
(283,64,'_manage_stock','no'),
(284,64,'_backorders','no'),
(285,64,'_sold_individually','no'),
(286,64,'_virtual','no'),
(287,64,'_downloadable','no'),
(288,64,'_download_limit','-1'),
(289,64,'_download_expiry','-1'),
(290,64,'_thumbnail_id','63'),
(291,64,'_stock',NULL),
(292,64,'_stock_status','instock'),
(293,64,'_wc_average_rating','0'),
(294,64,'_wc_review_count','0'),
(295,64,'_product_version','10.7.0'),
(296,64,'_price','20.86'),
(297,64,'_yoast_wpseo_title','Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU'),
(298,64,'_yoast_wpseo_metadesc','Shop Breeders Choice 99% Recycled Paper Cat Litter 15L. Eco-friendly, low dust & highly absorbent. Fast 2–5 day shipping across Australia. 4.6 stars!'),
(301,67,'_menu_item_type','post_type'),
(302,67,'_menu_item_menu_item_parent','0'),
(303,67,'_menu_item_object_id','25'),
(304,67,'_menu_item_object','page'),
(305,67,'_menu_item_target',''),
(306,67,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(307,67,'_menu_item_xfn',''),
(308,67,'_menu_item_url',''),
(309,68,'_menu_item_type','post_type'),
(310,68,'_menu_item_menu_item_parent','0'),
(311,68,'_menu_item_object_id','6'),
(312,68,'_menu_item_object','page'),
(313,68,'_menu_item_target',''),
(314,68,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(315,68,'_menu_item_xfn',''),
(316,68,'_menu_item_url',''),
(317,69,'_menu_item_type','post_type'),
(318,69,'_menu_item_menu_item_parent','0'),
(319,69,'_menu_item_object_id','14'),
(320,69,'_menu_item_object','page'),
(321,69,'_menu_item_target',''),
(322,69,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(323,69,'_menu_item_xfn',''),
(324,69,'_menu_item_url',''),
(325,70,'_menu_item_type','post_type'),
(326,70,'_menu_item_menu_item_parent','0'),
(327,70,'_menu_item_object_id','15'),
(328,70,'_menu_item_object','page'),
(329,70,'_menu_item_target',''),
(330,70,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(331,70,'_menu_item_xfn',''),
(332,70,'_menu_item_url','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(1,1,'2026-04-18 21:31:49','2026-04-18 11:31:49','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2026-04-18 21:31:49','2026-04-18 11:31:49','',0,'https://furlio.au/?p=1',0,'post','',1),
(3,1,'2026-04-18 21:31:49','2026-04-18 11:31:49','<!-- wp:html -->\n<style>\n.ap-legal { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-legal h1 { font-family:\"Playfair Display\",serif; font-size:clamp(26px,4vw,38px); font-weight:700; color:#1F2937; margin:0 0 8px; }\n.ap-legal-date { font-size:13px; color:#9CA3AF; margin:0 0 40px; }\n.ap-legal h2 { font-family:\"Playfair Display\",serif; font-size:20px; font-weight:700; color:#1F2937; margin:32px 0 12px; border-left:3px solid #2E86AB; padding-left:12px; }\n.ap-legal p, .ap-legal li { font-size:14px; color:#4B5563; line-height:1.9; margin:0 0 12px; }\n.ap-legal ul { padding-left:20px; }\n.ap-legal a { color:#2E86AB; }\n@media(max-width:600px){ .ap-legal { padding:40px 20px; } }\n</style>\n<div class=\"ap-legal\">\n  <h1>Privacy Policy</h1>\n  <p class=\"ap-legal-date\">Last updated: April 2026</p>\n\n  <p>Furlio (\"<strong>we</strong>\", \"<strong>us</strong>\", \"<strong>our</strong>\") is committed to protecting your privacy in accordance with the Australian Privacy Act 1988 (Cth) and the Australian Privacy Principles (APPs). This policy explains how we collect, use, and protect your personal information.</p>\n\n  <h2>1. Information We Collect</h2>\n  <p>We collect personal information you provide when you:</p>\n  <ul>\n    <li>Place an order (name, email, phone, delivery address, payment details)</li>\n    <li>Create an account or subscribe to our newsletter</li>\n    <li>Contact us via email or our contact form</li>\n    <li>Browse our website (IP address, browser type, pages visited, via cookies)</li>\n  </ul>\n\n  <h2>2. How We Use Your Information</h2>\n  <ul>\n    <li>Process and fulfil your orders</li>\n    <li>Send order confirmations, tracking updates, and receipts</li>\n    <li>Respond to enquiries and provide customer support</li>\n    <li>Send marketing emails (only with your consent — you may unsubscribe at any time)</li>\n    <li>Improve our website and services</li>\n    <li>Comply with legal obligations</li>\n  </ul>\n\n  <h2>3. Payment Security</h2>\n  <p>We do not store your credit card details. All payments are processed by Stripe, a PCI DSS Level 1 certified payment provider. Your card details are encrypted and never accessible to us.</p>\n\n  <h2>4. Sharing Your Information</h2>\n  <p>We do not sell your personal information. We share information only with trusted third parties necessary to operate our business:</p>\n  <ul>\n    <li><strong>Shipping carriers</strong> (Australia Post, CouriersPlease) — to deliver your orders</li>\n    <li><strong>Stripe / PayPal</strong> — to process payments securely</li>\n    <li><strong>Mailchimp</strong> — for email marketing (only if you have subscribed)</li>\n    <li><strong>Google Analytics</strong> — anonymous website traffic analysis</li>\n  </ul>\n\n  <h2>5. Cookies</h2>\n  <p>Our website uses cookies to remember your cart, preferences, and browsing session. You may disable cookies in your browser settings, though this may affect website functionality.</p>\n\n  <h2>6. Your Rights</h2>\n  <p>Under Australian privacy law you have the right to access, correct, or request deletion of your personal information. To exercise these rights, contact us at <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a>.</p>\n\n  <h2>7. Data Retention</h2>\n  <p>We retain your personal information for as long as needed to fulfil orders and comply with legal obligations (generally 7 years for financial records as required by Australian law).</p>\n\n  <h2>8. Contact</h2>\n  <p>For any privacy enquiries, please contact:<br>\n  <strong>Furlio</strong><br>\n  Email: <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a></p>\n</div>\n<!-- /wp:html -->','Privacy Policy','','publish','closed','open','','privacy-policy','','','2026-04-19 18:31:22','2026-04-19 08:31:22','',0,'https://furlio.au/?page_id=3',0,'page','',0),
(4,0,'2026-04-18 21:31:50','2026-04-18 11:31:50','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2026-04-18 21:31:50','2026-04-18 11:31:50','',0,'https://furlio.au/index.php/2026/04/18/navigation/',0,'wp_navigation','',0),
(5,0,'2026-04-18 21:32:07','2026-04-18 11:32:07','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder','','','2026-04-18 21:32:07','2026-04-18 11:32:07','',0,'https://furlio.au/wp-content/uploads/2026/04/woocommerce-placeholder.webp',0,'attachment','image/webp',0),
(6,1,'2026-04-18 21:32:07','2026-04-18 11:32:07','','Shop','','publish','closed','closed','','shop','','','2026-04-18 21:32:07','2026-04-18 11:32:07','',0,'https://furlio.au/index.php/shop/',0,'page','',0),
(7,1,'2026-04-18 21:32:07','2026-04-18 11:32:07','<!-- wp:woocommerce/cart -->\n<div class=\"wp-block-woocommerce-cart alignwide is-loading\"><!-- wp:woocommerce/filled-cart-block -->\n<div class=\"wp-block-woocommerce-filled-cart-block\"><!-- wp:woocommerce/cart-items-block -->\n<div class=\"wp-block-woocommerce-cart-items-block\"><!-- wp:woocommerce/cart-line-items-block -->\n<div class=\"wp-block-woocommerce-cart-line-items-block\"></div>\n<!-- /wp:woocommerce/cart-line-items-block -->\n\n<!-- wp:woocommerce/product-collection {\"queryId\":0,\"query\":{\"perPage\":3,\"pages\":1,\"offset\":0,\"postType\":\"product\",\"order\":\"asc\",\"orderBy\":\"title\",\"search\":\"\",\"exclude\":[],\"inherit\":false,\"taxQuery\":{},\"isProductCollectionBlock\":true,\"featured\":false,\"woocommerceOnSale\":false,\"woocommerceStockStatus\":[\"instock\",\"outofstock\",\"onbackorder\"],\"woocommerceAttributes\":[],\"woocommerceHandPickedProducts\":[],\"filterable\":false,\"relatedBy\":{\"categories\":true,\"tags\":true}},\"tagName\":\"div\",\"displayLayout\":{\"type\":\"flex\",\"columns\":3,\"shrinkColumns\":true},\"dimensions\":{\"widthType\":\"fill\"},\"collection\":\"woocommerce/product-collection/cross-sells\",\"hideControls\":[\"filterable\"],\"queryContextIncludes\":[\"collection\"],\"__privatePreviewState\":{\"isPreview\":true,\"previewMessage\":\"Actual products will vary depending on the page being viewed.\"}} -->\n<div class=\"wp-block-woocommerce-product-collection\"><!-- wp:heading {\"textAlign\":\"left\",\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"1rem\"}}}} -->\n<h2 class=\"wp-block-heading has-text-align-left\" style=\"margin-bottom:1rem\">You may be interested in&hellip;</h2>\n\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-template -->\n<!-- wp:woocommerce/product-image {\"showSaleBadge\":false,\"imageSizing\":\"thumbnail\",\"isDescendentOfQueryLoop\":true} -->\n<!-- wp:woocommerce/product-sale-badge {\"align\":\"right\"} /-->\n<!-- /wp:woocommerce/product-image -->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"isLink\":true,\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"0.75rem\",\"top\":\"0\"}},\"typography\":{\"lineHeight\":\"1.4\"}},\"fontSize\":\"medium\",\"__woocommerceNamespace\":\"woocommerce/product-collection/product-title\"} /-->\n\n<!-- wp:woocommerce/product-price {\"isDescendentOfQueryLoop\":true,\"textAlign\":\"center\",\"fontSize\":\"small\"} /-->\n\n<!-- wp:woocommerce/product-button {\"textAlign\":\"center\",\"isDescendentOfQueryLoop\":true,\"fontSize\":\"small\"} /-->\n<!-- /wp:woocommerce/product-template --></div>\n<!-- /wp:woocommerce/product-collection --></div>\n\n<!-- /wp:woocommerce/cart-items-block -->\n\n<!-- wp:woocommerce/cart-totals-block -->\n<div class=\"wp-block-woocommerce-cart-totals-block\"><!-- wp:woocommerce/cart-order-summary-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-block\"><!-- wp:woocommerce/cart-order-summary-heading-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-heading-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-heading-block -->\n\n<!-- wp:woocommerce/cart-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/cart-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/cart-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-fee-block -->\n\n<!-- wp:woocommerce/cart-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-discount-block -->\n\n<!-- wp:woocommerce/cart-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/cart-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/cart-order-summary-block -->\n\n<!-- wp:woocommerce/cart-express-payment-block -->\n<div class=\"wp-block-woocommerce-cart-express-payment-block\"></div>\n<!-- /wp:woocommerce/cart-express-payment-block -->\n\n<!-- wp:woocommerce/proceed-to-checkout-block -->\n<div class=\"wp-block-woocommerce-proceed-to-checkout-block\"></div>\n<!-- /wp:woocommerce/proceed-to-checkout-block -->\n\n<!-- wp:woocommerce/cart-accepted-payment-methods-block -->\n<div class=\"wp-block-woocommerce-cart-accepted-payment-methods-block\"></div>\n<!-- /wp:woocommerce/cart-accepted-payment-methods-block --></div>\n<!-- /wp:woocommerce/cart-totals-block --></div>\n<!-- /wp:woocommerce/filled-cart-block -->\n\n<!-- wp:woocommerce/empty-cart-block -->\n<div class=\"wp-block-woocommerce-empty-cart-block\"><!-- wp:heading {\"textAlign\":\"center\",\"className\":\"with-empty-cart-icon wc-block-cart__empty-cart__title\"} -->\n<h2 class=\"wp-block-heading has-text-align-center with-empty-cart-icon wc-block-cart__empty-cart__title\">Your cart is currently empty!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator {\"className\":\"is-style-dots\"} -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity is-style-dots\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"textAlign\":\"center\"} -->\n<h2 class=\"wp-block-heading has-text-align-center\">New in store</h2>\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-new {\"columns\":4,\"rows\":1} /--></div>\n<!-- /wp:woocommerce/empty-cart-block --></div>\n<!-- /wp:woocommerce/cart -->','Cart','','publish','closed','closed','','cart','','','2026-04-18 23:31:30','2026-04-18 13:31:30','',0,'https://furlio.au/index.php/cart/',0,'page','',0),
(8,1,'2026-04-18 21:32:07','2026-04-18 11:32:07','<!-- wp:woocommerce/checkout -->\n<div class=\"wp-block-woocommerce-checkout alignwide wc-block-checkout is-loading\"><!-- wp:woocommerce/checkout-fields-block -->\n<div class=\"wp-block-woocommerce-checkout-fields-block\"><!-- wp:woocommerce/checkout-express-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-express-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-express-payment-block -->\n\n<!-- wp:woocommerce/checkout-contact-information-block -->\n<div class=\"wp-block-woocommerce-checkout-contact-information-block\"></div>\n<!-- /wp:woocommerce/checkout-contact-information-block -->\n\n<!-- wp:woocommerce/checkout-shipping-method-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-method-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-method-block -->\n\n<!-- wp:woocommerce/checkout-pickup-options-block -->\n<div class=\"wp-block-woocommerce-checkout-pickup-options-block\"></div>\n<!-- /wp:woocommerce/checkout-pickup-options-block -->\n\n<!-- wp:woocommerce/checkout-shipping-address-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-address-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-address-block -->\n\n<!-- wp:woocommerce/checkout-billing-address-block -->\n<div class=\"wp-block-woocommerce-checkout-billing-address-block\"></div>\n<!-- /wp:woocommerce/checkout-billing-address-block -->\n\n<!-- wp:woocommerce/checkout-shipping-methods-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-methods-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-methods-block -->\n\n<!-- wp:woocommerce/checkout-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-payment-block -->\n\n<!-- wp:woocommerce/checkout-additional-information-block -->\n<div class=\"wp-block-woocommerce-checkout-additional-information-block\"></div>\n<!-- /wp:woocommerce/checkout-additional-information-block -->\n\n<!-- wp:woocommerce/checkout-order-note-block -->\n<div class=\"wp-block-woocommerce-checkout-order-note-block\"></div>\n<!-- /wp:woocommerce/checkout-order-note-block -->\n\n<!-- wp:woocommerce/checkout-terms-block -->\n<div class=\"wp-block-woocommerce-checkout-terms-block\"></div>\n<!-- /wp:woocommerce/checkout-terms-block -->\n\n<!-- wp:woocommerce/checkout-actions-block -->\n<div class=\"wp-block-woocommerce-checkout-actions-block\"></div>\n<!-- /wp:woocommerce/checkout-actions-block --></div>\n<!-- /wp:woocommerce/checkout-fields-block -->\n\n<!-- wp:woocommerce/checkout-totals-block -->\n<div class=\"wp-block-woocommerce-checkout-totals-block\"><!-- wp:woocommerce/checkout-order-summary-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-block\"><!-- wp:woocommerce/checkout-order-summary-cart-items-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-cart-items-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-cart-items-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-fee-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-discount-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/checkout-order-summary-block --></div>\n<!-- /wp:woocommerce/checkout-totals-block --></div>\n<!-- /wp:woocommerce/checkout -->','Checkout','','publish','closed','closed','','checkout','','','2026-04-18 21:32:07','2026-04-18 11:32:07','',0,'https://furlio.au/index.php/checkout/',0,'page','',0),
(9,1,'2026-04-18 21:32:07','2026-04-18 11:32:07','<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->','My account','','publish','closed','closed','','my-account','','','2026-04-18 21:32:07','2026-04-18 11:32:07','',0,'https://furlio.au/index.php/my-account/',0,'page','',0),
(10,1,'2026-04-18 23:33:42','2026-04-18 13:33:42','<!-- wp:html -->\n<style>\n.ap-legal { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-legal h1 { font-family:\"Playfair Display\",serif; font-size:clamp(26px,4vw,38px); font-weight:700; color:#1F2937; margin:0 0 8px; }\n.ap-legal-date { font-size:13px; color:#9CA3AF; margin:0 0 40px; }\n.ap-legal h2 { font-family:\"Playfair Display\",serif; font-size:20px; font-weight:700; color:#1F2937; margin:32px 0 12px; border-left:3px solid #FF6B35; padding-left:12px; }\n.ap-legal p, .ap-legal li { font-size:14px; color:#4B5563; line-height:1.9; margin:0 0 12px; }\n.ap-legal ul { padding-left:20px; }\n.ap-legal a { color:#2E86AB; }\n.ap-legal-highlight { background:#FFF9F2; border-radius:12px; padding:24px; margin:24px 0; border:1px solid #fcefd9; }\n.ap-legal-highlight p { margin:0; font-weight:600; color:#1F2937; }\n@media(max-width:600px){ .ap-legal { padding:40px 20px; } }\n</style>\n<div class=\"ap-legal\">\n  <h1>Refund &amp; Returns Policy</h1>\n  <p class=\"ap-legal-date\">Last updated: April 2026</p>\n\n  <div class=\"ap-legal-highlight\">\n    <p>🐾 &nbsp;We want you (and your pet!) to be 100% happy. If you are not satisfied with your order for any reason, we will make it right.</p>\n  </div>\n\n  <h2>Returns Window</h2>\n  <p>You may return most items within <strong>30 days of delivery</strong>. Items must be:</p>\n  <ul>\n    <li>Unused and in original condition</li>\n    <li>In original packaging with all tags and accessories included</li>\n    <li>Accompanied by proof of purchase (order number or receipt)</li>\n  </ul>\n\n  <h2>Non-Returnable Items</h2>\n  <ul>\n    <li>Perishable products (food, treats) once opened</li>\n    <li>Personalised or custom-made items</li>\n    <li>Hygiene products (beds, bowls) once used</li>\n    <li>Items returned more than 30 days after delivery</li>\n  </ul>\n\n  <h2>How to Start a Return</h2>\n  <p>Email us at <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a> with:</p>\n  <ul>\n    <li>Your order number</li>\n    <li>The item(s) you wish to return</li>\n    <li>The reason for the return</li>\n  </ul>\n  <p>We will respond within 1 business day with a return label and instructions.</p>\n\n  <h2>Damaged or Incorrect Items</h2>\n  <p>If your item arrived damaged or we sent the wrong product, please contact us within <strong>7 days of delivery</strong> with a photo. We will send a replacement or issue a full refund immediately — no return required.</p>\n\n  <h2>Refund Processing</h2>\n  <ul>\n    <li>Refunds are processed within <strong>3–5 business days</strong> of receiving the returned item</li>\n    <li>Refunds are issued to your original payment method</li>\n    <li>Allow 5–10 business days for the refund to appear on your statement</li>\n    <li>Original shipping costs are non-refundable unless the return is due to our error</li>\n  </ul>\n\n  <h2>Exchanges</h2>\n  <p>We do not process direct exchanges. Please return the original item for a refund and place a new order for the replacement product.</p>\n\n  <h2>Questions?</h2>\n  <p>Contact our team at <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a> — Mon–Fri 9am–5pm AEST. We always reply within 24 hours.</p>\n</div>\n<!-- /wp:html -->','Refund and Returns Policy','','publish','closed','closed','','refund_returns','','','2026-04-19 18:31:42','2026-04-19 08:31:42','',0,'https://furlio.au/?page_id=10',0,'page','',0),
(11,0,'2026-04-18 21:32:56','2026-04-18 11:32:56','<label> Your name\n    [text* your-name autocomplete:name] </label>\n\n<label> Your email\n    [email* your-email autocomplete:email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]\n[_site_title] \"[your-subject]\"\n[_site_title] <dsightstech@gmail.com>\nFrom: [your-name] [your-email]\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis is a notification that a contact form was submitted on your website ([_site_title] [_site_url]).\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] \"[your-subject]\"\n[_site_title] <dsightstech@gmail.com>\nMessage Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nPlease fill out this field.\nThis field has a too long input.\nThis field has a too short input.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe uploaded file is too large.\nThere was an error uploading the file.','Contact form 1','','publish','closed','closed','','contact-form-1','','','2026-04-18 21:32:56','2026-04-18 11:32:56','',0,'https://furlio.au/?post_type=wpcf7_contact_form&p=11',0,'wpcf7_contact_form','',0),
(12,1,'2026-04-18 21:35:21','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2026-04-18 21:35:21','0000-00-00 00:00:00','',0,'https://furlio.au/?p=12',0,'post','',0),
(13,0,'2026-04-18 23:31:30','2026-04-18 13:31:30','<!-- wp:woocommerce/cart -->\n<div class=\"wp-block-woocommerce-cart alignwide is-loading\"><!-- wp:woocommerce/filled-cart-block -->\n<div class=\"wp-block-woocommerce-filled-cart-block\"><!-- wp:woocommerce/cart-items-block -->\n<div class=\"wp-block-woocommerce-cart-items-block\"><!-- wp:woocommerce/cart-line-items-block -->\n<div class=\"wp-block-woocommerce-cart-line-items-block\"></div>\n<!-- /wp:woocommerce/cart-line-items-block -->\n\n<!-- wp:woocommerce/product-collection {\"queryId\":0,\"query\":{\"perPage\":3,\"pages\":1,\"offset\":0,\"postType\":\"product\",\"order\":\"asc\",\"orderBy\":\"title\",\"search\":\"\",\"exclude\":[],\"inherit\":false,\"taxQuery\":{},\"isProductCollectionBlock\":true,\"featured\":false,\"woocommerceOnSale\":false,\"woocommerceStockStatus\":[\"instock\",\"outofstock\",\"onbackorder\"],\"woocommerceAttributes\":[],\"woocommerceHandPickedProducts\":[],\"filterable\":false,\"relatedBy\":{\"categories\":true,\"tags\":true}},\"tagName\":\"div\",\"displayLayout\":{\"type\":\"flex\",\"columns\":3,\"shrinkColumns\":true},\"dimensions\":{\"widthType\":\"fill\"},\"collection\":\"woocommerce/product-collection/cross-sells\",\"hideControls\":[\"filterable\"],\"queryContextIncludes\":[\"collection\"],\"__privatePreviewState\":{\"isPreview\":true,\"previewMessage\":\"Actual products will vary depending on the page being viewed.\"}} -->\n<div class=\"wp-block-woocommerce-product-collection\"><!-- wp:heading {\"textAlign\":\"left\",\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"1rem\"}}}} -->\n<h2 class=\"wp-block-heading has-text-align-left\" style=\"margin-bottom:1rem\">You may be interested in&hellip;</h2>\n\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-template -->\n<!-- wp:woocommerce/product-image {\"showSaleBadge\":false,\"imageSizing\":\"thumbnail\",\"isDescendentOfQueryLoop\":true} -->\n<!-- wp:woocommerce/product-sale-badge {\"align\":\"right\"} /-->\n<!-- /wp:woocommerce/product-image -->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"isLink\":true,\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"0.75rem\",\"top\":\"0\"}},\"typography\":{\"lineHeight\":\"1.4\"}},\"fontSize\":\"medium\",\"__woocommerceNamespace\":\"woocommerce/product-collection/product-title\"} /-->\n\n<!-- wp:woocommerce/product-price {\"isDescendentOfQueryLoop\":true,\"textAlign\":\"center\",\"fontSize\":\"small\"} /-->\n\n<!-- wp:woocommerce/product-button {\"textAlign\":\"center\",\"isDescendentOfQueryLoop\":true,\"fontSize\":\"small\"} /-->\n<!-- /wp:woocommerce/product-template --></div>\n<!-- /wp:woocommerce/product-collection --></div>\n\n<!-- /wp:woocommerce/cart-items-block -->\n\n<!-- wp:woocommerce/cart-totals-block -->\n<div class=\"wp-block-woocommerce-cart-totals-block\"><!-- wp:woocommerce/cart-order-summary-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-block\"><!-- wp:woocommerce/cart-order-summary-heading-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-heading-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-heading-block -->\n\n<!-- wp:woocommerce/cart-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/cart-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/cart-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-fee-block -->\n\n<!-- wp:woocommerce/cart-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-discount-block -->\n\n<!-- wp:woocommerce/cart-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/cart-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/cart-order-summary-block -->\n\n<!-- wp:woocommerce/cart-express-payment-block -->\n<div class=\"wp-block-woocommerce-cart-express-payment-block\"></div>\n<!-- /wp:woocommerce/cart-express-payment-block -->\n\n<!-- wp:woocommerce/proceed-to-checkout-block -->\n<div class=\"wp-block-woocommerce-proceed-to-checkout-block\"></div>\n<!-- /wp:woocommerce/proceed-to-checkout-block -->\n\n<!-- wp:woocommerce/cart-accepted-payment-methods-block -->\n<div class=\"wp-block-woocommerce-cart-accepted-payment-methods-block\"></div>\n<!-- /wp:woocommerce/cart-accepted-payment-methods-block --></div>\n<!-- /wp:woocommerce/cart-totals-block --></div>\n<!-- /wp:woocommerce/filled-cart-block -->\n\n<!-- wp:woocommerce/empty-cart-block -->\n<div class=\"wp-block-woocommerce-empty-cart-block\"><!-- wp:heading {\"textAlign\":\"center\",\"className\":\"with-empty-cart-icon wc-block-cart__empty-cart__title\"} -->\n<h2 class=\"wp-block-heading has-text-align-center with-empty-cart-icon wc-block-cart__empty-cart__title\">Your cart is currently empty!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator {\"className\":\"is-style-dots\"} -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity is-style-dots\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"textAlign\":\"center\"} -->\n<h2 class=\"wp-block-heading has-text-align-center\">New in store</h2>\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-new {\"columns\":4,\"rows\":1} /--></div>\n<!-- /wp:woocommerce/empty-cart-block --></div>\n<!-- /wp:woocommerce/cart -->','Cart','','inherit','closed','closed','','7-revision-v1','','','2026-04-18 23:31:30','2026-04-18 13:31:30','',7,'https://furlio.au/?p=13',0,'revision','',0),
(14,0,'2026-04-18 23:33:37','2026-04-18 13:33:37','<!-- wp:html -->\n<style>\n.ap-about { font-family:\"Nunito\",sans-serif; }\n.ap-about-hero {\n  background:linear-gradient(135deg, #0d4f6e 0%, #2E86AB 100%);\n  padding:80px 40px;\n  text-align:center;\n  color:#fff;\n}\n.ap-about-hero h1 {\n  font-family:\"Playfair Display\",serif;\n  font-size:clamp(32px,5vw,56px);\n  font-weight:700;\n  margin:0 0 16px;\n  color:#fff;\n}\n.ap-about-hero p { font-size:18px; color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; line-height:1.7; }\n.ap-about-body { max-width:900px; margin:0 auto; padding:60px 40px; }\n.ap-about-story { display:grid; grid-template-columns:1fr 1fr; gap:48px; align-items:center; margin-bottom:60px; }\n.ap-about-story-text h2 { font-family:\"Playfair Display\",serif; font-size:32px; font-weight:700; color:#1F2937; margin:0 0 16px; }\n.ap-about-story-text p { font-size:15px; color:#4B5563; line-height:1.8; margin:0 0 16px; }\n.ap-about-visual {\n  background:linear-gradient(135deg, #2E86AB, #1a5f7a);\n  border-radius:16px;\n  padding:48px 32px;\n  text-align:center;\n  color:#fff;\n}\n.ap-about-visual-icon { font-size:80px; margin-bottom:16px; display:block; }\n.ap-about-visual h3 { font-family:\"Playfair Display\",serif; font-size:24px; margin:0 0 8px; }\n.ap-about-visual p { font-size:14px; opacity:0.8; margin:0; }\n.ap-values { background:#FFF9F2; border-radius:16px; padding:48px; margin-bottom:60px; }\n.ap-values h2 { font-family:\"Playfair Display\",serif; font-size:28px; font-weight:700; color:#1F2937; margin:0 0 32px; text-align:center; }\n.ap-values-grid { display:grid; grid-template-columns:repeat(3,1fr); gap:24px; }\n.ap-value-card { text-align:center; padding:24px 16px; }\n.ap-value-icon { font-size:40px; display:block; margin-bottom:12px; }\n.ap-value-title { font-weight:700; color:#1F2937; font-size:16px; margin:0 0 8px; font-family:\"Playfair Display\",serif; }\n.ap-value-desc { font-size:13px; color:#6B7280; line-height:1.6; margin:0; }\n.ap-promise { background:linear-gradient(135deg, #FF6B35, #e85d2e); border-radius:16px; padding:48px; text-align:center; color:#fff; margin-bottom:60px; }\n.ap-promise h2 { font-family:\"Playfair Display\",serif; font-size:28px; margin:0 0 12px; }\n.ap-promise p { font-size:15px; opacity:0.9; max-width:560px; margin:0 auto 24px; line-height:1.7; }\n.ap-promise-btn { display:inline-block; background:#fff; color:#FF6B35; padding:14px 32px; border-radius:30px; font-weight:700; text-decoration:none; font-size:15px; }\n@media(max-width:700px){\n  .ap-about-story { grid-template-columns:1fr; }\n  .ap-values-grid { grid-template-columns:1fr; }\n  .ap-about-body { padding:40px 24px; }\n}\n</style>\n<div class=\"ap-about\">\n  <div class=\"ap-about-hero\">\n    <h1>About Furlio</h1>\n    <p>Built by pet lovers, for pet lovers. We exist to give every Aussie pet the premium care they deserve — at prices that make sense.</p>\n  </div>\n  <div class=\"ap-about-body\">\n    <div class=\"ap-about-story\">\n      <div class=\"ap-about-story-text\">\n        <h2>Our Story</h2>\n        <p>Furlio was started by a pair of dog-obsessed Australians who were tired of paying inflated prices for the same quality gear available overseas. We believed Aussie pets deserved better — and their owners deserved a fair deal.</p>\n        <p>We spent months sourcing the best pet products from trusted suppliers, testing them with our own animals, and building a store that puts the customer first. Today we ship premium pet supplies to every corner of Australia.</p>\n        <p>From the beaches of QLD to the bush of WA — every furry mate deserves the best.</p>\n      </div>\n      <div class=\"ap-about-visual\">\n        <span class=\"ap-about-visual-icon\">🐾</span>\n        <h3>Pets First. Always.</h3>\n        <p>Every product is chosen with your pet&apos;s health, comfort, and happiness in mind.</p>\n      </div>\n    </div>\n    <div class=\"ap-values\">\n      <h2>What We Stand For</h2>\n      <div class=\"ap-values-grid\">\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🏆</span>\n          <div class=\"ap-value-title\">Quality First</div>\n          <p class=\"ap-value-desc\">We only stock products we&apos;d use on our own pets. If it doesn&apos;t pass our test, it doesn&apos;t make the cut.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🚀</span>\n          <div class=\"ap-value-title\">Fast &amp; Reliable</div>\n          <p class=\"ap-value-desc\">Orders dispatched quickly with tracking on every parcel. You&apos;re always in the loop.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">💬</span>\n          <div class=\"ap-value-title\">Real Support</div>\n          <p class=\"ap-value-desc\">Talk to a real person who cares. We&apos;re here Mon–Fri 9am–5pm AEST and reply same day.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🌱</span>\n          <div class=\"ap-value-title\">Responsible Sourcing</div>\n          <p class=\"ap-value-desc\">We partner only with suppliers who meet our standards for animal welfare and product safety.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🔒</span>\n          <div class=\"ap-value-title\">Shop Safe</div>\n          <p class=\"ap-value-desc\">SSL-encrypted checkout, secure payments, and a 30-day no-fuss return policy.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🇦🇺</span>\n          <div class=\"ap-value-title\">Proudly Aussie</div>\n          <p class=\"ap-value-desc\">Australian owned and operated. We ship nationwide and understand what Aussie pet owners need.</p>\n        </div>\n      </div>\n    </div>\n    <div class=\"ap-promise\">\n      <h2>Our Promise to You</h2>\n      <p>If you&apos;re not 100% happy with your order, we&apos;ll make it right — no questions asked. That&apos;s the Furlio guarantee.</p>\n      <a href=\"/pet/shop/\" class=\"ap-promise-btn\">Shop Now →</a>\n    </div>\n  </div>\n</div>\n<!-- /wp:html -->','About Us','','publish','closed','closed','','about','','','2026-04-19 15:10:18','2026-04-19 05:10:18','',0,'https://furlio.au/about/',0,'page','',0),
(15,0,'2026-04-18 23:33:38','2026-04-18 13:33:38','<!-- wp:html -->\n<style>\n.ap-contact { font-family:\"Nunito\",sans-serif; }\n.ap-contact-hero { background:linear-gradient(135deg,#2E86AB,#1a5f7a); padding:60px 40px; text-align:center; color:#fff; }\n.ap-contact-hero h1 { font-family:\"Playfair Display\",serif; font-size:clamp(28px,4vw,42px); font-weight:700; margin:0 0 12px; color:#fff; }\n.ap-contact-hero p { font-size:16px; opacity:0.85; max-width:500px; margin:0 auto; }\n.ap-contact-body { max-width:900px; margin:0 auto; padding:60px 40px; display:grid; grid-template-columns:1fr 1fr; gap:48px; }\n.ap-contact-info h2 { font-family:\"Playfair Display\",serif; font-size:24px; font-weight:700; color:#1F2937; margin:0 0 20px; }\n.ap-contact-info-item { display:flex; gap:14px; align-items:flex-start; margin-bottom:24px; }\n.ap-contact-info-icon { width:44px; height:44px; background:#FFF9F2; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:20px; flex-shrink:0; }\n.ap-contact-info-text strong { display:block; color:#1F2937; font-size:14px; font-weight:700; margin-bottom:4px; }\n.ap-contact-info-text span { color:#6B7280; font-size:14px; line-height:1.6; }\n.ap-contact-info-text a { color:#2E86AB; text-decoration:none; }\n.ap-contact-form-wrap { background:#FFF9F2; border-radius:16px; padding:32px; }\n.ap-contact-form-wrap h2 { font-family:\"Playfair Display\",serif; font-size:22px; font-weight:700; color:#1F2937; margin:0 0 20px; }\n.wpcf7-form input[type=text], .wpcf7-form input[type=email], .wpcf7-form textarea {\n  width:100%; padding:12px 16px; border:2px solid #fcefd9; border-radius:8px; font-size:14px; font-family:\"Nunito\",sans-serif; box-sizing:border-box; margin-bottom:12px; background:#fff; color:#1F2937; outline:none; transition:border-color 0.2s;\n}\n.wpcf7-form input:focus, .wpcf7-form textarea:focus { border-color:#2E86AB; }\n.wpcf7-form input[type=submit] { background:#FF6B35; color:#fff; border:none; padding:14px 32px; border-radius:30px; font-weight:700; font-size:15px; font-family:\"Nunito\",sans-serif; cursor:pointer; width:100%; transition:background 0.2s; }\n.wpcf7-form input[type=submit]:hover { background:#e85d2e; }\n@media(max-width:700px){ .ap-contact-body { grid-template-columns:1fr; padding:40px 24px; } }\n</style>\n<div class=\"ap-contact\">\n  <div class=\"ap-contact-hero\">\n    <h1>Contact Us</h1>\n    <p>Got a question? We are here to help. Send us a message and we will get back to you within 24 hours.</p>\n  </div>\n  <div class=\"ap-contact-body\">\n    <div class=\"ap-contact-info\">\n      <h2>Get in Touch</h2>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">📧</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Email Us</strong>\n          <span><a href=\"mailto:hello@furlio.au\">hello@furlio.au</a><br>We reply within 24 hours</span>\n        </div>\n      </div>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">🕐</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Business Hours</strong>\n          <span>Monday – Friday<br>9:00am – 5:00pm AEST</span>\n        </div>\n      </div>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">🚚</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Order Enquiries</strong>\n          <span>Please include your order number in all correspondence for fastest response.</span>\n        </div>\n      </div>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">↩️</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Returns</strong>\n          <span>See our <a href=\"/pet/refund-and-returns-policy/\">Returns Policy</a> — 30-day hassle-free returns.</span>\n        </div>\n      </div>\n    </div>\n    <div class=\"ap-contact-form-wrap\">\n      <h2>Send a Message</h2>\n      [contact-form-7 id=\"contact-form\"]\n    </div>\n  </div>\n</div>\n<!-- /wp:html -->','Contact Us','','publish','closed','closed','','contact','','','2026-04-19 15:14:10','2026-04-19 05:14:10','',0,'https://furlio.au/contact/',0,'page','',0),
(16,0,'2026-04-18 23:33:39','2026-04-18 13:33:39','<!-- wp:html -->\n<style>\n.ap-faq { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-faq-hero { text-align:center; margin-bottom:48px; }\n.ap-faq-hero h1 { font-family:\"Playfair Display\",serif; font-size:clamp(28px,4vw,42px); font-weight:700; color:#1F2937; margin:0 0 12px; }\n.ap-faq-hero p { font-size:16px; color:#6B7280; margin:0; }\n.ap-faq-section { margin-bottom:40px; }\n.ap-faq-section-title { font-family:\"Playfair Display\",serif; font-size:20px; font-weight:700; color:#2E86AB; border-bottom:2px solid #FFF9F2; padding-bottom:8px; margin:0 0 20px; }\n.ap-faq-item { background:#FFF9F2; border-radius:12px; margin-bottom:12px; overflow:hidden; border:1px solid #fcefd9; }\n.ap-faq-q { padding:18px 20px; font-weight:700; color:#1F2937; font-size:15px; cursor:pointer; display:flex; justify-content:space-between; align-items:center; }\n.ap-faq-q::after { content:\"▼\"; font-size:11px; color:#FF6B35; transition:transform 0.2s; flex-shrink:0; margin-left:12px; }\n.ap-faq-a { padding:0 20px 18px; font-size:14px; color:#4B5563; line-height:1.8; }\n.ap-faq-cta { background:linear-gradient(135deg,#2E86AB,#1a5f7a); border-radius:16px; padding:36px; text-align:center; margin-top:40px; }\n.ap-faq-cta h3 { font-family:\"Playfair Display\",serif; color:#fff; font-size:22px; margin:0 0 8px; }\n.ap-faq-cta p { color:rgba(255,255,255,0.85); margin:0 0 20px; font-size:15px; }\n.ap-faq-cta a { background:#FF6B35; color:#fff; padding:12px 28px; border-radius:30px; text-decoration:none; font-weight:700; font-size:14px; }\n@media(max-width:600px){ .ap-faq { padding:40px 20px; } }\n</style>\n<div class=\"ap-faq\">\n  <div class=\"ap-faq-hero\">\n    <h1>Frequently Asked Questions</h1>\n    <p>Everything you need to know about shopping with Furlio</p>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">🚚 Shipping &amp; Delivery</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">How long does delivery take?</div>\n      <div class=\"ap-faq-a\">Most orders arrive within 5–10 business days across Australia. Express options are available at checkout for faster delivery. Remote areas (NT, outback WA/SA/QLD) may take 10–14 business days.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do you offer free shipping?</div>\n      <div class=\"ap-faq-a\">Yes! We offer free standard shipping on all orders over $75. Orders under $75 attract a flat $8.95 shipping fee. Free shipping applies to all Australian addresses including regional and remote.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Will I get a tracking number?</div>\n      <div class=\"ap-faq-a\">Absolutely. Every order ships with a tracking number sent to your email. You can track your parcel in real time from dispatch to delivery.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do you ship internationally?</div>\n      <div class=\"ap-faq-a\">Currently we ship within Australia only. We plan to expand to New Zealand in the future — sign up to our newsletter to be notified when international shipping launches.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">↩️ Returns &amp; Refunds</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">What is your returns policy?</div>\n      <div class=\"ap-faq-a\">We accept returns within 30 days of delivery. Items must be unused and in their original packaging. Contact us at hello@furlio.au and we will arrange a return label for eligible items.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">What if my order arrives damaged or incorrect?</div>\n      <div class=\"ap-faq-a\">We are so sorry if that happens! Please contact us within 7 days of receiving your order with a photo of the item. We will send a replacement or issue a full refund — no questions asked.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">How long do refunds take?</div>\n      <div class=\"ap-faq-a\">Refunds are processed within 3–5 business days of us receiving the returned item. The funds will appear on your original payment method within 5–10 business days depending on your bank.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">💳 Payments &amp; Security</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">What payment methods do you accept?</div>\n      <div class=\"ap-faq-a\">We accept all major credit and debit cards (Visa, Mastercard, American Express) via Stripe, as well as PayPal. All transactions are SSL-encrypted and 100% secure.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Is it safe to enter my card details?</div>\n      <div class=\"ap-faq-a\">Yes, completely. Your payment details are processed directly by Stripe — one of the world&apos;s most trusted payment providers. We never see or store your card details.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do prices include GST?</div>\n      <div class=\"ap-faq-a\">Yes. All prices shown on our store include 10% Australian GST. A full tax invoice is included with every order and emailed to you at the time of purchase.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">🐾 Products &amp; Account</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Are your products safe for all pets?</div>\n      <div class=\"ap-faq-a\">We curate products with pet safety as our top priority. All products in our range comply with Australian safety standards. Always check individual product descriptions for suitability by animal type, size, and age.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do I need an account to place an order?</div>\n      <div class=\"ap-faq-a\">No, you can checkout as a guest. However, creating a free account lets you track orders, save your details for faster checkout, and access your full order history.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">How do I contact customer support?</div>\n      <div class=\"ap-faq-a\">Email us at hello@furlio.au or use the contact form on our <a href=\"/pet/contact-us/\" style=\"color:#2E86AB;\">Contact page</a>. We are available Monday to Friday 9am–5pm AEST and always reply within 24 hours.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-cta\">\n    <h3>Still have questions?</h3>\n    <p>Our friendly team is here to help — reach out any time.</p>\n    <a href=\"/pet/contact-us/\">Contact Us →</a>\n  </div>\n</div>\n<!-- /wp:html -->','FAQ','','publish','closed','closed','','faq','','','2026-04-19 15:11:32','2026-04-19 05:11:32','',0,'https://furlio.au/faq/',0,'page','',0),
(17,0,'2026-04-18 23:33:41','2026-04-18 13:33:41','<!-- wp:html -->\n<style>\n.ap-ship { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-ship h1 { font-family:\"Playfair Display\",serif; font-size:clamp(28px,4vw,40px); font-weight:700; color:#1F2937; margin:0 0 8px; }\n.ap-ship-intro { font-size:16px; color:#6B7280; margin:0 0 40px; line-height:1.7; }\n.ap-ship-card { background:#FFF9F2; border-radius:12px; padding:28px; margin-bottom:20px; border-left:4px solid #2E86AB; }\n.ap-ship-card h3 { font-family:\"Playfair Display\",serif; font-size:18px; font-weight:700; color:#1F2937; margin:0 0 12px; }\n.ap-ship-card p, .ap-ship-card li { font-size:14px; color:#4B5563; line-height:1.8; margin:0 0 8px; }\n.ap-ship-card ul { padding-left:20px; }\n.ap-ship-table { width:100%; border-collapse:collapse; margin:16px 0; }\n.ap-ship-table th { background:#2E86AB; color:#fff; padding:12px 16px; text-align:left; font-size:14px; font-weight:700; }\n.ap-ship-table td { padding:12px 16px; font-size:14px; color:#4B5563; border-bottom:1px solid #fcefd9; }\n.ap-ship-table tr:last-child td { border-bottom:none; }\n.ap-ship-highlight { background:linear-gradient(135deg,#FF6B35,#e85d2e); border-radius:12px; padding:28px; text-align:center; color:#fff; margin-top:32px; }\n.ap-ship-highlight h3 { font-family:\"Playfair Display\",serif; font-size:22px; margin:0 0 8px; }\n.ap-ship-highlight p { font-size:15px; opacity:0.9; margin:0; }\n@media(max-width:600px){ .ap-ship { padding:40px 20px; } }\n</style>\n<div class=\"ap-ship\">\n  <h1>Shipping Information</h1>\n  <p class=\"ap-ship-intro\">We ship Australia-wide — from Sydney to the Kimberley. Here is everything you need to know about how we get your order to your door.</p>\n\n  <div class=\"ap-ship-card\">\n    <h3>🚚 Delivery Timeframes</h3>\n    <table class=\"ap-ship-table\">\n      <tr><th>Location</th><th>Standard</th><th>Express</th></tr>\n      <tr><td>Metro (Sydney, Melbourne, Brisbane, Perth, Adelaide)</td><td>3–7 business days</td><td>1–3 business days</td></tr>\n      <tr><td>Regional Centres</td><td>5–10 business days</td><td>2–5 business days</td></tr>\n      <tr><td>Rural &amp; Remote Areas</td><td>10–14 business days</td><td>5–10 business days</td></tr>\n    </table>\n    <p>Orders placed before <strong>2pm AEST</strong> on business days are dispatched the same day.</p>\n  </div>\n\n  <div class=\"ap-ship-card\">\n    <h3>💸 Shipping Rates</h3>\n    <table class=\"ap-ship-table\">\n      <tr><th>Order Value</th><th>Shipping Cost</th></tr>\n      <tr><td>Under $75</td><td>$8.95 flat rate</td></tr>\n      <tr><td>$75 and over</td><td><strong>FREE</strong></td></tr>\n    </table>\n  </div>\n\n  <div class=\"ap-ship-card\">\n    <h3>📦 How We Ship</h3>\n    <ul>\n      <li>All orders are packed securely to prevent damage in transit</li>\n      <li>Tracking numbers are emailed as soon as your order ships</li>\n      <li>We use trusted Australian carriers including Australia Post and CouriersPlease</li>\n      <li>Signature on delivery may be required for orders over $200</li>\n    </ul>\n  </div>\n\n  <div class=\"ap-ship-card\">\n    <h3>❓ What if my parcel is delayed or lost?</h3>\n    <p>While rare, delays can happen. If your order has not arrived within the estimated timeframe, please contact us at <a href=\"mailto:hello@furlio.au\" style=\"color:#2E86AB;\">hello@furlio.au</a> and we will investigate with the carrier immediately. Lost parcels are fully covered.</p>\n  </div>\n\n  <div class=\"ap-ship-highlight\">\n    <h3>Free Shipping on Orders $75+</h3>\n    <p>Add more to your cart and we will cover the postage — Australia-wide, every time.</p>\n  </div>\n</div>\n<!-- /wp:html -->','Shipping Information','','publish','closed','closed','','shipping-information','','','2026-04-19 15:13:27','2026-04-19 05:13:27','',0,'https://furlio.au/shipping-information/',0,'page','',0),
(18,0,'2026-04-18 23:33:42','2026-04-18 13:33:42','<!-- wp:paragraph --><p>We accept returns within 30 days of purchase. Items must be unused, in original condition and packaging.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>To request a return, email us at returns@furlio.au with your order number and reason for return. We will provide a prepaid return label for faulty items.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Refunds are processed within 5–7 business days of receiving the returned item.</p><!-- /wp:paragraph -->','Refund and Returns Policy','','inherit','closed','closed','','10-revision-v1','','','2026-04-18 23:33:42','2026-04-18 13:33:42','',10,'https://furlio.au/?p=18',0,'revision','',0),
(19,0,'2026-04-18 23:33:43','2026-04-18 13:33:43','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: https://furlio.au.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymised string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognise and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n','Privacy Policy','','inherit','closed','closed','','3-revision-v1','','','2026-04-18 23:33:43','2026-04-18 13:33:43','',3,'https://furlio.au/?p=19',0,'revision','',0),
(25,0,'2026-04-18 23:55:17','2026-04-18 13:55:17','<!-- wp:html -->\n<style>\n/* ====================================================\n   AUSSIEPAW CO. — COMPLETE DESIGN SYSTEM\n   Palette: Ocean Blue | Golden Amber | Coral Orange | Cream | Forest Green\n   ====================================================*/\n@import url(\'https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\');\n\n:root {\n  --ap-blue:      #2E86AB;\n  --ap-blue-dark: #1a5f7a;\n  --ap-amber:     #F18F01;\n  --ap-orange:    #FF6B35;\n  --ap-orange-dk: #e8521e;\n  --ap-green:     #5C8001;\n  --ap-cream:     #FFF9F2;\n  --ap-cream-dk:  #fcefd9;\n  --ap-dark:      #1F2937;\n  --ap-gray:      #6B7280;\n  --ap-light:     #F3F4F6;\n  --ap-white:     #ffffff;\n  --ap-shadow:    0 8px 30px rgba(46,134,171,0.12);\n  --ap-radius:    16px;\n  --ap-transition:all 0.3s cubic-bezier(0.4,0,0.2,1);\n}\n\nbody { font-family:\'Nunito\',sans-serif; background:#FFF9F2; }\nh1,h2,h3,h4 { font-family:\'Playfair Display\',serif; }\n\n/* ── HERO ─────────────────────────────────────────────── */\n.ap-hero {\n  position:relative;\n  min-height:56vh;\n  display:flex;\n  align-items:center;\n  overflow:hidden;\n  background:linear-gradient(135deg, #0d4f6e 0%, #1a7a9e 35%, #2E86AB 60%, #3a9abd 100%);\n}\n.ap-hero::before {\n  content:\'\';\n  position:absolute;\n  inset:0;\n  background:url(\"data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 1440 320\'%3E%3Cpath fill=\'rgba(255,255,255,0.04)\' d=\'M0,160L48,176C96,192,192,224,288,213.3C384,203,480,149,576,138.7C672,128,768,160,864,181.3C960,203,1056,213,1152,202.7C1248,192,1344,160,1392,144L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z\'%3E%3C/path%3E%3C/svg%3E\") bottom/cover no-repeat;\n}\n.ap-hero-paws {\n  position:absolute;\n  font-size:140px;\n  opacity:0.06;\n  right:-30px;\n  top:50%;\n  transform:translateY(-60%) rotate(15deg);\n  pointer-events:none;\n  user-select:none;\n  line-height:1;\n}\n.ap-hero-paws2 {\n  position:absolute;\n  font-size:80px;\n  opacity:0.05;\n  left:2%;\n  bottom:10%;\n  transform:rotate(-20deg);\n  pointer-events:none;\n  user-select:none;\n}\n.ap-hero-inner {\n  position:relative;\n  z-index:2;\n  max-width:1200px;\n  margin:0 auto;\n  padding:80px 40px;\n  display:grid;\n  grid-template-columns:1fr 1fr;\n  gap:60px;\n  align-items:center;\n  width:100%;\n}\n.ap-hero-badge {\n  display:inline-flex;\n  align-items:center;\n  gap:8px;\n  background:rgba(241,143,1,0.2);\n  border:1px solid rgba(241,143,1,0.4);\n  color:#ffd570;\n  font-family:\'Nunito\',sans-serif;\n  font-size:13px;\n  font-weight:700;\n  letter-spacing:1.5px;\n  text-transform:uppercase;\n  padding:8px 18px;\n  border-radius:50px;\n  margin-bottom:24px;\n}\n.ap-hero-title {\n  font-family:\'Playfair Display\',serif !important;\n  font-size:clamp(38px,5vw,64px) !important;\n  font-weight:700 !important;\n  color:#ffffff !important;\n  line-height:1.15 !important;\n  margin:0 0 20px !important;\n}\n.ap-hero-title em {\n  font-style:italic;\n  color:#F18F01;\n}\n.ap-hero-sub {\n  font-family:\'Nunito\',sans-serif;\n  font-size:18px;\n  color:rgba(255,255,255,0.85);\n  line-height:1.7;\n  margin:0 0 36px;\n  max-width:480px;\n}\n.ap-hero-btns {\n  display:flex;\n  gap:16px;\n  flex-wrap:wrap;\n  align-items:center;\n}\n.ap-btn-primary {\n  display:inline-flex;\n  align-items:center;\n  gap:8px;\n  background:#FF6B35;\n  color:#ffffff !important;\n  font-family:\'Nunito\',sans-serif;\n  font-weight:800;\n  font-size:16px;\n  padding:16px 36px;\n  border-radius:50px;\n  text-decoration:none !important;\n  transition:var(--ap-transition);\n  box-shadow:0 6px 24px rgba(255,107,53,0.45);\n}\n.ap-btn-primary:hover {\n  background:#e8521e;\n  transform:translateY(-2px);\n  box-shadow:0 10px 30px rgba(255,107,53,0.55);\n  color:#ffffff !important;\n}\n.ap-btn-ghost {\n  display:inline-flex;\n  align-items:center;\n  gap:8px;\n  background:transparent;\n  color:#ffffff !important;\n  font-family:\'Nunito\',sans-serif;\n  font-weight:700;\n  font-size:15px;\n  padding:15px 30px;\n  border-radius:50px;\n  border:2px solid rgba(255,255,255,0.45);\n  text-decoration:none !important;\n  transition:var(--ap-transition);\n}\n.ap-btn-ghost:hover {\n  background:rgba(255,255,255,0.15);\n  border-color:rgba(255,255,255,0.8);\n  color:#ffffff !important;\n}\n.ap-hero-stats {\n  display:flex;\n  gap:32px;\n  margin-top:44px;\n  flex-wrap:wrap;\n}\n.ap-hero-stat {\n  text-align:center;\n}\n.ap-hero-stat-num {\n  font-family:\'Playfair Display\',serif;\n  font-size:28px;\n  font-weight:700;\n  color:#F18F01;\n  display:block;\n}\n.ap-hero-stat-label {\n  font-family:\'Nunito\',sans-serif;\n  font-size:12px;\n  color:rgba(255,255,255,0.7);\n  font-weight:600;\n  letter-spacing:0.5px;\n}\n.ap-hero-visual {\n  display:flex;\n  flex-direction:column;\n  align-items:center;\n  justify-content:center;\n  gap:20px;\n}\n.ap-hero-card {\n  background:rgba(255,255,255,0.12);\n  backdrop-filter:blur(20px);\n  border:1px solid rgba(255,255,255,0.2);\n  border-radius:24px;\n  padding:28px;\n  width:100%;\n  max-width:340px;\n  position:relative;\n}\n.ap-hero-card-title {\n  font-family:\'Playfair Display\',serif;\n  font-size:20px;\n  color:#fff;\n  margin:0 0 16px;\n}\n.ap-pet-tiles-mini {\n  display:grid;\n  grid-template-columns:1fr 1fr;\n  gap:10px;\n}\n.ap-pet-tile-mini {\n  background:rgba(255,255,255,0.15);\n  border-radius:14px;\n  padding:14px;\n  text-align:center;\n  transition:var(--ap-transition);\n  text-decoration:none;\n  cursor:pointer;\n}\n.ap-pet-tile-mini:hover { background:rgba(255,255,255,0.25); transform:scale(1.04); }\n.ap-pet-tile-mini-icon { font-size:28px; display:block; margin-bottom:4px; }\n.ap-pet-tile-mini-label { font-family:\'Nunito\',sans-serif; font-size:12px; color:rgba(255,255,255,0.9); font-weight:700; }\n.ap-hero-card-badge {\n  position:absolute;\n  top:-12px;\n  right:20px;\n  background:#F18F01;\n  color:#fff;\n  font-family:\'Nunito\',sans-serif;\n  font-size:11px;\n  font-weight:800;\n  padding:4px 14px;\n  border-radius:50px;\n  letter-spacing:0.5px;\n}\n.ap-hero-rating-card {\n  background:rgba(255,255,255,0.1);\n  backdrop-filter:blur(20px);\n  border:1px solid rgba(255,255,255,0.2);\n  border-radius:18px;\n  padding:18px 24px;\n  width:100%;\n  max-width:340px;\n  display:flex;\n  align-items:center;\n  gap:16px;\n}\n.ap-hero-rating-icon { font-size:36px; }\n.ap-hero-rating-text { }\n.ap-hero-rating-stars { color:#F18F01; font-size:16px; }\n.ap-hero-rating-label { font-family:\'Nunito\',sans-serif; font-size:13px; color:rgba(255,255,255,0.8); }\n\n/* ── TRUST BAR ─────────────────────────────────────────── */\n.ap-trust-bar {\n  background:#1F2937;\n  padding:18px 0;\n}\n.ap-trust-bar-inner {\n  max-width:1200px;\n  margin:0 auto;\n  padding:0 40px;\n  display:flex;\n  justify-content:space-between;\n  align-items:center;\n  flex-wrap:wrap;\n  gap:12px;\n}\n.ap-trust-item {\n  display:flex;\n  align-items:center;\n  gap:10px;\n  color:#D1D5DB;\n  font-family:\'Nunito\',sans-serif;\n  font-size:14px;\n  font-weight:600;\n}\n.ap-trust-item-icon { font-size:20px; }\n.ap-trust-item-text { }\n.ap-trust-item-text strong { color:#F18F01; display:block; font-size:13px; font-weight:800; }\n.ap-trust-item-text span { color:#9CA3AF; font-size:11px; font-weight:500; }\n\n/* ── SECTION BASE ──────────────────────────────────────── */\n.ap-section {\n  padding:90px 0;\n}\n.ap-section-alt { background:#ffffff; }\n.ap-container {\n  max-width:1200px;\n  margin:0 auto;\n  padding:0 40px;\n}\n.ap-section-eyebrow {\n  font-family:\'Nunito\',sans-serif;\n  font-size:13px;\n  font-weight:800;\n  letter-spacing:2px;\n  text-transform:uppercase;\n  color:#FF6B35;\n  margin:0 0 12px;\n}\n.ap-section-title {\n  font-family:\'Playfair Display\',serif !important;\n  font-size:clamp(28px,3.5vw,42px) !important;\n  font-weight:700 !important;\n  color:#1F2937 !important;\n  margin:0 0 16px !important;\n  line-height:1.25 !important;\n}\n.ap-section-sub {\n  font-family:\'Nunito\',sans-serif;\n  font-size:17px;\n  color:#6B7280;\n  max-width:560px;\n  line-height:1.7;\n  margin:0 0 52px;\n}\n.ap-section-header-center {\n  text-align:center;\n}\n.ap-section-header-center .ap-section-sub {\n  margin-left:auto;\n  margin-right:auto;\n}\n\n/* ── CATEGORY TILES ────────────────────────────────────── */\n.ap-category-grid {\n  display:grid;\n  grid-template-columns:repeat(4,1fr);\n  gap:24px;\n}\n.ap-cat-tile {\n  position:relative;\n  border-radius:var(--ap-radius);\n  overflow:hidden;\n  background:linear-gradient(145deg, var(--cat-from), var(--cat-to));\n  padding:40px 24px 32px;\n  text-align:center;\n  text-decoration:none !important;\n  cursor:pointer;\n  transition:var(--ap-transition);\n  box-shadow:var(--ap-shadow);\n  display:block;\n}\n.ap-cat-tile:hover {\n  transform:translateY(-8px);\n  box-shadow:0 20px 50px rgba(0,0,0,0.15);\n}\n.ap-cat-tile[data-pet=\"dog\"]  { --cat-from:#2E86AB; --cat-to:#1a5f7a; }\n.ap-cat-tile[data-pet=\"cat\"]  { --cat-from:#F18F01; --cat-to:#c97000; }\n.ap-cat-tile[data-pet=\"bird\"] { --cat-from:#5C8001; --cat-to:#3d5600; }\n.ap-cat-tile[data-pet=\"small\"]{ --cat-from:#9B59B6; --cat-to:#6c3483; }\n.ap-cat-tile::before {\n  content:\'\';\n  position:absolute;\n  inset:0;\n  background:rgba(0,0,0,0.08);\n  transition:var(--ap-transition);\n}\n.ap-cat-tile:hover::before { background:rgba(0,0,0,0); }\n.ap-cat-emoji {\n  font-size:58px;\n  display:block;\n  margin-bottom:14px;\n  position:relative;\n  z-index:1;\n  transition:var(--ap-transition);\n}\n.ap-cat-tile:hover .ap-cat-emoji { transform:scale(1.15) rotate(5deg); }\n.ap-cat-name {\n  font-family:\'Playfair Display\',serif;\n  font-size:20px;\n  font-weight:700;\n  color:#ffffff;\n  position:relative;\n  z-index:1;\n  margin:0 0 6px;\n}\n.ap-cat-count {\n  font-family:\'Nunito\',sans-serif;\n  font-size:13px;\n  color:rgba(255,255,255,0.75);\n  font-weight:600;\n  position:relative;\n  z-index:1;\n}\n.ap-cat-arrow {\n  position:absolute;\n  bottom:18px;\n  right:20px;\n  color:rgba(255,255,255,0.6);\n  font-size:18px;\n  transition:var(--ap-transition);\n}\n.ap-cat-tile:hover .ap-cat-arrow { color:#fff; transform:translateX(4px); }\n\n/* ── FEATURED PRODUCTS INTRO ───────────────────────────── */\n.ap-products-header {\n  display:flex;\n  align-items:flex-end;\n  justify-content:space-between;\n  margin-bottom:40px;\n  flex-wrap:wrap;\n  gap:20px;\n}\n.ap-view-all {\n  display:inline-flex;\n  align-items:center;\n  gap:8px;\n  color:#2E86AB !important;\n  font-family:\'Nunito\',sans-serif;\n  font-weight:700;\n  font-size:15px;\n  text-decoration:none !important;\n  transition:var(--ap-transition);\n}\n.ap-view-all:hover { color:#FF6B35 !important; }\n\n/* ── WHY AUSSIEPAW ─────────────────────────────────────── */\n.ap-why-grid {\n  display:grid;\n  grid-template-columns:repeat(3,1fr);\n  gap:32px;\n}\n.ap-why-card {\n  background:#fff;\n  border-radius:var(--ap-radius);\n  padding:36px 28px;\n  box-shadow:0 4px 20px rgba(0,0,0,0.06);\n  border:1px solid #F3F4F6;\n  transition:var(--ap-transition);\n  position:relative;\n  overflow:hidden;\n}\n.ap-why-card::after {\n  content:\'\';\n  position:absolute;\n  bottom:0;\n  left:0;\n  right:0;\n  height:4px;\n  background:linear-gradient(90deg,var(--ap-blue),var(--ap-orange));\n  transform:scaleX(0);\n  transition:var(--ap-transition);\n  transform-origin:left;\n}\n.ap-why-card:hover { transform:translateY(-6px); box-shadow:0 16px 40px rgba(0,0,0,0.1); }\n.ap-why-card:hover::after { transform:scaleX(1); }\n.ap-why-icon {\n  width:64px;\n  height:64px;\n  border-radius:16px;\n  display:flex;\n  align-items:center;\n  justify-content:center;\n  font-size:28px;\n  margin-bottom:20px;\n}\n.ap-why-card:nth-child(1) .ap-why-icon { background:rgba(46,134,171,0.12); }\n.ap-why-card:nth-child(2) .ap-why-icon { background:rgba(241,143,1,0.12); }\n.ap-why-card:nth-child(3) .ap-why-icon { background:rgba(255,107,53,0.12); }\n.ap-why-card:nth-child(4) .ap-why-icon { background:rgba(92,128,1,0.12); }\n.ap-why-card:nth-child(5) .ap-why-icon { background:rgba(155,89,182,0.12); }\n.ap-why-card:nth-child(6) .ap-why-icon { background:rgba(46,134,171,0.12); }\n.ap-why-title {\n  font-family:\'Playfair Display\',serif;\n  font-size:20px;\n  font-weight:700;\n  color:#1F2937;\n  margin:0 0 10px;\n}\n.ap-why-desc {\n  font-family:\'Nunito\',sans-serif;\n  font-size:15px;\n  color:#6B7280;\n  line-height:1.65;\n  margin:0;\n}\n\n/* ── BRAND STORY ───────────────────────────────────────── */\n.ap-story {\n  background:linear-gradient(135deg, #1F2937 0%, #2d3f54 100%);\n  position:relative;\n  overflow:hidden;\n}\n.ap-story::before {\n  content:\'🐾\';\n  position:absolute;\n  font-size:300px;\n  opacity:0.04;\n  right:-60px;\n  top:-40px;\n  transform:rotate(20deg);\n  pointer-events:none;\n  user-select:none;\n}\n.ap-story-inner {\n  display:grid;\n  grid-template-columns:1fr 1fr;\n  gap:80px;\n  align-items:center;\n}\n.ap-story-visual {\n  position:relative;\n}\n.ap-story-image-placeholder {\n  background:linear-gradient(135deg, rgba(46,134,171,0.3), rgba(241,143,1,0.2));\n  border-radius:24px;\n  aspect-ratio:4/3;\n  display:flex;\n  flex-direction:column;\n  align-items:center;\n  justify-content:center;\n  gap:16px;\n  border:2px dashed rgba(255,255,255,0.2);\n  position:relative;\n  overflow:hidden;\n}\n.ap-story-image-placeholder::before {\n  content:\'\';\n  position:absolute;\n  inset:0;\n  background:radial-gradient(circle at 30% 40%, rgba(46,134,171,0.4) 0%, transparent 60%),\n              radial-gradient(circle at 70% 70%, rgba(241,143,1,0.3) 0%, transparent 50%);\n}\n.ap-story-emoji { font-size:72px; position:relative; z-index:1; }\n.ap-story-image-label { font-family:\'Nunito\',sans-serif; font-size:13px; color:rgba(255,255,255,0.5); font-weight:600; position:relative; z-index:1; }\n.ap-story-badge-float {\n  position:absolute;\n  bottom:-16px;\n  right:-16px;\n  background:#F18F01;\n  border-radius:16px;\n  padding:16px 20px;\n  box-shadow:0 8px 30px rgba(241,143,1,0.5);\n}\n.ap-story-badge-num { font-family:\'Playfair Display\',serif; font-size:32px; font-weight:700; color:#fff; display:block; }\n.ap-story-badge-label { font-family:\'Nunito\',sans-serif; font-size:11px; color:rgba(255,255,255,0.85); font-weight:700; text-transform:uppercase; letter-spacing:1px; }\n.ap-story-content {}\n.ap-story-eyebrow { color:#F18F01; font-family:\'Nunito\',sans-serif; font-size:12px; font-weight:800; letter-spacing:2px; text-transform:uppercase; margin:0 0 14px; }\n.ap-story-title { font-family:\'Playfair Display\',serif !important; font-size:clamp(26px,3vw,38px) !important; color:#ffffff !important; margin:0 0 20px !important; line-height:1.3 !important; }\n.ap-story-title em { font-style:italic; color:#F18F01; }\n.ap-story-text { font-family:\'Nunito\',sans-serif; font-size:16px; color:rgba(255,255,255,0.75); line-height:1.8; margin:0 0 28px; }\n.ap-story-values { display:flex; flex-direction:column; gap:14px; margin-bottom:36px; }\n.ap-story-value { display:flex; align-items:flex-start; gap:14px; }\n.ap-story-value-icon { font-size:20px; margin-top:2px; flex-shrink:0; }\n.ap-story-value-text { font-family:\'Nunito\',sans-serif; font-size:15px; color:rgba(255,255,255,0.8); line-height:1.5; }\n.ap-story-value-text strong { color:#F18F01; }\n\n/* ── NEWSLETTER ────────────────────────────────────────── */\n.ap-newsletter {\n  background:linear-gradient(135deg, #FF6B35 0%, #f04e14 100%);\n  padding:80px 0;\n  position:relative;\n  overflow:hidden;\n}\n.ap-newsletter::before {\n  content:\'🐾\';\n  position:absolute;\n  font-size:200px;\n  opacity:0.08;\n  left:-40px;\n  top:-20px;\n  transform:rotate(-15deg);\n  pointer-events:none;\n  user-select:none;\n}\n.ap-newsletter::after {\n  content:\'🐾\';\n  position:absolute;\n  font-size:150px;\n  opacity:0.06;\n  right:-20px;\n  bottom:-20px;\n  transform:rotate(10deg);\n  pointer-events:none;\n  user-select:none;\n}\n.ap-newsletter-inner {\n  max-width:680px;\n  margin:0 auto;\n  padding:0 40px;\n  text-align:center;\n  position:relative;\n  z-index:1;\n}\n.ap-newsletter-title {\n  font-family:\'Playfair Display\',serif !important;\n  font-size:clamp(26px,4vw,40px) !important;\n  color:#ffffff !important;\n  margin:0 0 12px !important;\n}\n.ap-newsletter-sub {\n  font-family:\'Nunito\',sans-serif;\n  font-size:17px;\n  color:rgba(255,255,255,0.88);\n  line-height:1.6;\n  margin:0 0 36px;\n}\n.ap-newsletter-form {\n  display:flex;\n  gap:0;\n  max-width:480px;\n  margin:0 auto 16px;\n  border-radius:50px;\n  overflow:hidden;\n  box-shadow:0 8px 30px rgba(0,0,0,0.2);\n}\n.ap-newsletter-input {\n  flex:1;\n  padding:18px 24px;\n  border:none;\n  outline:none;\n  font-family:\'Nunito\',sans-serif;\n  font-size:15px;\n  background:#fff;\n  color:#1F2937;\n}\n.ap-newsletter-btn {\n  background:#1F2937;\n  color:#fff;\n  border:none;\n  padding:18px 30px;\n  font-family:\'Nunito\',sans-serif;\n  font-size:15px;\n  font-weight:800;\n  cursor:pointer;\n  transition:var(--ap-transition);\n  white-space:nowrap;\n}\n.ap-newsletter-btn:hover { background:#111827; }\n.ap-newsletter-disclaimer {\n  font-family:\'Nunito\',sans-serif;\n  font-size:13px;\n  color:rgba(255,255,255,0.7);\n}\n\n/* ── SCROLL ANIMATIONS ─────────────────────────────────── */\n.ap-fade-up {\n  opacity:0;\n  transform:translateY(30px);\n  transition:opacity 0.6s ease, transform 0.6s ease;\n}\n.ap-fade-up.ap-visible {\n  opacity:1;\n  transform:translateY(0);\n}\n\n/* ── RESPONSIVE ─────────────────────────────────────────── */\n@media(max-width:900px){\n  .ap-hero-inner { grid-template-columns:1fr; padding:60px 24px; gap:40px; }\n  .ap-hero-visual { display:none; }\n  .ap-category-grid { grid-template-columns:1fr 1fr; }\n  .ap-why-grid { grid-template-columns:1fr 1fr; }\n  .ap-story-inner { grid-template-columns:1fr; gap:40px; }\n  .ap-story-visual { display:none; }\n  .ap-container { padding:0 20px; }\n}\n@media(max-width:600px){\n  .ap-section { padding:60px 0; }\n  .ap-category-grid { grid-template-columns:1fr 1fr; gap:14px; }\n  .ap-why-grid { grid-template-columns:1fr; }\n  .ap-trust-bar-inner { flex-direction:column; align-items:flex-start; gap:16px; }\n  .ap-newsletter-form { flex-direction:column; border-radius:16px; overflow:visible; }\n  .ap-newsletter-input { border-radius:50px; padding:16px 20px; }\n  .ap-newsletter-btn { border-radius:50px; padding:16px; }\n  .ap-hero-stats { gap:24px; }\n}\n\n/* ── WOOCOMMERCE OVERRIDES ─────────────────────────────── */\n.woocommerce ul.products li.product .ap-prod-card,\n.woocommerce ul.products {\n  display:grid !important;\n  grid-template-columns:repeat(3,1fr) !important;\n  gap:24px !important;\n}\n.woocommerce ul.products li.product {\n  border:1px solid #F3F4F6 !important;\n  border-radius:var(--ap-radius) !important;\n  overflow:hidden !important;\n  transition:var(--ap-transition) !important;\n  background:#fff !important;\n  box-shadow:0 2px 12px rgba(0,0,0,0.05) !important;\n}\n.woocommerce ul.products li.product:hover {\n  transform:translateY(-6px) !important;\n  box-shadow:0 16px 40px rgba(46,134,171,0.15) !important;\n  border-color:#2E86AB !important;\n}\n.woocommerce ul.products li.product .woocommerce-loop-product__title {\n  font-family:\'Playfair Display\',serif !important;\n  font-size:17px !important;\n  color:#1F2937 !important;\n  padding:0 !important;\n}\n.woocommerce ul.products li.product .price {\n  color:#FF6B35 !important;\n  font-weight:800 !important;\n  font-size:18px !important;\n  font-family:\'Nunito\',sans-serif !important;\n}\n.woocommerce ul.products li.product a.button,\n.woocommerce ul.products li.product button.button {\n  background:#2E86AB !important;\n  color:#fff !important;\n  border-radius:50px !important;\n  font-family:\'Nunito\',sans-serif !important;\n  font-weight:700 !important;\n  transition:var(--ap-transition) !important;\n  padding:10px 20px !important;\n  font-size:13px !important;\n}\n.woocommerce ul.products li.product a.button:hover,\n.woocommerce ul.products li.product button.button:hover {\n  background:#FF6B35 !important;\n  transform:scale(1.03) !important;\n}\n.woocommerce span.onsale {\n  background:#FF6B35 !important;\n  border-radius:8px !important;\n  font-family:\'Nunito\',sans-serif !important;\n  font-weight:800 !important;\n}\n.woocommerce a.button.alt, .woocommerce button.button.alt {\n  background:#FF6B35 !important;\n  border-radius:50px !important;\n  font-family:\'Nunito\',sans-serif !important;\n  font-weight:800 !important;\n}\n.woocommerce a.button.alt:hover, .woocommerce button.button.alt:hover {\n  background:#e8521e !important;\n}\n/* Cart / Checkout */\n.woocommerce .cart-collaterals h2, .woocommerce-checkout h3 {\n  font-family:\'Playfair Display\',serif !important;\n  color:#1F2937 !important;\n}\n.woocommerce #payment #place_order {\n  background:#FF6B35 !important;\n  border-radius:50px !important;\n  font-family:\'Nunito\',sans-serif !important;\n  font-weight:800 !important;\n  font-size:18px !important;\n  padding:18px 40px !important;\n}\n/* Header */\n.ast-site-identity .site-title a {\n  font-family:\'Playfair Display\',serif !important;\n  color:#2E86AB !important;\n}\n.ast-primary-header-bar {\n  box-shadow:0 2px 20px rgba(0,0,0,0.06) !important;\n  border-bottom:2px solid #F3F4F6 !important;\n}\n.main-navigation .menu-item a {\n  font-family:\'Nunito\',sans-serif !important;\n  font-weight:700 !important;\n  font-size:15px !important;\n  color:#1F2937 !important;\n  transition:var(--ap-transition) !important;\n}\n.main-navigation .menu-item a:hover { color:#FF6B35 !important; }\n.main-navigation .current-menu-item > a { color:#2E86AB !important; }\n/* Footer */\n.site-footer { background:#1F2937 !important; color:#D1D5DB !important; }\n.site-footer h2, .site-footer h3, .site-footer .widget-title { color:#fff !important; font-family:\'Playfair Display\',serif !important; }\n.site-footer a { color:#F18F01 !important; }\n.site-footer a:hover { color:#fff !important; }\n</style>\n\n<!-- HERO SECTION -->\n<section class=\"ap-hero\">\n  <div class=\"ap-hero-paws\">🐾</div>\n  <div class=\"ap-hero-paws2\">🐾</div>\n  <div class=\"ap-hero-inner\">\n    <div class=\"ap-hero-content\">\n      <div class=\"ap-hero-badge\">🐾 Australia\'s Favourite Pet Store</div>\n      <h1 class=\"ap-hero-title\">\n        Because Your <em>Furry Mate</em> Deserves the Best\n      </h1>\n      <p class=\"ap-hero-sub\">\n        Premium pet supplies, handpicked for Australian dogs, cats, birds and small animals. Fast delivery. Vet-approved. Aussie-owned and loved.\n      </p>\n      <div class=\"ap-hero-btns\">\n        <a href=\"/pet/shop/\" class=\"ap-btn-primary\">🛒 Shop Now</a>\n        <a href=\"/pet/shop/\" class=\"ap-btn-ghost\">Browse Categories →</a>\n      </div>\n      <div class=\"ap-hero-stats\">\n        <div class=\"ap-hero-stat\">\n          <span class=\"ap-hero-stat-num\">10K+</span>\n          <span class=\"ap-hero-stat-label\">Happy Pets</span>\n        </div>\n        <div class=\"ap-hero-stat\">\n          <span class=\"ap-hero-stat-num\">4.9★</span>\n          <span class=\"ap-hero-stat-label\">Avg Rating</span>\n        </div>\n        <div class=\"ap-hero-stat\">\n          <span class=\"ap-hero-stat-num\">Free</span>\n          <span class=\"ap-hero-stat-label\">Ship on $75+</span>\n        </div>\n        <div class=\"ap-hero-stat\">\n          <span class=\"ap-hero-stat-num\">2–7</span>\n          <span class=\"ap-hero-stat-label\">Day Delivery</span>\n        </div>\n      </div>\n    </div>\n    <div class=\"ap-hero-visual\">\n      <div class=\"ap-hero-card\">\n        <div class=\"ap-hero-card-badge\">🔥 Shop by Pet</div>\n        <p class=\"ap-hero-card-title\">What\'s your furry mate?</p>\n        <div class=\"ap-pet-tiles-mini\">\n          <a href=\"/pet/product-category/dog-accessories/\" class=\"ap-pet-tile-mini\">\n            <span class=\"ap-pet-tile-mini-icon\">🐕</span>\n            <span class=\"ap-pet-tile-mini-label\">Dogs</span>\n          </a>\n          <a href=\"/pet/product-category/cat-supplies/\" class=\"ap-pet-tile-mini\">\n            <span class=\"ap-pet-tile-mini-icon\">🐈</span>\n            <span class=\"ap-pet-tile-mini-label\">Cats</span>\n          </a>\n          <a href=\"/pet/product-category/bird-aquatic/\" class=\"ap-pet-tile-mini\">\n            <span class=\"ap-pet-tile-mini-icon\">🐦</span>\n            <span class=\"ap-pet-tile-mini-label\">Birds</span>\n          </a>\n          <a href=\"/pet/product-category/small-animals/\" class=\"ap-pet-tile-mini\">\n            <span class=\"ap-pet-tile-mini-icon\">🐹</span>\n            <span class=\"ap-pet-tile-mini-label\">Small Animals</span>\n          </a>\n        </div>\n      </div>\n      <div class=\"ap-hero-rating-card\">\n        <span class=\"ap-hero-rating-icon\">⭐</span>\n        <div class=\"ap-hero-rating-text\">\n          <div class=\"ap-hero-rating-stars\">★★★★★</div>\n          <div class=\"ap-hero-rating-label\">\"Best pet store I\'ve used — fast shipping and brilliant quality!\"<br><strong style=\"color:#F18F01\">— Sarah M., Melbourne</strong></div>\n        </div>\n      </div>\n    </div>\n  </div>\n</section>\n\n<!-- TRUST BAR -->\n<div class=\"ap-trust-bar\">\n  <div class=\"ap-trust-bar-inner\">\n    <div class=\"ap-trust-item\">\n      <span class=\"ap-trust-item-icon\">🚚</span>\n      <div class=\"ap-trust-item-text\">\n        <strong>Free Shipping</strong>\n        <span>Orders over $75 AUD</span>\n      </div>\n    </div>\n    <div class=\"ap-trust-item\">\n      <span class=\"ap-trust-item-icon\">🔒</span>\n      <div class=\"ap-trust-item-text\">\n        <strong>Secure Checkout</strong>\n        <span>SSL encrypted payments</span>\n      </div>\n    </div>\n    <div class=\"ap-trust-item\">\n      <span class=\"ap-trust-item-icon\">✅</span>\n      <div class=\"ap-trust-item-text\">\n        <strong>Vet Approved</strong>\n        <span>Quality-checked products</span>\n      </div>\n    </div>\n    <div class=\"ap-trust-item\">\n      <span class=\"ap-trust-item-icon\">🇦🇺</span>\n      <div class=\"ap-trust-item-text\">\n        <strong>Proudly Aussie</strong>\n        <span>Owned & operated in Australia</span>\n      </div>\n    </div>\n    <div class=\"ap-trust-item\">\n      <span class=\"ap-trust-item-icon\">↩️</span>\n      <div class=\"ap-trust-item-text\">\n        <strong>30-Day Returns</strong>\n        <span>Hassle-free guarantee</span>\n      </div>\n    </div>\n  </div>\n</div>\n\n<!-- SHOP BY PET CATEGORY -->\n<section class=\"ap-section\" style=\"background:#FFF9F2;\">\n  <div class=\"ap-container\">\n    <div class=\"ap-section-header-center ap-fade-up\">\n      <p class=\"ap-section-eyebrow\">🐾 Shop by Pet</p>\n      <h2 class=\"ap-section-title\">Find the Perfect Gear for Your Mate</h2>\n      <p class=\"ap-section-sub\">From playful pups to curious kitties — we have everything your pet needs to thrive.</p>\n    </div>\n    <div class=\"ap-category-grid\">\n      <a href=\"/pet/product-category/dog-accessories/\" class=\"ap-cat-tile ap-fade-up\" data-pet=\"dog\">\n        <span class=\"ap-cat-emoji\">🐕</span>\n        <div class=\"ap-cat-name\">Dogs</div>\n        <div class=\"ap-cat-count\">Accessories, Toys, Food & More</div>\n        <span class=\"ap-cat-arrow\">→</span>\n      </a>\n      <a href=\"/pet/product-category/cat-supplies/\" class=\"ap-cat-tile ap-fade-up\" data-pet=\"cat\" style=\"animation-delay:0.1s\">\n        <span class=\"ap-cat-emoji\">🐈</span>\n        <div class=\"ap-cat-name\">Cats</div>\n        <div class=\"ap-cat-count\">Beds, Toys, Grooming & More</div>\n        <span class=\"ap-cat-arrow\">→</span>\n      </a>\n      <a href=\"/pet/product-category/bird-aquatic/\" class=\"ap-cat-tile ap-fade-up\" data-pet=\"bird\" style=\"animation-delay:0.2s\">\n        <span class=\"ap-cat-emoji\">🐦</span>\n        <div class=\"ap-cat-name\">Birds & Aquatic</div>\n        <div class=\"ap-cat-count\">Cages, Feeders, Tanks & More</div>\n        <span class=\"ap-cat-arrow\">→</span>\n      </a>\n      <a href=\"/pet/product-category/small-animals/\" class=\"ap-cat-tile ap-fade-up\" data-pet=\"small\" style=\"animation-delay:0.3s\">\n        <span class=\"ap-cat-emoji\">🐹</span>\n        <div class=\"ap-cat-name\">Small Animals</div>\n        <div class=\"ap-cat-count\">Rabbits, Guinea Pigs & More</div>\n        <span class=\"ap-cat-arrow\">→</span>\n      </a>\n    </div>\n  </div>\n</section>\n\n<!-- FEATURED PRODUCTS (placeholder — populated after scout runs) -->\n<section class=\"ap-section ap-section-alt\">\n  <div class=\"ap-container\">\n    <div class=\"ap-products-header ap-fade-up\">\n      <div>\n        <p class=\"ap-section-eyebrow\">🔥 Trending Now</p>\n        <h2 class=\"ap-section-title\" style=\"margin-bottom:0!important\">This Week\'s Bestsellers</h2>\n      </div>\n      <a href=\"/pet/shop/\" class=\"ap-view-all\">View All Products →</a>\n    </div>\n    <!-- WooCommerce products will appear here once seeded -->\n    <div style=\"text-align:center;padding:60px 0;background:#F9FAFB;border-radius:16px;border:2px dashed #E5E7EB;\">\n      <div style=\"font-size:48px;margin-bottom:16px;\">🛍️</div>\n      <h3 style=\"font-family:\'Playfair Display\',serif;color:#1F2937;margin:0 0 8px;\">Products Coming Soon</h3>\n      <p style=\"font-family:\'Nunito\',sans-serif;color:#6B7280;margin:0 0 24px;\">Our AI is sourcing the best products for your pets.</p>\n      <a href=\"/pet/shop/\" class=\"ap-btn-primary\" style=\"display:inline-flex;\">Browse the Shop →</a>\n    </div>\n  </div>\n</section>\n\n<!-- WHY AUSSIEPAW -->\n<section class=\"ap-section\" style=\"background:#FFF9F2;\">\n  <div class=\"ap-container\">\n    <div class=\"ap-section-header-center ap-fade-up\">\n      <p class=\"ap-section-eyebrow\">💙 Why Choose Us</p>\n      <h2 class=\"ap-section-title\">The Furlio Difference</h2>\n      <p class=\"ap-section-sub\">We are not just another pet store. We are pet lovers who care about what goes on your furry mate\'s collar, in their bowl, and in their home.</p>\n    </div>\n    <div class=\"ap-why-grid\">\n      <div class=\"ap-why-card ap-fade-up\">\n        <div class=\"ap-why-icon\">🚀</div>\n        <h3 class=\"ap-why-title\">Lightning-Fast Delivery</h3>\n        <p class=\"ap-why-desc\">Orders dispatched same or next business day. Tracked delivery across all of Australia — metro to remote.</p>\n      </div>\n      <div class=\"ap-why-card ap-fade-up\">\n        <div class=\"ap-why-icon\">🏆</div>\n        <h3 class=\"ap-why-title\">Vet-Approved Quality</h3>\n        <p class=\"ap-why-desc\">Every product passes our quality check. Safe, durable, and tested — because your pet\'s health is non-negotiable.</p>\n      </div>\n      <div class=\"ap-why-card ap-fade-up\">\n        <div class=\"ap-why-icon\">💰</div>\n        <h3 class=\"ap-why-title\">Unbeatable Value</h3>\n        <p class=\"ap-why-desc\">Premium quality without the premium price tag. Free shipping on orders over $75 AUD — every time.</p>\n      </div>\n      <div class=\"ap-why-card ap-fade-up\">\n        <div class=\"ap-why-icon\">🌱</div>\n        <h3 class=\"ap-why-title\">Eco-Conscious Packaging</h3>\n        <p class=\"ap-why-desc\">Recyclable packaging and responsible sourcing. Good for your pet, good for the planet we share with them.</p>\n      </div>\n      <div class=\"ap-why-card ap-fade-up\">\n        <div class=\"ap-why-icon\">🤝</div>\n        <h3 class=\"ap-why-title\">Aussie Customer Support</h3>\n        <p class=\"ap-why-desc\">Real people, real answers. Our Aussie team is here Monday–Friday to help with any question, big or small.</p>\n      </div>\n      <div class=\"ap-why-card ap-fade-up\">\n        <div class=\"ap-why-icon\">↩️</div>\n        <h3 class=\"ap-why-title\">Hassle-Free Returns</h3>\n        <p class=\"ap-why-desc\">30-day no-questions-asked returns. Shop with confidence knowing we have got you covered.</p>\n      </div>\n    </div>\n  </div>\n</section>\n\n<!-- BRAND STORY -->\n<section class=\"ap-section ap-story\">\n  <div class=\"ap-container\">\n    <div class=\"ap-story-inner\">\n      <div class=\"ap-story-visual ap-fade-up\">\n        <div class=\"ap-story-image-placeholder\">\n          <span class=\"ap-story-emoji\">🐶🐱</span>\n          <span class=\"ap-story-image-label\">Upload your store hero image here</span>\n        </div>\n        <div class=\"ap-story-badge-float\">\n          <span class=\"ap-story-badge-num\">10K+</span>\n          <span class=\"ap-story-badge-label\">Happy Pets</span>\n        </div>\n      </div>\n      <div class=\"ap-story-content ap-fade-up\">\n        <p class=\"ap-story-eyebrow\">🐾 Our Story</p>\n        <h2 class=\"ap-story-title\">Built for Aussie <em>Pet Lovers</em>, By Pet Lovers</h2>\n        <p class=\"ap-story-text\">\n          Furlio started with a simple question: why is it so hard to find quality pet supplies in Australia at a fair price? We set out to change that — sourcing the best products from around the world and bringing them straight to your door.\n        </p>\n        <p class=\"ap-story-text\">\n          From the beaches of QLD to the bush of WA, every Aussie pet deserves products that are safe, fun, and built to last. That is the promise we make with every order.\n        </p>\n        <div class=\"ap-story-values\">\n          <div class=\"ap-story-value\">\n            <span class=\"ap-story-value-icon\">✅</span>\n            <span class=\"ap-story-value-text\"><strong>Quality First</strong> — We reject products that do not meet our standards. Full stop.</span>\n          </div>\n          <div class=\"ap-story-value\">\n            <span class=\"ap-story-value-icon\">🇦🇺</span>\n            <span class=\"ap-story-value-text\"><strong>Australian Made Decisions</strong> — Owned, operated, and heart-led from right here in Straya.</span>\n          </div>\n          <div class=\"ap-story-value\">\n            <span class=\"ap-story-value-icon\">❤️</span>\n            <span class=\"ap-story-value-text\"><strong>Pet-First Always</strong> — Every product decision starts with one question: is this good for the animal?</span>\n          </div>\n        </div>\n        <a href=\"/pet/about/\" class=\"ap-btn-primary\">Meet the Furlio Team →</a>\n      </div>\n    </div>\n  </div>\n</section>\n\n<!-- NEWSLETTER -->\n<section class=\"ap-newsletter\">\n  <div class=\"ap-newsletter-inner\">\n    <h2 class=\"ap-newsletter-title\">Join 10,000+ Aussie Pet Lovers 🐾</h2>\n    <p class=\"ap-newsletter-sub\">\n      Get exclusive deals, new product alerts, and expert pet care tips — delivered straight to your inbox every week.\n    </p>\n    <form class=\"ap-newsletter-form\" action=\"#\" method=\"post\">\n      <input type=\"email\" class=\"ap-newsletter-input\" placeholder=\"Your email address...\" required />\n      <button type=\"submit\" class=\"ap-newsletter-btn\">Subscribe Free →</button>\n    </form>\n    <p class=\"ap-newsletter-disclaimer\">🔒 No spam, ever. Unsubscribe anytime. We respect your privacy.</p>\n  </div>\n</section>\n\n<!-- SCROLL ANIMATION SCRIPT -->\n<script>\n(function(){\n  var els = document.querySelectorAll(\'.ap-fade-up\');\n  if(!els.length) return;\n  var obs = new IntersectionObserver(function(entries){\n    entries.forEach(function(e){\n      if(e.isIntersecting){\n        e.target.classList.add(\'ap-visible\');\n        obs.unobserve(e.target);\n      }\n    });\n  }, {threshold:0.12, rootMargin:\'0px 0px -40px 0px\'});\n  els.forEach(function(el){ obs.observe(el); });\n})();\n</script>\n<!-- /wp:html -->','Home','','publish','closed','closed','','front-page','','','2026-04-23 13:57:18','2026-04-23 03:57:18','',0,'https://furlio.au/home/',0,'page','',0),
(26,0,'2026-04-18 23:56:46','2026-04-18 13:56:46','/* =============================================\n   AUSSIEPAW CO. — GLOBAL STYLESHEET\n   Applied via WordPress Custom CSS\n   ============================================*/\n@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n:root {\n  --ap-blue:#2E86AB; --ap-blue-dk:#1a5f7a;\n  --ap-amber:#F18F01; --ap-orange:#FF6B35; --ap-orange-dk:#e8521e;\n  --ap-green:#5C8001; --ap-cream:#FFF9F2; --ap-dark:#1F2937;\n  --ap-gray:#6B7280; --ap-white:#ffffff;\n  --ap-radius:16px;\n  --ap-transition:all 0.3s cubic-bezier(0.4,0,0.2,1);\n  --ap-shadow:0 8px 30px rgba(46,134,171,0.12);\n}\n\n/* GLOBAL BODY */\nbody { font-family:\"Nunito\",sans-serif!important; background:#FFF9F2!important; color:#2D3748; }\nh1,h2,h3,h4,h5,h6 { font-family:\"Playfair Display\",serif!important; color:#1F2937; }\na { color:#2E86AB; transition:var(--ap-transition); }\na:hover { color:#FF6B35; }\n\n/* ASTRA HEADER */\n#masthead, .ast-primary-header-bar {\n  background:#ffffff!important;\n  box-shadow:0 2px 20px rgba(0,0,0,0.06)!important;\n  border-bottom:2px solid #F3F4F6!important;\n}\n.ast-site-header-wrap { padding:0 20px; }\n.site-title a, .ast-site-name { font-family:\"Playfair Display\",serif!important; color:#2E86AB!important; font-size:24px!important; font-weight:700!important; letter-spacing:-0.5px; }\n.site-description, .ast-site-description { color:#6B7280!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* NAVIGATION */\n.main-navigation .menu > li > a,\n.ast-header-menu-container .menu > li > a {\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:15px!important;\n  color:#1F2937!important; padding:8px 14px!important; border-radius:8px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.2px;\n}\n.main-navigation .menu > li > a:hover,\n.ast-header-menu-container .menu > li > a:hover { color:#FF6B35!important; background:rgba(255,107,53,0.06)!important; }\n.ast-header-menu-container .menu > .current-menu-item > a { color:#2E86AB!important; }\n\n/* ASTRA CART ICON */\n.ast-cart-menu-wrap .count { background:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-weight:800!important; }\n\n/* STICKY HEADER */\n.ast-header-sticked { box-shadow:0 4px 20px rgba(0,0,0,0.1)!important; }\n\n/* BUTTONS - GLOBAL */\n.wp-block-button__link, button, input[type=\"submit\"],\n.woocommerce a.button, .woocommerce button.button, .button {\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important; border-radius:50px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.3px;\n}\n.woocommerce a.button.alt, .woocommerce button.button.alt,\n.woocommerce input.button.alt, .woocommerce #respond input#submit.alt {\n  background:#FF6B35!important; color:#fff!important; border-radius:50px!important;\n  padding:14px 32px!important; font-size:15px!important; font-weight:800!important;\n  box-shadow:0 4px 16px rgba(255,107,53,0.35)!important;\n}\n.woocommerce a.button.alt:hover, .woocommerce button.button.alt:hover {\n  background:#e8521e!important; transform:translateY(-2px)!important; box-shadow:0 8px 24px rgba(255,107,53,0.45)!important;\n}\n\n/* SHOP PRODUCT GRID */\n.woocommerce ul.products { display:grid!important; gap:24px!important; }\n@media(min-width:900px){ .woocommerce ul.products { grid-template-columns:repeat(3,1fr)!important; } }\n@media(max-width:899px) and (min-width:600px){ .woocommerce ul.products { grid-template-columns:repeat(2,1fr)!important; } }\n@media(max-width:599px){ .woocommerce ul.products { grid-template-columns:1fr!important; } }\n.woocommerce ul.products li.product {\n  background:#ffffff!important; border:1px solid #F3F4F6!important;\n  border-radius:var(--ap-radius)!important; overflow:hidden!important;\n  box-shadow:0 2px 12px rgba(0,0,0,0.05)!important; transition:var(--ap-transition)!important;\n  padding:0!important; position:relative;\n}\n.woocommerce ul.products li.product:hover {\n  transform:translateY(-8px)!important; border-color:#2E86AB!important;\n  box-shadow:0 20px 50px rgba(46,134,171,0.18)!important;\n}\n.woocommerce ul.products li.product .woocommerce-LoopProduct-link { display:block; }\n.woocommerce ul.products li.product img { transition:var(--ap-transition)!important; width:100%!important; aspect-ratio:1/1!important; object-fit:cover!important; }\n.woocommerce ul.products li.product:hover img { transform:scale(1.04)!important; }\n.woocommerce ul.products li.product .woocommerce-loop-product__title {\n  font-family:\"Playfair Display\",serif!important; font-size:17px!important; font-weight:700!important;\n  color:#1F2937!important; padding:16px 16px 4px!important; line-height:1.3!important; margin:0!important;\n}\n.woocommerce ul.products li.product .price {\n  color:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-size:20px!important;\n  font-weight:800!important; padding:0 16px 12px!important; display:block!important;\n}\n.woocommerce ul.products li.product .price del { color:#9CA3AF!important; font-size:14px!important; font-weight:600!important; }\n.woocommerce ul.products li.product a.button, .woocommerce ul.products li.product button.button {\n  background:#2E86AB!important; color:#fff!important; border-radius:50px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:13px!important;\n  padding:10px 20px!important; margin:0 16px 16px!important; display:inline-block!important;\n  transition:var(--ap-transition)!important;\n}\n.woocommerce ul.products li.product a.button:hover, .woocommerce ul.products li.product button.button:hover {\n  background:#FF6B35!important; transform:scale(1.05)!important;\n}\n.woocommerce span.onsale {\n  background:#FF6B35!important; color:#fff!important; border-radius:8px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important;\n  font-size:12px!important; padding:4px 10px!important; top:12px!important; left:12px!important;\n}\n\n/* SINGLE PRODUCT */\n.woocommerce div.product .product_title {\n  font-family:\"Playfair Display\",serif!important; font-size:32px!important; color:#1F2937!important;\n}\n.woocommerce div.product p.price, .woocommerce div.product span.price {\n  color:#FF6B35!important; font-size:28px!important; font-weight:800!important; font-family:\"Nunito\",sans-serif!important;\n}\n.woocommerce div.product .woocommerce-product-rating .star-rating { color:#F18F01!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li { border-radius:12px 12px 0 0!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li.active { background:#FFF9F2!important; border-color:#2E86AB!important; }\n\n/* BREADCRUMB */\n.woocommerce .woocommerce-breadcrumb { font-family:\"Nunito\",sans-serif!important; color:#9CA3AF!important; font-size:14px!important; }\n.woocommerce .woocommerce-breadcrumb a { color:#2E86AB!important; }\n\n/* CART */\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce table.shop_table { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce table.shop_table th { background:#1F2937!important; color:#fff!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; }\n.woocommerce-cart .cart-collaterals .cart_totals h2 { font-family:\"Playfair Display\",serif!important; }\n\n/* CHECKOUT */\n.woocommerce-checkout #order_review_heading,\n.woocommerce-checkout h3#ship-to-different-address,\n.woocommerce-checkout #order_review .woocommerce-checkout-review-order-table th { font-family:\"Playfair Display\",serif!important; }\n.woocommerce #payment #place_order {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px 40px!important; width:100%!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce #payment #place_order:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce form .form-row input.input-text, .woocommerce form .form-row textarea,\n.woocommerce form .form-row select { border-radius:12px!important; border-color:#E5E7EB!important; font-family:\"Nunito\",sans-serif!important; padding:14px 16px!important; }\n\n/* MY ACCOUNT */\n.woocommerce-account .woocommerce-MyAccount-navigation ul { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li { border-bottom:1px solid #F3F4F6!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a { font-family:\"Nunito\",sans-serif!important; font-weight:600!important; padding:14px 20px!important; color:#1F2937!important; display:block!important; transition:var(--ap-transition)!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a:hover, .woocommerce-account .woocommerce-MyAccount-navigation li.is-active a { background:#2E86AB!important; color:#fff!important; }\n\n/* FOOTER */\n#colophon, .site-footer { background:#1F2937!important; color:#D1D5DB!important; padding-top:60px!important; }\n.site-footer .widget-title, .site-footer h2, .site-footer h3 { font-family:\"Playfair Display\",serif!important; color:#ffffff!important; margin-bottom:20px!important; font-size:18px!important; }\n.site-footer p, .site-footer li, .site-footer a { font-family:\"Nunito\",sans-serif!important; }\n.site-footer a { color:#F18F01!important; transition:var(--ap-transition)!important; }\n.site-footer a:hover { color:#ffffff!important; }\n.site-footer ul { list-style:none!important; padding:0!important; }\n.site-footer ul li { padding:6px 0!important; border-bottom:1px solid rgba(255,255,255,0.06)!important; }\n.ast-small-footer { background:#111827!important; border-top:1px solid rgba(255,255,255,0.08)!important; }\n.ast-small-footer .ast-footer-copyright { color:#9CA3AF!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* WOOCOMMERCE NOTICES */\n.woocommerce-message { background:#ecfdf5!important; border-left-color:#10B981!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-error { background:#fef2f2!important; border-left-color:#EF4444!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-info { background:#eff6ff!important; border-left-color:#2E86AB!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* PAGINATION */\n.woocommerce nav.woocommerce-pagination ul li a, .woocommerce nav.woocommerce-pagination ul li span {\n  border-radius:8px!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; transition:var(--ap-transition)!important;\n}\n.woocommerce nav.woocommerce-pagination ul li a:hover, .woocommerce nav.woocommerce-pagination ul li span.current {\n  background:#2E86AB!important; border-color:#2E86AB!important; color:#fff!important;\n}\n\n/* SEARCH */\n.woocommerce-product-search input[type=\"search\"] { border-radius:50px!important; border:2px solid #E5E7EB!important; padding:12px 20px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-product-search button[type=\"submit\"] { background:#2E86AB!important; border-radius:0 50px 50px 0!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* REVIEW STARS */\n.star-rating { color:#F18F01!important; }\n.woocommerce-product-rating .woocommerce-review-link { font-family:\"Nunito\",sans-serif!important; color:#6B7280!important; }\n\n/* ── Homepage: full-width, no title ── */\nbody.home h1.entry-title,\nbody.home .entry-header { display: none !important; }\nbody.home {\n  --ast-normal-container-width: 100%;\n  --ast-container-default-xlg-padding: 0px;\n  --ast-container-default-lg-padding: 0px;\n  --ast-container-default-slg-padding: 0px;\n  --ast-container-default-md-padding: 0px;\n  --ast-container-default-sm-padding: 0px;\n  --ast-container-default-xs-padding: 0px;\n  --ast-container-default-xxs-padding: 0px;\n}\nbody.home .ast-container { max-width: 100% !important; padding-left: 0 !important; padding-right: 0 !important; }\nbody.home #primary, body.home .entry-content { padding: 0 !important; max-width: 100% !important; }\nbody.home #content.site-content { padding-top: 0 !important; }\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n/* ── Navigation icons ── */\n.main-header-menu .menu-item a.menu-link { display:flex; align-items:center; gap:5px; }\n\n/* Per-item icons via CSS content */\n.main-header-menu .menu-item:nth-child(1) > a.menu-link::before { content:\"🏠\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(2) > a.menu-link::before { content:\"🛍️\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(3) > a.menu-link::before { content:\"🐾\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(4) > a.menu-link::before { content:\"❓\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(5) > a.menu-link::before { content:\"🚚\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(6) > a.menu-link::before { content:\"✉️\"; font-size:14px; }\n\n/* My Account — plain nav style */\n.nav-account-link > a.menu-link::before { content:\"👤\"; font-size:13px; margin-right:4px; }','astra','','publish','closed','closed','','astra','','','2026-04-19 23:17:22','2026-04-19 13:17:22','',0,'https://furlio.au/astra/',0,'custom_css','',0),
(27,0,'2026-04-18 23:56:46','2026-04-18 13:56:46','/* =============================================\n   AUSSIEPAW CO. — GLOBAL STYLESHEET\n   Applied via WordPress Custom CSS\n   ============================================*/\n@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n:root {\n  --ap-blue:#2E86AB; --ap-blue-dk:#1a5f7a;\n  --ap-amber:#F18F01; --ap-orange:#FF6B35; --ap-orange-dk:#e8521e;\n  --ap-green:#5C8001; --ap-cream:#FFF9F2; --ap-dark:#1F2937;\n  --ap-gray:#6B7280; --ap-white:#ffffff;\n  --ap-radius:16px;\n  --ap-transition:all 0.3s cubic-bezier(0.4,0,0.2,1);\n  --ap-shadow:0 8px 30px rgba(46,134,171,0.12);\n}\n\n/* GLOBAL BODY */\nbody { font-family:\"Nunito\",sans-serif!important; background:#FFF9F2!important; color:#2D3748; }\nh1,h2,h3,h4,h5,h6 { font-family:\"Playfair Display\",serif!important; color:#1F2937; }\na { color:#2E86AB; transition:var(--ap-transition); }\na:hover { color:#FF6B35; }\n\n/* ASTRA HEADER */\n#masthead, .ast-primary-header-bar {\n  background:#ffffff!important;\n  box-shadow:0 2px 20px rgba(0,0,0,0.06)!important;\n  border-bottom:2px solid #F3F4F6!important;\n}\n.ast-site-header-wrap { padding:0 20px; }\n.site-title a, .ast-site-name { font-family:\"Playfair Display\",serif!important; color:#2E86AB!important; font-size:24px!important; font-weight:700!important; letter-spacing:-0.5px; }\n.site-description, .ast-site-description { color:#6B7280!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* NAVIGATION */\n.main-navigation .menu > li > a,\n.ast-header-menu-container .menu > li > a {\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:15px!important;\n  color:#1F2937!important; padding:8px 14px!important; border-radius:8px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.2px;\n}\n.main-navigation .menu > li > a:hover,\n.ast-header-menu-container .menu > li > a:hover { color:#FF6B35!important; background:rgba(255,107,53,0.06)!important; }\n.ast-header-menu-container .menu > .current-menu-item > a { color:#2E86AB!important; }\n\n/* ASTRA CART ICON */\n.ast-cart-menu-wrap .count { background:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-weight:800!important; }\n\n/* STICKY HEADER */\n.ast-header-sticked { box-shadow:0 4px 20px rgba(0,0,0,0.1)!important; }\n\n/* BUTTONS - GLOBAL */\n.wp-block-button__link, button, input[type=\"submit\"],\n.woocommerce a.button, .woocommerce button.button, .button {\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important; border-radius:50px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.3px;\n}\n.woocommerce a.button.alt, .woocommerce button.button.alt,\n.woocommerce input.button.alt, .woocommerce #respond input#submit.alt {\n  background:#FF6B35!important; color:#fff!important; border-radius:50px!important;\n  padding:14px 32px!important; font-size:15px!important; font-weight:800!important;\n  box-shadow:0 4px 16px rgba(255,107,53,0.35)!important;\n}\n.woocommerce a.button.alt:hover, .woocommerce button.button.alt:hover {\n  background:#e8521e!important; transform:translateY(-2px)!important; box-shadow:0 8px 24px rgba(255,107,53,0.45)!important;\n}\n\n/* SHOP PRODUCT GRID */\n.woocommerce ul.products { display:grid!important; gap:24px!important; }\n@media(min-width:900px){ .woocommerce ul.products { grid-template-columns:repeat(3,1fr)!important; } }\n@media(max-width:899px) and (min-width:600px){ .woocommerce ul.products { grid-template-columns:repeat(2,1fr)!important; } }\n@media(max-width:599px){ .woocommerce ul.products { grid-template-columns:1fr!important; } }\n.woocommerce ul.products li.product {\n  background:#ffffff!important; border:1px solid #F3F4F6!important;\n  border-radius:var(--ap-radius)!important; overflow:hidden!important;\n  box-shadow:0 2px 12px rgba(0,0,0,0.05)!important; transition:var(--ap-transition)!important;\n  padding:0!important; position:relative;\n}\n.woocommerce ul.products li.product:hover {\n  transform:translateY(-8px)!important; border-color:#2E86AB!important;\n  box-shadow:0 20px 50px rgba(46,134,171,0.18)!important;\n}\n.woocommerce ul.products li.product .woocommerce-LoopProduct-link { display:block; }\n.woocommerce ul.products li.product img { transition:var(--ap-transition)!important; width:100%!important; aspect-ratio:1/1!important; object-fit:cover!important; }\n.woocommerce ul.products li.product:hover img { transform:scale(1.04)!important; }\n.woocommerce ul.products li.product .woocommerce-loop-product__title {\n  font-family:\"Playfair Display\",serif!important; font-size:17px!important; font-weight:700!important;\n  color:#1F2937!important; padding:16px 16px 4px!important; line-height:1.3!important; margin:0!important;\n}\n.woocommerce ul.products li.product .price {\n  color:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-size:20px!important;\n  font-weight:800!important; padding:0 16px 12px!important; display:block!important;\n}\n.woocommerce ul.products li.product .price del { color:#9CA3AF!important; font-size:14px!important; font-weight:600!important; }\n.woocommerce ul.products li.product a.button, .woocommerce ul.products li.product button.button {\n  background:#2E86AB!important; color:#fff!important; border-radius:50px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:13px!important;\n  padding:10px 20px!important; margin:0 16px 16px!important; display:inline-block!important;\n  transition:var(--ap-transition)!important;\n}\n.woocommerce ul.products li.product a.button:hover, .woocommerce ul.products li.product button.button:hover {\n  background:#FF6B35!important; transform:scale(1.05)!important;\n}\n.woocommerce span.onsale {\n  background:#FF6B35!important; color:#fff!important; border-radius:8px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important;\n  font-size:12px!important; padding:4px 10px!important; top:12px!important; left:12px!important;\n}\n\n/* SINGLE PRODUCT */\n.woocommerce div.product .product_title {\n  font-family:\"Playfair Display\",serif!important; font-size:32px!important; color:#1F2937!important;\n}\n.woocommerce div.product p.price, .woocommerce div.product span.price {\n  color:#FF6B35!important; font-size:28px!important; font-weight:800!important; font-family:\"Nunito\",sans-serif!important;\n}\n.woocommerce div.product .woocommerce-product-rating .star-rating { color:#F18F01!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li { border-radius:12px 12px 0 0!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li.active { background:#FFF9F2!important; border-color:#2E86AB!important; }\n\n/* BREADCRUMB */\n.woocommerce .woocommerce-breadcrumb { font-family:\"Nunito\",sans-serif!important; color:#9CA3AF!important; font-size:14px!important; }\n.woocommerce .woocommerce-breadcrumb a { color:#2E86AB!important; }\n\n/* CART */\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce table.shop_table { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce table.shop_table th { background:#1F2937!important; color:#fff!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; }\n.woocommerce-cart .cart-collaterals .cart_totals h2 { font-family:\"Playfair Display\",serif!important; }\n\n/* CHECKOUT */\n.woocommerce-checkout #order_review_heading,\n.woocommerce-checkout h3#ship-to-different-address,\n.woocommerce-checkout #order_review .woocommerce-checkout-review-order-table th { font-family:\"Playfair Display\",serif!important; }\n.woocommerce #payment #place_order {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px 40px!important; width:100%!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce #payment #place_order:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce form .form-row input.input-text, .woocommerce form .form-row textarea,\n.woocommerce form .form-row select { border-radius:12px!important; border-color:#E5E7EB!important; font-family:\"Nunito\",sans-serif!important; padding:14px 16px!important; }\n\n/* MY ACCOUNT */\n.woocommerce-account .woocommerce-MyAccount-navigation ul { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li { border-bottom:1px solid #F3F4F6!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a { font-family:\"Nunito\",sans-serif!important; font-weight:600!important; padding:14px 20px!important; color:#1F2937!important; display:block!important; transition:var(--ap-transition)!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a:hover, .woocommerce-account .woocommerce-MyAccount-navigation li.is-active a { background:#2E86AB!important; color:#fff!important; }\n\n/* FOOTER */\n#colophon, .site-footer { background:#1F2937!important; color:#D1D5DB!important; padding-top:60px!important; }\n.site-footer .widget-title, .site-footer h2, .site-footer h3 { font-family:\"Playfair Display\",serif!important; color:#ffffff!important; margin-bottom:20px!important; font-size:18px!important; }\n.site-footer p, .site-footer li, .site-footer a { font-family:\"Nunito\",sans-serif!important; }\n.site-footer a { color:#F18F01!important; transition:var(--ap-transition)!important; }\n.site-footer a:hover { color:#ffffff!important; }\n.site-footer ul { list-style:none!important; padding:0!important; }\n.site-footer ul li { padding:6px 0!important; border-bottom:1px solid rgba(255,255,255,0.06)!important; }\n.ast-small-footer { background:#111827!important; border-top:1px solid rgba(255,255,255,0.08)!important; }\n.ast-small-footer .ast-footer-copyright { color:#9CA3AF!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* WOOCOMMERCE NOTICES */\n.woocommerce-message { background:#ecfdf5!important; border-left-color:#10B981!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-error { background:#fef2f2!important; border-left-color:#EF4444!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-info { background:#eff6ff!important; border-left-color:#2E86AB!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* PAGINATION */\n.woocommerce nav.woocommerce-pagination ul li a, .woocommerce nav.woocommerce-pagination ul li span {\n  border-radius:8px!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; transition:var(--ap-transition)!important;\n}\n.woocommerce nav.woocommerce-pagination ul li a:hover, .woocommerce nav.woocommerce-pagination ul li span.current {\n  background:#2E86AB!important; border-color:#2E86AB!important; color:#fff!important;\n}\n\n/* SEARCH */\n.woocommerce-product-search input[type=\"search\"] { border-radius:50px!important; border:2px solid #E5E7EB!important; padding:12px 20px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-product-search button[type=\"submit\"] { background:#2E86AB!important; border-radius:0 50px 50px 0!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* REVIEW STARS */\n.star-rating { color:#F18F01!important; }\n.woocommerce-product-rating .woocommerce-review-link { font-family:\"Nunito\",sans-serif!important; color:#6B7280!important; }','astra','','inherit','closed','closed','','26-revision-v1','','','2026-04-18 23:56:46','2026-04-18 13:56:46','',26,'https://furlio.au/?p=27',0,'revision','',0),
(28,0,'2026-04-19 15:08:35','2026-04-19 05:08:35','','Refund & Returns','','publish','closed','closed','','refund-returns','','','2026-04-19 15:08:35','2026-04-19 05:08:35','',0,'https://furlio.au/refund-returns/',0,'nav_menu_item','',0),
(29,0,'2026-04-19 15:08:37','2026-04-19 05:08:37',' ','','','publish','closed','closed','','29','','','2026-04-19 15:08:37','2026-04-19 05:08:37','',0,'https://furlio.au/29/',2,'nav_menu_item','',0),
(30,0,'2026-04-19 15:08:37','2026-04-19 05:08:37',' ','','','publish','closed','closed','','30','','','2026-04-19 15:08:37','2026-04-19 05:08:37','',0,'https://furlio.au/30/',3,'nav_menu_item','',0),
(31,0,'2026-04-19 15:08:38','2026-04-19 05:08:38',' ','','','publish','closed','closed','','31','','','2026-04-19 15:08:38','2026-04-19 05:08:38','',0,'https://furlio.au/31/',4,'nav_menu_item','',0),
(32,0,'2026-04-19 15:08:39','2026-04-19 05:08:39',' ','','','publish','closed','closed','','32','','','2026-04-19 15:08:39','2026-04-19 05:08:39','',0,'https://furlio.au/32/',5,'nav_menu_item','',0),
(33,0,'2026-04-19 15:10:18','2026-04-19 05:10:18','<!-- wp:html -->\n<style>\n.ap-about { font-family:\"Nunito\",sans-serif; }\n.ap-about-hero {\n  background:linear-gradient(135deg, #0d4f6e 0%, #2E86AB 100%);\n  padding:80px 40px;\n  text-align:center;\n  color:#fff;\n}\n.ap-about-hero h1 {\n  font-family:\"Playfair Display\",serif;\n  font-size:clamp(32px,5vw,56px);\n  font-weight:700;\n  margin:0 0 16px;\n  color:#fff;\n}\n.ap-about-hero p { font-size:18px; color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; line-height:1.7; }\n.ap-about-body { max-width:900px; margin:0 auto; padding:60px 40px; }\n.ap-about-story { display:grid; grid-template-columns:1fr 1fr; gap:48px; align-items:center; margin-bottom:60px; }\n.ap-about-story-text h2 { font-family:\"Playfair Display\",serif; font-size:32px; font-weight:700; color:#1F2937; margin:0 0 16px; }\n.ap-about-story-text p { font-size:15px; color:#4B5563; line-height:1.8; margin:0 0 16px; }\n.ap-about-visual {\n  background:linear-gradient(135deg, #2E86AB, #1a5f7a);\n  border-radius:16px;\n  padding:48px 32px;\n  text-align:center;\n  color:#fff;\n}\n.ap-about-visual-icon { font-size:80px; margin-bottom:16px; display:block; }\n.ap-about-visual h3 { font-family:\"Playfair Display\",serif; font-size:24px; margin:0 0 8px; }\n.ap-about-visual p { font-size:14px; opacity:0.8; margin:0; }\n.ap-values { background:#FFF9F2; border-radius:16px; padding:48px; margin-bottom:60px; }\n.ap-values h2 { font-family:\"Playfair Display\",serif; font-size:28px; font-weight:700; color:#1F2937; margin:0 0 32px; text-align:center; }\n.ap-values-grid { display:grid; grid-template-columns:repeat(3,1fr); gap:24px; }\n.ap-value-card { text-align:center; padding:24px 16px; }\n.ap-value-icon { font-size:40px; display:block; margin-bottom:12px; }\n.ap-value-title { font-weight:700; color:#1F2937; font-size:16px; margin:0 0 8px; font-family:\"Playfair Display\",serif; }\n.ap-value-desc { font-size:13px; color:#6B7280; line-height:1.6; margin:0; }\n.ap-promise { background:linear-gradient(135deg, #FF6B35, #e85d2e); border-radius:16px; padding:48px; text-align:center; color:#fff; margin-bottom:60px; }\n.ap-promise h2 { font-family:\"Playfair Display\",serif; font-size:28px; margin:0 0 12px; }\n.ap-promise p { font-size:15px; opacity:0.9; max-width:560px; margin:0 auto 24px; line-height:1.7; }\n.ap-promise-btn { display:inline-block; background:#fff; color:#FF6B35; padding:14px 32px; border-radius:30px; font-weight:700; text-decoration:none; font-size:15px; }\n@media(max-width:700px){\n  .ap-about-story { grid-template-columns:1fr; }\n  .ap-values-grid { grid-template-columns:1fr; }\n  .ap-about-body { padding:40px 24px; }\n}\n</style>\n<div class=\"ap-about\">\n  <div class=\"ap-about-hero\">\n    <h1>About Furlio</h1>\n    <p>Built by pet lovers, for pet lovers. We exist to give every Aussie pet the premium care they deserve — at prices that make sense.</p>\n  </div>\n  <div class=\"ap-about-body\">\n    <div class=\"ap-about-story\">\n      <div class=\"ap-about-story-text\">\n        <h2>Our Story</h2>\n        <p>Furlio was started by a pair of dog-obsessed Australians who were tired of paying inflated prices for the same quality gear available overseas. We believed Aussie pets deserved better — and their owners deserved a fair deal.</p>\n        <p>We spent months sourcing the best pet products from trusted suppliers, testing them with our own animals, and building a store that puts the customer first. Today we ship premium pet supplies to every corner of Australia.</p>\n        <p>From the beaches of QLD to the bush of WA — every furry mate deserves the best.</p>\n      </div>\n      <div class=\"ap-about-visual\">\n        <span class=\"ap-about-visual-icon\">🐾</span>\n        <h3>Pets First. Always.</h3>\n        <p>Every product is chosen with your pet&apos;s health, comfort, and happiness in mind.</p>\n      </div>\n    </div>\n    <div class=\"ap-values\">\n      <h2>What We Stand For</h2>\n      <div class=\"ap-values-grid\">\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🏆</span>\n          <div class=\"ap-value-title\">Quality First</div>\n          <p class=\"ap-value-desc\">We only stock products we&apos;d use on our own pets. If it doesn&apos;t pass our test, it doesn&apos;t make the cut.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🚀</span>\n          <div class=\"ap-value-title\">Fast &amp; Reliable</div>\n          <p class=\"ap-value-desc\">Orders dispatched quickly with tracking on every parcel. You&apos;re always in the loop.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">💬</span>\n          <div class=\"ap-value-title\">Real Support</div>\n          <p class=\"ap-value-desc\">Talk to a real person who cares. We&apos;re here Mon–Fri 9am–5pm AEST and reply same day.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🌱</span>\n          <div class=\"ap-value-title\">Responsible Sourcing</div>\n          <p class=\"ap-value-desc\">We partner only with suppliers who meet our standards for animal welfare and product safety.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🔒</span>\n          <div class=\"ap-value-title\">Shop Safe</div>\n          <p class=\"ap-value-desc\">SSL-encrypted checkout, secure payments, and a 30-day no-fuss return policy.</p>\n        </div>\n        <div class=\"ap-value-card\">\n          <span class=\"ap-value-icon\">🇦🇺</span>\n          <div class=\"ap-value-title\">Proudly Aussie</div>\n          <p class=\"ap-value-desc\">Australian owned and operated. We ship nationwide and understand what Aussie pet owners need.</p>\n        </div>\n      </div>\n    </div>\n    <div class=\"ap-promise\">\n      <h2>Our Promise to You</h2>\n      <p>If you&apos;re not 100% happy with your order, we&apos;ll make it right — no questions asked. That&apos;s the Furlio guarantee.</p>\n      <a href=\"/pet/shop/\" class=\"ap-promise-btn\">Shop Now →</a>\n    </div>\n  </div>\n</div>\n<!-- /wp:html -->','About Us','','inherit','closed','closed','','14-revision-v1','','','2026-04-19 15:10:18','2026-04-19 05:10:18','',14,'https://furlio.au/?p=33',0,'revision','',0),
(34,0,'2026-04-19 15:11:32','2026-04-19 05:11:32','<!-- wp:html -->\n<style>\n.ap-faq { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-faq-hero { text-align:center; margin-bottom:48px; }\n.ap-faq-hero h1 { font-family:\"Playfair Display\",serif; font-size:clamp(28px,4vw,42px); font-weight:700; color:#1F2937; margin:0 0 12px; }\n.ap-faq-hero p { font-size:16px; color:#6B7280; margin:0; }\n.ap-faq-section { margin-bottom:40px; }\n.ap-faq-section-title { font-family:\"Playfair Display\",serif; font-size:20px; font-weight:700; color:#2E86AB; border-bottom:2px solid #FFF9F2; padding-bottom:8px; margin:0 0 20px; }\n.ap-faq-item { background:#FFF9F2; border-radius:12px; margin-bottom:12px; overflow:hidden; border:1px solid #fcefd9; }\n.ap-faq-q { padding:18px 20px; font-weight:700; color:#1F2937; font-size:15px; cursor:pointer; display:flex; justify-content:space-between; align-items:center; }\n.ap-faq-q::after { content:\"▼\"; font-size:11px; color:#FF6B35; transition:transform 0.2s; flex-shrink:0; margin-left:12px; }\n.ap-faq-a { padding:0 20px 18px; font-size:14px; color:#4B5563; line-height:1.8; }\n.ap-faq-cta { background:linear-gradient(135deg,#2E86AB,#1a5f7a); border-radius:16px; padding:36px; text-align:center; margin-top:40px; }\n.ap-faq-cta h3 { font-family:\"Playfair Display\",serif; color:#fff; font-size:22px; margin:0 0 8px; }\n.ap-faq-cta p { color:rgba(255,255,255,0.85); margin:0 0 20px; font-size:15px; }\n.ap-faq-cta a { background:#FF6B35; color:#fff; padding:12px 28px; border-radius:30px; text-decoration:none; font-weight:700; font-size:14px; }\n@media(max-width:600px){ .ap-faq { padding:40px 20px; } }\n</style>\n<div class=\"ap-faq\">\n  <div class=\"ap-faq-hero\">\n    <h1>Frequently Asked Questions</h1>\n    <p>Everything you need to know about shopping with Furlio</p>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">🚚 Shipping &amp; Delivery</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">How long does delivery take?</div>\n      <div class=\"ap-faq-a\">Most orders arrive within 5–10 business days across Australia. Express options are available at checkout for faster delivery. Remote areas (NT, outback WA/SA/QLD) may take 10–14 business days.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do you offer free shipping?</div>\n      <div class=\"ap-faq-a\">Yes! We offer free standard shipping on all orders over $75. Orders under $75 attract a flat $8.95 shipping fee. Free shipping applies to all Australian addresses including regional and remote.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Will I get a tracking number?</div>\n      <div class=\"ap-faq-a\">Absolutely. Every order ships with a tracking number sent to your email. You can track your parcel in real time from dispatch to delivery.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do you ship internationally?</div>\n      <div class=\"ap-faq-a\">Currently we ship within Australia only. We plan to expand to New Zealand in the future — sign up to our newsletter to be notified when international shipping launches.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">↩️ Returns &amp; Refunds</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">What is your returns policy?</div>\n      <div class=\"ap-faq-a\">We accept returns within 30 days of delivery. Items must be unused and in their original packaging. Contact us at hello@furlio.au and we will arrange a return label for eligible items.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">What if my order arrives damaged or incorrect?</div>\n      <div class=\"ap-faq-a\">We are so sorry if that happens! Please contact us within 7 days of receiving your order with a photo of the item. We will send a replacement or issue a full refund — no questions asked.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">How long do refunds take?</div>\n      <div class=\"ap-faq-a\">Refunds are processed within 3–5 business days of us receiving the returned item. The funds will appear on your original payment method within 5–10 business days depending on your bank.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">💳 Payments &amp; Security</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">What payment methods do you accept?</div>\n      <div class=\"ap-faq-a\">We accept all major credit and debit cards (Visa, Mastercard, American Express) via Stripe, as well as PayPal. All transactions are SSL-encrypted and 100% secure.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Is it safe to enter my card details?</div>\n      <div class=\"ap-faq-a\">Yes, completely. Your payment details are processed directly by Stripe — one of the world&apos;s most trusted payment providers. We never see or store your card details.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do prices include GST?</div>\n      <div class=\"ap-faq-a\">Yes. All prices shown on our store include 10% Australian GST. A full tax invoice is included with every order and emailed to you at the time of purchase.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-section\">\n    <div class=\"ap-faq-section-title\">🐾 Products &amp; Account</div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Are your products safe for all pets?</div>\n      <div class=\"ap-faq-a\">We curate products with pet safety as our top priority. All products in our range comply with Australian safety standards. Always check individual product descriptions for suitability by animal type, size, and age.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">Do I need an account to place an order?</div>\n      <div class=\"ap-faq-a\">No, you can checkout as a guest. However, creating a free account lets you track orders, save your details for faster checkout, and access your full order history.</div>\n    </div>\n    <div class=\"ap-faq-item\">\n      <div class=\"ap-faq-q\">How do I contact customer support?</div>\n      <div class=\"ap-faq-a\">Email us at hello@furlio.au or use the contact form on our <a href=\"/pet/contact-us/\" style=\"color:#2E86AB;\">Contact page</a>. We are available Monday to Friday 9am–5pm AEST and always reply within 24 hours.</div>\n    </div>\n  </div>\n\n  <div class=\"ap-faq-cta\">\n    <h3>Still have questions?</h3>\n    <p>Our friendly team is here to help — reach out any time.</p>\n    <a href=\"/pet/contact-us/\">Contact Us →</a>\n  </div>\n</div>\n<!-- /wp:html -->','FAQ','','inherit','closed','closed','','16-revision-v1','','','2026-04-19 15:11:32','2026-04-19 05:11:32','',16,'https://furlio.au/?p=34',0,'revision','',0),
(35,0,'2026-04-19 15:13:27','2026-04-19 05:13:27','<!-- wp:html -->\n<style>\n.ap-ship { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-ship h1 { font-family:\"Playfair Display\",serif; font-size:clamp(28px,4vw,40px); font-weight:700; color:#1F2937; margin:0 0 8px; }\n.ap-ship-intro { font-size:16px; color:#6B7280; margin:0 0 40px; line-height:1.7; }\n.ap-ship-card { background:#FFF9F2; border-radius:12px; padding:28px; margin-bottom:20px; border-left:4px solid #2E86AB; }\n.ap-ship-card h3 { font-family:\"Playfair Display\",serif; font-size:18px; font-weight:700; color:#1F2937; margin:0 0 12px; }\n.ap-ship-card p, .ap-ship-card li { font-size:14px; color:#4B5563; line-height:1.8; margin:0 0 8px; }\n.ap-ship-card ul { padding-left:20px; }\n.ap-ship-table { width:100%; border-collapse:collapse; margin:16px 0; }\n.ap-ship-table th { background:#2E86AB; color:#fff; padding:12px 16px; text-align:left; font-size:14px; font-weight:700; }\n.ap-ship-table td { padding:12px 16px; font-size:14px; color:#4B5563; border-bottom:1px solid #fcefd9; }\n.ap-ship-table tr:last-child td { border-bottom:none; }\n.ap-ship-highlight { background:linear-gradient(135deg,#FF6B35,#e85d2e); border-radius:12px; padding:28px; text-align:center; color:#fff; margin-top:32px; }\n.ap-ship-highlight h3 { font-family:\"Playfair Display\",serif; font-size:22px; margin:0 0 8px; }\n.ap-ship-highlight p { font-size:15px; opacity:0.9; margin:0; }\n@media(max-width:600px){ .ap-ship { padding:40px 20px; } }\n</style>\n<div class=\"ap-ship\">\n  <h1>Shipping Information</h1>\n  <p class=\"ap-ship-intro\">We ship Australia-wide — from Sydney to the Kimberley. Here is everything you need to know about how we get your order to your door.</p>\n\n  <div class=\"ap-ship-card\">\n    <h3>🚚 Delivery Timeframes</h3>\n    <table class=\"ap-ship-table\">\n      <tr><th>Location</th><th>Standard</th><th>Express</th></tr>\n      <tr><td>Metro (Sydney, Melbourne, Brisbane, Perth, Adelaide)</td><td>3–7 business days</td><td>1–3 business days</td></tr>\n      <tr><td>Regional Centres</td><td>5–10 business days</td><td>2–5 business days</td></tr>\n      <tr><td>Rural &amp; Remote Areas</td><td>10–14 business days</td><td>5–10 business days</td></tr>\n    </table>\n    <p>Orders placed before <strong>2pm AEST</strong> on business days are dispatched the same day.</p>\n  </div>\n\n  <div class=\"ap-ship-card\">\n    <h3>💸 Shipping Rates</h3>\n    <table class=\"ap-ship-table\">\n      <tr><th>Order Value</th><th>Shipping Cost</th></tr>\n      <tr><td>Under $75</td><td>$8.95 flat rate</td></tr>\n      <tr><td>$75 and over</td><td><strong>FREE</strong></td></tr>\n    </table>\n  </div>\n\n  <div class=\"ap-ship-card\">\n    <h3>📦 How We Ship</h3>\n    <ul>\n      <li>All orders are packed securely to prevent damage in transit</li>\n      <li>Tracking numbers are emailed as soon as your order ships</li>\n      <li>We use trusted Australian carriers including Australia Post and CouriersPlease</li>\n      <li>Signature on delivery may be required for orders over $200</li>\n    </ul>\n  </div>\n\n  <div class=\"ap-ship-card\">\n    <h3>❓ What if my parcel is delayed or lost?</h3>\n    <p>While rare, delays can happen. If your order has not arrived within the estimated timeframe, please contact us at <a href=\"mailto:hello@furlio.au\" style=\"color:#2E86AB;\">hello@furlio.au</a> and we will investigate with the carrier immediately. Lost parcels are fully covered.</p>\n  </div>\n\n  <div class=\"ap-ship-highlight\">\n    <h3>Free Shipping on Orders $75+</h3>\n    <p>Add more to your cart and we will cover the postage — Australia-wide, every time.</p>\n  </div>\n</div>\n<!-- /wp:html -->','Shipping Information','','inherit','closed','closed','','17-revision-v1','','','2026-04-19 15:13:27','2026-04-19 05:13:27','',17,'https://furlio.au/?p=35',0,'revision','',0),
(36,0,'2026-04-19 15:14:10','2026-04-19 05:14:10','<!-- wp:html -->\n<style>\n.ap-contact { font-family:\"Nunito\",sans-serif; }\n.ap-contact-hero { background:linear-gradient(135deg,#2E86AB,#1a5f7a); padding:60px 40px; text-align:center; color:#fff; }\n.ap-contact-hero h1 { font-family:\"Playfair Display\",serif; font-size:clamp(28px,4vw,42px); font-weight:700; margin:0 0 12px; color:#fff; }\n.ap-contact-hero p { font-size:16px; opacity:0.85; max-width:500px; margin:0 auto; }\n.ap-contact-body { max-width:900px; margin:0 auto; padding:60px 40px; display:grid; grid-template-columns:1fr 1fr; gap:48px; }\n.ap-contact-info h2 { font-family:\"Playfair Display\",serif; font-size:24px; font-weight:700; color:#1F2937; margin:0 0 20px; }\n.ap-contact-info-item { display:flex; gap:14px; align-items:flex-start; margin-bottom:24px; }\n.ap-contact-info-icon { width:44px; height:44px; background:#FFF9F2; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:20px; flex-shrink:0; }\n.ap-contact-info-text strong { display:block; color:#1F2937; font-size:14px; font-weight:700; margin-bottom:4px; }\n.ap-contact-info-text span { color:#6B7280; font-size:14px; line-height:1.6; }\n.ap-contact-info-text a { color:#2E86AB; text-decoration:none; }\n.ap-contact-form-wrap { background:#FFF9F2; border-radius:16px; padding:32px; }\n.ap-contact-form-wrap h2 { font-family:\"Playfair Display\",serif; font-size:22px; font-weight:700; color:#1F2937; margin:0 0 20px; }\n.wpcf7-form input[type=text], .wpcf7-form input[type=email], .wpcf7-form textarea {\n  width:100%; padding:12px 16px; border:2px solid #fcefd9; border-radius:8px; font-size:14px; font-family:\"Nunito\",sans-serif; box-sizing:border-box; margin-bottom:12px; background:#fff; color:#1F2937; outline:none; transition:border-color 0.2s;\n}\n.wpcf7-form input:focus, .wpcf7-form textarea:focus { border-color:#2E86AB; }\n.wpcf7-form input[type=submit] { background:#FF6B35; color:#fff; border:none; padding:14px 32px; border-radius:30px; font-weight:700; font-size:15px; font-family:\"Nunito\",sans-serif; cursor:pointer; width:100%; transition:background 0.2s; }\n.wpcf7-form input[type=submit]:hover { background:#e85d2e; }\n@media(max-width:700px){ .ap-contact-body { grid-template-columns:1fr; padding:40px 24px; } }\n</style>\n<div class=\"ap-contact\">\n  <div class=\"ap-contact-hero\">\n    <h1>Contact Us</h1>\n    <p>Got a question? We are here to help. Send us a message and we will get back to you within 24 hours.</p>\n  </div>\n  <div class=\"ap-contact-body\">\n    <div class=\"ap-contact-info\">\n      <h2>Get in Touch</h2>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">📧</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Email Us</strong>\n          <span><a href=\"mailto:hello@furlio.au\">hello@furlio.au</a><br>We reply within 24 hours</span>\n        </div>\n      </div>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">🕐</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Business Hours</strong>\n          <span>Monday – Friday<br>9:00am – 5:00pm AEST</span>\n        </div>\n      </div>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">🚚</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Order Enquiries</strong>\n          <span>Please include your order number in all correspondence for fastest response.</span>\n        </div>\n      </div>\n      <div class=\"ap-contact-info-item\">\n        <div class=\"ap-contact-info-icon\">↩️</div>\n        <div class=\"ap-contact-info-text\">\n          <strong>Returns</strong>\n          <span>See our <a href=\"/pet/refund-and-returns-policy/\">Returns Policy</a> — 30-day hassle-free returns.</span>\n        </div>\n      </div>\n    </div>\n    <div class=\"ap-contact-form-wrap\">\n      <h2>Send a Message</h2>\n      [contact-form-7 id=\"contact-form\"]\n    </div>\n  </div>\n</div>\n<!-- /wp:html -->','Contact Us','','inherit','closed','closed','','15-revision-v1','','','2026-04-19 15:14:10','2026-04-19 05:14:10','',15,'https://furlio.au/?p=36',0,'revision','',0),
(38,0,'2026-04-19 18:03:09','2026-04-19 08:03:09','@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\\n\\n/* Global font overrides */\\nbody, p, li, td, input, button, select, textarea {\\n  font-family: \"Nunito\", sans-serif !important;\\n}\\nh1, h2, h3, h4, h5, h6,\\n.woocommerce-loop-product__title,\\n.product_title,\\n.woocommerce h1, .woocommerce h2 {\\n  font-family: \"Playfair Display\", serif !important;\\n}\\n\\n/* WooCommerce product cards */\\n.woocommerce ul.products li.product .button {\\n  background: #FF6B35 !important;\\n  color: #fff !important;\\n  border-radius: 30px !important;\\n  font-family: \"Nunito\", sans-serif !important;\\n  font-weight: 700 !important;\\n  letter-spacing: 0.5px;\\n}\\n.woocommerce ul.products li.product .button:hover {\\n  background: #e85d2e !important;\\n}\\n.woocommerce ul.products li.product a img {\\n  border-radius: 12px 12px 0 0;\\n}\\n.woocommerce ul.products li.product {\\n  border-radius: 12px;\\n  overflow: hidden;\\n  box-shadow: 0 4px 16px rgba(46,134,171,0.08);\\n  border: 1px solid #fcefd9;\\n  transition: transform 0.25s, box-shadow 0.25s;\\n}\\n.woocommerce ul.products li.product:hover {\\n  transform: translateY(-4px);\\n  box-shadow: 0 12px 32px rgba(46,134,171,0.14);\\n}\\n/* Price colour */\\n.woocommerce .price, .woocommerce-page .price {\\n  color: #2E86AB !important;\\n  font-weight: 700 !important;\\n}\\n/* Add to cart button on single product */\\n.woocommerce .single_add_to_cart_button {\\n  background: #FF6B35 !important;\\n  border-radius: 30px !important;\\n  font-family: \"Nunito\", sans-serif !important;\\n  font-weight: 700 !important;\\n  letter-spacing: 0.5px;\\n  padding: 16px 40px !important;\\n}\\n.woocommerce .single_add_to_cart_button:hover {\\n  background: #e85d2e !important;\\n}\\n/* Cart/checkout buttons */\\n.woocommerce .checkout-button,\\n.woocommerce a.button.alt,\\n.woocommerce button.button.alt {\\n  background: #FF6B35 !important;\\n  border-radius: 30px !important;\\n  font-family: \"Nunito\", sans-serif !important;\\n  font-weight: 700 !important;\\n}\\n/* Notices */\\n.woocommerce-message { border-top-color: #2E86AB !important; }\\n/* Sale badge */\\n.woocommerce span.onsale {\\n  background: #FF6B35 !important;\\n  border-radius: 30px !important;\\n  font-family: \"Nunito\", sans-serif !important;\\n  font-weight: 700 !important;\\n}\\n/* Breadcrumbs */\\n.woocommerce .woocommerce-breadcrumb a { color: #2E86AB; }\\n/* Star ratings */\\n.woocommerce .star-rating span::before,\\n.woocommerce .star-rating::before {\\n  color: #F18F01;\\n}\\n/* Mobile nav */\\n@media (max-width: 768px) {\\n  .ast-mobile-menu-trigger-fill { background: #FF6B35 !important; }\\n}\\n/* ── Homepage: remove container padding, hide page title ── */\\n.home .entry-title,\\n.home .ast-page-header,\\n.home .page-header { display: none !important; }\\n\\n.home .ast-container,\\n.home .entry-content { padding-left: 0 !important; padding-right: 0 !important; max-width: 100% !important; }\\n\\n.home .site-content .ast-container { padding: 0 !important; }\\n.home article.page { padding: 0 !important; margin: 0 !important; }\\n.home .entry-content .wp-block-group__inner-container { max-width: 100%; }\\n\\n/* Fix full-width page on Astra */\\n.page-template-page-fullwidth .ast-container,\\n.page-template-page-fullwidth .entry-content { max-width: 100% !important; padding: 0 !important; }\\n\\n/* Remove top/bottom spacing on homepage */\\n.home #content.site-content { padding-top: 0 !important; }\\n.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\\n\\n/* ── Homepage full-width: override Astra CSS vars ── */\\nbody.home {\\n  --ast-normal-container-width: 100% !important;\\n  --ast-container-default-xlg-padding: 0 !important;\\n  --ast-container-default-lg-padding: 0 !important;\\n  --ast-container-default-slg-padding: 0 !important;\\n  --ast-container-default-md-padding: 0 !important;\\n  --ast-container-default-sm-padding: 0 !important;\\n  --ast-container-default-xs-padding: 0 !important;\\n  --ast-container-default-xxs-padding: 0 !important;\\n}\\nbody.home .entry-header,\\nbody.home h1.entry-title { display: none !important; }\\nbody.home .ast-container { max-width: 100% !important; padding: 0 !important; }\\nbody.home .entry-content { padding: 0 !important; max-width: 100% !important; }\\nbody.home #content.site-content { padding-top: 0 !important; padding-bottom: 0 !important; }\\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\\nbody.home #primary { padding: 0 !important; }\\n\\n/* ── Inner pages: tighten container side padding ── */\\n.ast-container {\\n  padding-left: 20px !important;\\n  padding-right: 20px !important;\\n}\\n@media (min-width: 922px) {\\n  .ast-container {\\n    padding-left: 30px !important;\\n    padding-right: 30px !important;\\n  }\\n}\\n\n\n/* ── DESIGN FIXES (2026-04) ── */\n/* Taller hero */\n.ap-hero { min-height: 85vh !important; }\n\n/* Reduce section vertical padding */\n.ap-section { padding: 65px 0 !important; }\n.ap-newsletter { padding: 65px 0 !important; }\n\n/* Astra: remove any lingering top padding from primary */\nbody.home #primary { padding-top: 0 !important; }\nbody.home .ast-article-single { padding-top: 0 !important; }\n\n/* Nav: clean header look */\n.ast-primary-header-bar { background: #ffffff !important; border-bottom: 1px solid #f0f0f0 !important; }\n.main-navigation ul li a, .ast-primary-navigation a { font-weight: 600 !important; }\n','Custom CSS','','publish','closed','closed','','custom-css','','','2026-04-24 21:06:31','2026-04-24 11:06:31','',0,'https://furlio.au/custom-css/',0,'custom_css','',0),
(39,0,'2026-04-19 18:31:22','2026-04-19 08:31:22','<!-- wp:html -->\n<style>\n.ap-legal { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-legal h1 { font-family:\"Playfair Display\",serif; font-size:clamp(26px,4vw,38px); font-weight:700; color:#1F2937; margin:0 0 8px; }\n.ap-legal-date { font-size:13px; color:#9CA3AF; margin:0 0 40px; }\n.ap-legal h2 { font-family:\"Playfair Display\",serif; font-size:20px; font-weight:700; color:#1F2937; margin:32px 0 12px; border-left:3px solid #2E86AB; padding-left:12px; }\n.ap-legal p, .ap-legal li { font-size:14px; color:#4B5563; line-height:1.9; margin:0 0 12px; }\n.ap-legal ul { padding-left:20px; }\n.ap-legal a { color:#2E86AB; }\n@media(max-width:600px){ .ap-legal { padding:40px 20px; } }\n</style>\n<div class=\"ap-legal\">\n  <h1>Privacy Policy</h1>\n  <p class=\"ap-legal-date\">Last updated: April 2026</p>\n\n  <p>Furlio (\"<strong>we</strong>\", \"<strong>us</strong>\", \"<strong>our</strong>\") is committed to protecting your privacy in accordance with the Australian Privacy Act 1988 (Cth) and the Australian Privacy Principles (APPs). This policy explains how we collect, use, and protect your personal information.</p>\n\n  <h2>1. Information We Collect</h2>\n  <p>We collect personal information you provide when you:</p>\n  <ul>\n    <li>Place an order (name, email, phone, delivery address, payment details)</li>\n    <li>Create an account or subscribe to our newsletter</li>\n    <li>Contact us via email or our contact form</li>\n    <li>Browse our website (IP address, browser type, pages visited, via cookies)</li>\n  </ul>\n\n  <h2>2. How We Use Your Information</h2>\n  <ul>\n    <li>Process and fulfil your orders</li>\n    <li>Send order confirmations, tracking updates, and receipts</li>\n    <li>Respond to enquiries and provide customer support</li>\n    <li>Send marketing emails (only with your consent — you may unsubscribe at any time)</li>\n    <li>Improve our website and services</li>\n    <li>Comply with legal obligations</li>\n  </ul>\n\n  <h2>3. Payment Security</h2>\n  <p>We do not store your credit card details. All payments are processed by Stripe, a PCI DSS Level 1 certified payment provider. Your card details are encrypted and never accessible to us.</p>\n\n  <h2>4. Sharing Your Information</h2>\n  <p>We do not sell your personal information. We share information only with trusted third parties necessary to operate our business:</p>\n  <ul>\n    <li><strong>Shipping carriers</strong> (Australia Post, CouriersPlease) — to deliver your orders</li>\n    <li><strong>Stripe / PayPal</strong> — to process payments securely</li>\n    <li><strong>Mailchimp</strong> — for email marketing (only if you have subscribed)</li>\n    <li><strong>Google Analytics</strong> — anonymous website traffic analysis</li>\n  </ul>\n\n  <h2>5. Cookies</h2>\n  <p>Our website uses cookies to remember your cart, preferences, and browsing session. You may disable cookies in your browser settings, though this may affect website functionality.</p>\n\n  <h2>6. Your Rights</h2>\n  <p>Under Australian privacy law you have the right to access, correct, or request deletion of your personal information. To exercise these rights, contact us at <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a>.</p>\n\n  <h2>7. Data Retention</h2>\n  <p>We retain your personal information for as long as needed to fulfil orders and comply with legal obligations (generally 7 years for financial records as required by Australian law).</p>\n\n  <h2>8. Contact</h2>\n  <p>For any privacy enquiries, please contact:<br>\n  <strong>Furlio</strong><br>\n  Email: <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a></p>\n</div>\n<!-- /wp:html -->','Privacy Policy','','inherit','closed','closed','','3-revision-v1','','','2026-04-19 18:31:22','2026-04-19 08:31:22','',3,'https://furlio.au/?p=39',0,'revision','',0),
(40,0,'2026-04-19 18:31:42','2026-04-19 08:31:42','<!-- wp:html -->\n<style>\n.ap-legal { max-width:800px; margin:0 auto; padding:60px 40px; font-family:\"Nunito\",sans-serif; }\n.ap-legal h1 { font-family:\"Playfair Display\",serif; font-size:clamp(26px,4vw,38px); font-weight:700; color:#1F2937; margin:0 0 8px; }\n.ap-legal-date { font-size:13px; color:#9CA3AF; margin:0 0 40px; }\n.ap-legal h2 { font-family:\"Playfair Display\",serif; font-size:20px; font-weight:700; color:#1F2937; margin:32px 0 12px; border-left:3px solid #FF6B35; padding-left:12px; }\n.ap-legal p, .ap-legal li { font-size:14px; color:#4B5563; line-height:1.9; margin:0 0 12px; }\n.ap-legal ul { padding-left:20px; }\n.ap-legal a { color:#2E86AB; }\n.ap-legal-highlight { background:#FFF9F2; border-radius:12px; padding:24px; margin:24px 0; border:1px solid #fcefd9; }\n.ap-legal-highlight p { margin:0; font-weight:600; color:#1F2937; }\n@media(max-width:600px){ .ap-legal { padding:40px 20px; } }\n</style>\n<div class=\"ap-legal\">\n  <h1>Refund &amp; Returns Policy</h1>\n  <p class=\"ap-legal-date\">Last updated: April 2026</p>\n\n  <div class=\"ap-legal-highlight\">\n    <p>🐾 &nbsp;We want you (and your pet!) to be 100% happy. If you are not satisfied with your order for any reason, we will make it right.</p>\n  </div>\n\n  <h2>Returns Window</h2>\n  <p>You may return most items within <strong>30 days of delivery</strong>. Items must be:</p>\n  <ul>\n    <li>Unused and in original condition</li>\n    <li>In original packaging with all tags and accessories included</li>\n    <li>Accompanied by proof of purchase (order number or receipt)</li>\n  </ul>\n\n  <h2>Non-Returnable Items</h2>\n  <ul>\n    <li>Perishable products (food, treats) once opened</li>\n    <li>Personalised or custom-made items</li>\n    <li>Hygiene products (beds, bowls) once used</li>\n    <li>Items returned more than 30 days after delivery</li>\n  </ul>\n\n  <h2>How to Start a Return</h2>\n  <p>Email us at <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a> with:</p>\n  <ul>\n    <li>Your order number</li>\n    <li>The item(s) you wish to return</li>\n    <li>The reason for the return</li>\n  </ul>\n  <p>We will respond within 1 business day with a return label and instructions.</p>\n\n  <h2>Damaged or Incorrect Items</h2>\n  <p>If your item arrived damaged or we sent the wrong product, please contact us within <strong>7 days of delivery</strong> with a photo. We will send a replacement or issue a full refund immediately — no return required.</p>\n\n  <h2>Refund Processing</h2>\n  <ul>\n    <li>Refunds are processed within <strong>3–5 business days</strong> of receiving the returned item</li>\n    <li>Refunds are issued to your original payment method</li>\n    <li>Allow 5–10 business days for the refund to appear on your statement</li>\n    <li>Original shipping costs are non-refundable unless the return is due to our error</li>\n  </ul>\n\n  <h2>Exchanges</h2>\n  <p>We do not process direct exchanges. Please return the original item for a refund and place a new order for the replacement product.</p>\n\n  <h2>Questions?</h2>\n  <p>Contact our team at <a href=\"mailto:hello@furlio.au\">hello@furlio.au</a> — Mon–Fri 9am–5pm AEST. We always reply within 24 hours.</p>\n</div>\n<!-- /wp:html -->','Refund and Returns Policy','','inherit','closed','closed','','10-revision-v1','','','2026-04-19 18:31:42','2026-04-19 08:31:42','',10,'https://furlio.au/?p=40',0,'revision','',0),
(41,1,'2026-04-19 21:02:09','2026-04-19 11:02:09','<h3>Give Your Furry Mate the Sleep They Deserve</h3><p>Every dog deserves a proper kip, and this <strong>Orthopedic Memory Foam Dog Bed</strong> delivers exactly that. Designed for Aussie dogs of all shapes and sizes, this bed cradles joints and eases pressure points – perfect for aging dogs or pups who love to sprawl out in the backyard after a big day.</p><ul><li><strong>Premium Memory Foam Core:</strong> Contours to your dog\'s body for deep, restorative sleep and joint relief – ideal for senior dogs or breeds prone to hip dysplasia.</li><li><strong>Water-Resistant Base:</strong> Built tough for Aussie backyards and muddy paws, the non-slip waterproof bottom keeps the bed firmly in place on tiles, timber, or carpet.</li><li><strong>Removable Washable Cover:</strong> Chuck it in the washing machine – because let\'s be honest, Aussie dogs love to get grubby.</li><li><strong>Calming Bolster Sides:</strong> Raised edges give your dog a secure, cosy nook that reduces anxiety during storms or fireworks season.</li><li><strong>Safe &amp; Non-Toxic Materials:</strong> Free from harmful chemicals, certified safe for pets and your household.</li></ul><p>Whether your pup is a boisterous Kelpie or a laid-back Labrador, this bed is built to handle real Aussie life. Available in multiple sizes to suit dogs from 5kg to 40kg+.</p><p><strong>🐾 Fast local shipping across Australia – order before 2pm AEST for same-day dispatch!</strong> Stock is flying out the door, so grab yours today and treat your best mate to the rest they\'ve earned.</p>','Orthopedic Memory Foam Dog Bed – Dog Accessories Australia','Spoil your furry mate with orthopedic memory foam support built for Aussie dogs of every size. Washable, durable, and delivered fast across straya.','publish','open','closed','','orthopedic-memory-foam-dog-bed-dog-accessories-australia','','','2026-04-25 11:25:15','2026-04-25 01:25:15','',0,'https://furlio.au/product/orthopedic-memory-foam-dog-bed-dog-accessories-australia/',0,'product','',0),
(42,1,'2026-04-19 21:02:09','2026-04-19 11:02:09','<h3>Keep Your Cat Entertained for Hours – Guaranteed!</h3><p>Is your cat turning the couch into a scratching post out of boredom? The <strong>Interactive Feather Wand Cat Toy</strong> is here to save your furniture and supercharge your kitty\'s playtime. Loved by cat owners right across straya, this wand delivers the unpredictable, fluttery movement that triggers your cat\'s natural hunting instinct.</p><ul><li><strong>Stimulates Natural Prey Drive:</strong> The erratic feather movement mimics real birds, keeping even the laziest indoor cats leaping, pouncing, and fully engaged.</li><li><strong>Extendable 65cm Wand:</strong> Gives you a comfortable reach so you can play from the couch – because we love our cats AND our comfort.</li><li><strong>Replaceable Feather Attachment:</strong> When the feathers get too loved, simply swap in a new attachment – no need to buy a whole new toy.</li><li><strong>Lightweight &amp; Safe:</strong> Made from non-toxic, pet-safe materials with no small parts that could be swallowed, giving Aussie pet parents total peace of mind.</li><li><strong>Bonding Tool:</strong> Daily interactive play reduces anxiety, destructive behaviour, and strengthens the bond between you and your furry mate.</li></ul><p>Vets and cat behaviourists across Australia recommend daily interactive play for indoor cats, and this wand makes it effortless and fun for both of you. It\'s the purr-fect addition to any Aussie cat household.</p><p><strong>🐱 Limited stock available – snag yours today and watch your cat go absolutely wild!</strong> Ships fast to all Australian states and territories.</p>','Interactive Feather Wand Cat Toy – Cat Toys Australia','Send your cat absolutely wild with this feather wand – the ultimate interactive cat toy for Aussie indoor kitties. Fast shipping, endless fun guaranteed.','publish','open','closed','','interactive-feather-wand-cat-toy-cat-toys-australia','','','2026-04-25 11:25:15','2026-04-25 01:25:15','',0,'https://furlio.au/product/interactive-feather-wand-cat-toy-cat-toys-australia/',0,'product','',0),
(43,1,'2026-04-19 21:02:10','2026-04-19 11:02:10','<h3>Stop Dangerous Gulping Before It Becomes a Vet Bill</h3><p>If your dog inhales their dinner in under 30 seconds, you need the <strong>Stainless Steel Slow Feeder Dog Bowl</strong>. Bloat (GDV) is one of the most life-threatening conditions for dogs in Australia, and fast eating is a major trigger. This cleverly designed bowl turns every meal into a healthy, mindful experience – for dogs, anyway.</p><ul><li><strong>Veterinarian-Recommended Design:</strong> The maze-style raised ridges slow eating speed by up to 10x, significantly reducing the risk of bloat, vomiting, and digestive discomfort.</li><li><strong>Premium Food-Grade Stainless Steel:</strong> Unlike plastic bowls that harbour bacteria in scratches, this rust-resistant steel is hygienic, dishwasher-safe, and built to last in Aussie conditions.</li><li><strong>Anti-Slip Silicone Base:</strong> No more bowl-chasing around the kitchen floor – the rubberised base keeps it locked in place even for enthusiastic eaters.</li><li><strong>Mental Stimulation at Mealtime:</strong> Working around the ridges gives your dog\'s brain a workout, helping reduce boredom and destructive behaviour between meals.</li><li><strong>Two Sizes Available:</strong> Suits small breeds like Cavoodles right up to big Aussie favourites like Golden Retrievers and German Shepherds.</li></ul><p>Trusted by thousands of Aussie pet owners who\'ve made the switch from cheap plastic to long-lasting stainless steel. Once your furry mate uses this bowl, you\'ll wonder how you managed without it.</p><p><strong>🦴 Order today and enjoy fast, tracked shipping across Australia. Your dog\'s health is worth it!</strong></p>','Stainless Steel Slow Feeder Dog Bowl – Australian Pet Supplies','Protect your furry mate from dangerous gulping with this vet-recommended stainless steel slow feeder bowl. Durable, hygienic, and built for Aussie dogs.','publish','open','closed','','stainless-steel-slow-feeder-dog-bowl-australian-pet-supplies','','','2026-04-25 11:25:15','2026-04-25 01:25:15','',0,'https://furlio.au/product/stainless-steel-slow-feeder-dog-bowl-australian-pet-supplies/',0,'product','',0),
(44,1,'2026-04-19 21:02:10','2026-04-19 11:02:10','<h3>Grooming Your Pet Just Got Ridiculously Easy</h3><p>Shed season in Australia is no joke – especially when your furry mate is leaving clumps of fur across every couch, car seat, and clean shirt you own. The <strong>Self-Cleaning Slicker Brush</strong> tackles shedding at the source, leaving your pet\'s coat smooth and your home noticeably cleaner in just minutes a day.</p><ul><li><strong>One-Click Self-Cleaning Mechanism:</strong> Press the button and the retractable pins push collected fur straight off the brush – no picking, no mess, no drama. Just bin it and go.</li><li><strong>Fine Stainless Steel Pins:</strong> Gently detangles mats, removes loose undercoat fur, and stimulates healthy skin circulation without scratching or irritating sensitive Aussie pet skin.</li><li><strong>Works on Dogs AND Cats:</strong> Suitable for short, medium, and long-haired breeds – from Aussie Shepherds and Maine Coons to Burmese cats and Beagles.</li><li><strong>Ergonomic Non-Slip Handle:</strong> Designed for extended grooming sessions, the soft-grip handle reduces hand fatigue – your pet will love the extra attention.</li><li><strong>Reduces Hairballs in Cats:</strong> Regular brushing removes loose fur before your cat swallows it, meaning fewer hairballs and happier mornings for everyone.</li></ul><p>Professional groomers across Australia rate slicker brushes as the number one tool for at-home coat maintenance. With the self-cleaning feature, it\'s finally practical for busy Aussie households.</p><p><strong>✨ Grab yours today – ships fast to every corner of straya, from Darwin to Hobart!</strong></p>','Self-Cleaning Slicker Brush for Dogs &amp; Cats – Australia','Banish pet fur from your home with this self-cleaning slicker brush – the grooming tool every Aussie pet owner needs. Works on dogs and cats alike.','publish','open','closed','','self-cleaning-slicker-brush-for-dogs-cats-australia','','','2026-04-25 11:25:14','2026-04-25 01:25:14','',0,'https://furlio.au/product/self-cleaning-slicker-brush-for-dogs-cats-australia/',0,'product','',0),
(45,1,'2026-04-19 21:02:11','2026-04-19 11:02:11','<h3>Your Budgie Deserves a First-Class Perch, Mate</h3><p>Aussie bird owners know that a stimulated bird is a happy, healthy bird. The <strong>Hanging Budgie Bird Swing Perch</strong> adds instant enrichment to any cage, giving your feathered mate a favourite spot to sway, preen, and watch the world go by – just like nature intended.</p><ul><li><strong>Natural Wooden Perch:</strong> Crafted from bird-safe, untreated natural wood that\'s gentle on delicate budgie feet and helps maintain healthy nail length through natural grip and movement.</li><li><strong>Stimulating Swing Motion:</strong> The gentle swaying movement keeps birds mentally engaged, reduces cage stress, and encourages exercise – vital for indoor birds that can\'t fly free.</li><li><strong>Colourful Acrylic Bead Accents:</strong> Bright beads attract curious budgies and provide an additional pecking and play activity to keep boredom at bay.</li><li><strong>Universal Cage Clip:</strong> The easy-attach clip fits virtually all standard budgie and parakeet cages sold in Australia – no tools required.</li><li><strong>Safe &amp; Non-Toxic:</strong> All materials are free from harmful dyes, varnishes, and chemicals – because your bird\'s safety is everything.</li></ul><p>Perfect for budgies, cockatiels, and small parakeets, this swing is a favourite among Aussie bird lovers who want to give their pets the best quality of life without breaking the bank. It\'s a small addition that makes a massive difference to your bird\'s daily happiness.</p><p><strong>🦜 Stock is limited – order yours today and treat your chirpy little mate to something special. Ships fast across all of straya!</strong></p>','Hanging Budgie Bird Swing Perch – Bird &amp; Aquatic Supplies','Give your budgie the ultimate perch with this colourful wooden swing – a must-have for Aussie bird lovers wanting happy, stimulated feathered mates.','publish','open','closed','','hanging-budgie-bird-swing-perch-bird-aquatic-supplies','','','2026-04-25 11:25:14','2026-04-25 01:25:14','',0,'https://furlio.au/product/hanging-budgie-bird-swing-perch-bird-aquatic-supplies/',0,'product','',0),
(46,1,'2026-04-19 21:02:11','2026-04-19 11:02:11','<h3>Every Guinea Pig Needs a Secret Hideout – This Is It</h3><p>Guinea pigs are prey animals by nature, and having a safe place to hide isn\'t just cute – it\'s essential for their mental wellbeing. The <strong>Guinea Pig Hideout Tunnel Toy</strong> gives your little mate the security, stimulation, and exercise they need to live their absolute best life in your Aussie home.</p><ul><li><strong>Dual-Entry Tunnel Design:</strong> The open-ended tube encourages natural running, exploring, and burrowing behaviour that keeps your guinea pig physically active and mentally happy.</li><li><strong>100% Natural Seagrass &amp; Hay Construction:</strong> Completely edible and safe – because guinea pigs will chew everything, you may as well give them something that\'s actually good for them. Supports healthy teeth wear naturally.</li><li><strong>Doubles as a Hidey House:</strong> Wide enough for most guinea pig breeds to comfortably curl up inside for naps, reducing stress and territorial anxiety in multi-pet enclosures.</li><li><strong>Eco-Friendly &amp; Biodegradable:</strong> When it\'s well and truly loved to bits, you can compost it guilt-free – a win for your pet and for straya\'s environment.</li><li><strong>Compatible with Most Enclosures:</strong> Fits comfortably in standard C&amp;C cages, hutches, and indoor enclosures commonly used by Aussie guinea pig owners.</li></ul><p>Whether you\'re a first-time guinea pig parent or a seasoned small-animal enthusiast, this hideout tunnel is one of those purchases that pays for itself in happy wheeks and zoomies within the first five minutes.</p><p><strong>🐾 Fast delivery to all Australian states – order now and watch your little mate go absolutely wild in their new favourite spot!</strong></p>','Guinea Pig Hideout Tunnel Toy – Small Animals Australia','Your guinea pig will absolutely love this natural seagrass hideout tunnel – edible, enriching, and built for happy small animals in Aussie homes.','publish','open','closed','','guinea-pig-hideout-tunnel-toy-small-animals-australia','','','2026-04-25 11:25:14','2026-04-25 01:25:14','',0,'https://furlio.au/product/guinea-pig-hideout-tunnel-toy-small-animals-australia/',0,'product','',0),
(47,1,'2026-04-19 21:19:38','2026-04-19 11:19:38','','product-pet-46','','inherit','open','closed','','product-pet-46','','','2026-04-19 21:19:39','2026-04-19 11:19:39','',46,'https://furlio.au/wp-content/uploads/2026/04/product-pet-46.jpg',0,'attachment','image/jpeg',0),
(48,1,'2026-04-19 21:19:42','2026-04-19 11:19:42','','product-pet-45','','inherit','open','closed','','product-pet-45','','','2026-04-19 21:19:43','2026-04-19 11:19:43','',45,'https://furlio.au/wp-content/uploads/2026/04/product-pet-45.jpg',0,'attachment','image/jpeg',0),
(49,1,'2026-04-19 21:19:46','2026-04-19 11:19:46','','product-pet-44','','inherit','open','closed','','product-pet-44','','','2026-04-19 21:19:47','2026-04-19 11:19:47','',44,'https://furlio.au/wp-content/uploads/2026/04/product-pet-44.jpg',0,'attachment','image/jpeg',0),
(50,1,'2026-04-19 21:19:50','2026-04-19 11:19:50','','product-pet-43','','inherit','open','closed','','product-pet-43','','','2026-04-19 21:19:50','2026-04-19 11:19:50','',43,'https://furlio.au/wp-content/uploads/2026/04/product-pet-43.jpg',0,'attachment','image/jpeg',0),
(51,1,'2026-04-19 21:19:55','2026-04-19 11:19:55','','product-pet-42','','inherit','open','closed','','product-pet-42','','','2026-04-19 21:19:55','2026-04-19 11:19:55','',42,'https://furlio.au/wp-content/uploads/2026/04/product-pet-42.jpg',0,'attachment','image/jpeg',0),
(52,1,'2026-04-19 21:19:59','2026-04-19 11:19:59','','product-pet-41','','inherit','open','closed','','product-pet-41','','','2026-04-19 21:19:59','2026-04-19 11:19:59','',41,'https://furlio.au/wp-content/uploads/2026/04/product-pet-41.jpg',0,'attachment','image/jpeg',0),
(53,0,'2026-04-19 21:58:47','2026-04-19 11:58:47','','','','draft','closed','closed','','','','','2026-04-19 21:58:47','2026-04-19 11:58:47','',0,'https://furlio.au/?post_type=shop_order_placehold&p=53',0,'shop_order_placehold','',0),
(54,0,'2026-04-19 21:59:57','2026-04-19 11:59:57','@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n/* Global font overrides */\nbody, p, li, td, input, button, select, textarea {\n  font-family: \"Nunito\", sans-serif !important;\n}\nh1, h2, h3, h4, h5, h6,\n.woocommerce-loop-product__title,\n.product_title,\n.woocommerce h1, .woocommerce h2 {\n  font-family: \"Playfair Display\", serif !important;\n}\n\n/* WooCommerce product cards */\n.woocommerce ul.products li.product .button {\n  background: #FF6B35 !important;\n  color: #fff !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n  letter-spacing: 0.5px;\n}\n.woocommerce ul.products li.product .button:hover {\n  background: #e85d2e !important;\n}\n.woocommerce ul.products li.product a img {\n  border-radius: 12px 12px 0 0;\n}\n.woocommerce ul.products li.product {\n  border-radius: 12px;\n  overflow: hidden;\n  box-shadow: 0 4px 16px rgba(46,134,171,0.08);\n  border: 1px solid #fcefd9;\n  transition: transform 0.25s, box-shadow 0.25s;\n}\n.woocommerce ul.products li.product:hover {\n  transform: translateY(-4px);\n  box-shadow: 0 12px 32px rgba(46,134,171,0.14);\n}\n/* Price colour */\n.woocommerce .price, .woocommerce-page .price {\n  color: #2E86AB !important;\n  font-weight: 700 !important;\n}\n/* Add to cart button on single product */\n.woocommerce .single_add_to_cart_button {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n  letter-spacing: 0.5px;\n  padding: 16px 40px !important;\n}\n.woocommerce .single_add_to_cart_button:hover {\n  background: #e85d2e !important;\n}\n/* Cart/checkout buttons */\n.woocommerce .checkout-button,\n.woocommerce a.button.alt,\n.woocommerce button.button.alt {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n}\n/* Notices */\n.woocommerce-message { border-top-color: #2E86AB !important; }\n/* Sale badge */\n.woocommerce span.onsale {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n}\n/* Breadcrumbs */\n.woocommerce .woocommerce-breadcrumb a { color: #2E86AB; }\n/* Star ratings */\n.woocommerce .star-rating span::before,\n.woocommerce .star-rating::before {\n  color: #F18F01;\n}\n/* Mobile nav */\n@media (max-width: 768px) {\n  .ast-mobile-menu-trigger-fill { background: #FF6B35 !important; }\n}\n/* ── Homepage: remove container padding, hide page title ── */\n.home .entry-title,\n.home .ast-page-header,\n.home .page-header { display: none !important; }\n\n.home .ast-container,\n.home .entry-content { padding-left: 0 !important; padding-right: 0 !important; max-width: 100% !important; }\n\n.home .site-content .ast-container { padding: 0 !important; }\n.home article.page { padding: 0 !important; margin: 0 !important; }\n.home .entry-content .wp-block-group__inner-container { max-width: 100%; }\n\n/* Fix full-width page on Astra */\n.page-template-page-fullwidth .ast-container,\n.page-template-page-fullwidth .entry-content { max-width: 100% !important; padding: 0 !important; }\n\n/* Remove top/bottom spacing on homepage */\n.home #content.site-content { padding-top: 0 !important; }\n.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n','Custom CSS','','inherit','closed','closed','','38-revision-v1','','','2026-04-19 21:59:57','2026-04-19 11:59:57','',38,'https://furlio.au/?p=54',0,'revision','',0),
(55,0,'2026-04-19 22:49:17','2026-04-19 12:49:17','@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n/* Global font overrides */\nbody, p, li, td, input, button, select, textarea {\n  font-family: \"Nunito\", sans-serif !important;\n}\nh1, h2, h3, h4, h5, h6,\n.woocommerce-loop-product__title,\n.product_title,\n.woocommerce h1, .woocommerce h2 {\n  font-family: \"Playfair Display\", serif !important;\n}\n\n/* WooCommerce product cards */\n.woocommerce ul.products li.product .button {\n  background: #FF6B35 !important;\n  color: #fff !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n  letter-spacing: 0.5px;\n}\n.woocommerce ul.products li.product .button:hover {\n  background: #e85d2e !important;\n}\n.woocommerce ul.products li.product a img {\n  border-radius: 12px 12px 0 0;\n}\n.woocommerce ul.products li.product {\n  border-radius: 12px;\n  overflow: hidden;\n  box-shadow: 0 4px 16px rgba(46,134,171,0.08);\n  border: 1px solid #fcefd9;\n  transition: transform 0.25s, box-shadow 0.25s;\n}\n.woocommerce ul.products li.product:hover {\n  transform: translateY(-4px);\n  box-shadow: 0 12px 32px rgba(46,134,171,0.14);\n}\n/* Price colour */\n.woocommerce .price, .woocommerce-page .price {\n  color: #2E86AB !important;\n  font-weight: 700 !important;\n}\n/* Add to cart button on single product */\n.woocommerce .single_add_to_cart_button {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n  letter-spacing: 0.5px;\n  padding: 16px 40px !important;\n}\n.woocommerce .single_add_to_cart_button:hover {\n  background: #e85d2e !important;\n}\n/* Cart/checkout buttons */\n.woocommerce .checkout-button,\n.woocommerce a.button.alt,\n.woocommerce button.button.alt {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n}\n/* Notices */\n.woocommerce-message { border-top-color: #2E86AB !important; }\n/* Sale badge */\n.woocommerce span.onsale {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n}\n/* Breadcrumbs */\n.woocommerce .woocommerce-breadcrumb a { color: #2E86AB; }\n/* Star ratings */\n.woocommerce .star-rating span::before,\n.woocommerce .star-rating::before {\n  color: #F18F01;\n}\n/* Mobile nav */\n@media (max-width: 768px) {\n  .ast-mobile-menu-trigger-fill { background: #FF6B35 !important; }\n}\n/* ── Homepage: remove container padding, hide page title ── */\n.home .entry-title,\n.home .ast-page-header,\n.home .page-header { display: none !important; }\n\n.home .ast-container,\n.home .entry-content { padding-left: 0 !important; padding-right: 0 !important; max-width: 100% !important; }\n\n.home .site-content .ast-container { padding: 0 !important; }\n.home article.page { padding: 0 !important; margin: 0 !important; }\n.home .entry-content .wp-block-group__inner-container { max-width: 100%; }\n\n/* Fix full-width page on Astra */\n.page-template-page-fullwidth .ast-container,\n.page-template-page-fullwidth .entry-content { max-width: 100% !important; padding: 0 !important; }\n\n/* Remove top/bottom spacing on homepage */\n.home #content.site-content { padding-top: 0 !important; }\n.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n\n/* ── Homepage full-width: override Astra CSS vars ── */\nbody.home {\n  --ast-normal-container-width: 100% !important;\n  --ast-container-default-xlg-padding: 0 !important;\n  --ast-container-default-lg-padding: 0 !important;\n  --ast-container-default-slg-padding: 0 !important;\n  --ast-container-default-md-padding: 0 !important;\n  --ast-container-default-sm-padding: 0 !important;\n  --ast-container-default-xs-padding: 0 !important;\n  --ast-container-default-xxs-padding: 0 !important;\n}\nbody.home .entry-header,\nbody.home h1.entry-title { display: none !important; }\nbody.home .ast-container { max-width: 100% !important; padding: 0 !important; }\nbody.home .entry-content { padding: 0 !important; max-width: 100% !important; }\nbody.home #content.site-content { padding-top: 0 !important; padding-bottom: 0 !important; }\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\nbody.home #primary { padding: 0 !important; }\n','Custom CSS','','inherit','closed','closed','','38-revision-v1','','','2026-04-19 22:49:17','2026-04-19 12:49:17','',38,'https://furlio.au/?p=55',0,'revision','',0),
(56,0,'2026-04-19 22:51:30','2026-04-19 12:51:30','/* =============================================\n   AUSSIEPAW CO. — GLOBAL STYLESHEET\n   Applied via WordPress Custom CSS\n   ============================================*/\n@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n:root {\n  --ap-blue:#2E86AB; --ap-blue-dk:#1a5f7a;\n  --ap-amber:#F18F01; --ap-orange:#FF6B35; --ap-orange-dk:#e8521e;\n  --ap-green:#5C8001; --ap-cream:#FFF9F2; --ap-dark:#1F2937;\n  --ap-gray:#6B7280; --ap-white:#ffffff;\n  --ap-radius:16px;\n  --ap-transition:all 0.3s cubic-bezier(0.4,0,0.2,1);\n  --ap-shadow:0 8px 30px rgba(46,134,171,0.12);\n}\n\n/* GLOBAL BODY */\nbody { font-family:\"Nunito\",sans-serif!important; background:#FFF9F2!important; color:#2D3748; }\nh1,h2,h3,h4,h5,h6 { font-family:\"Playfair Display\",serif!important; color:#1F2937; }\na { color:#2E86AB; transition:var(--ap-transition); }\na:hover { color:#FF6B35; }\n\n/* ASTRA HEADER */\n#masthead, .ast-primary-header-bar {\n  background:#ffffff!important;\n  box-shadow:0 2px 20px rgba(0,0,0,0.06)!important;\n  border-bottom:2px solid #F3F4F6!important;\n}\n.ast-site-header-wrap { padding:0 20px; }\n.site-title a, .ast-site-name { font-family:\"Playfair Display\",serif!important; color:#2E86AB!important; font-size:24px!important; font-weight:700!important; letter-spacing:-0.5px; }\n.site-description, .ast-site-description { color:#6B7280!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* NAVIGATION */\n.main-navigation .menu > li > a,\n.ast-header-menu-container .menu > li > a {\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:15px!important;\n  color:#1F2937!important; padding:8px 14px!important; border-radius:8px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.2px;\n}\n.main-navigation .menu > li > a:hover,\n.ast-header-menu-container .menu > li > a:hover { color:#FF6B35!important; background:rgba(255,107,53,0.06)!important; }\n.ast-header-menu-container .menu > .current-menu-item > a { color:#2E86AB!important; }\n\n/* ASTRA CART ICON */\n.ast-cart-menu-wrap .count { background:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-weight:800!important; }\n\n/* STICKY HEADER */\n.ast-header-sticked { box-shadow:0 4px 20px rgba(0,0,0,0.1)!important; }\n\n/* BUTTONS - GLOBAL */\n.wp-block-button__link, button, input[type=\"submit\"],\n.woocommerce a.button, .woocommerce button.button, .button {\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important; border-radius:50px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.3px;\n}\n.woocommerce a.button.alt, .woocommerce button.button.alt,\n.woocommerce input.button.alt, .woocommerce #respond input#submit.alt {\n  background:#FF6B35!important; color:#fff!important; border-radius:50px!important;\n  padding:14px 32px!important; font-size:15px!important; font-weight:800!important;\n  box-shadow:0 4px 16px rgba(255,107,53,0.35)!important;\n}\n.woocommerce a.button.alt:hover, .woocommerce button.button.alt:hover {\n  background:#e8521e!important; transform:translateY(-2px)!important; box-shadow:0 8px 24px rgba(255,107,53,0.45)!important;\n}\n\n/* SHOP PRODUCT GRID */\n.woocommerce ul.products { display:grid!important; gap:24px!important; }\n@media(min-width:900px){ .woocommerce ul.products { grid-template-columns:repeat(3,1fr)!important; } }\n@media(max-width:899px) and (min-width:600px){ .woocommerce ul.products { grid-template-columns:repeat(2,1fr)!important; } }\n@media(max-width:599px){ .woocommerce ul.products { grid-template-columns:1fr!important; } }\n.woocommerce ul.products li.product {\n  background:#ffffff!important; border:1px solid #F3F4F6!important;\n  border-radius:var(--ap-radius)!important; overflow:hidden!important;\n  box-shadow:0 2px 12px rgba(0,0,0,0.05)!important; transition:var(--ap-transition)!important;\n  padding:0!important; position:relative;\n}\n.woocommerce ul.products li.product:hover {\n  transform:translateY(-8px)!important; border-color:#2E86AB!important;\n  box-shadow:0 20px 50px rgba(46,134,171,0.18)!important;\n}\n.woocommerce ul.products li.product .woocommerce-LoopProduct-link { display:block; }\n.woocommerce ul.products li.product img { transition:var(--ap-transition)!important; width:100%!important; aspect-ratio:1/1!important; object-fit:cover!important; }\n.woocommerce ul.products li.product:hover img { transform:scale(1.04)!important; }\n.woocommerce ul.products li.product .woocommerce-loop-product__title {\n  font-family:\"Playfair Display\",serif!important; font-size:17px!important; font-weight:700!important;\n  color:#1F2937!important; padding:16px 16px 4px!important; line-height:1.3!important; margin:0!important;\n}\n.woocommerce ul.products li.product .price {\n  color:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-size:20px!important;\n  font-weight:800!important; padding:0 16px 12px!important; display:block!important;\n}\n.woocommerce ul.products li.product .price del { color:#9CA3AF!important; font-size:14px!important; font-weight:600!important; }\n.woocommerce ul.products li.product a.button, .woocommerce ul.products li.product button.button {\n  background:#2E86AB!important; color:#fff!important; border-radius:50px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:13px!important;\n  padding:10px 20px!important; margin:0 16px 16px!important; display:inline-block!important;\n  transition:var(--ap-transition)!important;\n}\n.woocommerce ul.products li.product a.button:hover, .woocommerce ul.products li.product button.button:hover {\n  background:#FF6B35!important; transform:scale(1.05)!important;\n}\n.woocommerce span.onsale {\n  background:#FF6B35!important; color:#fff!important; border-radius:8px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important;\n  font-size:12px!important; padding:4px 10px!important; top:12px!important; left:12px!important;\n}\n\n/* SINGLE PRODUCT */\n.woocommerce div.product .product_title {\n  font-family:\"Playfair Display\",serif!important; font-size:32px!important; color:#1F2937!important;\n}\n.woocommerce div.product p.price, .woocommerce div.product span.price {\n  color:#FF6B35!important; font-size:28px!important; font-weight:800!important; font-family:\"Nunito\",sans-serif!important;\n}\n.woocommerce div.product .woocommerce-product-rating .star-rating { color:#F18F01!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li { border-radius:12px 12px 0 0!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li.active { background:#FFF9F2!important; border-color:#2E86AB!important; }\n\n/* BREADCRUMB */\n.woocommerce .woocommerce-breadcrumb { font-family:\"Nunito\",sans-serif!important; color:#9CA3AF!important; font-size:14px!important; }\n.woocommerce .woocommerce-breadcrumb a { color:#2E86AB!important; }\n\n/* CART */\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce table.shop_table { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce table.shop_table th { background:#1F2937!important; color:#fff!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; }\n.woocommerce-cart .cart-collaterals .cart_totals h2 { font-family:\"Playfair Display\",serif!important; }\n\n/* CHECKOUT */\n.woocommerce-checkout #order_review_heading,\n.woocommerce-checkout h3#ship-to-different-address,\n.woocommerce-checkout #order_review .woocommerce-checkout-review-order-table th { font-family:\"Playfair Display\",serif!important; }\n.woocommerce #payment #place_order {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px 40px!important; width:100%!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce #payment #place_order:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce form .form-row input.input-text, .woocommerce form .form-row textarea,\n.woocommerce form .form-row select { border-radius:12px!important; border-color:#E5E7EB!important; font-family:\"Nunito\",sans-serif!important; padding:14px 16px!important; }\n\n/* MY ACCOUNT */\n.woocommerce-account .woocommerce-MyAccount-navigation ul { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li { border-bottom:1px solid #F3F4F6!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a { font-family:\"Nunito\",sans-serif!important; font-weight:600!important; padding:14px 20px!important; color:#1F2937!important; display:block!important; transition:var(--ap-transition)!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a:hover, .woocommerce-account .woocommerce-MyAccount-navigation li.is-active a { background:#2E86AB!important; color:#fff!important; }\n\n/* FOOTER */\n#colophon, .site-footer { background:#1F2937!important; color:#D1D5DB!important; padding-top:60px!important; }\n.site-footer .widget-title, .site-footer h2, .site-footer h3 { font-family:\"Playfair Display\",serif!important; color:#ffffff!important; margin-bottom:20px!important; font-size:18px!important; }\n.site-footer p, .site-footer li, .site-footer a { font-family:\"Nunito\",sans-serif!important; }\n.site-footer a { color:#F18F01!important; transition:var(--ap-transition)!important; }\n.site-footer a:hover { color:#ffffff!important; }\n.site-footer ul { list-style:none!important; padding:0!important; }\n.site-footer ul li { padding:6px 0!important; border-bottom:1px solid rgba(255,255,255,0.06)!important; }\n.ast-small-footer { background:#111827!important; border-top:1px solid rgba(255,255,255,0.08)!important; }\n.ast-small-footer .ast-footer-copyright { color:#9CA3AF!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* WOOCOMMERCE NOTICES */\n.woocommerce-message { background:#ecfdf5!important; border-left-color:#10B981!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-error { background:#fef2f2!important; border-left-color:#EF4444!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-info { background:#eff6ff!important; border-left-color:#2E86AB!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* PAGINATION */\n.woocommerce nav.woocommerce-pagination ul li a, .woocommerce nav.woocommerce-pagination ul li span {\n  border-radius:8px!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; transition:var(--ap-transition)!important;\n}\n.woocommerce nav.woocommerce-pagination ul li a:hover, .woocommerce nav.woocommerce-pagination ul li span.current {\n  background:#2E86AB!important; border-color:#2E86AB!important; color:#fff!important;\n}\n\n/* SEARCH */\n.woocommerce-product-search input[type=\"search\"] { border-radius:50px!important; border:2px solid #E5E7EB!important; padding:12px 20px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-product-search button[type=\"submit\"] { background:#2E86AB!important; border-radius:0 50px 50px 0!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* REVIEW STARS */\n.star-rating { color:#F18F01!important; }\n.woocommerce-product-rating .woocommerce-review-link { font-family:\"Nunito\",sans-serif!important; color:#6B7280!important; }\n\n/* ── Homepage: full-width, no title ── */\nbody.home h1.entry-title,\nbody.home .entry-header { display: none !important; }\nbody.home {\n  --ast-normal-container-width: 100%;\n  --ast-container-default-xlg-padding: 0px;\n  --ast-container-default-lg-padding: 0px;\n  --ast-container-default-slg-padding: 0px;\n  --ast-container-default-md-padding: 0px;\n  --ast-container-default-sm-padding: 0px;\n  --ast-container-default-xs-padding: 0px;\n  --ast-container-default-xxs-padding: 0px;\n}\nbody.home .ast-container { max-width: 100% !important; padding-left: 0 !important; padding-right: 0 !important; }\nbody.home #primary, body.home .entry-content { padding: 0 !important; max-width: 100% !important; }\nbody.home #content.site-content { padding-top: 0 !important; }\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n','astra','','inherit','closed','closed','','26-revision-v1','','','2026-04-19 22:51:30','2026-04-19 12:51:30','',26,'https://furlio.au/?p=56',0,'revision','',0),
(58,0,'2026-04-19 23:11:18','2026-04-19 13:11:18','/* =============================================\n   AUSSIEPAW CO. — GLOBAL STYLESHEET\n   Applied via WordPress Custom CSS\n   ============================================*/\n@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n:root {\n  --ap-blue:#2E86AB; --ap-blue-dk:#1a5f7a;\n  --ap-amber:#F18F01; --ap-orange:#FF6B35; --ap-orange-dk:#e8521e;\n  --ap-green:#5C8001; --ap-cream:#FFF9F2; --ap-dark:#1F2937;\n  --ap-gray:#6B7280; --ap-white:#ffffff;\n  --ap-radius:16px;\n  --ap-transition:all 0.3s cubic-bezier(0.4,0,0.2,1);\n  --ap-shadow:0 8px 30px rgba(46,134,171,0.12);\n}\n\n/* GLOBAL BODY */\nbody { font-family:\"Nunito\",sans-serif!important; background:#FFF9F2!important; color:#2D3748; }\nh1,h2,h3,h4,h5,h6 { font-family:\"Playfair Display\",serif!important; color:#1F2937; }\na { color:#2E86AB; transition:var(--ap-transition); }\na:hover { color:#FF6B35; }\n\n/* ASTRA HEADER */\n#masthead, .ast-primary-header-bar {\n  background:#ffffff!important;\n  box-shadow:0 2px 20px rgba(0,0,0,0.06)!important;\n  border-bottom:2px solid #F3F4F6!important;\n}\n.ast-site-header-wrap { padding:0 20px; }\n.site-title a, .ast-site-name { font-family:\"Playfair Display\",serif!important; color:#2E86AB!important; font-size:24px!important; font-weight:700!important; letter-spacing:-0.5px; }\n.site-description, .ast-site-description { color:#6B7280!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* NAVIGATION */\n.main-navigation .menu > li > a,\n.ast-header-menu-container .menu > li > a {\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:15px!important;\n  color:#1F2937!important; padding:8px 14px!important; border-radius:8px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.2px;\n}\n.main-navigation .menu > li > a:hover,\n.ast-header-menu-container .menu > li > a:hover { color:#FF6B35!important; background:rgba(255,107,53,0.06)!important; }\n.ast-header-menu-container .menu > .current-menu-item > a { color:#2E86AB!important; }\n\n/* ASTRA CART ICON */\n.ast-cart-menu-wrap .count { background:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-weight:800!important; }\n\n/* STICKY HEADER */\n.ast-header-sticked { box-shadow:0 4px 20px rgba(0,0,0,0.1)!important; }\n\n/* BUTTONS - GLOBAL */\n.wp-block-button__link, button, input[type=\"submit\"],\n.woocommerce a.button, .woocommerce button.button, .button {\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important; border-radius:50px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.3px;\n}\n.woocommerce a.button.alt, .woocommerce button.button.alt,\n.woocommerce input.button.alt, .woocommerce #respond input#submit.alt {\n  background:#FF6B35!important; color:#fff!important; border-radius:50px!important;\n  padding:14px 32px!important; font-size:15px!important; font-weight:800!important;\n  box-shadow:0 4px 16px rgba(255,107,53,0.35)!important;\n}\n.woocommerce a.button.alt:hover, .woocommerce button.button.alt:hover {\n  background:#e8521e!important; transform:translateY(-2px)!important; box-shadow:0 8px 24px rgba(255,107,53,0.45)!important;\n}\n\n/* SHOP PRODUCT GRID */\n.woocommerce ul.products { display:grid!important; gap:24px!important; }\n@media(min-width:900px){ .woocommerce ul.products { grid-template-columns:repeat(3,1fr)!important; } }\n@media(max-width:899px) and (min-width:600px){ .woocommerce ul.products { grid-template-columns:repeat(2,1fr)!important; } }\n@media(max-width:599px){ .woocommerce ul.products { grid-template-columns:1fr!important; } }\n.woocommerce ul.products li.product {\n  background:#ffffff!important; border:1px solid #F3F4F6!important;\n  border-radius:var(--ap-radius)!important; overflow:hidden!important;\n  box-shadow:0 2px 12px rgba(0,0,0,0.05)!important; transition:var(--ap-transition)!important;\n  padding:0!important; position:relative;\n}\n.woocommerce ul.products li.product:hover {\n  transform:translateY(-8px)!important; border-color:#2E86AB!important;\n  box-shadow:0 20px 50px rgba(46,134,171,0.18)!important;\n}\n.woocommerce ul.products li.product .woocommerce-LoopProduct-link { display:block; }\n.woocommerce ul.products li.product img { transition:var(--ap-transition)!important; width:100%!important; aspect-ratio:1/1!important; object-fit:cover!important; }\n.woocommerce ul.products li.product:hover img { transform:scale(1.04)!important; }\n.woocommerce ul.products li.product .woocommerce-loop-product__title {\n  font-family:\"Playfair Display\",serif!important; font-size:17px!important; font-weight:700!important;\n  color:#1F2937!important; padding:16px 16px 4px!important; line-height:1.3!important; margin:0!important;\n}\n.woocommerce ul.products li.product .price {\n  color:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-size:20px!important;\n  font-weight:800!important; padding:0 16px 12px!important; display:block!important;\n}\n.woocommerce ul.products li.product .price del { color:#9CA3AF!important; font-size:14px!important; font-weight:600!important; }\n.woocommerce ul.products li.product a.button, .woocommerce ul.products li.product button.button {\n  background:#2E86AB!important; color:#fff!important; border-radius:50px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:13px!important;\n  padding:10px 20px!important; margin:0 16px 16px!important; display:inline-block!important;\n  transition:var(--ap-transition)!important;\n}\n.woocommerce ul.products li.product a.button:hover, .woocommerce ul.products li.product button.button:hover {\n  background:#FF6B35!important; transform:scale(1.05)!important;\n}\n.woocommerce span.onsale {\n  background:#FF6B35!important; color:#fff!important; border-radius:8px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important;\n  font-size:12px!important; padding:4px 10px!important; top:12px!important; left:12px!important;\n}\n\n/* SINGLE PRODUCT */\n.woocommerce div.product .product_title {\n  font-family:\"Playfair Display\",serif!important; font-size:32px!important; color:#1F2937!important;\n}\n.woocommerce div.product p.price, .woocommerce div.product span.price {\n  color:#FF6B35!important; font-size:28px!important; font-weight:800!important; font-family:\"Nunito\",sans-serif!important;\n}\n.woocommerce div.product .woocommerce-product-rating .star-rating { color:#F18F01!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li { border-radius:12px 12px 0 0!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li.active { background:#FFF9F2!important; border-color:#2E86AB!important; }\n\n/* BREADCRUMB */\n.woocommerce .woocommerce-breadcrumb { font-family:\"Nunito\",sans-serif!important; color:#9CA3AF!important; font-size:14px!important; }\n.woocommerce .woocommerce-breadcrumb a { color:#2E86AB!important; }\n\n/* CART */\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce table.shop_table { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce table.shop_table th { background:#1F2937!important; color:#fff!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; }\n.woocommerce-cart .cart-collaterals .cart_totals h2 { font-family:\"Playfair Display\",serif!important; }\n\n/* CHECKOUT */\n.woocommerce-checkout #order_review_heading,\n.woocommerce-checkout h3#ship-to-different-address,\n.woocommerce-checkout #order_review .woocommerce-checkout-review-order-table th { font-family:\"Playfair Display\",serif!important; }\n.woocommerce #payment #place_order {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px 40px!important; width:100%!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce #payment #place_order:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce form .form-row input.input-text, .woocommerce form .form-row textarea,\n.woocommerce form .form-row select { border-radius:12px!important; border-color:#E5E7EB!important; font-family:\"Nunito\",sans-serif!important; padding:14px 16px!important; }\n\n/* MY ACCOUNT */\n.woocommerce-account .woocommerce-MyAccount-navigation ul { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li { border-bottom:1px solid #F3F4F6!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a { font-family:\"Nunito\",sans-serif!important; font-weight:600!important; padding:14px 20px!important; color:#1F2937!important; display:block!important; transition:var(--ap-transition)!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a:hover, .woocommerce-account .woocommerce-MyAccount-navigation li.is-active a { background:#2E86AB!important; color:#fff!important; }\n\n/* FOOTER */\n#colophon, .site-footer { background:#1F2937!important; color:#D1D5DB!important; padding-top:60px!important; }\n.site-footer .widget-title, .site-footer h2, .site-footer h3 { font-family:\"Playfair Display\",serif!important; color:#ffffff!important; margin-bottom:20px!important; font-size:18px!important; }\n.site-footer p, .site-footer li, .site-footer a { font-family:\"Nunito\",sans-serif!important; }\n.site-footer a { color:#F18F01!important; transition:var(--ap-transition)!important; }\n.site-footer a:hover { color:#ffffff!important; }\n.site-footer ul { list-style:none!important; padding:0!important; }\n.site-footer ul li { padding:6px 0!important; border-bottom:1px solid rgba(255,255,255,0.06)!important; }\n.ast-small-footer { background:#111827!important; border-top:1px solid rgba(255,255,255,0.08)!important; }\n.ast-small-footer .ast-footer-copyright { color:#9CA3AF!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* WOOCOMMERCE NOTICES */\n.woocommerce-message { background:#ecfdf5!important; border-left-color:#10B981!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-error { background:#fef2f2!important; border-left-color:#EF4444!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-info { background:#eff6ff!important; border-left-color:#2E86AB!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* PAGINATION */\n.woocommerce nav.woocommerce-pagination ul li a, .woocommerce nav.woocommerce-pagination ul li span {\n  border-radius:8px!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; transition:var(--ap-transition)!important;\n}\n.woocommerce nav.woocommerce-pagination ul li a:hover, .woocommerce nav.woocommerce-pagination ul li span.current {\n  background:#2E86AB!important; border-color:#2E86AB!important; color:#fff!important;\n}\n\n/* SEARCH */\n.woocommerce-product-search input[type=\"search\"] { border-radius:50px!important; border:2px solid #E5E7EB!important; padding:12px 20px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-product-search button[type=\"submit\"] { background:#2E86AB!important; border-radius:0 50px 50px 0!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* REVIEW STARS */\n.star-rating { color:#F18F01!important; }\n.woocommerce-product-rating .woocommerce-review-link { font-family:\"Nunito\",sans-serif!important; color:#6B7280!important; }\n\n/* ── Homepage: full-width, no title ── */\nbody.home h1.entry-title,\nbody.home .entry-header { display: none !important; }\nbody.home {\n  --ast-normal-container-width: 100%;\n  --ast-container-default-xlg-padding: 0px;\n  --ast-container-default-lg-padding: 0px;\n  --ast-container-default-slg-padding: 0px;\n  --ast-container-default-md-padding: 0px;\n  --ast-container-default-sm-padding: 0px;\n  --ast-container-default-xs-padding: 0px;\n  --ast-container-default-xxs-padding: 0px;\n}\nbody.home .ast-container { max-width: 100% !important; padding-left: 0 !important; padding-right: 0 !important; }\nbody.home #primary, body.home .entry-content { padding: 0 !important; max-width: 100% !important; }\nbody.home #content.site-content { padding-top: 0 !important; }\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n/* ── Navigation icons ── */\n.main-header-menu .menu-item a.menu-link { display:flex; align-items:center; gap:5px; }\n\n/* Per-item icons via CSS content */\n.main-header-menu .menu-item:nth-child(1) > a.menu-link::before { content:\"🏠\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(2) > a.menu-link::before { content:\"🛍️\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(3) > a.menu-link::before { content:\"🐾\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(4) > a.menu-link::before { content:\"❓\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(5) > a.menu-link::before { content:\"🚚\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(6) > a.menu-link::before { content:\"✉️\"; font-size:14px; }\n\n/* My Account nav item — styled as a pill button */\n.nav-account-link > a.menu-link {\n  background: #2E86AB !important;\n  color: #fff !important;\n  border-radius: 30px !important;\n  padding: 6px 18px !important;\n  font-weight: 700 !important;\n  font-size: 13px !important;\n  margin-left: 8px;\n  transition: background 0.2s;\n}\n.nav-account-link > a.menu-link::before { content:\"👤\"; font-size:13px; margin-right:4px; }\n.nav-account-link > a.menu-link:hover { background: #1a5f7a !important; }\n','astra','','inherit','closed','closed','','26-revision-v1','','','2026-04-19 23:11:18','2026-04-19 13:11:18','',26,'https://furlio.au/?p=58',0,'revision','',0),
(59,0,'2026-04-19 23:17:22','2026-04-19 13:17:22','/* =============================================\n   AUSSIEPAW CO. — GLOBAL STYLESHEET\n   Applied via WordPress Custom CSS\n   ============================================*/\n@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n:root {\n  --ap-blue:#2E86AB; --ap-blue-dk:#1a5f7a;\n  --ap-amber:#F18F01; --ap-orange:#FF6B35; --ap-orange-dk:#e8521e;\n  --ap-green:#5C8001; --ap-cream:#FFF9F2; --ap-dark:#1F2937;\n  --ap-gray:#6B7280; --ap-white:#ffffff;\n  --ap-radius:16px;\n  --ap-transition:all 0.3s cubic-bezier(0.4,0,0.2,1);\n  --ap-shadow:0 8px 30px rgba(46,134,171,0.12);\n}\n\n/* GLOBAL BODY */\nbody { font-family:\"Nunito\",sans-serif!important; background:#FFF9F2!important; color:#2D3748; }\nh1,h2,h3,h4,h5,h6 { font-family:\"Playfair Display\",serif!important; color:#1F2937; }\na { color:#2E86AB; transition:var(--ap-transition); }\na:hover { color:#FF6B35; }\n\n/* ASTRA HEADER */\n#masthead, .ast-primary-header-bar {\n  background:#ffffff!important;\n  box-shadow:0 2px 20px rgba(0,0,0,0.06)!important;\n  border-bottom:2px solid #F3F4F6!important;\n}\n.ast-site-header-wrap { padding:0 20px; }\n.site-title a, .ast-site-name { font-family:\"Playfair Display\",serif!important; color:#2E86AB!important; font-size:24px!important; font-weight:700!important; letter-spacing:-0.5px; }\n.site-description, .ast-site-description { color:#6B7280!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* NAVIGATION */\n.main-navigation .menu > li > a,\n.ast-header-menu-container .menu > li > a {\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:15px!important;\n  color:#1F2937!important; padding:8px 14px!important; border-radius:8px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.2px;\n}\n.main-navigation .menu > li > a:hover,\n.ast-header-menu-container .menu > li > a:hover { color:#FF6B35!important; background:rgba(255,107,53,0.06)!important; }\n.ast-header-menu-container .menu > .current-menu-item > a { color:#2E86AB!important; }\n\n/* ASTRA CART ICON */\n.ast-cart-menu-wrap .count { background:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-weight:800!important; }\n\n/* STICKY HEADER */\n.ast-header-sticked { box-shadow:0 4px 20px rgba(0,0,0,0.1)!important; }\n\n/* BUTTONS - GLOBAL */\n.wp-block-button__link, button, input[type=\"submit\"],\n.woocommerce a.button, .woocommerce button.button, .button {\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important; border-radius:50px!important;\n  transition:var(--ap-transition)!important; letter-spacing:0.3px;\n}\n.woocommerce a.button.alt, .woocommerce button.button.alt,\n.woocommerce input.button.alt, .woocommerce #respond input#submit.alt {\n  background:#FF6B35!important; color:#fff!important; border-radius:50px!important;\n  padding:14px 32px!important; font-size:15px!important; font-weight:800!important;\n  box-shadow:0 4px 16px rgba(255,107,53,0.35)!important;\n}\n.woocommerce a.button.alt:hover, .woocommerce button.button.alt:hover {\n  background:#e8521e!important; transform:translateY(-2px)!important; box-shadow:0 8px 24px rgba(255,107,53,0.45)!important;\n}\n\n/* SHOP PRODUCT GRID */\n.woocommerce ul.products { display:grid!important; gap:24px!important; }\n@media(min-width:900px){ .woocommerce ul.products { grid-template-columns:repeat(3,1fr)!important; } }\n@media(max-width:899px) and (min-width:600px){ .woocommerce ul.products { grid-template-columns:repeat(2,1fr)!important; } }\n@media(max-width:599px){ .woocommerce ul.products { grid-template-columns:1fr!important; } }\n.woocommerce ul.products li.product {\n  background:#ffffff!important; border:1px solid #F3F4F6!important;\n  border-radius:var(--ap-radius)!important; overflow:hidden!important;\n  box-shadow:0 2px 12px rgba(0,0,0,0.05)!important; transition:var(--ap-transition)!important;\n  padding:0!important; position:relative;\n}\n.woocommerce ul.products li.product:hover {\n  transform:translateY(-8px)!important; border-color:#2E86AB!important;\n  box-shadow:0 20px 50px rgba(46,134,171,0.18)!important;\n}\n.woocommerce ul.products li.product .woocommerce-LoopProduct-link { display:block; }\n.woocommerce ul.products li.product img { transition:var(--ap-transition)!important; width:100%!important; aspect-ratio:1/1!important; object-fit:cover!important; }\n.woocommerce ul.products li.product:hover img { transform:scale(1.04)!important; }\n.woocommerce ul.products li.product .woocommerce-loop-product__title {\n  font-family:\"Playfair Display\",serif!important; font-size:17px!important; font-weight:700!important;\n  color:#1F2937!important; padding:16px 16px 4px!important; line-height:1.3!important; margin:0!important;\n}\n.woocommerce ul.products li.product .price {\n  color:#FF6B35!important; font-family:\"Nunito\",sans-serif!important; font-size:20px!important;\n  font-weight:800!important; padding:0 16px 12px!important; display:block!important;\n}\n.woocommerce ul.products li.product .price del { color:#9CA3AF!important; font-size:14px!important; font-weight:600!important; }\n.woocommerce ul.products li.product a.button, .woocommerce ul.products li.product button.button {\n  background:#2E86AB!important; color:#fff!important; border-radius:50px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:700!important; font-size:13px!important;\n  padding:10px 20px!important; margin:0 16px 16px!important; display:inline-block!important;\n  transition:var(--ap-transition)!important;\n}\n.woocommerce ul.products li.product a.button:hover, .woocommerce ul.products li.product button.button:hover {\n  background:#FF6B35!important; transform:scale(1.05)!important;\n}\n.woocommerce span.onsale {\n  background:#FF6B35!important; color:#fff!important; border-radius:8px!important;\n  font-family:\"Nunito\",sans-serif!important; font-weight:800!important;\n  font-size:12px!important; padding:4px 10px!important; top:12px!important; left:12px!important;\n}\n\n/* SINGLE PRODUCT */\n.woocommerce div.product .product_title {\n  font-family:\"Playfair Display\",serif!important; font-size:32px!important; color:#1F2937!important;\n}\n.woocommerce div.product p.price, .woocommerce div.product span.price {\n  color:#FF6B35!important; font-size:28px!important; font-weight:800!important; font-family:\"Nunito\",sans-serif!important;\n}\n.woocommerce div.product .woocommerce-product-rating .star-rating { color:#F18F01!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li { border-radius:12px 12px 0 0!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce div.product .woocommerce-tabs ul.tabs li.active { background:#FFF9F2!important; border-color:#2E86AB!important; }\n\n/* BREADCRUMB */\n.woocommerce .woocommerce-breadcrumb { font-family:\"Nunito\",sans-serif!important; color:#9CA3AF!important; font-size:14px!important; }\n.woocommerce .woocommerce-breadcrumb a { color:#2E86AB!important; }\n\n/* CART */\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce-cart .wc-proceed-to-checkout a.checkout-button:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce table.shop_table { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce table.shop_table th { background:#1F2937!important; color:#fff!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; }\n.woocommerce-cart .cart-collaterals .cart_totals h2 { font-family:\"Playfair Display\",serif!important; }\n\n/* CHECKOUT */\n.woocommerce-checkout #order_review_heading,\n.woocommerce-checkout h3#ship-to-different-address,\n.woocommerce-checkout #order_review .woocommerce-checkout-review-order-table th { font-family:\"Playfair Display\",serif!important; }\n.woocommerce #payment #place_order {\n  background:#FF6B35!important; border-radius:50px!important; font-family:\"Nunito\",sans-serif!important;\n  font-weight:800!important; font-size:18px!important; padding:18px 40px!important; width:100%!important;\n  box-shadow:0 6px 24px rgba(255,107,53,0.35)!important; transition:var(--ap-transition)!important;\n}\n.woocommerce #payment #place_order:hover { background:#e8521e!important; transform:translateY(-2px)!important; }\n.woocommerce form .form-row input.input-text, .woocommerce form .form-row textarea,\n.woocommerce form .form-row select { border-radius:12px!important; border-color:#E5E7EB!important; font-family:\"Nunito\",sans-serif!important; padding:14px 16px!important; }\n\n/* MY ACCOUNT */\n.woocommerce-account .woocommerce-MyAccount-navigation ul { border-radius:var(--ap-radius)!important; overflow:hidden!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li { border-bottom:1px solid #F3F4F6!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a { font-family:\"Nunito\",sans-serif!important; font-weight:600!important; padding:14px 20px!important; color:#1F2937!important; display:block!important; transition:var(--ap-transition)!important; }\n.woocommerce-account .woocommerce-MyAccount-navigation li a:hover, .woocommerce-account .woocommerce-MyAccount-navigation li.is-active a { background:#2E86AB!important; color:#fff!important; }\n\n/* FOOTER */\n#colophon, .site-footer { background:#1F2937!important; color:#D1D5DB!important; padding-top:60px!important; }\n.site-footer .widget-title, .site-footer h2, .site-footer h3 { font-family:\"Playfair Display\",serif!important; color:#ffffff!important; margin-bottom:20px!important; font-size:18px!important; }\n.site-footer p, .site-footer li, .site-footer a { font-family:\"Nunito\",sans-serif!important; }\n.site-footer a { color:#F18F01!important; transition:var(--ap-transition)!important; }\n.site-footer a:hover { color:#ffffff!important; }\n.site-footer ul { list-style:none!important; padding:0!important; }\n.site-footer ul li { padding:6px 0!important; border-bottom:1px solid rgba(255,255,255,0.06)!important; }\n.ast-small-footer { background:#111827!important; border-top:1px solid rgba(255,255,255,0.08)!important; }\n.ast-small-footer .ast-footer-copyright { color:#9CA3AF!important; font-family:\"Nunito\",sans-serif!important; font-size:13px!important; }\n\n/* WOOCOMMERCE NOTICES */\n.woocommerce-message { background:#ecfdf5!important; border-left-color:#10B981!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-error { background:#fef2f2!important; border-left-color:#EF4444!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-info { background:#eff6ff!important; border-left-color:#2E86AB!important; border-radius:12px!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* PAGINATION */\n.woocommerce nav.woocommerce-pagination ul li a, .woocommerce nav.woocommerce-pagination ul li span {\n  border-radius:8px!important; font-family:\"Nunito\",sans-serif!important; font-weight:700!important; transition:var(--ap-transition)!important;\n}\n.woocommerce nav.woocommerce-pagination ul li a:hover, .woocommerce nav.woocommerce-pagination ul li span.current {\n  background:#2E86AB!important; border-color:#2E86AB!important; color:#fff!important;\n}\n\n/* SEARCH */\n.woocommerce-product-search input[type=\"search\"] { border-radius:50px!important; border:2px solid #E5E7EB!important; padding:12px 20px!important; font-family:\"Nunito\",sans-serif!important; }\n.woocommerce-product-search button[type=\"submit\"] { background:#2E86AB!important; border-radius:0 50px 50px 0!important; font-family:\"Nunito\",sans-serif!important; }\n\n/* REVIEW STARS */\n.star-rating { color:#F18F01!important; }\n.woocommerce-product-rating .woocommerce-review-link { font-family:\"Nunito\",sans-serif!important; color:#6B7280!important; }\n\n/* ── Homepage: full-width, no title ── */\nbody.home h1.entry-title,\nbody.home .entry-header { display: none !important; }\nbody.home {\n  --ast-normal-container-width: 100%;\n  --ast-container-default-xlg-padding: 0px;\n  --ast-container-default-lg-padding: 0px;\n  --ast-container-default-slg-padding: 0px;\n  --ast-container-default-md-padding: 0px;\n  --ast-container-default-sm-padding: 0px;\n  --ast-container-default-xs-padding: 0px;\n  --ast-container-default-xxs-padding: 0px;\n}\nbody.home .ast-container { max-width: 100% !important; padding-left: 0 !important; padding-right: 0 !important; }\nbody.home #primary, body.home .entry-content { padding: 0 !important; max-width: 100% !important; }\nbody.home #content.site-content { padding-top: 0 !important; }\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n/* ── Navigation icons ── */\n.main-header-menu .menu-item a.menu-link { display:flex; align-items:center; gap:5px; }\n\n/* Per-item icons via CSS content */\n.main-header-menu .menu-item:nth-child(1) > a.menu-link::before { content:\"🏠\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(2) > a.menu-link::before { content:\"🛍️\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(3) > a.menu-link::before { content:\"🐾\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(4) > a.menu-link::before { content:\"❓\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(5) > a.menu-link::before { content:\"🚚\"; font-size:14px; }\n.main-header-menu .menu-item:nth-child(6) > a.menu-link::before { content:\"✉️\"; font-size:14px; }\n\n/* My Account — plain nav style */\n.nav-account-link > a.menu-link::before { content:\"👤\"; font-size:13px; margin-right:4px; }','astra','','inherit','closed','closed','','26-revision-v1','','','2026-04-19 23:17:22','2026-04-19 13:17:22','',26,'https://furlio.au/?p=59',0,'revision','',0),
(60,1,'2026-04-20 22:00:34','2026-04-20 12:00:34','','71CPMTTpPcL._AC_UL600_SR600400_.jpg','','inherit','open','closed','','71cpmttppcl-_ac_ul600_sr600400_-jpg','','','2026-04-20 22:00:35','2026-04-20 12:00:35','',0,'https://furlio.au/wp-content/uploads/2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg',0,'attachment','image/jpeg',0),
(61,1,'2026-04-20 22:00:35','2026-04-20 12:00:35','<h3>Say G\'day to a Fresher, Cleaner Litter Box – Your Furry Mate Deserves It!</h3><p>Tired of holding your breath every time you walk past the litter box? Meet <strong>POOWEE! Lavender Cat &amp; Kitten Litter</strong> – the #1 Bestselling cat litter on Amazon AU that\'s making Aussie cat owners very, very happy. With a powerful clumping formula and a gentle lavender scent, keeping things clean has never been this easy (or this pleasant).</p><h3>Why Aussie Cat Lovers Are Obsessed With POOWEE!</h3><ul><li><strong>Long-Lasting Clumping Formula:</strong> Waste clumps instantly and firmly, so scooping is quick, easy, and mess-free – less litter wasted, more time for cuddles.</li><li><strong>Powerful Odour Neutraliser:</strong> That mild lavender scent doesn\'t just mask smells – it neutralises them at the source, keeping your home smelling fresh all day long.</li><li><strong>15kg Bulk Value:</strong> Perfect for multi-cat households or anyone who hates running out mid-week. Stock up and save – your wallet and your nose will thank you.</li><li><strong>Safe for All Ages:</strong> Suitable for cats and kittens of all ages, so whether you\'ve got a tiny new kitten or a seasoned senior moggy, POOWEE! has them covered.</li><li><strong>#1 Bestseller on Amazon AU:</strong> Thousands of Australian pet owners can\'t be wrong – this is the cat litter that consistently tops the charts in Aussie pet supplies.</li></ul><h3>Fast Delivery Across Australia</h3><p>Shipped from our <strong>Australian warehouse via Amazon Fulfillment</strong>, you can expect your order to arrive in just <strong>2–5 business days</strong>. No long international waits – just fast, reliable delivery straight to your door, anywhere in straya.</p><h3>Ready for a Fresher Home?</h3><p>Join thousands of happy Aussie cat owners and make the switch today. With POOWEE! Lavender Cat Litter, a cleaner litter box is just a scoop away.</p><p><strong>⚡ Limited stock available – grab yours before it sells out!</strong></p>','POOWEE! Lavender Cat Litter 15kg – Clumping &amp; Odour Control','Say goodbye to litter box odours with <strong>POOWEE! Lavender Cat &amp; Kitten Litter</strong> – the #1 Bestseller on Amazon AU! This 15kg bulk clumping formula neutralises odours at the source with a gentle lavender scent, making it perfect for multi-cat Aussie households. Shipped fast from our Australian warehouse in just 2–5 business days.','publish','open','closed','','poowee-lavender-cat-litter-15kg-clumping-odour-control','','','2026-04-25 11:25:14','2026-04-25 01:25:14','',0,'https://furlio.au/product/poowee-lavender-cat-litter-15kg-clumping-odour-control/',0,'product','',0),
(62,1,'2026-04-20 22:00:36','2026-04-20 12:00:36','# The Best Cat Litter for Aussie Cat Owners in 2024: Why POOWEE! Is Winning Hearts Across Straya<br><br>If you\'re a cat owner in Australia, you already know the struggle – the smell, the mess, the constant scooping. Finding a cat litter that actually works can feel like searching for a needle in a haystack. But what if we told you that thousands of Aussie pet lovers have already found their answer, and it goes by the very memorable name of POOWEE!? In this guide, we\'re diving deep into why POOWEE! Lavender Cat & Kitten Litter has become one of the most popular Australian pet supplies for cat owners – and why your furry mate might just thank you for making the switch.<br><br>## What Makes a Great Cat Litter? (And Why Most Fall Short)<br><br>Not all cat litters are created equal. Walk into any pet store and you\'ll be overwhelmed by options – clay, silica, paper, pine. So what should you actually be looking for?<br><br>The three non-negotiables for most Aussie cat owners are:<br><br>- **Odour control** – especially important in warmer Australian climates where smells intensify fast<br>- **Easy clumping** – so waste is contained, scooping is simple, and you\'re not wasting litter<br>- **Value for money** – because quality pet care shouldn\'t break the bank<br><br>Most budget litters fail on odour. Most premium litters fail on price. POOWEE! manages to nail all three, which is exactly why it\'s earned the title of **#1 Bestseller in Amazon AU Pet Supplies**.<br><br>## How POOWEE! Lavender Cat Litter Works Its Magic<br><br>The secret is in the formula. POOWEE!\'s long-lasting clumping technology means that as soon as your cat does their business, the litter binds tightly around waste – locking in moisture and odour before it has a chance to spread. This makes scooping incredibly easy and dramatically reduces how often you need to do a full litter change.<br><br>The mild lavender scent isn\'t just there to smell nice (though it does!). It works alongside the clumping formula to **neutralise odours at the source**, rather than simply masking them the way many cheaper litters do. The result? A litter box that stays fresher for longer – which is a win for you, your home, and your cat.<br><br>And with a generous **15kg bulk size**, POOWEE! is ideal for multi-cat households or anyone who just wants to stock up and not worry about running out. It\'s the kind of practical, no-fuss solution that fits perfectly into busy Aussie lifestyles.<br><br>## Why Aussie Cat Owners Are Choosing POOWEE!<br><br>Australia\'s climate is no joke. Hot summers mean litter box odours can become unbearable quickly, making odour control even more critical for Aussie households than in cooler climates. That\'s why so many Australian pet supplies shoppers are turning to POOWEE! as their go-to solution.<br><br>Beyond performance, there\'s the convenience factor. POOWEE! is shipped from an **Australian warehouse via Amazon Fulfillment**, which means you\'re looking at just **2–5 business days** delivery anywhere across straya. No waiting weeks for international orders – just fast, reliable shipping that gets your litter to your door when you need it.<br><br>It\'s also worth noting that POOWEE! is **safe for cats and kittens of all ages**. Whether you\'ve just brought home a tiny new kitten or you\'re caring for a senior cat, this litter is gentle enough for even the most sensitive paws. That versatility makes it a brilliant choice for households with multiple cats at different life stages.<br><br>## Tips for Getting the Most Out of Your Cat Litter<br><br>Even the best litter in the world works better when you use it right. Here are a few tips to get maximum freshness and value from your POOWEE! purchase:<br><br>1. **Fill the tray to the right depth** – Aim for about 7–10cm of litter. Too shallow and clumps won\'t form properly; too deep and you\'re wasting product.<br>2. **Scoop daily** – With clumping litter like POOWEE!, daily scooping means your litter lasts much longer and stays fresher throughout the week.<br>3. **Do a full change every 3–4 weeks** – Even with great clumping litter, a full clean and refresh every few weeks keeps things hygienic for your cat.<br>4. **Transition slowly** – If your cat is used to a different litter, mix POOWEE! in gradually over a week to help them adjust without stress.<br>5. **Store it properly** – Keep your unused POOWEE! in a cool, dry spot to maintain its clumping effectiveness and that lovely lavender scent.<br><br>Following these simple steps means your 15kg bag will go further, your home will smell better, and your cat will be a much happier camper.<br><br>## Make the Switch Today – Your Cat (and Your Nose) Will Thank You<br><br>If you\'ve been putting up with a smelly, messy litter box, it\'s time for a change. POOWEE! Lavender Cat & Kitten Litter ticks every box – powerful odour neutralising, easy clumping, bulk value, and fast delivery across Australia. It\'s no wonder it\'s become a staple in so many Aussie homes and a standout in Australian pet supplies.<br><br>Your furry mate deserves a clean, comfortable space to do their thing, and you deserve a home that smells fresh. With POOWEE!, you get both – without spending a fortune.<br><br>**Ready to experience the difference?** [Grab your 15kg bag of POOWEE! Lavender Cat Litter today at Furlio](https://furlio.com.au) and join the thousands of happy Aussie cat owners who\'ve already made the switch. Stock is limited, so don\'t wait – your cat\'s litter box upgrade is just a click away! 🐾\n\n<a href=\"https://furlio.au/?p=61\" class=\"wp-block-button__link\">Shop Now →</a>','The Best Cat Litter for Aussie Cat Owners: Why POOWEE! Is Topping the Australian Pet Supplies Charts','POOWEE! Lavender Cat Litter 15kg – clumping, scoopable & odour-neutralising. #1 on Amazon AU. Fast Aussie shipping. Shop now at Furlio!','publish','open','open','','best-cat-litter-australia-poowee-lavender-review','','','2026-04-20 22:00:36','2026-04-20 12:00:36','',0,'https://furlio.au/best-cat-litter-australia-poowee-lavender-review/',0,'post','',0),
(63,1,'2026-04-20 22:01:20','2026-04-20 12:01:20','','81gLdCfhJgL._AC_UL600_SR600400_.jpg','','inherit','open','closed','','81gldcfhjgl-_ac_ul600_sr600400_-jpg','','','2026-04-20 22:01:21','2026-04-20 12:01:21','',0,'https://furlio.au/wp-content/uploads/2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg',0,'attachment','image/jpeg',0),
(64,1,'2026-04-20 22:01:21','2026-04-20 12:01:21','<h3>Give Your Furry Mate the Clean, Green Litter Box They Deserve 🐾</h3><p>If you\'re after a cat litter that\'s kind to your cat, your home, and the planet — you\'ve just found your new go-to. <strong>Breeders Choice 99% Recycled Paper Cat Litter</strong> is the trusted Aussie favourite that ticks every box for loving pet owners across straya.</p><h3>Why Cat Owners Are Obsessed With It</h3><ul><li>🌿 <strong>99% Recycled Paper</strong> — Eco-friendly, biodegradable, and guilt-free. You\'re doing the right thing for your cat AND the environment.</li><li>💧 <strong>Highly Absorbent Pellets</strong> — The 15 Litre bulk pack means fewer trips to the store and a consistently fresh litter tray.</li><li>😮‍💨 <strong>Low Dust Formula</strong> — Gentle on sensitive noses (yours and your cat\'s). No more sneezing fits when you scoop!</li><li>♻️ <strong>Compostable with Natural Waste</strong> — Close the loop on sustainability. When used with biodegradable waste, it can go straight to the compost.</li><li>⭐ <strong>#3 Bestseller with 1,228 Ratings at 4.6 Stars</strong> — Thousands of Australian cat owners can\'t be wrong. This litter has earned its stripes.</li></ul><h3>Perfect for Aussie Homes</h3><p>Whether you\'ve got an indoor princess who refuses to go outside or a multi-cat household that keeps you on your toes, this 15L bulk pack has you covered. It\'s designed with Australian conditions in mind — because we know Aussie summers can make a litter tray smell like something out of a nightmare. This litter locks in odour and moisture so your home stays fresh, no matter the season.</p><h3>Fast Shipping Across Australia</h3><p>Shipped from our <strong>Australian warehouse</strong> via Amazon Fulfillment — you\'ll have it at your door in just <strong>2–5 business days</strong>. No waiting weeks for overseas deliveries.</p><p>🛒 <strong>Stock is moving fast — grab your 15L pack today before it sells out!</strong> Your furry mate will thank you for it.</p>','Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU','Give your cat a clean, safe, and eco-friendly litter experience with Breeders Choice 99% Recycled Paper Cat Litter. This 15L bulk pack features low-dust, highly absorbent pellets loved by over 1,200 Aussie pet owners. Ships fast from our Australian warehouse in just 2–5 business days!','publish','open','closed','','breeders-choice-recycled-paper-cat-litter-15l-eco-cat-litter-au','','','2026-04-25 11:25:14','2026-04-25 01:25:14','',0,'https://furlio.au/product/breeders-choice-recycled-paper-cat-litter-15l-eco-cat-litter-au/',0,'product','',0),
(65,1,'2026-04-20 22:01:21','2026-04-20 12:01:21','# The Best Eco-Friendly Cat Litter in Australia: Why Breeders Choice Is a Game-Changer<br><br>Let\'s be honest — cleaning out the litter tray is nobody\'s favourite job. But what if your cat litter could be better for your cat, better for your home, *and* better for the planet? If you\'re an Aussie cat owner searching for a smarter choice in **Australian pet supplies**, you\'re about to discover why thousands of pet parents have made the switch to Breeders Choice 99% Recycled Paper Cat Litter.<br><br>Whether you\'re a first-time cat owner or a seasoned multi-cat household veteran, choosing the right litter makes a massive difference to your daily routine. Let\'s dig in (pun intended).<br><br>## What Makes Recycled Paper Cat Litter So Good for Aussie Cats?<br><br>Traditional clay-based litters have been around forever, but they come with a tonne of downsides — literally. They\'re heavy, dusty, and not exactly environmentally friendly. Recycled paper cat litter flips the script entirely.<br><br>Breeders Choice is made from **99% recycled paper**, turning what would otherwise be waste into a highly functional, biodegradable product. The pellets are super absorbent, locking in moisture quickly so the surface stays dry for your cat\'s sensitive paws. And because it\'s low-dust, it\'s a dream for cats and owners who suffer from allergies or respiratory sensitivities.<br><br>For Aussie households that value sustainability — and let\'s face it, more and more of us do — this litter is a no-brainer. It\'s even compostable when used with natural biodegradable waste, making it one of the most eco-responsible options available in **Australian pet supplies** today.<br><br>## Perfect Use Cases: Who Should Be Using This Litter?<br><br>Not sure if Breeders Choice is right for your situation? Here\'s a quick breakdown:<br><br>**🐱 Indoor-only cats:** If your furry mate never sets a paw outside, odour control is critical. The absorbent pellets in this litter trap smells fast so your home stays fresh — even during a scorching Aussie summer.<br><br>**🏠 Multi-cat households:** The 15 Litre bulk pack is a lifesaver when you\'ve got more than one cat doing their business. You won\'t be running to the shops every few days, and the cost-per-use is seriously impressive.<br><br>**👶 Families with young kids:** Low dust means fewer airborne particles floating around your home. If you\'ve got little ones crawling around, that peace of mind is priceless.<br><br>**🌱 Eco-conscious pet owners:** If reducing your household\'s environmental footprint is a priority, switching to a recycled and compostable litter is one of the simplest swaps you can make.<br><br>## Why Aussies Are Choosing Breeders Choice Over Everything Else<br><br>With over **1,228 ratings and a 4.6-star average**, Breeders Choice has earned its reputation as a #3 bestseller — and that doesn\'t happen by accident. Australian pet owners are notoriously savvy shoppers, and the feedback speaks for itself.<br><br>Here\'s what makes it stand out in the crowded world of **cat toys Australia** and pet care products:<br><br>- **It\'s genuinely low dust** — not just marketed that way. Reviewers consistently highlight how clean it is to pour and scoop.<br>- **The absorbency is next level** — pellets swell and lock in liquid, keeping the tray drier for longer.<br>- **It doesn\'t track everywhere** — the pellet size means less mess around the litter tray (hallelujah!).<br>- **It\'s light to carry** — paper litter weighs significantly less than clay alternatives, which makes it easier to lug home and store.<br><br>And because it ships from an **Australian warehouse via Amazon Fulfillment**, you\'re looking at delivery in just 2–5 business days. No waiting weeks for something to arrive from overseas. That\'s the kind of convenience Aussie pet owners deserve.<br><br>## Buying Guide: How to Get the Most Out of Your Cat Litter<br><br>Ready to make the switch? Here are a few tips to get the best results from Breeders Choice Recycled Paper Cat Litter:<br><br>**1. Start with a clean tray.** When transitioning from another litter type, give the tray a thorough clean before introducing the new pellets. Cats can be creatures of habit, and a fresh start helps.<br><br>**2. Use the right depth.** Aim for about 5–7 cm of litter in the tray. Too little and absorbency suffers; too much and you\'re going through your supply faster than needed.<br><br>**3. Scoop solids daily.** Like any litter, regular scooping keeps things hygienic and extends the life of the batch.<br><br>**4. Consider a litter mat.** While Breeders Choice tracks less than most, a simple mat placed outside the tray keeps your floors even cleaner.<br><br>**5. Compost responsibly.** If you\'re composting, only do so with the used litter from natural waste (not solids) and follow local composting guidelines. It\'s a great way to close the sustainability loop!<br><br>As part of your broader **Australian pet supplies** setup, pairing this litter with a quality litter tray and a good scoop will make the whole routine a breeze.<br><br>## Make the Switch Today — Your Cat (and the Planet) Will Thank You<br><br>At the end of the day, choosing the right cat litter is about more than just convenience — it\'s about the health and happiness of your furry mate, the cleanliness of your home, and the kind of world we\'re leaving behind. Breeders Choice 99% Recycled Paper Cat Litter delivers on all three fronts.<br><br>With a bulk 15L pack, fast Aussie shipping, and a track record backed by thousands of happy cat owners, there\'s really no reason to keep reaching for that dusty clay bag at the supermarket.<br><br>👉 **[Shop Breeders Choice 99% Recycled Paper Cat Litter 15L now at Furlio](https://furlio.com.au)** and treat your cat to the clean, green litter experience they deserve. Stock moves fast, so don\'t wait too long — grab yours today! 🐾\n\n<a href=\"https://furlio.au/?p=64\" class=\"wp-block-button__link\">Shop Now →</a>','The Best Eco-Friendly Cat Litter in Australia: Why Breeders Choice Is a Game-Changer','Shop Breeders Choice 99% Recycled Paper Cat Litter 15L. Eco-friendly, low dust & highly absorbent. Fast 2–5 day shipping across Australia. 4.6 stars!','publish','open','open','','best-eco-friendly-cat-litter-australia-breeders-choice-recycled-paper','','','2026-04-20 22:01:21','2026-04-20 12:01:21','',0,'https://furlio.au/best-eco-friendly-cat-litter-australia-breeders-choice-recycled-paper/',0,'post','',0),
(66,0,'2026-04-20 22:05:10','2026-04-20 12:05:10','','','','draft','closed','closed','','','','','2026-04-20 22:05:10','2026-04-20 12:05:10','',0,'https://furlio.au/?post_type=shop_order_placehold&p=66',0,'shop_order_placehold','',2),
(67,0,'2026-04-24 21:06:15','2026-04-24 11:06:15',' ','','','publish','closed','closed','','67','','','2026-04-24 21:06:15','2026-04-24 11:06:15','',0,'https://furlio.au/67/',0,'nav_menu_item','',0),
(68,0,'2026-04-24 21:06:16','2026-04-24 11:06:16',' ','','','publish','closed','closed','','68','','','2026-04-24 21:06:16','2026-04-24 11:06:16','',0,'https://furlio.au/68/',2,'nav_menu_item','',0),
(69,0,'2026-04-24 21:06:17','2026-04-24 11:06:17','','About','','publish','closed','closed','','about','','','2026-04-24 21:06:17','2026-04-24 11:06:17','',0,'https://furlio.au/about/',3,'nav_menu_item','',0),
(70,0,'2026-04-24 21:06:18','2026-04-24 11:06:18','','Contact','','publish','closed','closed','','contact','','','2026-04-24 21:06:18','2026-04-24 11:06:18','',0,'https://furlio.au/contact/',4,'nav_menu_item','',0),
(71,0,'2026-04-24 21:06:31','2026-04-24 11:06:31','@import url(\"https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap\");\n\n/* Global font overrides */\nbody, p, li, td, input, button, select, textarea {\n  font-family: \"Nunito\", sans-serif !important;\n}\nh1, h2, h3, h4, h5, h6,\n.woocommerce-loop-product__title,\n.product_title,\n.woocommerce h1, .woocommerce h2 {\n  font-family: \"Playfair Display\", serif !important;\n}\n\n/* WooCommerce product cards */\n.woocommerce ul.products li.product .button {\n  background: #FF6B35 !important;\n  color: #fff !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n  letter-spacing: 0.5px;\n}\n.woocommerce ul.products li.product .button:hover {\n  background: #e85d2e !important;\n}\n.woocommerce ul.products li.product a img {\n  border-radius: 12px 12px 0 0;\n}\n.woocommerce ul.products li.product {\n  border-radius: 12px;\n  overflow: hidden;\n  box-shadow: 0 4px 16px rgba(46,134,171,0.08);\n  border: 1px solid #fcefd9;\n  transition: transform 0.25s, box-shadow 0.25s;\n}\n.woocommerce ul.products li.product:hover {\n  transform: translateY(-4px);\n  box-shadow: 0 12px 32px rgba(46,134,171,0.14);\n}\n/* Price colour */\n.woocommerce .price, .woocommerce-page .price {\n  color: #2E86AB !important;\n  font-weight: 700 !important;\n}\n/* Add to cart button on single product */\n.woocommerce .single_add_to_cart_button {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n  letter-spacing: 0.5px;\n  padding: 16px 40px !important;\n}\n.woocommerce .single_add_to_cart_button:hover {\n  background: #e85d2e !important;\n}\n/* Cart/checkout buttons */\n.woocommerce .checkout-button,\n.woocommerce a.button.alt,\n.woocommerce button.button.alt {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n}\n/* Notices */\n.woocommerce-message { border-top-color: #2E86AB !important; }\n/* Sale badge */\n.woocommerce span.onsale {\n  background: #FF6B35 !important;\n  border-radius: 30px !important;\n  font-family: \"Nunito\", sans-serif !important;\n  font-weight: 700 !important;\n}\n/* Breadcrumbs */\n.woocommerce .woocommerce-breadcrumb a { color: #2E86AB; }\n/* Star ratings */\n.woocommerce .star-rating span::before,\n.woocommerce .star-rating::before {\n  color: #F18F01;\n}\n/* Mobile nav */\n@media (max-width: 768px) {\n  .ast-mobile-menu-trigger-fill { background: #FF6B35 !important; }\n}\n/* ── Homepage: remove container padding, hide page title ── */\n.home .entry-title,\n.home .ast-page-header,\n.home .page-header { display: none !important; }\n\n.home .ast-container,\n.home .entry-content { padding-left: 0 !important; padding-right: 0 !important; max-width: 100% !important; }\n\n.home .site-content .ast-container { padding: 0 !important; }\n.home article.page { padding: 0 !important; margin: 0 !important; }\n.home .entry-content .wp-block-group__inner-container { max-width: 100%; }\n\n/* Fix full-width page on Astra */\n.page-template-page-fullwidth .ast-container,\n.page-template-page-fullwidth .entry-content { max-width: 100% !important; padding: 0 !important; }\n\n/* Remove top/bottom spacing on homepage */\n.home #content.site-content { padding-top: 0 !important; }\n.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\n\n/* ── Homepage full-width: override Astra CSS vars ── */\nbody.home {\n  --ast-normal-container-width: 100% !important;\n  --ast-container-default-xlg-padding: 0 !important;\n  --ast-container-default-lg-padding: 0 !important;\n  --ast-container-default-slg-padding: 0 !important;\n  --ast-container-default-md-padding: 0 !important;\n  --ast-container-default-sm-padding: 0 !important;\n  --ast-container-default-xs-padding: 0 !important;\n  --ast-container-default-xxs-padding: 0 !important;\n}\nbody.home .entry-header,\nbody.home h1.entry-title { display: none !important; }\nbody.home .ast-container { max-width: 100% !important; padding: 0 !important; }\nbody.home .entry-content { padding: 0 !important; max-width: 100% !important; }\nbody.home #content.site-content { padding-top: 0 !important; padding-bottom: 0 !important; }\nbody.home .ast-article-single { padding: 0 !important; margin: 0 !important; }\nbody.home #primary { padding: 0 !important; }\n\n/* ── Inner pages: tighten container side padding ── */\n.ast-container {\n  padding-left: 20px !important;\n  padding-right: 20px !important;\n}\n@media (min-width: 922px) {\n  .ast-container {\n    padding-left: 30px !important;\n    padding-right: 30px !important;\n  }\n}\n','Custom CSS','','inherit','closed','closed','','38-revision-v1','','','2026-04-24 21:06:31','2026-04-24 11:06:31','',38,'https://furlio.au/?p=71',0,'revision','',0),
(72,1,'2026-04-24 23:53:02','2026-04-24 13:53:02','<h2>Best Dog Harnesses Australia 2026: Find the Perfect Fit for Your Furry Mate</h2>\n\n<p>Whether you\'re taking your pup for a sunrise stroll along Bondi, a weekend hike through the Blue Mountains, or just a lap around the local oval, a great dog harness can make all the difference. Here at <strong>Furlio</strong>, we\'re passionate about helping Aussie pet owners find the safest, most comfortable, and most stylish <strong>dog accessories Australia</strong> has to offer — all delivered fast, straight to your door.</p>\n\n<p>With so many options flooding the market in 2026, we\'ve put together this comprehensive guide to help you cut through the noise and find the best dog harness for your best mate. From tiny Chihuahuas to barrel-chested Staffy crosses, there\'s a harness built for every breed, every adventure, and every Aussie backyard.</p>\n\n<h2>Why a Dog Harness Beats a Collar Every Time</h2>\n\n<p>If you\'re still walking your dog on a collar alone, it might be time to make the switch. Collars can put serious pressure on your dog\'s neck and trachea — especially for strong pullers or brachycephalic (flat-faced) breeds like Bulldogs and Pugs. A well-fitted harness distributes that pulling force across the chest and shoulders, making walks safer and far more enjoyable for both of you.</p>\n\n<ul>\n  <li><strong>Reduced neck strain:</strong> Especially important for small breeds and puppies</li>\n  <li><strong>Better control:</strong> Front-clip harnesses discourage pulling without causing pain</li>\n  <li><strong>Escape-proof design:</strong> Great for Houdini-style dogs who slip out of collars</li>\n  <li><strong>Ideal for senior dogs:</strong> Gentler on aging joints and muscles</li>\n  <li><strong>Visibility options:</strong> Many harnesses include reflective strips — perfect for those early morning beach walks</li>\n</ul>\n\n<h2>Types of Dog Harnesses: What\'s Right for Your Pup?</h2>\n\n<h3>1. Step-In Harnesses</h3>\n<p>Your dog steps both front paws into the harness, and you clip it up over their back. These are brilliant for calm dogs and senior pups who don\'t love having things pulled over their heads. Easy to use and typically very lightweight — ideal for smaller breeds like Cavoodles and Maltese Terriers.</p>\n<p><strong>Price range:</strong> From around $25–$55 AUD</p>\n\n<h3>2. Over-the-Head Harnesses</h3>\n<p>The most common style in Australia. You slip it over your dog\'s head and clip the sides. Look for padded chest panels and breathable mesh if you\'re in a warmer climate — because let\'s be honest, most of straya gets pretty steamy in summer.</p>\n<p><strong>Price range:</strong> From around $35–$90 AUD</p>\n\n<h3>3. Front-Clip Harnesses</h3>\n<p>The lead attaches at the front of the chest rather than the back. This gently redirects your dog toward you when they pull, making it one of the best tools for training. If your Labrador thinks every walk is a sprint, this style is your new best friend.</p>\n<p><strong>Price range:</strong> From around $45–$100 AUD</p>\n\n<h3>4. Dual-Clip Harnesses</h3>\n<p>Clip at both the front and back — giving you maximum versatility. Use the back clip for relaxed weekend sniffs at the dog park, and switch to the front clip for training sessions or busy streets. A solid all-rounder for most Aussie dogs.</p>\n<p><strong>Price range:</strong> From around $50–$120 AUD</p>\n\n<h3>5. Tactical and Adventure Harnesses</h3>\n<p>Built tough for rugged terrain, camping trips, and adventurous working dogs. Often feature MOLLE webbing for attaching pouches, a top handle for lifting your dog over obstacles, and ultra-durable materials that stand up to scrub and saltwater. Perfect for those serious bush bash weekends.</p>\n<p><strong>Price range:</strong> From around $75–$160 AUD</p>\n\n<h2>How to Measure Your Dog for a Harness</h2>\n\n<p>Getting the right fit is everything. A harness that\'s too loose becomes an escape route; one that\'s too tight can cause chafing and discomfort. Here\'s how to measure up your furry mate properly:</p>\n\n<ul>\n  <li><strong>Girth (chest circumference):</strong> Measure the widest part of your dog\'s chest, just behind the front legs. This is the most important measurement.</li>\n  <li><strong>Neck circumference:</strong> Measure loosely around the base of the neck.</li>\n  <li><strong>Weight:</strong> Many brands size by weight as well as measurements — always check both.</li>\n  <li><strong>The two-finger rule:</strong> Once fitted, you should be able to slide two fingers under any strap. If you can\'t, it\'s too tight. If you can fit your whole hand, it\'s too loose.</li>\n</ul>\n\n<p>When in doubt, size up and use adjustable straps to dial in the perfect fit. Most quality harnesses from our <strong>Australian pet supplies</strong> range feature multiple adjustment points for exactly this reason.</p>\n\n<h2>What to Look for in a Quality Dog Harness</h2>\n\n<h3>Materials Matter</h3>\n<p>In Australia\'s harsh climate — think scorching summers up north and wet, muddy winters in Victoria and Tasmania — materials need to be durable and easy to clean. Look for:</p>\n<ul>\n  <li>Neoprene or mesh padding for breathability</li>\n  <li>Nylon webbing for strength and longevity</li>\n  <li>Rust-proof metal hardware (especially important near the coast)</li>\n  <li>Machine-washable fabrics for those inevitable mud sessions</li>\n</ul>\n\n<h3>Safety Features</h3>\n<p>Reflective stitching is a must for early morning or evening walks. If you walk near roads, look for harnesses with bright colours or LED attachment points. A secure top handle is also a safety bonus — handy for quickly pulling your dog out of sticky situations at the dog park.</p>\n\n<h3>Breed-Specific Considerations</h3>\n<p>Deep-chested breeds like Greyhounds and Whippets need specially shaped harnesses that don\'t restrict their stride. Barrel-chested breeds like Bull Terriers need generous chest panels. Tiny breeds like Toy Poodles and Dachshunds need lightweight, fully padded options to avoid pressure points.</p>\n\n<h2>Top Dog Harness Picks at Furlio in 2026</h2>\n\n<p>At Furlio, our curated range of <strong>dog accessories Australia</strong>-wide has been hand-selected for quality, safety, and value. Here are some of our most loved picks heading into 2026:</p>\n\n<ul>\n  <li><strong>The TrailBlazer Dual-Clip Harness ($79 AUD):</strong> Our bestseller. Padded, breathable, adjustable at four points, and built for Aussie backyards and beyond. Available in sizes XS–XXL.</li>\n  <li><strong>The PuppyStep Step-In Harness ($34 AUD):</strong> Soft, lightweight, and stress-free to put on. Ideal for small breeds and senior dogs who hate fuss.</li>\n  <li><strong>The AdventureK9 Tactical Harness ($129 AUD):</strong> For the serious explorer. MOLLE webbing, reflective trim, and a reinforced top handle. Built tough, perfect for straya\'s wildest trails.</li>\n  <li><strong>The UrbanWalker Front-Clip Harness ($59 AUD):</strong> A training essential. Sleek design, anti-pull front clip, and a reflective strip along the spine for safe city walks.</li>\n</ul>\n\n<h2>Fast Australian Delivery — Because Your Pup Can\'t Wait</h2>\n\n<p>At Furlio, we know you want your order fast. That\'s why we offer <strong>free shipping Australia</strong>-wide on orders over $49 AUD, with most metro orders arriving within 3–7 business days. We ship to Sydney, Melbourne, Brisbane, Perth, Adelaide, Darwin, Hobart — and everywhere in between, including regional and rural Aussie communities.</p>\n\n<p>We\'re a proud Australian dropshipping store sourcing only from trusted suppliers who meet strict quality and safety standards. Every product in our <strong>Australian pet supplies</strong> range — from dog harnesses and leads to <strong>cat toys Australia</strong> loves — is chosen with your pet\'s wellbeing front of mind.</p>\n\n<h2>Final Thoughts: Invest in the Right Harness</h2>\n\n<p>A great dog harness isn\'t just a convenience — it\'s a safety investment for your furry mate and a daily comfort that makes walks something you both look forward to. Whether you\'re chasing sunsets on the beach, navigating the school pick-up gauntlet, or just pottering around the backyard, the right harness makes every outing better.</p>\n\n<p>Browse Furlio\'s full range of dog harnesses and <strong>dog accessories Australia</strong> trusts, and enjoy <strong>free shipping Australia</strong>-wide on eligible orders. Your pup deserves the best — and so do you.</p>','Best Dog Harnesses Australia 2026: The Ultimate Buying Guide for Your Furry Mate','Find the best dog harnesses in Australia 2026. Expert tips on fit, types & top picks. Free shipping Australia-wide. Shop Furlio for trusted Aussie pet supplies.','publish','open','open','','best-dog-harnesses-australia-2026','','','2026-04-24 23:53:02','2026-04-24 13:53:02','',0,'https://localhost/pet/best-dog-harnesses-australia-2026/',0,'post','',0),
(73,1,'2026-04-25 11:22:49','2026-04-25 01:22:49','<h2>Give Your Furry (and Feathered!) Mate the Fun They Deserve</h2>\n<p>Whether you\'ve got a cheeky cockatiel ruling the roost, a curious guinea pig exploring every corner of their hutch, or a lively rabbit who thinks your veggie garden is their personal buffet — your little mates deserve the very best enrichment toys available. Here at <strong>Furlio</strong>, we\'re passionate about connecting Aussie pet owners with quality, safe, and genuinely fun products that ship fast right across the country. From Darwin to Hobart, your pets are about to have the time of their lives.</p>\n<p>This 2026 buying guide covers everything you need to know about choosing the <strong>best bird and small animal enrichment toys in Australia</strong>, including what to look for, which types suit different animals, and how to get the most bang for your Aussie dollar. So grab a flat white, settle in, and let\'s get into it.</p>\n\n<h2>Why Enrichment Toys Actually Matter (More Than You Think)</h2>\n<p>Enrichment toys aren\'t just cute — they\'re essential for your pet\'s mental and physical wellbeing. Animals like parrots, budgies, rabbits, guinea pigs, rats, and ferrets are incredibly intelligent creatures. Without proper stimulation, they can develop stress behaviours like feather plucking, excessive chewing, or even depression. Think of enrichment toys as Netflix for your pets — keeping their brains buzzing and their instincts satisfied.</p>\n<p>Studies from veterinary associations across Australia consistently show that enriched environments lead to longer, healthier, and happier lives for small animals and birds. That\'s not just good news for your furry mate — it\'s good news for your vet bill too!</p>\n\n<h2>What to Look For When Buying Enrichment Toys in Australia</h2>\n<h3>1. Safety First, Always</h3>\n<p>This is non-negotiable. When shopping for <strong>Australian pet supplies</strong>, always check that toys are made from non-toxic materials. For birds especially, avoid anything with zinc, lead-based paints, or sharp wire ends. Look for products that are:</p>\n<ul>\n  <li>Free from toxic dyes and chemicals</li>\n  <li>Made from natural materials like untreated wood, sisal, and cotton rope</li>\n  <li>Sized appropriately for your specific animal</li>\n  <li>Free from small parts that could be swallowed</li>\n</ul>\n\n<h3>2. Durability — Built for Aussie Backyards and Beyond</h3>\n<p>Let\'s be real — Aussie pets are a tough bunch. A cockatoo will destroy a cheap toy in minutes flat. Look for toys that are genuinely built for Aussie backyards and robust enough to handle enthusiastic play sessions. Hardwood chews, stainless steel foraging toys, and reinforced wicker balls tend to outlast cheaper alternatives significantly.</p>\n\n<h3>3. Value for Money in AUD</h3>\n<p>Quality enrichment toys don\'t have to break the bank. At Furlio, you\'ll find options ranging from budget-friendly picks around <strong>$12–$18 AUD</strong> for basic foraging mats and chew toys, mid-range options between <strong>$25–$45 AUD</strong> for interactive puzzle feeders and hanging bird gyms, and premium sets from <strong>$60–$120 AUD</strong> for full enrichment bundles perfect for dedicated pet parents.</p>\n\n<h3>4. Fast Australian Delivery</h3>\n<p>Nobody wants to wait three weeks for a toy their pet needed yesterday. Furlio offers <strong>free shipping Australia</strong>-wide on qualifying orders, with most metro deliveries arriving within 3–5 business days. Regional and rural areas typically see delivery within 7–10 days. No dodgy overseas delays — just reliable, local-style service that understands the Aussie lifestyle.</p>\n\n<h2>Best Enrichment Toys by Animal Type</h2>\n\n<h3>🦜 Birds — Parrots, Budgies, Cockatiels & Cockatoos</h3>\n<p>Birds are arguably the most enrichment-hungry pets you can own. Their intelligence rivals that of a toddler (and their mischief levels often do too!). Here\'s what works brilliantly for your feathered Aussie mate:</p>\n<ul>\n  <li><strong>Foraging toys:</strong> Hide treats inside wooden blocks or woven palm cups. Birds go absolutely wild for the thrill of the hunt.</li>\n  <li><strong>Shredding toys:</strong> Made from palm leaves, cardboard, or balsa wood — perfect for satisfying that natural urge to destroy (your furniture will thank you).</li>\n  <li><strong>Swing and ladder combos:</strong> Great for physical exercise and balance. Look for natural rope swings without synthetic fibres.</li>\n  <li><strong>Bell and rattle toys:</strong> Especially loved by cockatoos and lorikeets who enjoy interactive noise-making.</li>\n  <li><strong>Mirror toys (use sparingly):</strong> Fine for budgies but can cause obsessive behaviour in larger parrots if overused.</li>\n</ul>\n<p><strong>Furlio pick:</strong> Natural Foraging Ball Set — from $22 AUD. A top seller for good reason — it\'s perfect for straya\'s most popular pet birds.</p>\n\n<h3>🐇 Rabbits</h3>\n<p>Rabbits are cheeky, curious, and absolutely need mental stimulation to stay happy. The best enrichment toys for bunnies include:</p>\n<ul>\n  <li><strong>Willow chew balls:</strong> Safe, natural, and endlessly entertaining. From $10 AUD.</li>\n  <li><strong>Hay tunnels and tubes:</strong> Double as enrichment AND encourage healthy hay consumption.</li>\n  <li><strong>Digging boxes:</strong> Fill with shredded paper or soil — built for Aussie backyards where bunnies love to dig.</li>\n  <li><strong>Treat puzzle feeders:</strong> Slow-feed designs that make your rabbit work for their pellets.</li>\n</ul>\n\n<h3>🐹 Guinea Pigs & Hamsters</h3>\n<p>These little legends thrive with sensory-rich environments. Top picks include:</p>\n<ul>\n  <li>Wooden hideaway huts and tunnels</li>\n  <li>Forage mats filled with dried herbs and flowers</li>\n  <li>Exercise wheels (ensure solid running surface — no gaps for little feet)</li>\n  <li>Hanging vegetable skewers for foraging fun</li>\n</ul>\n\n<h3>🐀 Rats & Ferrets</h3>\n<p>Arguably the most playful small animals on the list, rats and ferrets need complex, multi-level environments. Rope bridges, hammocks, dig boxes, and puzzle feeders are all brilliant choices. Rats especially love anything they can manipulate with their paws — latch puzzles and stacking cups from around $15–$30 AUD are fantastic investments.</p>\n\n<h2>Tips to Rotate Toys Like a Pro</h2>\n<p>Even the best toy gets boring eventually. Enrichment specialists recommend rotating toys every 1–2 weeks to keep things fresh. Store a selection in a box and swap them out regularly — your pet will react to a returning toy like it\'s brand new. It\'s one of the easiest (and cheapest!) ways to keep enrichment levels high without constantly buying new products.</p>\n\n<h2>Shopping Smart with Furlio</h2>\n<p>As one of Australia\'s favourite online pet destinations, Furlio makes it easy to find quality <strong>Australian pet supplies</strong> without the hassle. Browse our curated enrichment toy ranges for birds, rabbits, guinea pigs, and more — all carefully selected for safety, quality, and value. With <strong>free shipping Australia</strong>-wide on orders over $49 AUD, stocking up has never been easier or more affordable.</p>\n<p>Whether you\'re a first-time pet parent or a seasoned animal lover who\'s been keeping birds since Howard was PM, Furlio has something for every pet and every budget. Your furry mate (or feathered one!) deserves nothing but the best — and we\'re here to help you deliver exactly that.</p>\n\n<h2>Final Thoughts</h2>\n<p>Investing in enrichment toys is one of the most loving things you can do for your small animals and birds. Happy, stimulated pets are healthier, less destructive, and an absolute joy to be around. With fast delivery, unbeatable variety, and genuine care for animal welfare, Furlio is your go-to for the <strong>best bird and small animal enrichment toys in Australia in 2026</strong>. Shop the range today and watch your little mate\'s world light up — one toy at a time. 🐾</p>','Best Bird & Small Animal Enrichment Toys in Australia 2026: The Ultimate Buying Guide','Discover the best bird & small animal enrichment toys in Australia for 2026. Safe, quality picks with free shipping Australia-wide. Shop Furlio today!','publish','open','open','','best-bird-small-animal-enrichment-toys-australia-2026','','','2026-04-25 11:22:49','2026-04-25 01:22:49','',0,'https://localhost/pet/best-bird-small-animal-enrichment-toys-australia-2026/',0,'post','',0),
(74,1,'2026-04-25 11:24:27','2026-04-25 01:24:27','<h2>Welcome to the Pack: Everything Your New Pup Needs in 2026</h2>\n\n<p>G\'day, new puppy parent! First off — congrats! Whether you\'ve just picked up a fluffy little Labrador from a breeder in Queensland or rescued a cheeky Staffy from your local shelter, you\'re in for the ride of your life. But before the zoomies start and the midnight whimpers kick in, you\'re going to need the right gear to set your furry mate up for success.</p>\n\n<p>At <strong>Furlio</strong>, we\'ve done the hard yards so you don\'t have to. We\'ve rounded up the 10 absolute best new puppy starter pack essentials available right now — all shipped fast across Australia, with <strong>free shipping Australia</strong>-wide on qualifying orders. No drama, no dodgy overseas delays, just quality <strong>Australian pet supplies</strong> landing on your doorstep quicker than a kelpie chases a tennis ball.</p>\n\n<p>Let\'s get into it, mate.</p>\n\n<h2>1. Orthopedic Puppy Crate Mat – The Sleep Essential</h2>\n\n<p>Every pup needs a safe, cosy den to call their own. A quality orthopedic crate mat supports growing joints and gives your furry mate a sense of security — especially in those first anxious nights. Look for removable, machine-washable covers because, trust us, you\'ll need it.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $39.95</li>\n  <li><strong>Why we love it:</strong> Supports bone development, easy to clean, non-slip base</li>\n  <li><strong>Best for:</strong> All breeds, especially larger Aussie-favourite breeds like Golden Retrievers and Border Collies</li>\n</ul>\n\n<h2>2. Adjustable Puppy Harness – Walk Time, Done Right</h2>\n\n<p>Skip the collar pressure and go straight for a well-fitted puppy harness. These are perfect for straya\'s mix of beach walks, bush trails, and suburban footpaths. An adjustable, padded harness keeps your pup comfortable and gives you better control during those early training walks.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $24.95</li>\n  <li><strong>Why we love it:</strong> No-pull design, reflective stitching for evening walks, breathable mesh</li>\n  <li><strong>Best for:</strong> Puppies aged 8 weeks and up</li>\n</ul>\n\n<h2>3. Stainless Steel Food & Water Bowl Set – Dinnertime Sorted</h2>\n\n<p>Plastic bowls can harbour bacteria and some pups develop skin sensitivities from them. A solid stainless steel bowl set is hygienic, durable, and honestly built for Aussie backyards — it won\'t fade in the sun or crack in the heat. Bonus: they\'re dishwasher safe. Legend.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $19.95 for a set</li>\n  <li><strong>Why we love it:</strong> BPA-free, rust-resistant, non-tip rubber base</li>\n  <li><strong>Best for:</strong> All puppies and adult dogs</li>\n</ul>\n\n<h2>4. Puppy Training Pads – Because Accidents Happen</h2>\n\n<p>Look, no judgement here. Every new pup has their moments, especially on chilly winter mornings when they can\'t make it outside in time. High-absorbency training pads with leak-proof backing save your floorboards and your sanity. Stock up — you\'ll go through more than you think.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $29.95 for a pack of 50</li>\n  <li><strong>Why we love it:</strong> Odour-lock technology, quick-dry surface, attractant scent to encourage use</li>\n  <li><strong>Best for:</strong> Indoor training, apartment living, rainy days in Melbourne</li>\n</ul>\n\n<h2>5. Interactive Chew Toy Set – Goodbye, Chewed Thongs</h2>\n\n<p>Teething puppies will chew anything they can get their paws on — and if you\'ve got a cheeky pup eyeing your favourite pair of thongs, it\'s time to invest in a proper chew toy set. Look for durable rubber options with treat-dispensing features to keep your furry mate mentally stimulated and out of mischief.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $22.95 for a 3-piece set</li>\n  <li><strong>Why we love it:</strong> Vet-approved materials, supports healthy jaw development, dishwasher safe</li>\n  <li><strong>Best for:</strong> Teething puppies 8–16 weeks</li>\n</ul>\n\n<h2>6. Puppy Training Clicker & Treat Pouch Combo</h2>\n\n<p>Good behaviour starts early, and a clicker-and-treat-pouch combo is the classic trainer\'s toolkit for a reason. It makes positive reinforcement simple, consistent, and fun — for both of you. The treat pouch clips to your belt or waistband, keeping your hands free during training sessions at the park.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $18.95</li>\n  <li><strong>Why we love it:</strong> Lightweight, easy to use, great for first-time dog owners</li>\n  <li><strong>Best for:</strong> Basic obedience, socialisation training</li>\n</ul>\n\n<h2>7. Puppy Playpen – Safe Space to Explore</h2>\n\n<p>A puppy playpen is an absolute game-changer for new pet parents. It gives your pup a safe, contained space to roam without having run of the whole house before they\'re ready. Built for Aussie backyards and indoor living alike, a good pen is foldable, portable, and easy to set up.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $64.95</li>\n  <li><strong>Why we love it:</strong> Expandable panels, rust-resistant steel, indoor/outdoor use</li>\n  <li><strong>Best for:</strong> Unsupervised play, toilet training zones</li>\n</ul>\n\n<h2>8. Grooming Starter Kit – Looking Fresh, Feeling Great</h2>\n\n<p>Starting grooming routines early means your pup grows up comfortable with brushing, nail trims, and baths. A starter grooming kit with a soft-bristle brush, nail clippers, and a gentle puppy shampoo covers all the basics. Your vet will thank you, and your couch will too.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $34.95</li>\n  <li><strong>Why we love it:</strong> Gentle on sensitive puppy skin, vet-recommended tools, compact carry bag</li>\n  <li><strong>Best for:</strong> All coat types, especially double-coated breeds popular in Australia</li>\n</ul>\n\n<h2>9. Puppy ID Tag & Collar Set – Safety First, Always</h2>\n\n<p>In Australia, microchipping is mandatory — but a personalised ID tag is your first line of defence if your adventurous furry mate ever goes on an unauthorised exploration. A quality breakaway collar with a laser-engraved tag is a must-have from day one. Keep it cute, keep it safe.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $16.95</li>\n  <li><strong>Why we love it:</strong> Adjustable sizing, quick-release buckle, personalisation available</li>\n  <li><strong>Best for:</strong> All puppies — non-negotiable, honestly</li>\n</ul>\n\n<h2>10. Puppy Calming Spray & Anxiety Blanket – For the Nervous Nights</h2>\n\n<p>That first week home can be tough on a little pup. A lavender-based calming spray combined with a snuggly anxiety blanket (with a built-in heartbeat simulator on premium models) can make a world of difference. Think of it as the Aussie equivalent of a warm hug from a mate — but for your dog.</p>\n\n<ul>\n  <li><strong>Price:</strong> From AUD $44.95 for the bundle</li>\n  <li><strong>Why we love it:</strong> Drug-free, vet-approved formula, washable blanket cover</li>\n  <li><strong>Best for:</strong> Separation anxiety, thunderstorms, fireworks on New Year\'s Eve</li>\n</ul>\n\n<h2>Why Shop Your Puppy Essentials at Furlio?</h2>\n\n<p>At Furlio, we\'re passionate about making pet parenthood easier, more affordable, and more fun for every Aussie household. Our range of <strong>dog accessories Australia</strong> pet owners love is carefully curated for quality, safety, and value — and with <strong>free shipping Australia</strong>-wide on orders over AUD $75, getting stocked up has never been easier.</p>\n\n<p>We stock a growing range of <strong>Australian pet supplies</strong> and even a cracking selection of <strong>cat toys Australia</strong> cat lovers go wild for — so whether you\'re a dog person, a cat person, or somehow both, Furlio has got your back (and your pet\'s).</p>\n\n<p>Fast local delivery, friendly customer support, and products your furry mate will genuinely love. That\'s the Furlio promise. Now go enjoy every chaotic, wonderful moment of puppyhood — you\'ve earned it, legend. 🐾</p>','10 Best New Puppy Starter Pack Essentials in Australia 2026','Welcoming a new pup in 2026? Discover the 10 best puppy starter pack essentials in Australia — quality picks with fast free shipping from Furlio.','publish','open','open','','new-puppy-starter-pack-essentials-australia-2026','','','2026-04-25 11:24:27','2026-04-25 01:24:27','',0,'https://localhost/pet/new-puppy-starter-pack-essentials-australia-2026/',0,'post','',0),
(75,0,'2026-04-25 12:11:51','2026-04-25 02:11:51','','','','draft','closed','closed','','','','','2026-04-25 12:11:51','2026-04-25 02:11:51','',0,'https://furlio.au/?post_type=shop_order_placehold&p=75',0,'shop_order_placehold','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(1,1,0),
(28,22,0),
(29,22,0),
(30,22,0),
(31,22,0),
(32,22,0),
(41,2,0),
(41,16,0),
(41,23,0),
(41,24,0),
(41,25,0),
(41,26,0),
(41,27,0),
(42,2,0),
(42,17,0),
(42,28,0),
(42,29,0),
(42,30,0),
(42,31,0),
(42,32,0),
(43,2,0),
(43,16,0),
(43,25,0),
(43,33,0),
(43,34,0),
(43,35,0),
(43,36,0),
(44,2,0),
(44,16,0),
(44,35,0),
(44,37,0),
(44,38,0),
(44,39,0),
(44,40,0),
(45,2,0),
(45,15,0),
(45,41,0),
(45,42,0),
(45,43,0),
(45,44,0),
(45,45,0),
(46,2,0),
(46,19,0),
(46,35,0),
(46,46,0),
(46,47,0),
(46,48,0),
(46,49,0),
(61,2,0),
(61,15,0),
(61,35,0),
(61,50,0),
(61,51,0),
(61,52,0),
(61,53,0),
(62,1,0),
(64,2,0),
(64,15,0),
(64,35,0),
(64,50,0),
(64,54,0),
(64,55,0),
(64,56,0),
(65,1,0),
(67,21,0),
(68,21,0),
(69,21,0),
(70,21,0),
(72,1,0),
(73,1,0),
(74,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,6),
(2,2,'product_type','',0,8),
(3,3,'product_type','',0,0),
(4,4,'product_type','',0,0),
(5,5,'product_type','',0,0),
(6,6,'product_visibility','',0,0),
(7,7,'product_visibility','',0,0),
(8,8,'product_visibility','',0,0),
(9,9,'product_visibility','',0,0),
(10,10,'product_visibility','',0,0),
(11,11,'product_visibility','',0,0),
(12,12,'product_visibility','',0,0),
(13,13,'product_visibility','',0,0),
(14,14,'product_visibility','',0,0),
(15,15,'product_cat','',0,3),
(16,16,'product_cat','',0,3),
(17,17,'product_cat','',0,1),
(18,18,'product_cat','',0,0),
(19,19,'product_cat','',0,1),
(20,20,'product_cat','',0,0),
(21,21,'nav_menu','',0,4),
(22,22,'nav_menu','',0,5),
(23,23,'product_tag','',0,1),
(24,24,'product_tag','',0,1),
(25,25,'product_tag','',0,2),
(26,26,'product_tag','',0,1),
(27,27,'product_tag','',0,1),
(28,28,'product_tag','',0,1),
(29,29,'product_tag','',0,1),
(30,30,'product_tag','',0,1),
(31,31,'product_tag','',0,1),
(32,32,'product_tag','',0,1),
(33,33,'product_tag','',0,1),
(34,34,'product_tag','',0,1),
(35,35,'product_tag','',0,5),
(36,36,'product_tag','',0,1),
(37,37,'product_tag','',0,1),
(38,38,'product_tag','',0,1),
(39,39,'product_tag','',0,1),
(40,40,'product_tag','',0,1),
(41,41,'product_tag','',0,1),
(42,42,'product_tag','',0,1),
(43,43,'product_tag','',0,1),
(44,44,'product_tag','',0,1),
(45,45,'product_tag','',0,1),
(46,46,'product_tag','',0,1),
(47,47,'product_tag','',0,1),
(48,48,'product_tag','',0,1),
(49,49,'product_tag','',0,1),
(50,50,'product_tag','',0,2),
(51,51,'product_tag','',0,1),
(52,52,'product_tag','',0,1),
(53,53,'product_tag','',0,1),
(54,54,'product_tag','',0,1),
(55,55,'product_tag','',0,1),
(56,56,'product_tag','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
INSERT INTO `wp_termmeta` VALUES
(1,16,'product_count_product_cat','3'),
(2,23,'product_count_product_tag','1'),
(3,24,'product_count_product_tag','1'),
(4,25,'product_count_product_tag','2'),
(5,26,'product_count_product_tag','1'),
(6,27,'product_count_product_tag','1'),
(7,17,'product_count_product_cat','1'),
(8,28,'product_count_product_tag','1'),
(9,29,'product_count_product_tag','1'),
(10,30,'product_count_product_tag','1'),
(11,31,'product_count_product_tag','1'),
(12,32,'product_count_product_tag','1'),
(13,33,'product_count_product_tag','1'),
(14,34,'product_count_product_tag','1'),
(15,35,'product_count_product_tag','5'),
(16,36,'product_count_product_tag','1'),
(17,37,'product_count_product_tag','1'),
(18,38,'product_count_product_tag','1'),
(19,39,'product_count_product_tag','1'),
(20,40,'product_count_product_tag','1'),
(21,15,'product_count_product_cat','3'),
(22,41,'product_count_product_tag','1'),
(23,42,'product_count_product_tag','1'),
(24,43,'product_count_product_tag','1'),
(25,44,'product_count_product_tag','1'),
(26,45,'product_count_product_tag','1'),
(27,19,'product_count_product_cat','1'),
(28,46,'product_count_product_tag','1'),
(29,47,'product_count_product_tag','1'),
(30,48,'product_count_product_tag','1'),
(31,49,'product_count_product_tag','1'),
(32,50,'product_count_product_tag','2'),
(33,51,'product_count_product_tag','1'),
(34,52,'product_count_product_tag','1'),
(35,53,'product_count_product_tag','1'),
(36,54,'product_count_product_tag','1'),
(37,55,'product_count_product_tag','1'),
(38,56,'product_count_product_tag','1');
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorised','uncategorised',0),
(2,'simple','simple',0),
(3,'grouped','grouped',0),
(4,'variable','variable',0),
(5,'external','external',0),
(6,'exclude-from-search','exclude-from-search',0),
(7,'exclude-from-catalog','exclude-from-catalog',0),
(8,'featured','featured',0),
(9,'outofstock','outofstock',0),
(10,'rated-1','rated-1',0),
(11,'rated-2','rated-2',0),
(12,'rated-3','rated-3',0),
(13,'rated-4','rated-4',0),
(14,'rated-5','rated-5',0),
(15,'Uncategorized','uncategorized',0),
(16,'Dog Accessories','dog-accessories',0),
(17,'Cat Supplies','cat-supplies',0),
(18,'Bird &amp; Aquatic','bird-aquatic',0),
(19,'Small Animals','small-animals',0),
(20,'Pet Health','pet-health',0),
(21,'Primary Navigation','primary-navigation',0),
(22,'Footer','footer',0),
(23,'dog bed','dog-bed',0),
(24,'orthopedic dog bed','orthopedic-dog-bed',0),
(25,'dog accessories Australia','dog-accessories-australia',0),
(26,'memory foam pet bed','memory-foam-pet-bed',0),
(27,'large dog bed','large-dog-bed',0),
(28,'cat toys Australia','cat-toys-australia',0),
(29,'interactive cat toy','interactive-cat-toy',0),
(30,'feather wand','feather-wand',0),
(31,'indoor cat toys','indoor-cat-toys',0),
(32,'cat accessories','cat-accessories',0),
(33,'slow feeder dog bowl','slow-feeder-dog-bowl',0),
(34,'stainless steel dog bowl','stainless-steel-dog-bowl',0),
(35,'Australian pet supplies','australian-pet-supplies',0),
(36,'anti-bloat dog bowl','anti-bloat-dog-bowl',0),
(37,'self cleaning slicker brush','self-cleaning-slicker-brush',0),
(38,'dog grooming Australia','dog-grooming-australia',0),
(39,'cat grooming brush','cat-grooming-brush',0),
(40,'pet deshedding tool','pet-deshedding-tool',0),
(41,'budgie swing perch','budgie-swing-perch',0),
(42,'bird accessories Australia','bird-accessories-australia',0),
(43,'budgie toys','budgie-toys',0),
(44,'bird &amp; aquatic supplies','bird-aquatic-supplies',0),
(45,'parakeet perch Australia','parakeet-perch-australia',0),
(46,'guinea pig hideout','guinea-pig-hideout',0),
(47,'small animals Australia','small-animals-australia',0),
(48,'guinea pig toys','guinea-pig-toys',0),
(49,'seagrass tunnel pet','seagrass-tunnel-pet',0),
(50,'cat litter Australia','cat-litter-australia',0),
(51,'clumping cat litter','clumping-cat-litter',0),
(52,'cat accessories Australia','cat-accessories-australia',0),
(53,'odour control cat litter','odour-control-cat-litter',0),
(54,'eco-friendly cat litter','eco-friendly-cat-litter',0),
(55,'recycled paper cat litter','recycled-paper-cat-litter',0),
(56,'Breeders Choice litter','breeders-choice-litter',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','admin'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','fresh'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers',''),
(15,1,'show_welcome_panel','1'),
(16,1,'_woocommerce_persistent_cart_1','a:1:{s:4:\"cart\";a:0:{}}'),
(17,1,'session_tokens','a:1:{s:64:\"1e0648b09e3d67ec647f27b74cf987e107aa413accb8602e575c298df32c1600\";a:4:{s:10:\"expiration\";i:1776684919;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0\";s:5:\"login\";i:1776512119;}}'),
(18,1,'wc_last_active','1776521383'),
(20,1,'_woocommerce_tracks_anon_id','woo:yuLebrTft1dwV1vbvjaaHvL2'),
(21,1,'_yoast_wpseo_introductions','a:0:{}'),
(22,1,'wp_dashboard_quick_press_last_post_id','12'),
(24,1,'_application_passwords','a:1:{i:0;a:7:{s:4:\"uuid\";s:36:\"19a5bd3e-0ba9-42ce-8f4c-0009160c0112\";s:6:\"app_id\";s:0:\"\";s:4:\"name\";s:12:\"Dropship Bot\";s:8:\"password\";s:49:\"$generic$kJCEXWW3_-x7abxyWomotB1JLY8VoXlu5HoespTI\";s:7:\"created\";i:1776514267;s:9:\"last_used\";i:1777038782;s:7:\"last_ip\";s:9:\"127.0.0.1\";}}'),
(25,2,'nickname','hemanshu.panchal86'),
(26,2,'first_name',''),
(27,2,'last_name',''),
(28,2,'description',''),
(29,2,'rich_editing','true'),
(30,2,'syntax_highlighting','true'),
(31,2,'comment_shortcuts','false'),
(32,2,'admin_color','fresh'),
(33,2,'use_ssl','0'),
(34,2,'show_admin_bar_front','true'),
(35,2,'locale',''),
(36,2,'wp_capabilities','a:1:{s:8:\"customer\";b:1;}'),
(37,2,'wp_user_level','0'),
(38,2,'_wc_order_attribution_source_type','typein'),
(39,2,'_wc_order_attribution_utm_source','(direct)'),
(40,2,'_wc_order_attribution_session_entry','https://furlio.au/'),
(41,2,'_wc_order_attribution_session_start_time','2026-04-19 05:53:52'),
(42,2,'_wc_order_attribution_session_pages','52'),
(43,2,'_wc_order_attribution_session_count','5'),
(44,2,'_wc_order_attribution_user_agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0'),
(45,2,'_wc_order_attribution_device_type','Desktop'),
(46,2,'default_password_nag','1'),
(47,2,'last_update','1776604556'),
(49,2,'wc_last_active','1776608833'),
(50,3,'nickname','shakuntala.panchal'),
(51,3,'first_name','Shakuntala'),
(52,3,'last_name','Panchal'),
(53,3,'description',''),
(54,3,'rich_editing','true'),
(55,3,'syntax_highlighting','true'),
(56,3,'comment_shortcuts','false'),
(57,3,'admin_color','fresh'),
(58,3,'use_ssl','0'),
(59,3,'show_admin_bar_front','true'),
(60,3,'locale',''),
(61,3,'wp_capabilities','a:1:{s:8:\"customer\";b:1;}'),
(62,3,'wp_user_level','0'),
(63,3,'default_password_nag','1'),
(64,3,'last_update','1776687098'),
(65,3,'wc_last_active','1776913569'),
(66,3,'session_tokens','a:1:{s:64:\"2d55e83548c0b8444a62e635737bc818d196fbc04910951506eefcb2f69a12d2\";a:4:{s:10:\"expiration\";i:1777896698;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0\";s:5:\"login\";i:1776687098;}}'),
(67,3,'billing_first_name','Shakuntala'),
(68,3,'billing_last_name','Panchal'),
(69,3,'billing_address_1','Unit 8'),
(70,3,'billing_address_2','5-7 Bando Road'),
(71,3,'billing_city','Girraween'),
(72,3,'billing_state','NSW'),
(73,3,'billing_postcode','2145'),
(74,3,'billing_country','AU'),
(75,3,'billing_email','savenest.au@gmail.com'),
(76,3,'billing_phone','+61434945317'),
(77,3,'shipping_first_name','Shakuntala'),
(78,3,'shipping_last_name','Panchal'),
(79,3,'shipping_address_1','Unit 8'),
(80,3,'shipping_address_2','5-7 Bando Road'),
(81,3,'shipping_city','Girraween'),
(82,3,'shipping_state','NSW'),
(83,3,'shipping_postcode','2145'),
(84,3,'shipping_country','AU'),
(85,3,'shipping_phone','+61434945317'),
(86,3,'wp__stripe_customer_id','cus_UN0hOUKAsFri5T'),
(87,3,'_woocommerce_persistent_cart_1','a:1:{s:4:\"cart\";a:1:{s:32:\"7f39f8317fbdb1988ef4c628eba02591\";a:11:{s:3:\"key\";s:32:\"7f39f8317fbdb1988ef4c628eba02591\";s:10:\"product_id\";i:61;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:3;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:1:{i:1;d:5;}s:5:\"total\";a:1:{i:1;d:5;}}s:13:\"line_subtotal\";d:50;s:17:\"line_subtotal_tax\";d:5;s:10:\"line_total\";d:50;s:8:\"line_tax\";d:5;}}}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'admin','$wp$2y$10$jWs0Bq2RNlKk.wONp6F6..Bmny8nH07coawYI7qOg60F/L2lsNvYK','admin','dsightstech@gmail.com','https://furlio.au','2026-04-18 11:31:49','',0,'admin'),
(2,'hemanshu.panchal86','$wp$2y$10$JsusO44mVAum9DXmP54Oauf1wNUw9nsRpKgbirj/anGLmwSnh3QCW','hemanshu-panchal86','hemanshu.panchal86@gmail.com','','2026-04-19 13:15:56','1776604556:$generic$2ViX-J94ivrhO9483hqphlozJCZbq86bAT0_98Qz',0,'hemanshu.panchal86'),
(3,'shakuntala.panchal','$wp$2y$10$ghefMz/aYJk678Quut2G9eDCN3jFcYzXUtJyLchCutAg7tt.lW61W','shakuntala-panchal','savenest.au@gmail.com','','2026-04-20 12:11:38','1776687098:$generic$fZoHO8QrjOOJiHCNKPtQHd1E0GTAAPis6580PgHz',0,'Shakuntala Panchal');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_note_actions`
--

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `actioned_text` varchar(255) NOT NULL,
  `nonce_action` varchar(255) DEFAULT NULL,
  `nonce_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_note_actions`
--

LOCK TABLES `wp_wc_admin_note_actions` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` DISABLE KEYS */;
INSERT INTO `wp_wc_admin_note_actions` VALUES
(1,1,'notify-refund-returns-page','Edit page','https://furlio.au/wp-admin/post.php?post=10&action=edit','actioned','',NULL,NULL),
(2,2,'learn-more','Learn more','https://woocommerce.com/posts/pre-launch-checklist-the-essentials/?utm_source=inbox&utm_medium=product','actioned','',NULL,NULL),
(155,55,'wc-stripe-bnpl-promotion-note','Learn more','https://woocommerce.com/document/stripe/setup-and-configuration/additional-payment-methods/','unactioned','',NULL,NULL),
(156,56,'wc-stripe-oc-promotion-note','Activate now','?page=wc-settings&tab=checkout&section=stripe&panel=settings&highlight=enable-optimized-checkout','unactioned','',NULL,NULL),
(157,57,'protect-paypal-with-recaptcha','Enable reCAPTCHA →','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=integration&section=ppcp-recaptcha','unactioned','',NULL,NULL),
(158,57,'learn-more-paypal-recaptcha','Learn more','https://woocommerce.com/document/woocommerce-paypal-payments/fraud-and-disputes/#section-4','unactioned','',NULL,NULL),
(159,58,'day-after-first-product','Learn more','https://woocommerce.com/document/woocommerce-customizer/?utm_source=inbox&utm_medium=product','actioned','',NULL,NULL),
(160,59,'learn-more','Learn more','https://woocommerce.com/mobile/?utm_medium=product','actioned','',NULL,NULL),
(313,60,'usps-surcharge-apr2026-cta','Learn More','https://about.usps.com/newsroom/national-releases/2026/0325-usps-announces-transportation-related-time-limited-price-change.htm','unactioned','',NULL,NULL),
(314,3,'learn-more','Learn more','https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','actioned','',NULL,NULL),
(315,4,'optimizing-the-checkout-flow','Learn more','https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox_note&utm_medium=product&utm_campaign=optimizing-the-checkout-flow','actioned','',NULL,NULL),
(316,5,'qualitative-feedback-from-new-users','Share feedback','https://automattic.survey.fm/woopayments-new-user-feedback','actioned','',NULL,NULL),
(317,6,'share-feedback','Share feedback','http://automattic.survey.fm/paypal-feedback','unactioned','',NULL,NULL),
(318,7,'get-started','Get started','https://woocommerce.com/products/google-listings-and-ads?utm_source=inbox_note&utm_medium=product&utm_campaign=get-started','actioned','',NULL,NULL),
(319,8,'update-wc-subscriptions-3-0-15','View latest version','https://furlio.au/wp-admin/&page=wc-addons&section=helper','actioned','',NULL,NULL),
(320,9,'update-wc-core-5-4-0','How to update WooCommerce','https://docs.woocommerce.com/document/how-to-update-woocommerce/','actioned','',NULL,NULL),
(321,12,'ppxo-pps-install-paypal-payments-1','View upgrade guide','https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/','actioned','',NULL,NULL),
(322,13,'ppxo-pps-install-paypal-payments-2','View upgrade guide','https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/','actioned','',NULL,NULL),
(323,14,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
(324,14,'dismiss','Dismiss','','actioned','',NULL,NULL),
(325,15,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
(326,15,'dismiss','Dismiss','','actioned','',NULL,NULL),
(327,16,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
(328,16,'dismiss','Dismiss','','actioned','',NULL,NULL),
(329,17,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
(330,17,'dismiss','Dismiss','','actioned','',NULL,NULL),
(331,18,'share-feedback','Share feedback','https://automattic.survey.fm/store-management','unactioned','',NULL,NULL),
(332,19,'learn-more','Learn more','https://developer.woocommerce.com/2022/03/10/woocommerce-3-5-10-6-3-1-security-releases/','unactioned','',NULL,NULL),
(333,19,'woocommerce-core-paypal-march-2022-dismiss','Dismiss','','actioned','',NULL,NULL),
(334,20,'learn-more','Learn more','https://developer.woocommerce.com/2022/03/10/woocommerce-3-5-10-6-3-1-security-releases/','unactioned','',NULL,NULL),
(335,20,'dismiss','Dismiss','','actioned','',NULL,NULL),
(336,21,'pinterest_03_2022_update','Update Instructions','https://woocommerce.com/document/pinterest-for-woocommerce/?utm_source=inbox_note&utm_medium=product&utm_campaign=pinterest_03_2022_update#section-3','actioned','',NULL,NULL),
(337,22,'store_setup_survey_survey_q2_2022_share_your_thoughts','Tell us how it’s going','https://automattic.survey.fm/store-setup-survey-2022','actioned','',NULL,NULL),
(338,23,'needs-update-eway-payment-gateway-rin-action-button-2022-12-20','See available updates','https://furlio.au/wp-admin/update-core.php','unactioned','',NULL,NULL),
(339,23,'needs-update-eway-payment-gateway-rin-dismiss-button-2022-12-20','Dismiss','#','actioned','',NULL,NULL),
(340,24,'updated-eway-payment-gateway-rin-action-button-2022-12-20','See all updates','https://furlio.au/wp-admin/update-core.php','unactioned','',NULL,NULL),
(341,24,'updated-eway-payment-gateway-rin-dismiss-button-2022-12-20','Dismiss','#','actioned','',NULL,NULL),
(342,25,'share-navigation-survey-feedback','Share feedback','https://automattic.survey.fm/new-ecommerce-plan-navigation','actioned','',NULL,NULL),
(343,26,'woopay-beta-merchantrecruitment-activate-04MAY23','Activate WooPay','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
(344,26,'woopay-beta-merchantrecruitment-activate-learnmore-04MAY23','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-activate-learnmore-04MAY23','unactioned','',NULL,NULL),
(345,27,'woocommerce-wcpay-march-2023-update-needed-button','See Blog Post','https://developer.woocommerce.com/2023/03/23/critical-vulnerability-detected-in-woocommerce-payments-what-you-need-to-know','unactioned','',NULL,NULL),
(346,27,'woocommerce-wcpay-march-2023-update-needed-dismiss-button','Dismiss','#','actioned','',NULL,NULL),
(347,28,'tap_to_pay_iphone_q2_2023_no_wcpay','Simplify my payments','https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox_note&utm_medium=product&utm_campaign=tap_to_pay_iphone_q2_2023_no_wcpay','actioned','',NULL,NULL),
(348,29,'extension-settings','See available updates','https://furlio.au/wp-admin/update-core.php','unactioned','',NULL,NULL),
(349,29,'dismiss','Dismiss','#','actioned','',NULL,NULL),
(350,30,'woopay-beta-merchantrecruitment-update-WCPay-04MAY23','Update WooCommerce Payments','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(351,30,'woopay-beta-merchantrecruitment-update-activate-04MAY23','Activate WooPay','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
(352,31,'woopay-beta-existingmerchants-noaction-documentation-27APR23','Documentation','https://woocommerce.com/document/woopay-merchant-documentation/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-existingmerchants-noaction-documentation-27APR23','actioned','',NULL,NULL),
(353,32,'woopay-beta-existingmerchants-update-WCPay-27APR23','Update WooCommerce Payments','https://furlio.au/wp-admin/plugins.php?plugin_status=all','actioned','',NULL,NULL),
(354,33,'woopay-beta-merchantrecruitment-short-activate-04MAY23','Activate WooPay','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
(355,33,'woopay-beta-merchantrecruitment-short-activate-learnmore-04MAY23','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-04MAY23','actioned','',NULL,NULL),
(356,34,'woopay-beta-merchantrecruitment-short-update-WCPay-04MAY23','Update WooCommerce Payments','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(357,34,'woopay-beta-merchantrecruitment-short-update-activate-04MAY23','Activate WooPay','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
(358,35,'woopay-beta-merchantrecruitment-short-activate-button-09MAY23','Activate WooPay','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
(359,35,'woopay-beta-merchantrecruitment-short-activate-learnmore-button2-09MAY23','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-button2-09MAY23','unactioned','',NULL,NULL),
(360,36,'woopay-beta-merchantrecruitment-short-update-WCPay-09MAY23','Update WooCommerce Payments','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(361,36,'woopay-beta-merchantrecruitment-short-update-activate-09MAY23','Activate WooPay','https://furlio.au/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
(362,37,'woocommerce-WCSubscriptions-June-2023-updated-needed-Plugin-Settings','See available updates','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(363,37,'woocommerce-WCSubscriptions-June-2023-updated-needed-dismiss','Dismiss','#','actioned','',NULL,NULL),
(364,38,'woocommerce-WCReturnsWarranty-June-2023-updated-needed','See available updates','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(365,38,'woocommerce-WCReturnsWarranty-June-2023-updated-needed','Dismiss','#','actioned','',NULL,NULL),
(366,39,'woocommerce-WCOPC-June-2023-updated-needed','See available updates','https://furlio.au/wp-admin/plugins.php?plugin_status=all','actioned','',NULL,NULL),
(367,39,'woocommerce-WCOPC-June-2023-updated-needed','Dismiss','https://furlio.au/wp-admin/#','actioned','',NULL,NULL),
(368,40,'woocommerce-WCGC-July-2023-update-needed','See available updates','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(369,40,'woocommerce-WCGC-July-2023-update-needed','Dismiss','#','actioned','',NULL,NULL),
(370,41,'learn-more','Learn more','https://woocommerce.com/document/fedex/?utm_medium=product&utm_source=inbox_note&utm_campaign=learn-more#july-2023-api-outage','unactioned','',NULL,NULL),
(371,42,'plugin-list','See available updates','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(372,42,'dismiss','Dismiss','https://furlio.au/wp-admin/admin.php?page=wc-admin','actioned','',NULL,NULL),
(373,43,'woocommerce-WCStripe-Aug-2023-update-needed','See available updates','https://furlio.au/wp-admin/update-core.php?','unactioned','',NULL,NULL),
(374,43,'dismiss','Dismiss','#','actioned','',NULL,NULL),
(375,44,'dismiss','Dismiss','#','actioned','',NULL,NULL),
(376,45,'dismiss','Dismiss','#','actioned','',NULL,NULL),
(377,46,'avalara_q3-2023_noAvaTax','Automate my sales tax','https://woocommerce.com/products/woocommerce-avatax/?utm_source=inbox_note&utm_medium=product&utm_campaign=avalara_q3-2023_noAvaTax','unactioned','',NULL,NULL),
(378,47,'woocommerce-usermeta-Sept2023-productvendors','See available updates','https://furlio.au/wp-admin/plugins.php','unactioned','',NULL,NULL),
(379,47,'dismiss','Dismiss','https://furlio.au/wp-admin/#','actioned','',NULL,NULL),
(380,48,'woocommerce-STRIPE-Oct-2023-update-needed','See available updates','https://furlio.au/wp-admin/update-core.php','unactioned','',NULL,NULL),
(381,48,'dismiss','Dismiss','#','actioned','',NULL,NULL),
(382,49,'amazon-mcf-review-button-2023-12-07','Leave a review','https://woocommerce.com/products/woocommerce-amazon-fulfillment/?review&utm_source=inbox_note&utm_medium=product&utm_campaign=amazon-mcf-review-button-2023-12-07','actioned','',NULL,NULL),
(383,49,'amazon-mcf-support-button-2023-12-07','Request support','https://woocommerce.com/my-account/contact-support/?utm_source=inbox_note&utm_medium=product&utm_campaign=amazon-mcf-support-button-2023-12-07','actioned','',NULL,NULL),
(384,50,'view_docs','Learn about Deposit schedules','https://woocommerce.com/document/woopayments/deposits/deposit-schedule/?utm_source=inbox_note&utm_medium=product&utm_campaign=view_docs#available-funds','unactioned','',NULL,NULL),
(385,51,'sirt-woo-2024-11-xss-admin','See available updates','https://furlio.au/wp-admin/update-core.php?','unactioned','',NULL,NULL),
(386,51,'sirt-woo-2024-11-xss-admin','Dismiss','#','actioned','',NULL,NULL),
(387,52,'paypal-braintree-sdk-depreciation-2025-02-20-button','Upgrade now','https://furlio.au/wp-admin/wp-admin/plugins.php','actioned','',NULL,NULL),
(388,53,'uk-vat-notice-button-2025-04-30','Learn more about this extension','https://wordpress.org/plugins/eu-vat-for-woocommerce/','actioned','',NULL,NULL),
(389,54,'paypal-braintree-sdk-depreciation-2025-05-30-button','Update now','https://furlio.au/wp-admin/wp-admin/plugins.php','unactioned','',NULL,NULL),
(390,61,'stripe-woo-gateway-update-april2026','See available updates','https://furlio.au/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
(391,61,'stripe-woo-gateway-update-april2026','Dismiss','#','actioned','',NULL,NULL);
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_notes`
--

DROP TABLE IF EXISTS `wp_wc_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `locale` varchar(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `content_data` longtext DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `source` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) NOT NULL DEFAULT '',
  `image` varchar(200) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) NOT NULL DEFAULT 'info',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_notes`
--

LOCK TABLES `wp_wc_admin_notes` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_notes` DISABLE KEYS */;
INSERT INTO `wp_wc_admin_notes` VALUES
(1,'wc-refund-returns-page','info','en_US','Setup a Refund and Returns Policy page to boost your store\'s credibility.','We have created a sample draft Refund and Returns Policy page for you. Please have a look and update it to fit your store.','{}','unactioned','woocommerce-core','2026-04-18 11:35:04',NULL,0,'plain','',0,0,'info'),
(2,'wc-admin-launch-checklist','info','en_US','Ready to launch your store?','To make sure you never get that sinking \"what did I forget\" feeling, we\'ve put together the essential pre-launch checklist.','{}','unactioned','woocommerce-admin','2026-04-18 11:35:05',NULL,0,'plain','',0,0,'info'),
(3,'your-first-product','info','en_US','Your first product','That’s huge! You’re well on your way to building a successful online store — now it’s time to think about how you’ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(4,'wc-admin-optimizing-the-checkout-flow','info','en_US','Optimizing the checkout flow','It’s crucial to get your store’s checkout as smooth as possible to avoid losing sales. Let’s take a look at how you can optimize the checkout experience for your shoppers.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(5,'wc-payments-qualitative-feedback','info','en_US','WooPayments setup - let us know what you think','Congrats on enabling WooPayments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(6,'share-your-feedback-on-paypal','info','en_US','Share your feedback on PayPal','Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(7,'google_listings_and_ads_install','marketing','en_US','Drive traffic and sales with Google','Reach online shoppers to drive traffic and sales for your store by showcasing products across Google, for free or with ads.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(8,'wc-subscriptions-security-update-3-0-15','info','en_US','WooCommerce Subscriptions security update!','We recently released an important security update to WooCommerce Subscriptions. To ensure your site’s data is protected, please upgrade <strong>WooCommerce Subscriptions to version 3.0.15</strong> or later.<br /><br />Click the button below to view and update to the latest Subscriptions version, or log in to <a href=\"https://woocommerce.com/my-dashboard\">WooCommerce.com Dashboard</a> and navigate to your <strong>Downloads</strong> page.<br /><br />We recommend always using the latest version of WooCommerce Subscriptions, and other software running on your site, to ensure maximum security.<br /><br />If you have any questions we are here to help — just <a href=\"https://woocommerce.com/my-account/create-a-ticket/\">open a ticket</a>.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(9,'woocommerce-core-update-5-4-0','info','en_US','Update to WooCommerce 5.4.1 now','WooCommerce 5.4.1 addresses a checkout issue discovered in WooCommerce 5.4. We recommend upgrading to WooCommerce 5.4.1 as soon as possible.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(10,'wcpay-promo-2020-11','marketing','en_US','wcpay-promo-2020-11','wcpay-promo-2020-11','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(11,'wcpay-promo-2020-12','marketing','en_US','wcpay-promo-2020-12','wcpay-promo-2020-12','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(12,'ppxo-pps-upgrade-paypal-payments-1','info','en_US','Get the latest PayPal extension for WooCommerce','Heads up! There’s a new PayPal on the block!<br /><br />Now is a great time to upgrade to our latest <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension</a> to continue to receive support and updates with PayPal.<br /><br />Get access to a full suite of PayPal payment methods, extensive currency and country coverage, and pay later options with the all-new PayPal extension for WooCommerce.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(13,'ppxo-pps-upgrade-paypal-payments-2','info','en_US','Upgrade your PayPal experience!','Get access to a full suite of PayPal payment methods, extensive currency and country coverage, offer subscription and recurring payments, and the new PayPal pay later options.<br /><br />Start using our <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">latest PayPal today</a> to continue to receive support and updates.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(14,'woocommerce-core-sqli-july-2021-need-to-update','update','en_US','Action required: Critical vulnerabilities in WooCommerce','In response to a critical vulnerability identified on July 13, 2021, we are working with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br />Our investigation into this vulnerability is ongoing, but <strong>we wanted to let you know now about the importance of updating immediately</strong>.<br /><br />For more information on which actions you should take, as well as answers to FAQs, please urgently review our blog post detailing this issue.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(15,'woocommerce-blocks-sqli-july-2021-need-to-update','update','en_US','Action required: Critical vulnerabilities in WooCommerce Blocks','In response to a critical vulnerability identified on July 13, 2021, we are working with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br />Our investigation into this vulnerability is ongoing, but <strong>we wanted to let you know now about the importance of updating immediately</strong>.<br /><br />For more information on which actions you should take, as well as answers to FAQs, please urgently review our blog post detailing this issue.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(16,'woocommerce-core-sqli-july-2021-store-patched','update','en_US','Solved: Critical vulnerabilities patched in WooCommerce','In response to a critical vulnerability identified on July 13, 2021, we worked with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br /><strong>Your store has been updated to the latest secure version(s)</strong>. For more information and answers to FAQs, please review our blog post detailing this issue.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(17,'woocommerce-blocks-sqli-july-2021-store-patched','update','en_US','Solved: Critical vulnerabilities patched in WooCommerce Blocks','In response to a critical vulnerability identified on July 13, 2021, we worked with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br /><strong>Your store has been updated to the latest secure version(s)</strong>. For more information and answers to FAQs, please review our blog post detailing this issue.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(18,'habit-moment-survey','marketing','en_US','We’re all ears! Share your experience so far with WooCommerce','We’d love your input to shape the future of WooCommerce together. Feel free to share any feedback, ideas or suggestions that you have.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(19,'woocommerce-core-paypal-march-2022-updated','update','en_US','Security auto-update of WooCommerce','<strong>Your store has been updated to the latest secure version of WooCommerce</strong>. We worked with WordPress to deploy PayPal Standard security updates for stores running WooCommerce (version 3.5 to 6.3). It’s recommended to disable PayPal Standard, and use <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal Payments</a> to accept PayPal.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(20,'woocommerce-core-paypal-march-2022-updated-nopp','update','en_US','Security auto-update of WooCommerce','<strong>Your store has been updated to the latest secure version of WooCommerce</strong>. We worked with WordPress to deploy security updates related to PayPal Standard payment gateway for stores running WooCommerce (version 3.5 to 6.3).','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(21,'pinterest_03_2022_update','marketing','en_US','Your Pinterest for WooCommerce plugin is out of date!','Update to the latest version of Pinterest for WooCommerce to continue using this plugin and keep your store connected with Pinterest. To update, visit <strong>Plugins &gt; Installed Plugins</strong>, and click on “update now” under Pinterest for WooCommerce.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(22,'store_setup_survey_survey_q2_2022','survey','en_US','How is your store setup going?','Our goal is to make sure you have all the right tools to start setting up your store in the smoothest way possible.\r\nWe’d love to know if we hit our mark and how we can improve. To collect your thoughts, we made a 2-minute survey.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(23,'needs-update-eway-payment-gateway-rin-2022-12-20','update','en_US','Security vulnerability patched in WooCommerce Eway Gateway','In response to a potential vulnerability identified in WooCommerce Eway Gateway versions 3.1.0 to 3.5.0, we’ve worked to deploy security fixes and have released an updated version.\r\nNo external exploits have been detected, but we recommend you update to your latest supported version 3.1.26, 3.2.3, 3.3.1, 3.4.6, or 3.5.1','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(24,'updated-eway-payment-gateway-rin-2022-12-20','update','en_US','WooCommerce Eway Gateway has been automatically updated','Your store is now running the latest secure version of WooCommerce Eway Gateway. We worked with the WordPress Plugins team to deploy a software update to stores running WooCommerce Eway Gateway (versions 3.1.0 to 3.5.0) in response to a security vulnerability that was discovered.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(25,'ecomm-wc-navigation-survey-2023','info','en_US','Navigating WooCommerce on WordPress.com','We are improving the WooCommerce navigation on WordPress.com and would love your help to make it better! Please share your experience with us in this 2-minute survey.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(26,'woopay-beta-merchantrecruitment-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','WooPay, a new express checkout feature built into WooCommerce Payments, is now available —and we’re inviting you to be one of the first to try it. \r\n<br><br>\r\nBoost conversions by offering your customers a simple, secure way to pay with a single click.\r\n<br><br>\r\nGet started in seconds.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(27,'woocommerce-wcpay-march-2023-update-needed','update','en_US','Action required: Security update for WooCommerce Payments','<strong>Your store requires a security update for WooCommerce Payments</strong>. Please update to the latest version of WooCommerce Payments immediately to address a potential vulnerability discovered on March 22. For more information on how to update, visit this WooCommerce Developer Blog Post.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(28,'tap_to_pay_iphone_q2_2023_no_wcpay','marketing','en_US','Accept in-person contactless payments on your iPhone','Tap to Pay on iPhone and WooCommerce Payments is quick, secure, and simple to set up — no extra terminals or card readers are needed. Accept contactless debit and credit cards, Apple Pay, and other NFC digital wallets in person.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(29,'woocommerce-WCPreOrders-april-2023-update-needed','update','en_US','Action required: Security update of WooCommerce Pre-Orders extension','<strong>Your store requires a security update for the WooCommerce Pre-Orders extension</strong>. Please update the WooCommerce Pre-Orders extension immediately to address a potential vulnerability discovered on April 11.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(30,'woopay-beta-merchantrecruitment-update-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','WooPay, a new express checkout feature built into WooCommerce Payments, is now available — and you’re invited to try it. \r\n<br /><br />\r\nBoost conversions by offering your customers a simple, secure way to pay with a single click.\r\n<br /><br />\r\nUpdate WooCommerce Payments to get started.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(31,'woopay-beta-existingmerchants-noaction-27APR23','info','en_US','WooPay is back!','Thanks for previously trying WooPay, the express checkout feature built into WooCommerce Payments. We’re excited to announce that WooPay availability has resumed. No action is required on your part.\r\n<br /><br />\r\nYou can now continue boosting conversions by offering your customers a simple, secure way to pay with a single click.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(32,'woopay-beta-existingmerchants-update-27APR23','info','en_US','WooPay is back!','Thanks for previously trying WooPay, the express checkout feature built into WooCommerce Payments. We’re excited to announce that WooPay availability has resumed.\r\n<br /><br />\r\n\r\nUpdate to the latest WooCommerce Payments version to continue boosting conversions by offering your customers a simple, secure way to pay with a single click.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(33,'woopay-beta-merchantrecruitment-short-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(34,'woopay-beta-merchantrecruitment-short-update-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, our new express checkout feature. <br>Boost conversions by letting customers pay with a single click. <br><br>Update to the latest version of WooCommerce Payments to get started.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(35,'woopay-beta-merchantrecruitment-short-09MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(36,'woopay-beta-merchantrecruitment-short-update-09MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, our new express checkout feature. <br>Boost conversions by letting customers pay with a single click. <br><br>Update to the latest version of WooCommerce Payments to get started.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(37,'woocommerce-WCSubscriptions-June-2023-updated-needed','marketing','en_US','Action required: Security update of WooCommerce Subscriptions','<strong>Your store requires a security update for the WooCommerce Subscriptions plugin</strong>. Please update the WooCommerce Subscriptions plugin immediately to address a potential vulnerability.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(38,'woocommerce-WCReturnsWarranty-June-2023-updated-needed','update','en_US','Action required: Security update of WooCommerce Returns and Warranty Requests extension','<strong>Your store requires a security update for the Returns and Warranty Requests extension</strong>.  Please update to the latest version of the WooCommerce Returns and Warranty Requests extension immediately to address a potential vulnerability discovered on May 31.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(39,'woocommerce-WCOPC-June-2023-updated-needed','update','en_US','Action required: Security update of WooCommerce One Page Checkout','<strong>Your shop requires a security update to address a vulnerability in the WooCommerce One Page Checkout extension</strong>. The fix for this vulnerability was released for this extension on June 13th. Please update immediately.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(40,'woocommerce-WCGC-July-2023-update-needed','update','en_US','Action required: Security update of WooCommerce GoCardless Extension','<strong>Your shop requires a security update to address a vulnerability in the WooCommerce GoCardless extension</strong>. The fix for this vulnerability was released on July 4th. Please update immediately.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(41,'woocommerce-shipping-fedex-api-outage-2023-07-16','warning','en_US','Scheduled FedEx API outage — July 2023','On July 16 there will be a full outage of the FedEx API from 04:00 to 08:00 AM UTC. Due to planned maintenance by FedEx, you\'ll be unable to provide FedEx shipping rates during this time. Follow the link below for more information and recommendations on how to minimize impact.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(42,'wcship-2023-07-hazmat-update-needed','update','en_US','Action required: USPS HAZMAT compliance update for WooCommerce Shipping & Tax extension','<strong>Your store requires an update for the WooCommerce Shipping extension</strong>. Please update to the latest version of the WooCommerce Shipping &amp; Tax extension immediately to ensure compliance with new USPS HAZMAT rules currently in effect.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(43,'woocommerce-WCStripe-Aug-2023-update-needed','update','en_US','Action required: Security update for WooCommerce Stripe plugin','<strong>Your shop requires an important security update for the  WooCommerce Stripe plugin</strong>. The fix for this vulnerability was released on July 31. Please update immediately.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(44,'woocommerce-WCStripe-Aug-2023-security-updated','update','en_US','Security update of WooCommerce Stripe plugin','<strong>Your store has been updated to the latest secure version of the WooCommerce Stripe plugin</strong>. This update was released on July 31.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(45,'woocommerce-WooPayments-Aug-2023-security-updated','update','en_US','Security update of WooPayments (WooCommerce Payments) plugin','<strong>Your store has been updated to the more secure version of WooPayments (WooCommerce Payments)</strong>. This update was released on July 31.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(46,'avalara_q3-2023_noAvaTax','marketing','en_US','Automatically calculate VAT in real time','Take the effort out of determining tax rates and sell confidently across borders with automated tax management from Avalara AvaTax— including built-in VAT calculation when you sell into or across the EU and UK. Save time and stay compliant when you let Avalara do the heavy lifting.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(47,'woocommerce-usermeta-Sept2023-productvendors','update','en_US','Your store requires a security update','<strong>Your shop needs an update to address a vulnerability in WooCommerce.</strong> The fix was released on Sept 15. Please update WooCommerce to the latest version immediately. <a href=\"https://developer.woocommerce.com/2023/09/16/woocommerce-vulnerability-reintroduced-from-7-0-1/\" />Read our developer update</a> for more information.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(48,'woocommerce-STRIPE-Oct-2023-update-needed','update','en_US','Action required: Security update for WooCommerce Stripe Gateway','<strong>Your shop requires a security update to address a vulnerability in the WooCommerce Stripe Gateway</strong>. The fix for this vulnerability was released on October 17. Please update immediately.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(49,'amazon-mcf-reviews-2023-12-07','marketing','en_US','Enjoying Amazon MCF for WooCommerce?','We\'re Never Settle, the developers behind Amazon MCF for WooCommerce, and would be deeply honored to have your review. Reviews help immensely as other users can learn how MCF can solve their needs too! Not happy or need help? Please reach out for support and we’d love to make things right!','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(50,'remove_estimated_deposits_2024','marketing','en_US','Estimated deposits are going away','To provide more accurate deposit information and support the expansion of instant deposits, estimated deposit details will no longer be available in WooPayments. We recommend upgrading to the latest version of WooPayments for more detailed balance status information.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(51,'sirt-woo-2024-11-xss-admin','update','en_US','An important update is required for WooCommerce','This update addresses a security vulnerability that could allow unauthorized access to administrative privileges on your site. <a href=\"https://developer.woocommerce.com/2024/12/03/woocommerce-9-4-3-and-woocommerce-9-3-4-available-now/\">Learn more</a>.\r\n<br><br>\r\n<strong>Please ensure your site is updated to the latest version to stay secure.</strong>','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(52,'paypal-braintree-sdk-depreciation-2025-02-20','update','en_US','Update required for your PayPal Braintree extension','To continue securely accepting payments, you must update your PayPal Braintree extension to version 3.2.4 or newer before June 30, 2025. Your current extension version will not support payment processing after this date due to an SSL certificate update.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(53,'uk-vat-notice-2025-04-30','warning','en_US','UK VAT numbers are no longer supported','Due to recent HM Revenue &amp; Customs (HMRC) VAT API changes, your EU VAT Number for WooCommerce extension can no longer validate UK VAT numbers. HMRC now requires merchants to register an API key, which this extension does not currently support. We recommend EU/UK VAT Validation Manager for WooCommerce as a replacement','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(54,'paypal-braintree-sdk-depreciation-2025-05-30','update','en_US','Action required: Update the PayPal Braintree extension','Your PayPal Braintree extension is using an outdated SDK and will stop processing payments after June 30, 2025, due to a root SSL certificate expiration. To avoid service disruption, update to version 3.2.4 or newer immediately.','{}','pending','woocommerce.com','2026-04-18 11:35:06',NULL,0,'plain','',0,0,'info'),
(55,'wc-stripe-bnpl-promotion-note','marketing','en_US','Offer more ways to pay with Buy Now, Pay Later','Flexible pay-over-time options can boost revenue by up to 14%.* Affirm and Klarna payments are auto-enabled with Stripe for eligible merchants.<br /><br />*Source: Stripe 2024','{}','unactioned','woocommerce-gateway-stripe','2026-04-19 13:15:54',NULL,0,'plain','',0,0,'info'),
(56,'wc-stripe-oc-promotion-note','marketing','en_US','Increase conversions with Stripe\'s Optimized Checkout Suite','Optimize your checkout for more sales by automatically displaying the most relevant payment methods for each customer.','{}','unactioned','woocommerce-gateway-stripe','2026-04-19 13:15:54',NULL,0,'plain','',0,0,'info'),
(57,'ppcp-recaptcha-protection-note12','info','en_US','Fraud protection is now required — enable today','Card networks like Visa, Mastercard and American Express now require fraud prevention controls, and non-compliance may result in fines and processing restrictions. Please enable reCAPTCHA in your PayPal Payments settings to help protect your store and maintain compliance.','{}','unactioned','woocommerce-paypal-payments','2026-04-19 13:15:54',NULL,0,'plain','',0,0,'info'),
(58,'wc-admin-customizing-product-catalog','info','en_US','How to customize your product catalog','You want your product catalog and images to look great and align with your brand. This guide will give you all the tips you need to get your products looking great in your store.','{}','unactioned','woocommerce-admin','2026-04-20 12:00:18',NULL,0,'plain','',0,0,'info'),
(59,'wc-admin-mobile-app','info','en_US','Install Woo mobile app','Install the WooCommerce mobile app to manage orders, receive sales notifications, and view key metrics — wherever you are.','{}','unactioned','woocommerce-admin','2026-04-20 12:00:18',NULL,0,'plain','',0,0,'info'),
(60,'usps-surcharge-apr2026','marketing','en_US','Heads up: USPS rates increasing 8% on April 26','USPS is adding a temporary 8% surcharge on Priority Mail, Priority Mail Express, Ground Advantage, and Parcel Select from April 26, 2026 through January 17, 2027. WooCommerce Shipping discounted rates still apply.','{}','pending','woocommerce.com','2026-04-22 13:10:03',NULL,0,'plain','',0,0,'info'),
(61,'stripe-woo-gateway-update-april2026','update','en_US','A critical update is required for Stripe for WooCommerce','<strong>A critical update is required for Stripe for WooCommerce</strong> that addresses possible payment issues. Please update the WooCommerce Stripe Gateway to v10.6.1 immediately.','{}','pending','woocommerce.com','2026-04-24 10:32:42',NULL,0,'plain','',0,0,'info');
/*!40000 ALTER TABLE `wp_wc_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_category_lookup`
--

DROP TABLE IF EXISTS `wp_wc_category_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_category_lookup`
--

LOCK TABLES `wp_wc_category_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_category_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_category_lookup` VALUES
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20);
/*!40000 ALTER TABLE `wp_wc_category_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_customer_lookup`
--

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_customer_lookup`
--

LOCK TABLES `wp_wc_customer_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_customer_lookup` VALUES
(1,2,'hemanshu.panchal86','','','hemanshu.panchal86@gmail.com','2026-04-19 04:27:13','2026-04-19 03:15:56','','','',''),
(2,NULL,'','','','','2026-04-19 01:58:47',NULL,'AU','','','VIC'),
(3,3,'shakuntala.panchal','Shakuntala','Panchal','savenest.au@gmail.com','2026-04-22 17:06:09','2026-04-20 02:11:38','AU','2145','Girraween','NSW');
/*!40000 ALTER TABLE `wp_wc_customer_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_download_log`
--

DROP TABLE IF EXISTS `wp_wc_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_download_log`
--

LOCK TABLES `wp_wc_download_log` WRITE;
/*!40000 ALTER TABLE `wp_wc_download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_download_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_addresses`
--

DROP TABLE IF EXISTS `wp_wc_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `address_type` varchar(20) DEFAULT NULL,
  `first_name` text DEFAULT NULL,
  `last_name` text DEFAULT NULL,
  `company` text DEFAULT NULL,
  `address_1` text DEFAULT NULL,
  `address_2` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `postcode` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_type_order_id` (`address_type`,`order_id`),
  KEY `order_id` (`order_id`),
  KEY `email` (`email`(191)),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_addresses`
--

LOCK TABLES `wp_wc_order_addresses` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_addresses` DISABLE KEYS */;
INSERT INTO `wp_wc_order_addresses` VALUES
(1,53,'billing',NULL,NULL,NULL,NULL,NULL,NULL,'VIC',NULL,'AU',NULL,NULL),
(2,53,'shipping',NULL,NULL,NULL,NULL,NULL,NULL,'VIC',NULL,'AU',NULL,NULL),
(3,66,'billing','Shakuntala','Panchal',NULL,'Unit 8','5-7 Bando Road','Girraween','NSW','2145','AU','savenest.au@gmail.com','+61434945317'),
(4,66,'shipping','Shakuntala','Panchal',NULL,'Unit 8','5-7 Bando Road','Girraween','NSW','2145','AU',NULL,'+61434945317'),
(5,75,'billing',NULL,NULL,NULL,NULL,NULL,NULL,'VIC',NULL,'AU',NULL,NULL),
(6,75,'shipping',NULL,NULL,NULL,NULL,NULL,NULL,'VIC',NULL,'AU',NULL,NULL);
/*!40000 ALTER TABLE `wp_wc_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_coupon_lookup`
--

LOCK TABLES `wp_wc_order_coupon_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_operational_data`
--

DROP TABLE IF EXISTS `wp_wc_order_operational_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_operational_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `created_via` varchar(100) DEFAULT NULL,
  `woocommerce_version` varchar(20) DEFAULT NULL,
  `prices_include_tax` tinyint(1) DEFAULT NULL,
  `coupon_usages_are_counted` tinyint(1) DEFAULT NULL,
  `download_permission_granted` tinyint(1) DEFAULT NULL,
  `cart_hash` varchar(100) DEFAULT NULL,
  `new_order_email_sent` tinyint(1) DEFAULT NULL,
  `order_key` varchar(100) DEFAULT NULL,
  `order_stock_reduced` tinyint(1) DEFAULT NULL,
  `date_paid_gmt` datetime DEFAULT NULL,
  `date_completed_gmt` datetime DEFAULT NULL,
  `shipping_tax_amount` decimal(26,8) DEFAULT NULL,
  `shipping_total_amount` decimal(26,8) DEFAULT NULL,
  `discount_tax_amount` decimal(26,8) DEFAULT NULL,
  `discount_total_amount` decimal(26,8) DEFAULT NULL,
  `recorded_sales` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `order_key` (`order_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_operational_data`
--

LOCK TABLES `wp_wc_order_operational_data` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_operational_data` DISABLE KEYS */;
INSERT INTO `wp_wc_order_operational_data` VALUES
(1,53,'store-api','10.7.0',0,0,0,'74343dec964b4711a34c4d952fd6548e',0,'wc_order_GCgVqzidTiyv1',0,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0),
(4,66,'store-api','10.7.0',0,0,0,'17c8a6e36fd45a43e2593dd0d91c58cb',0,'wc_order_erGjhfeiddAQM',0,NULL,NULL,0.90000000,8.95000000,0.00000000,0.00000000,0),
(11,75,'store-api','10.7.0',0,0,0,'3427d06654b8a4a8d25d848b72bcb1c2',0,'wc_order_OiQl5jyPZejaf',0,NULL,NULL,0.90000000,8.95000000,0.00000000,0.00000000,0);
/*!40000 ALTER TABLE `wp_wc_order_operational_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_product_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_item_id`,`order_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_product_date` (`customer_id`,`product_id`,`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_product_lookup`
--

LOCK TABLES `wp_wc_order_product_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_order_product_lookup` VALUES
(4,53,42,0,2,'2026-04-19 21:58:47',1,17.95,19.75,0,1.8,0,0),
(5,53,45,0,2,'2026-04-19 21:58:47',2,31.9,35.09,0,3.19,0,0),
(9,66,61,0,3,'2026-04-20 22:05:10',1,25,37.345,0,2.5,8.95,0.895);
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_stats`
--

DROP TABLE IF EXISTS `wp_wc_order_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_paid` datetime DEFAULT '0000-00-00 00:00:00',
  `date_completed` datetime DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`),
  KEY `idx_date_paid_status_parent` (`date_paid`,`status`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_stats`
--

LOCK TABLES `wp_wc_order_stats` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_stats` DISABLE KEYS */;
INSERT INTO `wp_wc_order_stats` VALUES
(53,0,'2026-04-19 21:58:47','2026-04-19 11:58:47',NULL,NULL,3,54.84,4.99,0,49.85,0,'wc-checkout-draft',2),
(66,0,'2026-04-20 22:05:10','2026-04-20 12:05:10',NULL,NULL,1,37.35,3.4,8.95,25,0,'wc-failed',3);
/*!40000 ALTER TABLE `wp_wc_order_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_tax_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_tax_lookup`
--

LOCK TABLES `wp_wc_order_tax_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_order_tax_lookup` VALUES
(53,1,'2026-04-19 21:58:47',0,4.99,4.99),
(66,1,'2026-04-20 22:05:10',0.9,2.5,3.4);
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_orders`
--

DROP TABLE IF EXISTS `wp_wc_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_orders` (
  `id` bigint(20) unsigned NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `tax_amount` decimal(26,8) DEFAULT NULL,
  `total_amount` decimal(26,8) DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `billing_email` varchar(320) DEFAULT NULL,
  `date_created_gmt` datetime DEFAULT NULL,
  `date_updated_gmt` datetime DEFAULT NULL,
  `parent_order_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_method_title` text DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `customer_note` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `date_created` (`date_created_gmt`),
  KEY `customer_id_billing_email` (`customer_id`,`billing_email`(171)),
  KEY `customer_id_status` (`customer_id`,`status`),
  KEY `billing_email` (`billing_email`(191)),
  KEY `type_status_date` (`type`,`status`,`date_created_gmt`),
  KEY `parent_order_id` (`parent_order_id`),
  KEY `date_updated` (`date_updated_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_orders`
--

LOCK TABLES `wp_wc_orders` WRITE;
/*!40000 ALTER TABLE `wp_wc_orders` DISABLE KEYS */;
INSERT INTO `wp_wc_orders` VALUES
(53,'wc-checkout-draft','AUD','shop_order',4.99000000,54.84000000,0,NULL,'2026-04-19 11:58:47','2026-04-19 13:05:55',0,'stripe','','','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0',''),
(66,'wc-failed','AUD','shop_order',2.50000000,37.35000000,3,'savenest.au@gmail.com','2026-04-20 12:05:10','2026-04-20 12:28:12',0,'stripe_klarna','Klarna','','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0',''),
(75,'wc-checkout-draft','AUD','shop_order',2.09000000,32.80000000,0,NULL,'2026-04-25 02:11:51','2026-04-25 02:12:00',0,'stripe','','','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0','');
/*!40000 ALTER TABLE `wp_wc_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_orders_meta`
--

DROP TABLE IF EXISTS `wp_wc_orders_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_orders_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_key_value` (`meta_key`(100),`meta_value`(82)),
  KEY `order_id_meta_key_meta_value` (`order_id`,`meta_key`(100),`meta_value`(82))
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_orders_meta`
--

LOCK TABLES `wp_wc_orders_meta` WRITE;
/*!40000 ALTER TABLE `wp_wc_orders_meta` DISABLE KEYS */;
INSERT INTO `wp_wc_orders_meta` VALUES
(1,53,'_shipping_hash','01abc8521da6596273175c46c9b6fe70'),
(2,53,'_coupons_hash','d751713988987e9331980363e24189ce'),
(3,53,'_fees_hash','d751713988987e9331980363e24189ce'),
(4,53,'_taxes_hash','916e211cc28bd61e74eadf3e5fac854b'),
(5,53,'is_vat_exempt','no'),
(6,53,'_billing_address_index','      VIC  AU  '),
(7,53,'_shipping_address_index','      VIC  AU '),
(8,66,'_shipping_hash','5cdb25eca648d1aa3d0bd322a74d5419'),
(9,66,'_coupons_hash','d751713988987e9331980363e24189ce'),
(10,66,'_fees_hash','d751713988987e9331980363e24189ce'),
(11,66,'_taxes_hash','84d14e335f192dfb9de722fc1e03b217'),
(12,66,'is_vat_exempt','no'),
(13,66,'_billing_address_index','Shakuntala Panchal  Unit 8 5-7 Bando Road Girraween NSW 2145 AU savenest.au@gmail.com +61434945317'),
(14,66,'_shipping_address_index','Shakuntala Panchal  Unit 8 5-7 Bando Road Girraween NSW 2145 AU +61434945317'),
(18,66,'_wc_order_attribution_source_type','typein'),
(19,66,'_wc_order_attribution_utm_source','(direct)'),
(20,66,'_wc_order_attribution_session_entry','https://furlio.au/'),
(21,66,'_wc_order_attribution_session_start_time','2026-04-19 05:53:52'),
(22,66,'_wc_order_attribution_session_pages','16'),
(23,66,'_wc_order_attribution_session_count','8'),
(24,66,'_wc_order_attribution_user_agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0'),
(25,66,'_wc_order_attribution_device_type','Desktop'),
(37,66,'_stripe_source_id','pm_1TOGfvA3dqys8x5WgaW0He7N'),
(38,66,'_stripe_customer_id','cus_UN0hOUKAsFri5T'),
(39,66,'_stripe_upe_payment_type','klarna'),
(40,66,'_stripe_intent_id','pi_3TOGfxA3dqys8x5W1ZRda71L'),
(41,66,'_stripe_payment_awaiting_action','yes'),
(42,66,'_stripe_upe_waiting_for_redirect','1'),
(46,75,'_shipping_hash','bbebed96a1751f394bc9f2f3042ab401'),
(47,75,'_coupons_hash','d751713988987e9331980363e24189ce'),
(48,75,'_fees_hash','d751713988987e9331980363e24189ce'),
(49,75,'_taxes_hash','3f1444327d1e15b2238a340ce0f33af0'),
(50,75,'is_vat_exempt','no'),
(51,75,'_billing_address_index','      VIC  AU  '),
(52,75,'_shipping_address_index','      VIC  AU ');
/*!40000 ALTER TABLE `wp_wc_orders_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_attributes_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_attributes_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_attributes_lookup` (
  `product_id` bigint(20) NOT NULL,
  `product_or_parent_id` bigint(20) NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  `is_variation_attribute` tinyint(1) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_or_parent_id`,`term_id`,`product_id`,`taxonomy`),
  KEY `is_variation_attribute_term_id` (`is_variation_attribute`,`term_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_attributes_lookup`
--

LOCK TABLES `wp_wc_product_attributes_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_attributes_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_product_attributes_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_download_directories`
--

DROP TABLE IF EXISTS `wp_wc_product_download_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_download_directories` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(256) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`url_id`),
  KEY `url` (`url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_download_directories`
--

LOCK TABLES `wp_wc_product_download_directories` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_download_directories` DISABLE KEYS */;
INSERT INTO `wp_wc_product_download_directories` VALUES
(1,'file:///var/www/html/pet/wp-content/uploads/woocommerce_uploads/',1),
(2,'https://furlio.au/wp-content/uploads/woocommerce_uploads/',1);
/*!40000 ALTER TABLE `wp_wc_product_download_directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_meta_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) DEFAULT '',
  `global_unique_id` varchar(100) DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) DEFAULT 'taxable',
  `tax_class` varchar(100) DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`),
  KEY `sku` (`sku`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_meta_lookup`
--

LOCK TABLES `wp_wc_product_meta_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_product_meta_lookup` VALUES
(41,'APC-DOG-BED-OMF-001','',0,0,71.4500,71.4500,0,NULL,'instock',0,0.00,0,'taxable',''),
(42,'APC-CAT-TOY-FWD-002','',0,0,19.7500,19.7500,0,NULL,'instock',0,0.00,0,'taxable',''),
(43,'APC-DOG-BWL-SSF-003','',0,0,29.6500,29.6500,0,NULL,'instock',0,0.00,0,'taxable',''),
(44,'APC-GRM-BRS-SCL-004','',0,0,27.4500,27.4500,0,NULL,'instock',0,0.00,0,'taxable',''),
(45,'APC-BRD-SWG-BDG-005','',0,0,17.5500,17.5500,0,NULL,'instock',0,0.00,0,'taxable',''),
(46,'APC-SML-TUN-GPH-006','',0,0,31.8500,31.8500,0,NULL,'instock',0,0.00,0,'taxable',''),
(61,'','',0,0,27.5000,27.5000,0,NULL,'instock',0,0.00,0,'taxable',''),
(64,'','',0,0,20.8600,20.8600,0,NULL,'instock',0,0.00,0,'taxable','');
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_rate_limits`
--

DROP TABLE IF EXISTS `wp_wc_rate_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_rate_limits` (
  `rate_limit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rate_limit_key` varchar(200) NOT NULL,
  `rate_limit_expiry` bigint(20) unsigned NOT NULL,
  `rate_limit_remaining` smallint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rate_limit_id`),
  UNIQUE KEY `rate_limit_key` (`rate_limit_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_rate_limits`
--

LOCK TABLES `wp_wc_rate_limits` WRITE;
/*!40000 ALTER TABLE `wp_wc_rate_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_rate_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_reserved_stock`
--

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_reserved_stock`
--

LOCK TABLES `wp_wc_reserved_stock` WRITE;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_tax_rate_classes`
--

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_tax_rate_classes`
--

LOCK TABLES `wp_wc_tax_rate_classes` WRITE;
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` DISABLE KEYS */;
INSERT INTO `wp_wc_tax_rate_classes` VALUES
(1,'Reduced rate','reduced-rate'),
(2,'Zero rate','zero-rate'),
(3,'Standard Rate','standard-rate');
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_webhooks`
--

DROP TABLE IF EXISTS `wp_wc_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `name` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text NOT NULL,
  `secret` text NOT NULL,
  `topic` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_webhooks`
--

LOCK TABLES `wp_wc_webhooks` WRITE;
/*!40000 ALTER TABLE `wp_wc_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `permissions` varchar(10) NOT NULL,
  `consumer_key` char(64) NOT NULL,
  `consumer_secret` char(43) NOT NULL,
  `nonces` longtext DEFAULT NULL,
  `truncated_key` char(7) NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

LOCK TABLES `wp_woocommerce_api_keys` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_api_keys` VALUES
(4,1,'Dropship Bot','read_write','6957631a1eb52115ad2a321f6f03878d81876b2342de98bb69e687fbb972f6a6','cs_b58df0efbd2eea66e52e936e03ea36a38f505a25',NULL,'d9a39ca',NULL);
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` varchar(200) DEFAULT NULL,
  `attribute_type` varchar(20) NOT NULL,
  `attribute_orderby` varchar(20) NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

LOCK TABLES `wp_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`),
  KEY `idx_user_email` (`user_email`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_downloadable_product_permissions`
--

LOCK TABLES `wp_woocommerce_downloadable_product_permissions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_log`
--

DROP TABLE IF EXISTS `wp_woocommerce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `context` longtext DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_log`
--

LOCK TABLES `wp_woocommerce_log` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

LOCK TABLES `wp_woocommerce_order_itemmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_order_itemmeta` VALUES
(16,3,'rate_id','1'),
(17,3,'label','GST'),
(18,3,'compound',''),
(19,3,'tax_amount','4.99'),
(20,3,'shipping_tax_amount','0'),
(21,3,'rate_percent','10'),
(22,4,'_product_id','42'),
(23,4,'_variation_id','0'),
(24,4,'_qty','1'),
(25,4,'_tax_class',''),
(26,4,'_line_subtotal','17.95'),
(27,4,'_line_subtotal_tax','1.8'),
(28,4,'_line_total','17.95'),
(29,4,'_line_tax','1.8'),
(30,4,'_line_tax_data','a:2:{s:5:\"total\";a:1:{i:1;s:5:\"1.795\";}s:8:\"subtotal\";a:1:{i:1;s:5:\"1.795\";}}'),
(31,5,'_product_id','45'),
(32,5,'_variation_id','0'),
(33,5,'_qty','2'),
(34,5,'_tax_class',''),
(35,5,'_line_subtotal','31.9'),
(36,5,'_line_subtotal_tax','3.19'),
(37,5,'_line_total','31.9'),
(38,5,'_line_tax','3.19'),
(39,5,'_line_tax_data','a:2:{s:5:\"total\";a:1:{i:1;s:4:\"3.19\";}s:8:\"subtotal\";a:1:{i:1;s:4:\"3.19\";}}'),
(55,8,'rate_id','1'),
(56,8,'label','GST'),
(57,8,'compound',''),
(58,8,'tax_amount','2.5'),
(59,8,'shipping_tax_amount','0.9'),
(60,8,'rate_percent','10'),
(61,9,'_product_id','61'),
(62,9,'_variation_id','0'),
(63,9,'_qty','1'),
(64,9,'_tax_class',''),
(65,9,'_line_subtotal','25'),
(66,9,'_line_subtotal_tax','2.5'),
(67,9,'_line_total','25'),
(68,9,'_line_tax','2.5'),
(69,9,'_line_tax_data','a:2:{s:5:\"total\";a:1:{i:1;s:3:\"2.5\";}s:8:\"subtotal\";a:1:{i:1;s:3:\"2.5\";}}'),
(76,11,'method_id','flat_rate'),
(77,11,'instance_id','1'),
(78,11,'cost','8.95'),
(79,11,'total_tax','0.9'),
(80,11,'taxes','a:1:{s:5:\"total\";a:1:{i:1;s:5:\"0.895\";}}'),
(81,11,'Items','POOWEE! Lavender Cat Litter 15kg – Clumping &amp; Odour Control &times; 1'),
(103,15,'rate_id','1'),
(104,15,'label','GST'),
(105,15,'compound',''),
(106,15,'tax_amount','2.09'),
(107,15,'shipping_tax_amount','0.9'),
(108,15,'rate_percent','10'),
(109,16,'_product_id','64'),
(110,16,'_variation_id','0'),
(111,16,'_qty','1'),
(112,16,'_tax_class',''),
(113,16,'_line_subtotal','20.86'),
(114,16,'_line_subtotal_tax','2.09'),
(115,16,'_line_total','20.86'),
(116,16,'_line_tax','2.09'),
(117,16,'_line_tax_data','a:2:{s:5:\"total\";a:1:{i:1;s:5:\"2.086\";}s:8:\"subtotal\";a:1:{i:1;s:5:\"2.086\";}}'),
(118,17,'method_id','flat_rate'),
(119,17,'instance_id','1'),
(120,17,'cost','8.95'),
(121,17,'total_tax','0.9'),
(122,17,'taxes','a:1:{s:5:\"total\";a:1:{i:1;s:5:\"0.895\";}}'),
(123,17,'Items','Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU &times; 1');
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_items`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

LOCK TABLES `wp_woocommerce_order_items` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_order_items` VALUES
(3,'AU-GST-1','tax',53),
(4,'Interactive Feather Wand Cat Toy – Cat Toys Australia','line_item',53),
(5,'Hanging Budgie Bird Swing Perch – Bird &amp; Aquatic Supplies','line_item',53),
(8,'AU-GST-1','tax',66),
(9,'POOWEE! Lavender Cat Litter 15kg – Clumping &amp; Odour Control','line_item',66),
(11,'Standard Shipping','shipping',66),
(15,'AU-GST-1','tax',75),
(16,'Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU','line_item',75),
(17,'Standard Shipping','shipping',75);
/*!40000 ALTER TABLE `wp_woocommerce_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokenmeta`
--

LOCK TABLES `wp_woocommerce_payment_tokenmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) NOT NULL,
  `token` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(200) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokens`
--

LOCK TABLES `wp_woocommerce_payment_tokens` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_sessions`
--

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`),
  KEY `session_expiry` (`session_expiry`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

LOCK TABLES `wp_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_sessions` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_sessions` VALUES
(1,'1','a:1:{s:8:\"customer\";s:766:\"a:28:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:21:\"dsightstech@gmail.com\";s:7:\"address\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:4:\"city\";s:0:\"\";s:5:\"state\";s:3:\"VIC\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:2:\"AU\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:14:\"shipping_state\";s:3:\"VIC\";s:17:\"shipping_postcode\";s:0:\"\";s:16:\"shipping_country\";s:2:\"AU\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";}',1777116785),
(37,'3','a:10:{s:22:\"shipping_for_package_0\";s:996:\"a:2:{s:12:\"package_hash\";s:40:\"wc_ship_466b0eb47aecc7d136416107b5970358\";s:5:\"rates\";a:2:{s:11:\"flat_rate:1\";O:16:\"WC_Shipping_Rate\":2:{s:7:\"\0*\0data\";a:9:{s:2:\"id\";s:11:\"flat_rate:1\";s:9:\"method_id\";s:9:\"flat_rate\";s:11:\"instance_id\";i:1;s:5:\"label\";s:17:\"Standard Shipping\";s:4:\"cost\";s:4:\"8.95\";s:5:\"taxes\";a:1:{i:1;d:0.895;}s:10:\"tax_status\";s:7:\"taxable\";s:11:\"description\";s:0:\"\";s:13:\"delivery_time\";s:0:\"\";}s:12:\"\0*\0meta_data\";a:1:{s:5:\"Items\";s:75:\"POOWEE! Lavender Cat Litter 15kg – Clumping &amp; Odour Control &times; 3\";}}s:15:\"free_shipping:2\";O:16:\"WC_Shipping_Rate\":2:{s:7:\"\0*\0data\";a:9:{s:2:\"id\";s:15:\"free_shipping:2\";s:9:\"method_id\";s:13:\"free_shipping\";s:11:\"instance_id\";i:2;s:5:\"label\";s:31:\"Free Shipping (orders over $75)\";s:4:\"cost\";s:1:\"0\";s:5:\"taxes\";a:0:{}s:10:\"tax_status\";s:7:\"taxable\";s:11:\"description\";s:0:\"\";s:13:\"delivery_time\";s:0:\"\";}s:12:\"\0*\0meta_data\";a:1:{s:5:\"Items\";s:75:\"POOWEE! Lavender Cat Litter 15kg – Clumping &amp; Odour Control &times; 3\";}}}}\";s:25:\"previous_shipping_methods\";s:66:\"a:1:{i:0;a:2:{i:0;s:11:\"flat_rate:1\";i:1;s:15:\"free_shipping:2\";}}\";s:23:\"chosen_shipping_methods\";s:29:\"a:1:{i:0;s:11:\"flat_rate:1\";}\";s:22:\"shipping_method_counts\";s:14:\"a:1:{i:0;i:2;}\";s:9:\"ppcp_fees\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:424:\"a:15:{s:8:\"subtotal\";s:2:\"75\";s:12:\"subtotal_tax\";d:7.5;s:14:\"shipping_total\";s:4:\"8.95\";s:12:\"shipping_tax\";d:0.9;s:14:\"shipping_taxes\";a:1:{i:1;d:0.9;}s:14:\"discount_total\";d:0;s:12:\"discount_tax\";d:0;s:19:\"cart_contents_total\";s:2:\"75\";s:17:\"cart_contents_tax\";d:7.5;s:19:\"cart_contents_taxes\";a:1:{i:1;d:7.5;}s:9:\"fee_total\";s:1:\"0\";s:7:\"fee_tax\";d:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:5:\"92.35\";s:9:\"total_tax\";d:8.4;}\";s:4:\"cart\";s:434:\"a:1:{s:32:\"7f39f8317fbdb1988ef4c628eba02591\";a:11:{s:3:\"key\";s:32:\"7f39f8317fbdb1988ef4c628eba02591\";s:10:\"product_id\";i:61;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:3;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:1:{i:1;d:7.5;}s:5:\"total\";a:1:{i:1;d:7.5;}}s:13:\"line_subtotal\";d:75;s:17:\"line_subtotal_tax\";d:7.5;s:10:\"line_total\";d:75;s:8:\"line_tax\";d:7.5;}}\";s:21:\"store_api_draft_order\";i:66;s:21:\"chosen_payment_method\";s:13:\"stripe_klarna\";s:8:\"customer\";s:934:\"a:28:{s:2:\"id\";s:1:\"3\";s:13:\"date_modified\";s:25:\"2026-04-20T22:11:38+10:00\";s:10:\"first_name\";s:10:\"Shakuntala\";s:9:\"last_name\";s:7:\"Panchal\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:12:\"+61434945317\";s:5:\"email\";s:21:\"savenest.au@gmail.com\";s:7:\"address\";s:6:\"Unit 8\";s:9:\"address_1\";s:6:\"Unit 8\";s:9:\"address_2\";s:14:\"5-7 Bando Road\";s:4:\"city\";s:9:\"Girraween\";s:5:\"state\";s:3:\"NSW\";s:8:\"postcode\";s:4:\"2145\";s:7:\"country\";s:2:\"AU\";s:19:\"shipping_first_name\";s:10:\"Shakuntala\";s:18:\"shipping_last_name\";s:7:\"Panchal\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:12:\"+61434945317\";s:16:\"shipping_address\";s:6:\"Unit 8\";s:18:\"shipping_address_1\";s:6:\"Unit 8\";s:18:\"shipping_address_2\";s:14:\"5-7 Bando Road\";s:13:\"shipping_city\";s:9:\"Girraween\";s:14:\"shipping_state\";s:3:\"NSW\";s:17:\"shipping_postcode\";s:4:\"2145\";s:16:\"shipping_country\";s:2:\"AU\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";}',1777517680),
(46,'t_47a32cd45d90d71f4ca046bdbf71ea','a:1:{s:8:\"customer\";s:744:\"a:28:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:4:\"city\";s:0:\"\";s:5:\"state\";s:3:\"VIC\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:2:\"AU\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:14:\"shipping_state\";s:3:\"VIC\";s:17:\"shipping_postcode\";s:0:\"\";s:16:\"shipping_country\";s:2:\"AU\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";}',1777211582),
(47,'t_808e1034c99d6993e61153b6ca6288','a:1:{s:8:\"customer\";s:744:\"a:28:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:4:\"city\";s:0:\"\";s:5:\"state\";s:3:\"VIC\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:2:\"AU\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:14:\"shipping_state\";s:3:\"VIC\";s:17:\"shipping_postcode\";s:0:\"\";s:16:\"shipping_country\";s:2:\"AU\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";}',1777252969),
(48,'t_bb28c2d48722679220e986ed69488a','a:1:{s:8:\"customer\";s:744:\"a:28:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:4:\"city\";s:0:\"\";s:5:\"state\";s:3:\"VIC\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:2:\"AU\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:14:\"shipping_state\";s:3:\"VIC\";s:17:\"shipping_postcode\";s:0:\"\";s:16:\"shipping_country\";s:2:\"AU\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";}',1777253067),
(49,'t_5ab6d072f9d86840f4515ebc251874','a:8:{s:22:\"shipping_for_package_0\";s:538:\"a:2:{s:12:\"package_hash\";s:40:\"wc_ship_7bf37e88e14c8eff6a47f27b0e37152c\";s:5:\"rates\";a:1:{s:11:\"flat_rate:1\";O:16:\"WC_Shipping_Rate\":2:{s:7:\"\0*\0data\";a:9:{s:2:\"id\";s:11:\"flat_rate:1\";s:9:\"method_id\";s:9:\"flat_rate\";s:11:\"instance_id\";i:1;s:5:\"label\";s:17:\"Standard Shipping\";s:4:\"cost\";s:4:\"8.95\";s:5:\"taxes\";a:1:{i:1;d:0.895;}s:10:\"tax_status\";s:7:\"taxable\";s:11:\"description\";s:0:\"\";s:13:\"delivery_time\";s:0:\"\";}s:12:\"\0*\0meta_data\";a:1:{s:5:\"Items\";s:75:\"Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU &times; 1\";}}}}\";s:25:\"previous_shipping_methods\";s:39:\"a:1:{i:0;a:1:{i:0;s:11:\"flat_rate:1\";}}\";s:23:\"chosen_shipping_methods\";s:29:\"a:1:{i:0;s:11:\"flat_rate:1\";}\";s:22:\"shipping_method_counts\";s:14:\"a:1:{i:0;i:1;}\";s:9:\"ppcp_fees\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:434:\"a:15:{s:8:\"subtotal\";s:5:\"20.86\";s:12:\"subtotal_tax\";d:2.09;s:14:\"shipping_total\";s:4:\"8.95\";s:12:\"shipping_tax\";d:0.9;s:14:\"shipping_taxes\";a:1:{i:1;d:0.9;}s:14:\"discount_total\";d:0;s:12:\"discount_tax\";d:0;s:19:\"cart_contents_total\";s:5:\"20.86\";s:17:\"cart_contents_tax\";d:2.09;s:19:\"cart_contents_taxes\";a:1:{i:1;d:2.09;}s:9:\"fee_total\";s:1:\"0\";s:7:\"fee_tax\";d:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:5:\"32.80\";s:9:\"total_tax\";d:2.99;}\";s:4:\"cart\";s:446:\"a:1:{s:32:\"ea5d2f1c4608232e07d3aa3d998e5135\";a:11:{s:3:\"key\";s:32:\"ea5d2f1c4608232e07d3aa3d998e5135\";s:10:\"product_id\";i:64;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:1:{i:1;d:2.086;}s:5:\"total\";a:1:{i:1;d:2.086;}}s:13:\"line_subtotal\";d:20.86;s:17:\"line_subtotal_tax\";d:2.09;s:10:\"line_total\";d:20.86;s:8:\"line_tax\";d:2.09;}}\";s:21:\"store_api_draft_order\";i:75;}',1777255894);
/*!40000 ALTER TABLE `wp_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `zone_id` (`zone_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_locations`
--

LOCK TABLES `wp_woocommerce_shipping_zone_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zone_locations` VALUES
(1,2,'AU','country');
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`instance_id`),
  KEY `zone_id` (`zone_id`),
  KEY `method_id` (`method_id`(20))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_methods`
--

LOCK TABLES `wp_woocommerce_shipping_zone_methods` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zone_methods` VALUES
(2,1,'flat_rate',1,1),
(2,2,'free_shipping',2,1);
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `zone_order_id` (`zone_order`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zones`
--

LOCK TABLES `wp_woocommerce_shipping_zones` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zones` VALUES
(2,'Australia',1);
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rate_locations`
--

LOCK TABLES `wp_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(8) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rates`
--

LOCK TABLES `wp_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_tax_rates` VALUES
(1,'AU','','10.0000','GST',1,0,1,0,'');
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_indexable`
--

DROP TABLE IF EXISTS `wp_yoast_indexable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_indexable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` longtext DEFAULT NULL,
  `permalink_hash` varchar(40) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type` varchar(32) NOT NULL,
  `object_sub_type` varchar(32) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `post_parent` bigint(20) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `breadcrumb_title` text DEFAULT NULL,
  `post_status` varchar(20) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT 0,
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) unsigned DEFAULT NULL,
  `canonical` longtext DEFAULT NULL,
  `primary_focus_keyword` varchar(191) DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT 0,
  `is_robots_noindex` tinyint(1) DEFAULT 0,
  `is_robots_nofollow` tinyint(1) DEFAULT 0,
  `is_robots_noarchive` tinyint(1) DEFAULT 0,
  `is_robots_noimageindex` tinyint(1) DEFAULT 0,
  `is_robots_nosnippet` tinyint(1) DEFAULT 0,
  `twitter_title` text DEFAULT NULL,
  `twitter_image` longtext DEFAULT NULL,
  `twitter_description` longtext DEFAULT NULL,
  `twitter_image_id` varchar(191) DEFAULT NULL,
  `twitter_image_source` text DEFAULT NULL,
  `open_graph_title` text DEFAULT NULL,
  `open_graph_description` longtext DEFAULT NULL,
  `open_graph_image` longtext DEFAULT NULL,
  `open_graph_image_id` varchar(191) DEFAULT NULL,
  `open_graph_image_source` text DEFAULT NULL,
  `open_graph_image_meta` mediumtext DEFAULT NULL,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  `schema_page_type` varchar(64) DEFAULT NULL,
  `schema_article_type` varchar(64) DEFAULT NULL,
  `has_ancestors` tinyint(1) DEFAULT 0,
  `estimated_reading_time_minutes` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT 1,
  `object_last_modified` datetime DEFAULT NULL,
  `object_published_at` datetime DEFAULT NULL,
  `inclusive_language_score` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  KEY `object_id_and_type` (`object_id`,`object_type`),
  KEY `permalink_hash_and_object_type` (`permalink_hash`,`object_type`),
  KEY `subpages` (`post_parent`,`object_type`,`post_status`,`object_id`),
  KEY `prominent_words` (`prominent_words_version`,`object_type`,`object_sub_type`,`post_status`),
  KEY `published_sitemap_index` (`object_published_at`,`is_robots_noindex`,`object_type`,`object_sub_type`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_indexable`
--

LOCK TABLES `wp_yoast_indexable` WRITE;
/*!40000 ALTER TABLE `wp_yoast_indexable` DISABLE KEYS */;
INSERT INTO `wp_yoast_indexable` VALUES
(1,'https://furlio.au/product-category/dog-accessories/','54:99a9370d439abfb6ee351213cdf49158',16,'term','product_cat',NULL,NULL,NULL,NULL,'Dog Accessories',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,NULL,'2026-04-18 11:33:08','2026-04-19 01:58:25',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:59','2026-04-19 11:02:09',NULL),
(2,'https://furlio.au/product-category/cat-supplies/','51:85f045c45d60085f79b5022297a7adb2',17,'term','product_cat',NULL,NULL,NULL,NULL,'Cat Supplies',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,NULL,'2026-04-18 11:33:08','2026-04-19 01:58:36',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:55','2026-04-19 11:02:09',NULL),
(3,NULL,NULL,18,'term','product_cat',NULL,NULL,NULL,NULL,'Bird &amp; Aquatic',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,NULL,'2026-04-18 11:33:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-18 21:33:09',NULL,NULL),
(4,'https://furlio.au/product-category/small-animals/','52:4bc9d515887d0610562718512fbdf5c2',19,'term','product_cat',NULL,NULL,NULL,NULL,'Small Animals',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,NULL,'2026-04-18 11:33:10','2026-04-19 02:50:51',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:39','2026-04-19 11:02:11',NULL),
(5,NULL,NULL,20,'term','product_cat',NULL,NULL,NULL,NULL,'Pet Health',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 11:33:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-18 21:33:10',NULL,NULL),
(6,'https://furlio.au/author/admin/','34:83f20a88ef520a1b0f4cd8a646bbb521',1,'user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,'https://secure.gravatar.com/avatar/7251a91c2bc6cbf6869bd85fbb3a45902c33de590c2759d2402e4b08718243d2?s=500&d=mm&r=g',NULL,NULL,'gravatar-image',NULL,NULL,'https://secure.gravatar.com/avatar/7251a91c2bc6cbf6869bd85fbb3a45902c33de590c2759d2402e4b08718243d2?s=500&d=mm&r=g',NULL,'gravatar-image',NULL,NULL,NULL,NULL,'2026-04-18 11:35:21','2026-04-24 15:24:28',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-25 01:24:27','2026-04-18 11:31:49',NULL),
(7,'https://localhost/pet/','22:ea7d5960d48058d0d8979eec051fa634',NULL,'home-page',NULL,NULL,NULL,'Furlio — Premium Pet Supplies Australia | %%sitename%%','Shop premium pet supplies in Australia. Free shipping on orders $75+. Fast delivery nationwide. Dog food, cat accessories, pet beds, toys and more.','Home',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'%%sitename%%','','','0',NULL,NULL,NULL,2,NULL,'2026-04-18 11:35:21','2026-04-24 15:24:28',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-25 01:24:27','2026-04-18 11:31:49',NULL),
(8,NULL,NULL,NULL,'system-page','404',NULL,NULL,'Page not found %%sep%% %%sitename%%',NULL,'Error 404: Page not found',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-18 13:24:58','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),
(9,NULL,NULL,NULL,'system-page','search-result',NULL,NULL,'You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-18 13:24:58','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),
(10,NULL,NULL,NULL,'date-archive',NULL,NULL,NULL,'%%date%% %%page%% %%sep%% %%sitename%%','',NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-18 13:24:58','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),
(11,NULL,NULL,3,'post','page',1,0,NULL,NULL,'Privacy Policy','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:58','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 08:31:22','2026-04-18 11:31:49',0),
(12,NULL,NULL,10,'post','page',1,0,NULL,NULL,'Refund and Returns Policy','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:58','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 08:31:42','2026-04-18 13:33:42',0),
(14,'https://furlio.au/shop/','26:f5c3a9a0eb8597384c0bf0a76b3232ea',6,'post','page',1,0,NULL,NULL,'Shop','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,5,NULL,'2026-04-18 13:24:58','2026-04-24 00:33:18',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-18 11:32:07','2026-04-18 11:32:07',0),
(15,'https://furlio.au/cart/','26:3b0629ef634e9483c8a5d9dff42d56db',7,'post','page',1,0,NULL,NULL,'Cart','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:58','2026-04-24 16:11:50',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-18 13:31:30','2026-04-18 11:32:07',0),
(16,'https://furlio.au/checkout/','30:7339a776388dfa356789a5ba98e74f37',8,'post','page',1,0,NULL,NULL,'Checkout','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:58','2026-04-24 16:11:51',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-18 11:32:07','2026-04-18 11:32:07',0),
(17,NULL,NULL,9,'post','page',1,0,NULL,NULL,'My account','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,'2026-04-18 13:24:58','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-18 11:32:07','2026-04-18 11:32:07',0),
(18,NULL,NULL,1,'post','post',1,0,NULL,NULL,'Hello world!','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:58','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-18 11:31:49','2026-04-18 11:31:49',0),
(19,'https://localhost/pet/shop/','27:1c6f34bc00682610a2d7694012e41d82',NULL,'post-type-archive','product',NULL,NULL,'%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%','','Products',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-18 13:24:59','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 12:01:21','2026-04-19 11:02:09',NULL),
(20,'https://localhost/pet/category/uncategorised/','45:26cd6359dadda74c867f4af1e17e186c',1,'term','category',NULL,NULL,NULL,NULL,'Uncategorised',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:59','2026-04-24 15:24:28',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-25 01:24:27','2026-04-18 11:31:49',NULL),
(21,'https://localhost/pet/product-category/uncategorized/','53:2866e0c3ac492f0a932ffbdf757248c7',15,'term','product_cat',NULL,NULL,NULL,NULL,'Uncategorized',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:24:59','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 12:01:21','2026-04-19 11:02:11',NULL),
(22,'https://furlio.au/about/','27:06289ea79579ca2ba17cb901a7482965',14,'post','page',0,0,NULL,NULL,'About Us','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,'2026-04-18 13:33:37','2026-04-24 01:38:00',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 05:10:18','2026-04-18 13:33:37',0),
(23,NULL,NULL,15,'post','page',0,0,NULL,NULL,'Contact Us','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2026-04-18 13:33:38','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 05:14:10','2026-04-18 13:33:38',0),
(24,NULL,NULL,16,'post','page',0,0,NULL,NULL,'FAQ','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'2026-04-18 13:33:39','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 05:11:32','2026-04-18 13:33:39',0),
(25,NULL,NULL,17,'post','page',0,0,NULL,NULL,'Shipping Information','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-18 13:33:41','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 05:13:27','2026-04-18 13:33:41',0),
(26,'https://furlio.au/','21:5155e5578f645c9e3d6b10fb9233fce5',25,'post','page',0,0,NULL,NULL,'Home','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL,'2026-04-18 13:55:18','2026-04-22 18:25:02',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-23 03:57:18','2026-04-18 13:55:17',0),
(27,NULL,NULL,23,'term','product_tag',NULL,NULL,NULL,NULL,'dog bed',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:08','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:08',NULL,NULL),
(28,NULL,NULL,24,'term','product_tag',NULL,NULL,NULL,NULL,'orthopedic dog bed',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:08','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:08',NULL,NULL),
(29,NULL,NULL,25,'term','product_tag',NULL,NULL,NULL,NULL,'dog accessories Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:08','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:08',NULL,NULL),
(30,NULL,NULL,26,'term','product_tag',NULL,NULL,NULL,NULL,'memory foam pet bed',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(31,NULL,NULL,27,'term','product_tag',NULL,NULL,NULL,NULL,'large dog bed',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(32,'https://localhost/pet/product/orthopedic-memory-foam-dog-bed-dog-accessories-australia/','87:a2805906b75c01aaad3729df7a56d1ab',41,'post','product',1,0,'Orthopedic Memory Foam Dog Bed | Furlio','Shop the best orthopedic memory foam dog bed in Australia. Washable cover, non-slip base & fast Aussie shipping. Perfect for dogs of all sizes. Buy now!','Orthopedic Memory Foam Dog Bed – Dog Accessories Australia','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-41.jpg',NULL,'52','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-41.jpg','52','featured-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-41.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-41.jpg\",\n    \"size\": \"full\",\n    \"id\": 52,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-19 11:02:09','2026-04-20 11:43:23',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:59','2026-04-19 11:02:09',0),
(33,NULL,NULL,28,'term','product_tag',NULL,NULL,NULL,NULL,'cat toys Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(34,NULL,NULL,29,'term','product_tag',NULL,NULL,NULL,NULL,'interactive cat toy',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(35,NULL,NULL,30,'term','product_tag',NULL,NULL,NULL,NULL,'feather wand',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(36,NULL,NULL,31,'term','product_tag',NULL,NULL,NULL,NULL,'indoor cat toys',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(37,NULL,NULL,32,'term','product_tag',NULL,NULL,NULL,NULL,'cat accessories',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:09','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:09',NULL,NULL),
(38,'https://furlio.au/product/interactive-feather-wand-cat-toy-cat-toys-australia/','81:480f81dedde65fa7480320ac524b5ba5',42,'post','product',1,0,'Interactive Feather Wand Cat Toy Australia | Furlio','Australia\'s favourite interactive feather wand cat toy. Stimulates hunting instinct, reduces boredom & ships fast across straya. Shop Furlio today!','Interactive Feather Wand Cat Toy – Cat Toys Australia','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://furlio.au/wp-content/uploads/2026/04/product-pet-42.jpg',NULL,'51','featured-image',NULL,NULL,'https://furlio.au/wp-content/uploads/2026/04/product-pet-42.jpg','51','featured-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"http:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-42.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-42.jpg\",\n    \"size\": \"full\",\n    \"id\": 51,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-19 11:02:09','2026-04-20 11:43:23',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:55','2026-04-19 11:02:09',0),
(39,NULL,NULL,33,'term','product_tag',NULL,NULL,NULL,NULL,'slow feeder dog bowl',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(40,NULL,NULL,34,'term','product_tag',NULL,NULL,NULL,NULL,'stainless steel dog bowl',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(41,'https://localhost/pet/product-tag/australian-pet-supplies/','58:0e60ead5d8fe49ca07277f791203de88',35,'term','product_tag',NULL,NULL,NULL,NULL,'Australian pet supplies',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 12:01:21','2026-04-19 11:02:10',NULL),
(42,NULL,NULL,36,'term','product_tag',NULL,NULL,NULL,NULL,'anti-bloat dog bowl',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(43,'https://localhost/pet/product/stainless-steel-slow-feeder-dog-bowl-australian-pet-supplies/','91:99ae1053682fe6cce37c65d80439e94b',43,'post','product',1,0,'Stainless Steel Slow Feeder Dog Bowl Australia | Furlio','Vet-recommended slow feeder dog bowl in stainless steel. Reduces bloat risk, dishwasher safe & fast Aussie shipping. Shop Furlio now!','Stainless Steel Slow Feeder Dog Bowl – Australian Pet Supplies','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-43.jpg',NULL,'50','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-43.jpg','50','featured-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-43.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-43.jpg\",\n    \"size\": \"full\",\n    \"id\": 50,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-19 11:02:10','2026-04-20 11:43:23',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:50','2026-04-19 11:02:10',0),
(44,NULL,NULL,37,'term','product_tag',NULL,NULL,NULL,NULL,'self cleaning slicker brush',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(45,NULL,NULL,38,'term','product_tag',NULL,NULL,NULL,NULL,'dog grooming Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(46,NULL,NULL,39,'term','product_tag',NULL,NULL,NULL,NULL,'cat grooming brush',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(47,NULL,NULL,40,'term','product_tag',NULL,NULL,NULL,NULL,'pet deshedding tool',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:10','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:10',NULL,NULL),
(48,'https://localhost/pet/product/self-cleaning-slicker-brush-for-dogs-cats-australia/','82:79b4f859f52f57774f09a82b0582fd23',44,'post','product',1,0,'Self-Cleaning Slicker Brush Dogs & Cats Australia | Furlio','Australia\'s easiest pet grooming brush with self-cleaning button. Removes loose fur, detangles & ships fast across straya. Shop Furlio today!','Self-Cleaning Slicker Brush for Dogs &amp; Cats – Australia','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-44.jpg',NULL,'49','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-44.jpg','49','featured-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-44.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-44.jpg\",\n    \"size\": \"full\",\n    \"id\": 49,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-19 11:02:10','2026-04-20 11:43:23',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:47','2026-04-19 11:02:10',0),
(49,NULL,NULL,41,'term','product_tag',NULL,NULL,NULL,NULL,'budgie swing perch',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(50,NULL,NULL,42,'term','product_tag',NULL,NULL,NULL,NULL,'bird accessories Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(51,NULL,NULL,43,'term','product_tag',NULL,NULL,NULL,NULL,'budgie toys',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(52,NULL,NULL,44,'term','product_tag',NULL,NULL,NULL,NULL,'bird &amp; aquatic supplies',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(53,NULL,NULL,45,'term','product_tag',NULL,NULL,NULL,NULL,'parakeet perch Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(54,'https://localhost/pet/product/hanging-budgie-bird-swing-perch-bird-aquatic-supplies/','84:5da34d21e4f21269b4ee2cd134f0b579',45,'post','product',1,0,'Hanging Budgie Bird Swing Perch Australia | Furlio','Natural wood budgie swing perch with colourful beads. Bird-safe, easy to install & ships fast across Australia. Shop Furlio for happy birds!','Hanging Budgie Bird Swing Perch – Bird &amp; Aquatic Supplies','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-45.jpg',NULL,'48','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-45.jpg','48','featured-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-45.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-45.jpg\",\n    \"size\": \"full\",\n    \"id\": 48,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-19 11:02:11','2026-04-20 11:43:23',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:43','2026-04-19 11:02:11',0),
(55,NULL,NULL,46,'term','product_tag',NULL,NULL,NULL,NULL,'guinea pig hideout',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(56,NULL,NULL,47,'term','product_tag',NULL,NULL,NULL,NULL,'small animals Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(57,NULL,NULL,48,'term','product_tag',NULL,NULL,NULL,NULL,'guinea pig toys',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(58,NULL,NULL,49,'term','product_tag',NULL,NULL,NULL,NULL,'seagrass tunnel pet',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-19 11:02:11','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 21:02:11',NULL,NULL),
(59,'https://localhost/pet/product/guinea-pig-hideout-tunnel-toy-small-animals-australia/','84:21753e0ba61305a2de98c054eeb4b161',46,'post','product',1,0,'Guinea Pig Hideout Tunnel Toy Australia | Furlio','Natural seagrass guinea pig hideout tunnel – edible, eco-friendly & enriching. Fast Aussie shipping. Perfect for small animals. Shop Furlio now!','Guinea Pig Hideout Tunnel Toy – Small Animals Australia','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-46.jpg',NULL,'47','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-46.jpg','47','featured-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-46.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-46.jpg\",\n    \"size\": \"full\",\n    \"id\": 47,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-19 11:02:11','2026-04-20 11:43:23',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-19 11:19:39','2026-04-19 11:02:11',0),
(60,NULL,NULL,47,'post','attachment',1,46,NULL,NULL,'product-pet-46','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-46.jpg',NULL,'47','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-46.jpg','47','attachment-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-46.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-46.jpg\",\n    \"size\": \"full\",\n    \"id\": 47,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-19 11:19:38','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 11:19:39','2026-04-19 11:19:38',0),
(61,NULL,NULL,48,'post','attachment',1,45,NULL,NULL,'product-pet-45','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-45.jpg',NULL,'48','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-45.jpg','48','attachment-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-45.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-45.jpg\",\n    \"size\": \"full\",\n    \"id\": 48,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-19 11:19:42','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 11:19:43','2026-04-19 11:19:42',0),
(62,NULL,NULL,49,'post','attachment',1,44,NULL,NULL,'product-pet-44','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-44.jpg',NULL,'49','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-44.jpg','49','attachment-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-44.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-44.jpg\",\n    \"size\": \"full\",\n    \"id\": 49,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-19 11:19:46','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 11:19:47','2026-04-19 11:19:46',0),
(63,NULL,NULL,50,'post','attachment',1,43,NULL,NULL,'product-pet-43','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-43.jpg',NULL,'50','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-43.jpg','50','attachment-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-43.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-43.jpg\",\n    \"size\": \"full\",\n    \"id\": 50,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-19 11:19:50','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 11:19:50','2026-04-19 11:19:50',0),
(64,NULL,NULL,51,'post','attachment',1,42,NULL,NULL,'product-pet-42','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-42.jpg',NULL,'51','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-42.jpg','51','attachment-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-42.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-42.jpg\",\n    \"size\": \"full\",\n    \"id\": 51,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-19 11:19:55','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 11:19:55','2026-04-19 11:19:55',0),
(65,NULL,NULL,52,'post','attachment',1,41,NULL,NULL,'product-pet-41','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-41.jpg',NULL,'52','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/product-pet-41.jpg','52','attachment-image','{\n    \"width\": 800,\n    \"height\": 600,\n    \"filesize\": 126099,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-41.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/product-pet-41.jpg\",\n    \"size\": \"full\",\n    \"id\": 52,\n    \"alt\": \"\",\n    \"pixels\": 480000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-19 11:19:59','2026-04-19 11:55:49',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 11:19:59','2026-04-19 11:19:59',0),
(66,NULL,NULL,2,'user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,'https://secure.gravatar.com/avatar/d1f5331790dd77277cc0adc32a5085efc7b6dea75b78360f3ca98e09ad715d5c?s=500&d=mm&r=g',NULL,NULL,'gravatar-image',NULL,NULL,'https://secure.gravatar.com/avatar/d1f5331790dd77277cc0adc32a5085efc7b6dea75b78360f3ca98e09ad715d5c?s=500&d=mm&r=g',NULL,'gravatar-image',NULL,NULL,NULL,NULL,'2026-04-19 13:15:56','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-19 23:15:56',NULL,NULL),
(67,'https://localhost/pet/product-tag/cat-litter-australia/','55:f225858658486d7f745907a36adc6030',50,'term','product_tag',NULL,NULL,NULL,NULL,'cat litter Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:00:33','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:00:33',NULL,NULL),
(68,'https://localhost/pet/product-tag/clumping-cat-litter/','54:f3dec6aac1ddb7de697efe1b7b372bae',51,'term','product_tag',NULL,NULL,NULL,NULL,'clumping cat litter',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:00:33','2026-04-20 02:00:35',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:00:34',NULL,NULL),
(69,'https://localhost/pet/product-tag/cat-accessories-australia/','60:bf52a576d0fdddfa1eeaaeea18970f98',52,'term','product_tag',NULL,NULL,NULL,NULL,'cat accessories Australia',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:00:34','2026-04-20 02:00:35',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:00:34',NULL,NULL),
(70,'https://localhost/pet/product-tag/odour-control-cat-litter/','59:b04e3752f5754cf7fd0ba2d660e09d0f',53,'term','product_tag',NULL,NULL,NULL,NULL,'odour control cat litter',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:00:34','2026-04-20 02:00:35',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:00:34',NULL,NULL),
(71,NULL,NULL,60,'post','attachment',1,0,NULL,NULL,'71CPMTTpPcL._AC_UL600_SR600400_.jpg','inherit',0,0,0,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg',NULL,'60','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg','60','attachment-image','{\n    \"width\": 600,\n    \"height\": 400,\n    \"filesize\": 23829,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/71CPMTTpPcL._AC_UL600_SR600400_.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/71CPMTTpPcL._AC_UL600_SR600400_.jpg\",\n    \"size\": \"full\",\n    \"id\": 60,\n    \"alt\": \"\",\n    \"pixels\": 240000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-20 12:00:34','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-20 12:00:35','2026-04-20 12:00:34',0),
(72,'https://localhost/pet/product/poowee-lavender-cat-litter-15kg-clumping-odour-control/','85:7b7935d3ba0e246f1a058c1ac6a2807b',61,'post','product',1,0,'POOWEE! Lavender Cat Litter 15kg – Clumping & Odour Control','POOWEE! Lavender Cat Litter 15kg – clumping, scoopable & odour-neutralising. #1 on Amazon AU. Fast Aussie shipping. Shop now at Furlio!','POOWEE! Lavender Cat Litter 15kg – Clumping &amp; Odour Control','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg',NULL,'60','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/71CPMTTpPcL._AC_UL600_SR600400_.jpg','60','featured-image','{\n    \"width\": 600,\n    \"height\": 400,\n    \"filesize\": 23829,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/71CPMTTpPcL._AC_UL600_SR600400_.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/71CPMTTpPcL._AC_UL600_SR600400_.jpg\",\n    \"size\": \"full\",\n    \"id\": 60,\n    \"alt\": \"\",\n    \"pixels\": 240000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-20 12:00:35','2026-04-20 02:00:35',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 12:00:35','2026-04-20 12:00:35',0),
(73,NULL,NULL,62,'post','post',1,0,NULL,NULL,'The Best Cat Litter for Aussie Cat Owners: Why POOWEE! Is Topping the Australian Pet Supplies Charts','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2026-04-20 12:00:36','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-20 12:00:36','2026-04-20 12:00:36',0),
(74,'https://localhost/pet/product-tag/eco-friendly-cat-litter/','58:4ec5ebf7bb7187e308b124d6f655ac02',54,'term','product_tag',NULL,NULL,NULL,NULL,'eco-friendly cat litter',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:01:20','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:01:20',NULL,NULL),
(75,'https://localhost/pet/product-tag/recycled-paper-cat-litter/','60:9c6267945ce618c1fb1db611fc402f38',55,'term','product_tag',NULL,NULL,NULL,NULL,'recycled paper cat litter',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:01:20','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:01:20',NULL,NULL),
(76,'https://localhost/pet/product-tag/breeders-choice-litter/','57:1951a539cdba6873cc71ba25736a50c2',56,'term','product_tag',NULL,NULL,NULL,NULL,'Breeders Choice litter',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-20 12:01:20','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 22:01:20',NULL,NULL),
(77,NULL,NULL,63,'post','attachment',1,0,NULL,NULL,'81gLdCfhJgL._AC_UL600_SR600400_.jpg','inherit',0,0,0,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg',NULL,'63','attachment-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg','63','attachment-image','{\n    \"width\": 600,\n    \"height\": 400,\n    \"filesize\": 17898,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/81gLdCfhJgL._AC_UL600_SR600400_.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/81gLdCfhJgL._AC_UL600_SR600400_.jpg\",\n    \"size\": \"full\",\n    \"id\": 63,\n    \"alt\": \"\",\n    \"pixels\": 240000,\n    \"type\": \"image\\/jpeg\"\n}',NULL,NULL,NULL,'2026-04-20 12:01:20','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-20 12:01:21','2026-04-20 12:01:20',0),
(78,'https://localhost/pet/product/breeders-choice-recycled-paper-cat-litter-15l-eco-cat-litter-au/','94:85a98705b7967a77e8971db8b18027b1',64,'post','product',1,0,'Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU','Shop Breeders Choice 99% Recycled Paper Cat Litter 15L. Eco-friendly, low dust & highly absorbent. Fast 2–5 day shipping across Australia. 4.6 stars!','Breeders Choice Recycled Paper Cat Litter 15L | Eco Cat Litter AU','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg',NULL,'63','featured-image',NULL,NULL,'https://localhost/pet/wp-content/uploads/2026/04/81gLdCfhJgL._AC_UL600_SR600400_.jpg','63','featured-image','{\n    \"width\": 600,\n    \"height\": 400,\n    \"filesize\": 17898,\n    \"url\": \"https:\\/\\/localhost\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/81gLdCfhJgL._AC_UL600_SR600400_.jpg\",\n    \"path\": \"\\/var\\/www\\/html\\/pet\\/wp-content\\/uploads\\/2026\\/04\\/81gLdCfhJgL._AC_UL600_SR600400_.jpg\",\n    \"size\": \"full\",\n    \"id\": 63,\n    \"alt\": \"\",\n    \"pixels\": 240000,\n    \"type\": \"image\\/jpeg\"\n}',0,NULL,NULL,'2026-04-20 12:01:21','2026-04-20 02:01:21',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-20 12:01:21','2026-04-20 12:01:21',0),
(79,NULL,NULL,65,'post','post',1,0,NULL,NULL,'The Best Eco-Friendly Cat Litter in Australia: Why Breeders Choice Is a Game-Changer','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2026-04-20 12:01:21','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-20 12:01:21','2026-04-20 12:01:21',0),
(80,NULL,NULL,3,'user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,'https://secure.gravatar.com/avatar/6f03d6b9f7dd9955c7b7d6bf1b06d0f21ae2043f421a532f907bac170118ab62?s=500&d=mm&r=g',NULL,NULL,'gravatar-image',NULL,NULL,'https://secure.gravatar.com/avatar/6f03d6b9f7dd9955c7b7d6bf1b06d0f21ae2043f421a532f907bac170118ab62?s=500&d=mm&r=g',NULL,'gravatar-image',NULL,NULL,NULL,NULL,'2026-04-20 12:11:38','2026-04-23 03:54:05',1,NULL,NULL,NULL,NULL,0,NULL,0,'2026-04-20 22:11:38',NULL,NULL),
(81,'https://localhost/pet/best-dog-harnesses-australia-2026/','56:4e96f3f84dcf98d2ef530ad15fc17af0',72,'post','post',1,0,NULL,NULL,'Best Dog Harnesses Australia 2026: The Ultimate Buying Guide for Your Furry Mate','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-24 13:53:02','2026-04-24 03:53:02',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-24 13:53:02','2026-04-24 13:53:02',0),
(82,'https://localhost/pet/best-bird-small-animal-enrichment-toys-australia-2026/','76:ae107c573afad4da56182ed211f9adf3',73,'post','post',1,0,NULL,NULL,'Best Bird &#038; Small Animal Enrichment Toys in Australia 2026: The Ultimate Buying Guide','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-25 01:22:49','2026-04-24 15:22:49',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-25 01:22:49','2026-04-25 01:22:49',0),
(83,'https://localhost/pet/new-puppy-starter-pack-essentials-australia-2026/','71:6ef3165565ebfd0233d632ed33046b83',74,'post','post',1,0,NULL,NULL,'10 Best New Puppy Starter Pack Essentials in Australia 2026','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2026-04-25 01:24:28','2026-04-24 15:24:28',1,NULL,NULL,NULL,NULL,0,NULL,2,'2026-04-25 01:24:27','2026-04-25 01:24:27',0);
/*!40000 ALTER TABLE `wp_yoast_indexable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_indexable_hierarchy`
--

DROP TABLE IF EXISTS `wp_yoast_indexable_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_indexable_hierarchy` (
  `indexable_id` int(11) unsigned NOT NULL,
  `ancestor_id` int(11) unsigned NOT NULL,
  `depth` int(11) unsigned DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  PRIMARY KEY (`indexable_id`,`ancestor_id`),
  KEY `indexable_id` (`indexable_id`),
  KEY `ancestor_id` (`ancestor_id`),
  KEY `depth` (`depth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_indexable_hierarchy`
--

LOCK TABLES `wp_yoast_indexable_hierarchy` WRITE;
/*!40000 ALTER TABLE `wp_yoast_indexable_hierarchy` DISABLE KEYS */;
INSERT INTO `wp_yoast_indexable_hierarchy` VALUES
(1,0,0,1),
(2,0,0,1),
(3,0,0,1),
(4,0,0,1),
(5,0,0,1),
(6,0,0,1),
(11,0,0,1),
(12,0,0,1),
(14,0,0,1),
(15,0,0,1),
(16,0,0,1),
(17,0,0,1),
(18,0,0,1),
(20,0,0,1),
(21,0,0,1),
(22,0,0,1),
(23,0,0,1),
(24,0,0,1),
(25,0,0,1),
(26,0,0,1),
(27,0,0,1),
(28,0,0,1),
(29,0,0,1),
(30,0,0,1),
(31,0,0,1),
(32,0,0,1),
(33,0,0,1),
(34,0,0,1),
(35,0,0,1),
(36,0,0,1),
(37,0,0,1),
(38,0,0,1),
(39,0,0,1),
(40,0,0,1),
(41,0,0,1),
(42,0,0,1),
(43,0,0,1),
(44,0,0,1),
(45,0,0,1),
(46,0,0,1),
(47,0,0,1),
(48,0,0,1),
(49,0,0,1),
(50,0,0,1),
(51,0,0,1),
(52,0,0,1),
(53,0,0,1),
(54,0,0,1),
(55,0,0,1),
(56,0,0,1),
(57,0,0,1),
(58,0,0,1),
(59,0,0,1),
(60,59,1,1),
(61,54,1,1),
(62,48,1,1),
(63,43,1,1),
(64,38,1,1),
(65,32,1,1),
(67,0,0,1),
(68,0,0,1),
(69,0,0,1),
(70,0,0,1),
(71,0,0,1),
(72,0,0,1),
(73,0,0,1),
(74,0,0,1),
(75,0,0,1),
(76,0,0,1),
(77,0,0,1),
(78,0,0,1),
(79,0,0,1),
(81,0,0,1),
(82,0,0,1),
(83,0,0,1);
/*!40000 ALTER TABLE `wp_yoast_indexable_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_migrations`
--

DROP TABLE IF EXISTS `wp_yoast_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_migrations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wp_yoast_migrations_version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_migrations`
--

LOCK TABLES `wp_yoast_migrations` WRITE;
/*!40000 ALTER TABLE `wp_yoast_migrations` DISABLE KEYS */;
INSERT INTO `wp_yoast_migrations` VALUES
(1,'20171228151840'),
(2,'20171228151841'),
(3,'20190529075038'),
(4,'20191011111109'),
(5,'20200408101900'),
(6,'20200420073606'),
(7,'20200428123747'),
(8,'20200428194858'),
(9,'20200429105310'),
(10,'20200430075614'),
(11,'20200430150130'),
(12,'20200507054848'),
(13,'20200513133401'),
(14,'20200609154515'),
(15,'20200616130143'),
(16,'20200617122511'),
(17,'20200702141921'),
(18,'20200728095334'),
(19,'20201202144329'),
(20,'20201216124002'),
(21,'20201216141134'),
(22,'20210817092415'),
(23,'20211020091404'),
(24,'20230417083836'),
(25,'20260105111111');
/*!40000 ALTER TABLE `wp_yoast_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_primary_term`
--

DROP TABLE IF EXISTS `wp_yoast_primary_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_primary_term` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `term_id` bigint(20) DEFAULT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `post_taxonomy` (`post_id`,`taxonomy`),
  KEY `post_term` (`post_id`,`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_primary_term`
--

LOCK TABLES `wp_yoast_primary_term` WRITE;
/*!40000 ALTER TABLE `wp_yoast_primary_term` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_yoast_primary_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_seo_links`
--

DROP TABLE IF EXISTS `wp_yoast_seo_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `target_post_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `indexable_id` int(11) unsigned DEFAULT NULL,
  `target_indexable_id` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`),
  KEY `indexable_link_direction` (`indexable_id`,`type`),
  KEY `url_index` (`url`),
  KEY `target_indexable_id_index` (`target_indexable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_seo_links`
--

LOCK TABLES `wp_yoast_seo_links` WRITE;
/*!40000 ALTER TABLE `wp_yoast_seo_links` DISABLE KEYS */;
INSERT INTO `wp_yoast_seo_links` VALUES
(3,'https://furlio.au/my-account/lost-password/',9,9,'internal',17,17,NULL,NULL,NULL,NULL,NULL),
(4,'/pet/shop/',25,6,'internal',26,14,NULL,NULL,NULL,NULL,NULL),
(5,'/pet/shop/',25,6,'internal',26,14,NULL,NULL,NULL,NULL,NULL),
(6,'/pet/product-category/dog-accessories/',25,NULL,'internal',26,1,NULL,NULL,NULL,NULL,NULL),
(7,'/pet/product-category/cat-supplies/',25,NULL,'internal',26,2,NULL,NULL,NULL,NULL,NULL),
(8,'/pet/product-category/bird-aquatic/',25,NULL,'internal',26,3,NULL,NULL,NULL,NULL,NULL),
(9,'/pet/product-category/small-animals/',25,NULL,'internal',26,4,NULL,NULL,NULL,NULL,NULL),
(10,'/pet/product-category/dog-accessories/',25,NULL,'internal',26,1,NULL,NULL,NULL,NULL,NULL),
(11,'/pet/product-category/cat-supplies/',25,NULL,'internal',26,2,NULL,NULL,NULL,NULL,NULL),
(12,'/pet/product-category/bird-aquatic/',25,NULL,'internal',26,3,NULL,NULL,NULL,NULL,NULL),
(13,'/pet/product-category/small-animals/',25,NULL,'internal',26,4,NULL,NULL,NULL,NULL,NULL),
(14,'/pet/shop/',25,6,'internal',26,14,NULL,NULL,NULL,NULL,NULL),
(15,'/pet/shop/',25,6,'internal',26,14,NULL,NULL,NULL,NULL,NULL),
(16,'/pet/about/',25,14,'internal',26,22,NULL,NULL,NULL,NULL,NULL),
(17,'/pet/shop/',14,6,'internal',22,14,NULL,NULL,NULL,NULL,NULL),
(18,'/pet/contact-us/',16,NULL,'internal',24,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'/pet/contact-us/',16,NULL,'internal',24,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'mailto:hello@furlio.au',17,NULL,'external',25,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'mailto:hello@furlio.au',15,NULL,'external',23,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'/pet/refund-and-returns-policy/',15,NULL,'internal',23,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'mailto:hello@furlio.au',3,NULL,'external',11,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'mailto:hello@furlio.au',3,NULL,'external',11,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'mailto:hello@furlio.au',10,NULL,'external',12,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'mailto:hello@furlio.au',10,NULL,'external',12,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'https://furlio.au/?p=61',62,NULL,'internal',73,7,NULL,NULL,NULL,NULL,NULL),
(28,'https://furlio.au/?p=64',65,NULL,'internal',79,7,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wp_yoast_seo_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 12:18:38
