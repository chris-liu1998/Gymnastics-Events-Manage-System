/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50701
Source Host           : localhost:3306
Source Database       : db_sport2

Target Server Type    : MYSQL
Target Server Version : 50701
File Encoding         : 65001

Date: 2019-05-18 22:49:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addtime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '管理员', '15545678917', '2017-05-22 12:34:32');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sport` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ctime` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `stime` varchar(20) DEFAULT NULL,
  `etime` varchar(20) DEFAULT NULL,
  `usort` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_udx` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('24', '22', '跳马', '2019-06-27', '体育管馆B区', '分', '2019-03-01', '2019-08-01', 'asc');
INSERT INTO `event` VALUES ('26', '22', '吊环', '2019-06-27', '体育管馆B区', '分', '2019-03-01', '2019-08-01', 'desc');
INSERT INTO `event` VALUES ('27', '22', '双杠', '2019-06-27', '体育管馆B区', '分', '2019-03-01', '2019-08-01', 'desc');
INSERT INTO `event` VALUES ('28', '22', '单杠', '2019-06-27', '体育管馆B区', '分', '2019-03-01', '2019-08-01', 'desc');
INSERT INTO `event` VALUES ('30', '22', '自由体操', '2019-06-27', '体育管馆B区', '分', '2019-03-01', '2019-08-01', 'desc');
INSERT INTO `event` VALUES ('31', '22', '鞍马', '2019-06-27', '体育管馆B区', '分', '2019-03-01', '2019-08-01', 'desc');

-- ----------------------------
-- Table structure for extend_event
-- ----------------------------
DROP TABLE IF EXISTS `extend_event`;
CREATE TABLE `extend_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(50) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `event_name` varchar(50) DEFAULT NULL,
  `event_ctime` varchar(30) DEFAULT NULL,
  `event_address` varchar(100) DEFAULT NULL,
  `event_score` float(10,2) DEFAULT NULL,
  `event_unit` varchar(10) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL,
  `teamname` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `mname` varchar(30) DEFAULT NULL,
  `mnum` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT '待审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extend_event
-- ----------------------------
INSERT INTO `extend_event` VALUES ('4', '第4界全国体操赛', '27', '双杠', '2019-06-27', '体育管馆B区', '6.30', '分', '18', '梦之队', '18', '019', 'B105', '已通过');
INSERT INTO `extend_event` VALUES ('6', '第4界全国体操赛', '31', '鞍马', '2019-06-27', '体育管馆B区', '8.90', '分', '21', '水之5队', '20', '021', 'X1093', '已通过');
INSERT INTO `extend_event` VALUES ('7', '第4界全国体操赛', '30', '自由体操', '2019-06-27', '体育管馆B区', '5.50', '分', '21', '水之5队', '21', '022', 'X1094', '已通过');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `teamid` int(4) DEFAULT NULL,
  `hnum` varchar(30) DEFAULT '',
  `realname` varchar(30) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `regtime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('10', '18', '011', '童宾梦', '男', '23', '16855125521', '2017-07-03 17:51:09');
INSERT INTO `member` VALUES ('18', '18', '019', '张三丰', '男', '23', '13941297417', '2017-07-19 21:27:33');
INSERT INTO `member` VALUES ('19', '18', '020', '陶肖英', '女', '25', '15712348585', '2019-05-18 18:59:34');
INSERT INTO `member` VALUES ('20', '21', '021', '王订', '男', '19', '12354325325', '2019-05-18 20:51:48');
INSERT INTO `member` VALUES ('21', '21', '022', '陈红', '女', '21', '14245678917', '2019-05-18 20:52:12');

-- ----------------------------
-- Table structure for sport
-- ----------------------------
DROP TABLE IF EXISTS `sport`;
CREATE TABLE `sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_udx` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sport
-- ----------------------------
INSERT INTO `sport` VALUES ('22', '第4界全国体操赛', '进行中');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `hnum` varchar(30) DEFAULT '',
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `regtime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('18', 'B101', '123456', '梦之队', '13941297417', '参赛队', '2017-07-19 21:27:33');
INSERT INTO `team` VALUES ('19', 'C01', '123456', '李四', '14514512312', '参赛队', '2019-05-18 19:55:36');
INSERT INTO `team` VALUES ('20', 'X093', '123456', '李小三', '15521455214', '裁判组', '2019-05-18 19:56:14');
INSERT INTO `team` VALUES ('21', 'X001', '123456', '水之5队', '18812514257', '参赛队', '2019-05-18 20:47:24');
