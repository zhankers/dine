/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21 : Database - sell
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sell` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `sell`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论者姓名',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论者姓名',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `avatar_url` text COLLATE utf8mb4_unicode_ci COMMENT '评论者的头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论信息表';

/*Data for the table `comment` */

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (15),(15),(15),(15),(15);

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `detail_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `product_quantity` int(11) NOT NULL COMMENT '数量',
  `product_icon` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单商品';

/*Data for the table `order_detail` */

insert  into `order_detail`(`detail_id`,`order_id`,`product_id`,`product_name`,`product_price`,`product_quantity`,`product_icon`,`create_time`,`update_time`) values ('1579189267118168712','1579189266772210893','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-01-16 23:41:07','2020-01-16 23:41:07'),('1579189267163755544','1579189266772210893','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-01-16 23:41:07','2020-01-16 23:41:07'),('1579189267171902307','1579189266772210893','1579006977263208878','馒头','8.00',1,'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3937224001,500618140&fm=26&gp=0.jpg','2020-01-16 23:41:07','2020-01-16 23:41:07'),('1579328279897593156','1579328279580923368','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-01-18 14:18:00','2020-01-18 14:18:00'),('1579328280069316655','1579328279580923368','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-01-18 14:18:00','2020-01-18 14:18:00'),('1579329293421296422','1579329293412477820','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-01-18 14:34:53','2020-01-18 14:34:53'),('1579340671440966201','1579340671408199259','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-01-18 17:44:31','2020-01-18 17:44:31');

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '买家桌号',
  `buyer_openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '买家微信openid',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态, 默认为新下单',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态, 默认未支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

/*Data for the table `order_master` */

insert  into `order_master`(`order_id`,`buyer_name`,`buyer_phone`,`buyer_address`,`buyer_openid`,`order_amount`,`order_status`,`pay_status`,`create_time`,`update_time`) values ('1579189266772210893','米芾子','15805849785','1号桌','null','39.00',3,0,'2020-01-16 23:41:07','2020-01-16 23:48:55'),('1579328279580923368','米芾子','15805849785','1号桌','undefined','31.00',1,0,'2020-01-18 14:18:00','2020-01-18 14:18:00'),('1579329293412477820','米芾子','15805849785','1号桌','o2eE44zmxAp4ayABvPJKJTWlQ3F8','21.00',1,0,'2020-01-18 14:34:53','2020-01-18 14:34:53'),('1579340671408199259','米芾子','15805849785','1号桌','o2eE44zmxAp4ayABvPJKJTWlQ3F8','10.00',1,0,'2020-01-18 17:44:31','2020-01-18 17:44:31');

/*Table structure for table `picture` */

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_message` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图表';

/*Data for the table `picture` */

insert  into `picture`(`pic_id`,`pic_url`,`pic_message`,`create_time`,`update_time`) values (1,'http://img1.imgtn.bdimg.com/it/u=2996876122,1492146049&fm=26&gp=0.jpg','包子','2020-01-14 20:56:23','2020-01-14 20:56:23'),(2,'http://img2.imgtn.bdimg.com/it/u=2281438771,1835161639&fm=26&gp=0.jpg','满汉全席','2020-01-14 20:57:07','2020-01-14 20:57:07'),(3,'http://img5.imgtn.bdimg.com/it/u=2291605549,2231893190&fm=26&gp=0.jpg','聚餐','2020-01-14 20:57:38','2020-01-14 20:57:38');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='类目表';

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`,`category_type`,`create_time`,`update_time`) values (1,'汤羹',4,'2020-01-12 17:32:11','2020-01-14 20:59:37'),(4,'招牌',0,'2020-01-14 20:58:19','2020-01-14 20:58:19'),(5,'凉菜',2,'2020-01-14 20:58:53','2020-01-14 20:58:53'),(6,'蒸菜',1,'2020-01-14 21:00:06','2020-01-14 21:00:06'),(7,'米饭',3,'2020-01-14 21:00:30','2020-01-14 21:00:30');

/*Table structure for table `product_info` */

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `product_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小图',
  `product_status` tinyint(3) DEFAULT '0' COMMENT '商品状态,0正常1下架',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品表';

/*Data for the table `product_info` */

insert  into `product_info`(`product_id`,`product_name`,`product_price`,`product_stock`,`product_description`,`product_icon`,`product_status`,`category_type`,`create_time`,`update_time`) values ('1579006915755905581','包子','10.00',997,'','https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg',0,3,'2020-01-14 21:01:55','2020-01-18 17:44:31'),('1579006977263208878','馒头','8.00',99,'','https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3937224001,500618140&fm=26&gp=0.jpg',0,3,'2020-01-14 21:02:57','2020-01-16 23:41:07'),('1579007021519580420','鸡翅','21.00',117,'','https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg',0,0,'2020-01-14 21:03:41','2020-01-18 14:34:53');

/*Table structure for table `seller_info` */

DROP TABLE IF EXISTS `seller_info`;

CREATE TABLE `seller_info` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户手机号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='卖家信息表';

/*Data for the table `seller_info` */

insert  into `seller_info`(`seller_id`,`username`,`password`,`phone`,`create_time`,`update_time`) values (1,'春日花开','123456','123456','2020-01-12 16:15:30','2020-01-15 21:20:40');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信openid',
  `token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zhuohao` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '桌号',
  `renshu` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '就餐人数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`openid`,`token`,`zhuohao`,`renshu`,`create_time`,`update_time`) values (13,'123456','123456',NULL,'',NULL,NULL,NULL,'2020-01-22 18:53:11','2020-01-22 18:53:11'),(14,'123456','123456',NULL,'d1ba8f6aa86945af93ef0413989cc242','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWJhOGY2YWE4Njk0NWFmOTNlZjA0MTM5ODljYzI0MiIsImV4cCI6MTU3OTY5MTA0OH0.yE9y9kqXM7zfWWCpuJYTS8KfpdjWEUfKFAJk-KTI0Gs',NULL,NULL,'2020-01-22 18:59:08','2020-01-22 18:59:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
