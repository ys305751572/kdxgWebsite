/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.11 : Database - kdxg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kdxg` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `kdxg`;

/*Table structure for table `tb_activity` */

DROP TABLE IF EXISTS `tb_activity`;

CREATE TABLE `tb_activity` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT '',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='活动说明表';

/*Data for the table `tb_activity` */

insert  into `tb_activity`(`id`,`content`,`create_date`,`modify_date`) values (1,'',1,1);

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `status` int(2) DEFAULT '0' COMMENT '状态 0:正常 1:禁用',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`id`,`username`,`password`,`status`,`create_date`,`modify_date`) values (1,'admin','123456q',0,1,1459496245704);

/*Table structure for table `tb_classify_ws` */

DROP TABLE IF EXISTS `tb_classify_ws`;

CREATE TABLE `tb_classify_ws` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '类型',
  `number` int(20) DEFAULT '0' COMMENT '数量',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_classify_ws` */

insert  into `tb_classify_ws`(`id`,`name`,`number`,`create_date`,`modify_date`) values (1,'今日热点',1,1458560670645,NULL),(2,'驱蚊器',0,1458560670645,NULL),(5,'111范德萨王企鹅',0,1458560670645,NULL),(7,'hjkhjkhjjhkghjfggh',0,1459491623995,1459505745746),(8,'sdasddfsdfsdfsdfsdfs',0,1459505610955,NULL);

/*Table structure for table `tb_coinlog` */

DROP TABLE IF EXISTS `tb_coinlog`;

CREATE TABLE `tb_coinlog` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(32) DEFAULT NULL COMMENT '用户ID',
  `money` double DEFAULT NULL COMMENT '充值金额',
  `create_date` bigint(20) DEFAULT NULL,
  `update_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='充值记录表';

/*Data for the table `tb_coinlog` */

insert  into `tb_coinlog`(`id`,`user_id`,`money`,`create_date`,`update_date`) values (1,1,20,1459153300058,NULL),(2,1,120,1459153338783,NULL),(3,1,50,1459154983019,NULL),(4,1,100,1459156018406,NULL),(5,1,100,1459156211428,NULL),(6,1,100,1459158503305,NULL),(7,1,100,1459159237343,NULL),(8,1,100,1459159356726,NULL),(9,1,100,1459159395982,NULL),(10,1,100,1459159513827,NULL),(11,1,100,1459159835908,NULL),(12,1,100,1459159897042,NULL),(13,1,100,1459160620050,NULL);

/*Table structure for table `tb_image` */

DROP TABLE IF EXISTS `tb_image`;

CREATE TABLE `tb_image` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `path` varchar(200) DEFAULT '',
  `thumbs` varchar(200) DEFAULT '',
  `attribute` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COMMENT='图片表';

/*Data for the table `tb_image` */

insert  into `tb_image`(`id`,`path`,`thumbs`,`attribute`,`create_date`) values (1,'images/2016/3/1457577268886.jpg','{\"480x800\":\"images/2016/3/1457577268886_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 10:34:29'),(2,'images/2016/3/1457577863445.jpg','{\"480x800\":\"images/2016/3/1457577863445_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 10:44:24'),(3,'images/2016/3/1457578187304.jpg','{\"480x800\":\"images/2016/3/1457578187304_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 10:49:48'),(4,'images/2016/3/1457578506533.jpg','{\"480x800\":\"images/2016/3/1457578506533_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 10:55:07'),(5,'images/2016/3/1457578686624.jpg','{\"480x800\":\"images/2016/3/1457578686624_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 10:58:07'),(6,'images/2016/3/1457578880618.jpg','{\"480x800\":\"images/2016/3/1457578880618_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 11:01:21'),(7,'images/2016/3/1457579142668.jpg','{\"480x800\":\"images/2016/3/1457579142668_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 11:05:43'),(8,'images/2016/3/1457579147334.jpg','{\"480x800\":\"images/2016/3/1457579147334_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-10 11:05:47'),(9,'images/2016/3/1457579406095.jpg','{\"480x800\":\"images/2016/3/1457579406095_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 11:10:06'),(10,'images/2016/3/1457594877917.jpg','{\"480x800\":\"images/2016/3/1457594877917_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 15:27:58'),(11,'images/2016/3/1457595204394.jpg','{\"480x800\":\"images/2016/3/1457595204394_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 15:33:24'),(12,'images/2016/3/1457599588450.jpg','{\"480x800\":\"images/2016/3/1457599588450_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 16:46:29'),(13,'images/2016/3/1457599695518.jpg','{\"480x800\":\"images/2016/3/1457599695518_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 16:48:16'),(14,'images/2016/3/1457599739066.jpg','{\"480x800\":\"images/2016/3/1457599739066_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 16:48:59'),(15,'images/2016/3/1457599764884.jpg','{\"480x800\":\"images/2016/3/1457599764884_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 16:49:25'),(16,'images/2016/3/1457599794795.jpg','{\"480x800\":\"images/2016/3/1457599794795_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 16:49:55'),(17,'images/2016/3/1457599929543.jpg','{\"480x800\":\"images/2016/3/1457599929543_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-10 16:52:10'),(18,'images/2016/3/1458021802753.jpg','{\"480x800\":\"images/2016/3/1458021802753_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-15 14:03:23'),(19,'images/2016/3/1458023333675.jpg','{\"480x800\":\"images/2016/3/1458023333675_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-15 14:28:54'),(20,'images/2016/3/1458024677330.jpg','{\"480x800\":\"images/2016/3/1458024677330_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 14:51:17'),(21,'images/2016/3/1458024743819.jpg','{\"480x800\":\"images/2016/3/1458024743819_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 14:52:24'),(22,'images/2016/3/1458024752171.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 14:52:32'),(23,'images/2016/3/1458024752187.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 14:52:32'),(24,'images/2016/3/1458024752194_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 14:52:32'),(25,'images/2016/3/1458025019162.jpg','{\"480x800\":\"images/2016/3/1458025019162_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 14:56:59'),(26,'images/2016/3/1458025028158.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 14:57:08'),(27,'images/2016/3/1458025028180.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 14:57:08'),(28,'images/2016/3/1458025028186_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 14:57:08'),(29,'images/2016/3/1458025168747.jpg','{\"480x800\":\"images/2016/3/1458025168747_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 14:59:29'),(30,'images/2016/3/1458025176035.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 14:59:36'),(31,'images/2016/3/1458025176051.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 14:59:36'),(32,'images/2016/3/1458025176057_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 14:59:36'),(33,'images/2016/3/1458025326908.jpg','{\"480x800\":\"images/2016/3/1458025326908_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 15:02:07'),(34,'images/2016/3/1458025341122.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:02:21'),(35,'images/2016/3/1458025341139.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:02:21'),(36,'images/2016/3/1458025341145_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:02:21'),(37,'images/2016/3/1458026193657.jpg','{\"480x800\":\"images/2016/3/1458026193657_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 15:16:34'),(38,'images/2016/3/1458026202054.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:16:42'),(39,'images/2016/3/1458026202072.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:16:42'),(40,'images/2016/3/1458026202078_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:16:43'),(41,'images/2016/3/1458026822317.jpg','{\"480x800\":\"images/2016/3/1458026822317_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 15:27:03'),(42,'images/2016/3/1458026830520.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:27:11'),(43,'images/2016/3/1458026830538.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:27:11'),(44,'images/2016/3/1458026830544_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:27:11'),(45,'images/2016/3/1458026991516.jpg','{\"480x800\":\"images/2016/3/1458026991516_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 15:29:52'),(46,'images/2016/3/1458026999673.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:30:00'),(47,'images/2016/3/1458026999692.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:30:00'),(48,'images/2016/3/1458026999699_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:30:00'),(49,'images/2016/3/1458027256378.jpg','{\"480x800\":\"images/2016/3/1458027256378_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-15 15:34:17'),(50,'images/2016/3/1458027283481.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:34:43'),(51,'images/2016/3/1458027283499.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:34:44'),(52,'images/2016/3/1458027283506_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:34:44'),(53,'images/2016/3/1458027774058.jpg','{\"480x800\":\"images/2016/3/1458027774058_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-15 15:42:54'),(54,'images/2016/3/1458027827251.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:43:47'),(55,'images/2016/3/1458027827272.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:43:48'),(56,'images/2016/3/1458027827600_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:43:48'),(57,'images/2016/3/1458028639756.jpg','{\"480x800\":\"images/2016/3/1458028639756_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-15 15:57:20'),(58,'images/2016/3/1458028653326.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:57:33'),(59,'images/2016/3/1458028653343.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:57:33'),(60,'images/2016/3/1458028653348_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:57:33'),(61,'images/2016/3/1458028692604.jpg','{\"480x800\":\"images/2016/3/1458028692604_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 15:58:13'),(62,'images/2016/3/1458028701152.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 15:58:21'),(63,'images/2016/3/1458028701168.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 15:58:21'),(64,'images/2016/3/1458028701173_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 15:58:21'),(65,'images/2016/3/1458028776194.jpg','{\"480x800\":\"images/2016/3/1458028776194_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 15:59:36'),(66,'images/2016/3/1458028813830.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:00:14'),(67,'images/2016/3/1458028813845.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:00:14'),(68,'images/2016/3/1458028813851_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:00:14'),(69,'images/2016/3/1458029090364.jpg','{\"480x800\":\"images/2016/3/1458029090364_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 16:04:50'),(70,'images/2016/3/1458029115242.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:05:15'),(71,'images/2016/3/1458029115257.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:05:15'),(72,'images/2016/3/1458029115263_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:05:15'),(73,'images/2016/3/1458029390534.jpg','{\"480x800\":\"images/2016/3/1458029390534_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 16:09:51'),(74,'images/2016/3/1458029402248.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:10:02'),(75,'images/2016/3/1458029402264.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:10:02'),(76,'images/2016/3/1458029402270_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:10:02'),(77,'images/2016/3/1458029433417.jpg','{\"480x800\":\"images/2016/3/1458029433417_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 16:10:33'),(78,'images/2016/3/1458029445373.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:10:45'),(79,'images/2016/3/1458029445389.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:10:45'),(80,'images/2016/3/1458029445393_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:10:46'),(81,'images/2016/3/1458029739907.jpg','{\"480x800\":\"images/2016/3/1458029739907_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 16:15:40'),(82,'images/2016/3/1458029754632.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:15:55'),(83,'images/2016/3/1458029754650.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:15:55'),(84,'images/2016/3/1458029754656_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:15:55'),(85,'images/2016/3/1458030381080.jpg','{\"480x800\":\"images/2016/3/1458030381080_480x800.jpg\"}','{\"height\":612,\"width\":816}','2016-03-15 16:26:22'),(86,'images/2016/3/1458030398226.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:26:38'),(87,'images/2016/3/1458030398244.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:26:38'),(88,'images/2016/3/1458030398252_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:26:38'),(89,'images/2016/3/1458030673089.jpg','{\"480x800\":\"images/2016/3/1458030673089_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 16:31:13'),(90,'images/2016/3/1458030688749.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:31:29'),(91,'images/2016/3/1458030688771.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:31:29'),(92,'images/2016/3/1458030688778_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:31:29'),(93,'images/2016/3/1458030763191.jpg','{\"480x800\":\"images/2016/3/1458030763191_480x800.jpg\"}','{\"height\":136,\"width\":218}','2016-03-15 16:32:43'),(94,'images/2016/3/1458030774351.jpg',NULL,'{\"height\":612,\"width\":816}','2016-03-15 16:32:54'),(95,'images/2016/3/1458030774370.jpg',NULL,'{\"height\":136,\"width\":218}','2016-03-15 16:32:54'),(96,'images/2016/3/1458030774383_compact.jpg',NULL,'{\"height\":837,\"width\":990}','2016-03-15 16:32:55');

/*Table structure for table `tb_information` */

DROP TABLE IF EXISTS `tb_information`;

CREATE TABLE `tb_information` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '资讯标题',
  `content` varchar(500) DEFAULT '' COMMENT '资讯内容',
  `image_id` int(32) DEFAULT NULL COMMENT '图片ID',
  `is_list` int(2) DEFAULT '0' COMMENT '是否上架 0:未发布  1:上架 2:下架',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='资讯表';

/*Data for the table `tb_information` */

insert  into `tb_information`(`id`,`title`,`content`,`image_id`,`is_list`,`create_date`,`modify_date`) values (2,'11','&ltp&gt11&lt/p&gt',4,1,1457578509518,1457590589811),(3,'222','&ltp&gt222&lt/p&gt',5,1,1457578689094,1458025867512),(7,'11','&ltp&gt1&lt/p&gt',11,1,1457595208019,1458025867459),(8,'xiaoxo ','&ltp&gt111&lt/p&gt',12,0,1457599590472,NULL),(9,'11','&ltp&gt1212&lt/p&gt',13,0,1457599697808,NULL);

/*Table structure for table `tb_information_ws` */

DROP TABLE IF EXISTS `tb_information_ws`;

CREATE TABLE `tb_information_ws` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '资讯标题',
  `content` varchar(6000) DEFAULT '' COMMENT '资讯内容',
  `type` int(2) DEFAULT '0' COMMENT '类型',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='官网资讯表';

/*Data for the table `tb_information_ws` */

insert  into `tb_information_ws`(`id`,`title`,`content`,`type`,`create_date`,`modify_date`) values (1,'哇哈哈','&ltp&gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt123123123123&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&lt/p&gt',7,1459505380655,NULL),(10,'2222','&ltp&gt222&lt/p&gt',5,1459404395959,NULL),(11,'3333','&ltp&gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gt&amp;ltp&amp;gtasfsadf&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&amp;lt/p&amp;gt&lt/p&gt',5,1459505380655,NULL),(13,'为全文','&ltp&gt&amp;ltp&amp;gt为全文&amp;lt/p&amp;gt&lt/p&gt',2,1459491617686,NULL),(14,'adfsfads','&ltp&gtfasf&ltem&gtsadfs&lt/em&gtafsdfsa&ltstrong&gtfasdfs&lt/strong&gt&lt/p&gt',5,1459505380655,1459822716939);

/*Table structure for table `tb_message` */

DROP TABLE IF EXISTS `tb_message`;

CREATE TABLE `tb_message` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` varchar(500) DEFAULT '' COMMENT '消息内容',
  `is_list` int(2) DEFAULT '0' COMMENT '是否发送 0:未发送 1:已发送',
  `image_id` int(32) DEFAULT NULL COMMENT '封面ID',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `send_date` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='消息表';

/*Data for the table `tb_message` */

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) DEFAULT NULL COMMENT '订单号',
  `ps_id` bigint(32) DEFAULT NULL COMMENT '商品服务id',
  `product_id` bigint(32) DEFAULT NULL COMMENT '商品ID',
  `user_id` bigint(32) DEFAULT NULL COMMENT '用户ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '交易额',
  `status` int(2) DEFAULT '0' COMMENT '状态 0:待发货 1:已发货 2:已签收',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(500) DEFAULT NULL COMMENT '收货地址',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `tb_order` */

insert  into `tb_order`(`id`,`sn`,`ps_id`,`product_id`,`user_id`,`money`,`status`,`name`,`mobile`,`address`,`create_date`,`modify_date`) values (4,'1459153300048',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459153300058,NULL),(5,'1459153338782',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459153338783,NULL),(6,'1459154983018',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459154983019,NULL),(7,'1459156018395',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459156018406,NULL),(8,'1459156211416',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459156211428,NULL),(9,'1459158503294',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459158503305,NULL),(10,'1459159237329',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459159237343,NULL),(11,'1459159356716',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459159356726,NULL),(12,'1459159395980',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459159395982,NULL),(13,'1459159513818',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459159513827,NULL),(14,'1459159835900',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459159835908,NULL),(15,'1459159897040',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459159897042,NULL),(16,'1459160620040',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459160620050,NULL),(17,'1459160717716',3,12,1,'1000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459160717728,NULL),(18,'1459160802651',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459160802652,NULL),(19,'1459160981927',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459160981928,NULL),(20,'1459217223815',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459217223830,NULL),(21,'1459217269247',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459217269248,NULL),(22,'1459219677675',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459219677687,NULL),(23,'1459220573256',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459220573273,NULL),(24,'1459220634368',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459220634370,NULL),(25,'1459230466823',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459230466830,NULL),(26,'1459239068978',4,12,1,'5000.00',0,'玉皇大帝','123456789','凌霄宝殿',1459239068993,NULL),(27,'1459304054710',4,12,1,'5000.00',0,'王强','15878863314','南湖大道东山头',1459304054723,NULL),(28,'1459304227527',4,12,1,'5000.00',0,'王强','15878863314','南湖大道东山头',1459304227539,NULL);

/*Table structure for table `tb_pay_record` */

DROP TABLE IF EXISTS `tb_pay_record`;

CREATE TABLE `tb_pay_record` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(32) NOT NULL COMMENT '用户ID',
  `money` double NOT NULL DEFAULT '0' COMMENT '缴费金额',
  `start_date` bigint(20) DEFAULT NULL COMMENT '服务开始时间',
  `end_date` bigint(20) DEFAULT NULL COMMENT '服务结束时间',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户充值记录表\r\n';

/*Data for the table `tb_pay_record` */

insert  into `tb_pay_record`(`id`,`user_id`,`money`,`start_date`,`end_date`,`create_date`,`modify_date`) values (1,1,23,1457424927148,1457424927148,1457424927148,1457424927148);

/*Table structure for table `tb_product` */

DROP TABLE IF EXISTS `tb_product`;

CREATE TABLE `tb_product` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '商品标题',
  `cover_image_id` int(32) DEFAULT NULL COMMENT '封面图片ID',
  `start_date` bigint(20) DEFAULT '0' COMMENT '开始时间',
  `service_start_date` bigint(20) DEFAULT NULL COMMENT '服务开始时间',
  `counts` int(32) DEFAULT '0' COMMENT '商品数量',
  `inventory` int(11) DEFAULT NULL COMMENT '库存',
  `coupons_counts` int(32) DEFAULT '0' COMMENT '优惠劵数量',
  `content` varchar(500) DEFAULT '' COMMENT '商品详情',
  `status` int(2) DEFAULT '0' COMMENT '状态0:待开始 1:抢购中 2:已结束',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品表\r\n';

/*Data for the table `tb_product` */

insert  into `tb_product`(`id`,`title`,`cover_image_id`,`start_date`,`service_start_date`,`counts`,`inventory`,`coupons_counts`,`content`,`status`,`create_date`,`modify_date`) values (12,'【脐橙五斤大抢购酸甜多汁】湖北南漳脐橙',85,1458030300000,1458117000000,100,NULL,1,'脐橙五斤大抢购酸甜多汁】湖北南漳脐橙【脐橙五斤大抢购酸甜多汁】湖北南漳脐橙【脐橙五斤大抢购酸甜多汁】湖北南漳脐橙【脐橙五斤大抢购酸甜多汁】湖北南漳脐橙',0,1458030405627,NULL);

/*Table structure for table `tb_product_buy_record` */

DROP TABLE IF EXISTS `tb_product_buy_record`;

CREATE TABLE `tb_product_buy_record` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(32) DEFAULT NULL COMMENT '用户ID',
  `product_id` bigint(32) DEFAULT NULL COMMENT '商品ID',
  `is_use_coupons` int(2) DEFAULT '0' COMMENT '是否使用优惠券0:未使用 1:已使用',
  `is_get_coupons` int(2) DEFAULT '0' COMMENT '是否获得优惠券0:未获得 1:已获得',
  `coupons_end_date` bigint(20) DEFAULT NULL COMMENT '优惠券结束时间，没有获得则为0',
  `result_status` int(2) DEFAULT '0' COMMENT '抢购结果 0:成功 1:失败',
  `pay_money` double DEFAULT '0' COMMENT '缴费金额',
  `pay_days` int(2) DEFAULT '0' COMMENT '缴费天数',
  `result` varchar(200) DEFAULT '' COMMENT '抢购结果',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COMMENT='抢购人员表\r\n';

/*Data for the table `tb_product_buy_record` */

insert  into `tb_product_buy_record`(`id`,`user_id`,`product_id`,`is_use_coupons`,`is_get_coupons`,`coupons_end_date`,`result_status`,`pay_money`,`pay_days`,`result`,`create_date`,`modify_date`) values (68,1,12,0,0,0,0,0,0,'',1459147225307,NULL),(69,1,12,0,0,0,0,0,0,'',1459147908785,NULL),(70,1,12,0,0,0,0,0,0,'',1459147969793,NULL),(71,1,12,0,0,0,0,0,0,'',1459147972289,NULL),(72,1,12,0,0,0,0,0,0,'',1459147974688,NULL),(73,1,12,0,1,1459407176867,0,0,0,'',1459147976868,NULL),(74,1,12,0,1,1459407655928,0,0,0,'',1459148455944,NULL),(75,1,12,0,0,0,0,0,0,'',1459148703877,NULL),(76,1,12,0,0,0,0,0,0,'',1459148802748,NULL),(77,1,12,0,1,1459409245243,0,0,0,'',1459150045261,NULL),(78,1,12,0,0,0,0,0,0,'',1459150425995,NULL),(79,1,12,0,0,0,0,0,0,'',1459150512335,NULL),(80,1,12,0,0,0,0,0,0,'',1459150758653,NULL),(81,1,12,0,0,0,0,0,0,'',1459150865145,NULL),(82,1,12,0,0,0,0,0,0,'',1459153292588,NULL),(83,1,12,0,1,1459414179454,0,0,0,'',1459154979455,NULL),(84,1,12,0,0,0,0,0,0,'',1459156015812,NULL),(85,1,12,0,0,0,0,0,0,'',1459156208278,NULL),(86,1,12,0,0,0,0,0,0,'',1459158484338,NULL),(87,1,12,0,1,1459418359719,0,0,0,'',1459159159736,NULL),(88,1,12,0,0,0,0,0,0,'',1459159165194,NULL),(89,1,12,0,0,0,0,0,0,'',1459159214686,NULL),(90,1,12,0,0,0,0,0,0,'',1459159219361,NULL),(91,1,12,0,1,1459418421794,0,0,0,'',1459159221795,NULL),(92,1,12,0,0,0,0,0,0,'',1459159351972,NULL),(93,1,12,0,0,0,0,0,0,'',1459159511005,NULL),(94,1,12,0,0,0,0,0,0,'',1459159832899,NULL),(95,1,12,0,0,0,0,0,0,'',1459160591746,NULL),(96,1,12,0,0,0,0,0,0,'',1459160714887,NULL),(97,1,12,0,1,1459419998020,0,0,0,'',1459160798020,NULL),(98,1,12,0,0,0,0,0,0,'',1459217207928,NULL),(99,1,12,0,0,0,0,0,0,'',1459217216507,NULL),(100,1,12,0,1,1459476419216,0,0,0,'',1459217219219,NULL),(101,1,12,0,1,1459476460003,0,0,0,'',1459217260003,NULL),(102,1,12,0,0,0,0,0,0,'',1459217263997,NULL),(103,1,12,0,1,1459478867518,0,0,0,'',1459219667546,NULL),(104,1,12,0,0,0,0,0,0,'',1459220568089,NULL),(105,1,12,0,0,0,0,0,0,'',1459230347246,NULL),(106,1,12,0,0,0,0,0,0,'',1459230351666,NULL),(107,1,12,0,0,0,0,0,0,'',1459230355972,NULL),(108,1,12,0,0,0,0,0,0,'',1459230391172,NULL),(109,1,12,1,0,0,0,0,0,'',1459230452945,NULL),(110,1,12,1,0,0,0,0,0,'',1459230457864,NULL),(111,1,12,1,0,0,0,0,0,'',1459230461340,NULL),(112,1,12,0,0,0,0,0,0,'',1459230506503,NULL),(113,1,12,1,0,0,0,0,0,'',1459239057538,NULL),(114,1,12,1,0,0,0,0,0,'',1459239061487,NULL),(115,1,12,0,0,0,0,0,0,'',1459239527053,NULL),(116,1,12,0,0,0,0,0,0,'',1459239530601,NULL),(117,1,12,0,1,1459498734509,0,0,0,'',1459239534512,NULL),(118,1,12,1,0,0,0,0,0,'',1459239698783,NULL),(119,1,12,1,0,0,0,0,0,'',1459239700677,NULL),(120,1,12,1,0,0,0,0,0,'',1459239701754,NULL),(121,1,12,1,0,0,0,0,0,'',1459239702626,NULL),(122,1,12,1,0,0,0,0,0,'',1459239703323,NULL),(123,1,12,1,0,0,0,0,0,'',1459239704140,NULL),(124,1,12,1,0,0,0,0,0,'',1459239706414,NULL),(125,1,12,1,0,0,0,0,0,'',1459239707259,NULL),(126,1,12,1,0,0,0,0,0,'',1459239708139,NULL),(127,1,12,1,0,0,0,0,0,'',1459239710463,NULL),(128,1,12,0,0,0,0,0,0,'',1459239719535,NULL),(129,1,12,0,0,0,0,0,0,'',1459239721620,NULL),(130,1,12,0,0,0,0,0,0,'',1459239722759,NULL),(131,1,12,0,0,0,0,0,0,'',1459239723811,NULL),(132,1,12,0,0,0,0,0,0,'',1459239724842,NULL),(133,1,12,0,0,0,0,0,0,'',1459239725731,NULL),(134,1,12,0,0,0,0,0,0,'',1459239726568,NULL),(135,1,12,0,0,0,0,0,0,'',1459239727452,NULL),(136,1,12,0,0,0,0,0,0,'',1459239728317,NULL),(137,1,12,0,0,0,0,0,0,'',1459239729145,NULL),(138,1,12,0,0,0,0,0,0,'',1459239730030,NULL),(139,1,12,0,1,1459498930887,0,0,0,'',1459239730887,NULL),(140,1,12,0,0,0,0,0,0,'',1459239734759,NULL),(141,1,12,1,0,0,0,0,0,'',1459239737692,NULL),(142,1,12,0,0,0,0,0,0,'',1459303389802,NULL),(143,1,12,0,0,0,0,0,0,'',1459304036455,NULL),(144,1,12,0,1,1459563423225,0,0,0,'',1459304223249,NULL);

/*Table structure for table `tb_product_image` */

DROP TABLE IF EXISTS `tb_product_image`;

CREATE TABLE `tb_product_image` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(32) DEFAULT NULL COMMENT '产品id',
  `image_id` varchar(200) DEFAULT NULL COMMENT '图片id',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='商品-图片关联关系表';

/*Data for the table `tb_product_image` */

insert  into `tb_product_image`(`id`,`product_id`,`image_id`,`create_date`,`modify_date`) values (13,NULL,'47',1458026999883,NULL),(14,NULL,'48',1458026999918,NULL),(15,NULL,'46',1458026999969,NULL),(16,3,'47',NULL,NULL),(17,3,'48',NULL,NULL),(18,3,'46',NULL,NULL),(19,4,'50',NULL,NULL),(20,4,'52',NULL,NULL),(21,4,'51',NULL,NULL),(22,5,'55',NULL,NULL),(23,5,'56',NULL,NULL),(24,5,'54',NULL,NULL),(25,6,'63',NULL,NULL),(26,6,'64',NULL,NULL),(27,6,'62',NULL,NULL),(28,7,'67',NULL,NULL),(29,7,'66',NULL,NULL),(30,7,'68',NULL,NULL),(31,8,'72',NULL,NULL),(32,8,'71',NULL,NULL),(33,8,'70',NULL,NULL),(40,12,'87',NULL,NULL),(41,12,'86',NULL,NULL),(42,12,'88',NULL,NULL);

/*Table structure for table `tb_product_service` */

DROP TABLE IF EXISTS `tb_product_service`;

CREATE TABLE `tb_product_service` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(32) DEFAULT NULL COMMENT '商品ID',
  `days` int(10) DEFAULT NULL COMMENT '天数',
  `money` double DEFAULT NULL COMMENT '金额',
  `create_date` bigint(32) DEFAULT NULL,
  `modify_date` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='商品服务金额关系表';

/*Data for the table `tb_product_service` */

insert  into `tb_product_service`(`id`,`product_id`,`days`,`money`,`create_date`,`modify_date`) values (3,12,1,1000,1459147225307,NULL),(4,12,5,5000,1459147225307,NULL);

/*Table structure for table `tb_single_ws` */

DROP TABLE IF EXISTS `tb_single_ws`;

CREATE TABLE `tb_single_ws` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) DEFAULT '' COMMENT '内容',
  `type` int(2) DEFAULT '0' COMMENT '类型:1.关于我们,2.公司发展,3.加入我们,4.联系我们',
  `create_date` bigint(20) DEFAULT NULL,
  `modify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_single_ws` */

insert  into `tb_single_ws`(`id`,`content`,`type`,`create_date`,`modify_date`) values (1,'关于我们',1,1457578509518,NULL),(2,'公司发展',2,1457578509518,NULL),(3,'加入我们',3,1457578509518,NULL),(4,'&ltp&gt联系我们尔特让他热让他&lt/p&gt',4,1457578509518,NULL);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `plat` int(2) DEFAULT '0' COMMENT '平台 0:app平台 1:微信平台',
  `status` int(2) DEFAULT '0' COMMENT '状态 0:正常 1:禁用',
  `money` double DEFAULT '0' COMMENT '余额',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`mobile`,`password`,`nickname`,`plat`,`status`,`money`,`create_date`,`modify_date`) values (1,'13476107753','12345','孙悟空',0,1,40,1457424927148,1457677268160),(2,'13476107752','12345','猪八戒',1,1,50,1457424927148,1457424927148),(3,'13476107751','12345','沙悟净',0,1,23.5,1457424927148,1457677278095);

/*Table structure for table `tb_user_address` */

DROP TABLE IF EXISTS `tb_user_address`;

CREATE TABLE `tb_user_address` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(32) NOT NULL COMMENT '用户ID',
  `name` varchar(50) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(50) DEFAULT '' COMMENT '联系电话',
  `address` varchar(500) DEFAULT '' COMMENT '地址',
  `is_default` int(2) DEFAULT '0' COMMENT '是否默认 0:是 1:否',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

/*Data for the table `tb_user_address` */

insert  into `tb_user_address`(`id`,`user_id`,`name`,`mobile`,`address`,`is_default`,`create_date`,`modify_date`) values (1,1,'白骨洞','18562448963','白虎岭狼牙山',1,1457424927148,1459303487120),(2,1,'太上老君','123456789','天庭',1,1457424927148,1459303484315),(3,1,'玉皇大帝','123456789','凌霄宝殿',1,1457424927148,1459303480931),(4,1,'王强','15878863314','南湖大道东山头',0,1459237991682,1459303487120);

/*Table structure for table `tb_user_coupons` */

DROP TABLE IF EXISTS `tb_user_coupons`;

CREATE TABLE `tb_user_coupons` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(32) DEFAULT NULL COMMENT '用户ID',
  `end_date` bigint(32) DEFAULT NULL COMMENT '失效时间',
  `status` int(2) DEFAULT NULL COMMENT '状态 0:正常 1:无效',
  `is_used` int(2) DEFAULT NULL COMMENT '是否使用 0:未使用 1:已使用',
  `create_date` bigint(32) DEFAULT NULL,
  `modify_date` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='用户优惠券表';

/*Data for the table `tb_user_coupons` */

insert  into `tb_user_coupons`(`id`,`user_id`,`end_date`,`status`,`is_used`,`create_date`,`modify_date`) values (13,1,1459393885441,1,0,1459134685460,NULL),(14,1,1459393974092,1,0,1459134774092,NULL),(15,1,1459394093205,1,0,1459134893206,NULL),(16,1,1459396529546,0,1,1459137330146,1459239710466),(17,1,1459396712692,0,1,1459137512693,1459239708143),(18,1,1459396777615,0,1,1459137577616,1459239707263),(19,1,1459397033745,0,1,1459137833760,1459239706417),(20,1,1459407176873,0,1,1459147976882,1459239704143),(21,1,1459407655979,0,1,1459148455990,1459239703327),(22,1,1459409245282,0,1,1459150045293,1459239702630),(23,1,1459414179457,0,1,1459154979482,1459239701757),(24,1,1459418359765,0,1,1459159159775,1459239700680),(25,1,1459418421798,0,1,1459159221798,1459239061493),(26,1,1459419998023,0,1,1459160798040,1459239057555),(27,1,1459476419221,0,1,1459217219231,1459230461345),(28,1,1459476460005,0,1,1459217260005,1459230457867),(29,1,1459478867563,0,1,1459219667575,1459230452948),(30,1,1459498734515,0,1,1459239534525,1459239698786),(31,1,1459498930889,0,1,1459239730889,1459239737695),(32,1,1459563423266,0,0,1459304223277,NULL);

/*Table structure for table `tb_web_pay_record` */

DROP TABLE IF EXISTS `tb_web_pay_record`;

CREATE TABLE `tb_web_pay_record` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `record_code` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `money` double DEFAULT '0' COMMENT '收支金额 正数为收入,负数为支出',
  `plat` double DEFAULT '0' COMMENT '支付方式 0:微信 1:其他',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `modify_date` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='平台收入支出表';

/*Data for the table `tb_web_pay_record` */

insert  into `tb_web_pay_record`(`id`,`record_code`,`money`,`plat`,`create_date`,`modify_date`) values (1,'KDXG10004',45.5,0,1457424927148,1457424927148),(2,'KDXG10005',35.5,1,1457424927148,1457424927148),(3,'KDXG100056',-56.2,1,1457424927148,1457424927148);

/*Table structure for table `tb_wx_user` */

DROP TABLE IF EXISTS `tb_wx_user`;

CREATE TABLE `tb_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL COMMENT '用户唯一标识',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `sex` varchar(11) DEFAULT NULL COMMENT '用户性别',
  `head_url` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_wx_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
