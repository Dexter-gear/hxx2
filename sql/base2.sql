-- MySQL dump 10.13  Distrib 9.2.0, for macos15.2 (arm64)
--
-- Host: 127.0.0.1    Database: ry_vue
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_apples`
--

DROP TABLE IF EXISTS `all_apples`;
/*!50001 DROP VIEW IF EXISTS `all_apples`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_apples` AS SELECT 
 1 AS `product_type`,
 1 AS `id`,
 1 AS `product_name`,
 1 AS `quality_level`,
 1 AS `stock`,
 1 AS `description`,
 1 AS `image_url`,
 1 AS `status`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!50001 DROP VIEW IF EXISTS `carts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `carts` AS SELECT 
 1 AS `cart_id`,
 1 AS `user_id`,
 1 AS `product_id`,
 1 AS `product_type`,
 1 AS `quantity`,
 1 AS `product_name`,
 1 AS `image_url`,
 1 AS `description`,
 1 AS `quality_level`,
 1 AS `price`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'all_apples','VIEW',NULL,NULL,'AllApples','crud','element-ui','com.ruoyi.system','system','apples','VIEW','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-01 12:05:56','','2025-04-01 12:07:54',NULL),(2,'green_apple','青苹果表',NULL,NULL,'GreenApple','crud','element-ui','com.ruoyi.system','system','g_apple','青苹果','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-01 12:05:56','','2025-04-01 12:08:15',NULL),(3,'guoguang_apple','国光苹果表',NULL,NULL,'GuoguangApple','crud','element-ui','com.ruoyi.system','system','gg_apple','国光苹果','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-01 12:05:56','','2025-04-01 12:08:35',NULL),(4,'hongxing_apple','红星苹果表',NULL,NULL,'HongxingApple','crud','element-ui','com.ruoyi.system','system','hx_apple','红星苹果','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-01 12:05:56','','2025-04-01 12:08:49',NULL),(5,'jinguan_apple','金冠苹果表',NULL,NULL,'JinguanApple','crud','element-ui','com.ruoyi.system','system','jg_apple','金冠苹果','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-01 12:05:56','','2025-04-01 12:09:01',NULL),(6,'order_detail','订单详情表',NULL,NULL,'OrderDetail','crud','element-ui','com.ruoyi.system','system','detail','订单详情','hxx','0','/','{\"parentMenuId\":2000}','admin','2025-04-01 12:05:56','','2025-04-01 12:09:12',NULL),(7,'orders','订单表',NULL,NULL,'Orders','crud','element-ui','com.ruoyi.system','system','orders','订单','hxx','0','/','{\"parentMenuId\":2000}','admin','2025-04-01 12:05:56','','2025-04-01 12:09:24',NULL),(8,'product_comment','评论表',NULL,NULL,'ProductComment','crud','element-ui','com.ruoyi.system','system','comment','评论','hxx','0','/','{\"parentMenuId\":2000}','admin','2025-04-01 12:05:56','','2025-04-01 12:09:46',NULL),(9,'red_fuji_apple','红富士苹果表',NULL,NULL,'RedFujiApple','crud','element-ui','com.ruoyi.system','system','hfs_apple','红富士苹果','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-01 12:05:56','','2025-04-01 12:09:58',NULL),(10,'shopping_cart','购物车表',NULL,NULL,'ShoppingCart','crud','element-ui','com.ruoyi.system','system','cart','购物车','hxx','0','/','{\"parentMenuId\":2000}','admin','2025-04-01 12:05:56','','2025-04-01 12:10:08',NULL),(11,'price_rule','价格计算规则表',NULL,NULL,'PriceRule','crud','element-ui','com.ruoyi.system','system','rule','价格计算规则','hxx','0','/','{\"parentMenuId\":2000}','admin','2025-04-01 12:06:03','','2025-04-01 12:07:41',NULL),(12,'carts','VIEW',NULL,NULL,'Carts','crud','element-ui','com.ruoyi.system','system','carts','购物车视图','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-08 13:51:52','','2025-04-08 13:59:51',NULL),(13,'products','VIEW',NULL,NULL,'Products','crud','element-ui','com.ruoyi.system','system','products','商品视图','hxx','0','/','{\"parentMenuId\":2001}','admin','2025-04-08 13:51:52','','2025-04-08 14:00:08',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'product_type',NULL,'varchar(14)','String','productType','0','0','1','1','1','1','1','EQ','select','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(2,1,'id',NULL,'bigint','Long','id','0','0','1','1',NULL,NULL,NULL,'EQ','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(3,1,'product_name',NULL,'varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(4,1,'quality_level',NULL,'varchar(2)','String','qualityLevel','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(5,1,'stock',NULL,'int','Long','stock','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(6,1,'description',NULL,'mediumtext','String','description','0','0','0','1','1','1','1','EQ','textarea','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(7,1,'image_url',NULL,'varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(8,1,'status',NULL,'char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(9,1,'create_time',NULL,'datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(10,1,'update_time',NULL,'datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',10,'admin','2025-04-01 12:05:56','','2025-04-01 12:07:54'),(11,2,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(12,2,'product_name','产品名称','varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(13,2,'quality_level','品质等级','enum(\'特级\',\'一级\',\'二级\',\'三级\')','String','qualityLevel','0','0','1','1','1','1','1','EQ',NULL,'',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(14,2,'stock','库存数量','int','Long','stock','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(15,2,'description','产品描述','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(16,2,'image_url','产品图片URL','varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(17,2,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(18,2,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(19,2,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(20,2,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(21,2,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(22,2,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:15'),(23,3,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(24,3,'product_name','产品名称','varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(25,3,'quality_level','品质等级','enum(\'特级\',\'一级\',\'二级\',\'三级\')','String','qualityLevel','0','0','1','1','1','1','1','EQ',NULL,'',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(26,3,'stock','库存数量','int','Long','stock','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(27,3,'description','产品描述','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(28,3,'image_url','产品图片URL','varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(29,3,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(30,3,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(31,3,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(32,3,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(33,3,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(34,3,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:35'),(35,4,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(36,4,'product_name','产品名称','varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(37,4,'quality_level','品质等级','enum(\'特级\',\'一级\',\'二级\',\'三级\')','String','qualityLevel','0','0','1','1','1','1','1','EQ',NULL,'',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(38,4,'stock','库存数量','int','Long','stock','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(39,4,'description','产品描述','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(40,4,'image_url','产品图片URL','varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(41,4,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(42,4,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(43,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(44,4,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(45,4,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(46,4,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2025-04-01 12:05:56','','2025-04-01 12:08:49'),(47,5,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(48,5,'product_name','产品名称','varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(49,5,'quality_level','品质等级','enum(\'特级\',\'一级\',\'二级\',\'三级\')','String','qualityLevel','0','0','1','1','1','1','1','EQ',NULL,'',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(50,5,'stock','库存数量','int','Long','stock','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(51,5,'description','产品描述','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(52,5,'image_url','产品图片URL','varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(53,5,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(54,5,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(55,5,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(56,5,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(57,5,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(58,5,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:01'),(59,6,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(60,6,'order_id','订单ID','bigint','Long','orderId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(61,6,'product_type','产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）','varchar(50)','String','productType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(62,6,'product_id','产品ID','bigint','Long','productId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(63,6,'quantity','购买数量','int','Long','quantity','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(64,6,'price','购买时价格','decimal(10,2)','BigDecimal','price','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(65,6,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:12'),(66,7,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(67,7,'order_no','订单编号','varchar(50)','String','orderNo','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(68,7,'user_id','用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(69,7,'total_amount','订单总金额','decimal(10,2)','BigDecimal','totalAmount','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(70,7,'status','订单状态（0待付款 1已付款 2已发货 3已完成 4已取消）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(71,7,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(72,7,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:24'),(73,8,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(74,8,'user_id','用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(75,8,'product_type','产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）','varchar(50)','String','productType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(76,8,'product_id','产品ID','bigint','Long','productId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(77,8,'rating','评分（1-5）','int','Long','rating','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(78,8,'content','评论内容','text','String','content','0','0','1','1','1','1','1','EQ','editor','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(79,8,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(80,8,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:46'),(81,9,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(82,9,'product_name','产品名称','varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(83,9,'quality_level','品质等级','enum(\'特级\',\'一级\',\'二级\',\'三级\')','String','qualityLevel','0','0','1','1','1','1','1','EQ',NULL,'',3,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(84,9,'stock','库存数量','int','Long','stock','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(85,9,'description','产品描述','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(86,9,'image_url','产品图片URL','varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(87,9,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(88,9,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(89,9,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(90,9,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(91,9,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(92,9,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2025-04-01 12:05:56','','2025-04-01 12:09:58'),(93,10,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(94,10,'user_id','用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(95,10,'product_type','产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）','varchar(50)','String','productType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(96,10,'product_id','产品ID','bigint','Long','productId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(97,10,'quantity','购买数量','int','Long','quantity','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(98,10,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(99,10,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',7,'admin','2025-04-01 12:05:57','','2025-04-01 12:10:08'),(100,11,'id','主键ID','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-01 12:06:03','','2025-04-01 12:07:41'),(101,11,'product_type','产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）','varchar(50)','String','productType','0','0','1','1','1','1','1','EQ','select','',2,'admin','2025-04-01 12:06:03','','2025-04-01 12:07:41'),(102,11,'quality_level','品质等级','enum(\'特级\',\'一级\',\'二级\',\'三级\')','String','qualityLevel','0','0','1','1','1','1','1','EQ',NULL,'',3,'admin','2025-04-01 12:06:03','','2025-04-01 12:07:41'),(103,11,'base_price','基础价格','decimal(10,2)','BigDecimal','basePrice','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-01 12:06:03','','2025-04-01 12:07:41'),(104,11,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2025-04-01 12:06:03','','2025-04-01 12:07:41'),(105,11,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',6,'admin','2025-04-01 12:06:03','','2025-04-01 12:07:41'),(106,12,'cart_id','主键ID','bigint','Long','cartId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(107,12,'user_id','用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(108,12,'product_id','产品ID','bigint','Long','productId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(109,12,'product_type','产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）','varchar(50)','String','productType','0','0','1','1','1','1','1','EQ','select','',4,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(110,12,'quantity','购买数量','int','Long','quantity','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(111,12,'product_name',NULL,'varchar(100)','String','productName','0','0','0','1','1','1','1','LIKE','input','',6,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(112,12,'image_url',NULL,'varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(113,12,'description',NULL,'mediumtext','String','description','0','0','0','1','1','1','1','EQ','textarea','',8,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(114,12,'quality_level',NULL,'varchar(2)','String','qualityLevel','0','0','0','1','1','1','1','EQ','input','',9,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(115,12,'price',NULL,'decimal(10,2)','BigDecimal','price','0','0','0','1','1','1','1','EQ','input','',10,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(116,12,'total_price',NULL,'decimal(20,2)','BigDecimal','totalPrice','0','0','0','1','1','1','1','EQ','input','',11,'admin','2025-04-08 13:51:52','','2025-04-08 13:59:51'),(117,13,'product_type',NULL,'varchar(14)','String','productType','0','0','1','1','1','1','1','EQ','select','',1,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(118,13,'product_id',NULL,'bigint','Long','productId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(119,13,'product_name',NULL,'varchar(100)','String','productName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(120,13,'image_url',NULL,'varchar(255)','String','imageUrl','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(121,13,'description',NULL,'mediumtext','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(122,13,'quality_level',NULL,'varchar(2)','String','qualityLevel','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(123,13,'stock',NULL,'int','Long','stock','0','0','1','1','1','1','1','EQ','input','',7,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(124,13,'status',NULL,'char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',8,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08'),(125,13,'price',NULL,'decimal(10,2)','BigDecimal','price','0','0','0','1','1','1','1','EQ','input','',9,'admin','2025-04-08 13:51:52','','2025-04-08 14:00:08');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_apple`
--

DROP TABLE IF EXISTS `green_apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_apple` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `quality_level` enum('特级','一级','二级','三级') NOT NULL COMMENT '品质等级',
  `stock` int NOT NULL COMMENT '库存数量',
  `description` text COMMENT '产品描述',
  `image_url` varchar(255) DEFAULT NULL COMMENT '产品图片URL',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='青苹果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_apple`
--

LOCK TABLES `green_apple` WRITE;
/*!40000 ALTER TABLE `green_apple` DISABLE KEYS */;
INSERT INTO `green_apple` VALUES (1,'平山青苹果特级果','特级',800,'产自平山县优质果园，果形端正，色泽青翠，口感清脆','../images/fruit/q1.jpg','1','','2025-04-01 12:05:44','','2025-04-09 16:45:41',NULL),(2,'平山青苹果一级果','一级',1500,'产自平山县优质果园，果形良好，色泽青翠，口感清脆',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL),(3,'平山青苹果二级果','二级',2500,'产自平山县优质果园，果形正常，色泽青翠，口感良好',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL);
/*!40000 ALTER TABLE `green_apple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guoguang_apple`
--

DROP TABLE IF EXISTS `guoguang_apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guoguang_apple` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `quality_level` enum('特级','一级','二级','三级') NOT NULL COMMENT '品质等级',
  `stock` int NOT NULL COMMENT '库存数量',
  `description` text COMMENT '产品描述',
  `image_url` varchar(255) DEFAULT NULL COMMENT '产品图片URL',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='国光苹果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guoguang_apple`
--

LOCK TABLES `guoguang_apple` WRITE;
/*!40000 ALTER TABLE `guoguang_apple` DISABLE KEYS */;
INSERT INTO `guoguang_apple` VALUES (1,'平山国光特级果','特级',600,'产自平山县优质果园，果形端正，色泽金黄，口感香甜','../images/fruit/gg1.jpg','1','','2025-04-01 12:05:44','','2025-04-09 16:45:50',NULL),(2,'平山国光一级果','一级',1200,'产自平山县优质果园，果形良好，色泽金黄，口感香甜','../images/fruit/gg2.jpg','1','','2025-04-01 12:05:44','','2025-04-09 16:45:56',NULL),(3,'平山国光二级果','二级',2000,'产自平山县优质果园，果形正常，色泽金黄，口感良好','../images/fruit/gg3.jpg','1','','2025-04-01 12:05:44','','2025-04-09 16:46:04',NULL);
/*!40000 ALTER TABLE `guoguang_apple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hongxing_apple`
--

DROP TABLE IF EXISTS `hongxing_apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hongxing_apple` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `quality_level` enum('特级','一级','二级','三级') NOT NULL COMMENT '品质等级',
  `stock` int NOT NULL COMMENT '库存数量',
  `description` text COMMENT '产品描述',
  `image_url` varchar(255) DEFAULT NULL COMMENT '产品图片URL',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='红星苹果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hongxing_apple`
--

LOCK TABLES `hongxing_apple` WRITE;
/*!40000 ALTER TABLE `hongxing_apple` DISABLE KEYS */;
INSERT INTO `hongxing_apple` VALUES (1,'平山红星特级果','特级',500,'产自平山县优质果园，果形端正，色泽红艳，口感香甜',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL),(2,'平山红星一级果','一级',1000,'产自平山县优质果园，果形良好，色泽红艳，口感香甜',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL),(3,'平山红星二级果','二级',1800,'产自平山县优质果园，果形正常，色泽红艳，口感良好',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL);
/*!40000 ALTER TABLE `hongxing_apple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jinguan_apple`
--

DROP TABLE IF EXISTS `jinguan_apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jinguan_apple` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `quality_level` enum('特级','一级','二级','三级') NOT NULL COMMENT '品质等级',
  `stock` int NOT NULL COMMENT '库存数量',
  `description` text COMMENT '产品描述',
  `image_url` varchar(255) DEFAULT NULL COMMENT '产品图片URL',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='金冠苹果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jinguan_apple`
--

LOCK TABLES `jinguan_apple` WRITE;
/*!40000 ALTER TABLE `jinguan_apple` DISABLE KEYS */;
INSERT INTO `jinguan_apple` VALUES (1,'平山金冠特级果','特级',400,'产自平山县优质果园，果形端正，色泽金黄，口感香甜',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL),(2,'平山金冠一级果','一级',800,'产自平山县优质果园，果形良好，色泽金黄，口感香甜',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL),(3,'平山金冠二级果','二级',1500,'产自平山县优质果园，果形正常，色泽金黄，口感良好',NULL,'1','','2025-04-01 12:05:44','',NULL,NULL);
/*!40000 ALTER TABLE `jinguan_apple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `product_type` varchar(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
  `product_id` bigint NOT NULL COMMENT '产品ID',
  `quantity` int NOT NULL COMMENT '购买数量',
  `price` decimal(10,2) NOT NULL COMMENT '购买时价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (22,13,'hongxing_apple',1,1,16.00,'2025-04-09 16:58:45'),(23,13,'red_fuji_apple',3,1,9.00,'2025-04-09 16:58:45'),(24,13,'hongxing_apple',1,1,16.00,'2025-04-09 16:58:45'),(25,13,'red_fuji_apple',2,1,12.00,'2025-04-09 16:58:45'),(26,13,'green_apple',1,1,13.00,'2025-04-09 16:58:45');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `status` char(1) DEFAULT '0' COMMENT '订单状态（0待付款 1已付款 2已发货 3已完成 4已取消）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (13,'ORD1744189124754418',1,66.00,'0','2025-04-09 16:58:45',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_rule`
--

DROP TABLE IF EXISTS `price_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_type` varchar(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
  `quality_level` enum('特级','一级','二级','三级') NOT NULL COMMENT '品质等级',
  `base_price` decimal(10,2) NOT NULL COMMENT '基础价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='价格计算规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_rule`
--

LOCK TABLES `price_rule` WRITE;
/*!40000 ALTER TABLE `price_rule` DISABLE KEYS */;
INSERT INTO `price_rule` VALUES (1,'red_fuji_apple','特级',15.00,'2025-04-01 12:05:44',NULL),(2,'red_fuji_apple','一级',12.00,'2025-04-01 12:05:44',NULL),(3,'red_fuji_apple','二级',9.00,'2025-04-01 12:05:44',NULL),(4,'green_apple','特级',13.00,'2025-04-01 12:05:44',NULL),(5,'green_apple','一级',10.00,'2025-04-01 12:05:44',NULL),(6,'green_apple','二级',7.00,'2025-04-01 12:05:44',NULL),(7,'guoguang_apple','特级',14.00,'2025-04-01 12:05:44',NULL),(8,'guoguang_apple','一级',11.00,'2025-04-01 12:05:44',NULL),(9,'guoguang_apple','二级',8.00,'2025-04-01 12:05:44',NULL),(10,'hongxing_apple','特级',16.00,'2025-04-01 12:05:44',NULL),(11,'hongxing_apple','一级',13.00,'2025-04-01 12:05:44',NULL),(12,'hongxing_apple','二级',10.00,'2025-04-01 12:05:44',NULL),(13,'jinguan_apple','特级',15.00,'2025-04-01 12:05:44',NULL),(14,'jinguan_apple','一级',12.00,'2025-04-01 12:05:44',NULL),(15,'jinguan_apple','二级',9.00,'2025-04-01 12:05:44',NULL);
/*!40000 ALTER TABLE `price_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `product_type` varchar(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
  `product_id` bigint NOT NULL COMMENT '产品ID',
  `rating` int NOT NULL COMMENT '评分（1-5）',
  `content` text NOT NULL COMMENT '评论内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` VALUES (1,1,'red_fuji_apple',2,5,'123','2025-04-09 11:12:59',NULL);
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products`
--

DROP TABLE IF EXISTS `products`;
/*!50001 DROP VIEW IF EXISTS `products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products` AS SELECT 
 1 AS `product_type`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `image_url`,
 1 AS `description`,
 1 AS `quality_level`,
 1 AS `stock`,
 1 AS `status`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `red_fuji_apple`
--

DROP TABLE IF EXISTS `red_fuji_apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `red_fuji_apple` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `quality_level` enum('特级','一级','二级','三级') NOT NULL COMMENT '品质等级',
  `stock` int NOT NULL COMMENT '库存数量',
  `description` text COMMENT '产品描述',
  `image_url` varchar(255) DEFAULT NULL COMMENT '产品图片URL',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='红富士苹果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `red_fuji_apple`
--

LOCK TABLES `red_fuji_apple` WRITE;
/*!40000 ALTER TABLE `red_fuji_apple` DISABLE KEYS */;
INSERT INTO `red_fuji_apple` VALUES (1,'平山红富士特级果','特级',1000,'产自平山县优质果园，果形端正，色泽红润，口感甜脆','../images/fruit/hfs1.jpg','1','','2025-04-01 12:05:44','','2025-04-09 16:45:11',NULL),(2,'平山红富士一级果','一级',2000,'产自平山县优质果园，果形良好，色泽红润，口感甜脆','../images/fruit/hfs2.jpg','0','','2025-04-09 14:40:48','','2025-04-09 16:45:21',NULL),(3,'平山红富士二级果','二级',3000,'产自平山县优质果园，果形正常，色泽红润，口感良好','../images/fruit/hfs3.jpg','1','','2025-04-01 12:05:44','','2025-04-09 16:45:31',NULL);
/*!40000 ALTER TABLE `red_fuji_apple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `product_type` varchar(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
  `product_id` bigint NOT NULL COMMENT '产品ID',
  `quantity` int NOT NULL COMMENT '购买数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,1,'hongxing_apple',1,1,'2025-04-01 10:00:00','2025-04-01 10:00:00'),(4,1,'red_fuji_apple',3,1,'2025-04-08 23:08:50',NULL),(5,1,'hongxing_apple',1,1,'2025-04-08 23:11:27',NULL),(6,1,'red_fuji_apple',2,1,'2025-04-09 01:11:01',NULL),(7,1,'green_apple',1,1,'2025-04-09 16:49:44',NULL);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-04-01 12:05:07','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-04-01 12:05:07','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-04-01 12:05:07','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-04-01 12:05:07','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-04-01 12:05:07','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-04-01 12:05:07','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-01 12:05:06','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-04-01 12:05:07','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-04-01 12:05:07','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-04-01 12:05:07','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-04-01 12:05:07','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-04-01 12:05:07','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-04-01 12:05:07','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-04-01 12:05:07','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-04-01 12:05:07','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-04-01 12:05:07','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-04-01 12:05:07','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-04-01 12:05:07','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-04-01 12:05:07','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-04-01 12:05:07','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-04-01 12:05:07','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-04-01 12:05:07','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-04-01 12:05:07','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-04-01 12:05:07','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-04-01 12:05:07','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-04-01 12:05:07','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-04-01 12:05:07','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-04-01 12:05:07','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-04-01 12:05:07','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-04-01 12:05:07','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-04-01 12:05:07','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-04-01 12:05:07','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-04-01 12:05:07','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-04-01 12:05:07','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-04-01 12:05:07','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-04-01 12:05:07','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-04-01 12:05:07','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-04-01 12:05:07','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-04-01 12:05:07','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-04-01 12:05:07','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-04-01 12:05:07','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-01 12:44:44'),(101,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 13:10:15'),(102,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 13:14:15'),(103,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 13:14:26'),(104,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 13:18:47'),(105,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','验证码已失效','2025-04-01 15:16:39'),(106,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 16:34:29'),(107,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 16:34:32'),(108,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 16:34:35'),(109,'s','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 16:36:35'),(110,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 16:56:53'),(111,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 17:02:38'),(112,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 17:04:59'),(113,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 17:09:43'),(114,'a','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-01 17:10:29'),(115,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-01 17:19:42'),(116,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-01 17:31:27'),(117,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 04:41:47'),(118,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 04:53:05'),(119,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 05:34:54'),(120,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 05:43:29'),(121,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 06:44:51'),(122,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 07:04:38'),(123,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 07:15:50'),(124,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 07:45:13'),(125,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-07 09:40:09'),(126,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 09:40:14'),(127,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-07 10:11:18'),(128,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-07 10:11:19'),(129,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 10:11:22'),(130,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 11:23:01'),(131,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 12:07:05'),(132,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 13:41:30'),(133,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-07 13:41:50'),(134,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 00:36:18'),(135,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 05:54:53'),(136,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 06:52:38'),(137,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 07:05:00'),(138,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 08:29:33'),(139,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 08:30:07'),(140,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 09:48:58'),(141,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 10:13:46'),(142,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 11:21:02'),(143,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 12:08:51'),(144,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 12:15:38'),(145,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 13:51:43'),(146,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 14:17:30'),(147,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 14:34:55'),(148,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 14:44:46'),(149,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 15:09:28'),(150,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 15:40:58'),(151,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-08 17:08:37'),(152,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 17:08:51'),(153,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 17:09:34'),(154,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-08 17:10:27'),(155,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 17:10:33'),(156,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 17:10:51'),(157,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 17:49:45'),(158,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 18:43:11'),(159,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-08 18:47:35'),(160,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-08 18:47:45'),(161,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-08 18:47:53'),(162,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-08 18:48:03'),(163,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 02:38:16'),(164,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 02:38:55'),(165,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-09 02:49:37'),(166,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 02:49:50'),(167,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 03:13:38'),(168,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 05:54:30'),(169,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 05:55:28'),(170,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 06:40:39'),(171,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 07:36:40'),(172,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 08:17:24'),(173,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 08:24:50'),(174,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-09 08:46:43'),(175,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 08:46:53'),(176,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-09 08:47:28'),(177,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 08:47:37'),(178,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 08:48:36'),(179,'hxx','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-09 08:58:37');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2080 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-04-01 12:05:06','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-04-01 12:05:06','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-04-01 12:05:06','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2025-04-01 12:05:06','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-04-01 12:05:07','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-04-01 12:05:07','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-04-01 12:05:07','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-04-01 12:05:07','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-04-01 12:05:07','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-04-01 12:05:07','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-04-01 12:05:07','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-04-01 12:05:07','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-04-01 12:05:07','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-04-01 12:05:07','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-04-01 12:05:07','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-04-01 12:05:07','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-04-01 12:05:07','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-04-01 12:05:07','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-04-01 12:05:07','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-04-01 12:05:07','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-04-01 12:05:07','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-04-01 12:05:07','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-04-01 12:05:07','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-04-01 12:05:07','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-04-01 12:05:07','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-04-01 12:05:07','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-04-01 12:05:07','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-04-01 12:05:07','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-04-01 12:05:07','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-04-01 12:05:07','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-04-01 12:05:07','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-04-01 12:05:07','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-04-01 12:05:07','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-04-01 12:05:07','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-04-01 12:05:07','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-04-01 12:05:07','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-04-01 12:05:07','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-04-01 12:05:07','',NULL,''),(2000,'平台管理',0,1,'shop',NULL,NULL,'',1,0,'M','0','0',NULL,'shopping','admin','2025-04-01 12:06:40','',NULL,''),(2001,'商品管理',0,1,'product',NULL,NULL,'',1,0,'M','0','0',NULL,'icon','admin','2025-04-01 12:07:06','',NULL,''),(2002,'VIEW',2001,1,'apples','system/apples/index',NULL,'',1,0,'C','0','0','system:apples:list','#','admin','2025-04-01 12:40:08','',NULL,'VIEW菜单'),(2003,'VIEW查询',2002,1,'#','',NULL,'',1,0,'F','0','0','system:apples:query','#','admin','2025-04-01 12:40:09','',NULL,''),(2004,'VIEW新增',2002,2,'#','',NULL,'',1,0,'F','0','0','system:apples:add','#','admin','2025-04-01 12:40:09','',NULL,''),(2005,'VIEW修改',2002,3,'#','',NULL,'',1,0,'F','0','0','system:apples:edit','#','admin','2025-04-01 12:40:09','',NULL,''),(2006,'VIEW删除',2002,4,'#','',NULL,'',1,0,'F','0','0','system:apples:remove','#','admin','2025-04-01 12:40:09','',NULL,''),(2007,'VIEW导出',2002,5,'#','',NULL,'',1,0,'F','0','0','system:apples:export','#','admin','2025-04-01 12:40:09','',NULL,''),(2008,'订单详情',2000,1,'detail','system/detail/index',NULL,'',1,0,'C','0','0','system:detail:list','#','admin','2025-04-01 12:40:41','',NULL,'订单详情菜单'),(2009,'订单详情查询',2008,1,'#','',NULL,'',1,0,'F','0','0','system:detail:query','#','admin','2025-04-01 12:40:42','',NULL,''),(2010,'订单详情新增',2008,2,'#','',NULL,'',1,0,'F','0','0','system:detail:add','#','admin','2025-04-01 12:40:42','',NULL,''),(2011,'订单详情修改',2008,3,'#','',NULL,'',1,0,'F','0','0','system:detail:edit','#','admin','2025-04-01 12:40:42','',NULL,''),(2012,'订单详情删除',2008,4,'#','',NULL,'',1,0,'F','0','0','system:detail:remove','#','admin','2025-04-01 12:40:42','',NULL,''),(2013,'订单详情导出',2008,5,'#','',NULL,'',1,0,'F','0','0','system:detail:export','#','admin','2025-04-01 12:40:42','',NULL,''),(2014,'红富士苹果',2001,1,'hfs_apple','system/hfs_apple/index',NULL,'',1,0,'C','0','0','system:hfs_apple:list','#','admin','2025-04-01 12:40:53','',NULL,'红富士苹果菜单'),(2015,'红富士苹果查询',2014,1,'#','',NULL,'',1,0,'F','0','0','system:hfs_apple:query','#','admin','2025-04-01 12:40:54','',NULL,''),(2016,'红富士苹果新增',2014,2,'#','',NULL,'',1,0,'F','0','0','system:hfs_apple:add','#','admin','2025-04-01 12:40:54','',NULL,''),(2017,'红富士苹果修改',2014,3,'#','',NULL,'',1,0,'F','0','0','system:hfs_apple:edit','#','admin','2025-04-01 12:40:54','',NULL,''),(2018,'红富士苹果删除',2014,4,'#','',NULL,'',1,0,'F','0','0','system:hfs_apple:remove','#','admin','2025-04-01 12:40:54','',NULL,''),(2019,'红富士苹果导出',2014,5,'#','',NULL,'',1,0,'F','0','0','system:hfs_apple:export','#','admin','2025-04-01 12:40:54','',NULL,''),(2020,'购物车',2000,1,'cart','system/cart/index',NULL,'',1,0,'C','0','0','system:cart:list','#','admin','2025-04-01 12:41:04','',NULL,'购物车菜单'),(2021,'购物车查询',2020,1,'#','',NULL,'',1,0,'F','0','0','system:cart:query','#','admin','2025-04-01 12:41:05','',NULL,''),(2022,'购物车新增',2020,2,'#','',NULL,'',1,0,'F','0','0','system:cart:add','#','admin','2025-04-01 12:41:05','',NULL,''),(2023,'购物车修改',2020,3,'#','',NULL,'',1,0,'F','0','0','system:cart:edit','#','admin','2025-04-01 12:41:05','',NULL,''),(2024,'购物车删除',2020,4,'#','',NULL,'',1,0,'F','0','0','system:cart:remove','#','admin','2025-04-01 12:41:05','',NULL,''),(2025,'购物车导出',2020,5,'#','',NULL,'',1,0,'F','0','0','system:cart:export','#','admin','2025-04-01 12:41:05','',NULL,''),(2026,'青苹果',2001,1,'g_apple','system/g_apple/index',NULL,'',1,0,'C','0','0','system:g_apple:list','#','admin','2025-04-01 12:41:17','',NULL,'青苹果菜单'),(2027,'青苹果查询',2026,1,'#','',NULL,'',1,0,'F','0','0','system:g_apple:query','#','admin','2025-04-01 12:41:18','',NULL,''),(2028,'青苹果新增',2026,2,'#','',NULL,'',1,0,'F','0','0','system:g_apple:add','#','admin','2025-04-01 12:41:18','',NULL,''),(2029,'青苹果修改',2026,3,'#','',NULL,'',1,0,'F','0','0','system:g_apple:edit','#','admin','2025-04-01 12:41:18','',NULL,''),(2030,'青苹果删除',2026,4,'#','',NULL,'',1,0,'F','0','0','system:g_apple:remove','#','admin','2025-04-01 12:41:18','',NULL,''),(2031,'青苹果导出',2026,5,'#','',NULL,'',1,0,'F','0','0','system:g_apple:export','#','admin','2025-04-01 12:41:18','',NULL,''),(2032,'红星苹果',2001,1,'hx_apple','system/hx_apple/index',NULL,'',1,0,'C','0','0','system:hx_apple:list','#','admin','2025-04-01 12:42:50','',NULL,'红星苹果菜单'),(2033,'红星苹果查询',2032,1,'#','',NULL,'',1,0,'F','0','0','system:hx_apple:query','#','admin','2025-04-01 12:42:51','',NULL,''),(2034,'红星苹果新增',2032,2,'#','',NULL,'',1,0,'F','0','0','system:hx_apple:add','#','admin','2025-04-01 12:42:51','',NULL,''),(2035,'红星苹果修改',2032,3,'#','',NULL,'',1,0,'F','0','0','system:hx_apple:edit','#','admin','2025-04-01 12:42:51','',NULL,''),(2036,'红星苹果删除',2032,4,'#','',NULL,'',1,0,'F','0','0','system:hx_apple:remove','#','admin','2025-04-01 12:42:51','',NULL,''),(2037,'红星苹果导出',2032,5,'#','',NULL,'',1,0,'F','0','0','system:hx_apple:export','#','admin','2025-04-01 12:42:51','',NULL,''),(2038,'订单',2000,1,'orders','system/orders/index',NULL,'',1,0,'C','0','0','system:orders:list','#','admin','2025-04-01 12:43:00','',NULL,'订单菜单'),(2039,'订单查询',2038,1,'#','',NULL,'',1,0,'F','0','0','system:orders:query','#','admin','2025-04-01 12:43:00','',NULL,''),(2040,'订单新增',2038,2,'#','',NULL,'',1,0,'F','0','0','system:orders:add','#','admin','2025-04-01 12:43:00','',NULL,''),(2041,'订单修改',2038,3,'#','',NULL,'',1,0,'F','0','0','system:orders:edit','#','admin','2025-04-01 12:43:00','',NULL,''),(2042,'订单删除',2038,4,'#','',NULL,'',1,0,'F','0','0','system:orders:remove','#','admin','2025-04-01 12:43:00','',NULL,''),(2043,'订单导出',2038,5,'#','',NULL,'',1,0,'F','0','0','system:orders:export','#','admin','2025-04-01 12:43:00','',NULL,''),(2044,'评论',2000,1,'comment','system/comment/index',NULL,'',1,0,'C','0','0','system:comment:list','#','admin','2025-04-01 12:43:08','',NULL,'评论菜单'),(2045,'评论查询',2044,1,'#','',NULL,'',1,0,'F','0','0','system:comment:query','#','admin','2025-04-01 12:43:09','',NULL,''),(2046,'评论新增',2044,2,'#','',NULL,'',1,0,'F','0','0','system:comment:add','#','admin','2025-04-01 12:43:09','',NULL,''),(2047,'评论修改',2044,3,'#','',NULL,'',1,0,'F','0','0','system:comment:edit','#','admin','2025-04-01 12:43:09','',NULL,''),(2048,'评论删除',2044,4,'#','',NULL,'',1,0,'F','0','0','system:comment:remove','#','admin','2025-04-01 12:43:09','',NULL,''),(2049,'评论导出',2044,5,'#','',NULL,'',1,0,'F','0','0','system:comment:export','#','admin','2025-04-01 12:43:09','',NULL,''),(2050,'国光苹果',2001,1,'gg_apple','system/gg_apple/index',NULL,'',1,0,'C','0','0','system:gg_apple:list','#','admin','2025-04-01 12:43:17','',NULL,'国光苹果菜单'),(2051,'国光苹果查询',2050,1,'#','',NULL,'',1,0,'F','0','0','system:gg_apple:query','#','admin','2025-04-01 12:43:17','',NULL,''),(2052,'国光苹果新增',2050,2,'#','',NULL,'',1,0,'F','0','0','system:gg_apple:add','#','admin','2025-04-01 12:43:17','',NULL,''),(2053,'国光苹果修改',2050,3,'#','',NULL,'',1,0,'F','0','0','system:gg_apple:edit','#','admin','2025-04-01 12:43:17','',NULL,''),(2054,'国光苹果删除',2050,4,'#','',NULL,'',1,0,'F','0','0','system:gg_apple:remove','#','admin','2025-04-01 12:43:17','',NULL,''),(2055,'国光苹果导出',2050,5,'#','',NULL,'',1,0,'F','0','0','system:gg_apple:export','#','admin','2025-04-01 12:43:17','',NULL,''),(2056,'金冠苹果',2001,1,'jg_apple','system/jg_apple/index',NULL,'',1,0,'C','0','0','system:jg_apple:list','#','admin','2025-04-01 12:43:26','',NULL,'金冠苹果菜单'),(2057,'金冠苹果查询',2056,1,'#','',NULL,'',1,0,'F','0','0','system:jg_apple:query','#','admin','2025-04-01 12:43:26','',NULL,''),(2058,'金冠苹果新增',2056,2,'#','',NULL,'',1,0,'F','0','0','system:jg_apple:add','#','admin','2025-04-01 12:43:26','',NULL,''),(2059,'金冠苹果修改',2056,3,'#','',NULL,'',1,0,'F','0','0','system:jg_apple:edit','#','admin','2025-04-01 12:43:26','',NULL,''),(2060,'金冠苹果删除',2056,4,'#','',NULL,'',1,0,'F','0','0','system:jg_apple:remove','#','admin','2025-04-01 12:43:26','',NULL,''),(2061,'金冠苹果导出',2056,5,'#','',NULL,'',1,0,'F','0','0','system:jg_apple:export','#','admin','2025-04-01 12:43:26','',NULL,''),(2062,'价格计算规则',2000,1,'rule','system/rule/index',NULL,'',1,0,'C','0','0','system:rule:list','#','admin','2025-04-01 12:43:33','',NULL,'价格计算规则菜单'),(2063,'价格计算规则查询',2062,1,'#','',NULL,'',1,0,'F','0','0','system:rule:query','#','admin','2025-04-01 12:43:33','',NULL,''),(2064,'价格计算规则新增',2062,2,'#','',NULL,'',1,0,'F','0','0','system:rule:add','#','admin','2025-04-01 12:43:33','',NULL,''),(2065,'价格计算规则修改',2062,3,'#','',NULL,'',1,0,'F','0','0','system:rule:edit','#','admin','2025-04-01 12:43:33','',NULL,''),(2066,'价格计算规则删除',2062,4,'#','',NULL,'',1,0,'F','0','0','system:rule:remove','#','admin','2025-04-01 12:43:33','',NULL,''),(2067,'价格计算规则导出',2062,5,'#','',NULL,'',1,0,'F','0','0','system:rule:export','#','admin','2025-04-01 12:43:33','',NULL,''),(2068,'商品视图',2001,1,'products','system/products/index',NULL,'',1,0,'C','0','0','system:products:list','#','admin','2025-04-08 14:03:08','',NULL,'商品视图菜单'),(2069,'商品视图查询',2068,1,'#','',NULL,'',1,0,'F','0','0','system:products:query','#','admin','2025-04-08 14:03:08','',NULL,''),(2070,'商品视图新增',2068,2,'#','',NULL,'',1,0,'F','0','0','system:products:add','#','admin','2025-04-08 14:03:08','',NULL,''),(2071,'商品视图修改',2068,3,'#','',NULL,'',1,0,'F','0','0','system:products:edit','#','admin','2025-04-08 14:03:08','',NULL,''),(2072,'商品视图删除',2068,4,'#','',NULL,'',1,0,'F','0','0','system:products:remove','#','admin','2025-04-08 14:03:08','',NULL,''),(2073,'商品视图导出',2068,5,'#','',NULL,'',1,0,'F','0','0','system:products:export','#','admin','2025-04-08 14:03:08','',NULL,''),(2074,'购物车视图',2001,1,'carts','system/carts/index',NULL,'',1,0,'C','0','0','system:carts:list','#','admin','2025-04-08 14:03:16','',NULL,'购物车视图菜单'),(2075,'购物车视图查询',2074,1,'#','',NULL,'',1,0,'F','0','0','system:carts:query','#','admin','2025-04-08 14:03:16','',NULL,''),(2076,'购物车视图新增',2074,2,'#','',NULL,'',1,0,'F','0','0','system:carts:add','#','admin','2025-04-08 14:03:16','',NULL,''),(2077,'购物车视图修改',2074,3,'#','',NULL,'',1,0,'F','0','0','system:carts:edit','#','admin','2025-04-08 14:03:16','',NULL,''),(2078,'购物车视图删除',2074,4,'#','',NULL,'',1,0,'F','0','0','system:carts:remove','#','admin','2025-04-08 14:03:16','',NULL,''),(2079,'购物车视图导出',2074,5,'#','',NULL,'',1,0,'F','0','0','system:carts:export','#','admin','2025-04-08 14:03:16','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"orders,green_apple,guoguang_apple,hongxing_apple,jinguan_apple,order_detail,product_comment,shopping_cart,red_fuji_apple,all_apples\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:05:57',954),(101,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"price_rule\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:06:03',86),(102,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"平台管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"shop\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:06:40',46),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"icon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"product\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:07:06',44),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"rule\",\"className\":\"PriceRule\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":100,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:06:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductType\",\"columnComment\":\"产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）\",\"columnId\":101,\"columnName\":\"product_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:06:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnComment\":\"品质等级\",\"columnId\":102,\"columnName\":\"quality_level\",\"columnType\":\"enum(\'特级\',\'一级\',\'二级\',\'三级\')\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:06:03\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BasePrice\",\"columnComment\":\"基础价格\",\"columnId\":103,\"columnName\":\"base_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:06:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:07:41',70),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"apples\",\"className\":\"AllApples\",\"columns\":[{\"capJavaField\":\"ProductType\",\"columnId\":1,\"columnName\":\"product_type\",\"columnType\":\"varchar(14)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Id\",\"columnId\":2,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnId\":3,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnId\":4,\"columnName\":\"quality_level\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:07:54',58),(106,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"g_apple\",\"className\":\"GreenApple\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":12,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnComment\":\"品质等级\",\"columnId\":13,\"columnName\":\"quality_level\",\"columnType\":\"enum(\'特级\',\'一级\',\'二级\',\'三级\')\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Stock\",\"columnComment\":\"库存数量\",\"columnId\":14,\"columnName\":\"stock\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"ja','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:08:15',77),(107,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"gg_apple\",\"className\":\"GuoguangApple\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":24,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnComment\":\"品质等级\",\"columnId\":25,\"columnName\":\"quality_level\",\"columnType\":\"enum(\'特级\',\'一级\',\'二级\',\'三级\')\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Stock\",\"columnComment\":\"库存数量\",\"columnId\":26,\"columnName\":\"stock\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:08:35',64),(108,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"hx_apple\",\"className\":\"HongxingApple\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":35,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":36,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnComment\":\"品质等级\",\"columnId\":37,\"columnName\":\"quality_level\",\"columnType\":\"enum(\'特级\',\'一级\',\'二级\',\'三级\')\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Stock\",\"columnComment\":\"库存数量\",\"columnId\":38,\"columnName\":\"stock\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:08:49',92),(109,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"jg_apple\",\"className\":\"JinguanApple\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":47,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":48,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnComment\":\"品质等级\",\"columnId\":49,\"columnName\":\"quality_level\",\"columnType\":\"enum(\'特级\',\'一级\',\'二级\',\'三级\')\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Stock\",\"columnComment\":\"库存数量\",\"columnId\":50,\"columnName\":\"stock\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:09:01',91),(110,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"detail\",\"className\":\"OrderDetail\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单ID\",\"columnId\":60,\"columnName\":\"order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductType\",\"columnComment\":\"产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）\",\"columnId\":61,\"columnName\":\"product_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品ID\",\"columnId\":62,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInser','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:09:12',71),(111,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orders\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":66,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderNo\",\"columnComment\":\"订单编号\",\"columnId\":67,\"columnName\":\"order_no\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":68,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TotalAmount\",\"columnComment\":\"订单总金额\",\"columnId\":69,\"columnName\":\"total_amount\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"totalA','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:09:24',69),(112,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"comment\",\"className\":\"ProductComment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":73,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":74,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductType\",\"columnComment\":\"产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）\",\"columnId\":75,\"columnName\":\"product_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品ID\",\"columnId\":76,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:09:46',70),(113,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"hfs_apple\",\"className\":\"RedFujiApple\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":81,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":82,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QualityLevel\",\"columnComment\":\"品质等级\",\"columnId\":83,\"columnName\":\"quality_level\",\"columnType\":\"enum(\'特级\',\'一级\',\'二级\',\'三级\')\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qualityLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Stock\",\"columnComment\":\"库存数量\",\"columnId\":84,\"columnName\":\"stock\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:09:58',78),(114,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"cart\",\"className\":\"ShoppingCart\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":93,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":94,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductType\",\"columnComment\":\"产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）\",\"columnId\":95,\"columnName\":\"product_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品ID\",\"columnId\":96,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-01 12:05:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-01 12:10:08',61),(115,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"price_rule,all_apples,green_apple,guoguang_apple,hongxing_apple,jinguan_apple,order_detail,orders,product_comment,red_fuji_apple,shopping_cart\"}',NULL,0,NULL,'2025-04-01 12:10:21',615),(116,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-07 21:42:08\",\"params\":{},\"productId\":1,\"quantity\":1,\"userId\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ShoppingCartMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ShoppingCartMapper.insertShoppingCart-Inline\n### The error occurred while setting parameters\n### SQL: insert into shopping_cart          ( user_id,                          product_id,             quantity,             create_time )           values ( ?,                          ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n; Field \'product_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_type\' doesn\'t have a default value','2025-04-07 13:42:08',149),(117,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-07 21:42:48\",\"params\":{},\"productId\":1,\"quantity\":1,\"userId\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ShoppingCartMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ShoppingCartMapper.insertShoppingCart-Inline\n### The error occurred while setting parameters\n### SQL: insert into shopping_cart          ( user_id,                          product_id,             quantity,             create_time )           values ( ?,                          ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n; Field \'product_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_type\' doesn\'t have a default value','2025-04-07 13:42:48',33),(118,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',115),(119,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',115),(120,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',114),(121,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',115),(122,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',115),(123,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',114),(124,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',8),(125,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',8),(126,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:25\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:25',6),(127,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":5,\"updateTime\":\"2025-04-08 20:35:26\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:26',6),(128,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:26\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:27',263),(129,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:35:26\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:27',209),(130,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:26\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:27',201),(131,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:26\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:27',202),(132,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:27\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:27',7),(133,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:27\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:27',7),(134,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:27\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:28',53),(135,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":5,\"updateTime\":\"2025-04-08 20:35:28\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:28',21),(136,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:28\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:28',6),(137,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:28\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:28',11),(138,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:28\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:28',48),(139,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":5,\"updateTime\":\"2025-04-08 20:35:29\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:29',28),(140,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:29\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:29',727),(141,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:29\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:29',28),(142,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:29\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:29',37),(143,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:35:29\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:29',763),(144,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:35:32\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:33',1143),(145,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:35:32\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:33',1143),(146,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:35:32\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:33',1143),(147,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:35:32\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:35:33',1143),(148,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:40:08\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:08',10),(149,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:40:08\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:08',10),(150,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:40:09\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:09',8),(151,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:40:09\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:09',12),(152,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:40:09\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:09',10),(153,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:40:09\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:09',11),(154,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:40:30\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:30',18),(155,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:40:30\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:30',18),(156,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:40:30\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:30',4),(157,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:40:30\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:30',4),(158,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:40:30\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',3),(159,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:40:30\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',3),(160,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:40:31\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',10),(161,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:40:31\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',10),(162,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:40:31\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',6),(163,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:40:31\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',5),(164,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:40:31\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',5),(165,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:40:31\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:40:31',5),(166,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:44:53\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:44:53',21),(167,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:44:53\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:44:53',6),(168,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 20:44:53\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:44:53',5),(169,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 20:44:54\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:44:54',9),(170,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 20:44:54\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:44:54',6),(171,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 20:44:54\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 12:44:54',7),(172,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"carts,products\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 13:51:52',194),(173,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carts\",\"className\":\"Carts\",\"columns\":[{\"capJavaField\":\"CartId\",\"columnComment\":\"主键ID\",\"columnId\":106,\"columnName\":\"cart_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cartId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":107,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品ID\",\"columnId\":108,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductType\",\"columnComment\":\"产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）\",\"columnId\":109,\"columnName\":\"product_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 13:59:40',75),(174,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carts\",\"className\":\"Carts\",\"columns\":[{\"capJavaField\":\"CartId\",\"columnComment\":\"主键ID\",\"columnId\":106,\"columnName\":\"cart_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cartId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-04-08 13:59:40\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":107,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-04-08 13:59:40\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品ID\",\"columnId\":108,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-04-08 13:59:40\",\"usableColumn\":false},{\"capJavaField\":\"ProductType\",\"columnComment\":\"产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）\",\"columnId\":109,\"columnName\":\"product_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"cr','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 13:59:51',55),(175,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"products\",\"className\":\"Products\",\"columns\":[{\"capJavaField\":\"ProductType\",\"columnId\":117,\"columnName\":\"product_type\",\"columnType\":\"varchar(14)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnId\":118,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnId\":119,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImageUrl\",\"columnId\":120,\"columnName\":\"image_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 13:51:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 14:00:08',61),(176,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"carts,products\"}',NULL,0,NULL,'2025-04-08 14:00:14',401),(177,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 22:17:53\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:53',30),(178,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"updateTime\":\"2025-04-08 22:17:57\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:57',7),(179,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":2,\"updateTime\":\"2025-04-08 22:17:57\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:57',8),(180,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":3,\"updateTime\":\"2025-04-08 22:17:57\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:57',9),(181,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":4,\"updateTime\":\"2025-04-08 22:17:58\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:58',7),(182,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":5,\"updateTime\":\"2025-04-08 22:17:58\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:58',6),(183,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":6,\"updateTime\":\"2025-04-08 22:17:58\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:58',6),(184,'购物车',2,'com.ruoyi.system.controller.ShoppingCartController.edit()','PUT',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":7,\"updateTime\":\"2025-04-08 22:17:58\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-04-08 14:17:58',9),(185,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-08 22:46:29\",\"id\":2,\"params\":{},\"productId\":2,\"productType\":\"hfs_apple\",\"quantity\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 14:46:29',41),(186,'购物车视图',3,'com.ruoyi.system.controller.CartsController.remove()','DELETE',1,'admin','研发部门','/system/carts/2','127.0.0.1','内网IP','[2]',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: The target table carts of the DELETE is not updatable\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/CartsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.CartsMapper.deleteCartsByCartIds-Inline\n### The error occurred while setting parameters\n### SQL: delete from carts where cart_id in           (               ?          )\n### Cause: java.sql.SQLException: The target table carts of the DELETE is not updatable\n; uncategorized SQLException; SQL state [HY000]; error code [1288]; The target table carts of the DELETE is not updatable; nested exception is java.sql.SQLException: The target table carts of the DELETE is not updatable','2025-04-08 14:50:38',182),(187,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-08 22:51:23\",\"id\":3,\"params\":{},\"productId\":2,\"productType\":\"hfs_apple\",\"quantity\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 14:51:23',19),(188,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-08 23:08:49\",\"id\":4,\"params\":{},\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 15:08:49',99),(189,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'admin','研发部门','/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-08 23:11:27\",\"id\":5,\"params\":{},\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 15:11:27',80),(190,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"hxx\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"hxx\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 17:09:21',140),(191,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 17:09:21\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"hxx\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"hxx\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 17:09:26',35),(192,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-04-01 12:05:06\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2008,2009,2010,2011,2012,2013,2020,2021,2022,2023,2024,2025,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2001,2002,2003,2004,2005,2006,2007,2014,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 17:09:56',74),(193,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'hxx',NULL,'/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 01:11:00\",\"id\":6,\"params\":{},\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 17:11:00',32),(194,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 01:59:47\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'order_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/OrderDetailMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OrderDetailMapper.insertOrderDetail-Inline\n### The error occurred while setting parameters\n### SQL: insert into order_detail          ( create_time )           values ( ? )\n### Cause: java.sql.SQLException: Field \'order_id\' doesn\'t have a default value\n; Field \'order_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'order_id\' doesn\'t have a default value','2025-04-08 17:59:48',105),(195,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:01:19\",\"params\":{},\"totalAmount\":53,\"userId\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'order_no\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/OrdersMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\n### The error occurred while setting parameters\n### SQL: insert into orders          ( user_id,             total_amount,                          create_time )           values ( ?,             ?,                          ? )\n### Cause: java.sql.SQLException: Field \'order_no\' doesn\'t have a default value\n; Field \'order_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'order_no\' doesn\'t have a default value','2025-04-08 18:01:19',188),(196,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:02:14\",\"id\":1,\"orderNo\":\"ORD1744135334861272\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:02:14',42),(197,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:02:34\",\"id\":2,\"orderNo\":\"ORD1744135354603710\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:02:34',29),(198,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:04:20\",\"id\":3,\"orderNo\":\"ORD1744135460319763\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:04:20',32),(199,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:04:34\",\"id\":4,\"orderNo\":\"ORD1744135474902178\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:04:34',29),(200,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:04:45\",\"id\":5,\"orderNo\":\"ORD1744135485565642\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:04:45',14),(201,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:04:45\",\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'order_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/OrderDetailMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OrderDetailMapper.insertOrderDetail-Inline\n### The error occurred while setting parameters\n### SQL: insert into order_detail          ( product_type,             product_id,             quantity,             price,             create_time )           values ( ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'order_id\' doesn\'t have a default value\n; Field \'order_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'order_id\' doesn\'t have a default value','2025-04-08 18:04:45',12),(202,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:17:42\",\"id\":6,\"orderNo\":\"ORD1744136262529746\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:17:42',35),(203,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:17:42\",\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'order_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/OrderDetailMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OrderDetailMapper.insertOrderDetail-Inline\n### The error occurred while setting parameters\n### SQL: insert into order_detail          ( product_type,             product_id,             quantity,             price,             create_time )           values ( ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'order_id\' doesn\'t have a default value\n; Field \'order_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'order_id\' doesn\'t have a default value','2025-04-08 18:17:42',10),(204,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:19:27\",\"id\":7,\"orderNo\":\"ORD1744136367423634\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:19:27',39),(205,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:22:23\",\"id\":8,\"orderNo\":\"ORD1744136543490658\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:22:23',36),(206,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:22:23\",\"id\":1,\"orderId\":8,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:22:23',11),(207,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:22:23\",\"id\":2,\"orderId\":8,\"params\":{},\"price\":9,\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:22:23',24),(208,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:22:23\",\"id\":3,\"orderId\":8,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:22:23',14),(209,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:22:23\",\"id\":4,\"orderId\":8,\"params\":{},\"price\":12,\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:22:23',33),(210,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:23:34\",\"id\":9,\"orderNo\":\"ORD1744136614453892\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:23:34',48),(211,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:23:34\",\"id\":5,\"orderId\":9,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:23:34',17),(212,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:23:34\",\"id\":6,\"orderId\":9,\"params\":{},\"price\":9,\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:23:34',9),(213,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:23:34\",\"id\":7,\"orderId\":9,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:23:34',13),(214,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:23:34\",\"id\":8,\"orderId\":9,\"params\":{},\"price\":12,\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:23:34',16),(215,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:24:22\",\"id\":10,\"orderNo\":\"ORD1744136662689452\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:24:22',29),(216,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:24:22\",\"id\":9,\"orderId\":10,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:24:22',10),(217,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:24:22\",\"id\":10,\"orderId\":10,\"params\":{},\"price\":9,\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:24:22',10),(218,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:24:22\",\"id\":11,\"orderId\":10,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:24:22',10),(219,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 02:24:22\",\"id\":12,\"orderId\":10,\"params\":{},\"price\":12,\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-08 18:24:22',5),(220,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"1\",\"createTime\":\"2025-04-09 10:39:05\",\"params\":{},\"productId\":1,\"rating\":1,\"userId\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( user_id,                          product_id,             rating,             content,             create_time )           values ( ?,                          ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n; Field \'product_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_type\' doesn\'t have a default value','2025-04-09 02:39:05',47),(221,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"1\",\"createTime\":\"2025-04-09 10:39:09\",\"params\":{},\"productId\":1,\"rating\":1,\"userId\":1}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( user_id,                          product_id,             rating,             content,             create_time )           values ( ?,                          ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'product_type\' doesn\'t have a default value\n; Field \'product_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_type\' doesn\'t have a default value','2025-04-09 02:39:09',9),(222,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"111\",\"createTime\":\"2025-04-09 11:06:44\",\"params\":{},\"rating\":5}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( rating,             content,             create_time )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-09 03:06:44',145),(223,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"1\",\"createTime\":\"2025-04-09 11:07:32\",\"params\":{},\"rating\":5}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( rating,             content,             create_time )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-09 03:07:32',46),(224,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"1\",\"createTime\":\"2025-04-09 11:07:37\",\"params\":{},\"rating\":5}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( rating,             content,             create_time )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-09 03:07:37',30),(225,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"00\",\"createTime\":\"2025-04-09 11:07:51\",\"params\":{},\"rating\":5}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( rating,             content,             create_time )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-09 03:07:51',40),(226,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"8\",\"createTime\":\"2025-04-09 11:09:45\",\"params\":{},\"rating\":5}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( rating,             content,             create_time )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-09 03:09:45',43),(227,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"8\",\"createTime\":\"2025-04-09 11:09:50\",\"params\":{},\"rating\":5}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/Users/lingluo/Documents/project/hxx2/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.9.jar!/mapper/system/ProductCommentMapper.xml]\n### The error may involve com.ruoyi.system.mapper.ProductCommentMapper.insertProductComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into product_comment          ( rating,             content,             create_time )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-09 03:09:50',40),(228,'评论',1,'com.ruoyi.system.controller.ProductCommentController.add()','POST',1,'hxx',NULL,'/system/comment','127.0.0.1','内网IP','{\"content\":\"123\",\"createTime\":\"2025-04-09 11:12:59\",\"id\":1,\"params\":{},\"productId\":2,\"productType\":\"red_fuji_apple\",\"rating\":5,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 03:12:59',55),(229,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-09 14:40:48\",\"description\":\"产自平山县优质果园，果形良好，色泽红润，口感甜脆\",\"id\":2,\"params\":{},\"productName\":\"平山红富士一级果\",\"qualityLevel\":\"一级\",\"status\":\"0\",\"stock\":2000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 14:40:48\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 06:40:48',81),(230,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'hxx',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-04-01 12:05:06\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2001,2,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2008,2009,2010,2011,2012,2013,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2014,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"hxx\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 07:37:37',90),(231,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'hxx',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/04/09/b_b827b0d227094b63d45ad1cd63ebbc63_20250409162058A001.jpg\",\"code\":200}',0,NULL,'2025-04-09 08:20:58',456),(232,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'hxx',NULL,'/system/notice/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:21:24',14),(233,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'hxx',NULL,'/system/notice/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:21:25',11),(234,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形端正，色泽红润，口感甜脆\",\"id\":1,\"imageUrl\":\"/Users/lingluo/Documents/project/hxx2/mall/images/fruit/apple-1.jpg\",\"params\":{},\"productName\":\"平山红富士特级果\",\"qualityLevel\":\"特级\",\"status\":\"1\",\"stock\":1000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:24:33\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:24:34',21),(235,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形端正，色泽红润，口感甜脆\",\"id\":1,\"imageUrl\":\"images/fruit/apple-1.jpg\",\"params\":{},\"productName\":\"平山红富士特级果\",\"qualityLevel\":\"特级\",\"status\":\"1\",\"stock\":1000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:25:56\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:25:56',34),(236,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形端正，色泽红润，口感甜脆\",\"id\":1,\"imageUrl\":\"../images/fruit/apple-1.jpg\",\"params\":{},\"productName\":\"平山红富士特级果\",\"qualityLevel\":\"特级\",\"status\":\"1\",\"stock\":1000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:26:20\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:26:20',19),(237,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形端正，色泽红润，口感甜脆\",\"id\":1,\"imageUrl\":\"../images/fruit/hfs1.jpg\",\"params\":{},\"productName\":\"平山红富士特级果\",\"qualityLevel\":\"特级\",\"status\":\"1\",\"stock\":1000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:45:10\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:45:10',29),(238,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-09 14:40:48\",\"description\":\"产自平山县优质果园，果形良好，色泽红润，口感甜脆\",\"id\":2,\"imageUrl\":\"../images/fruit/hfs2.jpg\",\"params\":{},\"productName\":\"平山红富士一级果\",\"qualityLevel\":\"一级\",\"status\":\"0\",\"stock\":2000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:45:20\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:45:20',28),(239,'红富士苹果',2,'com.ruoyi.system.controller.RedFujiAppleController.edit()','PUT',1,'hxx',NULL,'/system/hfs_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形正常，色泽红润，口感良好\",\"id\":3,\"imageUrl\":\"../images/fruit/hfs3.jpg\",\"params\":{},\"productName\":\"平山红富士二级果\",\"qualityLevel\":\"二级\",\"status\":\"1\",\"stock\":3000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:45:31\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:45:31',14),(240,'青苹果',2,'com.ruoyi.system.controller.GreenAppleController.edit()','PUT',1,'hxx',NULL,'/system/g_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形端正，色泽青翠，口感清脆\",\"id\":1,\"imageUrl\":\"../images/fruit/q1.jpg\",\"params\":{},\"productName\":\"平山青苹果特级果\",\"qualityLevel\":\"特级\",\"status\":\"1\",\"stock\":800,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:45:40\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:45:40',33),(241,'国光苹果',2,'com.ruoyi.system.controller.GuoguangAppleController.edit()','PUT',1,'hxx',NULL,'/system/gg_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形端正，色泽金黄，口感香甜\",\"id\":1,\"imageUrl\":\"../images/fruit/gg1.jpg\",\"params\":{},\"productName\":\"平山国光特级果\",\"qualityLevel\":\"特级\",\"status\":\"1\",\"stock\":600,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:45:49\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:45:49',24),(242,'国光苹果',2,'com.ruoyi.system.controller.GuoguangAppleController.edit()','PUT',1,'hxx',NULL,'/system/gg_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形良好，色泽金黄，口感香甜\",\"id\":2,\"imageUrl\":\"../images/fruit/gg2.jpg\",\"params\":{},\"productName\":\"平山国光一级果\",\"qualityLevel\":\"一级\",\"status\":\"1\",\"stock\":1200,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:45:56\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:45:56',14),(243,'国光苹果',2,'com.ruoyi.system.controller.GuoguangAppleController.edit()','PUT',1,'hxx',NULL,'/system/gg_apple','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2025-04-01 12:05:44\",\"description\":\"产自平山县优质果园，果形正常，色泽金黄，口感良好\",\"id\":3,\"imageUrl\":\"../images/fruit/gg3.jpg\",\"params\":{},\"productName\":\"平山国光二级果\",\"qualityLevel\":\"二级\",\"status\":\"1\",\"stock\":2000,\"updateBy\":\"\",\"updateTime\":\"2025-04-09 16:46:04\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:46:04',21),(244,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-04-01 12:05:06\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2001,2,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2008,2009,2010,2011,2012,2013,2020,2021,2022,2023,2024,2025,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2014,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:47:48',63),(245,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-04-01 12:05:06\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2001,2,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2008,2009,2010,2011,2012,2013,2020,2021,2022,2023,2024,2025,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2014,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:17',47),(246,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-04-01 12:05:06\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2008,2009,2010,2011,2012,2013,2020,2021,2022,2023,2024,2025,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2001,2002,2003,2004,2005,2006,2007,2014,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:24',51),(247,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:48:47\",\"id\":11,\"orderNo\":\"ORD1744188526969253\",\"params\":{},\"totalAmount\":53,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:47',72),(248,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:48:47\",\"id\":13,\"orderId\":10,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:47',8),(249,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:48:47\",\"id\":14,\"orderId\":10,\"params\":{},\"price\":9,\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:47',9),(250,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:48:47\",\"id\":15,\"orderId\":10,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:47',10),(251,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:48:47\",\"id\":16,\"orderId\":10,\"params\":{},\"price\":12,\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:48:47',10),(252,'购物车',1,'com.ruoyi.system.controller.ShoppingCartController.add()','POST',1,'hxx',NULL,'/system/cart','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:43\",\"id\":7,\"params\":{},\"productId\":1,\"productType\":\"green_apple\",\"quantity\":1,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:43',55),(253,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:50\",\"id\":12,\"orderNo\":\"ORD1744188590789504\",\"params\":{},\"totalAmount\":66,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:50',44),(254,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:50\",\"id\":17,\"orderId\":10,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:50',7),(255,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:50\",\"id\":18,\"orderId\":10,\"params\":{},\"price\":9,\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:50',9),(256,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:51\",\"id\":19,\"orderId\":10,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:51',10),(257,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:51\",\"id\":20,\"orderId\":10,\"params\":{},\"price\":12,\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:51',22),(258,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:49:51\",\"id\":21,\"orderId\":10,\"params\":{},\"price\":13,\"productId\":1,\"productType\":\"green_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:49:51',14),(259,'订单',1,'com.ruoyi.system.controller.OrdersController.add()','POST',1,'hxx',NULL,'/system/orders','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:58:44\",\"id\":13,\"orderNo\":\"ORD1744189124754418\",\"params\":{},\"totalAmount\":66,\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:58:44',29),(260,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:58:44\",\"id\":22,\"orderId\":13,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:58:44',12),(261,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:58:44\",\"id\":23,\"orderId\":13,\"params\":{},\"price\":9,\"productId\":3,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:58:44',5),(262,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:58:44\",\"id\":24,\"orderId\":13,\"params\":{},\"price\":16,\"productId\":1,\"productType\":\"hongxing_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:58:44',5),(263,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:58:44\",\"id\":25,\"orderId\":13,\"params\":{},\"price\":12,\"productId\":2,\"productType\":\"red_fuji_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:58:44',5),(264,'订单详情',1,'com.ruoyi.system.controller.OrderDetailController.add()','POST',1,'hxx',NULL,'/system/detail','127.0.0.1','内网IP','{\"createTime\":\"2025-04-09 16:58:44\",\"id\":26,\"orderId\":13,\"params\":{},\"price\":13,\"productId\":1,\"productType\":\"green_apple\",\"quantity\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-09 08:58:44',6);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-04-01 12:05:06','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-04-01 12:05:06','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-04-01 12:05:06','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-04-01 12:05:06','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-04-01 12:05:06','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-04-01 12:05:06','admin','2025-04-09 08:48:23','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,103),(2,104),(2,107),(2,108),(2,111),(2,112),(2,113),(2,114),(2,500),(2,501),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,2000),(2,2001),(2,2002),(2,2003),(2,2004),(2,2005),(2,2006),(2,2007),(2,2008),(2,2009),(2,2010),(2,2011),(2,2012),(2,2013),(2,2014),(2,2015),(2,2016),(2,2017),(2,2018),(2,2019),(2,2020),(2,2021),(2,2022),(2,2023),(2,2024),(2,2025),(2,2026),(2,2027),(2,2028),(2,2029),(2,2030),(2,2031),(2,2032),(2,2033),(2,2034),(2,2035),(2,2036),(2,2037),(2,2038),(2,2039),(2,2040),(2,2041),(2,2042),(2,2043),(2,2044),(2,2045),(2,2046),(2,2047),(2,2048),(2,2049),(2,2050),(2,2051),(2,2052),(2,2053),(2,2054),(2,2055),(2,2056),(2,2057),(2,2058),(2,2059),(2,2060),(2,2061),(2,2062),(2,2063),(2,2064),(2,2065),(2,2066),(2,2067),(2,2068),(2,2069),(2,2070),(2,2071),(2,2072),(2,2073),(2,2074),(2,2075),(2,2076),(2,2077),(2,2078),(2,2079);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-04-09 16:47:37','admin','2025-04-01 12:05:06','','2025-04-09 08:47:37','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-04-01 12:05:06','admin','2025-04-01 12:05:06','',NULL,'测试员'),(100,NULL,'hxx','hxx','00','','','0','/profile/avatar/2025/04/09/b_b827b0d227094b63d45ad1cd63ebbc63_20250409162058A001.jpg','$2a$10$3yKfcUhUrvqO1R95SriXtOA9OG6Y9.qYiXsHCZPhGw/IhxLEsr5Ju','0','0','127.0.0.1','2025-04-09 16:58:37','admin','2025-04-08 17:09:21','admin','2025-04-09 08:58:37',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_apples`
--

/*!50001 DROP VIEW IF EXISTS `all_apples`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `all_apples` AS select 'red_fuji_apple' AS `product_type`,`red_fuji_apple`.`id` AS `id`,`red_fuji_apple`.`product_name` AS `product_name`,`red_fuji_apple`.`quality_level` AS `quality_level`,`red_fuji_apple`.`stock` AS `stock`,`red_fuji_apple`.`description` AS `description`,`red_fuji_apple`.`image_url` AS `image_url`,`red_fuji_apple`.`status` AS `status`,`red_fuji_apple`.`create_time` AS `create_time`,`red_fuji_apple`.`update_time` AS `update_time` from `red_fuji_apple` union all select 'green_apple' AS `product_type`,`green_apple`.`id` AS `id`,`green_apple`.`product_name` AS `product_name`,`green_apple`.`quality_level` AS `quality_level`,`green_apple`.`stock` AS `stock`,`green_apple`.`description` AS `description`,`green_apple`.`image_url` AS `image_url`,`green_apple`.`status` AS `status`,`green_apple`.`create_time` AS `create_time`,`green_apple`.`update_time` AS `update_time` from `green_apple` union all select 'guoguang_apple' AS `product_type`,`guoguang_apple`.`id` AS `id`,`guoguang_apple`.`product_name` AS `product_name`,`guoguang_apple`.`quality_level` AS `quality_level`,`guoguang_apple`.`stock` AS `stock`,`guoguang_apple`.`description` AS `description`,`guoguang_apple`.`image_url` AS `image_url`,`guoguang_apple`.`status` AS `status`,`guoguang_apple`.`create_time` AS `create_time`,`guoguang_apple`.`update_time` AS `update_time` from `guoguang_apple` union all select 'hongxing_apple' AS `product_type`,`hongxing_apple`.`id` AS `id`,`hongxing_apple`.`product_name` AS `product_name`,`hongxing_apple`.`quality_level` AS `quality_level`,`hongxing_apple`.`stock` AS `stock`,`hongxing_apple`.`description` AS `description`,`hongxing_apple`.`image_url` AS `image_url`,`hongxing_apple`.`status` AS `status`,`hongxing_apple`.`create_time` AS `create_time`,`hongxing_apple`.`update_time` AS `update_time` from `hongxing_apple` union all select 'jinguan_apple' AS `product_type`,`jinguan_apple`.`id` AS `id`,`jinguan_apple`.`product_name` AS `product_name`,`jinguan_apple`.`quality_level` AS `quality_level`,`jinguan_apple`.`stock` AS `stock`,`jinguan_apple`.`description` AS `description`,`jinguan_apple`.`image_url` AS `image_url`,`jinguan_apple`.`status` AS `status`,`jinguan_apple`.`create_time` AS `create_time`,`jinguan_apple`.`update_time` AS `update_time` from `jinguan_apple` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `carts`
--

/*!50001 DROP VIEW IF EXISTS `carts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `carts` AS select `c`.`id` AS `cart_id`,`c`.`user_id` AS `user_id`,`c`.`product_id` AS `product_id`,`c`.`product_type` AS `product_type`,`c`.`quantity` AS `quantity`,`ap`.`product_name` AS `product_name`,`ap`.`image_url` AS `image_url`,`ap`.`description` AS `description`,`ap`.`quality_level` AS `quality_level`,`ap`.`price` AS `price`,(`ap`.`price` * `c`.`quantity`) AS `total_price` from (`shopping_cart` `c` left join `products` `ap` on(((`c`.`product_id` = `ap`.`product_id`) and (`c`.`product_type` = `ap`.`product_type`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products`
--

/*!50001 DROP VIEW IF EXISTS `products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `products` AS select 'red_fuji_apple' AS `product_type`,`hfs`.`id` AS `product_id`,`hfs`.`product_name` AS `product_name`,`hfs`.`image_url` AS `image_url`,`hfs`.`description` AS `description`,`hfs`.`quality_level` AS `quality_level`,`hfs`.`stock` AS `stock`,`hfs`.`status` AS `status`,`pr`.`base_price` AS `price` from (`red_fuji_apple` `hfs` left join `price_rule` `pr` on(((`pr`.`product_type` = 'red_fuji_apple') and (`pr`.`quality_level` = `hfs`.`quality_level`)))) union all select 'hongxing_apple' AS `product_type`,`hx`.`id` AS `product_id`,`hx`.`product_name` AS `product_name`,`hx`.`image_url` AS `image_url`,`hx`.`description` AS `description`,`hx`.`quality_level` AS `quality_level`,`hx`.`stock` AS `stock`,`hx`.`status` AS `status`,`pr`.`base_price` AS `price` from (`hongxing_apple` `hx` left join `price_rule` `pr` on(((`pr`.`product_type` = 'hongxing_apple') and (`pr`.`quality_level` = `hx`.`quality_level`)))) union all select 'guoguang_apple' AS `product_type`,`gg`.`id` AS `product_id`,`gg`.`product_name` AS `product_name`,`gg`.`image_url` AS `image_url`,`gg`.`description` AS `description`,`gg`.`quality_level` AS `quality_level`,`gg`.`stock` AS `stock`,`gg`.`status` AS `status`,`pr`.`base_price` AS `price` from (`guoguang_apple` `gg` left join `price_rule` `pr` on(((`pr`.`product_type` = 'guoguang_apple') and (`pr`.`quality_level` = `gg`.`quality_level`)))) union all select 'jinguan_apple' AS `product_type`,`jg`.`id` AS `product_id`,`jg`.`product_name` AS `product_name`,`jg`.`image_url` AS `image_url`,`jg`.`description` AS `description`,`jg`.`quality_level` AS `quality_level`,`jg`.`stock` AS `stock`,`jg`.`status` AS `status`,`pr`.`base_price` AS `price` from (`jinguan_apple` `jg` left join `price_rule` `pr` on(((`pr`.`product_type` = 'jinguan_apple') and (`pr`.`quality_level` = `jg`.`quality_level`)))) union all select 'green_apple' AS `product_type`,`g`.`id` AS `product_id`,`g`.`product_name` AS `product_name`,`g`.`image_url` AS `image_url`,`g`.`description` AS `description`,`g`.`quality_level` AS `quality_level`,`g`.`stock` AS `stock`,`g`.`status` AS `status`,`pr`.`base_price` AS `price` from (`green_apple` `g` left join `price_rule` `pr` on(((`pr`.`product_type` = 'green_apple') and (`pr`.`quality_level` = `g`.`quality_level`)))) */;
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

-- Dump completed on 2025-04-09 17:00:06
