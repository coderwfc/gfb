/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - waimai_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`waimai_project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `waimai_project`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `area_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`a_id`,`name`,`tel`,`area_code`,`address`,`province`,`city`,`county`,`u_id`) values (1,'lky1','12345612345','130105','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(2,'lky2','12312312312','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(3,'lky3','12312313212','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(4,'lky4','12312313212','140214','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(5,'lky5','12312313212','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(6,'lky6','12312312312','110102','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(7,'lky666','12312312312','140105','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(8,'lky777','12312312312','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(9,'lky333','12312312312','130102','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(10,'lky111','12312313212','120102','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(11,'lky000','12312313212','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(12,'小黄鸭','15179542036','360902','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',6),(13,'cyy','18565432345','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(14,'cyy','18565432345','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(15,'cyy','18565432345','110101','重庆市巴南区理工大学666','重庆市','重庆市','巴南区',1),(16,'whh','12345678912','500113','重庆市巴南区重庆理工大学','重庆市','重庆市','巴南区',10);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `s_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `categoryName` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`c_id`,`category_name`,`s_id`) values (1,'招牌炸鸡',1),(2,'主食 卷/堡',1),(3,'欢乐时光',1),(4,'单品汉堡',2),(5,'甜品小吃',2),(6,'饮品系列',2),(7,'现磨咖啡',2),(8,'饮品',1),(9,'特色主食',3),(10,'套餐',3),(11,'美味小食',3),(12,'精选配餐',3),(13,'甜点与饮料',3),(14,'冰淇淋与茶',4),(15,'奶茶&特饮',4),(16,'奶盖&原味茶',4),(17,'真果茶系列',4);

/*Table structure for table `delivery` */

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `total_num` int(11) NOT NULL DEFAULT '0',
  `number` varchar(255) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`d_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `delivery` */

insert  into `delivery`(`d_id`,`name`,`phone`,`total_num`,`number`,`stat`) values (1,'lky6','15179510163',9,'123123123',1),(3,'whh','19946860816',14,'123',1),(4,'wfc','15922776924',0,'123456',1),(5,'hhh','12345678925',2,'023',1),(6,'www','12345678921',2,'123023',1);

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) NOT NULL,
  `good_pic` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `c_id` int(11) NOT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `s_id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `goodName` (`good_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `good` */

insert  into `good`(`g_id`,`good_name`,`good_pic`,`price`,`c_id`,`sales`,`s_id`,`desc`) values (1,'双层鳕鱼堡','/upload/华莱士-双层鳕鱼堡_20210901171704.jpg','88989',2,4,1,'华莱士-双层鳕鱼堡'),(2,'香辣鸡腿堡','/upload/华莱士-香辣鸡腿堡_20210901171554.jpg','8',2,1,1,'香辣、香脆汉堡'),(3,'牛肉汉堡','/upload/华莱士-牛肉堡_20210901171624.jpg','10',2,0,1,'丰富多汁牛肉汉堡'),(4,'香辣鸡翅','/upload/华莱士-香辣鸡翅_20210901171744.jpg','8',3,4,1,'华莱士-香辣鸡翅'),(5,'双层红云热辣堡','/upload/华莱士-双层红云热辣堡_20210901171830.jpg','10',2,0,1,'华莱士-双层红云热辣堡'),(6,'烤翅','/upload/华莱士-烤翅_20210901171917.jpg','8',3,2,1,'华莱士-烤翅'),(7,'薯条','/upload/华莱士-薯条_20210901171946.jpg','12',3,0,1,'香脆薯条'),(8,'芝芝安格斯','/upload/芝芝安格斯_20210901144807.png','32',4,4,2,'重度芝士爱好者'),(9,'大嘴安格斯','/upload/大嘴安格斯_20210901145424.png','40',4,3,2,'满满肉感'),(10,'安格斯厚牛堡','/upload/安格斯厚牛堡-原味-天椒_20210901145603.png','38',4,0,2,'独家秘制'),(11,'狠霸王鸡堡','/upload/狠霸王鸡堡_20210901145652.png','26',4,3,2,'霸气鸡堡'),(12,'狠霸王牛堡','/upload/狠霸王牛堡_20210901145759.png','26',4,0,2,'霸气牛堡'),(13,'狠霸王鱼堡','/upload/狠霸王鱼堡_20210901145837.png','26',4,0,2,'霸气鱼堡'),(14,'薯霸王(中)','/upload/薯霸王_20210901145951.png','14',5,2,2,'挑战3/8黄金切割'),(15,'王道川蜀鸡翅','/upload/王道川蜀鸡翅_20210901150110.png','13.5',5,0,2,'椒麻鲜香'),(16,'王道椒香鸡腿','/upload/王道椒香鸡腿_20210901150258.png','13.5',5,0,2,'香味四溢'),(17,'可口可乐','/upload/可口可乐_20210901150358.png','11',6,2,2,'配直饮杯盖'),(18,'柠檬风味红茶','/upload/柠檬风味红茶_20210901150438.png','12',6,2,2,'柠檬风味红茶'),(19,'卡布奇诺 (热)','/upload/卡布奇诺 (热)_20210901150538.png','19',7,2,2,'甄选咖啡'),(20,'美式 (热/冰)','/upload/美式_20210901150611.png','17',7,1,2,'甄选咖啡'),(21,'牛奶','/upload/牛奶_20210901172142.jpg','5',8,3,1,'鲜香牛奶'),(22,'密汁手扒鸡','/upload/华莱士-密汁手扒鸡_20210905134524.jpg','22',1,8,1,'华莱士-密汁手扒鸡'),(23,'辣辣辣条半鸡','/upload/华莱士-辣辣辣条半鸡_20210905134603.jpg','22',1,3,1,'华莱士-辣辣辣条半鸡'),(24,'脆鸡八分堡','/upload/kfc-脆鸡八分堡_20210905135706.jpg','12',9,0,3,'kfc-脆鸡八分堡'),(25,'劲脆鸡腿堡','/upload/kfc-劲脆鸡腿堡_20210905135730.jpg','12',9,0,3,'kfc-劲脆鸡腿堡'),(29,'kfc-香辣鸡腿堡','/upload/kfc-香辣鸡腿堡_20210905140138.jpg','12',9,0,3,'kfc-香辣鸡腿堡'),(30,'kfc-香辣鸡翅','/upload/kfc-香辣鸡翅_20210905140205.jpg','8',11,0,3,'kfc-香辣鸡翅'),(31,'kfc-吮指原味鸡','/upload/kfc-吮指原味鸡_20210905140231.jpg','8',11,0,3,'kfc-吮指原味鸡'),(32,'kfc-芙蓉荟萃汤','/upload/kfc-芙蓉荟萃汤_20210905140310.jpg','15',12,0,3,'kfc-芙蓉荟萃汤'),(33,'kfc-菌菇四宝汤','/upload/kfc-菌菇四宝汤_20210905140342.jpg','15',12,0,3,'kfc-菌菇四宝汤'),(34,'kfc-香甜玉米棒','/upload/kfc-香甜玉米棒_20210905140357.jpg','5',12,0,3,'kfc-香甜玉米棒'),(35,'kfc-奥利奥花淇淋','/upload/kfc-奥利奥花淇淋_20210905140431.jpg','12',13,0,3,'kfc-奥利奥花淇淋'),(36,'kfc-葡式蛋挞(经典)','/upload/kfc-葡式蛋挞(经典)_20210905140531.jpg','5',13,0,3,'kfc-葡式蛋挞(经'),(37,'kfc-雪碧','/upload/雪碧_20210905140918.png','8',13,0,3,'kfc-雪碧'),(38,'kfc-脆鸡八分堡套餐','/upload/kfc-脆鸡八分堡套餐_20210905170416.jpg','25',10,0,3,'kfc-脆鸡八分堡套'),(39,'kfc-劲辣鸡腿堡套餐','/upload/kfc-劲辣鸡腿堡套餐_20210905170434.jpg','25',10,0,3,'kfc-劲辣鸡腿堡套'),(40,'奥利奥味雪王大圣代','/upload/蜜雪冰城-奥利奥味雪王大圣代_20210905193147.jpg','6',14,1,4,'蜜雪冰城-奥利奥味雪'),(41,'草莓味雪王大圣代','/upload/蜜雪冰城-草莓味雪王大圣代_20210905193404.jpg','6',14,0,4,'蜜雪冰城-草莓味雪王'),(42,'蓝莓味雪王大圣代','/upload/蓝莓味雪王大圣代_20210905193433.jpg','6',14,0,4,'蓝莓味雪王大圣代'),(43,'棒打鲜橙','/upload/蜜雪冰城-棒打鲜橙_20210905193506.jpg','7',17,1,4,'蜜雪冰城-棒打鲜橙'),(44,'冰淇淋红茶','/upload/蜜雪冰城-冰淇淋红茶_20210905193556.jpg','6',14,0,4,'蜜雪冰城-冰淇淋红茶'),(45,'红豆奶茶','/upload/蜜雪冰城-红豆奶茶_20210905193634.jpg','7',15,0,4,'蜜雪冰城-红豆奶茶'),(46,'冰鲜柠檬水','/upload/蜜雪冰城-冰鲜柠檬水_20210905193711.jpg','5',17,1,4,'蜜雪冰城-冰鲜柠檬水'),(47,'吃土摇摇奶昔','/upload/蜜雪冰城-吃土摇摇奶昔_20210905193738.jpg','7',14,0,4,'蜜雪冰城-吃土摇摇奶'),(48,'黑糖珍珠奶茶','/upload/蜜雪冰城-黑糖珍珠奶茶_20210905193802.jpg','7',15,0,4,'蜜雪冰城-黑糖珍珠奶'),(49,'红茶','/upload/蜜雪冰城-红茶_20210905193912.jpg','6',16,1,4,'蜜雪冰城-红茶'),(50,'蓝莓摇摇奶昔','/upload/蜜雪冰城-蓝莓摇摇奶昔_20210905193951.jpg','7',14,0,4,'蜜雪冰城-蓝莓摇摇奶'),(51,'马来西亚白咖啡','/upload/蜜雪冰城-马来西亚白咖啡_20210905194051.jpg','7',16,0,4,'马来西亚白咖啡');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_Number` varchar(255) NOT NULL,
  `total_price` decimal(11,2) NOT NULL,
  `u_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL COMMENT '下单时间',
  `order_Stat` int(11) NOT NULL DEFAULT '1',
  `good_total_price` decimal(10,2) NOT NULL,
  `delivery_price` varchar(255) NOT NULL,
  `d_id` int(11) DEFAULT NULL,
  `order_time` varchar(255) DEFAULT NULL COMMENT '接单时间',
  `pick_time` varchar(255) DEFAULT NULL COMMENT '取货时间',
  `arrive_time` varchar(255) DEFAULT NULL COMMENT '送达时间',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`o_id`,`order_Number`,`total_price`,`u_id`,`s_id`,`a_id`,`create_time`,`order_Stat`,`good_total_price`,`delivery_price`,`d_id`,`order_time`,`pick_time`,`arrive_time`) values (1,'DM202109031528564240001','56.00',1,2,1,'2022-09-20 15:28:56',4,'51.00','5',1,'2022-09-20 15:30:39','2022-09-20 15:31:02','2022-09-20 15:33:08'),(2,'DM202109031610031250001','34.00',1,1,2,'2022-09-20 16:10:03',4,'29.00','5',1,'2022-09-20 16:10:42','2022-09-20 16:12:10','2022-09-20 20:04:12'),(3,'DM202109031611239150001','49.00',1,2,3,'2022-09-20 16:11:23',4,'44.00','5',1,'2022-09-20 16:11:45','2022-09-20 16:24:54','2022-09-20 09:44:30'),(4,'DM202109031638029290001','62.00',1,2,5,'2022-09-20 16:38:02',4,'57.00','5',1,'2022-09-20 16:38:07','2022-09-20 16:38:15','2022-09-20 09:44:35'),(18,'DM2022092900161670400010','42.00',10,2,16,'2022-09-29 00:16:16',4,'32.00','10',3,'2022-09-29 00:19:39','2022-09-29 00:20:27','2022-09-29 00:20:35'),(19,'DM2022092907420377500010','64.00',10,2,16,'2022-09-29 07:42:03',4,'54.00','10',3,'2022-09-29 07:43:03','2022-09-29 08:02:23','2022-09-29 08:02:36'),(20,'DM2022092917092412300010','42.00',10,2,16,'2022-09-29 17:09:24',4,'32.00','10',3,'2022-09-29 17:30:52','2022-09-29 19:55:23','2022-09-29 20:33:49'),(21,'DM2022092917314360100010','29.00',10,2,16,'2022-09-29 17:31:43',4,'19.00','10',3,'2022-09-29 17:36:23','2022-09-29 19:55:20','2022-09-29 20:33:52'),(22,'DM2022092917365701900010','36.00',10,2,16,'2022-09-29 17:36:57',4,'26.00','10',3,'2022-09-29 17:44:39','2022-09-29 19:55:32','2022-09-29 20:33:55'),(23,'DM2022092917445240800010','36.00',10,2,16,'2022-09-29 17:44:52',4,'26.00','10',3,'2022-09-29 17:45:43','2022-09-29 19:55:29','2022-09-29 20:33:58'),(24,'DM2022092917531351900010','21.00',10,2,16,'2022-09-29 17:53:13',4,'11.00','10',3,'2022-09-29 18:00:48','2022-09-29 19:55:26','2022-09-29 20:34:02'),(25,'DM2022092918011333700010','42.00',10,2,16,'2022-09-29 18:01:13',1,'32.00','10',NULL,NULL,NULL,NULL),(26,'DM2022092918015657900010','42.00',10,2,16,'2022-09-29 18:01:56',1,'32.00','10',NULL,NULL,NULL,NULL),(27,'DM2022092920081618400010','26.00',10,1,16,'2022-09-29 20:08:16',4,'22.00','4',3,'2022-09-29 20:08:40','2022-09-29 20:09:08','2022-09-29 20:34:06'),(28,'DM2022092920272708800010','26.00',10,1,16,'2022-09-29 20:27:27',4,'22.00','4',3,'2022-09-29 20:27:43','2022-09-29 20:28:07','2022-09-29 20:34:10'),(29,'DM2022092920330403000010','26.00',10,1,16,'2022-09-29 20:33:04',4,'22.00','4',3,'2022-09-29 20:33:20','2022-09-29 20:33:33','2022-09-29 20:34:16'),(30,'DM2022092921151653000010','26.00',10,1,16,'2022-09-29 21:15:16',4,'22.00','4',3,'2022-09-29 21:15:55','2022-09-29 21:16:03','2022-09-29 21:21:51'),(31,'DM2022092921244355800010','26.00',10,1,16,'2022-09-29 21:24:43',4,'22.00','4',3,'2022-09-29 21:24:57','2022-09-29 21:25:11','2022-09-29 21:25:18'),(32,'DM2022092922360649800010','26.00',10,1,16,'2022-09-29 22:36:06',4,'22.00','4',3,'2022-09-29 22:36:12','2022-09-29 22:36:20','2022-09-30 11:20:47'),(33,'DM2022092922374327300010','26.00',10,1,16,'2022-09-29 22:37:43',3,'22.00','4',NULL,'2022-09-29 22:37:54','2022-09-29 22:38:37',NULL),(34,'DM2022093011225531800010','26.00',10,1,16,'2022-09-30 11:22:55',4,'22.00','4',3,'2022-09-30 11:23:09','2022-09-30 11:23:16','2022-09-30 11:23:27'),(35,'DM2022093011455421100010','26.00',10,1,16,'2022-09-30 11:45:54',4,'22.00','4',5,'2022-09-30 11:46:17','2022-09-30 11:46:25','2022-09-30 11:46:38'),(36,'DM2022093011482802900010','26.00',10,1,16,'2022-09-30 11:48:28',4,'22.00','4',5,'2022-09-30 11:48:35','2022-09-30 11:48:44','2022-09-30 11:48:46'),(37,'DM2022093012513654700010','26.00',10,1,16,'2022-09-30 12:51:36',4,'22.00','4',6,'2022-09-30 12:51:44','2022-09-30 12:51:53','2022-09-30 12:51:57'),(38,'DM2022093012580937400010','26.00',10,1,16,'2022-09-30 12:58:09',4,'22.00','4',6,'2022-09-30 12:58:23','2022-09-30 12:58:33','2022-09-30 12:58:42');

/*Table structure for table `order_good` */

DROP TABLE IF EXISTS `order_good`;

CREATE TABLE `order_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Data for the table `order_good` */

insert  into `order_good`(`id`,`o_id`,`g_id`,`count`) values (1,1,9,1),(2,1,17,1),(3,2,1,1),(4,2,4,1),(5,2,6,1),(6,2,21,1),(7,3,8,1),(8,3,18,1),(9,4,11,1),(10,4,14,1),(11,4,20,1),(12,5,22,1),(13,5,2,1),(14,5,7,1),(15,5,21,1),(16,6,40,1),(17,6,45,1),(18,6,49,1),(19,6,46,1),(20,7,40,2),(21,7,41,1),(22,8,41,1),(23,8,47,1),(24,8,45,1),(25,9,42,1),(26,9,47,1),(27,9,50,1),(28,10,40,1),(29,10,49,1),(30,10,43,1),(31,10,46,1),(32,11,8,1),(33,11,9,1),(34,11,18,1),(35,11,19,1),(36,12,1,1),(37,12,4,1),(38,12,21,1),(39,13,1,1),(40,13,4,1),(41,13,6,1),(42,14,1,1),(43,14,2,1),(44,14,4,1),(45,14,21,1),(46,15,14,2),(47,16,8,1),(48,16,17,2),(49,16,20,1),(50,17,8,1),(51,17,14,1),(52,17,17,1),(53,17,20,1),(54,18,8,1),(55,19,9,1),(56,19,14,1),(57,20,8,1),(58,21,19,1),(59,22,11,1),(60,23,11,1),(61,24,17,1),(62,25,8,1),(63,26,8,1),(64,27,22,1),(65,28,22,1),(66,29,23,1),(67,30,22,1),(68,31,22,1),(69,32,23,1),(70,33,23,1),(71,34,22,1),(72,35,22,1),(73,36,23,1),(74,37,22,1),(75,38,22,1);

/*Table structure for table `rider_order` */

DROP TABLE IF EXISTS `rider_order`;

CREATE TABLE `rider_order` (
  `r_o_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  PRIMARY KEY (`r_o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rider_order` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `perms` varchar(255) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`r_id`,`role_name`,`perms`) values (1,'user','user'),(2,'shop_owner','owner'),(3,'admin','admin');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_src` varchar(255) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '0',
  `delivery_cost` varchar(255) NOT NULL,
  `min_cost` varchar(255) NOT NULL,
  `total_sales` varchar(255) NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL,
  `address_detail` varchar(255) NOT NULL,
  `delivery_time` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `shopName` (`shop_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

insert  into `shop`(`s_id`,`logo_src`,`shop_name`,`u_id`,`license`,`stat`,`delivery_cost`,`min_cost`,`total_sales`,`phone`,`address_detail`,`delivery_time`,`desc`) values (1,'/upload/a1_20210817104638_20220930125939.png','华莱士·全鸡汉堡',2,'88688',1,'4','20','21','12312345612','红光大道','40','炸鸡与汉堡'),(2,'/upload/汉堡王_20210901143053.jfif','汉堡王',4,'88687',1,'10','10','11','12312345612','华府美食街','40','....'),(3,'/upload/KFCLogo_20210812213306.jpg','KFC',3,'3652148754',1,'5','20','0','15423652145','中关村大道666号','45','KFC'),(4,'/upload/蜜雪冰城logo (2)_20210905175244.png','蜜雪冰城',5,'88686',1,'4.5','15','1','1223023031','哇哈哈哈哈','40','冰淇淋与茶'),(5,'/upload/雪碧_20210905140918_20220930115807.png','哇哈哈',6,'2123134',1,'5','5','0','1234234354','大大撒想啊无法擦',NULL,NULL);

/*Table structure for table `shop_manager` */

DROP TABLE IF EXISTS `shop_manager`;

CREATE TABLE `shop_manager` (
  `s_m_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `identity_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  `r_id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`s_m_id`),
  UNIQUE KEY `username` (`user_name`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity_number` (`identity_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `shop_manager` */

insert  into `shop_manager`(`s_m_id`,`user_name`,`password`,`phone`,`identity_number`,`name`,`stat`,`r_id`) values (1,'boss','123','12312312313','362202200002144052','lky',1,2),(2,'boss1','123','15428754951','362154215779845126','boss',1,2),(3,'lky','123','12545632514','362201254123652200','lky',1,2),(4,'lky1','123','15421365213','362154214779845126','lky1',1,2),(5,'bob','123','15179548562','362201254201254900','bob',1,2),(6,'knjw','123','12345678925','11231211','哇哈哈',1,2);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `r_id` int(11) NOT NULL DEFAULT '1',
  `picSrc` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`phone`,`username`,`password`,`r_id`,`picSrc`,`score`,`stat`) values (1,'lky','15179510163','lky','123',1,'/upload/小狐狸_20210905195612.png',4,1),(3,'admin','15179510122','admin','123',3,'/upload/小狐狸_20210905195612.png',0,1),(5,'lky1','15179845215','lky1','123',1,'/upload/小狗_20210905195633.png',0,1),(6,'xiaohuangya','15176458295','小黄鸭超爱吃','123',1,'/upload/小黄鸭_20210909221632.png',5,1),(10,'whh','12345678912','whh','123',1,'/upload/20210902154820_20220928235602.gif',18,1),(11,'wfc','12345678955','wfc','123',1,'/upload/20210902154820_20220928235602_20220930114039.gif',0,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
