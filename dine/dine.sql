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

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `province_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省份',
  `city_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `county_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区县',
  `detail_info` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `active` int(1) DEFAULT '1' COMMENT '是否激活。 0: 不激活，1 激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `address` */

insert  into `address`(`id`,`user_id`,`username`,`tel_number`,`national_code`,`postal_code`,`province_name`,`city_name`,`county_name`,`detail_info`,`active`) values (30,'o2eE44zmxAp4ayABvPJKJTWlQ3F8','张三','020-81167888','510000','510000','广东省','广州市','海珠区','新港中路397号',0),(31,'o2eE44zmxAp4ayABvPJKJTWlQ3F8','李四','153546547657','666666','654666','江西省','南昌市','新建区','学府大道999号',0),(35,'d1ba8f6aa86945af93ef0413989cc242','张三','020-81167888','510000','510000','广东省','广州市','海珠区','新港中路397号',0),(41,'oZe4o45UWBsD7IrqDjb43JO-sWa4','张三','020-81167888','510000','510000','广东省','广州市','海珠区','新港中路397号',1),(52,'o2eE44zmxAp4ayABvPJKJTWlQ3F8','占智强','17328595170','440307','518116','广东省','深圳市','龙岗区','坂田街道雪岗路2048号裕发日杂批发部',1),(55,'d1ba8f6aa86945af93ef0413989cc242','占智强','17328595170','440307','518116','广东省','深圳市','龙岗区','坂田街道雪岗路2048号裕发日杂批发部',1),(63,'2f1c5587408240559b6042833b161d4f','占智强','17328595170','440307','518116','广东省','深圳市','龙岗区','坂田街道雪岗路2048号裕发日杂批发部',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论信息表';

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`name`,`openid`,`content`,`avatar_url`,`create_time`) values (31,'春日花开','d1ba8f6aa86945af93ef0413989cc242','好吃，vary yammy','http://zhanke.site:8080/sell/avatar/default.png','2020-02-07 00:11:16'),(32,'春日花开','d1ba8f6aa86945af93ef0413989cc242','好吃，vary yammy','http://zhanke.site:8080/sell/avatar/default.png','2020-02-07 00:11:20'),(33,'春日花开','d1ba8f6aa86945af93ef0413989cc242','非常美味','http://zhanke.site:8080/sell/avatar/default.png','2020-02-07 01:00:15'),(56,'春日花开','d1ba8f6aa86945af93ef0413989cc242','好吃','http://zhanke.site:8080/sell/avatar/default.png','2020-02-21 17:04:01'),(60,'春日花开','d1ba8f6aa86945af93ef0413989cc242','好吃','http://zhanke.site:8080/sell/avatar/default.png','2020-02-21 17:23:04');

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增加ID',
  `type` int(11) DEFAULT '1' COMMENT '所属类型,1为满减',
  `name` varchar(32) DEFAULT NULL COMMENT '优惠券名称',
  `start_time` datetime DEFAULT NULL COMMENT '优惠券开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '优惠券结束时间',
  `money` decimal(11,2) DEFAULT NULL COMMENT '优惠券金额，用整数，固定值目前。',
  `status` int(11) DEFAULT NULL COMMENT '状态，0表示未开始，1表示进行中，-1表示结束',
  `remarks` varchar(512) DEFAULT NULL COMMENT '优惠券的说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `full_money` decimal(12,2) DEFAULT NULL COMMENT '金额满',
  `number` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='优惠券基础配置表';

/*Data for the table `coupon` */

insert  into `coupon`(`id`,`type`,`name`,`start_time`,`end_time`,`money`,`status`,`remarks`,`create_time`,`full_money`,`number`,`img`) values (44,1,'满60减10','2020-02-05 13:04:19','2020-02-11 13:04:11','10.00',1,NULL,'2020-02-10 13:01:40','60.00',100,NULL),(45,1,'满30.88减5.50','2017-01-29 03:24:21','2020-02-28 03:24:21','5.50',1,NULL,'2020-02-10 13:05:31','30.88',100,NULL),(51,1,'满60减18','2020-02-19 00:00:00','2020-02-20 00:00:00','18.00',1,NULL,'2020-02-19 18:23:04','60.00',5,NULL);

/*Table structure for table `coupon_logs` */

DROP TABLE IF EXISTS `coupon_logs`;

CREATE TABLE `coupon_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增加ID',
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `coupon_receive_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `order_number` varchar(64) DEFAULT NULL COMMENT '订单号',
  `order_original_amount` decimal(12,2) DEFAULT NULL COMMENT '原订单金额',
  `coupon_amount` decimal(11,2) DEFAULT NULL COMMENT '优惠券的金额',
  `order_final_amount` decimal(12,2) DEFAULT NULL COMMENT '抵扣优惠券之后的订单金额',
  `create_time` datetime DEFAULT NULL COMMENT '领取时间',
  `status` int(2) DEFAULT '0' COMMENT '日志状态: 默认为0，支付回调成功后为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券消费记录表';

/*Data for the table `coupon_logs` */

/*Table structure for table `coupon_receive` */

DROP TABLE IF EXISTS `coupon_receive`;

CREATE TABLE `coupon_receive` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增加ID',
  `buyer_id` varchar(128) DEFAULT NULL COMMENT '买家ID',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券编号',
  `coupon_money` decimal(12,2) DEFAULT NULL COMMENT '券额',
  `create_time` datetime DEFAULT NULL COMMENT '领取时间',
  `full_money` decimal(12,2) DEFAULT NULL COMMENT '金额满',
  `status` int(11) DEFAULT NULL COMMENT '状态，1为已使用，0为已领取未使用，-1为已过期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='优惠券领取记录表';

/*Data for the table `coupon_receive` */

insert  into `coupon_receive`(`id`,`buyer_id`,`coupon_id`,`coupon_money`,`create_time`,`full_money`,`status`) values (46,'o2eE44zmxAp4ayABvPJKJTWlQ3F8',44,'10.00','2020-02-10 19:38:37','60.00',0),(48,'d1ba8f6aa86945af93ef0413989cc242',45,'5.50','2020-02-10 20:47:13','30.88',0),(53,'o2eE44zmxAp4ayABvPJKJTWlQ3F8',45,'5.50','2020-02-20 14:30:43','30.88',0),(54,'oZe4o45UWBsD7IrqDjb43JO-sWa4',45,'5.50','2020-02-20 14:53:16','30.88',0);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (64),(64),(64),(64),(64);

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

insert  into `order_detail`(`detail_id`,`order_id`,`product_id`,`product_name`,`product_price`,`product_quantity`,`product_icon`,`create_time`,`update_time`) values ('1579189267118168712','1579189266772210893','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-01-16 23:41:07','2020-01-16 23:41:07'),('1579189267163755544','1579189266772210893','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-01-16 23:41:07','2020-01-16 23:41:07'),('1579189267171902307','1579189266772210893','1579006977263208878','馒头','8.00',1,'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3937224001,500618140&fm=26&gp=0.jpg','2020-01-16 23:41:07','2020-01-16 23:41:07'),('1579328279897593156','1579328279580923368','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-01-18 14:18:00','2020-01-18 14:18:00'),('1579328280069316655','1579328279580923368','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-01-18 14:18:00','2020-01-18 14:18:00'),('1579329293421296422','1579329293412477820','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-01-18 14:34:53','2020-01-18 14:34:53'),('1579340671440966201','1579340671408199259','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-01-18 17:44:31','2020-01-18 17:44:31'),('1580990919160639241','1580990918920471231','1580713593334972163','烤猪蹄','16.00',1,'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3604829270,4041758916&fm=26&gp=0.jpg','2020-02-06 20:08:39','2020-02-06 20:08:39'),('1580990919325216806','1580990918920471231','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-02-06 20:08:39','2020-02-06 20:08:39'),('1580991147760584641','1580991147728754678','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-02-06 20:12:28','2020-02-06 20:12:28'),('1581008303162689187','1581008303130790530','1580713593334972163','烤猪蹄','16.00',1,'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3604829270,4041758916&fm=26&gp=0.jpg','2020-02-07 00:58:23','2020-02-07 00:58:23'),('1581497524599827019','1581497524473270841','1580714844524263405','什锦鲜菇汤','15.00',1,'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2015440988,3242633086&fm=26&gp=0.jpg','2020-02-12 16:52:02','2020-02-12 16:52:02'),('1582117015945790929','1582117015910611557','1580714844524263405','什锦鲜菇汤','15.00',2,'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2015440988,3242633086&fm=26&gp=0.jpg','2020-02-19 20:56:56','2020-02-19 20:56:56'),('1582177749446115078','1582177749440504349','1582124010924181620','红烧豆腐','15.00',1,'','2020-02-20 13:49:09','2020-02-20 13:49:09'),('1582177749455295300','1582177749440504349','1580714844524263405','什锦鲜菇汤','15.00',2,'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2015440988,3242633086&fm=26&gp=0.jpg','2020-02-20 13:49:09','2020-02-20 13:49:09'),('1582177749462451130','1582177749440504349','1580713593334972163','烤猪蹄','16.00',2,'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3604829270,4041758916&fm=26&gp=0.jpg','2020-02-20 13:49:09','2020-02-20 13:49:09'),('1582181612517131760','1582181612513198819','1580714844524263405','什锦鲜菇汤','15.00',1,'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2015440988,3242633086&fm=26&gp=0.jpg','2020-02-20 14:53:32','2020-02-20 14:53:32'),('1582187998962481826','1582187998831534075','1582124010924181620','红烧豆腐','15.00',1,'','2020-02-20 16:40:00','2020-02-20 16:40:00'),('1582187999144659058','1582187998831534075','1580714844524263405','什锦鲜菇汤','15.00',3,'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2015440988,3242633086&fm=26&gp=0.jpg','2020-02-20 16:40:00','2020-02-20 16:40:00'),('1582210957642289551','1582210952471158740','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-02-20 23:02:48','2020-02-20 23:02:48'),('1582210961065258419','1582210952471158740','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-02-20 23:02:48','2020-02-20 23:02:48'),('1582211761091185723','1582211761085484651','1580714691734239487','白切羊肉','25.00',1,'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=310945641,3324004650&fm=26&gp=0.jpg','2020-02-20 23:16:01','2020-02-20 23:16:01'),('1582211761113871415','1582211761085484651','1579006977263208878','馒头','8.00',1,'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3937224001,500618140&fm=26&gp=0.jpg','2020-02-20 23:16:01','2020-02-20 23:16:01'),('1582275724957838851','1582275724927139197','1579006915755905581','包子','10.00',1,'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg','2020-02-21 17:02:05','2020-02-21 17:02:05'),('1582275725016467871','1582275724927139197','1579006977263208878','馒头','8.00',1,'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3937224001,500618140&fm=26&gp=0.jpg','2020-02-21 17:02:05','2020-02-21 17:02:05'),('1582276918184239360','1582276918169370823','1579007021519580420','鸡翅','21.00',1,'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg','2020-02-21 17:21:58','2020-02-21 17:21:58'),('1582276918201425504','1582276918169370823','1580714691734239487','白切羊肉','25.00',1,'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=310945641,3324004650&fm=26&gp=0.jpg','2020-02-21 17:21:58','2020-02-21 17:21:58');

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

insert  into `order_master`(`order_id`,`buyer_name`,`buyer_phone`,`buyer_address`,`buyer_openid`,`order_amount`,`order_status`,`pay_status`,`create_time`,`update_time`) values ('1579189266772210893','米芾子','15805849785','广东省广州市海珠区新港中路397号','null','39.00',3,0,'2020-01-16 23:41:07','2020-02-21 18:44:01'),('1579328279580923368','米芾子','15805849785','广东省广州市海珠区新港中路397号','undefined','31.00',1,0,'2020-01-18 14:18:00','2020-02-21 18:43:58'),('1579329293412477820','米芾子','15805849785','广东省广州市海珠区新港中路397号','o2eE44zmxAp4ayABvPJKJTWlQ3F8','21.00',1,0,'2020-01-18 14:34:53','2020-02-21 18:43:55'),('1579340671408199259','米芾子','15805849785','广东省广州市海珠区新港中路397号','o2eE44zmxAp4ayABvPJKJTWlQ3F8','10.00',1,0,'2020-01-18 17:44:31','2020-02-21 18:43:57'),('1580990918920471231','米芾子','15805849785','广东省广州市海珠区新港中路397号','o2eE44zmxAp4ayABvPJKJTWlQ3F8','37.00',3,0,'2020-02-06 20:08:39','2020-02-21 18:43:55'),('1580991147728754678','春日花开','15805849785','广东省广州市海珠区新港中路397号','d1ba8f6aa86945af93ef0413989cc242','10.00',4,0,'2020-02-06 20:12:28','2020-02-21 18:43:54'),('1581008303130790530','春日花开','020-81167888','广东省广州市海珠区新港中路397号','d1ba8f6aa86945af93ef0413989cc242','16.00',4,0,'2020-02-07 00:58:23','2020-02-21 18:43:52'),('1581497524473270841','春日花开','020-81167888','广东省广州市海珠区新港中路397号','d1ba8f6aa86945af93ef0413989cc242','15.00',1,0,'2020-02-12 16:52:02','2020-02-21 18:44:09'),('1582117015910611557','潘小安','15805849785','广东省广州市海珠区新港中路397号','oZe4o45UWBsD7IrqDjb43JO-sWa4','30.00',1,0,'2020-02-19 20:56:56','2020-02-21 18:44:13'),('1582177749440504349','潘小安','15805849785','广东省广州市海珠区新港中路397号','oZe4o45UWBsD7IrqDjb43JO-sWa4','77.00',1,0,'2020-02-20 13:49:09','2020-02-21 18:44:14'),('1582181612513198819','潘小安','15805849785','广东省广州市海珠区新港中路397号','oZe4o45UWBsD7IrqDjb43JO-sWa4','15.00',1,0,'2020-02-20 14:53:32','2020-02-21 18:44:16'),('1582187998831534075','米芾子','020-81167888','广东省广州市海珠区新港中路397号','o2eE44zmxAp4ayABvPJKJTWlQ3F8','60.00',1,0,'2020-02-20 16:40:00','2020-02-20 16:40:00'),('1582210952471158740','米芾子','020-81167888','广东省广州市海珠区新港中路397号','o2eE44zmxAp4ayABvPJKJTWlQ3F8','31.00',1,0,'2020-02-20 23:02:48','2020-02-20 23:02:48'),('1582211761085484651','米芾子','020-81167888','广东省广州市海珠区新港中路397号','o2eE44zmxAp4ayABvPJKJTWlQ3F8','33.00',1,0,'2020-02-20 23:16:01','2020-02-20 23:16:01'),('1582275724927139197','春日花开','17328595170','广东省深圳市龙岗区坂田街道雪岗路2048号裕发日杂批发部','d1ba8f6aa86945af93ef0413989cc242','18.00',4,0,'2020-02-21 17:02:05','2020-02-21 17:04:01'),('1582276918169370823','春日花开','17328595170','广东省深圳市龙岗区坂田街道雪岗路2048号裕发日杂批发部','d1ba8f6aa86945af93ef0413989cc242','46.00',4,0,'2020-02-21 17:21:58','2020-02-21 17:23:04');

/*Table structure for table `picture` */

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_message` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图表';

/*Data for the table `picture` */

insert  into `picture`(`pic_id`,`pic_url`,`pic_message`,`create_time`,`update_time`) values (1,'http://img1.imgtn.bdimg.com/it/u=2996876122,1492146049&fm=26&gp=0.jpg','包子','2020-01-14 20:56:23','2020-01-14 20:56:23'),(2,'http://img2.imgtn.bdimg.com/it/u=2281438771,1835161639&fm=26&gp=0.jpg','满汉全席','2020-01-14 20:57:07','2020-01-14 20:57:07'),(3,'http://img5.imgtn.bdimg.com/it/u=2291605549,2231893190&fm=26&gp=0.jpg','聚餐','2020-01-14 20:57:38','2020-01-14 20:57:38'),(19,'http://img1.imgtn.bdimg.com/it/u=2223428269,3382032448&fm=15&gp=0.jpg','主食','2020-02-01 00:36:23','2020-02-01 12:37:11');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='类目表';

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`,`category_type`,`create_time`,`update_time`,`seller_id`) values (1,'汤羹',4,'2020-01-12 17:32:11','2020-02-03 14:21:45',NULL),(4,'招牌',0,'2020-01-14 20:58:19','2020-02-03 14:21:45',NULL),(5,'凉菜',2,'2020-01-14 20:58:53','2020-02-03 14:21:46',NULL),(6,'蒸菜',1,'2020-01-14 21:00:06','2020-02-03 14:21:47',NULL),(7,'米饭',3,'2020-01-14 21:00:30','2020-02-03 14:21:51',NULL);

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
  `seller_id` int(11) DEFAULT NULL,
  `taste` int(11) DEFAULT NULL COMMENT '0：甜， 1酸 2苦 3辣 4咸',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品表';

/*Data for the table `product_info` */

insert  into `product_info`(`product_id`,`product_name`,`product_price`,`product_stock`,`product_description`,`product_icon`,`product_status`,`category_type`,`create_time`,`update_time`,`seller_id`,`taste`,`sales`) values ('1579006915755905581','包子','10.00',993,'','https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2559493198,3975555936&fm=26&gp=0.jpg',1,3,'2020-01-14 21:01:55','2020-02-21 17:02:05',NULL,0,3),('1579006977263208878','馒头','8.00',95,'','https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3937224001,500618140&fm=26&gp=0.jpg',0,3,'2020-01-14 21:02:57','2020-02-21 17:02:05',NULL,0,4),('1579007021519580420','鸡翅','21.00',114,'','https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1475126809,662536882&fm=26&gp=0.jpg',0,0,'2020-01-14 21:03:41','2020-02-21 17:21:58',NULL,3,5),('1580713593334972163','烤猪蹄','16.00',46,'','https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3604829270,4041758916&fm=26&gp=0.jpg',0,0,'2020-02-03 15:06:33','2020-02-20 13:49:09',NULL,3,6),('1580714691734239487','白切羊肉','25.00',288,'','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=310945641,3324004650&fm=26&gp=0.jpg',0,2,'2020-02-03 15:24:51','2020-02-21 17:21:58',NULL,0,7),('1580714785469311728','武昌鱼','56.00',150,'','https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=497370136,2775950251&fm=26&gp=0.jpg',0,1,'2020-02-03 15:26:25','2020-02-20 12:44:29',NULL,3,6),('1580714844524263405','什锦鲜菇汤','15.00',247,'','https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2015440988,3242633086&fm=26&gp=0.jpg',0,4,'2020-02-03 15:27:24','2020-02-20 16:40:00',NULL,1,15),('1582124010924181620','红烧豆腐','15.00',98,'美味无敌','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2929234463,1516348364&fm=26&gp=0.jpg',0,0,'2020-02-19 22:53:31','2020-02-20 22:44:22',NULL,3,2),('1582204005064657538','红烧鱼','30.00',100,'红烧鱼普通的红烧鱼','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582219962634&di=142caef9f459cb45b0e27e3ec15675de&imgtype=0&src=http%3A%2F%2Fi8.meishichina.com%2Fattachment%2Frecipe%2F2018%2F11%2F28%2F20181128154337882222119541848.jpg%3Fx-oss-process%3Dstyle%2Fp800',0,0,'2020-02-20 21:06:45','2020-02-20 22:44:55',NULL,3,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='卖家信息表';

/*Data for the table `seller_info` */

insert  into `seller_info`(`seller_id`,`username`,`password`,`phone`,`create_time`,`update_time`) values (1,'春日花开','123456','13814070616','2020-01-12 16:15:30','2020-02-12 15:11:39'),(20,'瞻之在前','123456','17328595170','2020-02-02 22:57:20','2020-02-02 22:57:20'),(50,'潭格立安','123456','18123838201','2020-02-19 19:43:37','2020-02-19 19:43:37');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信openid',
  `token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `zhuohao` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '桌号',
  `renshu` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '就餐人数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `city` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `province` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`openid`,`token`,`avatar_url`,`zhuohao`,`renshu`,`create_time`,`update_time`,`city`,`gender`,`province`,`country`) values (14,'春日花开','123456','17328595170','d1ba8f6aa86945af93ef0413989cc242','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWJhOGY2YWE4Njk0NWFmOTNlZjA0MTM5ODljYzI0MiIsImV4cCI6MTU4MjI3OTE4OH0.8PXPdSIfvUT2H44qZJxpMOik0BDyPDeQ-uMuy8-lJdE','http://zhanke.site:8080/sell/images/avatar/default.png',NULL,NULL,'2020-01-22 18:59:08','2020-02-21 17:54:49','太原市',NULL,'山西省',NULL),(24,'米芾子',NULL,NULL,'o2eE44zmxAp4ayABvPJKJTWlQ3F8','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJvMmVFNDR6bXhBcDRheUFCdlBKS0pUV2xRM0Y4IiwiZXhwIjoxNTgyMjc3MzQ4fQ.tyvq6jRshETHKJMhGDX6aeyG9sMhH_PvtgTbtSQGznc','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqt5CQYn9Qvv0ySH4CpibSWHwMGDfaygXvl2icALDBC5vicauLOKGdzu62VichicKiboHsvo13ZmrWKfxUg/132',NULL,NULL,'2020-02-05 20:42:01','2020-02-21 17:24:09','北京市',NULL,'北京市','China'),(34,'18123838201','123456',NULL,'197c2c5b2f314f44864b946454a28829','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOTdjMmM1YjJmMzE0ZjQ0ODY0Yjk0NjQ1NGEyODgyOSIsImV4cCI6MTU4MTA2Mjg3OX0.Wy_ZDLCeYdM6KMbXNg15d-nBFqYhc7an7fJQ5KqkTbc',NULL,NULL,NULL,'2020-02-07 16:02:59','2020-02-07 16:02:59',NULL,NULL,NULL,NULL),(38,'136985165','1234','136985165','500b16edf0ae45638fea57dd76944ba3',NULL,'http://zhanke.site:8080/sell/images/avatar/default.png',NULL,NULL,'2020-02-07 16:38:26','2020-02-21 17:52:46',NULL,NULL,NULL,NULL),(39,'4132613','1411','4132613','0402b145693c4a72b4dbe475e0e51bf1',NULL,'http://zhanke.site:8080/sell/images/avatar/default.png',NULL,NULL,'2020-02-07 16:47:11','2020-02-21 17:52:43',NULL,NULL,NULL,NULL),(40,'潘小安',NULL,NULL,'oZe4o45UWBsD7IrqDjb43JO-sWa4','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJvWmU0bzQ1VVdCc0Q3SXJxRGpiNDNKTy1zV2E0IiwiZXhwIjoxNTgyMTE0ODQ4fQ.DdwX_wLV1ilBm-14sOZ8dzikUzHAn2rF9G05Ch9p83E','https://wx.qlogo.cn/mmopen/vi_32/mdC0tcsJI8fahMC177I9FLxy0VCzOVtc6kDzMeGibDo9K1iaBk9kV5w1nTvYibgEoick7Fd4PibwQ41BbkyF9juLRpw/132',NULL,NULL,'2020-02-07 16:59:00','2020-02-19 20:15:49','天津市',1,'天津市','China'),(61,'13698003254','123456','13698003254','2f1c5587408240559b6042833b161d4f','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjFjNTU4NzQwODI0MDU1OWI2MDQyODMzYjE2MWQ0ZiIsImV4cCI6MTU4MjI3NzQ0M30.LHOeOJZDC28he7tP-YryCmq_m7CjkUChhyj4DyCDwOc','http://zhanke.site:8080/sell/images/avatar/default.png',NULL,NULL,'2020-02-21 17:25:08','2020-02-21 17:52:55',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
