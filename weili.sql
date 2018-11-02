/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : weili

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-02 17:48:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `role_id` smallint(5) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `login_ip` char(15) DEFAULT NULL,
  `login_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'lining', '4297f44b13955235245b2497399d7a93', '1366435203@qq.com', '1', '3', '李宁', '127.0.0.1', '1541123309', null, '1541123309', '1528266520');
INSERT INTO `admin` VALUES ('2', 'anzhuo', '4297f44b13955235245b2497399d7a93', '9607852134@163.com', '2', '1', '安卓大哥', '115.10.31.119', '1528352485', null, '1529032007', '1528352120');
INSERT INTO `admin` VALUES ('3', 'xingge', '733d7be2196ff70efaf6913fc8bdcabf', 'laixing@163.com', '1', '1', '潘来星', '116.226.24.127', '1534483894', null, '1534483894', '1528364593');
INSERT INTO `admin` VALUES ('4', 'chenyao', 'e10adc3949ba59abbe56e057f20f883e', 'chenyao@qq.com', '1', '1', '陈瑶', '218.75.157.166', '1540861586', null, '1540861586', '1528364907');
INSERT INTO `admin` VALUES ('5', 'qiangge', '4297f44b13955235245b2497399d7a93', 'qiangge@123.com', '1', '2', '黄老师', '127.0.0.1', '1528441127', null, '1529031887', '1528426827');
INSERT INTO `admin` VALUES ('6', 'haili', '4297f44b13955235245b2497399d7a93', 'huanglaoshi@123.com', '2', '3', '黄老师', null, null, '1528447490', '1528447439', '1528426876');
INSERT INTO `admin` VALUES ('7', 'lizhiwei', '6b23000a73a97ccdb343bc06ec23aea5', null, '1', '1', 'lizhiwei', null, null, null, '1532683416', '1532683416');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '管理员ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for `app_info`
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) NOT NULL,
  `bg_color` varchar(200) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `app_id` varchar(20) NOT NULL,
  `app_key` varchar(32) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES ('1', '听玩游戏宝', '#64CB5F', './upload/image/20180822/b0193be8450fe737519c5ca5d5f704bz.jpg', 'rESQtswdK9wO0cxD', 'c6acdd53ef809736c59af49b8d6b0b70', '1532661580', '1532661580');
INSERT INTO `app_info` VALUES ('2', '斗蟹游戏', '#FF0000', './upload/image/20180822/b0193be8450fe737519c5ca5d5f704bz.jpg', 'rjm2MjPHhQRnGmPV', 'f7a31c5eb82f8b46610791b715f1adbe', '1532661661', '1532661661');
INSERT INTO `app_info` VALUES ('3', '闪电头条', '#FF0000', './upload/image/20180822/d091723fbc8071126aa4769f2433casd.png', 'jblRpcEzBBnmXpzq', 'f0fdf2de00377318aa1ffe88b1c1184d', '1533520344', '1533520344');

-- ----------------------------
-- Table structure for `app_invite`
-- ----------------------------
DROP TABLE IF EXISTS `app_invite`;
CREATE TABLE `app_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `first_extra_coin` int(10) DEFAULT NULL,
  `invite_coin_arr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_invite
-- ----------------------------
INSERT INTO `app_invite` VALUES ('1', '1', '1', '10000', '3000,5000,4000,3000,3000,3000,4000,5000');
INSERT INTO `app_invite` VALUES ('2', '1', '2', null, '500,400,300,300,300,400,500');
INSERT INTO `app_invite` VALUES ('3', '3', '1', '10000', '3000,5000,4000,3000,3000,3000,4000,5000');
INSERT INTO `app_invite` VALUES ('4', '3', '2', null, '500,400,300,300,300,400,500');

-- ----------------------------
-- Table structure for `app_sign`
-- ----------------------------
DROP TABLE IF EXISTS `app_sign`;
CREATE TABLE `app_sign` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_id` int(10) NOT NULL,
  `reward_coin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_sign
-- ----------------------------
INSERT INTO `app_sign` VALUES ('1', '1', '50,100,660,880,150,200,2880,100,330,100,660,100,100,3880');
INSERT INTO `app_sign` VALUES ('2', '3', '50,100,660,880,150,200,2880,100,330,100,660,100,100,3880');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_info_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1', '0', '听完APP', '0,1', '1', '1532661580', '1532661580');
INSERT INTO `category` VALUES ('2', '1', '1', '每日任务', '0,1,2', '2', '1532661626', '1532661626');
INSERT INTO `category` VALUES ('3', '1', '1', '新手任务', '0,1,3', '2', '1532661631', '1532661631');
INSERT INTO `category` VALUES ('4', '2', '0', '斗蟹游戏', '0,4', '1', '1532661661', '1532661661');
INSERT INTO `category` VALUES ('5', '2', '4', '每日任务', '0,4,5', '2', '1532661673', '1532661673');
INSERT INTO `category` VALUES ('6', '2', '4', '新手任务', '0,4,6', '2', '1532661681', '1532661681');
INSERT INTO `category` VALUES ('7', '1', '1', '玩游戏', '0,1,7', '2', '1533116513', '1533116513');
INSERT INTO `category` VALUES ('8', '3', '0', '闪电头条', '0,8', '1', '1533520344', '1533520344');
INSERT INTO `category` VALUES ('9', '3', '8', '每日任务', '0,8,9', '2', '1533521036', '1533521036');
INSERT INTO `category` VALUES ('10', '3', '8', '新手任务', '0,8,10', '2', '1533521044', '1533521044');

-- ----------------------------
-- Table structure for `coins_log`
-- ----------------------------
DROP TABLE IF EXISTS `coins_log`;
CREATE TABLE `coins_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `app_id` varchar(200) NOT NULL,
  `operate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-增加2-减少',
  `type` tinyint(2) DEFAULT '0' COMMENT '区别是什么任务获得',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coins_log
-- ----------------------------
INSERT INTO `coins_log` VALUES ('1', '13000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1534389564', '1534389564');
INSERT INTO `coins_log` VALUES ('2', '3000', '1252', 'rESQtswdK9wO0cxD', '1', '6', '1534389564', '1534389564');
INSERT INTO `coins_log` VALUES ('3', '3000', '1153', 'rESQtswdK9wO0cxD', '1', '5', '1534389617', '1534389617');
INSERT INTO `coins_log` VALUES ('4', '5000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1534389617', '1534389617');
INSERT INTO `coins_log` VALUES ('5', '3000', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1534389825', '1534389825');
INSERT INTO `coins_log` VALUES ('6', '4000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1534389825', '1534389825');
INSERT INTO `coins_log` VALUES ('7', '13000', '1252', 'rESQtswdK9wO0cxD', '1', '6', '1534389911', '1534389911');
INSERT INTO `coins_log` VALUES ('8', '3000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1534389911', '1534389911');
INSERT INTO `coins_log` VALUES ('9', '13000', '1289', 'rESQtswdK9wO0cxD', '1', '6', '1534390123', '1534390123');
INSERT INTO `coins_log` VALUES ('10', '3000', '1244', 'rESQtswdK9wO0cxD', '1', '6', '1534390123', '1534390123');
INSERT INTO `coins_log` VALUES ('11', '50', '1244', 'rESQtswdK9wO0cxD', '1', '7', '1534390137', '1534390137');
INSERT INTO `coins_log` VALUES ('12', '3000', '1139', 'rESQtswdK9wO0cxD', '1', '5', '1534390174', '1534390174');
INSERT INTO `coins_log` VALUES ('13', '5000', '1289', 'rESQtswdK9wO0cxD', '1', '6', '1534390174', '1534390174');
INSERT INTO `coins_log` VALUES ('14', '50', '1289', 'rESQtswdK9wO0cxD', '1', '7', '1534390355', '1534390355');
INSERT INTO `coins_log` VALUES ('15', '1500', '6', 'jblRpcEzBBnmXpzq', '1', '5', '1534392765', '1534392765');
INSERT INTO `coins_log` VALUES ('16', '550', '6', 'jblRpcEzBBnmXpzq', '1', '5', '1534392927', '1534392927');
INSERT INTO `coins_log` VALUES ('17', '100', '6', 'jblRpcEzBBnmXpzq', '1', '5', '1534393292', '1534393292');
INSERT INTO `coins_log` VALUES ('18', '100', '1289', 'rESQtswdK9wO0cxD', '1', '5', '1534402871', '1534402871');
INSERT INTO `coins_log` VALUES ('19', '10000', '1289', 'rESQtswdK9wO0cxD', '2', '8', '1534402883', '1534402883');
INSERT INTO `coins_log` VALUES ('20', '50', '1139', 'rESQtswdK9wO0cxD', '1', '7', '1534403848', '1534403848');
INSERT INTO `coins_log` VALUES ('21', '1000', '1139', 'rESQtswdK9wO0cxD', '1', '5', '1534403882', '1534403882');
INSERT INTO `coins_log` VALUES ('22', '1000', '1139', 'rESQtswdK9wO0cxD', '1', '5', '1534403952', '1534403952');
INSERT INTO `coins_log` VALUES ('23', '100', '1139', 'rESQtswdK9wO0cxD', '1', '5', '1534404014', '1534404014');
INSERT INTO `coins_log` VALUES ('24', '100', '1252', 'rESQtswdK9wO0cxD', '1', '5', '1534404679', '1534404679');
INSERT INTO `coins_log` VALUES ('25', '100', '1249', 'rESQtswdK9wO0cxD', '1', '5', '1534404708', '1534404708');
INSERT INTO `coins_log` VALUES ('26', '100', '1249', 'rESQtswdK9wO0cxD', '1', '5', '1534404813', '1534404813');
INSERT INTO `coins_log` VALUES ('27', '100', '1252', 'rESQtswdK9wO0cxD', '1', '5', '1534406692', '1534406692');
INSERT INTO `coins_log` VALUES ('28', '10000', '1252', 'rESQtswdK9wO0cxD', '2', '8', '1534406705', '1534406705');
INSERT INTO `coins_log` VALUES ('29', '100', '1252', 'rESQtswdK9wO0cxD', '1', '5', '1534409103', '1534409103');
INSERT INTO `coins_log` VALUES ('30', '10000', '1252', 'rESQtswdK9wO0cxD', '2', '8', '1534410312', '1534410312');
INSERT INTO `coins_log` VALUES ('31', '50', '1252', 'rESQtswdK9wO0cxD', '1', '7', '1534470908', '1534470908');
INSERT INTO `coins_log` VALUES ('32', '100', '11', 'jblRpcEzBBnmXpzq', '1', '5', '1534471587', '1534471587');
INSERT INTO `coins_log` VALUES ('33', '550', '15', 'jblRpcEzBBnmXpzq', '1', '5', '1534473701', '1534473701');
INSERT INTO `coins_log` VALUES ('34', '550', '17', 'jblRpcEzBBnmXpzq', '1', '5', '1534475198', '1534475198');
INSERT INTO `coins_log` VALUES ('35', '50', '15', 'jblRpcEzBBnmXpzq', '1', '7', '1534476767', '1534476767');
INSERT INTO `coins_log` VALUES ('36', '100', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1534478168', '1534478168');
INSERT INTO `coins_log` VALUES ('37', '550', '6', 'jblRpcEzBBnmXpzq', '1', '5', '1534481980', '1534481980');
INSERT INTO `coins_log` VALUES ('38', '550', '12', 'jblRpcEzBBnmXpzq', '1', '5', '1534484204', '1534484204');
INSERT INTO `coins_log` VALUES ('39', '50', '9', 'jblRpcEzBBnmXpzq', '1', '7', '1534485116', '1534485116');
INSERT INTO `coins_log` VALUES ('40', '100', '1', 'jblRpcEzBBnmXpzq', '1', '5', '1534485596', '1534485596');
INSERT INTO `coins_log` VALUES ('41', '550', '1', 'jblRpcEzBBnmXpzq', '1', '5', '1534485614', '1534485614');
INSERT INTO `coins_log` VALUES ('42', '1500', '1', 'jblRpcEzBBnmXpzq', '1', '5', '1534485632', '1534485632');
INSERT INTO `coins_log` VALUES ('43', '1500', '12', 'jblRpcEzBBnmXpzq', '1', '5', '1534486736', '1534486736');
INSERT INTO `coins_log` VALUES ('44', '30000', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1534490315', '1534490315');
INSERT INTO `coins_log` VALUES ('45', '50', '12', 'jblRpcEzBBnmXpzq', '1', '7', '1534490704', '1534490704');
INSERT INTO `coins_log` VALUES ('46', '550', '1', 'jblRpcEzBBnmXpzq', '1', '5', '1534490706', '1534490706');
INSERT INTO `coins_log` VALUES ('47', '550', '12', 'jblRpcEzBBnmXpzq', '1', '5', '1534490942', '1534490942');
INSERT INTO `coins_log` VALUES ('48', '50', '16', 'jblRpcEzBBnmXpzq', '1', '7', '1534493897', '1534493897');
INSERT INTO `coins_log` VALUES ('49', '100', '15', 'jblRpcEzBBnmXpzq', '1', '5', '1534495449', '1534495449');
INSERT INTO `coins_log` VALUES ('50', '100', '6', 'jblRpcEzBBnmXpzq', '1', '5', '1534499723', '1534499723');
INSERT INTO `coins_log` VALUES ('51', '10000', '1252', 'rESQtswdK9wO0cxD', '1', '9', '1534500353', '1534500353');
INSERT INTO `coins_log` VALUES ('52', '550', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534502687', '1534502687');
INSERT INTO `coins_log` VALUES ('53', '1500', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534502721', '1534502721');
INSERT INTO `coins_log` VALUES ('54', '550', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534502967', '1534502967');
INSERT INTO `coins_log` VALUES ('55', '550', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534503174', '1534503174');
INSERT INTO `coins_log` VALUES ('56', '100', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1534557850', '1534557850');
INSERT INTO `coins_log` VALUES ('57', '100', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1534557870', '1534557870');
INSERT INTO `coins_log` VALUES ('58', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1534557904', '1534557904');
INSERT INTO `coins_log` VALUES ('59', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1534559051', '1534559051');
INSERT INTO `coins_log` VALUES ('60', '50', '1139', 'rESQtswdK9wO0cxD', '1', '7', '1534559073', '1534559073');
INSERT INTO `coins_log` VALUES ('61', '1500', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534648153', '1534648153');
INSERT INTO `coins_log` VALUES ('62', '550', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534661638', '1534661638');
INSERT INTO `coins_log` VALUES ('63', '550', '9', 'jblRpcEzBBnmXpzq', '1', '5', '1534667529', '1534667529');
INSERT INTO `coins_log` VALUES ('64', '50', '1289', 'rESQtswdK9wO0cxD', '1', '7', '1534728707', '1534728707');
INSERT INTO `coins_log` VALUES ('65', '50', '16', 'jblRpcEzBBnmXpzq', '1', '7', '1534729767', '1534729767');
INSERT INTO `coins_log` VALUES ('66', '50', '6', 'jblRpcEzBBnmXpzq', '1', '7', '1534731426', '1534731426');
INSERT INTO `coins_log` VALUES ('67', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1534733580', '1534733580');
INSERT INTO `coins_log` VALUES ('68', '50', '13', 'jblRpcEzBBnmXpzq', '1', '7', '1534869511', '1534869511');
INSERT INTO `coins_log` VALUES ('69', '550', '19', 'jblRpcEzBBnmXpzq', '1', '5', '1534907168', '1534907168');
INSERT INTO `coins_log` VALUES ('70', '550', '19', 'jblRpcEzBBnmXpzq', '1', '5', '1534907202', '1534907202');
INSERT INTO `coins_log` VALUES ('71', '100', '19', 'jblRpcEzBBnmXpzq', '1', '5', '1534907287', '1534907287');
INSERT INTO `coins_log` VALUES ('72', '50', '16', 'jblRpcEzBBnmXpzq', '1', '7', '1534921167', '1534921167');
INSERT INTO `coins_log` VALUES ('73', '1000', '1159', 'rESQtswdK9wO0cxD', '1', '5', '1535017429', '1535017429');
INSERT INTO `coins_log` VALUES ('74', '1000', '1159', 'rESQtswdK9wO0cxD', '1', '5', '1535017444', '1535017444');
INSERT INTO `coins_log` VALUES ('75', '50', '1159', 'rESQtswdK9wO0cxD', '1', '7', '1535017480', '1535017480');
INSERT INTO `coins_log` VALUES ('76', '50', '1153', 'rESQtswdK9wO0cxD', '1', '7', '1535036617', '1535036617');
INSERT INTO `coins_log` VALUES ('77', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1535115022', '1535115022');
INSERT INTO `coins_log` VALUES ('78', '2000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1535115027', '1535115027');
INSERT INTO `coins_log` VALUES ('79', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1535115103', '1535115103');
INSERT INTO `coins_log` VALUES ('80', '50', '1139', 'rESQtswdK9wO0cxD', '1', '7', '1535355963', '1535355963');
INSERT INTO `coins_log` VALUES ('81', '13000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535426776', '1535426776');
INSERT INTO `coins_log` VALUES ('82', '3000', '1292', 'rESQtswdK9wO0cxD', '1', '6', '1535426776', '1535426776');
INSERT INTO `coins_log` VALUES ('83', '3000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1535426874', '1535426874');
INSERT INTO `coins_log` VALUES ('84', '5000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535426874', '1535426874');
INSERT INTO `coins_log` VALUES ('85', '50', '1303', 'rESQtswdK9wO0cxD', '1', '7', '1535433901', '1535433901');
INSERT INTO `coins_log` VALUES ('86', '13000', '67219', 'rESQtswdK9wO0cxD', '1', '6', '1535434071', '1535434071');
INSERT INTO `coins_log` VALUES ('87', '3000', '1304', 'rESQtswdK9wO0cxD', '1', '6', '1535434071', '1535434071');
INSERT INTO `coins_log` VALUES ('88', '3000', '1305', 'rESQtswdK9wO0cxD', '1', '5', '1535434345', '1535434345');
INSERT INTO `coins_log` VALUES ('89', '5000', '67219', 'rESQtswdK9wO0cxD', '1', '6', '1535434345', '1535434345');
INSERT INTO `coins_log` VALUES ('90', '3000', '1304', 'rESQtswdK9wO0cxD', '1', '6', '1535436755', '1535436755');
INSERT INTO `coins_log` VALUES ('91', '3000', '67219', 'rESQtswdK9wO0cxD', '1', '6', '1535436755', '1535436755');
INSERT INTO `coins_log` VALUES ('92', '3000', '1305', 'rESQtswdK9wO0cxD', '1', '6', '1535436792', '1535436792');
INSERT INTO `coins_log` VALUES ('93', '3000', '67219', 'rESQtswdK9wO0cxD', '1', '6', '1535436792', '1535436792');
INSERT INTO `coins_log` VALUES ('94', '100', '1303', 'rESQtswdK9wO0cxD', '1', '7', '1535509016', '1535509016');
INSERT INTO `coins_log` VALUES ('95', '1000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1535509044', '1535509044');
INSERT INTO `coins_log` VALUES ('96', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1535509173', '1535509173');
INSERT INTO `coins_log` VALUES ('97', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1535509247', '1535509247');
INSERT INTO `coins_log` VALUES ('98', '1000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1535530587', '1535530587');
INSERT INTO `coins_log` VALUES ('99', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1535530605', '1535530605');
INSERT INTO `coins_log` VALUES ('100', '660', '1303', 'rESQtswdK9wO0cxD', '1', '7', '1535621019', '1535621019');
INSERT INTO `coins_log` VALUES ('101', '100', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1535621038', '1535621038');
INSERT INTO `coins_log` VALUES ('102', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1535621057', '1535621057');
INSERT INTO `coins_log` VALUES ('103', '1000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1535621077', '1535621077');
INSERT INTO `coins_log` VALUES ('104', '1000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1535623203', '1535623203');
INSERT INTO `coins_log` VALUES ('105', '5000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535623203', '1535623203');
INSERT INTO `coins_log` VALUES ('106', '50', '1303', 'rESQtswdK9wO0cxD', '1', '7', '1535788327', '1535788327');
INSERT INTO `coins_log` VALUES ('107', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1535788337', '1535788337');
INSERT INTO `coins_log` VALUES ('108', '1000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1535788358', '1535788358');
INSERT INTO `coins_log` VALUES ('109', '4000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535788358', '1535788358');
INSERT INTO `coins_log` VALUES ('110', '1000', '1303', 'rESQtswdK9wO0cxD', '1', '5', '1536058378', '1536058378');
INSERT INTO `coins_log` VALUES ('111', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536058378', '1536058378');
INSERT INTO `coins_log` VALUES ('112', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1536060449', '1536060449');
INSERT INTO `coins_log` VALUES ('113', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1536060474', '1536060474');
INSERT INTO `coins_log` VALUES ('114', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1536112587', '1536112587');
INSERT INTO `coins_log` VALUES ('115', '50', '1303', 'rESQtswdK9wO0cxD', '1', '7', '1536115341', '1536115341');
INSERT INTO `coins_log` VALUES ('116', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1536202020', '1536202020');
INSERT INTO `coins_log` VALUES ('117', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1536205209', '1536205209');
INSERT INTO `coins_log` VALUES ('118', '5000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536205209', '1536205209');
INSERT INTO `coins_log` VALUES ('119', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1536236621', '1536236621');
INSERT INTO `coins_log` VALUES ('120', '4000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536236621', '1536236621');
INSERT INTO `coins_log` VALUES ('121', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1536237492', '1536237492');
INSERT INTO `coins_log` VALUES ('122', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536237492', '1536237492');
INSERT INTO `coins_log` VALUES ('123', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536237502', '1536237502');
INSERT INTO `coins_log` VALUES ('124', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1536285517', '1536285517');
INSERT INTO `coins_log` VALUES ('125', '50', '1310', 'rESQtswdK9wO0cxD', '1', '7', '1536295683', '1536295683');
INSERT INTO `coins_log` VALUES ('126', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536311041', '1536311041');
INSERT INTO `coins_log` VALUES ('127', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1536543894', '1536543894');
INSERT INTO `coins_log` VALUES ('128', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1536543924', '1536543924');
INSERT INTO `coins_log` VALUES ('129', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536567317', '1536567317');
INSERT INTO `coins_log` VALUES ('130', '50', '1152', 'rESQtswdK9wO0cxD', '1', '7', '1536570854', '1536570854');
INSERT INTO `coins_log` VALUES ('131', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536630752', '1536630752');
INSERT INTO `coins_log` VALUES ('132', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1536631048', '1536631048');
INSERT INTO `coins_log` VALUES ('133', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536631048', '1536631048');
INSERT INTO `coins_log` VALUES ('134', '660', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536716348', '1536716348');
INSERT INTO `coins_log` VALUES ('135', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1536717034', '1536717034');
INSERT INTO `coins_log` VALUES ('136', '880', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536825613', '1536825613');
INSERT INTO `coins_log` VALUES ('137', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1536825626', '1536825626');
INSERT INTO `coins_log` VALUES ('138', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536825626', '1536825626');
INSERT INTO `coins_log` VALUES ('139', '150', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1536892987', '1536892987');
INSERT INTO `coins_log` VALUES ('140', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1536893005', '1536893005');
INSERT INTO `coins_log` VALUES ('141', '4000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1536893005', '1536893005');
INSERT INTO `coins_log` VALUES ('142', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1537012163', '1537012163');
INSERT INTO `coins_log` VALUES ('143', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1537147777', '1537147777');
INSERT INTO `coins_log` VALUES ('144', '100', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1537154148', '1537154148');
INSERT INTO `coins_log` VALUES ('145', '50000', '1151', 'rESQtswdK9wO0cxD', '2', '8', '1537154156', '1537154156');
INSERT INTO `coins_log` VALUES ('146', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1537154250', '1537154250');
INSERT INTO `coins_log` VALUES ('147', '2000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1537154252', '1537154252');
INSERT INTO `coins_log` VALUES ('148', '100', '1305', 'rESQtswdK9wO0cxD', '1', '5', '1537155121', '1537155121');
INSERT INTO `coins_log` VALUES ('149', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1537163780', '1537163780');
INSERT INTO `coins_log` VALUES ('150', '50', '12', 'jblRpcEzBBnmXpzq', '1', '7', '1537172332', '1537172332');
INSERT INTO `coins_log` VALUES ('151', '550', '12', 'jblRpcEzBBnmXpzq', '1', '5', '1537177729', '1537177729');
INSERT INTO `coins_log` VALUES ('152', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537198864', '1537198864');
INSERT INTO `coins_log` VALUES ('153', '5000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1537198864', '1537198864');
INSERT INTO `coins_log` VALUES ('154', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537198867', '1537198867');
INSERT INTO `coins_log` VALUES ('155', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537198878', '1537198878');
INSERT INTO `coins_log` VALUES ('156', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537233007', '1537233007');
INSERT INTO `coins_log` VALUES ('157', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1537233220', '1537233220');
INSERT INTO `coins_log` VALUES ('158', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1537233237', '1537233237');
INSERT INTO `coins_log` VALUES ('159', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1537233273', '1537233273');
INSERT INTO `coins_log` VALUES ('160', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1537233417', '1537233417');
INSERT INTO `coins_log` VALUES ('161', '1000', '1305', 'rESQtswdK9wO0cxD', '1', '5', '1537236311', '1537236311');
INSERT INTO `coins_log` VALUES ('162', '5000', '67219', 'rESQtswdK9wO0cxD', '1', '6', '1537236311', '1537236311');
INSERT INTO `coins_log` VALUES ('163', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537236627', '1537236627');
INSERT INTO `coins_log` VALUES ('164', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537236691', '1537236691');
INSERT INTO `coins_log` VALUES ('165', '1000', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1537236769', '1537236769');
INSERT INTO `coins_log` VALUES ('166', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1537243313', '1537243313');
INSERT INTO `coins_log` VALUES ('167', '1000', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1537243375', '1537243375');
INSERT INTO `coins_log` VALUES ('168', '5000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1537243375', '1537243375');
INSERT INTO `coins_log` VALUES ('169', '50', '1305', 'rESQtswdK9wO0cxD', '1', '7', '1537247801', '1537247801');
INSERT INTO `coins_log` VALUES ('170', '50', '1317', 'rESQtswdK9wO0cxD', '1', '7', '1537263211', '1537263211');
INSERT INTO `coins_log` VALUES ('171', '100', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1537341205', '1537341205');
INSERT INTO `coins_log` VALUES ('172', '100', '1305', 'rESQtswdK9wO0cxD', '1', '7', '1537341246', '1537341246');
INSERT INTO `coins_log` VALUES ('173', '50', '1318', 'rESQtswdK9wO0cxD', '1', '7', '1537358163', '1537358163');
INSERT INTO `coins_log` VALUES ('174', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1537500072', '1537500072');
INSERT INTO `coins_log` VALUES ('175', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1537589192', '1537589192');
INSERT INTO `coins_log` VALUES ('176', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1537736192', '1537736192');
INSERT INTO `coins_log` VALUES ('177', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1537955747', '1537955747');
INSERT INTO `coins_log` VALUES ('178', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1538202561', '1538202561');
INSERT INTO `coins_log` VALUES ('179', '50', '1328', 'rESQtswdK9wO0cxD', '1', '7', '1538284850', '1538284850');
INSERT INTO `coins_log` VALUES ('180', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1538285555', '1538285555');
INSERT INTO `coins_log` VALUES ('181', '50', '1330', 'rESQtswdK9wO0cxD', '1', '7', '1538360110', '1538360110');
INSERT INTO `coins_log` VALUES ('182', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1538507486', '1538507486');
INSERT INTO `coins_log` VALUES ('183', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1539054714', '1539054714');
INSERT INTO `coins_log` VALUES ('184', '50', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1539157077', '1539157077');
INSERT INTO `coins_log` VALUES ('185', '1000', '1328', 'rESQtswdK9wO0cxD', '1', '5', '1539157161', '1539157161');
INSERT INTO `coins_log` VALUES ('186', '1000', '1328', 'rESQtswdK9wO0cxD', '1', '5', '1539157172', '1539157172');
INSERT INTO `coins_log` VALUES ('187', '50', '1328', 'rESQtswdK9wO0cxD', '1', '7', '1539157189', '1539157189');
INSERT INTO `coins_log` VALUES ('188', '100', '1328', 'rESQtswdK9wO0cxD', '1', '5', '1539157737', '1539157737');
INSERT INTO `coins_log` VALUES ('189', '100', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1539214107', '1539214107');
INSERT INTO `coins_log` VALUES ('190', '50', '12', 'jblRpcEzBBnmXpzq', '1', '7', '1539254438', '1539254438');
INSERT INTO `coins_log` VALUES ('191', '550', '12', 'jblRpcEzBBnmXpzq', '1', '5', '1539255715', '1539255715');
INSERT INTO `coins_log` VALUES ('192', '660', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1539324563', '1539324563');
INSERT INTO `coins_log` VALUES ('193', '50', '1344', 'rESQtswdK9wO0cxD', '1', '7', '1539350064', '1539350064');
INSERT INTO `coins_log` VALUES ('194', '880', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1539403450', '1539403450');
INSERT INTO `coins_log` VALUES ('195', '50', '1345', 'rESQtswdK9wO0cxD', '1', '7', '1539424137', '1539424137');
INSERT INTO `coins_log` VALUES ('196', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1539436734', '1539436734');
INSERT INTO `coins_log` VALUES ('197', '50', '1346', 'rESQtswdK9wO0cxD', '1', '7', '1539449842', '1539449842');
INSERT INTO `coins_log` VALUES ('198', '1000', '1346', 'rESQtswdK9wO0cxD', '1', '5', '1539450048', '1539450048');
INSERT INTO `coins_log` VALUES ('199', '50', '1347', 'rESQtswdK9wO0cxD', '1', '7', '1539488675', '1539488675');
INSERT INTO `coins_log` VALUES ('200', '150', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1539530439', '1539530439');
INSERT INTO `coins_log` VALUES ('201', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1539530514', '1539530514');
INSERT INTO `coins_log` VALUES ('202', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1539609552', '1539609552');
INSERT INTO `coins_log` VALUES ('203', '50', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1539732336', '1539732336');
INSERT INTO `coins_log` VALUES ('204', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1539732354', '1539732354');
INSERT INTO `coins_log` VALUES ('205', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1539766444', '1539766444');
INSERT INTO `coins_log` VALUES ('206', '50', '1348', 'rESQtswdK9wO0cxD', '1', '7', '1539776361', '1539776361');
INSERT INTO `coins_log` VALUES ('207', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1539787187', '1539787187');
INSERT INTO `coins_log` VALUES ('208', '1000', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1539787222', '1539787222');
INSERT INTO `coins_log` VALUES ('209', '4000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1539787222', '1539787222');
INSERT INTO `coins_log` VALUES ('210', '1000', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1539787266', '1539787266');
INSERT INTO `coins_log` VALUES ('211', '3000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1539787266', '1539787266');
INSERT INTO `coins_log` VALUES ('212', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1539845678', '1539845678');
INSERT INTO `coins_log` VALUES ('213', '1000', '1152', 'rESQtswdK9wO0cxD', '1', '5', '1539845683', '1539845683');
INSERT INTO `coins_log` VALUES ('214', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845701', '1539845701');
INSERT INTO `coins_log` VALUES ('215', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845706', '1539845706');
INSERT INTO `coins_log` VALUES ('216', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845708', '1539845708');
INSERT INTO `coins_log` VALUES ('217', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845709', '1539845709');
INSERT INTO `coins_log` VALUES ('218', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845714', '1539845714');
INSERT INTO `coins_log` VALUES ('219', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845715', '1539845715');
INSERT INTO `coins_log` VALUES ('220', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845716', '1539845716');
INSERT INTO `coins_log` VALUES ('221', '10000', '1152', 'rESQtswdK9wO0cxD', '2', '8', '1539845716', '1539845716');
INSERT INTO `coins_log` VALUES ('222', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1539851236', '1539851236');
INSERT INTO `coins_log` VALUES ('223', '660', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1539918332', '1539918332');
INSERT INTO `coins_log` VALUES ('224', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1539927744', '1539927744');
INSERT INTO `coins_log` VALUES ('225', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1539934471', '1539934471');
INSERT INTO `coins_log` VALUES ('226', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1539934534', '1539934534');
INSERT INTO `coins_log` VALUES ('227', '10000', '1151', 'rESQtswdK9wO0cxD', '2', '8', '1540005999', '1540005999');
INSERT INTO `coins_log` VALUES ('228', '100', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1540006670', '1540006670');
INSERT INTO `coins_log` VALUES ('229', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006688', '1540006688');
INSERT INTO `coins_log` VALUES ('230', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006688', '1540006688');
INSERT INTO `coins_log` VALUES ('231', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006688', '1540006688');
INSERT INTO `coins_log` VALUES ('232', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006688', '1540006688');
INSERT INTO `coins_log` VALUES ('233', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006688', '1540006688');
INSERT INTO `coins_log` VALUES ('234', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006688', '1540006688');
INSERT INTO `coins_log` VALUES ('235', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('236', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('237', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('238', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('239', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('240', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('241', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006689', '1540006689');
INSERT INTO `coins_log` VALUES ('242', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('243', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('244', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('245', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('246', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('247', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('248', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006690', '1540006690');
INSERT INTO `coins_log` VALUES ('249', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('250', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('251', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('252', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('253', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('254', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('255', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006691', '1540006691');
INSERT INTO `coins_log` VALUES ('256', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006692', '1540006692');
INSERT INTO `coins_log` VALUES ('257', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006692', '1540006692');
INSERT INTO `coins_log` VALUES ('258', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006692', '1540006692');
INSERT INTO `coins_log` VALUES ('259', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006692', '1540006692');
INSERT INTO `coins_log` VALUES ('260', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006692', '1540006692');
INSERT INTO `coins_log` VALUES ('261', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006692', '1540006692');
INSERT INTO `coins_log` VALUES ('262', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006693', '1540006693');
INSERT INTO `coins_log` VALUES ('263', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006693', '1540006693');
INSERT INTO `coins_log` VALUES ('264', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006693', '1540006693');
INSERT INTO `coins_log` VALUES ('265', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006693', '1540006693');
INSERT INTO `coins_log` VALUES ('266', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006693', '1540006693');
INSERT INTO `coins_log` VALUES ('267', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006693', '1540006693');
INSERT INTO `coins_log` VALUES ('268', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006694', '1540006694');
INSERT INTO `coins_log` VALUES ('269', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006694', '1540006694');
INSERT INTO `coins_log` VALUES ('270', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006695', '1540006695');
INSERT INTO `coins_log` VALUES ('271', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006695', '1540006695');
INSERT INTO `coins_log` VALUES ('272', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006696', '1540006696');
INSERT INTO `coins_log` VALUES ('273', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006696', '1540006696');
INSERT INTO `coins_log` VALUES ('274', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006697', '1540006697');
INSERT INTO `coins_log` VALUES ('275', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006698', '1540006698');
INSERT INTO `coins_log` VALUES ('276', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006700', '1540006700');
INSERT INTO `coins_log` VALUES ('277', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006701', '1540006701');
INSERT INTO `coins_log` VALUES ('278', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006704', '1540006704');
INSERT INTO `coins_log` VALUES ('279', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006708', '1540006708');
INSERT INTO `coins_log` VALUES ('280', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006710', '1540006710');
INSERT INTO `coins_log` VALUES ('281', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006710', '1540006710');
INSERT INTO `coins_log` VALUES ('282', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006713', '1540006713');
INSERT INTO `coins_log` VALUES ('283', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006714', '1540006714');
INSERT INTO `coins_log` VALUES ('284', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006714', '1540006714');
INSERT INTO `coins_log` VALUES ('285', '10000', '1292', 'rESQtswdK9wO0cxD', '2', '8', '1540006714', '1540006714');
INSERT INTO `coins_log` VALUES ('286', '100', '1292', 'rESQtswdK9wO0cxD', '1', '5', '1540006741', '1540006741');
INSERT INTO `coins_log` VALUES ('287', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540061832', '1540061832');
INSERT INTO `coins_log` VALUES ('288', '50', '1217', 'rESQtswdK9wO0cxD', '1', '7', '1540172182', '1540172182');
INSERT INTO `coins_log` VALUES ('289', '100', '1217', 'rESQtswdK9wO0cxD', '1', '5', '1540172848', '1540172848');
INSERT INTO `coins_log` VALUES ('290', '50000', '1217', 'rESQtswdK9wO0cxD', '2', '8', '1540172991', '1540172991');
INSERT INTO `coins_log` VALUES ('291', '10000', '1217', 'rESQtswdK9wO0cxD', '2', '8', '1540173118', '1540173118');
INSERT INTO `coins_log` VALUES ('292', '10000', '1217', 'rESQtswdK9wO0cxD', '2', '8', '1540174078', '1540174078');
INSERT INTO `coins_log` VALUES ('293', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540175061', '1540175061');
INSERT INTO `coins_log` VALUES ('294', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1540175101', '1540175101');
INSERT INTO `coins_log` VALUES ('295', '13000', '1292', 'rESQtswdK9wO0cxD', '1', '6', '1540175101', '1540175101');
INSERT INTO `coins_log` VALUES ('296', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1540175172', '1540175172');
INSERT INTO `coins_log` VALUES ('297', '5000', '1292', 'rESQtswdK9wO0cxD', '1', '6', '1540175172', '1540175172');
INSERT INTO `coins_log` VALUES ('298', '1000', '1151', 'rESQtswdK9wO0cxD', '1', '5', '1540175297', '1540175297');
INSERT INTO `coins_log` VALUES ('299', '4000', '1292', 'rESQtswdK9wO0cxD', '1', '6', '1540175297', '1540175297');
INSERT INTO `coins_log` VALUES ('300', '10000', '1151', 'rESQtswdK9wO0cxD', '2', '8', '1540175302', '1540175302');
INSERT INTO `coins_log` VALUES ('301', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1540189282', '1540189282');
INSERT INTO `coins_log` VALUES ('302', '660', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540258727', '1540258727');
INSERT INTO `coins_log` VALUES ('303', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1540258920', '1540258920');
INSERT INTO `coins_log` VALUES ('304', '50', '1254', 'rESQtswdK9wO0cxD', '1', '7', '1540275675', '1540275675');
INSERT INTO `coins_log` VALUES ('305', '50', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1540286631', '1540286631');
INSERT INTO `coins_log` VALUES ('306', '100', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540286757', '1540286757');
INSERT INTO `coins_log` VALUES ('307', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540286850', '1540286850');
INSERT INTO `coins_log` VALUES ('308', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540286869', '1540286869');
INSERT INTO `coins_log` VALUES ('309', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540286900', '1540286900');
INSERT INTO `coins_log` VALUES ('310', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540286919', '1540286919');
INSERT INTO `coins_log` VALUES ('311', '880', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540341719', '1540341719');
INSERT INTO `coins_log` VALUES ('312', '50', '1237', 'rESQtswdK9wO0cxD', '1', '7', '1540437384', '1540437384');
INSERT INTO `coins_log` VALUES ('313', '50', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1540455218', '1540455218');
INSERT INTO `coins_log` VALUES ('314', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540455250', '1540455250');
INSERT INTO `coins_log` VALUES ('315', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540455257', '1540455257');
INSERT INTO `coins_log` VALUES ('316', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540455434', '1540455434');
INSERT INTO `coins_log` VALUES ('317', '2000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540455447', '1540455447');
INSERT INTO `coins_log` VALUES ('318', '50', '1364', 'rESQtswdK9wO0cxD', '1', '7', '1540497749', '1540497749');
INSERT INTO `coins_log` VALUES ('319', '3000', '1364', 'rESQtswdK9wO0cxD', '1', '6', '1540497831', '1540497831');
INSERT INTO `coins_log` VALUES ('320', '13000', '1237', 'rESQtswdK9wO0cxD', '1', '6', '1540497831', '1540497831');
INSERT INTO `coins_log` VALUES ('321', '1000', '1364', 'rESQtswdK9wO0cxD', '1', '5', '1540529002', '1540529002');
INSERT INTO `coins_log` VALUES ('322', '5000', '1237', 'rESQtswdK9wO0cxD', '1', '6', '1540529002', '1540529002');
INSERT INTO `coins_log` VALUES ('323', '1000', '1364', 'rESQtswdK9wO0cxD', '1', '5', '1540529016', '1540529016');
INSERT INTO `coins_log` VALUES ('324', '4000', '1237', 'rESQtswdK9wO0cxD', '1', '6', '1540529016', '1540529016');
INSERT INTO `coins_log` VALUES ('325', '50', '1225', 'rESQtswdK9wO0cxD', '1', '7', '1540563001', '1540563001');
INSERT INTO `coins_log` VALUES ('326', '1000', '1225', 'rESQtswdK9wO0cxD', '1', '5', '1540563053', '1540563053');
INSERT INTO `coins_log` VALUES ('327', '3000', '1249', 'rESQtswdK9wO0cxD', '1', '6', '1540563053', '1540563053');
INSERT INTO `coins_log` VALUES ('328', '50', '1338', 'rESQtswdK9wO0cxD', '1', '7', '1540602882', '1540602882');
INSERT INTO `coins_log` VALUES ('329', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540602902', '1540602902');
INSERT INTO `coins_log` VALUES ('330', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540602911', '1540602911');
INSERT INTO `coins_log` VALUES ('331', '1000', '1338', 'rESQtswdK9wO0cxD', '1', '5', '1540602973', '1540602973');
INSERT INTO `coins_log` VALUES ('332', '50', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540646883', '1540646883');
INSERT INTO `coins_log` VALUES ('333', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1540679713', '1540679713');
INSERT INTO `coins_log` VALUES ('334', '100', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540724754', '1540724754');
INSERT INTO `coins_log` VALUES ('335', '50', '1160', 'rESQtswdK9wO0cxD', '1', '7', '1540729173', '1540729173');
INSERT INTO `coins_log` VALUES ('336', '660', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540797754', '1540797754');
INSERT INTO `coins_log` VALUES ('337', '50', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1540830687', '1540830687');
INSERT INTO `coins_log` VALUES ('338', '880', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540864041', '1540864041');
INSERT INTO `coins_log` VALUES ('339', '150', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1540970509', '1540970509');
INSERT INTO `coins_log` VALUES ('340', '100', '1151', 'rESQtswdK9wO0cxD', '1', '7', '1540970513', '1540970513');
INSERT INTO `coins_log` VALUES ('341', '50', '1368', 'rESQtswdK9wO0cxD', '1', '7', '1540978607', '1540978607');
INSERT INTO `coins_log` VALUES ('342', '100', '1368', 'rESQtswdK9wO0cxD', '1', '5', '1540978691', '1540978691');
INSERT INTO `coins_log` VALUES ('343', '100', '1368', 'rESQtswdK9wO0cxD', '1', '5', '1540978704', '1540978704');
INSERT INTO `coins_log` VALUES ('344', '1000', '1368', 'rESQtswdK9wO0cxD', '1', '5', '1540978768', '1540978768');
INSERT INTO `coins_log` VALUES ('345', '100', '1368', 'rESQtswdK9wO0cxD', '1', '5', '1540978888', '1540978888');

-- ----------------------------
-- Table structure for `invite_log`
-- ----------------------------
DROP TABLE IF EXISTS `invite_log`;
CREATE TABLE `invite_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币数',
  `invite_uid` int(11) NOT NULL DEFAULT '0' COMMENT '邀请人id',
  `invited_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被邀请人id',
  `app_id` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1-未下载奖励方案.2已下载奖励方案',
  `num` int(10) DEFAULT '0' COMMENT '记录这个邀请领取的奖励第几次',
  `created_at` int(10) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invite_log
-- ----------------------------
INSERT INTO `invite_log` VALUES ('1', '13000', '1249', '1252', 'rESQtswdK9wO0cxD', '1', '0', '1534389564', '1534389564');
INSERT INTO `invite_log` VALUES ('2', '5000', '1249', '1153', 'rESQtswdK9wO0cxD', '1', '0', '1534389617', '1534389617');
INSERT INTO `invite_log` VALUES ('3', '4000', '1249', '1225', 'rESQtswdK9wO0cxD', '1', '4', '1534389825', '1540563053');
INSERT INTO `invite_log` VALUES ('4', '13000', '1252', '1249', 'rESQtswdK9wO0cxD', '1', '0', '1534389911', '1534389911');
INSERT INTO `invite_log` VALUES ('5', '13000', '1289', '1244', 'rESQtswdK9wO0cxD', '1', '0', '1534390123', '1534390123');
INSERT INTO `invite_log` VALUES ('6', '5000', '1289', '1139', 'rESQtswdK9wO0cxD', '1', '0', '1534390174', '1534390174');
INSERT INTO `invite_log` VALUES ('7', '13000', '1151', '1292', 'rESQtswdK9wO0cxD', '1', '7', '1535426776', '1537198864');
INSERT INTO `invite_log` VALUES ('8', '5000', '1151', '1303', 'rESQtswdK9wO0cxD', '1', '3', '1535426874', '1536058378');
INSERT INTO `invite_log` VALUES ('9', '13000', '67219', '1304', 'rESQtswdK9wO0cxD', '1', '0', '1535434071', '1535434071');
INSERT INTO `invite_log` VALUES ('10', '5000', '67219', '1305', 'rESQtswdK9wO0cxD', '1', '1', '1535434345', '1537236311');
INSERT INTO `invite_log` VALUES ('11', '3000', '67219', '1304', 'rESQtswdK9wO0cxD', '1', '0', '1535436755', '1535436755');
INSERT INTO `invite_log` VALUES ('12', '3000', '67219', '1305', 'rESQtswdK9wO0cxD', '1', '0', '1535436792', '1535436792');
INSERT INTO `invite_log` VALUES ('13', '13000', '1292', '1151', 'rESQtswdK9wO0cxD', '1', '2', '1540175101', '1540175297');
INSERT INTO `invite_log` VALUES ('14', '13000', '1237', '1364', 'rESQtswdK9wO0cxD', '1', '2', '1540497831', '1540529016');

-- ----------------------------
-- Table structure for `machine_record`
-- ----------------------------
DROP TABLE IF EXISTS `machine_record`;
CREATE TABLE `machine_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_code` varchar(200) NOT NULL,
  `app_id` varchar(100) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `num` int(10) DEFAULT '0' COMMENT '安装次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1379 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of machine_record
-- ----------------------------
INSERT INTO `machine_record` VALUES ('1', '868208033502923', 'rESQtswdK9wO0cxD', '1534390199', '1534390199', '57');
INSERT INTO `machine_record` VALUES ('2', '85774915140257089860038615245277635', 'rESQtswdK9wO0cxD', '1534405302', '1534405302', '1');
INSERT INTO `machine_record` VALUES ('3', '86866303194507089860117874010661394', 'rESQtswdK9wO0cxD', '1534406121', '1534406121', '7');
INSERT INTO `machine_record` VALUES ('4', '866764039070739898600d7180193601170', 'rESQtswdK9wO0cxD', '1534406236', '1534406236', '1');
INSERT INTO `machine_record` VALUES ('5', '86820803394723589860118841005358830', 'rESQtswdK9wO0cxD', '1534733557', '1534733557', '5');
INSERT INTO `machine_record` VALUES ('6', '868139034425691898600e7184704369810', 'rESQtswdK9wO0cxD', '1534768471', '1534768471', '1');
INSERT INTO `machine_record` VALUES ('7', '690811842020571143809938504', 'rESQtswdK9wO0cxD', '1534910512', '1534910512', '1');
INSERT INTO `machine_record` VALUES ('8', '86353903790804689860316747731048662', 'rESQtswdK9wO0cxD', '1534933236', '1534933236', '1');
INSERT INTO `machine_record` VALUES ('9', '86489502583174289014103211118510720', 'rESQtswdK9wO0cxD', '1534994507', '1534994507', '1');
INSERT INTO `machine_record` VALUES ('10', '86893803467513489860116851115662536', 'rESQtswdK9wO0cxD', '1535041914', '1535041914', '2');
INSERT INTO `machine_record` VALUES ('11', '86516602271623089860047506563930753', 'rESQtswdK9wO0cxD', '1535087791', '1535087791', '1');
INSERT INTO `machine_record` VALUES ('12', '868671033200261', 'rESQtswdK9wO0cxD', '1535360633', '1535360633', '1');
INSERT INTO `machine_record` VALUES ('13', '86141303581984989860114811029003344', 'rESQtswdK9wO0cxD', '1535550794', '1535550794', '1');
INSERT INTO `machine_record` VALUES ('14', '947278510905650909905002505', 'rESQtswdK9wO0cxD', '1536058654', '1536058654', '1');
INSERT INTO `machine_record` VALUES ('15', '008796753358461', 'rESQtswdK9wO0cxD', '1536152430', '1536152430', '1');
INSERT INTO `machine_record` VALUES ('16', '86802903244236089860117842303501072', 'rESQtswdK9wO0cxD', '1536226243', '1536226243', '1');
INSERT INTO `machine_record` VALUES ('17', '00000000000000089014103211118510720', 'rESQtswdK9wO0cxD', '1536294384', '1536294384', '1');
INSERT INTO `machine_record` VALUES ('18', '008796751143428', 'rESQtswdK9wO0cxD', '1536308038', '1536308038', '4');
INSERT INTO `machine_record` VALUES ('19', '86215503364741289860316247362880848', 'rESQtswdK9wO0cxD', '1536313293', '1536313293', '1');
INSERT INTO `machine_record` VALUES ('20', '99000869056327089860117842303455972', 'rESQtswdK9wO0cxD', '1536565193', '1536565193', '6');
INSERT INTO `machine_record` VALUES ('21', '659643353612557635762253779', 'rESQtswdK9wO0cxD', '1536573607', '1536573607', '1');
INSERT INTO `machine_record` VALUES ('22', '948639092391777736912859199', 'rESQtswdK9wO0cxD', '1536661045', '1536661045', '1');
INSERT INTO `machine_record` VALUES ('23', '330278054522506995869895330', 'rESQtswdK9wO0cxD', '1537075797', '1537075797', '1');
INSERT INTO `machine_record` VALUES ('24', '868487029024692', 'rESQtswdK9wO0cxD', '1537076121', '1537076121', '1');
INSERT INTO `machine_record` VALUES ('25', '862736039304619', 'rESQtswdK9wO0cxD', '1537076439', '1537076439', '1');
INSERT INTO `machine_record` VALUES ('26', '13467971829384289860114836008387590', 'rESQtswdK9wO0cxD', '1537077369', '1537077369', '2');
INSERT INTO `machine_record` VALUES ('27', '8686020420569988986005615189a167178', 'rESQtswdK9wO0cxD', '1537078164', '1537078164', '1');
INSERT INTO `machine_record` VALUES ('28', '86769902679049489860115886003373177', 'rESQtswdK9wO0cxD', '1537079978', '1537079978', '1');
INSERT INTO `machine_record` VALUES ('29', '862020037851784898600F5111457016490', 'rESQtswdK9wO0cxD', '1537081012', '1537081012', '1');
INSERT INTO `machine_record` VALUES ('30', 'A100004DFF70D489860316247101679592', 'rESQtswdK9wO0cxD', '1537082322', '1537082322', '1');
INSERT INTO `machine_record` VALUES ('31', '86288703390926589860029271652868807', 'rESQtswdK9wO0cxD', '1537085416', '1537085416', '1');
INSERT INTO `machine_record` VALUES ('32', 'A0000073C591A889860117801634908661', 'rESQtswdK9wO0cxD', '1537086004', '1537086004', '1');
INSERT INTO `machine_record` VALUES ('33', '86172903930113289860115818047490733', 'rESQtswdK9wO0cxD', '1537088415', '1537088415', '1');
INSERT INTO `machine_record` VALUES ('34', '86129703012120689860057189475072399', 'rESQtswdK9wO0cxD', '1537088452', '1537088452', '1');
INSERT INTO `machine_record` VALUES ('35', '865685024630602', 'rESQtswdK9wO0cxD', '1537089315', '1537089315', '1');
INSERT INTO `machine_record` VALUES ('36', '86980502828204689860040191693097490', 'rESQtswdK9wO0cxD', '1537090851', '1537090851', '1');
INSERT INTO `machine_record` VALUES ('37', '86416703839772789860117876138249697', 'rESQtswdK9wO0cxD', '1537090865', '1537090865', '1');
INSERT INTO `machine_record` VALUES ('38', '86971902324016689860117801626385084', 'rESQtswdK9wO0cxD', '1537091325', '1537091325', '1');
INSERT INTO `machine_record` VALUES ('39', '86723003515220189860005111657018378', 'rESQtswdK9wO0cxD', '1537092299', '1537092299', '1');
INSERT INTO `machine_record` VALUES ('40', '86408502070385289860007191607005687', 'rESQtswdK9wO0cxD', '1537093849', '1537093849', '1');
INSERT INTO `machine_record` VALUES ('41', '867718024495003', 'rESQtswdK9wO0cxD', '1537094640', '1537094640', '1');
INSERT INTO `machine_record` VALUES ('42', '865731037130378898600c115158a543255', 'rESQtswdK9wO0cxD', '1537096056', '1537096056', '1');
INSERT INTO `machine_record` VALUES ('43', '86954102673809989861114205714050439', 'rESQtswdK9wO0cxD', '1537098048', '1537098048', '1');
INSERT INTO `machine_record` VALUES ('44', '866035038184247', 'rESQtswdK9wO0cxD', '1537100846', '1537100846', '1');
INSERT INTO `machine_record` VALUES ('45', '86762002381013589860114876155381368', 'rESQtswdK9wO0cxD', '1537101353', '1537101353', '1');
INSERT INTO `machine_record` VALUES ('46', '86843302282702089861114907660129774', 'rESQtswdK9wO0cxD', '1537104017', '1537104017', '1');
INSERT INTO `machine_record` VALUES ('47', '868124021691984', 'rESQtswdK9wO0cxD', '1537105381', '1537105381', '1');
INSERT INTO `machine_record` VALUES ('48', '864024038162967', 'rESQtswdK9wO0cxD', '1537107216', '1537107216', '1');
INSERT INTO `machine_record` VALUES ('49', '86805303112185889860117801566490290', 'rESQtswdK9wO0cxD', '1537107765', '1537107765', '1');
INSERT INTO `machine_record` VALUES ('50', '864616025293794898600F1231891199775', 'rESQtswdK9wO0cxD', '1537117351', '1537117351', '1');
INSERT INTO `machine_record` VALUES ('51', '8662600307222048990029300992093240f', 'rESQtswdK9wO0cxD', '1537120001', '1537120001', '2');
INSERT INTO `machine_record` VALUES ('52', '86262903240187289860318747690879444', 'rESQtswdK9wO0cxD', '1537143576', '1537143576', '1');
INSERT INTO `machine_record` VALUES ('53', '863058031342102898602a7201580118201', 'rESQtswdK9wO0cxD', '1537143868', '1537143868', '1');
INSERT INTO `machine_record` VALUES ('54', '86429703995287189860318747558315870', 'rESQtswdK9wO0cxD', '1537147992', '1537147992', '1');
INSERT INTO `machine_record` VALUES ('55', '35500907119474289860318943100719185', 'rESQtswdK9wO0cxD', '1537157356', '1537157356', '1');
INSERT INTO `machine_record` VALUES ('56', '864231036177265898600A3031820228902', 'rESQtswdK9wO0cxD', '1537158721', '1537158721', '1');
INSERT INTO `machine_record` VALUES ('57', '86083803213337589860117801966629398', 'rESQtswdK9wO0cxD', '1537160136', '1537160136', '1');
INSERT INTO `machine_record` VALUES ('58', '8680530305889908986003615183A265241', 'rESQtswdK9wO0cxD', '1537170802', '1537170802', '1');
INSERT INTO `machine_record` VALUES ('59', '072262384168162878173562209', 'rESQtswdK9wO0cxD', '1537174643', '1537174643', '1');
INSERT INTO `machine_record` VALUES ('60', '866172036167732898600E31617F0884831', 'rESQtswdK9wO0cxD', '1537176648', '1537176648', '1');
INSERT INTO `machine_record` VALUES ('61', '86970003144975989860318244100152562', 'rESQtswdK9wO0cxD', '1537179000', '1537179000', '1');
INSERT INTO `machine_record` VALUES ('62', '86516602049276889860044363805145389', 'rESQtswdK9wO0cxD', '1537181715', '1537181715', '1');
INSERT INTO `machine_record` VALUES ('63', '864320031157974898600901615F1154730', 'rESQtswdK9wO0cxD', '1537183705', '1537183705', '1');
INSERT INTO `machine_record` VALUES ('64', 'A00000691C4DF089860315147620093724', 'rESQtswdK9wO0cxD', '1537187083', '1537187083', '1');
INSERT INTO `machine_record` VALUES ('65', '39666666464195489860096835919020075', 'rESQtswdK9wO0cxD', '1537187108', '1537187108', '1');
INSERT INTO `machine_record` VALUES ('66', '86894803306600389860117801536720693', 'rESQtswdK9wO0cxD', '1537187114', '1537187114', '1');
INSERT INTO `machine_record` VALUES ('67', '863293037882229898600F3031650208887', 'rESQtswdK9wO0cxD', '1537187625', '1537187625', '1');
INSERT INTO `machine_record` VALUES ('68', '863904036295839', 'rESQtswdK9wO0cxD', '1537189809', '1537189809', '1');
INSERT INTO `machine_record` VALUES ('69', 'A0000060AACCDA89860317249972316576', 'rESQtswdK9wO0cxD', '1537190076', '1537190076', '1');
INSERT INTO `machine_record` VALUES ('70', '863337034152563', 'rESQtswdK9wO0cxD', '1537191072', '1537191072', '1');
INSERT INTO `machine_record` VALUES ('71', '86191603923353689860316847600598522', 'rESQtswdK9wO0cxD', '1537191746', '1537191746', '1');
INSERT INTO `machine_record` VALUES ('72', '99000578403141', 'rESQtswdK9wO0cxD', '1537192978', '1537192978', '1');
INSERT INTO `machine_record` VALUES ('73', '86601903758129889860114813018373571', 'rESQtswdK9wO0cxD', '1537193616', '1537193616', '1');
INSERT INTO `machine_record` VALUES ('74', '86575003714101189860117801487075170', 'rESQtswdK9wO0cxD', '1537193800', '1537193800', '1');
INSERT INTO `machine_record` VALUES ('75', '86413303608310789860316047572474238', 'rESQtswdK9wO0cxD', '1537195107', '1537195107', '1');
INSERT INTO `machine_record` VALUES ('76', '864849031721306898602a015145a563696', 'rESQtswdK9wO0cxD', '1537195487', '1537195487', '1');
INSERT INTO `machine_record` VALUES ('77', '86350703526870589860117836049846379', 'rESQtswdK9wO0cxD', '1537200525', '1537200525', '1');
INSERT INTO `machine_record` VALUES ('78', '86641903015227189860317248307131460', 'rESQtswdK9wO0cxD', '1537203844', '1537203844', '1');
INSERT INTO `machine_record` VALUES ('79', '868030034304384898600382216437f8530', 'rESQtswdK9wO0cxD', '1537212378', '1537212378', '2');
INSERT INTO `machine_record` VALUES ('80', '90946541379579689860024770320531731', 'rESQtswdK9wO0cxD', '1537216243', '1537216243', '1');
INSERT INTO `machine_record` VALUES ('81', '86138303409069489860014061556030507', 'rESQtswdK9wO0cxD', '1537220920', '1537220920', '1');
INSERT INTO `machine_record` VALUES ('82', '868822032820118898602A6151670071569', 'rESQtswdK9wO0cxD', '1537223418', '1537223418', '1');
INSERT INTO `machine_record` VALUES ('83', '86851503408181889860117876141583140', 'rESQtswdK9wO0cxD', '1537232020', '1537232020', '1');
INSERT INTO `machine_record` VALUES ('84', '86601203908461989860040191693055381', 'rESQtswdK9wO0cxD', '1537239388', '1537239388', '1');
INSERT INTO `machine_record` VALUES ('85', '86889503523157489860117801941985816', 'rESQtswdK9wO0cxD', '1537242783', '1537242783', '1');
INSERT INTO `machine_record` VALUES ('86', '86263503616083689860316253716941971', 'rESQtswdK9wO0cxD', '1537245868', '1537245868', '1');
INSERT INTO `machine_record` VALUES ('87', '86413303145140889860318249121074083', 'rESQtswdK9wO0cxD', '1537247707', '1537247707', '1');
INSERT INTO `machine_record` VALUES ('88', '86751502313482789860042191782162243', 'rESQtswdK9wO0cxD', '1537248480', '1537248480', '1');
INSERT INTO `machine_record` VALUES ('89', '86996703413674789860318049394509918', 'rESQtswdK9wO0cxD', '1537250136', '1537250136', '1');
INSERT INTO `machine_record` VALUES ('90', '86632103725874989860027176892804186', 'rESQtswdK9wO0cxD', '1537252738', '1537252738', '1');
INSERT INTO `machine_record` VALUES ('91', '866922039192677898602C5124786712229', 'rESQtswdK9wO0cxD', '1537259857', '1537259857', '1');
INSERT INTO `machine_record` VALUES ('92', '868642033530270898602A8231730328785', 'rESQtswdK9wO0cxD', '1537261718', '1537261718', '1');
INSERT INTO `machine_record` VALUES ('93', '86693903365191289860026151690385651', 'rESQtswdK9wO0cxD', '1537262700', '1537262700', '1');
INSERT INTO `machine_record` VALUES ('94', '86416203713019589860078189477169863', 'rESQtswdK9wO0cxD', '1537267178', '1537267178', '1');
INSERT INTO `machine_record` VALUES ('95', '86459003414827589860114817044059740', 'rESQtswdK9wO0cxD', '1537267813', '1537267813', '1');
INSERT INTO `machine_record` VALUES ('96', '869067033164533898600240717f1999604', 'rESQtswdK9wO0cxD', '1537271683', '1537271683', '2');
INSERT INTO `machine_record` VALUES ('97', '86971802042008689860058031500155540', 'rESQtswdK9wO0cxD', '1537271969', '1537271969', '1');
INSERT INTO `machine_record` VALUES ('98', '86991702982664689860318243960105199', 'rESQtswdK9wO0cxD', '1537275187', '1537275187', '1');
INSERT INTO `machine_record` VALUES ('99', '868290035992039898600790918F4004310', 'rESQtswdK9wO0cxD', '1537275563', '1537275563', '1');
INSERT INTO `machine_record` VALUES ('100', '9900056242087389860062050854833736', 'rESQtswdK9wO0cxD', '1537278077', '1537278077', '1');
INSERT INTO `machine_record` VALUES ('101', '86304803959251989860117801826907281', 'rESQtswdK9wO0cxD', '1537279572', '1537279572', '1');
INSERT INTO `machine_record` VALUES ('102', '862177036169368', 'rESQtswdK9wO0cxD', '1537282950', '1537282950', '1');
INSERT INTO `machine_record` VALUES ('103', '86201727018145789860118801054261186', 'rESQtswdK9wO0cxD', '1537283164', '1537283164', '1');
INSERT INTO `machine_record` VALUES ('104', '868433026837850', 'rESQtswdK9wO0cxD', '1537283532', '1537283532', '1');
INSERT INTO `machine_record` VALUES ('105', '86922302071638', 'rESQtswdK9wO0cxD', '1537284258', '1537284258', '1');
INSERT INTO `machine_record` VALUES ('106', '862085032392092898602A615183A104994', 'rESQtswdK9wO0cxD', '1537285829', '1537285829', '1');
INSERT INTO `machine_record` VALUES ('107', '867101020801757', 'rESQtswdK9wO0cxD', '1537295492', '1537295492', '1');
INSERT INTO `machine_record` VALUES ('108', '86108403279678389860118801478365209', 'rESQtswdK9wO0cxD', '1537298990', '1537298990', '1');
INSERT INTO `machine_record` VALUES ('109', '86083203361796589860029031700153920', 'rESQtswdK9wO0cxD', '1537310205', '1537310205', '1');
INSERT INTO `machine_record` VALUES ('110', '861078035688450898600C0101750076523', 'rESQtswdK9wO0cxD', '1537311076', '1537311076', '1');
INSERT INTO `machine_record` VALUES ('111', '86439903159509489860317248337167096', 'rESQtswdK9wO0cxD', '1537312005', '1537312005', '1');
INSERT INTO `machine_record` VALUES ('112', '869752038833790', 'rESQtswdK9wO0cxD', '1537315204', '1537315204', '1');
INSERT INTO `machine_record` VALUES ('113', '8665000216302258986005815167a095126', 'rESQtswdK9wO0cxD', '1537315944', '1537315944', '1');
INSERT INTO `machine_record` VALUES ('114', '860779035871068', 'rESQtswdK9wO0cxD', '1537319050', '1537319050', '1');
INSERT INTO `machine_record` VALUES ('115', '866356031770547898602a6101700001271', 'rESQtswdK9wO0cxD', '1537325023', '1537325023', '1');
INSERT INTO `machine_record` VALUES ('116', '862750035968962', 'rESQtswdK9wO0cxD', '1537335297', '1537335297', '1');
INSERT INTO `machine_record` VALUES ('117', '86992702867103489860024061895282699', 'rESQtswdK9wO0cxD', '1537345131', '1537345131', '1');
INSERT INTO `machine_record` VALUES ('118', '86881902156305589860040191494007163', 'rESQtswdK9wO0cxD', '1537348942', '1537348942', '1');
INSERT INTO `machine_record` VALUES ('119', '86662103053762189860117801784262760', 'rESQtswdK9wO0cxD', '1537349307', '1537349307', '1');
INSERT INTO `machine_record` VALUES ('120', '86286203465465789860033031401379682', 'rESQtswdK9wO0cxD', '1537350648', '1537350648', '1');
INSERT INTO `machine_record` VALUES ('121', '866963028288134898602a9031720030575', 'rESQtswdK9wO0cxD', '1537351567', '1537351567', '1');
INSERT INTO `machine_record` VALUES ('122', '86850802680668089860040191552052637', 'rESQtswdK9wO0cxD', '1537355220', '1537355220', '1');
INSERT INTO `machine_record` VALUES ('123', 'A00000691ED85389860316248386625730', 'rESQtswdK9wO0cxD', '1537356581', '1537356581', '1');
INSERT INTO `machine_record` VALUES ('124', 'A10000507C587889860315240284929067', 'rESQtswdK9wO0cxD', '1537358037', '1537358037', '1');
INSERT INTO `machine_record` VALUES ('125', 'A000007522016B898600e30316f0111828', 'rESQtswdK9wO0cxD', '1537359177', '1537359177', '1');
INSERT INTO `machine_record` VALUES ('126', 'A0000075F17E1489860317746321240951', 'rESQtswdK9wO0cxD', '1537360182', '1537360182', '1');
INSERT INTO `machine_record` VALUES ('127', '86644603312821489860032022277344455', 'rESQtswdK9wO0cxD', '1537362319', '1537362319', '1');
INSERT INTO `machine_record` VALUES ('128', '3545270831414698923301003760445069', 'rESQtswdK9wO0cxD', '1537369304', '1537369304', '2');
INSERT INTO `machine_record` VALUES ('129', '86890303826305589860317755163766924', 'rESQtswdK9wO0cxD', '1537377564', '1537377564', '1');
INSERT INTO `machine_record` VALUES ('130', '865280031230594898600a2151470098322', 'rESQtswdK9wO0cxD', '1537393635', '1537393635', '1');
INSERT INTO `machine_record` VALUES ('131', '86044303048161989860085111706008971', 'rESQtswdK9wO0cxD', '1537395756', '1537395756', '1');
INSERT INTO `machine_record` VALUES ('132', '866982033383383898602c1271701014961', 'rESQtswdK9wO0cxD', '1537397278', '1537397278', '1');
INSERT INTO `machine_record` VALUES ('133', '868066039324159898600351234F6745363', 'rESQtswdK9wO0cxD', '1537397956', '1537397956', '1');
INSERT INTO `machine_record` VALUES ('134', '86671403848595', 'rESQtswdK9wO0cxD', '1537424537', '1537424537', '1');
INSERT INTO `machine_record` VALUES ('135', '866178037931612898600f8231690ee5841', 'rESQtswdK9wO0cxD', '1537428468', '1537428468', '1');
INSERT INTO `machine_record` VALUES ('136', '86368403025875789860317147680144647', 'rESQtswdK9wO0cxD', '1537430630', '1537430630', '1');
INSERT INTO `machine_record` VALUES ('137', '86684003803349689860317248166140933', 'rESQtswdK9wO0cxD', '1537435057', '1537435057', '1');
INSERT INTO `machine_record` VALUES ('138', '86397903782507389860316248181270864', 'rESQtswdK9wO0cxD', '1537436499', '1537436499', '1');
INSERT INTO `machine_record` VALUES ('139', '86618703252187289860084082476269362', 'rESQtswdK9wO0cxD', '1537436610', '1537436610', '1');
INSERT INTO `machine_record` VALUES ('140', '86790902618214189860028031700008372', 'rESQtswdK9wO0cxD', '1537437866', '1537437866', '1');
INSERT INTO `machine_record` VALUES ('141', '86455503749591689860118801009493900', 'rESQtswdK9wO0cxD', '1537438208', '1537438208', '1');
INSERT INTO `machine_record` VALUES ('142', '861913030865192898602d2101750061022', 'rESQtswdK9wO0cxD', '1537441423', '1537441423', '1');
INSERT INTO `machine_record` VALUES ('143', '86459502690001389860034055957118923', 'rESQtswdK9wO0cxD', '1537442172', '1537442172', '1');
INSERT INTO `machine_record` VALUES ('144', '862215037234474', 'rESQtswdK9wO0cxD', '1537442594', '1537442594', '1');
INSERT INTO `machine_record` VALUES ('145', '868854024177561', 'rESQtswdK9wO0cxD', '1537442790', '1537442790', '1');
INSERT INTO `machine_record` VALUES ('146', '862126043753276898600b6101550039882', 'rESQtswdK9wO0cxD', '1537443744', '1537443744', '1');
INSERT INTO `machine_record` VALUES ('147', '86562603103175689860113819038184071', 'rESQtswdK9wO0cxD', '1537446971', '1537446971', '1');
INSERT INTO `machine_record` VALUES ('148', '86297103461473489860118801135413400', 'rESQtswdK9wO0cxD', '1537450243', '1537450243', '1');
INSERT INTO `machine_record` VALUES ('149', '86418803628017889860318240253833628', 'rESQtswdK9wO0cxD', '1537457041', '1537457041', '1');
INSERT INTO `machine_record` VALUES ('150', 'id9e3593d9-920b-42bb-8143-345a5f701213', 'rESQtswdK9wO0cxD', '1537463501', '1537463501', '1');
INSERT INTO `machine_record` VALUES ('151', '864752039101849', 'rESQtswdK9wO0cxD', '1537483468', '1537483468', '1');
INSERT INTO `machine_record` VALUES ('152', '86830502377473489860113477930142299', 'rESQtswdK9wO0cxD', '1537488255', '1537488255', '1');
INSERT INTO `machine_record` VALUES ('153', '86403303701328789860317244513272198', 'rESQtswdK9wO0cxD', '1537489480', '1537489480', '1');
INSERT INTO `machine_record` VALUES ('154', '867578021955924', 'rESQtswdK9wO0cxD', '1537490101', '1537490101', '1');
INSERT INTO `machine_record` VALUES ('155', '86749903561185089860011191507704735', 'rESQtswdK9wO0cxD', '1537497239', '1537497239', '1');
INSERT INTO `machine_record` VALUES ('156', '8675720426647148986001515189A006330', 'rESQtswdK9wO0cxD', '1537500762', '1537500762', '1');
INSERT INTO `machine_record` VALUES ('157', '9900108678860489861118043102434477', 'rESQtswdK9wO0cxD', '1537502138', '1537502138', '1');
INSERT INTO `machine_record` VALUES ('158', '86470103611192889860317243350181298', 'rESQtswdK9wO0cxD', '1537502725', '1537502725', '1');
INSERT INTO `machine_record` VALUES ('159', '012345678912345', 'rESQtswdK9wO0cxD', '1537503590', '1537503590', '4');
INSERT INTO `machine_record` VALUES ('160', 'A000008583A56189860117801393837945', 'rESQtswdK9wO0cxD', '1537505623', '1537505623', '1');
INSERT INTO `machine_record` VALUES ('161', 'A000005F23F37E89860318245980862493', 'rESQtswdK9wO0cxD', '1537506319', '1537506319', '1');
INSERT INTO `machine_record` VALUES ('162', '86317503950778189860318243130283579', 'rESQtswdK9wO0cxD', '1537506659', '1537506659', '1');
INSERT INTO `machine_record` VALUES ('163', '867193020409814', 'rESQtswdK9wO0cxD', '1537508087', '1537508087', '1');
INSERT INTO `machine_record` VALUES ('164', '867878020896354', 'rESQtswdK9wO0cxD', '1537508198', '1537508198', '1');
INSERT INTO `machine_record` VALUES ('165', '86625003500292689860315247923707127', 'rESQtswdK9wO0cxD', '1537513525', '1537513525', '1');
INSERT INTO `machine_record` VALUES ('166', '863139023692694898602c822170b515205', 'rESQtswdK9wO0cxD', '1537514728', '1537514728', '1');
INSERT INTO `machine_record` VALUES ('167', '861076035110970', 'rESQtswdK9wO0cxD', '1537518934', '1537518934', '1');
INSERT INTO `machine_record` VALUES ('168', '868970025738936', 'rESQtswdK9wO0cxD', '1537521680', '1537521680', '1');
INSERT INTO `machine_record` VALUES ('169', '8699490241609608986001615157A492097', 'rESQtswdK9wO0cxD', '1537524133', '1537524133', '1');
INSERT INTO `machine_record` VALUES ('170', '86367103170319689860005101850199997', 'rESQtswdK9wO0cxD', '1537524581', '1537524581', '1');
INSERT INTO `machine_record` VALUES ('171', '861042037873890898600c615157a339448', 'rESQtswdK9wO0cxD', '1537525211', '1537525211', '1');
INSERT INTO `machine_record` VALUES ('172', '862594026123058', 'rESQtswdK9wO0cxD', '1537526163', '1537526163', '1');
INSERT INTO `machine_record` VALUES ('173', '86083203991921789860097201150501903', 'rESQtswdK9wO0cxD', '1537527053', '1537527053', '1');
INSERT INTO `machine_record` VALUES ('174', '868064026715786', 'rESQtswdK9wO0cxD', '1537527547', '1537527547', '1');
INSERT INTO `machine_record` VALUES ('175', 'A0000055E9EC2E89860315240277354984', 'rESQtswdK9wO0cxD', '1537527690', '1537527690', '1');
INSERT INTO `machine_record` VALUES ('176', '990011520708618986004515159a368152', 'rESQtswdK9wO0cxD', '1537528174', '1537528174', '1');
INSERT INTO `machine_record` VALUES ('177', '86185903081918689860117801299850380', 'rESQtswdK9wO0cxD', '1537528265', '1537528265', '1');
INSERT INTO `machine_record` VALUES ('178', '867620027091542898600F9231795998484', 'rESQtswdK9wO0cxD', '1537528653', '1537528653', '2');
INSERT INTO `machine_record` VALUES ('179', '86596403229507489860008247693827877', 'rESQtswdK9wO0cxD', '1537529037', '1537529037', '1');
INSERT INTO `machine_record` VALUES ('180', '86202203887147289860113819026456424', 'rESQtswdK9wO0cxD', '1537530390', '1537530390', '1');
INSERT INTO `machine_record` VALUES ('181', '86576802320867789860117801514343260', 'rESQtswdK9wO0cxD', '1537532862', '1537532862', '1');
INSERT INTO `machine_record` VALUES ('182', '28DDU17327001444', 'rESQtswdK9wO0cxD', '1537533564', '1537533564', '1');
INSERT INTO `machine_record` VALUES ('183', '865281033118472', 'rESQtswdK9wO0cxD', '1537534484', '1537534484', '1');
INSERT INTO `machine_record` VALUES ('184', '8639020317118348986007815148A218200', 'rESQtswdK9wO0cxD', '1537535510', '1537535510', '1');
INSERT INTO `machine_record` VALUES ('185', '860267034434427898600501310F5051233', 'rESQtswdK9wO0cxD', '1537536863', '1537536863', '1');
INSERT INTO `machine_record` VALUES ('186', '869678035980005', 'rESQtswdK9wO0cxD', '1537537056', '1537537056', '1');
INSERT INTO `machine_record` VALUES ('187', '86509102421631289860051183597344565', 'rESQtswdK9wO0cxD', '1537537166', '1537537166', '1');
INSERT INTO `machine_record` VALUES ('188', '865289031874632', 'rESQtswdK9wO0cxD', '1537537363', '1537537363', '1');
INSERT INTO `machine_record` VALUES ('189', '865361036327666', 'rESQtswdK9wO0cxD', '1537538690', '1537538690', '1');
INSERT INTO `machine_record` VALUES ('190', '865156020249508', 'rESQtswdK9wO0cxD', '1537538691', '1537538691', '1');
INSERT INTO `machine_record` VALUES ('191', '354732082351388898602a1091480007203', 'rESQtswdK9wO0cxD', '1537539634', '1537539634', '1');
INSERT INTO `machine_record` VALUES ('192', '86581003598460489860117801434452365', 'rESQtswdK9wO0cxD', '1537540294', '1537540294', '1');
INSERT INTO `machine_record` VALUES ('193', '86378803162247189860117810004678085', 'rESQtswdK9wO0cxD', '1537540577', '1537540577', '1');
INSERT INTO `machine_record` VALUES ('194', '86562603236289589860078050059617453', 'rESQtswdK9wO0cxD', '1537540670', '1537540670', '1');
INSERT INTO `machine_record` VALUES ('195', '869515031177022898600801916a5002584', 'rESQtswdK9wO0cxD', '1537546076', '1537546076', '1');
INSERT INTO `machine_record` VALUES ('196', '864247030306684898600f515173a222985', 'rESQtswdK9wO0cxD', '1537546240', '1537546240', '1');
INSERT INTO `machine_record` VALUES ('197', 'A1000058710F2C89860052011700080466', 'rESQtswdK9wO0cxD', '1537550582', '1537550582', '1');
INSERT INTO `machine_record` VALUES ('198', '868191024958710', 'rESQtswdK9wO0cxD', '1537553674', '1537553674', '1');
INSERT INTO `machine_record` VALUES ('199', '86970603385257789860117801642320206', 'rESQtswdK9wO0cxD', '1537554438', '1537554438', '1');
INSERT INTO `machine_record` VALUES ('200', '866294031898044', 'rESQtswdK9wO0cxD', '1537555233', '1537555233', '1');
INSERT INTO `machine_record` VALUES ('201', '869966025820848', 'rESQtswdK9wO0cxD', '1537560215', '1537560215', '1');
INSERT INTO `machine_record` VALUES ('202', 'idf395ac05-77be-42b2-9310-4284b9b9717c', 'rESQtswdK9wO0cxD', '1537567408', '1537567408', '1');
INSERT INTO `machine_record` VALUES ('203', '86313003184272889860073031450600207', 'rESQtswdK9wO0cxD', '1537567520', '1537567520', '1');
INSERT INTO `machine_record` VALUES ('204', '86753703051622689860115810022791482', 'rESQtswdK9wO0cxD', '1537568760', '1537568760', '1');
INSERT INTO `machine_record` VALUES ('205', '86615003010381289860317243514590772', 'rESQtswdK9wO0cxD', '1537569418', '1537569418', '1');
INSERT INTO `machine_record` VALUES ('206', 'TJF6R16C30000010', 'rESQtswdK9wO0cxD', '1537569734', '1537569734', '1');
INSERT INTO `machine_record` VALUES ('207', 'A0000089D1296289860317244640476225', 'rESQtswdK9wO0cxD', '1537569888', '1537569888', '1');
INSERT INTO `machine_record` VALUES ('208', '867961024890837', 'rESQtswdK9wO0cxD', '1537570342', '1537570342', '1');
INSERT INTO `machine_record` VALUES ('209', '9900055406954889860316746330513795', 'rESQtswdK9wO0cxD', '1537571350', '1537571350', '1');
INSERT INTO `machine_record` VALUES ('210', '86205203682600489861114708985072388', 'rESQtswdK9wO0cxD', '1537571472', '1537571472', '1');
INSERT INTO `machine_record` VALUES ('211', '868508023944633', 'rESQtswdK9wO0cxD', '1537571601', '1537571601', '1');
INSERT INTO `machine_record` VALUES ('212', '86906603815891289860040191833989648', 'rESQtswdK9wO0cxD', '1537574476', '1537574476', '1');
INSERT INTO `machine_record` VALUES ('213', 'A100004D5B387D89861118043100968666', 'rESQtswdK9wO0cxD', '1537574894', '1537574894', '1');
INSERT INTO `machine_record` VALUES ('214', '865937030932880898602a515163a343056', 'rESQtswdK9wO0cxD', '1537575343', '1537575343', '1');
INSERT INTO `machine_record` VALUES ('215', '862018033836593', 'rESQtswdK9wO0cxD', '1537576077', '1537576077', '1');
INSERT INTO `machine_record` VALUES ('216', '862913035599654898600501615F1103925', 'rESQtswdK9wO0cxD', '1537576269', '1537576269', '1');
INSERT INTO `machine_record` VALUES ('217', '86416203849479889860117477520100828', 'rESQtswdK9wO0cxD', '1537577271', '1537577271', '1');
INSERT INTO `machine_record` VALUES ('218', '866412035688860', 'rESQtswdK9wO0cxD', '1537577950', '1537577950', '1');
INSERT INTO `machine_record` VALUES ('219', 'A00000890FD64489860117819033843099', 'rESQtswdK9wO0cxD', '1537578387', '1537578387', '1');
INSERT INTO `machine_record` VALUES ('220', '868699020410585898600902316917c0794', 'rESQtswdK9wO0cxD', '1537578586', '1537578586', '1');
INSERT INTO `machine_record` VALUES ('221', 'A1000052BDCFA4', 'rESQtswdK9wO0cxD', '1537579360', '1537579360', '1');
INSERT INTO `machine_record` VALUES ('222', '86980202526503389860116876016711140', 'rESQtswdK9wO0cxD', '1537579551', '1537579551', '1');
INSERT INTO `machine_record` VALUES ('223', '86432803214801789860117874010437290', 'rESQtswdK9wO0cxD', '1537579612', '1537579612', '1');
INSERT INTO `machine_record` VALUES ('224', 'A100004FD48A5D', 'rESQtswdK9wO0cxD', '1537580007', '1537580007', '1');
INSERT INTO `machine_record` VALUES ('225', '861136034436865', 'rESQtswdK9wO0cxD', '1537580657', '1537580657', '1');
INSERT INTO `machine_record` VALUES ('226', '86778902961468289860116281530831492', 'rESQtswdK9wO0cxD', '1537580914', '1537580914', '1');
INSERT INTO `machine_record` VALUES ('227', '862787033124115898600051314F3029079', 'rESQtswdK9wO0cxD', '1537584224', '1537584224', '1');
INSERT INTO `machine_record` VALUES ('228', 'A10000555759B1', 'rESQtswdK9wO0cxD', '1537584673', '1537584673', '1');
INSERT INTO `machine_record` VALUES ('229', '866194039501956898600C231AB83378598', 'rESQtswdK9wO0cxD', '1537584992', '1537584992', '2');
INSERT INTO `machine_record` VALUES ('230', 'A000008D40FCFB', 'rESQtswdK9wO0cxD', '1537586080', '1537586080', '1');
INSERT INTO `machine_record` VALUES ('231', '866174022686089', 'rESQtswdK9wO0cxD', '1537586279', '1537586279', '1');
INSERT INTO `machine_record` VALUES ('232', '863698033530418898600C4084494671139', 'rESQtswdK9wO0cxD', '1537586964', '1537586964', '1');
INSERT INTO `machine_record` VALUES ('233', '860962032419426', 'rESQtswdK9wO0cxD', '1537587057', '1537587057', '1');
INSERT INTO `machine_record` VALUES ('234', '863329032065608898602a0201740002101', 'rESQtswdK9wO0cxD', '1537587333', '1537587333', '1');
INSERT INTO `machine_record` VALUES ('235', '86950703459875989860117801283819391', 'rESQtswdK9wO0cxD', '1537587713', '1537587713', '1');
INSERT INTO `machine_record` VALUES ('236', '863469038744838', 'rESQtswdK9wO0cxD', '1537588671', '1537588671', '1');
INSERT INTO `machine_record` VALUES ('237', '866923036665756', 'rESQtswdK9wO0cxD', '1537588891', '1537588891', '1');
INSERT INTO `machine_record` VALUES ('238', 'TYHBBAB7B2400184', 'rESQtswdK9wO0cxD', '1537590002', '1537590002', '1');
INSERT INTO `machine_record` VALUES ('239', '861503036051549', 'rESQtswdK9wO0cxD', '1537590412', '1537590412', '1');
INSERT INTO `machine_record` VALUES ('240', '865490031135756', 'rESQtswdK9wO0cxD', '1537591508', '1537591508', '1');
INSERT INTO `machine_record` VALUES ('241', '869270025431403', 'rESQtswdK9wO0cxD', '1537591632', '1537591632', '1');
INSERT INTO `machine_record` VALUES ('242', '352922050459105', 'rESQtswdK9wO0cxD', '1537592050', '1537592050', '1');
INSERT INTO `machine_record` VALUES ('243', '352273014492729', 'rESQtswdK9wO0cxD', '1537592171', '1537592171', '1');
INSERT INTO `machine_record` VALUES ('244', 'A10000421BD2EF', 'rESQtswdK9wO0cxD', '1537592222', '1537592222', '1');
INSERT INTO `machine_record` VALUES ('245', '86465803153474689860116915100841882', 'rESQtswdK9wO0cxD', '1537593454', '1537593454', '1');
INSERT INTO `machine_record` VALUES ('246', '86970403648507389860117801925831382', 'rESQtswdK9wO0cxD', '1537594178', '1537594178', '1');
INSERT INTO `machine_record` VALUES ('247', '86191803383311389860087201790039745', 'rESQtswdK9wO0cxD', '1537594880', '1537594880', '1');
INSERT INTO `machine_record` VALUES ('248', '86657003641298489860040191722318304', 'rESQtswdK9wO0cxD', '1537594983', '1537594983', '1');
INSERT INTO `machine_record` VALUES ('249', '866842031512237898600b9201750002221', 'rESQtswdK9wO0cxD', '1537595207', '1537595207', '1');
INSERT INTO `machine_record` VALUES ('250', '866722026482572', 'rESQtswdK9wO0cxD', '1537595304', '1537595304', '1');
INSERT INTO `machine_record` VALUES ('251', '864279025133187', 'rESQtswdK9wO0cxD', '1537596965', '1537596965', '1');
INSERT INTO `machine_record` VALUES ('252', '86869802903093189860078189459106558', 'rESQtswdK9wO0cxD', '1537597163', '1537597163', '1');
INSERT INTO `machine_record` VALUES ('253', '86283703085107789860081191835902287', 'rESQtswdK9wO0cxD', '1537601637', '1537601637', '1');
INSERT INTO `machine_record` VALUES ('254', '866921031586415898602D7183792483522', 'rESQtswdK9wO0cxD', '1537602722', '1537602722', '1');
INSERT INTO `machine_record` VALUES ('255', 'A000006808920A89860316243752156352', 'rESQtswdK9wO0cxD', '1537605278', '1537605278', '1');
INSERT INTO `machine_record` VALUES ('256', '86803803732575189860117265200298172', 'rESQtswdK9wO0cxD', '1537605388', '1537605388', '1');
INSERT INTO `machine_record` VALUES ('257', '865623039367035', 'rESQtswdK9wO0cxD', '1537606323', '1537606323', '1');
INSERT INTO `machine_record` VALUES ('258', '869465032703113898600D81615F0712673', 'rESQtswdK9wO0cxD', '1537606664', '1537606664', '1');
INSERT INTO `machine_record` VALUES ('259', '86051403410859689860087189455114771', 'rESQtswdK9wO0cxD', '1537607239', '1537607239', '1');
INSERT INTO `machine_record` VALUES ('260', '862982039959818898600d1141707258105', 'rESQtswdK9wO0cxD', '1537611762', '1537611762', '1');
INSERT INTO `machine_record` VALUES ('261', '86809202166334789860040191834021566', 'rESQtswdK9wO0cxD', '1537615467', '1537615467', '1');
INSERT INTO `machine_record` VALUES ('262', '866041033625267', 'rESQtswdK9wO0cxD', '1537615579', '1537615579', '1');
INSERT INTO `machine_record` VALUES ('263', 'd72c5a50704786e1342f2169', 'rESQtswdK9wO0cxD', '1537616140', '1537616140', '1');
INSERT INTO `machine_record` VALUES ('264', '35978605991418589860112813015471222', 'rESQtswdK9wO0cxD', '1537616259', '1537616259', '1');
INSERT INTO `machine_record` VALUES ('265', '86327403608874589860012179707723727', 'rESQtswdK9wO0cxD', '1537616669', '1537616669', '1');
INSERT INTO `machine_record` VALUES ('266', '860162039890683', 'rESQtswdK9wO0cxD', '1537616852', '1537616852', '1');
INSERT INTO `machine_record` VALUES ('267', '86970003091135389860022177847057789', 'rESQtswdK9wO0cxD', '1537617074', '1537617074', '1');
INSERT INTO `machine_record` VALUES ('268', '9900080763955789860316247300984124', 'rESQtswdK9wO0cxD', '1537617570', '1537617570', '1');
INSERT INTO `machine_record` VALUES ('269', '86669602621489889860007201770117227', 'rESQtswdK9wO0cxD', '1537618102', '1537618102', '1');
INSERT INTO `machine_record` VALUES ('270', '866189037357278', 'rESQtswdK9wO0cxD', '1537620546', '1537620546', '1');
INSERT INTO `machine_record` VALUES ('271', '860943022345078', 'rESQtswdK9wO0cxD', '1537621331', '1537621331', '1');
INSERT INTO `machine_record` VALUES ('272', '8661780377690388986002615155b030466', 'rESQtswdK9wO0cxD', '1537621392', '1537621392', '1');
INSERT INTO `machine_record` VALUES ('273', '868305025033071', 'rESQtswdK9wO0cxD', '1537621621', '1537621621', '1');
INSERT INTO `machine_record` VALUES ('274', '9900098615542689860311000293121591', 'rESQtswdK9wO0cxD', '1537622048', '1537622048', '1');
INSERT INTO `machine_record` VALUES ('275', '86672202758971489860059061845090982', 'rESQtswdK9wO0cxD', '1537623857', '1537623857', '1');
INSERT INTO `machine_record` VALUES ('276', '863563031458147898600C1011780001775', 'rESQtswdK9wO0cxD', '1537623972', '1537623972', '1');
INSERT INTO `machine_record` VALUES ('277', '86285904421913389860078201670033417', 'rESQtswdK9wO0cxD', '1537624046', '1537624046', '1');
INSERT INTO `machine_record` VALUES ('278', '86596403144344489860114577450018131', 'rESQtswdK9wO0cxD', '1537624830', '1537624830', '1');
INSERT INTO `machine_record` VALUES ('279', '860209035475157', 'rESQtswdK9wO0cxD', '1537626986', '1537626986', '1');
INSERT INTO `machine_record` VALUES ('280', '8675670321538768986000615164a764143', 'rESQtswdK9wO0cxD', '1537627112', '1537627112', '1');
INSERT INTO `machine_record` VALUES ('281', '9900101458179889860318145640743614', 'rESQtswdK9wO0cxD', '1537628261', '1537628261', '1');
INSERT INTO `machine_record` VALUES ('282', '86974103666698989860118801226385152', 'rESQtswdK9wO0cxD', '1537631103', '1537631103', '1');
INSERT INTO `machine_record` VALUES ('283', '86840402679664489860315940216247989', 'rESQtswdK9wO0cxD', '1537631423', '1537631423', '1');
INSERT INTO `machine_record` VALUES ('284', '868599036561100898600B11617F0025134', 'rESQtswdK9wO0cxD', '1537633857', '1537633857', '1');
INSERT INTO `machine_record` VALUES ('285', '868436023479758898600B31617F0291225', 'rESQtswdK9wO0cxD', '1537636768', '1537636768', '1');
INSERT INTO `machine_record` VALUES ('286', '86568202880145389860087141404025766', 'rESQtswdK9wO0cxD', '1537657206', '1537657206', '1');
INSERT INTO `machine_record` VALUES ('287', '862676032011672', 'rESQtswdK9wO0cxD', '1537657580', '1537657580', '1');
INSERT INTO `machine_record` VALUES ('288', '352005048247251', 'rESQtswdK9wO0cxD', '1537660209', '1537660209', '1');
INSERT INTO `machine_record` VALUES ('289', '868100020691472', 'rESQtswdK9wO0cxD', '1537662967', '1537662967', '1');
INSERT INTO `machine_record` VALUES ('290', '89860032245575953325', 'rESQtswdK9wO0cxD', '1537663261', '1537663261', '1');
INSERT INTO `machine_record` VALUES ('291', '860267037756818', 'rESQtswdK9wO0cxD', '1537663367', '1537663367', '1');
INSERT INTO `machine_record` VALUES ('292', '869722020529565', 'rESQtswdK9wO0cxD', '1537664445', '1537664445', '1');
INSERT INTO `machine_record` VALUES ('293', '86898903479280989860042191673262616', 'rESQtswdK9wO0cxD', '1537664750', '1537664750', '1');
INSERT INTO `machine_record` VALUES ('294', 'A00000709A205589861114815100226896', 'rESQtswdK9wO0cxD', '1537667255', '1537667255', '1');
INSERT INTO `machine_record` VALUES ('295', '8681020246731758986005815179a135829', 'rESQtswdK9wO0cxD', '1537669768', '1537669768', '1');
INSERT INTO `machine_record` VALUES ('296', '86644303684831089860082028241767971', 'rESQtswdK9wO0cxD', '1537671293', '1537671293', '1');
INSERT INTO `machine_record` VALUES ('297', 'A100004E483C8189860318247961349615', 'rESQtswdK9wO0cxD', '1537671955', '1537671955', '1');
INSERT INTO `machine_record` VALUES ('298', 'ida28a4186-fa63-4c68-b4b3-782f8ab9fe9b', 'rESQtswdK9wO0cxD', '1537672171', '1537672171', '1');
INSERT INTO `machine_record` VALUES ('299', '861851037710401898600231615f1398240', 'rESQtswdK9wO0cxD', '1537673019', '1537673019', '1');
INSERT INTO `machine_record` VALUES ('300', '867664023556942', 'rESQtswdK9wO0cxD', '1537677177', '1537677177', '1');
INSERT INTO `machine_record` VALUES ('301', '866260031389300', 'rESQtswdK9wO0cxD', '1537677184', '1537677184', '1');
INSERT INTO `machine_record` VALUES ('302', '861305033569782898600', 'rESQtswdK9wO0cxD', '1537677197', '1537677197', '1');
INSERT INTO `machine_record` VALUES ('303', '86885402234542689860026151740029727', 'rESQtswdK9wO0cxD', '1537677827', '1537677827', '2');
INSERT INTO `machine_record` VALUES ('304', '86077903239745589860018221794F34075', 'rESQtswdK9wO0cxD', '1537678449', '1537678449', '1');
INSERT INTO `machine_record` VALUES ('305', '862238034989205898600d1271755175774', 'rESQtswdK9wO0cxD', '1537679470', '1537679470', '1');
INSERT INTO `machine_record` VALUES ('306', '86367303211606389860099045750039216', 'rESQtswdK9wO0cxD', '1537681803', '1537681803', '1');
INSERT INTO `machine_record` VALUES ('307', '861012032205216', 'rESQtswdK9wO0cxD', '1537681944', '1537681944', '1');
INSERT INTO `machine_record` VALUES ('308', '866012036516258898600a0059954931524', 'rESQtswdK9wO0cxD', '1537683627', '1537683627', '1');
INSERT INTO `machine_record` VALUES ('309', '86439203270841089860114417200122232', 'rESQtswdK9wO0cxD', '1537684259', '1537684259', '1');
INSERT INTO `machine_record` VALUES ('310', '35346008142997889860315243171070474', 'rESQtswdK9wO0cxD', '1537685264', '1537685264', '1');
INSERT INTO `machine_record` VALUES ('311', '86525603450808789860111391300653011', 'rESQtswdK9wO0cxD', '1537685574', '1537685574', '1');
INSERT INTO `machine_record` VALUES ('312', '867229036190897898600C20917F5006963', 'rESQtswdK9wO0cxD', '1537686344', '1537686344', '1');
INSERT INTO `machine_record` VALUES ('313', '865479020868097', 'rESQtswdK9wO0cxD', '1537687315', '1537687315', '1');
INSERT INTO `machine_record` VALUES ('314', '862139033895643', 'rESQtswdK9wO0cxD', '1537687632', '1537687632', '1');
INSERT INTO `machine_record` VALUES ('315', '86260303144837489860013045420452316', 'rESQtswdK9wO0cxD', '1537688024', '1537688024', '1');
INSERT INTO `machine_record` VALUES ('316', '862532036138278898600F0187057386666', 'rESQtswdK9wO0cxD', '1537688410', '1537688410', '1');
INSERT INTO `machine_record` VALUES ('317', '89860117377940453957', 'rESQtswdK9wO0cxD', '1537692133', '1537692133', '1');
INSERT INTO `machine_record` VALUES ('318', '86350503202183889860117801024922645', 'rESQtswdK9wO0cxD', '1537694375', '1537694375', '1');
INSERT INTO `machine_record` VALUES ('319', '86792703970530289860004071494871678', 'rESQtswdK9wO0cxD', '1537695121', '1537695121', '1');
INSERT INTO `machine_record` VALUES ('320', '866330031781614898600E822164DC30678', 'rESQtswdK9wO0cxD', '1537695205', '1537695205', '1');
INSERT INTO `machine_record` VALUES ('321', '868063034102490898600F0111688001191', 'rESQtswdK9wO0cxD', '1537696794', '1537696794', '1');
INSERT INTO `machine_record` VALUES ('322', '869767027367436', 'rESQtswdK9wO0cxD', '1537698608', '1537698608', '1');
INSERT INTO `machine_record` VALUES ('323', '8629970333309158986002615189a620424', 'rESQtswdK9wO0cxD', '1537699783', '1537699783', '1');
INSERT INTO `machine_record` VALUES ('324', '86731603050569989860117801042710501', 'rESQtswdK9wO0cxD', '1537700897', '1537700897', '1');
INSERT INTO `machine_record` VALUES ('325', '865836031931950898602A7188494957860', 'rESQtswdK9wO0cxD', '1537702520', '1537702520', '1');
INSERT INTO `machine_record` VALUES ('326', '86898002895226989860093031470152693', 'rESQtswdK9wO0cxD', '1537703031', '1537703031', '1');
INSERT INTO `machine_record` VALUES ('327', '862828032906951898600382314967b4799', 'rESQtswdK9wO0cxD', '1537703727', '1537703727', '1');
INSERT INTO `machine_record` VALUES ('328', 'A00000748151A4898600F9271755687452', 'rESQtswdK9wO0cxD', '1537704721', '1537704721', '1');
INSERT INTO `machine_record` VALUES ('329', '8628290320456918986002615155d656714', 'rESQtswdK9wO0cxD', '1537707653', '1537707653', '1');
INSERT INTO `machine_record` VALUES ('330', '865002026895151', 'rESQtswdK9wO0cxD', '1537707777', '1537707777', '1');
INSERT INTO `machine_record` VALUES ('331', '86851903798628889860118801348001497', 'rESQtswdK9wO0cxD', '1537709219', '1537709219', '1');
INSERT INTO `machine_record` VALUES ('332', '86974603607787189860047061405289302', 'rESQtswdK9wO0cxD', '1537709680', '1537709680', '1');
INSERT INTO `machine_record` VALUES ('333', '86194503763755489861114750231511256', 'rESQtswdK9wO0cxD', '1537709743', '1537709743', '1');
INSERT INTO `machine_record` VALUES ('334', 'id1d6c0dd0-fbee-4f5e-a833-82f03ee790ed', 'rESQtswdK9wO0cxD', '1537710927', '1537710927', '1');
INSERT INTO `machine_record` VALUES ('335', '86930503149301189860031187505219723', 'rESQtswdK9wO0cxD', '1537712940', '1537712940', '1');
INSERT INTO `machine_record` VALUES ('336', '868238029497648', 'rESQtswdK9wO0cxD', '1537713655', '1537713655', '1');
INSERT INTO `machine_record` VALUES ('337', '86450202382030189860083191835304002', 'rESQtswdK9wO0cxD', '1537714740', '1537714740', '1');
INSERT INTO `machine_record` VALUES ('338', '357143045473342', 'rESQtswdK9wO0cxD', '1537715007', '1537715007', '1');
INSERT INTO `machine_record` VALUES ('339', '8663990389918078986000615165b160827', 'rESQtswdK9wO0cxD', '1537716554', '1537716554', '1');
INSERT INTO `machine_record` VALUES ('340', '867471039374918898600C0188430398472', 'rESQtswdK9wO0cxD', '1537717034', '1537717034', '1');
INSERT INTO `machine_record` VALUES ('341', '86980002639728489860038248786397517', 'rESQtswdK9wO0cxD', '1537717561', '1537717561', '1');
INSERT INTO `machine_record` VALUES ('342', '86635003841671789860087211890107198', 'rESQtswdK9wO0cxD', '1537724592', '1537724592', '1');
INSERT INTO `machine_record` VALUES ('343', 'a000005580326589860000191897205979', 'rESQtswdK9wO0cxD', '1537726358', '1537726358', '1');
INSERT INTO `machine_record` VALUES ('344', '864839030882415', 'rESQtswdK9wO0cxD', '1537736131', '1537736131', '1');
INSERT INTO `machine_record` VALUES ('345', '864290039770575', 'rESQtswdK9wO0cxD', '1537741960', '1537741960', '1');
INSERT INTO `machine_record` VALUES ('346', '86486002180973889860105125940337322', 'rESQtswdK9wO0cxD', '1537741969', '1537741969', '1');
INSERT INTO `machine_record` VALUES ('347', 'A000005555864089860315746600075104', 'rESQtswdK9wO0cxD', '1537747994', '1537747994', '1');
INSERT INTO `machine_record` VALUES ('348', '86950703580786089860316845570182558', 'rESQtswdK9wO0cxD', '1537748463', '1537748463', '1');
INSERT INTO `machine_record` VALUES ('349', '865418025353200', 'rESQtswdK9wO0cxD', '1537751288', '1537751288', '1');
INSERT INTO `machine_record` VALUES ('350', '00000000', 'rESQtswdK9wO0cxD', '1537751613', '1537751613', '1');
INSERT INTO `machine_record` VALUES ('351', '86528003035819889860072191607200025', 'rESQtswdK9wO0cxD', '1537751686', '1537751686', '1');
INSERT INTO `machine_record` VALUES ('352', '863972030361816', 'rESQtswdK9wO0cxD', '1537752178', '1537752178', '1');
INSERT INTO `machine_record` VALUES ('353', '9900111801203189860316947580404848', 'rESQtswdK9wO0cxD', '1537753438', '1537753438', '1');
INSERT INTO `machine_record` VALUES ('354', '864231031845569', 'rESQtswdK9wO0cxD', '1537754142', '1537754142', '1');
INSERT INTO `machine_record` VALUES ('355', '8626600368893178986003615169a230774', 'rESQtswdK9wO0cxD', '1537754536', '1537754536', '1');
INSERT INTO `machine_record` VALUES ('356', '863921013739175', 'rESQtswdK9wO0cxD', '1537758336', '1537758336', '1');
INSERT INTO `machine_record` VALUES ('357', '86384503459004689860071191507873006', 'rESQtswdK9wO0cxD', '1537759961', '1537759961', '1');
INSERT INTO `machine_record` VALUES ('358', '86281303444059789860065111656003831', 'rESQtswdK9wO0cxD', '1537760705', '1537760705', '1');
INSERT INTO `machine_record` VALUES ('359', '99000561221122', 'rESQtswdK9wO0cxD', '1537763447', '1537763447', '1');
INSERT INTO `machine_record` VALUES ('360', '863265031024164898600901615f0775460', 'rESQtswdK9wO0cxD', '1537765166', '1537765166', '1');
INSERT INTO `machine_record` VALUES ('361', '86967102138064589860112876038313739', 'rESQtswdK9wO0cxD', '1537765343', '1537765343', '1');
INSERT INTO `machine_record` VALUES ('362', '864411037845991898600e31617f0690301', 'rESQtswdK9wO0cxD', '1537769809', '1537769809', '1');
INSERT INTO `machine_record` VALUES ('363', '86468403407282389860075141407017073', 'rESQtswdK9wO0cxD', '1537770974', '1537770974', '1');
INSERT INTO `machine_record` VALUES ('364', '86274603668940989860317745353383937', 'rESQtswdK9wO0cxD', '1537771817', '1537771817', '1');
INSERT INTO `machine_record` VALUES ('365', '86873803934773389860318240270685985', 'rESQtswdK9wO0cxD', '1537771909', '1537771909', '1');
INSERT INTO `machine_record` VALUES ('366', '86187303120623689860097211670094607', 'rESQtswdK9wO0cxD', '1537773955', '1537773955', '1');
INSERT INTO `machine_record` VALUES ('367', '864290037685817898600382315800A6326', 'rESQtswdK9wO0cxD', '1537774109', '1537774109', '1');
INSERT INTO `machine_record` VALUES ('368', '866123039214153898600f9261777573848', 'rESQtswdK9wO0cxD', '1537774720', '1537774720', '1');
INSERT INTO `machine_record` VALUES ('369', '86410603719981789860028246493586327', 'rESQtswdK9wO0cxD', '1537774941', '1537774941', '1');
INSERT INTO `machine_record` VALUES ('370', '865488021214920', 'rESQtswdK9wO0cxD', '1537776694', '1537776694', '1');
INSERT INTO `machine_record` VALUES ('371', '86112803545745389860117801697884163', 'rESQtswdK9wO0cxD', '1537777382', '1537777382', '1');
INSERT INTO `machine_record` VALUES ('372', '862977041771193', 'rESQtswdK9wO0cxD', '1537785735', '1537785735', '1');
INSERT INTO `machine_record` VALUES ('373', '865629039444195898600E4261777806612', 'rESQtswdK9wO0cxD', '1537787957', '1537787957', '1');
INSERT INTO `machine_record` VALUES ('374', '86151603093468489860059045894064254', 'rESQtswdK9wO0cxD', '1537788849', '1537788849', '1');
INSERT INTO `machine_record` VALUES ('375', '862731033332294', 'rESQtswdK9wO0cxD', '1537789605', '1537789605', '1');
INSERT INTO `machine_record` VALUES ('376', '86284103764626689860000191757021704', 'rESQtswdK9wO0cxD', '1537797135', '1537797135', '1');
INSERT INTO `machine_record` VALUES ('377', '860777030863569', 'rESQtswdK9wO0cxD', '1537798008', '1537798008', '1');
INSERT INTO `machine_record` VALUES ('378', '866693027258081898602D8251852280332', 'rESQtswdK9wO0cxD', '1537799588', '1537799588', '1');
INSERT INTO `machine_record` VALUES ('379', 'A000006403D10D89860115876089461905', 'rESQtswdK9wO0cxD', '1537799765', '1537799765', '1');
INSERT INTO `machine_record` VALUES ('380', '86090103769347889860086151440047873', 'rESQtswdK9wO0cxD', '1537800290', '1537800290', '1');
INSERT INTO `machine_record` VALUES ('381', 'A0000056B1536C89860318244511236475', 'rESQtswdK9wO0cxD', '1537806531', '1537806531', '1');
INSERT INTO `machine_record` VALUES ('382', '868505020297023', 'rESQtswdK9wO0cxD', '1537813032', '1537813032', '1');
INSERT INTO `machine_record` VALUES ('383', '359713080583441', 'rESQtswdK9wO0cxD', '1537815058', '1537815058', '1');
INSERT INTO `machine_record` VALUES ('384', '86898203920689189860040177709804662', 'rESQtswdK9wO0cxD', '1537823323', '1537823323', '2');
INSERT INTO `machine_record` VALUES ('385', '868803043720117898600151316F5013494', 'rESQtswdK9wO0cxD', '1537837470', '1537837470', '1');
INSERT INTO `machine_record` VALUES ('386', '86693303854601189860317955122954310', 'rESQtswdK9wO0cxD', '1537838718', '1537838718', '1');
INSERT INTO `machine_record` VALUES ('387', '867615027161980898600f4088499709570', 'rESQtswdK9wO0cxD', '1537846373', '1537846373', '1');
INSERT INTO `machine_record` VALUES ('388', '863797037556815898602', 'rESQtswdK9wO0cxD', '1537848757', '1537848757', '1');
INSERT INTO `machine_record` VALUES ('389', '866331025666019', 'rESQtswdK9wO0cxD', '1537852804', '1537852804', '1');
INSERT INTO `machine_record` VALUES ('390', '86656802957524789860037031800139416', 'rESQtswdK9wO0cxD', '1537854181', '1537854181', '1');
INSERT INTO `machine_record` VALUES ('391', '89860318249102834570', 'rESQtswdK9wO0cxD', '1537859643', '1537859643', '1');
INSERT INTO `machine_record` VALUES ('392', '866842037759816', 'rESQtswdK9wO0cxD', '1537860568', '1537860568', '1');
INSERT INTO `machine_record` VALUES ('393', '86432803829901289860117888006919186', 'rESQtswdK9wO0cxD', '1537861109', '1537861109', '1');
INSERT INTO `machine_record` VALUES ('394', '008796761486892', 'rESQtswdK9wO0cxD', '1537864128', '1537864128', '1');
INSERT INTO `machine_record` VALUES ('395', 'A10000421CD1F3', 'rESQtswdK9wO0cxD', '1537867198', '1537867198', '1');
INSERT INTO `machine_record` VALUES ('396', '86304103066165689860028245495247717', 'rESQtswdK9wO0cxD', '1537871426', '1537871426', '1');
INSERT INTO `machine_record` VALUES ('397', '867572047671532898600E9281801085767', 'rESQtswdK9wO0cxD', '1537872327', '1537872327', '1');
INSERT INTO `machine_record` VALUES ('398', '86296303406604989860112317670329873', 'rESQtswdK9wO0cxD', '1537873406', '1537873406', '1');
INSERT INTO `machine_record` VALUES ('399', '86976103815785289860027201150157048', 'rESQtswdK9wO0cxD', '1537875675', '1537875675', '1');
INSERT INTO `machine_record` VALUES ('400', '86725203931647589860050020040876938', 'rESQtswdK9wO0cxD', '1537877307', '1537877307', '1');
INSERT INTO `machine_record` VALUES ('401', '86648803959411489860033041696021179', 'rESQtswdK9wO0cxD', '1537877409', '1537877409', '1');
INSERT INTO `machine_record` VALUES ('402', '86717003371556989860116935010403128', 'rESQtswdK9wO0cxD', '1537878288', '1537878288', '1');
INSERT INTO `machine_record` VALUES ('403', '86399903393889489860065231483886001', 'rESQtswdK9wO0cxD', '1537878567', '1537878567', '1');
INSERT INTO `machine_record` VALUES ('404', '86524004199807789860091101451702227', 'rESQtswdK9wO0cxD', '1537879546', '1537879546', '1');
INSERT INTO `machine_record` VALUES ('405', '867769035279415898600c615168a565672', 'rESQtswdK9wO0cxD', '1537881338', '1537881338', '1');
INSERT INTO `machine_record` VALUES ('406', '8676340208966828962100792256988472', 'rESQtswdK9wO0cxD', '1537891832', '1537891832', '1');
INSERT INTO `machine_record` VALUES ('407', '86669703482771389860117876141427819', 'rESQtswdK9wO0cxD', '1537893458', '1537893458', '1');
INSERT INTO `machine_record` VALUES ('408', '867459034175794', 'rESQtswdK9wO0cxD', '1537909242', '1537909242', '1');
INSERT INTO `machine_record` VALUES ('409', 'a00000554189c989861114208313056070', 'rESQtswdK9wO0cxD', '1537909813', '1537909813', '2');
INSERT INTO `machine_record` VALUES ('410', 'id0cd1ac8f-9f14-4bb4-bc52-5525afca7b14', 'rESQtswdK9wO0cxD', '1537911412', '1537911412', '1');
INSERT INTO `machine_record` VALUES ('411', '865431030553110898600d0083790842986', 'rESQtswdK9wO0cxD', '1537922059', '1537922059', '1');
INSERT INTO `machine_record` VALUES ('412', '865075032237592898602c8251788505730', 'rESQtswdK9wO0cxD', '1537928684', '1537928684', '1');
INSERT INTO `machine_record` VALUES ('413', '869894022179606898602a2176477558824', 'rESQtswdK9wO0cxD', '1537931458', '1537931458', '1');
INSERT INTO `machine_record` VALUES ('414', '86749603415898289860098249506136588', 'rESQtswdK9wO0cxD', '1537937882', '1537937882', '1');
INSERT INTO `machine_record` VALUES ('415', '863295038221091898600F3031800523969', 'rESQtswdK9wO0cxD', '1537938619', '1537938619', '1');
INSERT INTO `machine_record` VALUES ('416', 'A00000728A4D2B89860318249140291544', 'rESQtswdK9wO0cxD', '1537950651', '1537950651', '1');
INSERT INTO `machine_record` VALUES ('417', '868027036258287', 'rESQtswdK9wO0cxD', '1537951244', '1537951244', '3');
INSERT INTO `machine_record` VALUES ('418', '358543080803387898600', 'rESQtswdK9wO0cxD', '1537953493', '1537953493', '1');
INSERT INTO `machine_record` VALUES ('419', '86611703650690089860088271455433693', 'rESQtswdK9wO0cxD', '1537959409', '1537959409', '1');
INSERT INTO `machine_record` VALUES ('420', '8626440336475089861118045171098497', 'rESQtswdK9wO0cxD', '1537967494', '1537967494', '1');
INSERT INTO `machine_record` VALUES ('421', '86373203962418889860116876088121095', 'rESQtswdK9wO0cxD', '1537968679', '1537968679', '1');
INSERT INTO `machine_record` VALUES ('422', '86537603517866289860115876059424263', 'rESQtswdK9wO0cxD', '1537970172', '1537970172', '1');
INSERT INTO `machine_record` VALUES ('423', '862915039213158', 'rESQtswdK9wO0cxD', '1537975110', '1537975110', '1');
INSERT INTO `machine_record` VALUES ('424', '868391022471613898600220917f3006811', 'rESQtswdK9wO0cxD', '1537977631', '1537977631', '1');
INSERT INTO `machine_record` VALUES ('425', '861062031277625898600c4087675432588', 'rESQtswdK9wO0cxD', '1538019205', '1538019205', '1');
INSERT INTO `machine_record` VALUES ('426', '86822803125836989860094061845201630', 'rESQtswdK9wO0cxD', '1538024281', '1538024281', '1');
INSERT INTO `machine_record` VALUES ('427', '86224103420316389860117881028388092', 'rESQtswdK9wO0cxD', '1538035912', '1538035912', '1');
INSERT INTO `machine_record` VALUES ('428', '864975024193474898600F222170DA57384', 'rESQtswdK9wO0cxD', '1538037384', '1538037384', '1');
INSERT INTO `machine_record` VALUES ('429', 'A0000064C3477089860317249512793011', 'rESQtswdK9wO0cxD', '1538038275', '1538038275', '1');
INSERT INTO `machine_record` VALUES ('430', '86184403593973489860050178648657237', 'rESQtswdK9wO0cxD', '1538043879', '1538043879', '1');
INSERT INTO `machine_record` VALUES ('431', 'A00000555A2701', 'rESQtswdK9wO0cxD', '1538046710', '1538046710', '1');
INSERT INTO `machine_record` VALUES ('432', '9900064668621389860097201490170870', 'rESQtswdK9wO0cxD', '1538048451', '1538048451', '1');
INSERT INTO `machine_record` VALUES ('433', '86224403068671289860117801905881423', 'rESQtswdK9wO0cxD', '1538048452', '1538048452', '1');
INSERT INTO `machine_record` VALUES ('434', '867064019486594', 'rESQtswdK9wO0cxD', '1538048615', '1538048615', '1');
INSERT INTO `machine_record` VALUES ('435', '864290034735714898600F2261476660541', 'rESQtswdK9wO0cxD', '1538055819', '1538055819', '1');
INSERT INTO `machine_record` VALUES ('436', '863209035183436898600e8231594399875', 'rESQtswdK9wO0cxD', '1538065521', '1538065521', '1');
INSERT INTO `machine_record` VALUES ('437', '862922038955003', 'rESQtswdK9wO0cxD', '1538067297', '1538067297', '1');
INSERT INTO `machine_record` VALUES ('438', '868146023454160', 'rESQtswdK9wO0cxD', '1538068485', '1538068485', '1');
INSERT INTO `machine_record` VALUES ('439', '86307203933274289860114875005398358', 'rESQtswdK9wO0cxD', '1538075854', '1538075854', '1');
INSERT INTO `machine_record` VALUES ('440', '868131026749253898600601615f1651664', 'rESQtswdK9wO0cxD', '1538076377', '1538076377', '1');
INSERT INTO `machine_record` VALUES ('441', '86867902980512689860005101451122614', 'rESQtswdK9wO0cxD', '1538086119', '1538086119', '1');
INSERT INTO `machine_record` VALUES ('442', '86429003162421889860096101850147735', 'rESQtswdK9wO0cxD', '1538103160', '1538103160', '1');
INSERT INTO `machine_record` VALUES ('443', '866183040952837898600', 'rESQtswdK9wO0cxD', '1538106937', '1538106937', '1');
INSERT INTO `machine_record` VALUES ('444', '86125903670943489860114876150038880', 'rESQtswdK9wO0cxD', '1538112091', '1538112091', '1');
INSERT INTO `machine_record` VALUES ('445', '86931403604211289860117818098500131', 'rESQtswdK9wO0cxD', '1538116732', '1538116732', '1');
INSERT INTO `machine_record` VALUES ('446', '86274703554040389861118042830071676', 'rESQtswdK9wO0cxD', '1538126497', '1538126497', '1');
INSERT INTO `machine_record` VALUES ('447', '866968024162548', 'rESQtswdK9wO0cxD', '1538127640', '1538127640', '3');
INSERT INTO `machine_record` VALUES ('448', '867497038991162898600c91617f0849521', 'rESQtswdK9wO0cxD', '1538127980', '1538127980', '1');
INSERT INTO `machine_record` VALUES ('449', 'A100005C4787A589860317049382681928', 'rESQtswdK9wO0cxD', '1538128058', '1538128058', '1');
INSERT INTO `machine_record` VALUES ('450', '86503003405433989860114874051075747', 'rESQtswdK9wO0cxD', '1538130520', '1538130520', '2');
INSERT INTO `machine_record` VALUES ('451', '86454603906989089860117890001894539', 'rESQtswdK9wO0cxD', '1538130842', '1538130842', '1');
INSERT INTO `machine_record` VALUES ('452', '359397070732638', 'rESQtswdK9wO0cxD', '1538132620', '1538132620', '1');
INSERT INTO `machine_record` VALUES ('453', '86915003359129189860118801108401697', 'rESQtswdK9wO0cxD', '1538133302', '1538133302', '1');
INSERT INTO `machine_record` VALUES ('454', '86617603824251889860113818081004558', 'rESQtswdK9wO0cxD', '1538133497', '1538133497', '1');
INSERT INTO `machine_record` VALUES ('455', '865098040959775', 'rESQtswdK9wO0cxD', '1538135603', '1538135603', '1');
INSERT INTO `machine_record` VALUES ('456', '86611703001617989860035128485091067', 'rESQtswdK9wO0cxD', '1538138774', '1538138774', '1');
INSERT INTO `machine_record` VALUES ('457', '868100023056152', 'rESQtswdK9wO0cxD', '1538138845', '1538138845', '1');
INSERT INTO `machine_record` VALUES ('458', '86612203340420889860317243723032665', 'rESQtswdK9wO0cxD', '1538139693', '1538139693', '1');
INSERT INTO `machine_record` VALUES ('459', '862823036333757', 'rESQtswdK9wO0cxD', '1538142056', '1538142056', '1');
INSERT INTO `machine_record` VALUES ('460', '867710030230987', 'rESQtswdK9wO0cxD', '1538142147', '1538142147', '1');
INSERT INTO `machine_record` VALUES ('461', '86480403204955389860024061496511337', 'rESQtswdK9wO0cxD', '1538142605', '1538142605', '1');
INSERT INTO `machine_record` VALUES ('462', '86693803650571189860317243962800236', 'rESQtswdK9wO0cxD', '1538150423', '1538150423', '1');
INSERT INTO `machine_record` VALUES ('463', '86532003370384089860118801481289917', 'rESQtswdK9wO0cxD', '1538151238', '1538151238', '1');
INSERT INTO `machine_record` VALUES ('464', '860485038697092', 'rESQtswdK9wO0cxD', '1538152528', '1538152528', '1');
INSERT INTO `machine_record` VALUES ('465', '86379303228127789860117603950274292', 'rESQtswdK9wO0cxD', '1538155163', '1538155163', '1');
INSERT INTO `machine_record` VALUES ('466', '86234103401269589860113834019075305', 'rESQtswdK9wO0cxD', '1538185511', '1538185511', '1');
INSERT INTO `machine_record` VALUES ('467', '869802022750417', 'rESQtswdK9wO0cxD', '1538187525', '1538187525', '1');
INSERT INTO `machine_record` VALUES ('468', '867663025169423', 'rESQtswdK9wO0cxD', '1538193658', '1538193658', '1');
INSERT INTO `machine_record` VALUES ('469', '86524004315372189860023031510290540', 'rESQtswdK9wO0cxD', '1538193750', '1538193750', '1');
INSERT INTO `machine_record` VALUES ('470', '862987020808189', 'rESQtswdK9wO0cxD', '1538194706', '1538194706', '1');
INSERT INTO `machine_record` VALUES ('471', '863100034720841', 'rESQtswdK9wO0cxD', '1538194740', '1538194740', '1');
INSERT INTO `machine_record` VALUES ('472', '867398030433395898600f5111751012540', 'rESQtswdK9wO0cxD', '1538199806', '1538199806', '1');
INSERT INTO `machine_record` VALUES ('473', '86824003009448989860114876123303247', 'rESQtswdK9wO0cxD', '1538203396', '1538203396', '1');
INSERT INTO `machine_record` VALUES ('474', '86260603604977489860033071544856339', 'rESQtswdK9wO0cxD', '1538206914', '1538206914', '1');
INSERT INTO `machine_record` VALUES ('475', '86564903477023889860029191607021853', 'rESQtswdK9wO0cxD', '1538206959', '1538206959', '1');
INSERT INTO `machine_record` VALUES ('476', '86413303753716889860317247151129794', 'rESQtswdK9wO0cxD', '1538214270', '1538214270', '1');
INSERT INTO `machine_record` VALUES ('477', '869560029974337898600e92952a7947803', 'rESQtswdK9wO0cxD', '1538218569', '1538218569', '1');
INSERT INTO `machine_record` VALUES ('478', '86839403510511189860034056958740895', 'rESQtswdK9wO0cxD', '1538218998', '1538218998', '1');
INSERT INTO `machine_record` VALUES ('479', '863736031710614898600A31615F0659721', 'rESQtswdK9wO0cxD', '1538223864', '1538223864', '1');
INSERT INTO `machine_record` VALUES ('480', 'idd32043d2-7107-4302-9c77-5998dd3ba419', 'rESQtswdK9wO0cxD', '1538224632', '1538224632', '1');
INSERT INTO `machine_record` VALUES ('481', '86100703034429889860117851115907302', 'rESQtswdK9wO0cxD', '1538225672', '1538225672', '1');
INSERT INTO `machine_record` VALUES ('482', '86073503027370089860058111556090090', 'rESQtswdK9wO0cxD', '1538227400', '1538227400', '1');
INSERT INTO `machine_record` VALUES ('483', '86596903398705889860117801391655562', 'rESQtswdK9wO0cxD', '1538227504', '1538227504', '1');
INSERT INTO `machine_record` VALUES ('484', '869515039398158', 'rESQtswdK9wO0cxD', '1538229074', '1538229074', '1');
INSERT INTO `machine_record` VALUES ('485', '008796754480541', 'rESQtswdK9wO0cxD', '1538230397', '1538230397', '1');
INSERT INTO `machine_record` VALUES ('486', '861405032357351', 'rESQtswdK9wO0cxD', '1538235380', '1538235380', '1');
INSERT INTO `machine_record` VALUES ('487', '866968028962786', 'rESQtswdK9wO0cxD', '1538236731', '1538236731', '1');
INSERT INTO `machine_record` VALUES ('488', '86422803071697389860114427950968486', 'rESQtswdK9wO0cxD', '1538239196', '1538239196', '1');
INSERT INTO `machine_record` VALUES ('489', '86561103020524789860059201650146998', 'rESQtswdK9wO0cxD', '1538248130', '1538248130', '1');
INSERT INTO `machine_record` VALUES ('490', '86282903668171589860117801624870665', 'rESQtswdK9wO0cxD', '1538253333', '1538253333', '1');
INSERT INTO `machine_record` VALUES ('491', '864282039935589898600331617f3123836', 'rESQtswdK9wO0cxD', '1538258120', '1538258120', '1');
INSERT INTO `machine_record` VALUES ('492', '86745102524337689860114818067910777', 'rESQtswdK9wO0cxD', '1538259535', '1538259535', '1');
INSERT INTO `machine_record` VALUES ('493', 'id6006eb33-784b-4bac-a6f4-d59edbe73bfd', 'rESQtswdK9wO0cxD', '1538261554', '1538261554', '1');
INSERT INTO `machine_record` VALUES ('494', '86399803395661789860315740232068405', 'rESQtswdK9wO0cxD', '1538262247', '1538262247', '1');
INSERT INTO `machine_record` VALUES ('495', '86820803942538489860096101650066567', 'rESQtswdK9wO0cxD', '1538271115', '1538271115', '1');
INSERT INTO `machine_record` VALUES ('496', '35775507029957189860028188470674869', 'rESQtswdK9wO0cxD', '1538272479', '1538272479', '1');
INSERT INTO `machine_record` VALUES ('497', '86971703125747989860012022255944249', 'rESQtswdK9wO0cxD', '1538277331', '1538277331', '1');
INSERT INTO `machine_record` VALUES ('498', '86363303525040089860038246786129447', 'rESQtswdK9wO0cxD', '1538277519', '1538277519', '1');
INSERT INTO `machine_record` VALUES ('499', '865920027326068', 'rESQtswdK9wO0cxD', '1538282128', '1538282128', '1');
INSERT INTO `machine_record` VALUES ('500', '869168023305845', 'rESQtswdK9wO0cxD', '1538283067', '1538283067', '1');
INSERT INTO `machine_record` VALUES ('501', '86931503436863189860117891035319188', 'rESQtswdK9wO0cxD', '1538283303', '1538283303', '1');
INSERT INTO `machine_record` VALUES ('502', '86708603300357689860099261478883235', 'rESQtswdK9wO0cxD', '1538284471', '1538284471', '1');
INSERT INTO `machine_record` VALUES ('503', '86684803639662589860117801810703431', 'rESQtswdK9wO0cxD', '1538284902', '1538284902', '1');
INSERT INTO `machine_record` VALUES ('504', '86310003718292489860318259910198043', 'rESQtswdK9wO0cxD', '1538288366', '1538288366', '1');
INSERT INTO `machine_record` VALUES ('505', '861743035359978', 'rESQtswdK9wO0cxD', '1538289768', '1538289768', '1');
INSERT INTO `machine_record` VALUES ('506', '86983602575387989860035120846717885', 'rESQtswdK9wO0cxD', '1538289882', '1538289882', '1');
INSERT INTO `machine_record` VALUES ('507', '8692400396535998986005815187a081955', 'rESQtswdK9wO0cxD', '1538290813', '1538290813', '1');
INSERT INTO `machine_record` VALUES ('508', '86254503976083189860095111654066739', 'rESQtswdK9wO0cxD', '1538291777', '1538291777', '1');
INSERT INTO `machine_record` VALUES ('509', '863488031258935898602a8221840923289', 'rESQtswdK9wO0cxD', '1538292587', '1538292587', '1');
INSERT INTO `machine_record` VALUES ('510', '86714003173069689860316249152991827', 'rESQtswdK9wO0cxD', '1538294412', '1538294412', '1');
INSERT INTO `machine_record` VALUES ('511', '8699330368617738986000615187a362552', 'rESQtswdK9wO0cxD', '1538294638', '1538294638', '1');
INSERT INTO `machine_record` VALUES ('512', '869115033876612898600231618F0672182', 'rESQtswdK9wO0cxD', '1538296891', '1538296891', '1');
INSERT INTO `machine_record` VALUES ('513', '867064029615935', 'rESQtswdK9wO0cxD', '1538297535', '1538297535', '1');
INSERT INTO `machine_record` VALUES ('514', '8639900400335148986008615148B217026', 'rESQtswdK9wO0cxD', '1538298775', '1538298775', '1');
INSERT INTO `machine_record` VALUES ('515', '86274503357008389860114819017959724', 'rESQtswdK9wO0cxD', '1538300096', '1538300096', '1');
INSERT INTO `machine_record` VALUES ('516', '867851021940927', 'rESQtswdK9wO0cxD', '1538300142', '1538300142', '1');
INSERT INTO `machine_record` VALUES ('517', '867931021628613', 'rESQtswdK9wO0cxD', '1538301502', '1538301502', '1');
INSERT INTO `machine_record` VALUES ('518', '86972302567150189860004201180109577', 'rESQtswdK9wO0cxD', '1538302552', '1538302552', '1');
INSERT INTO `machine_record` VALUES ('519', '86755803937186889861117147780870430', 'rESQtswdK9wO0cxD', '1538302928', '1538302928', '1');
INSERT INTO `machine_record` VALUES ('520', '866867030851385', 'rESQtswdK9wO0cxD', '1538303983', '1538303983', '1');
INSERT INTO `machine_record` VALUES ('521', '86635103819656489860014052958985665', 'rESQtswdK9wO0cxD', '1538304275', '1538304275', '1');
INSERT INTO `machine_record` VALUES ('522', '86713603392431189860099045071453306', 'rESQtswdK9wO0cxD', '1538305038', '1538305038', '1');
INSERT INTO `machine_record` VALUES ('523', '8675170337330089861118140205273784', 'rESQtswdK9wO0cxD', '1538305791', '1538305791', '1');
INSERT INTO `machine_record` VALUES ('524', '86872203124187089860075243405794619', 'rESQtswdK9wO0cxD', '1538307204', '1538307204', '1');
INSERT INTO `machine_record` VALUES ('525', '867515029086914', 'rESQtswdK9wO0cxD', '1538307307', '1538307307', '1');
INSERT INTO `machine_record` VALUES ('526', '869552022908198', 'rESQtswdK9wO0cxD', '1538307617', '1538307617', '1');
INSERT INTO `machine_record` VALUES ('527', '865217038766410898602D3311870075625', 'rESQtswdK9wO0cxD', '1538309190', '1538309190', '1');
INSERT INTO `machine_record` VALUES ('528', '867793023543863', 'rESQtswdK9wO0cxD', '1538309204', '1538309204', '1');
INSERT INTO `machine_record` VALUES ('529', '866654032429166898600501617f0547400', 'rESQtswdK9wO0cxD', '1538310102', '1538310102', '1');
INSERT INTO `machine_record` VALUES ('530', '86370803828265789860114874022594503', 'rESQtswdK9wO0cxD', '1538310605', '1538310605', '1');
INSERT INTO `machine_record` VALUES ('531', '86764102113070689860116840103764628', 'rESQtswdK9wO0cxD', '1538311134', '1538311134', '1');
INSERT INTO `machine_record` VALUES ('532', 'KVPBB17B09200032', 'rESQtswdK9wO0cxD', '1538312162', '1538312162', '1');
INSERT INTO `machine_record` VALUES ('533', '86851903547280289860068191507219959', 'rESQtswdK9wO0cxD', '1538314897', '1538314897', '1');
INSERT INTO `machine_record` VALUES ('534', '86713203872019289860091101650758840', 'rESQtswdK9wO0cxD', '1538314901', '1538314901', '1');
INSERT INTO `machine_record` VALUES ('535', '86839203241304189860033031800456614', 'rESQtswdK9wO0cxD', '1538316411', '1538316411', '1');
INSERT INTO `machine_record` VALUES ('536', '862461038040516', 'rESQtswdK9wO0cxD', '1538316560', '1538316560', '1');
INSERT INTO `machine_record` VALUES ('537', '863811013332115898600', 'rESQtswdK9wO0cxD', '1538316670', '1538316670', '1');
INSERT INTO `machine_record` VALUES ('538', '864103037457972898602A2084454672688', 'rESQtswdK9wO0cxD', '1538319785', '1538319785', '1');
INSERT INTO `machine_record` VALUES ('539', '862548032516580', 'rESQtswdK9wO0cxD', '1538320728', '1538320728', '1');
INSERT INTO `machine_record` VALUES ('540', '86970103398221989860117871060248346', 'rESQtswdK9wO0cxD', '1538320996', '1538320996', '1');
INSERT INTO `machine_record` VALUES ('541', '86851203081362589860318258711619173', 'rESQtswdK9wO0cxD', '1538321039', '1538321039', '1');
INSERT INTO `machine_record` VALUES ('542', '86637703996982400000000000007136564', 'rESQtswdK9wO0cxD', '1538324042', '1538324042', '1');
INSERT INTO `machine_record` VALUES ('543', '867461036525455898600A2141704108938', 'rESQtswdK9wO0cxD', '1538324174', '1538324174', '1');
INSERT INTO `machine_record` VALUES ('544', '868589028949967', 'rESQtswdK9wO0cxD', '1538324316', '1538324316', '1');
INSERT INTO `machine_record` VALUES ('545', '862215035268599898602a1124405336529', 'rESQtswdK9wO0cxD', '1538324732', '1538324732', '1');
INSERT INTO `machine_record` VALUES ('546', '86423003917523589860001191808270942', 'rESQtswdK9wO0cxD', '1538338465', '1538338465', '1');
INSERT INTO `machine_record` VALUES ('547', '89860117801653637134', 'rESQtswdK9wO0cxD', '1538343792', '1538343792', '1');
INSERT INTO `machine_record` VALUES ('548', '865990033942182', 'rESQtswdK9wO0cxD', '1538346297', '1538346297', '1');
INSERT INTO `machine_record` VALUES ('549', '86547302990940889860054221408552310', 'rESQtswdK9wO0cxD', '1538347561', '1538347561', '1');
INSERT INTO `machine_record` VALUES ('550', '86592002510791689860117817038617278', 'rESQtswdK9wO0cxD', '1538349134', '1538349134', '1');
INSERT INTO `machine_record` VALUES ('551', '86576203348938589860091101850517044', 'rESQtswdK9wO0cxD', '1538349170', '1538349170', '1');
INSERT INTO `machine_record` VALUES ('552', 'A000004852C060', 'rESQtswdK9wO0cxD', '1538350588', '1538350588', '1');
INSERT INTO `machine_record` VALUES ('553', '89860033031511299493', 'rESQtswdK9wO0cxD', '1538350664', '1538350664', '1');
INSERT INTO `machine_record` VALUES ('554', '868102029674400898602c8231691019188', 'rESQtswdK9wO0cxD', '1538350911', '1538350911', '1');
INSERT INTO `machine_record` VALUES ('555', '861504033772236898600f822150f056116', 'rESQtswdK9wO0cxD', '1538351910', '1538351910', '1');
INSERT INTO `machine_record` VALUES ('556', 'A0000073F9F42289860031189455583752', 'rESQtswdK9wO0cxD', '1538354615', '1538354615', '1');
INSERT INTO `machine_record` VALUES ('557', '867307038918588898600e01615f0130550', 'rESQtswdK9wO0cxD', '1538355315', '1538355315', '1');
INSERT INTO `machine_record` VALUES ('558', '867649027234596', 'rESQtswdK9wO0cxD', '1538356128', '1538356128', '1');
INSERT INTO `machine_record` VALUES ('559', '86806402350798889860086150873007824', 'rESQtswdK9wO0cxD', '1538359926', '1538359926', '1');
INSERT INTO `machine_record` VALUES ('560', '86348803165237689860032247579600506', 'rESQtswdK9wO0cxD', '1538360339', '1538360339', '1');
INSERT INTO `machine_record` VALUES ('561', '86169503365148589860022178727037418', 'rESQtswdK9wO0cxD', '1538360487', '1538360487', '1');
INSERT INTO `machine_record` VALUES ('562', 'A000007EAC26E7', 'rESQtswdK9wO0cxD', '1538362956', '1538362956', '2');
INSERT INTO `machine_record` VALUES ('563', '862231038450910', 'rESQtswdK9wO0cxD', '1538364724', '1538364724', '1');
INSERT INTO `machine_record` VALUES ('564', '869189047193678898600F0041649873500', 'rESQtswdK9wO0cxD', '1538364957', '1538364957', '1');
INSERT INTO `machine_record` VALUES ('565', '8656640333271468986003822179d349458', 'rESQtswdK9wO0cxD', '1538365947', '1538365947', '1');
INSERT INTO `machine_record` VALUES ('566', '864731032037181', 'rESQtswdK9wO0cxD', '1538365963', '1538365963', '1');
INSERT INTO `machine_record` VALUES ('567', '864304033418451898600c8231890517443', 'rESQtswdK9wO0cxD', '1538366850', '1538366850', '1');
INSERT INTO `machine_record` VALUES ('568', '8614000357207989860315745321727811', 'rESQtswdK9wO0cxD', '1538367587', '1538367587', '1');
INSERT INTO `machine_record` VALUES ('569', '866856020760110', 'rESQtswdK9wO0cxD', '1538368474', '1538368474', '1');
INSERT INTO `machine_record` VALUES ('570', '868808021477424', 'rESQtswdK9wO0cxD', '1538369324', '1538369324', '1');
INSERT INTO `machine_record` VALUES ('571', '86671403290314789860072191509953177', 'rESQtswdK9wO0cxD', '1538369807', '1538369807', '1');
INSERT INTO `machine_record` VALUES ('572', '867600022637960', 'rESQtswdK9wO0cxD', '1538370878', '1538370878', '1');
INSERT INTO `machine_record` VALUES ('573', '868681021119423', 'rESQtswdK9wO0cxD', '1538375735', '1538375735', '1');
INSERT INTO `machine_record` VALUES ('574', '86076503321996289860090231596888546', 'rESQtswdK9wO0cxD', '1538376180', '1538376180', '1');
INSERT INTO `machine_record` VALUES ('575', '86817303211917089860317747010130149', 'rESQtswdK9wO0cxD', '1538377762', '1538377762', '1');
INSERT INTO `machine_record` VALUES ('576', '861406038992498', 'rESQtswdK9wO0cxD', '1538377880', '1538377880', '1');
INSERT INTO `machine_record` VALUES ('577', '861844038641634', 'rESQtswdK9wO0cxD', '1538378347', '1538378347', '1');
INSERT INTO `machine_record` VALUES ('578', '86085803112156989860040191573405917', 'rESQtswdK9wO0cxD', '1538379035', '1538379035', '1');
INSERT INTO `machine_record` VALUES ('579', '864679040255529898600B515173A284519', 'rESQtswdK9wO0cxD', '1538380042', '1538380042', '1');
INSERT INTO `machine_record` VALUES ('580', '867148022355019', 'rESQtswdK9wO0cxD', '1538380836', '1538380836', '1');
INSERT INTO `machine_record` VALUES ('581', '864288034940128898602a51318f2005352', 'rESQtswdK9wO0cxD', '1538384726', '1538384726', '1');
INSERT INTO `machine_record` VALUES ('582', '86432503723205189860014061505437691', 'rESQtswdK9wO0cxD', '1538387368', '1538387368', '1');
INSERT INTO `machine_record` VALUES ('583', '86206403120919389860080191845671898', 'rESQtswdK9wO0cxD', '1538387679', '1538387679', '1');
INSERT INTO `machine_record` VALUES ('584', '86586703918673589860042191407156433', 'rESQtswdK9wO0cxD', '1538388382', '1538388382', '1');
INSERT INTO `machine_record` VALUES ('585', '89860029031700159113', 'rESQtswdK9wO0cxD', '1538388685', '1538388685', '1');
INSERT INTO `machine_record` VALUES ('586', '862470039770674', 'rESQtswdK9wO0cxD', '1538389553', '1538389553', '1');
INSERT INTO `machine_record` VALUES ('587', '866067034277717898600b5124485307063', 'rESQtswdK9wO0cxD', '1538391902', '1538391902', '1');
INSERT INTO `machine_record` VALUES ('588', '86841603607198289860318244540842301', 'rESQtswdK9wO0cxD', '1538393242', '1538393242', '1');
INSERT INTO `machine_record` VALUES ('589', '89860116818088228595', 'rESQtswdK9wO0cxD', '1538393585', '1538393585', '1');
INSERT INTO `machine_record` VALUES ('590', '8636400341644588986004715153a319737', 'rESQtswdK9wO0cxD', '1538396707', '1538396707', '1');
INSERT INTO `machine_record` VALUES ('591', 'A100005C57C50989861118147713242532', 'rESQtswdK9wO0cxD', '1538398575', '1538398575', '1');
INSERT INTO `machine_record` VALUES ('592', '86260903704907489860008221744ef3033', 'rESQtswdK9wO0cxD', '1538399054', '1538399054', '1');
INSERT INTO `machine_record` VALUES ('593', '861106033135107898602A0201590115140', 'rESQtswdK9wO0cxD', '1538399861', '1538399861', '1');
INSERT INTO `machine_record` VALUES ('594', '860901031864505898600031615f1534675', 'rESQtswdK9wO0cxD', '1538400254', '1538400254', '1');
INSERT INTO `machine_record` VALUES ('595', '869409020824747', 'rESQtswdK9wO0cxD', '1538400439', '1538400439', '1');
INSERT INTO `machine_record` VALUES ('596', '86202303082856789860118801011228658', 'rESQtswdK9wO0cxD', '1538401322', '1538401322', '1');
INSERT INTO `machine_record` VALUES ('597', '86861903288065889860317249105153854', 'rESQtswdK9wO0cxD', '1538406709', '1538406709', '1');
INSERT INTO `machine_record` VALUES ('598', '86970503966925889860113929190685359', 'rESQtswdK9wO0cxD', '1538407183', '1538407183', '1');
INSERT INTO `machine_record` VALUES ('599', '86736703662773089860023045496135889', 'rESQtswdK9wO0cxD', '1538410328', '1538410328', '1');
INSERT INTO `machine_record` VALUES ('600', '86350803762421889860070221602c98343', 'rESQtswdK9wO0cxD', '1538412167', '1538412167', '1');
INSERT INTO `machine_record` VALUES ('601', '865418024950543898600', 'rESQtswdK9wO0cxD', '1538415516', '1538415516', '1');
INSERT INTO `machine_record` VALUES ('602', '89860317247725025510', 'rESQtswdK9wO0cxD', '1538426079', '1538426079', '1');
INSERT INTO `machine_record` VALUES ('603', '86304803328663989860001242540997012', 'rESQtswdK9wO0cxD', '1538428379', '1538428379', '1');
INSERT INTO `machine_record` VALUES ('604', '867106023144956', 'rESQtswdK9wO0cxD', '1538433679', '1538433679', '1');
INSERT INTO `machine_record` VALUES ('605', '86390503917709889860114884031761266', 'rESQtswdK9wO0cxD', '1538435014', '1538435014', '1');
INSERT INTO `machine_record` VALUES ('606', '8628880351019278986002615155a110670', 'rESQtswdK9wO0cxD', '1538436746', '1538436746', '1');
INSERT INTO `machine_record` VALUES ('607', '868854020976974', 'rESQtswdK9wO0cxD', '1538436796', '1538436796', '1');
INSERT INTO `machine_record` VALUES ('608', 'id361d5061-1a05-4ac8-b7c4-39421a620175', 'rESQtswdK9wO0cxD', '1538436863', '1538436863', '1');
INSERT INTO `machine_record` VALUES ('609', '865649035510930898602A615173A059791', 'rESQtswdK9wO0cxD', '1538439173', '1538439173', '1');
INSERT INTO `machine_record` VALUES ('610', 'X6GNU17B12101972', 'rESQtswdK9wO0cxD', '1538439462', '1538439462', '1');
INSERT INTO `machine_record` VALUES ('611', '9900092063347989861118147461456045', 'rESQtswdK9wO0cxD', '1538441467', '1538441467', '1');
INSERT INTO `machine_record` VALUES ('612', '862085032594218898602A5151670224076', 'rESQtswdK9wO0cxD', '1538441941', '1538441941', '1');
INSERT INTO `machine_record` VALUES ('613', '869381035110703', 'rESQtswdK9wO0cxD', '1538441990', '1538441990', '1');
INSERT INTO `machine_record` VALUES ('614', '8690700250569238986008615157b366316', 'rESQtswdK9wO0cxD', '1538442423', '1538442423', '1');
INSERT INTO `machine_record` VALUES ('615', '865745030579712898600f615167a411569', 'rESQtswdK9wO0cxD', '1538442852', '1538442852', '1');
INSERT INTO `machine_record` VALUES ('616', '863199037362304', 'rESQtswdK9wO0cxD', '1538443612', '1538443612', '1');
INSERT INTO `machine_record` VALUES ('617', '866636036790107', 'rESQtswdK9wO0cxD', '1538446209', '1538446209', '1');
INSERT INTO `machine_record` VALUES ('618', '861786034372674898600e31614f0952746', 'rESQtswdK9wO0cxD', '1538446841', '1538446841', '1');
INSERT INTO `machine_record` VALUES ('619', '864141031071951898600700915f9032579', 'rESQtswdK9wO0cxD', '1538450006', '1538450006', '1');
INSERT INTO `machine_record` VALUES ('620', 'A00000701422BE89860117834022410982', 'rESQtswdK9wO0cxD', '1538450196', '1538450196', '1');
INSERT INTO `machine_record` VALUES ('621', '86898903503652989860026101850269511', 'rESQtswdK9wO0cxD', '1538450572', '1538450572', '1');
INSERT INTO `machine_record` VALUES ('622', '865363030565135', 'rESQtswdK9wO0cxD', '1538451488', '1538451488', '1');
INSERT INTO `machine_record` VALUES ('623', '9900108302164089860318240296690860', 'rESQtswdK9wO0cxD', '1538452248', '1538452248', '1');
INSERT INTO `machine_record` VALUES ('624', '86971603744905689860118553900154053', 'rESQtswdK9wO0cxD', '1538452461', '1538452461', '1');
INSERT INTO `machine_record` VALUES ('625', '86296203984885689860060178597222040', 'rESQtswdK9wO0cxD', '1538453106', '1538453106', '1');
INSERT INTO `machine_record` VALUES ('626', '868856028802672', 'rESQtswdK9wO0cxD', '1538454009', '1538454009', '1');
INSERT INTO `machine_record` VALUES ('627', '86731303020342589860075045090254246', 'rESQtswdK9wO0cxD', '1538455058', '1538455058', '1');
INSERT INTO `machine_record` VALUES ('628', '861297035985506', 'rESQtswdK9wO0cxD', '1538458417', '1538458417', '1');
INSERT INTO `machine_record` VALUES ('629', 'A00000717432AC89860318243760539043', 'rESQtswdK9wO0cxD', '1538458719', '1538458719', '1');
INSERT INTO `machine_record` VALUES ('630', '86745903211456389860117801349859514', 'rESQtswdK9wO0cxD', '1538458818', '1538458818', '1');
INSERT INTO `machine_record` VALUES ('631', '867018022485233', 'rESQtswdK9wO0cxD', '1538458902', '1538458902', '1');
INSERT INTO `machine_record` VALUES ('632', '8652650483038498986001615157A884431', 'rESQtswdK9wO0cxD', '1538460713', '1538460713', '1');
INSERT INTO `machine_record` VALUES ('633', '86317503385446089860115887008375514', 'rESQtswdK9wO0cxD', '1538460762', '1538460762', '1');
INSERT INTO `machine_record` VALUES ('634', '89860037086784617867', 'rESQtswdK9wO0cxD', '1538460848', '1538460848', '1');
INSERT INTO `machine_record` VALUES ('635', '86823803763807689860023031710576751', 'rESQtswdK9wO0cxD', '1538460948', '1538460948', '1');
INSERT INTO `machine_record` VALUES ('636', '8648530490418148986003822189B945406', 'rESQtswdK9wO0cxD', '1538461782', '1538461782', '1');
INSERT INTO `machine_record` VALUES ('637', '868433020017582', 'rESQtswdK9wO0cxD', '1538462819', '1538462819', '1');
INSERT INTO `machine_record` VALUES ('638', '867469026054923', 'rESQtswdK9wO0cxD', '1538464739', '1538464739', '4');
INSERT INTO `machine_record` VALUES ('639', 'idb9d44876-fbdb-4c98-af65-b9f1e7e46522', 'rESQtswdK9wO0cxD', '1538465744', '1538465744', '1');
INSERT INTO `machine_record` VALUES ('640', '86346903866517389860116850002442887', 'rESQtswdK9wO0cxD', '1538465824', '1538465824', '1');
INSERT INTO `machine_record` VALUES ('641', '869504031676670898602a8231890de6598', 'rESQtswdK9wO0cxD', '1538466464', '1538466464', '1');
INSERT INTO `machine_record` VALUES ('642', '869168021241711', 'rESQtswdK9wO0cxD', '1538468957', '1538468957', '1');
INSERT INTO `machine_record` VALUES ('643', '86788103070330589861118147791364950', 'rESQtswdK9wO0cxD', '1538469438', '1538469438', '1');
INSERT INTO `machine_record` VALUES ('644', '867410024822960', 'rESQtswdK9wO0cxD', '1538472446', '1538472446', '1');
INSERT INTO `machine_record` VALUES ('645', '860901037060959', 'rESQtswdK9wO0cxD', '1538472905', '1538472905', '1');
INSERT INTO `machine_record` VALUES ('646', '8655400420563168986009515145A156484', 'rESQtswdK9wO0cxD', '1538475878', '1538475878', '1');
INSERT INTO `machine_record` VALUES ('647', '866726021396448', 'rESQtswdK9wO0cxD', '1538476088', '1538476088', '1');
INSERT INTO `machine_record` VALUES ('648', '869288024473614898600f7179472387317', 'rESQtswdK9wO0cxD', '1538476139', '1538476139', '1');
INSERT INTO `machine_record` VALUES ('649', '864299031689675', 'rESQtswdK9wO0cxD', '1538476337', '1538476337', '1');
INSERT INTO `machine_record` VALUES ('650', '863180030384065', 'rESQtswdK9wO0cxD', '1538477187', '1538477187', '1');
INSERT INTO `machine_record` VALUES ('651', '8625040326908348986005815155a230403', 'rESQtswdK9wO0cxD', '1538479474', '1538479474', '1');
INSERT INTO `machine_record` VALUES ('652', '27854406175412281331057429637802631', 'rESQtswdK9wO0cxD', '1538479540', '1538479540', '1');
INSERT INTO `machine_record` VALUES ('653', '86328503204244589860048191409912713', 'rESQtswdK9wO0cxD', '1538479849', '1538479849', '1');
INSERT INTO `machine_record` VALUES ('654', '865407031223663898600681614f0234493', 'rESQtswdK9wO0cxD', '1538480111', '1538480111', '1');
INSERT INTO `machine_record` VALUES ('655', '86026703872741289860028249798987167', 'rESQtswdK9wO0cxD', '1538480460', '1538480460', '1');
INSERT INTO `machine_record` VALUES ('656', '86897802260624689860117876124208087', 'rESQtswdK9wO0cxD', '1538480582', '1538480582', '1');
INSERT INTO `machine_record` VALUES ('657', '860635036356444', 'rESQtswdK9wO0cxD', '1538482310', '1538482310', '1');
INSERT INTO `machine_record` VALUES ('658', '862606038317211898600e0121109808599', 'rESQtswdK9wO0cxD', '1538483955', '1538483955', '1');
INSERT INTO `machine_record` VALUES ('659', '867085021010643', 'rESQtswdK9wO0cxD', '1538484620', '1538484620', '1');
INSERT INTO `machine_record` VALUES ('660', '863062039381674', 'rESQtswdK9wO0cxD', '1538489251', '1538489251', '1');
INSERT INTO `machine_record` VALUES ('661', '861845031377282898600330315f2042621', 'rESQtswdK9wO0cxD', '1538489455', '1538489455', '1');
INSERT INTO `machine_record` VALUES ('662', '868681021785843', 'rESQtswdK9wO0cxD', '1538489876', '1538489876', '1');
INSERT INTO `machine_record` VALUES ('663', '860962032876039', 'rESQtswdK9wO0cxD', '1538490672', '1538490672', '1');
INSERT INTO `machine_record` VALUES ('664', '86695002837851089860118801321171721', 'rESQtswdK9wO0cxD', '1538492688', '1538492688', '1');
INSERT INTO `machine_record` VALUES ('665', '866090030546380898600900116F0088849', 'rESQtswdK9wO0cxD', '1538493276', '1538493276', '1');
INSERT INTO `machine_record` VALUES ('666', '868897021707468', 'rESQtswdK9wO0cxD', '1538500468', '1538500468', '1');
INSERT INTO `machine_record` VALUES ('667', '868092028045118898602a9261838935080', 'rESQtswdK9wO0cxD', '1538500618', '1538500618', '1');
INSERT INTO `machine_record` VALUES ('668', '861317037176985', 'rESQtswdK9wO0cxD', '1538515919', '1538515919', '1');
INSERT INTO `machine_record` VALUES ('669', '865769030020196', 'rESQtswdK9wO0cxD', '1538516154', '1538516154', '1');
INSERT INTO `machine_record` VALUES ('670', '866298028951849', 'rESQtswdK9wO0cxD', '1538522485', '1538522485', '1');
INSERT INTO `machine_record` VALUES ('671', '86397903953169589860317243172970027', 'rESQtswdK9wO0cxD', '1538522710', '1538522710', '1');
INSERT INTO `machine_record` VALUES ('672', '865633032947014', 'rESQtswdK9wO0cxD', '1538524064', '1538524064', '1');
INSERT INTO `machine_record` VALUES ('673', '86623903246820689860314907120760978', 'rESQtswdK9wO0cxD', '1538533103', '1538533103', '1');
INSERT INTO `machine_record` VALUES ('674', 'id075f7dbf-514f-4161-a546-662126b969f3', 'rESQtswdK9wO0cxD', '1538536130', '1538536130', '1');
INSERT INTO `machine_record` VALUES ('675', '866174023109305', 'rESQtswdK9wO0cxD', '1538536995', '1538536995', '1');
INSERT INTO `machine_record` VALUES ('676', 'id21c2f39f-d5df-496a-8893-36d2ca4da9eb', 'rESQtswdK9wO0cxD', '1538538491', '1538538491', '1');
INSERT INTO `machine_record` VALUES ('677', '86753502493140189860114251600053444', 'rESQtswdK9wO0cxD', '1538541161', '1538541161', '1');
INSERT INTO `machine_record` VALUES ('678', '86112703879709789860097180533073010', 'rESQtswdK9wO0cxD', '1538541496', '1538541496', '1');
INSERT INTO `machine_record` VALUES ('679', '865410018278569', 'rESQtswdK9wO0cxD', '1538544452', '1538544452', '1');
INSERT INTO `machine_record` VALUES ('680', '869285039035503898602A6101650443510', 'rESQtswdK9wO0cxD', '1538544650', '1538544650', '1');
INSERT INTO `machine_record` VALUES ('681', '869749037158591898600E0261784636022', 'rESQtswdK9wO0cxD', '1538544869', '1538544869', '1');
INSERT INTO `machine_record` VALUES ('682', '86796103753141089860081101750068842', 'rESQtswdK9wO0cxD', '1538545700', '1538545700', '1');
INSERT INTO `machine_record` VALUES ('683', '86513003745671189860117801044272906', 'rESQtswdK9wO0cxD', '1538546710', '1538546710', '1');
INSERT INTO `machine_record` VALUES ('684', 'A00000766BB8FF', 'rESQtswdK9wO0cxD', '1538549047', '1538549047', '1');
INSERT INTO `machine_record` VALUES ('685', '862700034057804', 'rESQtswdK9wO0cxD', '1538550256', '1538550256', '1');
INSERT INTO `machine_record` VALUES ('686', '864202020433329', 'rESQtswdK9wO0cxD', '1538550681', '1538550681', '2');
INSERT INTO `machine_record` VALUES ('687', '868948031625701898600091616f0154730', 'rESQtswdK9wO0cxD', '1538552952', '1538552952', '1');
INSERT INTO `machine_record` VALUES ('688', 'id9ab4874a-8070-4365-91d5-024cbe6b1eda', 'rESQtswdK9wO0cxD', '1538553181', '1538553181', '1');
INSERT INTO `machine_record` VALUES ('689', '866446032230839898602a31614f1759578', 'rESQtswdK9wO0cxD', '1538554306', '1538554306', '1');
INSERT INTO `machine_record` VALUES ('690', '86073403548099889860040191644159732', 'rESQtswdK9wO0cxD', '1538557951', '1538557951', '1');
INSERT INTO `machine_record` VALUES ('691', '869654020632760', 'rESQtswdK9wO0cxD', '1538558719', '1538558719', '1');
INSERT INTO `machine_record` VALUES ('692', '86026703614440489860034061895069689', 'rESQtswdK9wO0cxD', '1538558750', '1538558750', '1');
INSERT INTO `machine_record` VALUES ('693', '86174303509453489860043191743881964', 'rESQtswdK9wO0cxD', '1538558819', '1538558819', '1');
INSERT INTO `machine_record` VALUES ('694', '864242039903292', 'rESQtswdK9wO0cxD', '1538559277', '1538559277', '1');
INSERT INTO `machine_record` VALUES ('695', '861569030280293', 'rESQtswdK9wO0cxD', '1538560215', '1538560215', '1');
INSERT INTO `machine_record` VALUES ('696', '86558003686764189249020149436364713', 'rESQtswdK9wO0cxD', '1538561029', '1538561029', '1');
INSERT INTO `machine_record` VALUES ('697', '86882203980717589860014061885192757', 'rESQtswdK9wO0cxD', '1538561325', '1538561325', '1');
INSERT INTO `machine_record` VALUES ('698', '86946603683217189860117801780284305', 'rESQtswdK9wO0cxD', '1538564503', '1538564503', '1');
INSERT INTO `machine_record` VALUES ('699', '865433032984343898600f1231596e97165', 'rESQtswdK9wO0cxD', '1538564557', '1538564557', '1');
INSERT INTO `machine_record` VALUES ('700', '863641034918729', 'rESQtswdK9wO0cxD', '1538564661', '1538564661', '1');
INSERT INTO `machine_record` VALUES ('701', '869233038417579898602a4083655797779', 'rESQtswdK9wO0cxD', '1538564720', '1538564720', '1');
INSERT INTO `machine_record` VALUES ('702', '86894703830656289860118801539449604', 'rESQtswdK9wO0cxD', '1538565632', '1538565632', '1');
INSERT INTO `machine_record` VALUES ('703', '860978033367158', 'rESQtswdK9wO0cxD', '1538565949', '1538565949', '1');
INSERT INTO `machine_record` VALUES ('704', '86739803045640489860040191784863982', 'rESQtswdK9wO0cxD', '1538566106', '1538566106', '1');
INSERT INTO `machine_record` VALUES ('705', '861054030013762898600502318505b2272', 'rESQtswdK9wO0cxD', '1538567497', '1538567497', '1');
INSERT INTO `machine_record` VALUES ('706', '863125032753155', 'rESQtswdK9wO0cxD', '1538567885', '1538567885', '1');
INSERT INTO `machine_record` VALUES ('707', '868515031578873898602a3031820045042', 'rESQtswdK9wO0cxD', '1538569613', '1538569613', '1');
INSERT INTO `machine_record` VALUES ('708', '867415038321354898600C8211840072156', 'rESQtswdK9wO0cxD', '1538570312', '1538570312', '1');
INSERT INTO `machine_record` VALUES ('709', '86296403194875989860316945159164314', 'rESQtswdK9wO0cxD', '1538572759', '1538572759', '1');
INSERT INTO `machine_record` VALUES ('710', '865363034782777898602D0231891369335', 'rESQtswdK9wO0cxD', '1538576787', '1538576787', '1');
INSERT INTO `machine_record` VALUES ('711', '86437104924045089860117801448299562', 'rESQtswdK9wO0cxD', '1538577098', '1538577098', '1');
INSERT INTO `machine_record` VALUES ('712', '86882602806985389860022240472901715', 'rESQtswdK9wO0cxD', '1538577565', '1538577565', '1');
INSERT INTO `machine_record` VALUES ('713', '86829903522728889860117817068118213', 'rESQtswdK9wO0cxD', '1538577659', '1538577659', '1');
INSERT INTO `machine_record` VALUES ('714', '86441303254763089860099271479649637', 'rESQtswdK9wO0cxD', '1538580049', '1538580049', '1');
INSERT INTO `machine_record` VALUES ('715', '868349027169244', 'rESQtswdK9wO0cxD', '1538581961', '1538581961', '1');
INSERT INTO `machine_record` VALUES ('716', '867769039990009898600401618f0155270', 'rESQtswdK9wO0cxD', '1538582428', '1538582428', '1');
INSERT INTO `machine_record` VALUES ('717', '86535403421787289860115819010469522', 'rESQtswdK9wO0cxD', '1538582686', '1538582686', '1');
INSERT INTO `machine_record` VALUES ('718', '869966034295123', 'rESQtswdK9wO0cxD', '1538588625', '1538588625', '1');
INSERT INTO `machine_record` VALUES ('719', '86101503815553389860115841024818957', 'rESQtswdK9wO0cxD', '1538595972', '1538595972', '1');
INSERT INTO `machine_record` VALUES ('720', '861006034498316', 'rESQtswdK9wO0cxD', '1538596480', '1538596480', '1');
INSERT INTO `machine_record` VALUES ('721', '86417703630299189860116836052914032', 'rESQtswdK9wO0cxD', '1538606983', '1538606983', '1');
INSERT INTO `machine_record` VALUES ('722', '86417703389795189860117897052238235', 'rESQtswdK9wO0cxD', '1538608283', '1538608283', '1');
INSERT INTO `machine_record` VALUES ('723', '866123036190331898600f12315963f4476', 'rESQtswdK9wO0cxD', '1538611550', '1538611550', '1');
INSERT INTO `machine_record` VALUES ('724', '863291035520197898600b515159a734016', 'rESQtswdK9wO0cxD', '1538612047', '1538612047', '1');
INSERT INTO `machine_record` VALUES ('725', '866228032591679898602D51317F1135316', 'rESQtswdK9wO0cxD', '1538612312', '1538612312', '1');
INSERT INTO `machine_record` VALUES ('726', '86592103552023989860118801364839325', 'rESQtswdK9wO0cxD', '1538613069', '1538613069', '1');
INSERT INTO `machine_record` VALUES ('727', '862819034666370', 'rESQtswdK9wO0cxD', '1538617895', '1538617895', '1');
INSERT INTO `machine_record` VALUES ('728', '867572047708276898602C01618F0007640', 'rESQtswdK9wO0cxD', '1538618363', '1538618363', '1');
INSERT INTO `machine_record` VALUES ('729', '86060404682945189860118801187118600', 'rESQtswdK9wO0cxD', '1538620772', '1538620772', '2');
INSERT INTO `machine_record` VALUES ('730', '86075003200407889860037181303504893', 'rESQtswdK9wO0cxD', '1538623399', '1538623399', '1');
INSERT INTO `machine_record` VALUES ('731', '86653603445952589860004061355999952', 'rESQtswdK9wO0cxD', '1538623513', '1538623513', '1');
INSERT INTO `machine_record` VALUES ('732', '864230039502313898602D31616F0108826', 'rESQtswdK9wO0cxD', '1538624306', '1538624306', '1');
INSERT INTO `machine_record` VALUES ('733', '9900085901589889860317243101010366', 'rESQtswdK9wO0cxD', '1538625852', '1538625852', '1');
INSERT INTO `machine_record` VALUES ('734', '86905502014530089860117831013799571', 'rESQtswdK9wO0cxD', '1538626039', '1538626039', '1');
INSERT INTO `machine_record` VALUES ('735', 'id5acc495e-db72-4d64-afec-9913cad22eca', 'rESQtswdK9wO0cxD', '1538627200', '1538627200', '1');
INSERT INTO `machine_record` VALUES ('736', '865905033715263898600f2123736269552', 'rESQtswdK9wO0cxD', '1538628584', '1538628584', '1');
INSERT INTO `machine_record` VALUES ('737', '86123403675853389860031071645975667', 'rESQtswdK9wO0cxD', '1538629112', '1538629112', '1');
INSERT INTO `machine_record` VALUES ('738', '86594402816332089860318243164728317', 'rESQtswdK9wO0cxD', '1538630428', '1538630428', '1');
INSERT INTO `machine_record` VALUES ('739', '86765602162207289860117876012098525', 'rESQtswdK9wO0cxD', '1538630956', '1538630956', '1');
INSERT INTO `machine_record` VALUES ('740', '9900118608842889860118903850035093', 'rESQtswdK9wO0cxD', '1538632786', '1538632786', '1');
INSERT INTO `machine_record` VALUES ('741', '86444403862924789860115026700015959', 'rESQtswdK9wO0cxD', '1538634663', '1538634663', '1');
INSERT INTO `machine_record` VALUES ('742', '868044036452299898600D1141707037370', 'rESQtswdK9wO0cxD', '1538635505', '1538635505', '1');
INSERT INTO `machine_record` VALUES ('743', '861751034725370898600c31615f0061934', 'rESQtswdK9wO0cxD', '1538636342', '1538636342', '1');
INSERT INTO `machine_record` VALUES ('744', '86746903597921989860081191745292406', 'rESQtswdK9wO0cxD', '1538642019', '1538642019', '1');
INSERT INTO `machine_record` VALUES ('745', '869804028169642', 'rESQtswdK9wO0cxD', '1538647119', '1538647119', '1');
INSERT INTO `machine_record` VALUES ('746', '86872303895618989860013031610175663', 'rESQtswdK9wO0cxD', '1538654776', '1538654776', '1');
INSERT INTO `machine_record` VALUES ('747', '867676030764335', 'rESQtswdK9wO0cxD', '1538659633', '1538659633', '1');
INSERT INTO `machine_record` VALUES ('748', '869310031742516898602D0201590312588', 'rESQtswdK9wO0cxD', '1538667155', '1538667155', '1');
INSERT INTO `machine_record` VALUES ('749', '869677037429060898600F31617F2270752', 'rESQtswdK9wO0cxD', '1538672599', '1538672599', '1');
INSERT INTO `machine_record` VALUES ('750', '86804603503097689860317244716576437', 'rESQtswdK9wO0cxD', '1538675647', '1538675647', '1');
INSERT INTO `machine_record` VALUES ('751', '867951036351100898600c415168a318006', 'rESQtswdK9wO0cxD', '1538685942', '1538685942', '1');
INSERT INTO `machine_record` VALUES ('752', '86657203668895189860116883018485236', 'rESQtswdK9wO0cxD', '1538692673', '1538692673', '1');
INSERT INTO `machine_record` VALUES ('753', '86669903296985189860115871015731604', 'rESQtswdK9wO0cxD', '1538693395', '1538693395', '1');
INSERT INTO `machine_record` VALUES ('754', 'id1d62cf79-48e7-4788-9095-23aa413812a3', 'rESQtswdK9wO0cxD', '1538696130', '1538696130', '1');
INSERT INTO `machine_record` VALUES ('755', '869336028580411898600f8221808312354', 'rESQtswdK9wO0cxD', '1538700237', '1538700237', '1');
INSERT INTO `machine_record` VALUES ('756', '86619202278159389860315147950891218', 'rESQtswdK9wO0cxD', '1538703619', '1538703619', '1');
INSERT INTO `machine_record` VALUES ('757', '8628880309313858986004015179a110189', 'rESQtswdK9wO0cxD', '1538704174', '1538704174', '1');
INSERT INTO `machine_record` VALUES ('758', '86850202162497489860117885006574391', 'rESQtswdK9wO0cxD', '1538705240', '1538705240', '1');
INSERT INTO `machine_record` VALUES ('759', '86902003443063589860028111607006670', 'rESQtswdK9wO0cxD', '1538707075', '1538707075', '1');
INSERT INTO `machine_record` VALUES ('760', 'A0000085C5F92A89860318847570505802', 'rESQtswdK9wO0cxD', '1538707184', '1538707184', '1');
INSERT INTO `machine_record` VALUES ('761', '86224403178309689860114818021865992', 'rESQtswdK9wO0cxD', '1538708861', '1538708861', '1');
INSERT INTO `machine_record` VALUES ('762', '86650003814091189860011244770659452', 'rESQtswdK9wO0cxD', '1538710327', '1538710327', '1');
INSERT INTO `machine_record` VALUES ('763', '861748031565312', 'rESQtswdK9wO0cxD', '1538720722', '1538720722', '1');
INSERT INTO `machine_record` VALUES ('764', '86240004377789489860070111557005346', 'rESQtswdK9wO0cxD', '1538725184', '1538725184', '1');
INSERT INTO `machine_record` VALUES ('765', '861695032993268898600F2221478D14042', 'rESQtswdK9wO0cxD', '1538726746', '1538726746', '1');
INSERT INTO `machine_record` VALUES ('766', '898600C9141637225034', 'rESQtswdK9wO0cxD', '1538727597', '1538727597', '1');
INSERT INTO `machine_record` VALUES ('767', '86617403553683489860118801099748924', 'rESQtswdK9wO0cxD', '1538728590', '1538728590', '1');
INSERT INTO `machine_record` VALUES ('768', '86148803499672389860026101650289649', 'rESQtswdK9wO0cxD', '1538732880', '1538732880', '1');
INSERT INTO `machine_record` VALUES ('769', '86119203354926589860117801651690069', 'rESQtswdK9wO0cxD', '1538734593', '1538734593', '1');
INSERT INTO `machine_record` VALUES ('770', '868436022143652', 'rESQtswdK9wO0cxD', '1538735295', '1538735295', '1');
INSERT INTO `machine_record` VALUES ('771', '86175503344723389860318740234289931', 'rESQtswdK9wO0cxD', '1538735937', '1538735937', '1');
INSERT INTO `machine_record` VALUES ('772', '865552032591483898602a5111451109856', 'rESQtswdK9wO0cxD', '1538736491', '1538736491', '1');
INSERT INTO `machine_record` VALUES ('773', '86980202446691389860038141522002860', 'rESQtswdK9wO0cxD', '1538742118', '1538742118', '1');
INSERT INTO `machine_record` VALUES ('774', '86077903445935289860041191407402183', 'rESQtswdK9wO0cxD', '1538743109', '1538743109', '1');
INSERT INTO `machine_record` VALUES ('775', '86085803381590389860117801608383198', 'rESQtswdK9wO0cxD', '1538745912', '1538745912', '1');
INSERT INTO `machine_record` VALUES ('776', '86826302006548389860050231850569486', 'rESQtswdK9wO0cxD', '1538746076', '1538746076', '1');
INSERT INTO `machine_record` VALUES ('777', '008796760824851', 'rESQtswdK9wO0cxD', '1538746934', '1538746934', '1');
INSERT INTO `machine_record` VALUES ('778', '862157031656163', 'rESQtswdK9wO0cxD', '1538748622', '1538748622', '1');
INSERT INTO `machine_record` VALUES ('779', '866177021948772', 'rESQtswdK9wO0cxD', '1538751820', '1538751820', '1');
INSERT INTO `machine_record` VALUES ('780', '86611703017073789860317745103855747', 'rESQtswdK9wO0cxD', '1538754519', '1538754519', '1');
INSERT INTO `machine_record` VALUES ('781', '860708037882666', 'rESQtswdK9wO0cxD', '1538761549', '1538761549', '1');
INSERT INTO `machine_record` VALUES ('782', '861015034040721898600F4261579286312', 'rESQtswdK9wO0cxD', '1538775640', '1538775640', '1');
INSERT INTO `machine_record` VALUES ('783', '86766302329598089860008248693799677', 'rESQtswdK9wO0cxD', '1538776493', '1538776493', '1');
INSERT INTO `machine_record` VALUES ('784', '86925903632995389860318140288045489', 'rESQtswdK9wO0cxD', '1538776596', '1538776596', '1');
INSERT INTO `machine_record` VALUES ('785', '86539403483475589860115817078856564', 'rESQtswdK9wO0cxD', '1538777605', '1538777605', '1');
INSERT INTO `machine_record` VALUES ('786', '86974104337384389860316247463131257', 'rESQtswdK9wO0cxD', '1538781357', '1538781357', '1');
INSERT INTO `machine_record` VALUES ('787', '868842027289533898600c9261888185086', 'rESQtswdK9wO0cxD', '1538792031', '1538792031', '1');
INSERT INTO `machine_record` VALUES ('788', '357073053090953', 'rESQtswdK9wO0cxD', '1538792498', '1538792498', '1');
INSERT INTO `machine_record` VALUES ('789', '9900106778300789860318245171092520', 'rESQtswdK9wO0cxD', '1538792802', '1538792802', '1');
INSERT INTO `machine_record` VALUES ('790', '86420503846780989860114817013027207', 'rESQtswdK9wO0cxD', '1538793864', '1538793864', '1');
INSERT INTO `machine_record` VALUES ('791', '86996403153443889860118801085593938', 'rESQtswdK9wO0cxD', '1538794039', '1538794039', '1');
INSERT INTO `machine_record` VALUES ('792', '868380036720156898607A015184A381455', 'rESQtswdK9wO0cxD', '1538795066', '1538795066', '1');
INSERT INTO `machine_record` VALUES ('793', '862859044554992898600701618f1059671', 'rESQtswdK9wO0cxD', '1538796491', '1538796491', '1');
INSERT INTO `machine_record` VALUES ('794', '86873703680367289860028242696911497', 'rESQtswdK9wO0cxD', '1538798986', '1538798986', '1');
INSERT INTO `machine_record` VALUES ('795', '86343703316221589860318249950130618', 'rESQtswdK9wO0cxD', '1538808180', '1538808180', '1');
INSERT INTO `machine_record` VALUES ('796', '866014031722410898600F5151790005079', 'rESQtswdK9wO0cxD', '1538808194', '1538808194', '1');
INSERT INTO `machine_record` VALUES ('797', '86269903221067289861118147922573768', 'rESQtswdK9wO0cxD', '1538810336', '1538810336', '1');
INSERT INTO `machine_record` VALUES ('798', '864311030411884', 'rESQtswdK9wO0cxD', '1538810603', '1538810603', '1');
INSERT INTO `machine_record` VALUES ('799', '863920046276056898602a9261785994701', 'rESQtswdK9wO0cxD', '1538811039', '1538811039', '1');
INSERT INTO `machine_record` VALUES ('800', 'idca198005-5db6-4633-8d15-d1945fd76fb3', 'rESQtswdK9wO0cxD', '1538811732', '1538811732', '1');
INSERT INTO `machine_record` VALUES ('801', 'A00000645540D489860317049380863320', 'rESQtswdK9wO0cxD', '1538815390', '1538815390', '1');
INSERT INTO `machine_record` VALUES ('802', '86522303920149889860066031440166670', 'rESQtswdK9wO0cxD', '1538815984', '1538815984', '1');
INSERT INTO `machine_record` VALUES ('803', '869703030441074', 'rESQtswdK9wO0cxD', '1538817611', '1538817611', '1');
INSERT INTO `machine_record` VALUES ('804', '867534022413488898602a5111587012275', 'rESQtswdK9wO0cxD', '1538817740', '1538817740', '1');
INSERT INTO `machine_record` VALUES ('805', '862044034170675', 'rESQtswdK9wO0cxD', '1538822509', '1538822509', '1');
INSERT INTO `machine_record` VALUES ('806', '86154303836877289860116890013788431', 'rESQtswdK9wO0cxD', '1538828366', '1538828366', '1');
INSERT INTO `machine_record` VALUES ('807', '865473026087034', 'rESQtswdK9wO0cxD', '1538836402', '1538836402', '1');
INSERT INTO `machine_record` VALUES ('808', '89860022244472934335', 'rESQtswdK9wO0cxD', '1538838381', '1538838381', '1');
INSERT INTO `machine_record` VALUES ('809', '86872203642580989861118143700091875', 'rESQtswdK9wO0cxD', '1538841031', '1538841031', '1');
INSERT INTO `machine_record` VALUES ('810', '86931403239177889860075031820005882', 'rESQtswdK9wO0cxD', '1538841754', '1538841754', '1');
INSERT INTO `machine_record` VALUES ('811', '86135303162191689860042191744724045', 'rESQtswdK9wO0cxD', '1538842979', '1538842979', '1');
INSERT INTO `machine_record` VALUES ('812', '862023032377870', 'rESQtswdK9wO0cxD', '1538843452', '1538843452', '1');
INSERT INTO `machine_record` VALUES ('813', '86325203518100089860114840104948875', 'rESQtswdK9wO0cxD', '1538872633', '1538872633', '1');
INSERT INTO `machine_record` VALUES ('814', '86175203360215689860068221543fb3119', 'rESQtswdK9wO0cxD', '1538875921', '1538875921', '1');
INSERT INTO `machine_record` VALUES ('815', '22222222222222889860065031530014018', 'rESQtswdK9wO0cxD', '1538876469', '1538876469', '1');
INSERT INTO `machine_record` VALUES ('816', '86429303502145689860118802171193567', 'rESQtswdK9wO0cxD', '1538877575', '1538877575', '1');
INSERT INTO `machine_record` VALUES ('817', '866724021840069898600b5151670042251', 'rESQtswdK9wO0cxD', '1538879976', '1538879976', '1');
INSERT INTO `machine_record` VALUES ('818', '864102032738030898600E515167A008857', 'rESQtswdK9wO0cxD', '1538881378', '1538881378', '1');
INSERT INTO `machine_record` VALUES ('819', '863046031153074898600801615f0172353', 'rESQtswdK9wO0cxD', '1538881833', '1538881833', '1');
INSERT INTO `machine_record` VALUES ('820', '86583003556219289860317245931625016', 'rESQtswdK9wO0cxD', '1538882003', '1538882003', '1');
INSERT INTO `machine_record` VALUES ('821', '86817303152610289860118801027047332', 'rESQtswdK9wO0cxD', '1538885052', '1538885052', '1');
INSERT INTO `machine_record` VALUES ('822', '862138032085909', 'rESQtswdK9wO0cxD', '1538886342', '1538886342', '1');
INSERT INTO `machine_record` VALUES ('823', '861234032460373', 'rESQtswdK9wO0cxD', '1538888080', '1538888080', '1');
INSERT INTO `machine_record` VALUES ('824', '35852008181337589860316040254875442', 'rESQtswdK9wO0cxD', '1538889536', '1538889536', '1');
INSERT INTO `machine_record` VALUES ('825', '866798024020309', 'rESQtswdK9wO0cxD', '1538891398', '1538891398', '1');
INSERT INTO `machine_record` VALUES ('826', '866579033176732898600f31618f0636911', 'rESQtswdK9wO0cxD', '1538891514', '1538891514', '1');
INSERT INTO `machine_record` VALUES ('827', '86804603898393289860034082775689132', 'rESQtswdK9wO0cxD', '1538891716', '1538891716', '1');
INSERT INTO `machine_record` VALUES ('828', '86907203533013289860003031710176009', 'rESQtswdK9wO0cxD', '1538893794', '1538893794', '1');
INSERT INTO `machine_record` VALUES ('829', 'a00000595cf20489860317245931968986', 'rESQtswdK9wO0cxD', '1538894113', '1538894113', '1');
INSERT INTO `machine_record` VALUES ('830', '86203103395653589860117834022770724', 'rESQtswdK9wO0cxD', '1538895488', '1538895488', '2');
INSERT INTO `machine_record` VALUES ('831', '86601103904111689860077101750003838', 'rESQtswdK9wO0cxD', '1538898817', '1538898817', '1');
INSERT INTO `machine_record` VALUES ('832', '864088035802198898602C31613FE004345', 'rESQtswdK9wO0cxD', '1538899589', '1538899589', '1');
INSERT INTO `machine_record` VALUES ('833', '86768403484318889860007177622099675', 'rESQtswdK9wO0cxD', '1538899855', '1538899855', '1');
INSERT INTO `machine_record` VALUES ('834', '86271903408438689860318047693276387', 'rESQtswdK9wO0cxD', '1538900265', '1538900265', '1');
INSERT INTO `machine_record` VALUES ('835', '868226032308464', 'rESQtswdK9wO0cxD', '1538900347', '1538900347', '1');
INSERT INTO `machine_record` VALUES ('836', '864765030842507', 'rESQtswdK9wO0cxD', '1538900983', '1538900983', '1');
INSERT INTO `machine_record` VALUES ('837', '861077034795019', 'rESQtswdK9wO0cxD', '1538901225', '1538901225', '1');
INSERT INTO `machine_record` VALUES ('838', '86382503135375489860318248715167063', 'rESQtswdK9wO0cxD', '1538906122', '1538906122', '1');
INSERT INTO `machine_record` VALUES ('839', '865805031999440898600e515147a320547', 'rESQtswdK9wO0cxD', '1538913395', '1538913395', '1');
INSERT INTO `machine_record` VALUES ('840', 'A10000391097AD', 'rESQtswdK9wO0cxD', '1538915994', '1538915994', '1');
INSERT INTO `machine_record` VALUES ('841', '86149803110911389860114884025877870', 'rESQtswdK9wO0cxD', '1538917067', '1538917067', '1');
INSERT INTO `machine_record` VALUES ('842', '865741045322958898600A7081836890608', 'rESQtswdK9wO0cxD', '1538917849', '1538917849', '1');
INSERT INTO `machine_record` VALUES ('843', '3559070726030848982051508108989535', 'rESQtswdK9wO0cxD', '1538919908', '1538919908', '1');
INSERT INTO `machine_record` VALUES ('844', '867252031878076898600b5151490059110', 'rESQtswdK9wO0cxD', '1538923339', '1538923339', '1');
INSERT INTO `machine_record` VALUES ('845', '866403030362528898600', 'rESQtswdK9wO0cxD', '1538923833', '1538923833', '1');
INSERT INTO `machine_record` VALUES ('846', '861113033879122', 'rESQtswdK9wO0cxD', '1538924831', '1538924831', '2');
INSERT INTO `machine_record` VALUES ('847', '865926031378219', 'rESQtswdK9wO0cxD', '1538931688', '1538931688', '1');
INSERT INTO `machine_record` VALUES ('848', '8675620397729278938001760403320170', 'rESQtswdK9wO0cxD', '1538938970', '1538938970', '2');
INSERT INTO `machine_record` VALUES ('849', '862244039127999', 'rESQtswdK9wO0cxD', '1538949220', '1538949220', '1');
INSERT INTO `machine_record` VALUES ('850', '868938036474890898600391618f0057775', 'rESQtswdK9wO0cxD', '1538950456', '1538950456', '1');
INSERT INTO `machine_record` VALUES ('851', '86751703127436389860117801619072368', 'rESQtswdK9wO0cxD', '1538966123', '1538966123', '1');
INSERT INTO `machine_record` VALUES ('852', '866844033238993898600f9201490104071', 'rESQtswdK9wO0cxD', '1538970147', '1538970147', '1');
INSERT INTO `machine_record` VALUES ('853', '008796760243086', 'rESQtswdK9wO0cxD', '1538971893', '1538971893', '1');
INSERT INTO `machine_record` VALUES ('854', '86373002086823689860024088806787393', 'rESQtswdK9wO0cxD', '1538979029', '1538979029', '1');
INSERT INTO `machine_record` VALUES ('855', '86958303124037289860117801606014647', 'rESQtswdK9wO0cxD', '1538986039', '1538986039', '1');
INSERT INTO `machine_record` VALUES ('856', '86576703006979189860318244680168624', 'rESQtswdK9wO0cxD', '1538986538', '1538986538', '2');
INSERT INTO `machine_record` VALUES ('857', '865623034363930', 'rESQtswdK9wO0cxD', '1538992993', '1538992993', '1');
INSERT INTO `machine_record` VALUES ('858', '86416203166446289860021191797116134', 'rESQtswdK9wO0cxD', '1538994903', '1538994903', '1');
INSERT INTO `machine_record` VALUES ('859', '868264027638033', 'rESQtswdK9wO0cxD', '1538996233', '1538996233', '1');
INSERT INTO `machine_record` VALUES ('860', '86161503416645789860117565300157032', 'rESQtswdK9wO0cxD', '1538996891', '1538996891', '1');
INSERT INTO `machine_record` VALUES ('861', '860635030239844', 'rESQtswdK9wO0cxD', '1538997546', '1538997546', '1');
INSERT INTO `machine_record` VALUES ('862', '35472807153633689860090317884907881', 'rESQtswdK9wO0cxD', '1538998516', '1538998516', '1');
INSERT INTO `machine_record` VALUES ('863', '862468033956091898600231617f3894797', 'rESQtswdK9wO0cxD', '1538999972', '1538999972', '1');
INSERT INTO `machine_record` VALUES ('864', '863181034031447898600E2101450039215', 'rESQtswdK9wO0cxD', '1539009724', '1539009724', '1');
INSERT INTO `machine_record` VALUES ('865', '86714003207377389860084061895033522', 'rESQtswdK9wO0cxD', '1539010608', '1539010608', '1');
INSERT INTO `machine_record` VALUES ('866', '86455303701385489860080191489004881', 'rESQtswdK9wO0cxD', '1539013595', '1539013595', '1');
INSERT INTO `machine_record` VALUES ('867', '862784035708516898600b9281702348598', 'rESQtswdK9wO0cxD', '1539015234', '1539015234', '1');
INSERT INTO `machine_record` VALUES ('868', '865400036792469', 'rESQtswdK9wO0cxD', '1539015523', '1539015523', '1');
INSERT INTO `machine_record` VALUES ('869', '86801403096063989860117801605815010', 'rESQtswdK9wO0cxD', '1539018788', '1539018788', '1');
INSERT INTO `machine_record` VALUES ('870', '86661703165901889860042191673466939', 'rESQtswdK9wO0cxD', '1539036780', '1539036780', '1');
INSERT INTO `machine_record` VALUES ('871', '8670850393048389860316849720290220', 'rESQtswdK9wO0cxD', '1539052013', '1539052013', '1');
INSERT INTO `machine_record` VALUES ('872', '867961028078025', 'rESQtswdK9wO0cxD', '1539066529', '1539066529', '1');
INSERT INTO `machine_record` VALUES ('873', '865675031834685898602a5111555080761', 'rESQtswdK9wO0cxD', '1539073861', '1539073861', '1');
INSERT INTO `machine_record` VALUES ('874', '860258030058930', 'rESQtswdK9wO0cxD', '1539077128', '1539077128', '1');
INSERT INTO `machine_record` VALUES ('875', '86672202222419289860013045891876949', 'rESQtswdK9wO0cxD', '1539083638', '1539083638', '1');
INSERT INTO `machine_record` VALUES ('876', '8665150301820918986004715154a281789', 'rESQtswdK9wO0cxD', '1539084263', '1539084263', '1');
INSERT INTO `machine_record` VALUES ('877', '9900107009148089860317747551167740', 'rESQtswdK9wO0cxD', '1539084388', '1539084388', '1');
INSERT INTO `machine_record` VALUES ('878', '86249303501190189860314105712086239', 'rESQtswdK9wO0cxD', '1539084997', '1539084997', '1');
INSERT INTO `machine_record` VALUES ('879', '867227033989501', 'rESQtswdK9wO0cxD', '1539086176', '1539086176', '1');
INSERT INTO `machine_record` VALUES ('880', 'a0000055b4af6689860318948520696285', 'rESQtswdK9wO0cxD', '1539087504', '1539087504', '1');
INSERT INTO `machine_record` VALUES ('881', '86442703834817389860022317773594905', 'rESQtswdK9wO0cxD', '1539088795', '1539088795', '1');
INSERT INTO `machine_record` VALUES ('882', '867660021761211', 'rESQtswdK9wO0cxD', '1539091399', '1539091399', '1');
INSERT INTO `machine_record` VALUES ('883', '86423903670065589860117801479099857', 'rESQtswdK9wO0cxD', '1539092283', '1539092283', '1');
INSERT INTO `machine_record` VALUES ('884', '86301303262556789860115818027871845', 'rESQtswdK9wO0cxD', '1539092424', '1539092424', '1');
INSERT INTO `machine_record` VALUES ('885', '353486789293747', 'rESQtswdK9wO0cxD', '1539092512', '1539092512', '1');
INSERT INTO `machine_record` VALUES ('886', '869803026563442898600C8242795183747', 'rESQtswdK9wO0cxD', '1539094183', '1539094183', '1');
INSERT INTO `machine_record` VALUES ('887', 'A0000087FD1C7B89861118143125278230', 'rESQtswdK9wO0cxD', '1539095610', '1539095610', '1');
INSERT INTO `machine_record` VALUES ('888', 'A1000042245481', 'rESQtswdK9wO0cxD', '1539096699', '1539096699', '2');
INSERT INTO `machine_record` VALUES ('889', '863808031347752898600f5101650600314', 'rESQtswdK9wO0cxD', '1539096819', '1539096819', '1');
INSERT INTO `machine_record` VALUES ('890', '865968033262751898600470614A5551602', 'rESQtswdK9wO0cxD', '1539104089', '1539104089', '1');
INSERT INTO `machine_record` VALUES ('891', 'A0000060F13BBB89860315845370497140', 'rESQtswdK9wO0cxD', '1539123955', '1539123955', '1');
INSERT INTO `machine_record` VALUES ('892', '86397203138881889860082191745294995', 'rESQtswdK9wO0cxD', '1539140742', '1539140742', '1');
INSERT INTO `machine_record` VALUES ('893', '868380032160159898600251314F1051790', 'rESQtswdK9wO0cxD', '1539141526', '1539141526', '1');
INSERT INTO `machine_record` VALUES ('894', '86433703892243289860070211490341903', 'rESQtswdK9wO0cxD', '1539142132', '1539142132', '1');
INSERT INTO `machine_record` VALUES ('895', '35584806780404089860058031400342409', 'rESQtswdK9wO0cxD', '1539143258', '1539143258', '1');
INSERT INTO `machine_record` VALUES ('896', '35596706151088089860115211300015449', 'rESQtswdK9wO0cxD', '1539143693', '1539143693', '1');
INSERT INTO `machine_record` VALUES ('897', '86911503266522289860317744111933471', 'rESQtswdK9wO0cxD', '1539145790', '1539145790', '1');
INSERT INTO `machine_record` VALUES ('898', 'id9fad2602-dbba-49b4-9f59-c8dafe60b589', 'rESQtswdK9wO0cxD', '1539147576', '1539147576', '1');
INSERT INTO `machine_record` VALUES ('899', 'KKUNU17816100640', 'rESQtswdK9wO0cxD', '1539147901', '1539147901', '1');
INSERT INTO `machine_record` VALUES ('900', '863679045841860898602A231AD73420047', 'rESQtswdK9wO0cxD', '1539150017', '1539150017', '1');
INSERT INTO `machine_record` VALUES ('901', '86824503033348089860317747355286456', 'rESQtswdK9wO0cxD', '1539156010', '1539156010', '1');
INSERT INTO `machine_record` VALUES ('902', '86956002137196189860094061505437112', 'rESQtswdK9wO0cxD', '1539160161', '1539160161', '1');
INSERT INTO `machine_record` VALUES ('903', '86422903860130889860117097000184686', 'rESQtswdK9wO0cxD', '1539160529', '1539160529', '1');
INSERT INTO `machine_record` VALUES ('904', '867137030494217898602C7188503315420', 'rESQtswdK9wO0cxD', '1539161631', '1539161631', '1');
INSERT INTO `machine_record` VALUES ('905', '861077030422550898600C21615F0829694', 'rESQtswdK9wO0cxD', '1539168154', '1539168154', '1');
INSERT INTO `machine_record` VALUES ('906', '86888403728385889860318049321674082', 'rESQtswdK9wO0cxD', '1539171128', '1539171128', '1');
INSERT INTO `machine_record` VALUES ('907', '86355804562766189860315240215415665', 'rESQtswdK9wO0cxD', '1539174614', '1539174614', '1');
INSERT INTO `machine_record` VALUES ('908', '86564502072127689860114810046589897', 'rESQtswdK9wO0cxD', '1539177104', '1539177104', '1');
INSERT INTO `machine_record` VALUES ('909', '359786054982021', 'rESQtswdK9wO0cxD', '1539178276', '1539178276', '1');
INSERT INTO `machine_record` VALUES ('910', '86813903206533389860030031500782115', 'rESQtswdK9wO0cxD', '1539178572', '1539178572', '1');
INSERT INTO `machine_record` VALUES ('911', '8676860300962389861118143141740148', 'rESQtswdK9wO0cxD', '1539184603', '1539184603', '1');
INSERT INTO `machine_record` VALUES ('912', '866294032864367898600A5221805902660', 'rESQtswdK9wO0cxD', '1539186281', '1539186281', '1');
INSERT INTO `machine_record` VALUES ('913', '86967703915362789860318249138286233', 'rESQtswdK9wO0cxD', '1539203995', '1539203995', '1');
INSERT INTO `machine_record` VALUES ('914', '865836033919185898600071616F0243082', 'rESQtswdK9wO0cxD', '1539206221', '1539206221', '1');
INSERT INTO `machine_record` VALUES ('915', '86812902668367089860118063580197653', 'rESQtswdK9wO0cxD', '1539207508', '1539207508', '1');
INSERT INTO `machine_record` VALUES ('916', '864698032154177898600c0011680093045', 'rESQtswdK9wO0cxD', '1539222396', '1539222396', '1');
INSERT INTO `machine_record` VALUES ('917', '86822603398091589860013045822263951', 'rESQtswdK9wO0cxD', '1539223542', '1539223542', '1');
INSERT INTO `machine_record` VALUES ('918', '869793020133625898600', 'rESQtswdK9wO0cxD', '1539224147', '1539224147', '1');
INSERT INTO `machine_record` VALUES ('919', '864647037418723898600780314F0749635', 'rESQtswdK9wO0cxD', '1539230984', '1539230984', '1');
INSERT INTO `machine_record` VALUES ('920', '86789902778265289860315750103467263', 'rESQtswdK9wO0cxD', '1539231315', '1539231315', '1');
INSERT INTO `machine_record` VALUES ('921', '86539403036014489860116817073182072', 'rESQtswdK9wO0cxD', '1539231888', '1539231888', '1');
INSERT INTO `machine_record` VALUES ('922', '86296103851371989860033031600123760', 'rESQtswdK9wO0cxD', '1539236602', '1539236602', '1');
INSERT INTO `machine_record` VALUES ('923', '868089027364474', 'rESQtswdK9wO0cxD', '1539240792', '1539240792', '1');
INSERT INTO `machine_record` VALUES ('924', '356517054296051', 'rESQtswdK9wO0cxD', '1539242631', '1539242631', '1');
INSERT INTO `machine_record` VALUES ('925', '86669903906583689860052243478395209', 'rESQtswdK9wO0cxD', '1539246503', '1539246503', '1');
INSERT INTO `machine_record` VALUES ('926', '86250503116531489860005101550139036', 'rESQtswdK9wO0cxD', '1539250976', '1539250976', '1');
INSERT INTO `machine_record` VALUES ('927', '866918038411555898600C8231691156462', 'rESQtswdK9wO0cxD', '1539252647', '1539252647', '1');
INSERT INTO `machine_record` VALUES ('928', '86882203458487889860083191835140569', 'rESQtswdK9wO0cxD', '1539252779', '1539252779', '1');
INSERT INTO `machine_record` VALUES ('929', 'id3416a69f-ff32-4d2c-ac5d-7e64c34dca75', 'rESQtswdK9wO0cxD', '1539253549', '1539253549', '1');
INSERT INTO `machine_record` VALUES ('930', '863918034866557898600131617f0059704', 'rESQtswdK9wO0cxD', '1539261521', '1539261521', '1');
INSERT INTO `machine_record` VALUES ('931', '86515904720229489860090261585680467', 'rESQtswdK9wO0cxD', '1539261708', '1539261708', '1');
INSERT INTO `machine_record` VALUES ('932', '35346008301373989860093031611101668', 'rESQtswdK9wO0cxD', '1539265805', '1539265805', '1');
INSERT INTO `machine_record` VALUES ('933', 'A000007854DFA189860317249994687772', 'rESQtswdK9wO0cxD', '1539265858', '1539265858', '1');
INSERT INTO `machine_record` VALUES ('934', '866819028077960', 'rESQtswdK9wO0cxD', '1539267602', '1539267602', '1');
INSERT INTO `machine_record` VALUES ('935', '866228043731199898602A51315F7005113', 'rESQtswdK9wO0cxD', '1539268952', '1539268952', '1');
INSERT INTO `machine_record` VALUES ('936', '89860317249131894372', 'rESQtswdK9wO0cxD', '1539272478', '1539272478', '1');
INSERT INTO `machine_record` VALUES ('937', 'A000007486342389860318748744312721', 'rESQtswdK9wO0cxD', '1539277578', '1539277578', '1');
INSERT INTO `machine_record` VALUES ('938', '86857703564291589860113831003887018', 'rESQtswdK9wO0cxD', '1539280701', '1539280701', '1');
INSERT INTO `machine_record` VALUES ('939', '8664910320685578986003822179D690965', 'rESQtswdK9wO0cxD', '1539313792', '1539313792', '1');
INSERT INTO `machine_record` VALUES ('940', '86437903221428389860116876085117047', 'rESQtswdK9wO0cxD', '1539328749', '1539328749', '2');
INSERT INTO `machine_record` VALUES ('941', '86449904861911789860001191807463630', 'rESQtswdK9wO0cxD', '1539329598', '1539329598', '1');
INSERT INTO `machine_record` VALUES ('942', '86977403173729989860002261572897614', 'rESQtswdK9wO0cxD', '1539331996', '1539331996', '1');
INSERT INTO `machine_record` VALUES ('943', 'idc1a1dca1-6d52-445a-bf15-0d814d193acb', 'rESQtswdK9wO0cxD', '1539341377', '1539341377', '1');
INSERT INTO `machine_record` VALUES ('944', '868014039255155898600F4261781262345', 'rESQtswdK9wO0cxD', '1539343395', '1539343395', '1');
INSERT INTO `machine_record` VALUES ('945', '86804003144787089860117801686759103', 'rESQtswdK9wO0cxD', '1539344170', '1539344170', '1');
INSERT INTO `machine_record` VALUES ('946', '864206037181037898600200918f4001991', 'rESQtswdK9wO0cxD', '1539346290', '1539346290', '1');
INSERT INTO `machine_record` VALUES ('947', '865903034269240898602a9187557543965', 'rESQtswdK9wO0cxD', '1539350045', '1539350045', '1');
INSERT INTO `machine_record` VALUES ('948', 'A000009115A7EE89860318247141138417', 'rESQtswdK9wO0cxD', '1539351885', '1539351885', '1');
INSERT INTO `machine_record` VALUES ('949', '86863903814673089860317255954459177', 'rESQtswdK9wO0cxD', '1539352654', '1539352654', '1');
INSERT INTO `machine_record` VALUES ('950', '869513035195637898602a7201740010396', 'rESQtswdK9wO0cxD', '1539357678', '1539357678', '1');
INSERT INTO `machine_record` VALUES ('951', '862022037133155898600E1120005288655', 'rESQtswdK9wO0cxD', '1539359835', '1539359835', '1');
INSERT INTO `machine_record` VALUES ('952', '86588704057569289970281533111240592', 'rESQtswdK9wO0cxD', '1539360857', '1539360857', '1');
INSERT INTO `machine_record` VALUES ('953', '86594803028760589860042191674287716', 'rESQtswdK9wO0cxD', '1539383813', '1539383813', '1');
INSERT INTO `machine_record` VALUES ('954', '866114030068490', 'rESQtswdK9wO0cxD', '1539396184', '1539396184', '1');
INSERT INTO `machine_record` VALUES ('955', '99000774493378', 'rESQtswdK9wO0cxD', '1539397591', '1539397591', '1');
INSERT INTO `machine_record` VALUES ('956', '865488025316523', 'rESQtswdK9wO0cxD', '1539399218', '1539399218', '1');
INSERT INTO `machine_record` VALUES ('957', '869437023886173898600a122160bb53753', 'rESQtswdK9wO0cxD', '1539403099', '1539403099', '1');
INSERT INTO `machine_record` VALUES ('958', '869156039915053', 'rESQtswdK9wO0cxD', '1539406926', '1539406926', '1');
INSERT INTO `machine_record` VALUES ('959', '86721903139387789860091101451677417', 'rESQtswdK9wO0cxD', '1539407574', '1539407574', '1');
INSERT INTO `machine_record` VALUES ('960', 'A100005316B1FA89861114005774435136', 'rESQtswdK9wO0cxD', '1539409283', '1539409283', '1');
INSERT INTO `machine_record` VALUES ('961', 'idf2a2d77e-002a-4270-92f8-2d20e1060a07', 'rESQtswdK9wO0cxD', '1539409606', '1539409606', '1');
INSERT INTO `machine_record` VALUES ('962', '868979023388701', 'rESQtswdK9wO0cxD', '1539412335', '1539412335', '1');
INSERT INTO `machine_record` VALUES ('963', '86520303593763489860091101750715514', 'rESQtswdK9wO0cxD', '1539417261', '1539417261', '1');
INSERT INTO `machine_record` VALUES ('964', '86991003021272489861118140201711092', 'rESQtswdK9wO0cxD', '1539421098', '1539421098', '1');
INSERT INTO `machine_record` VALUES ('965', '86892302426904989860040191503611527', 'rESQtswdK9wO0cxD', '1539422493', '1539422493', '1');
INSERT INTO `machine_record` VALUES ('966', '869409029138875', 'rESQtswdK9wO0cxD', '1539424031', '1539424031', '1');
INSERT INTO `machine_record` VALUES ('967', '86890003194313989860118801268355212', 'rESQtswdK9wO0cxD', '1539438200', '1539438200', '1');
INSERT INTO `machine_record` VALUES ('968', '86861903542334089860113277410072119', 'rESQtswdK9wO0cxD', '1539449686', '1539449686', '1');
INSERT INTO `machine_record` VALUES ('969', '863197037758638', 'rESQtswdK9wO0cxD', '1539453246', '1539453246', '1');
INSERT INTO `machine_record` VALUES ('970', '863837020489929', 'rESQtswdK9wO0cxD', '1539467301', '1539467301', '1');
INSERT INTO `machine_record` VALUES ('971', '86429403313299889860099271479885225', 'rESQtswdK9wO0cxD', '1539467378', '1539467378', '1');
INSERT INTO `machine_record` VALUES ('972', '867106022439977898602D3991621375773', 'rESQtswdK9wO0cxD', '1539474583', '1539474583', '1');
INSERT INTO `machine_record` VALUES ('973', '86268903449420089860045111756025124', 'rESQtswdK9wO0cxD', '1539475163', '1539475163', '1');
INSERT INTO `machine_record` VALUES ('974', '89860019301653312188', 'rESQtswdK9wO0cxD', '1539478321', '1539478321', '1');
INSERT INTO `machine_record` VALUES ('975', '86389303760069389860115698980456598', 'rESQtswdK9wO0cxD', '1539487291', '1539487291', '1');
INSERT INTO `machine_record` VALUES ('976', '86295503265428989860086101451192322', 'rESQtswdK9wO0cxD', '1539488027', '1539488027', '1');
INSERT INTO `machine_record` VALUES ('977', '86384602390366189860114477415251432', 'rESQtswdK9wO0cxD', '1539488274', '1539488274', '1');
INSERT INTO `machine_record` VALUES ('978', '869021028185607898600b4056957353281', 'rESQtswdK9wO0cxD', '1539488564', '1539488564', '1');
INSERT INTO `machine_record` VALUES ('979', '86543203079075189860062061695064649', 'rESQtswdK9wO0cxD', '1539488727', '1539488727', '1');
INSERT INTO `machine_record` VALUES ('980', '86939402008858689860075045040522379', 'rESQtswdK9wO0cxD', '1539495799', '1539495799', '1');
INSERT INTO `machine_record` VALUES ('981', '866294032699409', 'rESQtswdK9wO0cxD', '1539497774', '1539497774', '1');
INSERT INTO `machine_record` VALUES ('982', '863387032050194', 'rESQtswdK9wO0cxD', '1539502719', '1539502719', '1');
INSERT INTO `machine_record` VALUES ('983', 'ide51eaaac-caf2-40d9-b4fa-7ba945250926', 'rESQtswdK9wO0cxD', '1539507190', '1539507190', '1');
INSERT INTO `machine_record` VALUES ('984', '89860317247723928152', 'rESQtswdK9wO0cxD', '1539513468', '1539513468', '1');
INSERT INTO `machine_record` VALUES ('985', '866654039056921898600b5151640109771', 'rESQtswdK9wO0cxD', '1539520041', '1539520041', '1');
INSERT INTO `machine_record` VALUES ('986', 'id259217fe-b7e8-4e2a-b5ae-8fa1f67c81ee', 'rESQtswdK9wO0cxD', '1539522504', '1539522504', '1');
INSERT INTO `machine_record` VALUES ('987', '9900058567807148986004615145', 'rESQtswdK9wO0cxD', '1539522554', '1539522554', '1');
INSERT INTO `machine_record` VALUES ('988', '86169503257480389860041191642350726', 'rESQtswdK9wO0cxD', '1539522713', '1539522713', '1');
INSERT INTO `machine_record` VALUES ('989', '862460034762966898600231614f1635190', 'rESQtswdK9wO0cxD', '1539523499', '1539523499', '1');
INSERT INTO `machine_record` VALUES ('990', '86273203711789789860034059957851520', 'rESQtswdK9wO0cxD', '1539526030', '1539526030', '1');
INSERT INTO `machine_record` VALUES ('991', '865413038044839898607a0031880592974', 'rESQtswdK9wO0cxD', '1539535516', '1539535516', '1');
INSERT INTO `machine_record` VALUES ('992', '9900111808037689860317248370418802', 'rESQtswdK9wO0cxD', '1539537311', '1539537311', '1');
INSERT INTO `machine_record` VALUES ('993', '869979030158179', 'rESQtswdK9wO0cxD', '1539540206', '1539540206', '1');
INSERT INTO `machine_record` VALUES ('994', '86296303368114589860317248352578599', 'rESQtswdK9wO0cxD', '1539560846', '1539560846', '1');
INSERT INTO `machine_record` VALUES ('995', '868362031877231898602c3031642768172', 'rESQtswdK9wO0cxD', '1539564565', '1539564565', '1');
INSERT INTO `machine_record` VALUES ('996', '86437203134531589860118802066327676', 'rESQtswdK9wO0cxD', '1539564769', '1539564769', '1');
INSERT INTO `machine_record` VALUES ('997', '866294030847869898602A2261792959516', 'rESQtswdK9wO0cxD', '1539566759', '1539566759', '1');
INSERT INTO `machine_record` VALUES ('998', '86634203531950789860117801916261656', 'rESQtswdK9wO0cxD', '1539575728', '1539575728', '1');
INSERT INTO `machine_record` VALUES ('999', '865684036865348898600a5111672007039', 'rESQtswdK9wO0cxD', '1539578031', '1539578031', '1');
INSERT INTO `machine_record` VALUES ('1000', '9900079000790389861118147751739456', 'rESQtswdK9wO0cxD', '1539579485', '1539579485', '1');
INSERT INTO `machine_record` VALUES ('1001', '86649103936543689860116876085235690', 'rESQtswdK9wO0cxD', '1539581433', '1539581433', '1');
INSERT INTO `machine_record` VALUES ('1002', '008796748508062', 'rESQtswdK9wO0cxD', '1539590581', '1539590581', '1');
INSERT INTO `machine_record` VALUES ('1003', '862143035172027', 'rESQtswdK9wO0cxD', '1539594255', '1539594255', '1');
INSERT INTO `machine_record` VALUES ('1004', '86939402095165089860051101450162090', 'rESQtswdK9wO0cxD', '1539596143', '1539596143', '1');
INSERT INTO `machine_record` VALUES ('1005', '864244036830254898600951315F1085283', 'rESQtswdK9wO0cxD', '1539608333', '1539608333', '1');
INSERT INTO `machine_record` VALUES ('1006', '86936903969515989860076247797795629', 'rESQtswdK9wO0cxD', '1539609425', '1539609425', '1');
INSERT INTO `machine_record` VALUES ('1007', '86075804338721889860019189428541375', 'rESQtswdK9wO0cxD', '1539622899', '1539622899', '1');
INSERT INTO `machine_record` VALUES ('1008', '86700703777585289860078031800111575', 'rESQtswdK9wO0cxD', '1539624087', '1539624087', '1');
INSERT INTO `machine_record` VALUES ('1009', '355698066124860', 'rESQtswdK9wO0cxD', '1539634345', '1539634345', '1');
INSERT INTO `machine_record` VALUES ('1010', 'A000007852700E89860318249123140759', 'rESQtswdK9wO0cxD', '1539642711', '1539642711', '1');
INSERT INTO `machine_record` VALUES ('1011', '864552037097552898600521615f0718913', 'rESQtswdK9wO0cxD', '1539645877', '1539645877', '1');
INSERT INTO `machine_record` VALUES ('1012', '86339703003567589860005111884011775', 'rESQtswdK9wO0cxD', '1539648405', '1539648405', '1');
INSERT INTO `machine_record` VALUES ('1013', '8688410414376158986003615164A538684', 'rESQtswdK9wO0cxD', '1539658924', '1539658924', '1');
INSERT INTO `machine_record` VALUES ('1014', 'A000007136DCB589860317248180843017', 'rESQtswdK9wO0cxD', '1539660028', '1539660028', '1');
INSERT INTO `machine_record` VALUES ('1015', '863048037357519898600c1122902202986', 'rESQtswdK9wO0cxD', '1539665536', '1539665536', '1');
INSERT INTO `machine_record` VALUES ('1016', '86480603992455589860315244540263188', 'rESQtswdK9wO0cxD', '1539667369', '1539667369', '1');
INSERT INTO `machine_record` VALUES ('1017', '864242030676475898600f222140a0c5095', 'rESQtswdK9wO0cxD', '1539672988', '1539672988', '1');
INSERT INTO `machine_record` VALUES ('1018', '861423039327947898602a0121285568593', 'rESQtswdK9wO0cxD', '1539688257', '1539688257', '1');
INSERT INTO `machine_record` VALUES ('1019', '35662906327213889860016101840036573', 'rESQtswdK9wO0cxD', '1539689899', '1539689899', '1');
INSERT INTO `machine_record` VALUES ('1020', 'A0000086579E9289860317145532498625', 'rESQtswdK9wO0cxD', '1539691536', '1539691536', '1');
INSERT INTO `machine_record` VALUES ('1021', '86618903541375089860114817117207234', 'rESQtswdK9wO0cxD', '1539696180', '1539696180', '1');
INSERT INTO `machine_record` VALUES ('1022', '86327203394942289860318040210083709', 'rESQtswdK9wO0cxD', '1539697065', '1539697065', '1');
INSERT INTO `machine_record` VALUES ('1023', '866258030628223898602a31614f1770693', 'rESQtswdK9wO0cxD', '1539697964', '1539697964', '1');
INSERT INTO `machine_record` VALUES ('1024', '864499042692177898600E615184A654107', 'rESQtswdK9wO0cxD', '1539698141', '1539698141', '1');
INSERT INTO `machine_record` VALUES ('1025', '866848036258320898600c4087495228713', 'rESQtswdK9wO0cxD', '1539700736', '1539700736', '1');
INSERT INTO `machine_record` VALUES ('1026', '867405033029516', 'rESQtswdK9wO0cxD', '1539700902', '1539700902', '1');
INSERT INTO `machine_record` VALUES ('1027', '86355403050508789860090231594af1351', 'rESQtswdK9wO0cxD', '1539720329', '1539720329', '1');
INSERT INTO `machine_record` VALUES ('1028', 'idec3f60bc-bad5-4ebe-9f4c-b82bc50f80cb', 'rESQtswdK9wO0cxD', '1539746579', '1539746579', '1');
INSERT INTO `machine_record` VALUES ('1029', '86764803226942389860117801842497952', 'rESQtswdK9wO0cxD', '1539746763', '1539746763', '1');
INSERT INTO `machine_record` VALUES ('1030', '86562603131007789860118801533909819', 'rESQtswdK9wO0cxD', '1539757736', '1539757736', '1');
INSERT INTO `machine_record` VALUES ('1031', '861757035095838898600F6101451211007', 'rESQtswdK9wO0cxD', '1539764583', '1539764583', '1');
INSERT INTO `machine_record` VALUES ('1032', '86924103875255689860039189487102891', 'rESQtswdK9wO0cxD', '1539768026', '1539768026', '1');
INSERT INTO `machine_record` VALUES ('1033', '86684403668375789860067191409905926', 'rESQtswdK9wO0cxD', '1539769339', '1539769339', '1');
INSERT INTO `machine_record` VALUES ('1034', '86734904168153089860078188456501405', 'rESQtswdK9wO0cxD', '1539775725', '1539775725', '1');
INSERT INTO `machine_record` VALUES ('1035', '869275011044912898602D8221805766619', 'rESQtswdK9wO0cxD', '1539777862', '1539777862', '1');
INSERT INTO `machine_record` VALUES ('1036', '86598603032648689860072177840253296', 'rESQtswdK9wO0cxD', '1539783657', '1539783657', '1');
INSERT INTO `machine_record` VALUES ('1037', '866049038829396898600690117F0144815', 'rESQtswdK9wO0cxD', '1539784386', '1539784386', '1');
INSERT INTO `machine_record` VALUES ('1038', '866354031180064898600e0121155596746', 'rESQtswdK9wO0cxD', '1539786901', '1539786901', '1');
INSERT INTO `machine_record` VALUES ('1039', '869622034616558898600F9261694540351', 'rESQtswdK9wO0cxD', '1539795574', '1539795574', '1');
INSERT INTO `machine_record` VALUES ('1040', '86904403389171289860040191844378141', 'rESQtswdK9wO0cxD', '1539799095', '1539799095', '1');
INSERT INTO `machine_record` VALUES ('1041', '866985032246568898600e615157b045236', 'rESQtswdK9wO0cxD', '1539814130', '1539814130', '1');
INSERT INTO `machine_record` VALUES ('1042', '866361025483487', 'rESQtswdK9wO0cxD', '1539824377', '1539824377', '1');
INSERT INTO `machine_record` VALUES ('1043', '86441103904377789860001191807349038', 'rESQtswdK9wO0cxD', '1539825759', '1539825759', '1');
INSERT INTO `machine_record` VALUES ('1044', '86402203015292989860117819028386823', 'rESQtswdK9wO0cxD', '1539829721', '1539829721', '1');
INSERT INTO `machine_record` VALUES ('1045', '862819034219311898607a51208f5062534', 'rESQtswdK9wO0cxD', '1539836191', '1539836191', '1');
INSERT INTO `machine_record` VALUES ('1046', '863990041753698', 'rESQtswdK9wO0cxD', '1539842891', '1539842891', '1');
INSERT INTO `machine_record` VALUES ('1047', '864399037147056898600c82317919b1179', 'rESQtswdK9wO0cxD', '1539844586', '1539844586', '1');
INSERT INTO `machine_record` VALUES ('1048', '862922032166292898600a7081776015823', 'rESQtswdK9wO0cxD', '1539847747', '1539847747', '1');
INSERT INTO `machine_record` VALUES ('1049', 'id9156ef8d-c8ef-454e-b2fd-ea7f41a9d216', 'rESQtswdK9wO0cxD', '1539851360', '1539851360', '1');
INSERT INTO `machine_record` VALUES ('1050', '8684340355747889860318247920498065', 'rESQtswdK9wO0cxD', '1539854994', '1539854994', '1');
INSERT INTO `machine_record` VALUES ('1051', '86919703381407489860036101650030813', 'rESQtswdK9wO0cxD', '1539860761', '1539860761', '1');
INSERT INTO `machine_record` VALUES ('1052', '86417503446921889860116884022962194', 'rESQtswdK9wO0cxD', '1539878125', '1539878125', '1');
INSERT INTO `machine_record` VALUES ('1053', '866356035444719898600f2231850826089', 'rESQtswdK9wO0cxD', '1539878489', '1539878489', '1');
INSERT INTO `machine_record` VALUES ('1054', 'A00000721A7D2B898600B31617F1193535', 'rESQtswdK9wO0cxD', '1539892252', '1539892252', '1');
INSERT INTO `machine_record` VALUES ('1055', '86878703613718389860117801406722290', 'rESQtswdK9wO0cxD', '1539911539', '1539911539', '1');
INSERT INTO `machine_record` VALUES ('1056', '869932037052077898602d31617f0217754', 'rESQtswdK9wO0cxD', '1539912840', '1539912840', '1');
INSERT INTO `machine_record` VALUES ('1057', '86759503047151189860117874036221207', 'rESQtswdK9wO0cxD', '1539917790', '1539917790', '1');
INSERT INTO `machine_record` VALUES ('1058', '86986803288943889860317049386505602', 'rESQtswdK9wO0cxD', '1539919033', '1539919033', '1');
INSERT INTO `machine_record` VALUES ('1059', '863316037229883898600e3031401692490', 'rESQtswdK9wO0cxD', '1539920296', '1539920296', '1');
INSERT INTO `machine_record` VALUES ('1060', '86397604087545989860083031810241442', 'rESQtswdK9wO0cxD', '1539927124', '1539927124', '1');
INSERT INTO `machine_record` VALUES ('1061', '8652060269243058986003615164A794931', 'rESQtswdK9wO0cxD', '1539928576', '1539928576', '1');
INSERT INTO `machine_record` VALUES ('1062', '727483998942377278849895171', 'rESQtswdK9wO0cxD', '1539931158', '1539931158', '1');
INSERT INTO `machine_record` VALUES ('1063', '86280603922210189860075020050062304', 'rESQtswdK9wO0cxD', '1539936700', '1539936700', '1');
INSERT INTO `machine_record` VALUES ('1064', '86057003703834789860115818055212243', 'rESQtswdK9wO0cxD', '1539937592', '1539937592', '1');
INSERT INTO `machine_record` VALUES ('1065', '86814403193329189860117876052299736', 'rESQtswdK9wO0cxD', '1539938548', '1539938548', '1');
INSERT INTO `machine_record` VALUES ('1066', '86479003187580189860024087856791405', 'rESQtswdK9wO0cxD', '1539940224', '1539940224', '1');
INSERT INTO `machine_record` VALUES ('1067', 'A000006817F4F489860081111851026173', 'rESQtswdK9wO0cxD', '1539940728', '1539940728', '1');
INSERT INTO `machine_record` VALUES ('1068', '35526604699339889132865913344762284', 'rESQtswdK9wO0cxD', '1539940859', '1539940859', '1');
INSERT INTO `machine_record` VALUES ('1069', '868092026828309898600e11262a4803755', 'rESQtswdK9wO0cxD', '1539945865', '1539945865', '1');
INSERT INTO `machine_record` VALUES ('1070', '86808403329732189860117801401703634', 'rESQtswdK9wO0cxD', '1539946143', '1539946143', '1');
INSERT INTO `machine_record` VALUES ('1071', '8986006631AC80002525', 'rESQtswdK9wO0cxD', '1539948576', '1539948576', '1');
INSERT INTO `machine_record` VALUES ('1072', '86637003124564089860051211740015591', 'rESQtswdK9wO0cxD', '1539954367', '1539954367', '1');
INSERT INTO `machine_record` VALUES ('1073', '869394027157756898600C7174571422537', 'rESQtswdK9wO0cxD', '1539956358', '1539956358', '1');
INSERT INTO `machine_record` VALUES ('1074', 'idd58969f9-6754-415c-b959-a42531290d62', 'rESQtswdK9wO0cxD', '1539957155', '1539957155', '1');
INSERT INTO `machine_record` VALUES ('1075', '869372028571233898600E8211590083001', 'rESQtswdK9wO0cxD', '1539957915', '1539957915', '1');
INSERT INTO `machine_record` VALUES ('1076', '8674750337859388986005715179A119465', 'rESQtswdK9wO0cxD', '1539960829', '1539960829', '1');
INSERT INTO `machine_record` VALUES ('1077', '86562903915221089860040191692774018', 'rESQtswdK9wO0cxD', '1539970305', '1539970305', '1');
INSERT INTO `machine_record` VALUES ('1078', '358890210124816', 'rESQtswdK9wO0cxD', '1539984103', '1539984103', '1');
INSERT INTO `machine_record` VALUES ('1079', 'A000008D720242', 'rESQtswdK9wO0cxD', '1539984386', '1539984386', '1');
INSERT INTO `machine_record` VALUES ('1080', '868124029392205', 'rESQtswdK9wO0cxD', '1539986735', '1539986735', '1');
INSERT INTO `machine_record` VALUES ('1081', '86763503509197989860318049470684007', 'rESQtswdK9wO0cxD', '1539995114', '1539995114', '1');
INSERT INTO `machine_record` VALUES ('1082', '866645030297480898600c3031810954326', 'rESQtswdK9wO0cxD', '1539996690', '1539996690', '1');
INSERT INTO `machine_record` VALUES ('1083', '869308030580358898602A8221802EA9967', 'rESQtswdK9wO0cxD', '1539997360', '1539997360', '1');
INSERT INTO `machine_record` VALUES ('1084', '86234603035638489860060101450012153', 'rESQtswdK9wO0cxD', '1539998192', '1539998192', '1');
INSERT INTO `machine_record` VALUES ('1085', '864052022091074', 'rESQtswdK9wO0cxD', '1540001056', '1540001056', '1');
INSERT INTO `machine_record` VALUES ('1086', '898600802318903A3327', 'rESQtswdK9wO0cxD', '1540002396', '1540002396', '1');
INSERT INTO `machine_record` VALUES ('1087', 'idcad7c826-f4c2-46b3-87c7-355a8ffcffc5', 'rESQtswdK9wO0cxD', '1540010334', '1540010334', '1');
INSERT INTO `machine_record` VALUES ('1088', '869514030512016898600b4061446531453', 'rESQtswdK9wO0cxD', '1540013995', '1540013995', '1');
INSERT INTO `machine_record` VALUES ('1089', '86849603611703589860317243793657938', 'rESQtswdK9wO0cxD', '1540019386', '1540019386', '1');
INSERT INTO `machine_record` VALUES ('1090', '86437203777890789860318045772200534', 'rESQtswdK9wO0cxD', '1540020185', '1540020185', '1');
INSERT INTO `machine_record` VALUES ('1091', '864193034276046', 'rESQtswdK9wO0cxD', '1540021692', '1540021692', '1');
INSERT INTO `machine_record` VALUES ('1092', '86604203608579889860034061845086925', 'rESQtswdK9wO0cxD', '1540021939', '1540021939', '1');
INSERT INTO `machine_record` VALUES ('1093', '86739103765096289860115817075279802', 'rESQtswdK9wO0cxD', '1540028374', '1540028374', '1');
INSERT INTO `machine_record` VALUES ('1094', '86852902123608789860115836009192451', 'rESQtswdK9wO0cxD', '1540032080', '1540032080', '1');
INSERT INTO `machine_record` VALUES ('1095', '864546031991513', 'rESQtswdK9wO0cxD', '1540037793', '1540037793', '1');
INSERT INTO `machine_record` VALUES ('1096', '9900093921060889860318147510302070', 'rESQtswdK9wO0cxD', '1540039003', '1540039003', '1');
INSERT INTO `machine_record` VALUES ('1097', '898600C022180E107430', 'rESQtswdK9wO0cxD', '1540041391', '1540041391', '1');
INSERT INTO `machine_record` VALUES ('1098', '868433024579504', 'rESQtswdK9wO0cxD', '1540042191', '1540042191', '1');
INSERT INTO `machine_record` VALUES ('1099', '86107903710681489860318245270494064', 'rESQtswdK9wO0cxD', '1540042306', '1540042306', '1');
INSERT INTO `machine_record` VALUES ('1100', '86588503229155989860040031410321390', 'rESQtswdK9wO0cxD', '1540045812', '1540045812', '1');
INSERT INTO `machine_record` VALUES ('1101', '866298027943896', 'rESQtswdK9wO0cxD', '1540046661', '1540046661', '1');
INSERT INTO `machine_record` VALUES ('1102', '86525603179742889860117801151339241', 'rESQtswdK9wO0cxD', '1540054968', '1540054968', '1');
INSERT INTO `machine_record` VALUES ('1103', '866446035410370898602d31618f2387293', 'rESQtswdK9wO0cxD', '1540058209', '1540058209', '1');
INSERT INTO `machine_record` VALUES ('1104', '869309034927033898600331615F0073624', 'rESQtswdK9wO0cxD', '1540070510', '1540070510', '1');
INSERT INTO `machine_record` VALUES ('1105', 'A0000089264DAF89860318745163272691', 'rESQtswdK9wO0cxD', '1540074917', '1540074917', '1');
INSERT INTO `machine_record` VALUES ('1106', '867823025282739', 'rESQtswdK9wO0cxD', '1540077958', '1540077958', '1');
INSERT INTO `machine_record` VALUES ('1107', '868124027089274', 'rESQtswdK9wO0cxD', '1540079588', '1540079588', '1');
INSERT INTO `machine_record` VALUES ('1108', '86974903286427689860051177597139057', 'rESQtswdK9wO0cxD', '1540083538', '1540083538', '1');
INSERT INTO `machine_record` VALUES ('1109', '866831026388000', 'rESQtswdK9wO0cxD', '1540086008', '1540086008', '1');
INSERT INTO `machine_record` VALUES ('1110', '86636903672324789861118043110777651', 'rESQtswdK9wO0cxD', '1540091313', '1540091313', '1');
INSERT INTO `machine_record` VALUES ('1111', '861843034482282898600c9161480023900', 'rESQtswdK9wO0cxD', '1540097057', '1540097057', '1');
INSERT INTO `machine_record` VALUES ('1112', '868803040558650898600A7087876219588', 'rESQtswdK9wO0cxD', '1540099331', '1540099331', '1');
INSERT INTO `machine_record` VALUES ('1113', 'a0000055cb7171', 'rESQtswdK9wO0cxD', '1540101112', '1540101112', '3');
INSERT INTO `machine_record` VALUES ('1114', '35802215050229489693240085022949208', 'rESQtswdK9wO0cxD', '1540105536', '1540105536', '1');
INSERT INTO `machine_record` VALUES ('1115', '866027027939855', 'rESQtswdK9wO0cxD', '1540105753', '1540105753', '1');
INSERT INTO `machine_record` VALUES ('1116', '35615607350302189860318948550572513', 'rESQtswdK9wO0cxD', '1540106103', '1540106103', '1');
INSERT INTO `machine_record` VALUES ('1117', '865614031834106', 'rESQtswdK9wO0cxD', '1540112122', '1540112122', '1');
INSERT INTO `machine_record` VALUES ('1118', '861759036155231', 'rESQtswdK9wO0cxD', '1540118151', '1540118151', '1');
INSERT INTO `machine_record` VALUES ('1119', '866035038072087898600f9261783774992', 'rESQtswdK9wO0cxD', '1540121235', '1540121235', '1');
INSERT INTO `machine_record` VALUES ('1120', '8629610306241188986001615147A832399', 'rESQtswdK9wO0cxD', '1540121515', '1540121515', '1');
INSERT INTO `machine_record` VALUES ('1121', '867620027333043898600A2299543546647', 'rESQtswdK9wO0cxD', '1540126322', '1540126322', '1');
INSERT INTO `machine_record` VALUES ('1122', '861642034427440898600f1247795709553', 'rESQtswdK9wO0cxD', '1540129307', '1540129307', '1');
INSERT INTO `machine_record` VALUES ('1123', '86837703835701189860028248698133427', 'rESQtswdK9wO0cxD', '1540132322', '1540132322', '1');
INSERT INTO `machine_record` VALUES ('1124', '86713403164387689860118801258696997', 'rESQtswdK9wO0cxD', '1540140032', '1540140032', '1');
INSERT INTO `machine_record` VALUES ('1125', '35526604481618789172386053783468360', 'rESQtswdK9wO0cxD', '1540156351', '1540156351', '1');
INSERT INTO `machine_record` VALUES ('1126', '868843041393814898602A0318072357188', 'rESQtswdK9wO0cxD', '1540163415', '1540163415', '1');
INSERT INTO `machine_record` VALUES ('1127', '865836036993625', 'rESQtswdK9wO0cxD', '1540174742', '1540174742', '1');
INSERT INTO `machine_record` VALUES ('1128', '864033034189312', 'rESQtswdK9wO0cxD', '1540174744', '1540174744', '1');
INSERT INTO `machine_record` VALUES ('1129', '865664035984043', 'rESQtswdK9wO0cxD', '1540174745', '1540174745', '1');
INSERT INTO `machine_record` VALUES ('1130', '866600020195913', 'rESQtswdK9wO0cxD', '1540174751', '1540174751', '1');
INSERT INTO `machine_record` VALUES ('1131', '869454023013948', 'rESQtswdK9wO0cxD', '1540174753', '1540174753', '1');
INSERT INTO `machine_record` VALUES ('1132', '867120023313941', 'rESQtswdK9wO0cxD', '1540174755', '1540174755', '1');
INSERT INTO `machine_record` VALUES ('1133', '866639033170612', 'rESQtswdK9wO0cxD', '1540174864', '1540174864', '1');
INSERT INTO `machine_record` VALUES ('1134', '868805037696294', 'rESQtswdK9wO0cxD', '1540174865', '1540174865', '1');
INSERT INTO `machine_record` VALUES ('1135', '865124037022433', 'rESQtswdK9wO0cxD', '1540174888', '1540174888', '1');
INSERT INTO `machine_record` VALUES ('1136', '862187038042109', 'rESQtswdK9wO0cxD', '1540174895', '1540174895', '1');
INSERT INTO `machine_record` VALUES ('1137', '866788037605246', 'rESQtswdK9wO0cxD', '1540174911', '1540174911', '1');
INSERT INTO `machine_record` VALUES ('1138', '863216024311357', 'rESQtswdK9wO0cxD', '1540174987', '1540174987', '1');
INSERT INTO `machine_record` VALUES ('1139', '86730302880350089860091101750057849', 'rESQtswdK9wO0cxD', '1540175047', '1540175047', '1');
INSERT INTO `machine_record` VALUES ('1140', 'id751886e0-8c5b-4853-a8d0-35773097d341', 'rESQtswdK9wO0cxD', '1540175087', '1540175087', '1');
INSERT INTO `machine_record` VALUES ('1141', '357585057239369', 'rESQtswdK9wO0cxD', '1540175283', '1540175283', '1');
INSERT INTO `machine_record` VALUES ('1142', '357784053988547', 'rESQtswdK9wO0cxD', '1540175934', '1540175934', '1');
INSERT INTO `machine_record` VALUES ('1143', '357784052113949', 'rESQtswdK9wO0cxD', '1540176000', '1540176000', '1');
INSERT INTO `machine_record` VALUES ('1144', '352689081704730', 'rESQtswdK9wO0cxD', '1540176114', '1540176114', '1');
INSERT INTO `machine_record` VALUES ('1145', '353984097501298', 'rESQtswdK9wO0cxD', '1540176191', '1540176191', '1');
INSERT INTO `machine_record` VALUES ('1146', '868717036486199', 'rESQtswdK9wO0cxD', '1540176230', '1540176230', '1');
INSERT INTO `machine_record` VALUES ('1147', '35753708237175', 'rESQtswdK9wO0cxD', '1540176237', '1540176237', '1');
INSERT INTO `machine_record` VALUES ('1148', '862537032885525', 'rESQtswdK9wO0cxD', '1540176238', '1540176238', '1');
INSERT INTO `machine_record` VALUES ('1149', '358035085757577', 'rESQtswdK9wO0cxD', '1540176238', '1540176238', '1');
INSERT INTO `machine_record` VALUES ('1150', '990008698659278', 'rESQtswdK9wO0cxD', '1540176239', '1540176239', '1');
INSERT INTO `machine_record` VALUES ('1151', '35990607031556', 'rESQtswdK9wO0cxD', '1540176239', '1540176239', '1');
INSERT INTO `machine_record` VALUES ('1152', '868488032764027', 'rESQtswdK9wO0cxD', '1540176239', '1540176239', '1');
INSERT INTO `machine_record` VALUES ('1153', '352936091063460', 'rESQtswdK9wO0cxD', '1540176241', '1540176241', '1');
INSERT INTO `machine_record` VALUES ('1154', 'id0c2f1b92-2969-4d29-97bd-2d2aeb198414', 'rESQtswdK9wO0cxD', '1540176243', '1540176243', '1');
INSERT INTO `machine_record` VALUES ('1155', 'idbadae88c-e690-4676-8fd2-5a0ae7a7713b', 'rESQtswdK9wO0cxD', '1540176243', '1540176243', '1');
INSERT INTO `machine_record` VALUES ('1156', '865371031635419', 'rESQtswdK9wO0cxD', '1540176245', '1540176245', '1');
INSERT INTO `machine_record` VALUES ('1157', '868869022921109', 'rESQtswdK9wO0cxD', '1540176246', '1540176246', '1');
INSERT INTO `machine_record` VALUES ('1158', '35271309630520889861118040204293892', 'rESQtswdK9wO0cxD', '1540176249', '1540176249', '1');
INSERT INTO `machine_record` VALUES ('1159', 'id904decde-d421-4228-bb35-71e5eff466c3', 'rESQtswdK9wO0cxD', '1540176249', '1540176249', '1');
INSERT INTO `machine_record` VALUES ('1160', '865831037033810', 'rESQtswdK9wO0cxD', '1540176253', '1540176253', '1');
INSERT INTO `machine_record` VALUES ('1161', '352430071300415', 'rESQtswdK9wO0cxD', '1540176253', '1540176253', '1');
INSERT INTO `machine_record` VALUES ('1162', '354022090184959', 'rESQtswdK9wO0cxD', '1540176254', '1540176254', '1');
INSERT INTO `machine_record` VALUES ('1163', '352341090041742', 'rESQtswdK9wO0cxD', '1540176254', '1540176254', '1');
INSERT INTO `machine_record` VALUES ('1164', '357008082958648', 'rESQtswdK9wO0cxD', '1540176255', '1540176255', '1');
INSERT INTO `machine_record` VALUES ('1165', '866946020386824', 'rESQtswdK9wO0cxD', '1540176257', '1540176257', '1');
INSERT INTO `machine_record` VALUES ('1166', '86327403747920', 'rESQtswdK9wO0cxD', '1540176257', '1540176257', '1');
INSERT INTO `machine_record` VALUES ('1167', 'ided48a09f-dd47-4462-ae5d-9fd7c4037787', 'rESQtswdK9wO0cxD', '1540176258', '1540176258', '1');
INSERT INTO `machine_record` VALUES ('1168', '861413034551906', 'rESQtswdK9wO0cxD', '1540176258', '1540176258', '1');
INSERT INTO `machine_record` VALUES ('1169', '864728034825563', 'rESQtswdK9wO0cxD', '1540176261', '1540176261', '1');
INSERT INTO `machine_record` VALUES ('1170', '355021060689228', 'rESQtswdK9wO0cxD', '1540176264', '1540176264', '1');
INSERT INTO `machine_record` VALUES ('1171', '863360027913536', 'rESQtswdK9wO0cxD', '1540176272', '1540176272', '1');
INSERT INTO `machine_record` VALUES ('1172', 'idfa1b47a7-d185-461e-b740-ac3afd48aabc', 'rESQtswdK9wO0cxD', '1540176274', '1540176274', '1');
INSERT INTO `machine_record` VALUES ('1173', '359596068056526', 'rESQtswdK9wO0cxD', '1540176277', '1540176277', '1');
INSERT INTO `machine_record` VALUES ('1174', '869275017532134', 'rESQtswdK9wO0cxD', '1540176278', '1540176278', '1');
INSERT INTO `machine_record` VALUES ('1175', '354225061045543', 'rESQtswdK9wO0cxD', '1540176278', '1540176278', '1');
INSERT INTO `machine_record` VALUES ('1176', 'A000007763EF21', 'rESQtswdK9wO0cxD', '1540176279', '1540176279', '1');
INSERT INTO `machine_record` VALUES ('1177', '359881063880199', 'rESQtswdK9wO0cxD', '1540176280', '1540176280', '1');
INSERT INTO `machine_record` VALUES ('1178', '862837032748255', 'rESQtswdK9wO0cxD', '1540176283', '1540176283', '1');
INSERT INTO `machine_record` VALUES ('1179', '868920030324255', 'rESQtswdK9wO0cxD', '1540176283', '1540176283', '1');
INSERT INTO `machine_record` VALUES ('1180', '354910071260972', 'rESQtswdK9wO0cxD', '1540176299', '1540176299', '1');
INSERT INTO `machine_record` VALUES ('1181', 'a0000059e03cba', 'rESQtswdK9wO0cxD', '1540176301', '1540176301', '1');
INSERT INTO `machine_record` VALUES ('1182', '863713039610203', 'rESQtswdK9wO0cxD', '1540176302', '1540176302', '1');
INSERT INTO `machine_record` VALUES ('1183', '864839033481652', 'rESQtswdK9wO0cxD', '1540176352', '1540176352', '1');
INSERT INTO `machine_record` VALUES ('1184', '354732083272492', 'rESQtswdK9wO0cxD', '1540176364', '1540176364', '1');
INSERT INTO `machine_record` VALUES ('1185', '860716034884239', 'rESQtswdK9wO0cxD', '1540176379', '1540176379', '1');
INSERT INTO `machine_record` VALUES ('1186', '354273056884054', 'rESQtswdK9wO0cxD', '1540176409', '1540176409', '1');
INSERT INTO `machine_record` VALUES ('1187', '356629065930493', 'rESQtswdK9wO0cxD', '1540176442', '1540176442', '1');
INSERT INTO `machine_record` VALUES ('1188', '868897020960050', 'rESQtswdK9wO0cxD', '1540176455', '1540176455', '1');
INSERT INTO `machine_record` VALUES ('1189', '869139025426566', 'rESQtswdK9wO0cxD', '1540176712', '1540176712', '1');
INSERT INTO `machine_record` VALUES ('1190', '353925065758527', 'rESQtswdK9wO0cxD', '1540176768', '1540176768', '1');
INSERT INTO `machine_record` VALUES ('1191', '864226035817614', 'rESQtswdK9wO0cxD', '1540176771', '1540176771', '1');
INSERT INTO `machine_record` VALUES ('1192', '355387050785809', 'rESQtswdK9wO0cxD', '1540176787', '1540176787', '1');
INSERT INTO `machine_record` VALUES ('1193', 'a0000055fe2f2b', 'rESQtswdK9wO0cxD', '1540176842', '1540176842', '1');
INSERT INTO `machine_record` VALUES ('1194', '862490031215791', 'rESQtswdK9wO0cxD', '1540176986', '1540176986', '1');
INSERT INTO `machine_record` VALUES ('1195', '356509057887362', 'rESQtswdK9wO0cxD', '1540177134', '1540177134', '2');
INSERT INTO `machine_record` VALUES ('1196', '357523050319458', 'rESQtswdK9wO0cxD', '1540177139', '1540177139', '1');
INSERT INTO `machine_record` VALUES ('1197', '860191039965393', 'rESQtswdK9wO0cxD', '1540177386', '1540177386', '1');
INSERT INTO `machine_record` VALUES ('1198', '356156073350563', 'rESQtswdK9wO0cxD', '1540177540', '1540177540', '1');
INSERT INTO `machine_record` VALUES ('1199', '354286050848909', 'rESQtswdK9wO0cxD', '1540177612', '1540177612', '1');
INSERT INTO `machine_record` VALUES ('1200', '353460081938515', 'rESQtswdK9wO0cxD', '1540177715', '1540177715', '1');
INSERT INTO `machine_record` VALUES ('1201', '352736061446764', 'rESQtswdK9wO0cxD', '1540177961', '1540177961', '1');
INSERT INTO `machine_record` VALUES ('1202', '357107070589223', 'rESQtswdK9wO0cxD', '1540178010', '1540178010', '1');
INSERT INTO `machine_record` VALUES ('1203', '352713090780562', 'rESQtswdK9wO0cxD', '1540178153', '1540178153', '1');
INSERT INTO `machine_record` VALUES ('1204', '863433031390890', 'rESQtswdK9wO0cxD', '1540178244', '1540178244', '1');
INSERT INTO `machine_record` VALUES ('1205', '351888066922637', 'rESQtswdK9wO0cxD', '1540178624', '1540178624', '1');
INSERT INTO `machine_record` VALUES ('1206', '353232071040770', 'rESQtswdK9wO0cxD', '1540179049', '1540179049', '1');
INSERT INTO `machine_record` VALUES ('1207', '353280081046824', 'rESQtswdK9wO0cxD', '1540179349', '1540179349', '1');
INSERT INTO `machine_record` VALUES ('1208', '284835604709973189472495054', 'rESQtswdK9wO0cxD', '1540179614', '1540179614', '1');
INSERT INTO `machine_record` VALUES ('1209', '352105062578647', 'rESQtswdK9wO0cxD', '1540181075', '1540181075', '1');
INSERT INTO `machine_record` VALUES ('1210', '869637021677744', 'rESQtswdK9wO0cxD', '1540200060', '1540200060', '1');
INSERT INTO `machine_record` VALUES ('1211', '863032030283633', 'rESQtswdK9wO0cxD', '1540203335', '1540203335', '4');
INSERT INTO `machine_record` VALUES ('1212', '866789025899890', 'rESQtswdK9wO0cxD', '1540205419', '1540205419', '1');
INSERT INTO `machine_record` VALUES ('1213', '225851939181973103932590242', 'rESQtswdK9wO0cxD', '1540207183', '1540207183', '1');
INSERT INTO `machine_record` VALUES ('1214', 'A00000723A130289860316243181484235', 'rESQtswdK9wO0cxD', '1540208177', '1540208177', '1');
INSERT INTO `machine_record` VALUES ('1215', 'id07e2083f-e555-45d4-93c2-a5770ac5c91f', 'rESQtswdK9wO0cxD', '1540208645', '1540208645', '1');
INSERT INTO `machine_record` VALUES ('1216', '869555028398363', 'rESQtswdK9wO0cxD', '1540210185', '1540210185', '1');
INSERT INTO `machine_record` VALUES ('1217', 'A10000542B29D389860317748982429220', 'rESQtswdK9wO0cxD', '1540211164', '1540211164', '1');
INSERT INTO `machine_record` VALUES ('1218', '866645030456375898600e2101680000184', 'rESQtswdK9wO0cxD', '1540212613', '1540212613', '1');
INSERT INTO `machine_record` VALUES ('1219', '86823803391589089860116811039604329', 'rESQtswdK9wO0cxD', '1540212748', '1540212748', '1');
INSERT INTO `machine_record` VALUES ('1220', 'A0000070B4DFD089860316040281579330', 'rESQtswdK9wO0cxD', '1540214664', '1540214664', '1');
INSERT INTO `machine_record` VALUES ('1221', '865366031376758898600F6111675010110', 'rESQtswdK9wO0cxD', '1540215203', '1540215203', '1');
INSERT INTO `machine_record` VALUES ('1222', '89860091101450591798', 'rESQtswdK9wO0cxD', '1540221192', '1540221192', '1');
INSERT INTO `machine_record` VALUES ('1223', '866825027807430', 'rESQtswdK9wO0cxD', '1540221276', '1540221276', '1');
INSERT INTO `machine_record` VALUES ('1224', '86371603701301589860070231890F74695', 'rESQtswdK9wO0cxD', '1540226680', '1540226680', '1');
INSERT INTO `machine_record` VALUES ('1225', '9900102065023789860316750105594022', 'rESQtswdK9wO0cxD', '1540228076', '1540228076', '1');
INSERT INTO `machine_record` VALUES ('1226', '86425603179587889860041191672926062', 'rESQtswdK9wO0cxD', '1540244823', '1540244823', '1');
INSERT INTO `machine_record` VALUES ('1227', '86149303922617589860118801262034516', 'rESQtswdK9wO0cxD', '1540245961', '1540245961', '1');
INSERT INTO `machine_record` VALUES ('1228', '86348303290691389860316049322082204', 'rESQtswdK9wO0cxD', '1540262174', '1540262174', '1');
INSERT INTO `machine_record` VALUES ('1229', '86670003603926989860004101450197352', 'rESQtswdK9wO0cxD', '1540269802', '1540269802', '1');
INSERT INTO `machine_record` VALUES ('1230', '862052034684744898600c6101450575659', 'rESQtswdK9wO0cxD', '1540270777', '1540270777', '1');
INSERT INTO `machine_record` VALUES ('1231', '869677032561149', 'rESQtswdK9wO0cxD', '1540285536', '1540285536', '1');
INSERT INTO `machine_record` VALUES ('1232', '863403031902259898600b8231484333279', 'rESQtswdK9wO0cxD', '1540287560', '1540287560', '1');
INSERT INTO `machine_record` VALUES ('1233', '8644440349215498985301918030092947f', 'rESQtswdK9wO0cxD', '1540287859', '1540287859', '1');
INSERT INTO `machine_record` VALUES ('1234', '861400034356808898600340616a5995099', 'rESQtswdK9wO0cxD', '1540288620', '1540288620', '1');
INSERT INTO `machine_record` VALUES ('1235', '866918034926135898600C222170F2C8907', 'rESQtswdK9wO0cxD', '1540294182', '1540294182', '1');
INSERT INTO `machine_record` VALUES ('1236', '86455603085449789860051141485051154', 'rESQtswdK9wO0cxD', '1540295520', '1540295520', '1');
INSERT INTO `machine_record` VALUES ('1237', '868029035539642', 'rESQtswdK9wO0cxD', '1540296556', '1540296556', '1');
INSERT INTO `machine_record` VALUES ('1238', '86424003623017289860318045512425599', 'rESQtswdK9wO0cxD', '1540296758', '1540296758', '1');
INSERT INTO `machine_record` VALUES ('1239', '867822025479287', 'rESQtswdK9wO0cxD', '1540298669', '1540298669', '1');
INSERT INTO `machine_record` VALUES ('1240', '868787034756208898602A5120146709391', 'rESQtswdK9wO0cxD', '1540299770', '1540299770', '1');
INSERT INTO `machine_record` VALUES ('1241', '86603603848726789860014061745211605', 'rESQtswdK9wO0cxD', '1540305430', '1540305430', '1');
INSERT INTO `machine_record` VALUES ('1242', '86637103090961689860114951570962215', 'rESQtswdK9wO0cxD', '1540308297', '1540308297', '1');
INSERT INTO `machine_record` VALUES ('1243', '9900100831698089860318745322130269', 'rESQtswdK9wO0cxD', '1540309941', '1540309941', '1');
INSERT INTO `machine_record` VALUES ('1244', '86583603933325889860117801811216615', 'rESQtswdK9wO0cxD', '1540324631', '1540324631', '1');
INSERT INTO `machine_record` VALUES ('1245', '86514604081617089860014087595893322', 'rESQtswdK9wO0cxD', '1540328257', '1540328257', '1');
INSERT INTO `machine_record` VALUES ('1246', '8650000341032958986005815177a453198', 'rESQtswdK9wO0cxD', '1540329473', '1540329473', '1');
INSERT INTO `machine_record` VALUES ('1247', '868967023087795', 'rESQtswdK9wO0cxD', '1540332320', '1540332320', '1');
INSERT INTO `machine_record` VALUES ('1248', '86923203347347089860117801839455823', 'rESQtswdK9wO0cxD', '1540340085', '1540340085', '1');
INSERT INTO `machine_record` VALUES ('1249', '86327103192798489860117801471867103', 'rESQtswdK9wO0cxD', '1540340327', '1540340327', '1');
INSERT INTO `machine_record` VALUES ('1250', '86822603290068289860098248472879348', 'rESQtswdK9wO0cxD', '1540345173', '1540345173', '1');
INSERT INTO `machine_record` VALUES ('1251', '86721703063677589860117801724919248', 'rESQtswdK9wO0cxD', '1540345202', '1540345202', '1');
INSERT INTO `machine_record` VALUES ('1252', '86845503108213189860064201450105557', 'rESQtswdK9wO0cxD', '1540349724', '1540349724', '1');
INSERT INTO `machine_record` VALUES ('1253', '863483033352612898600a5083794551638', 'rESQtswdK9wO0cxD', '1540349940', '1540349940', '1');
INSERT INTO `machine_record` VALUES ('1254', 'idf3230644-35e0-45f6-a7a1-8c06abc4fd94', 'rESQtswdK9wO0cxD', '1540350602', '1540350602', '1');
INSERT INTO `machine_record` VALUES ('1255', '866068026907147898600b7189433675689', 'rESQtswdK9wO0cxD', '1540356173', '1540356173', '2');
INSERT INTO `machine_record` VALUES ('1256', 'idfdec943d-f94a-48dd-9a5d-760f8783db20', 'rESQtswdK9wO0cxD', '1540357922', '1540357922', '1');
INSERT INTO `machine_record` VALUES ('1257', '9900114220860989860318249130688428', 'rESQtswdK9wO0cxD', '1540359705', '1540359705', '1');
INSERT INTO `machine_record` VALUES ('1258', '86500003906245489860005111485013363', 'rESQtswdK9wO0cxD', '1540360043', '1540360043', '1');
INSERT INTO `machine_record` VALUES ('1259', '86866303194507089860118627410114367', 'rESQtswdK9wO0cxD', '1540360520', '1540360520', '2');
INSERT INTO `machine_record` VALUES ('1260', '16366119811050518492500782341339575', 'rESQtswdK9wO0cxD', '1540360752', '1540360752', '3');
INSERT INTO `machine_record` VALUES ('1261', '837910560201524866047707243', 'rESQtswdK9wO0cxD', '1540360813', '1540360813', '1');
INSERT INTO `machine_record` VALUES ('1262', '86614603351342989860117874046590245', 'rESQtswdK9wO0cxD', '1540361935', '1540361935', '1');
INSERT INTO `machine_record` VALUES ('1263', '86820803394723589860117874010661394', 'rESQtswdK9wO0cxD', '1540362387', '1540362387', '11');
INSERT INTO `machine_record` VALUES ('1264', '869064032601870898600a215163a465746', 'rESQtswdK9wO0cxD', '1540363266', '1540363266', '1');
INSERT INTO `machine_record` VALUES ('1265', '865413030123319', 'rESQtswdK9wO0cxD', '1540363893', '1540363893', '1');
INSERT INTO `machine_record` VALUES ('1266', '864510021809523', 'rESQtswdK9wO0cxD', '1540373246', '1540373246', '1');
INSERT INTO `machine_record` VALUES ('1267', '867995022430576898600f7189443981033', 'rESQtswdK9wO0cxD', '1540373415', '1540373415', '1');
INSERT INTO `machine_record` VALUES ('1268', '862532027458073', 'rESQtswdK9wO0cxD', '1540376582', '1540376582', '1');
INSERT INTO `machine_record` VALUES ('1269', 'A000005641EE53', 'rESQtswdK9wO0cxD', '1540378253', '1540378253', '1');
INSERT INTO `machine_record` VALUES ('1270', '86695903804401289860087141472059779', 'rESQtswdK9wO0cxD', '1540380054', '1540380054', '1');
INSERT INTO `machine_record` VALUES ('1271', '96519376868834289860069762525964732', 'rESQtswdK9wO0cxD', '1540380478', '1540380478', '1');
INSERT INTO `machine_record` VALUES ('1272', '862980036555803', 'rESQtswdK9wO0cxD', '1540382166', '1540382166', '1');
INSERT INTO `machine_record` VALUES ('1273', '86580803931461289860117890033404273', 'rESQtswdK9wO0cxD', '1540385558', '1540385558', '1');
INSERT INTO `machine_record` VALUES ('1274', '861206033535148', 'rESQtswdK9wO0cxD', '1540387469', '1540387469', '1');
INSERT INTO `machine_record` VALUES ('1275', 'ida53424af-4e50-47bc-baa2-5a932d56d288', 'rESQtswdK9wO0cxD', '1540387768', '1540387768', '1');
INSERT INTO `machine_record` VALUES ('1276', '867977039946950898600a0317883096919', 'rESQtswdK9wO0cxD', '1540389255', '1540389255', '1');
INSERT INTO `machine_record` VALUES ('1277', 'HYY6R18523000697', 'rESQtswdK9wO0cxD', '1540390448', '1540390448', '1');
INSERT INTO `machine_record` VALUES ('1278', '864459032913405898600760915F5140211', 'rESQtswdK9wO0cxD', '1540391261', '1540391261', '1');
INSERT INTO `machine_record` VALUES ('1279', '86803803610067689860076201450687523', 'rESQtswdK9wO0cxD', '1540397458', '1540397458', '1');
INSERT INTO `machine_record` VALUES ('1280', '86437303680659089860117810041021166', 'rESQtswdK9wO0cxD', '1540419375', '1540419375', '1');
INSERT INTO `machine_record` VALUES ('1281', '8643350303109948986008822168AF35493', 'rESQtswdK9wO0cxD', '1540421562', '1540421562', '1');
INSERT INTO `machine_record` VALUES ('1282', '866399037669040', 'rESQtswdK9wO0cxD', '1540428562', '1540428562', '1');
INSERT INTO `machine_record` VALUES ('1283', '666660940223122', 'rESQtswdK9wO0cxD', '1540432035', '1540432035', '1');
INSERT INTO `machine_record` VALUES ('1284', '860923682156758543258187126', 'rESQtswdK9wO0cxD', '1540437075', '1540437075', '1');
INSERT INTO `machine_record` VALUES ('1285', '350892263456279113860517674', 'rESQtswdK9wO0cxD', '1540438882', '1540438882', '1');
INSERT INTO `machine_record` VALUES ('1286', '86370703819327889860027201250126396', 'rESQtswdK9wO0cxD', '1540439219', '1540439219', '1');
INSERT INTO `machine_record` VALUES ('1287', '85954975313158489860096130416149805', 'rESQtswdK9wO0cxD', '1540440592', '1540440592', '1');
INSERT INTO `machine_record` VALUES ('1288', '86507202288191989860097211590181888', 'rESQtswdK9wO0cxD', '1540444137', '1540444137', '1');
INSERT INTO `machine_record` VALUES ('1289', '865881026707627', 'rESQtswdK9wO0cxD', '1540447120', '1540447120', '1');
INSERT INTO `machine_record` VALUES ('1290', '83891611303130489860011758934360045', 'rESQtswdK9wO0cxD', '1540457184', '1540457184', '1');
INSERT INTO `machine_record` VALUES ('1291', '9900071202275089860316965128361270', 'rESQtswdK9wO0cxD', '1540459627', '1540459627', '1');
INSERT INTO `machine_record` VALUES ('1292', '86618903018279889860025128486754573', 'rESQtswdK9wO0cxD', '1540459708', '1540459708', '1');
INSERT INTO `machine_record` VALUES ('1293', '86407203564973489860115810013709675', 'rESQtswdK9wO0cxD', '1540461343', '1540461343', '1');
INSERT INTO `machine_record` VALUES ('1294', '864313031221551898602A3031800800237', 'rESQtswdK9wO0cxD', '1540461975', '1540461975', '1');
INSERT INTO `machine_record` VALUES ('1295', '860889035687230', 'rESQtswdK9wO0cxD', '1540465568', '1540465568', '1');
INSERT INTO `machine_record` VALUES ('1296', '86246703560529289860116817046953120', 'rESQtswdK9wO0cxD', '1540469400', '1540469400', '1');
INSERT INTO `machine_record` VALUES ('1297', '86402203702775189860029031500120347', 'rESQtswdK9wO0cxD', '1540469413', '1540469413', '1');
INSERT INTO `machine_record` VALUES ('1298', '86311503402645289860115817090463589', 'rESQtswdK9wO0cxD', '1540470843', '1540470843', '1');
INSERT INTO `machine_record` VALUES ('1299', '86640103315928989860072191509952686', 'rESQtswdK9wO0cxD', '1540475778', '1540475778', '1');
INSERT INTO `machine_record` VALUES ('1300', '86583003847678889860051084592639521', 'rESQtswdK9wO0cxD', '1540476041', '1540476041', '1');
INSERT INTO `machine_record` VALUES ('1301', '86612303333665589860010061845000738', 'rESQtswdK9wO0cxD', '1540478980', '1540478980', '1');
INSERT INTO `machine_record` VALUES ('1302', '867008033960274898600501617F0609448', 'rESQtswdK9wO0cxD', '1540495547', '1540495547', '1');
INSERT INTO `machine_record` VALUES ('1303', '863316030939900898600091615f0034021', 'rESQtswdK9wO0cxD', '1540495843', '1540495843', '1');
INSERT INTO `machine_record` VALUES ('1304', '86191303252329489860114925360047056', 'rESQtswdK9wO0cxD', '1540497667', '1540497667', '1');
INSERT INTO `machine_record` VALUES ('1305', '862504038929939898600b7201850396192', 'rESQtswdK9wO0cxD', '1540503828', '1540503828', '1');
INSERT INTO `machine_record` VALUES ('1306', '866361020325295', 'rESQtswdK9wO0cxD', '1540517205', '1540517205', '1');
INSERT INTO `machine_record` VALUES ('1307', '866978025713686898602A8211740015737', 'rESQtswdK9wO0cxD', '1540519459', '1540519459', '1');
INSERT INTO `machine_record` VALUES ('1308', '866493035372317898600A3031700322186', 'rESQtswdK9wO0cxD', '1540537791', '1540537791', '1');
INSERT INTO `machine_record` VALUES ('1309', '89860118801272329286', 'rESQtswdK9wO0cxD', '1540542278', '1540542278', '1');
INSERT INTO `machine_record` VALUES ('1310', '86727502171917489860010071497980137', 'rESQtswdK9wO0cxD', '1540544879', '1540544879', '1');
INSERT INTO `machine_record` VALUES ('1311', '862504031302043898607a51208f5860594', 'rESQtswdK9wO0cxD', '1540546584', '1540546584', '1');
INSERT INTO `machine_record` VALUES ('1312', '356629063090464', 'rESQtswdK9wO0cxD', '1540552002', '1540552002', '1');
INSERT INTO `machine_record` VALUES ('1313', '869027028014473', 'rESQtswdK9wO0cxD', '1540554819', '1540554819', '1');
INSERT INTO `machine_record` VALUES ('1314', '86945603532793589861117147760444503', 'rESQtswdK9wO0cxD', '1540561529', '1540561529', '1');
INSERT INTO `machine_record` VALUES ('1315', '869809037536715898600c31618f2781172', 'rESQtswdK9wO0cxD', '1540561890', '1540561890', '1');
INSERT INTO `machine_record` VALUES ('1316', '861142035032687', 'rESQtswdK9wO0cxD', '1540564852', '1540564852', '1');
INSERT INTO `machine_record` VALUES ('1317', '86439603745163789860117885004764101', 'rESQtswdK9wO0cxD', '1540565413', '1540565413', '1');
INSERT INTO `machine_record` VALUES ('1318', '86474303841573389860067111459011905', 'rESQtswdK9wO0cxD', '1540572536', '1540572536', '1');
INSERT INTO `machine_record` VALUES ('1319', 'id0480b777-0598-471c-a966-5def8698005d', 'rESQtswdK9wO0cxD', '1540572947', '1540572947', '1');
INSERT INTO `machine_record` VALUES ('1320', '35477906244632489860050188790835434', 'rESQtswdK9wO0cxD', '1540586057', '1540586057', '1');
INSERT INTO `machine_record` VALUES ('1321', '865280038027118', 'rESQtswdK9wO0cxD', '1540599632', '1540599632', '1');
INSERT INTO `machine_record` VALUES ('1322', '862885033581225898602a11614f0219318', 'rESQtswdK9wO0cxD', '1540600988', '1540600988', '1');
INSERT INTO `machine_record` VALUES ('1323', '863343025869850', 'rESQtswdK9wO0cxD', '1540604680', '1540604680', '1');
INSERT INTO `machine_record` VALUES ('1324', '868854021802286898600F6201450922311', 'rESQtswdK9wO0cxD', '1540608628', '1540608628', '1');
INSERT INTO `machine_record` VALUES ('1325', '8667040401223358986001615184A428147', 'rESQtswdK9wO0cxD', '1540609644', '1540609644', '1');
INSERT INTO `machine_record` VALUES ('1326', '86612303011715789860317243703955349', 'rESQtswdK9wO0cxD', '1540615012', '1540615012', '1');
INSERT INTO `machine_record` VALUES ('1327', '86713203724271989860017141471202976', 'rESQtswdK9wO0cxD', '1540616838', '1540616838', '1');
INSERT INTO `machine_record` VALUES ('1328', 'X6GNU17612100409', 'rESQtswdK9wO0cxD', '1540617436', '1540617436', '1');
INSERT INTO `machine_record` VALUES ('1329', '869514035543339898600f5101850273110', 'rESQtswdK9wO0cxD', '1540617775', '1540617775', '1');
INSERT INTO `machine_record` VALUES ('1330', '86684103094504289860062211590263480', 'rESQtswdK9wO0cxD', '1540620270', '1540620270', '1');
INSERT INTO `machine_record` VALUES ('1331', '865724033310995', 'rESQtswdK9wO0cxD', '1540624640', '1540624640', '1');
INSERT INTO `machine_record` VALUES ('1332', '867455038004279898600C0101450108126', 'rESQtswdK9wO0cxD', '1540626981', '1540626981', '1');
INSERT INTO `machine_record` VALUES ('1333', '8631590348828608921303111672149174F', 'rESQtswdK9wO0cxD', '1540633106', '1540633106', '1');
INSERT INTO `machine_record` VALUES ('1334', '867086020754819', 'rESQtswdK9wO0cxD', '1540634708', '1540634708', '1');
INSERT INTO `machine_record` VALUES ('1335', '868918030129716898600601615F1552714', 'rESQtswdK9wO0cxD', '1540642464', '1540642464', '1');
INSERT INTO `machine_record` VALUES ('1336', '86969803087521689860116818030191370', 'rESQtswdK9wO0cxD', '1540643120', '1540643120', '1');
INSERT INTO `machine_record` VALUES ('1337', '860241033576504898600a215177a159180', 'rESQtswdK9wO0cxD', '1540645346', '1540645346', '1');
INSERT INTO `machine_record` VALUES ('1338', '865372021994949', 'rESQtswdK9wO0cxD', '1540650889', '1540650889', '1');
INSERT INTO `machine_record` VALUES ('1339', '86629503878471589860064085824603487', 'rESQtswdK9wO0cxD', '1540652560', '1540652560', '1');
INSERT INTO `machine_record` VALUES ('1340', '86088703318767489860116871040043628', 'rESQtswdK9wO0cxD', '1540652581', '1540652581', '1');
INSERT INTO `machine_record` VALUES ('1341', '86160803108331289860031061885023289', 'rESQtswdK9wO0cxD', '1540655040', '1540655040', '1');
INSERT INTO `machine_record` VALUES ('1342', '86778804711110189860117871044129497', 'rESQtswdK9wO0cxD', '1540660177', '1540660177', '1');
INSERT INTO `machine_record` VALUES ('1343', '86931203405001289860031084454668729', 'rESQtswdK9wO0cxD', '1540667017', '1540667017', '1');
INSERT INTO `machine_record` VALUES ('1344', '862971031308595898602a4071543955690', 'rESQtswdK9wO0cxD', '1540676263', '1540676263', '1');
INSERT INTO `machine_record` VALUES ('1345', '8682280345918408986006722154ca59383', 'rESQtswdK9wO0cxD', '1540682505', '1540682505', '1');
INSERT INTO `machine_record` VALUES ('1346', '866525023537086', 'rESQtswdK9wO0cxD', '1540699909', '1540699909', '1');
INSERT INTO `machine_record` VALUES ('1347', 'A00000681734CE89860318245134659696', 'rESQtswdK9wO0cxD', '1540713459', '1540713459', '1');
INSERT INTO `machine_record` VALUES ('1348', '86869802510409489860029261779586654', 'rESQtswdK9wO0cxD', '1540719087', '1540719087', '1');
INSERT INTO `machine_record` VALUES ('1349', '86736703769971289860318248720521544', 'rESQtswdK9wO0cxD', '1540720489', '1540720489', '1');
INSERT INTO `machine_record` VALUES ('1350', 'id09b2ad9d-d9d6-4436-a9a4-9c374d775dec', 'rESQtswdK9wO0cxD', '1540722966', '1540722966', '1');
INSERT INTO `machine_record` VALUES ('1351', '864335032874757898600B4061795789909', 'rESQtswdK9wO0cxD', '1540726189', '1540726189', '1');
INSERT INTO `machine_record` VALUES ('1352', '867668027366547898600b3041659480112', 'rESQtswdK9wO0cxD', '1540738652', '1540738652', '1');
INSERT INTO `machine_record` VALUES ('1353', '86650903340777989860083191455003001', 'rESQtswdK9wO0cxD', '1540739028', '1540739028', '1');
INSERT INTO `machine_record` VALUES ('1354', '86366203652696389860117817052036082', 'rESQtswdK9wO0cxD', '1540759784', '1540759784', '1');
INSERT INTO `machine_record` VALUES ('1355', '97813939999715089860086220918023923', 'rESQtswdK9wO0cxD', '1540784213', '1540784213', '1');
INSERT INTO `machine_record` VALUES ('1356', '86711201048901689860081014890182932', 'rESQtswdK9wO0cxD', '1540794949', '1540794949', '1');
INSERT INTO `machine_record` VALUES ('1357', '86044103728295689860029187586264673', 'rESQtswdK9wO0cxD', '1540799585', '1540799585', '2');
INSERT INTO `machine_record` VALUES ('1358', '869555022225075898600651314f7000144', 'rESQtswdK9wO0cxD', '1540801545', '1540801545', '1');
INSERT INTO `machine_record` VALUES ('1359', '008796752856277', 'rESQtswdK9wO0cxD', '1540803031', '1540803031', '2');
INSERT INTO `machine_record` VALUES ('1360', '86768503990634289860115817039536495', 'rESQtswdK9wO0cxD', '1540806794', '1540806794', '1');
INSERT INTO `machine_record` VALUES ('1361', '9900121656394089860318957550000763', 'rESQtswdK9wO0cxD', '1540815852', '1540815852', '1');
INSERT INTO `machine_record` VALUES ('1362', '867179023338233898600c7189433374800', 'rESQtswdK9wO0cxD', '1540817407', '1540817407', '1');
INSERT INTO `machine_record` VALUES ('1363', '357000075154319', 'rESQtswdK9wO0cxD', '1540820825', '1540820825', '1');
INSERT INTO `machine_record` VALUES ('1364', '86725103533940889860118801043560169', 'rESQtswdK9wO0cxD', '1540854047', '1540854047', '1');
INSERT INTO `machine_record` VALUES ('1365', '86403503761542589860316147760186881', 'rESQtswdK9wO0cxD', '1540866286', '1540866286', '1');
INSERT INTO `machine_record` VALUES ('1366', '863055037590858898600b8211840250847', 'rESQtswdK9wO0cxD', '1540871321', '1540871321', '1');
INSERT INTO `machine_record` VALUES ('1367', '86423203985449689860004056957459480', 'rESQtswdK9wO0cxD', '1540872328', '1540872328', '1');
INSERT INTO `machine_record` VALUES ('1368', '86931203417235289860118801478419279', 'rESQtswdK9wO0cxD', '1540924585', '1540924585', '1');
INSERT INTO `machine_record` VALUES ('1369', '990011845084708986000615158a547105', 'rESQtswdK9wO0cxD', '1540947298', '1540947298', '1');
INSERT INTO `machine_record` VALUES ('1370', '35526604592685289110043618302330518', 'rESQtswdK9wO0cxD', '1540959488', '1540959488', '1');
INSERT INTO `machine_record` VALUES ('1371', '86087103789432989860088271555570683', 'rESQtswdK9wO0cxD', '1540969488', '1540969488', '1');
INSERT INTO `machine_record` VALUES ('1372', '9900102487214989860317253711268502', 'rESQtswdK9wO0cxD', '1540977113', '1540977113', '1');
INSERT INTO `machine_record` VALUES ('1373', '86971703213119489860317247745099602', 'rESQtswdK9wO0cxD', '1540978549', '1540978549', '1');
INSERT INTO `machine_record` VALUES ('1374', '86282803344451589860087201670010042', 'rESQtswdK9wO0cxD', '1540989335', '1540989335', '1');
INSERT INTO `machine_record` VALUES ('1375', '866538043912999898600F1189446290123', 'rESQtswdK9wO0cxD', '1540991615', '1540991615', '1');
INSERT INTO `machine_record` VALUES ('1376', '86622903986272589860000191808991826', 'rESQtswdK9wO0cxD', '1540992686', '1540992686', '1');
INSERT INTO `machine_record` VALUES ('1377', '86996603272884489860113325101233399', 'rESQtswdK9wO0cxD', '1541006141', '1541006141', '1');
INSERT INTO `machine_record` VALUES ('1378', '86226103531792989860117801460394432', 'rESQtswdK9wO0cxD', '1541017869', '1541017869', '1');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `description` mediumtext,
  `app_id` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '如何获取更多的金币？', '1', '<p>\r\n	首先需要坚持完成每天的日常任务，其次不断邀请好友加入听玩，最后是分享听玩给更多的好友知道，他们点击之后您即可获取更多金币。\r\n</p>\r\n<p>\r\n	更多获取金币的方式正在研发中，敬请期待！\r\n</p>', 'rESQtswdK9wO0cxD', '1533022811', '1533022811');
INSERT INTO `news` VALUES ('2', '金币是什么？', '1', '金币是听玩中的货币单位，您可以将金币收益兑换成零钱进行微信、支付宝的提现。', 'rESQtswdK9wO0cxD', '1533023020', '1533023020');
INSERT INTO `news` VALUES ('3', '如何查看金币明细？', '1', '点击我的→“今日金币”按钮，点击打开就能看到金币明细，至多可看100条。', 'rESQtswdK9wO0cxD', '1533023022', '1533023065');
INSERT INTO `news` VALUES ('4', '如何邀请好友？', '1', '点击我的→“邀请好友”按钮，点击打开之后，可以使用朋友圈、微信群等方式，分享给好友。或者直接复制“我的邀请码”发送给好友，邀请Ta下载注册使用听玩即可。<br />\r\n<div>\r\n	<br />\r\n</div>', 'rESQtswdK9wO0cxD', '1533023022', '1533023076');
INSERT INTO `news` VALUES ('5', '邀请码是什么？', '1', '邀请码是您在听玩的身份的标识。如果您已经注册听玩，那么您可以打开您的“邀请好友”页面，复制您的邀请码，发送给您的朋友，让他们通过填写您的邀请码变成您的好友，您即可获得邀请的金币收益，并且他们阅读咨询时也会给您缴纳一定的提成收益。', 'rESQtswdK9wO0cxD', '1533023022', '1533023095');
INSERT INTO `news` VALUES ('6', '如何提现？', '2', '点击我的→“提现兑换”按钮，点击打开之后即可提现。接第三方收款流程通知，绑定支付宝＆微信进行提现行为之前，须您填写对应的账号信息以及身份证号码，进行实名认证操作。', 'rESQtswdK9wO0cxD', '1533023022', '1533023112');
INSERT INTO `news` VALUES ('7', '支付宝怎么提现？', '2', '须绑定支付宝账号，按页面提示进行绑定。填写真实姓名、支付宝账号以及您的身份证账号信息，完成实名认证之后进行绑定。绑定成功之后返回至当前页面，选择可提现的金额进行提现。', 'rESQtswdK9wO0cxD', '1533023027', '1533023130');
INSERT INTO `news` VALUES ('8', '微信怎么提现？', '2', '须绑定微信账号，按页面提示操作跳转至微信进行绑定。填写真实的姓名、您的身份证账号信息，完成实名认证之后进行绑定。绑定成功之后返回至当前页面，选择可提现的金额进行提现。', 'rESQtswdK9wO0cxD', '1533023027', '1533023152');
INSERT INTO `news` VALUES ('9', '提现帮助', '3', '<h2>\r\n	<b>提现帮助</b> \r\n</h2>\r\n<p class=\"MsoNormal\">\r\n	<b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	今天我们来学习一下如何提现。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	目前听玩支持2<span>种体现方式，有微信、支付宝。现在我们根据不同的提现版块来学习如何成功提现。</span> \r\n</p>\r\n<h3>\r\n	<b><span>提现方式</span>1<span>：微信</span></b> \r\n</h3>\r\n<p class=\"MsoNormal\">\r\n	<b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>首先，点击</span>“去绑定”按钮，进入页面。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/upload/image/20180801/20180801113942_53383.png\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	按照需求填写真实的姓名和身份证号<span>，然后点击</span>“去授权”。“去授权”之前，我们需要关注“<span>听玩手游宝</span>”的微信公众号。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>点击下方的打开微信，戳一下顶部搜索栏，然后选择</span>“公众号”，接着输入“<span>听玩手游宝</span>”，点击查看<span>听完手游宝</span>的主页，点击页面下方的关注就好啦。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>关注成功后，</span>“<span>听玩手游宝</span>”就会给您自动发送一条“授权链接”，直接点击授权即可。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>微信内的操作完成之后，我们回到</span>“听玩”<span>app</span><span>，点击“去授权”按钮。</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>授权完成后，页面会自动回到</span>“听玩”页面，点击下一步。此时弹窗会告知您“授权成功，可以微信提现啦。”\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>提现申请提交之后，微信是以</span>“<span>听玩手游宝</span>”公众号给您发送红包的形式为您转账，过期未领取的红包会退回至您的听玩零钱账户。\r\n</p>\r\n<h3>\r\n	<b><span>提现方式</span>2<span>：支付宝</span></b> \r\n</h3>\r\n<p class=\"MsoNormal\">\r\n	<b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>支付宝的认证流程比较简单，点击</span>“去绑定”按钮。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/upload/image/20180801/20180801114232_30117.png\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	根据页面提示填写真实姓名、身份证号以及支付宝账号。填写完毕之后，确认认证即可。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	此时页面会变更成“已认证”状态，这时您就能提现到支付宝拉。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	支付宝是以直接打款的方式为您转账，您需要自行查看支付宝账单记录。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	注：\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	1.&nbsp;实名认证仅作账户提现使用，信息保密，请您放心；\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	2.&nbsp;以上提现账户，一经绑定，无法自行修改<span>。如有问题，请直接联系</span>“<span>听玩手游宝</span>”微信公众号客服小姐姐。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	3.&nbsp;提现1<span>个工作日</span>内到账，遇国家法定节假日顺延，请大家合理安排提现时间，提现后耐心等待，请勿催促。\r\n</p>', 'rESQtswdK9wO0cxD', '1533023033', '1536213023');
INSERT INTO `news` VALUES ('10', '如何使用', '3', '<h3>\r\n	邀请码是什么？\r\n</h3>\r\n<p>\r\n	<span>邀请码是您在听玩游戏宝的身份标识。</span>\r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/20180801/20180801111050_55293.png\" alt=\"\" />\r\n</p>\r\n<h3>\r\n	邀请码怎么用？\r\n</h3>\r\n<p>\r\n	分享邀请码给微信好友或安装了听玩游戏宝的好友，安装后输入你的邀请码完成邀请。\r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/20180801/20180801113554_96302.png\" alt=\"\" />\r\n</p>', 'rESQtswdK9wO0cxD', '1533027943', '1533094558');

-- ----------------------------
-- Table structure for `power`
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0',
  `level` int(10) NOT NULL DEFAULT '0',
  `path` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '权限名称',
  `uris` varchar(255) NOT NULL COMMENT '权限路径',
  `status` char(1) NOT NULL COMMENT '是否有效',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '0', '1', '0,1', '管理员管理', 'admin', '1', '1541043199', '1541043199');
INSERT INTO `power` VALUES ('2', '1', '2', '0,1,2', '修改', 'admin/edit', '1', '1541051389', '1541051389');
INSERT INTO `power` VALUES ('3', '1', '2', '0,1,3', '新增', 'admin/create', '1', '1541043199', '1541043199');
INSERT INTO `power` VALUES ('6', '0', '1', '0,6', '会员管理', 'admin/user', '1', '1541137052', '1541137052');
INSERT INTO `power` VALUES ('10', '1', '2', '0,1,10', '删除', 'admin/delete', '1', '1541137892', '1541137892');
INSERT INTO `power` VALUES ('11', '1', '2', '0,1,11', '启用/停用', 'admin/admin_status', '1', '1541138337', '1541138337');
INSERT INTO `power` VALUES ('12', '1', '2', '0,1,12', '查看', 'admin/lists', '1', '1541138393', '1541138393');
INSERT INTO `power` VALUES ('13', '6', '2', '0,6,13', '用户列表', 'admin/user/lists', '1', '1541139111', '1541139111');
INSERT INTO `power` VALUES ('14', '0', '1', '0,14', 'APP管理', 'admin/app', '1', '1541139160', '1541139160');
INSERT INTO `power` VALUES ('15', '0', '1', '0,15', '任务管理', 'admin/task', '1', '1541139252', '1541139252');
INSERT INTO `power` VALUES ('16', '0', '1', '0,16', '邀请管理', 'admin/invite', '1', '1541139323', '1541139323');
INSERT INTO `power` VALUES ('17', '0', '1', '0,17', '签到管理', 'admin/sign', '1', '1541139355', '1541139355');
INSERT INTO `power` VALUES ('18', '0', '1', '0,18', '文章系统', 'admin/news', '1', '1541139368', '1541139368');
INSERT INTO `power` VALUES ('19', '0', '1', '0,19', '分享系统', 'admin/share', '1', '1541139401', '1541139401');
INSERT INTO `power` VALUES ('20', '0', '1', '0,20', '提现中心', 'admin/withraw', '1', '1541139420', '1541139420');
INSERT INTO `power` VALUES ('21', '14', '2', '0,14,21', '查看APP列表', 'admin/app/show', '1', '1541139535', '1541139535');
INSERT INTO `power` VALUES ('22', '14', '2', '0,14,22', '申请接口', 'admin/app/apply', '1', '1541139557', '1541139557');
INSERT INTO `power` VALUES ('23', '14', '2', '0,14,23', '查看分类', 'admin/category', '1', '1541139688', '1541140007');
INSERT INTO `power` VALUES ('24', '14', '2', '0,14,24', '新增分类', 'admin/category/create', '1', '1541139709', '1541140018');
INSERT INTO `power` VALUES ('25', '14', '2', '0,14,25', '修改分类', 'admin/category/edit', '1', '1541139739', '1541140027');
INSERT INTO `power` VALUES ('26', '14', '2', '0,14,26', '删除分类', 'admin/category/delete', '1', '1541139764', '1541140034');
INSERT INTO `power` VALUES ('27', '15', '2', '0,15,27', '查看', 'admin/task/show', '1', '1541140584', '1541140584');
INSERT INTO `power` VALUES ('28', '15', '2', '0,15,28', '新增', 'admin/task/create', '1', '1541140608', '1541140608');
INSERT INTO `power` VALUES ('29', '15', '2', '0,15,29', '修改', 'admin/task/edit', '1', '1541140626', '1541140626');
INSERT INTO `power` VALUES ('30', '15', '2', '0,15,30', '删除', 'admin/task/delete', '1', '1541140681', '1541140681');
INSERT INTO `power` VALUES ('31', '15', '2', '0,15,31', '批量删除', 'admin/task/delete_all', '1', '1541140766', '1541140766');
INSERT INTO `power` VALUES ('32', '15', '2', '0,15,32', '启用/停用', 'admin/task_status', '1', '1541140807', '1541140807');
INSERT INTO `power` VALUES ('33', '15', '2', '0,15,33', '查看任务记录', 'admin/task/do_lists', '1', '1541140903', '1541140903');
INSERT INTO `power` VALUES ('34', '16', '2', '0,16,34', '设置邀请', 'admin/invite/set', '1', '1541141044', '1541141044');
INSERT INTO `power` VALUES ('35', '16', '2', '0,16,35', '查看金币日志', 'admin/coins/show', '1', '1541141082', '1541141082');
INSERT INTO `power` VALUES ('36', '17', '2', '0,17,36', '设置签到', 'admin/sign/set', '1', '1541141105', '1541141105');
INSERT INTO `power` VALUES ('37', '18', '2', '0,18,37', '查看', 'news/show', '1', '1541141164', '1541141164');
INSERT INTO `power` VALUES ('38', '18', '2', '0,18,38', '新增', 'admin/news/create', '1', '1541141258', '1541141258');
INSERT INTO `power` VALUES ('39', '18', '2', '0,18,39', '修改', 'admin/news/edit', '1', '1541141283', '1541141283');
INSERT INTO `power` VALUES ('40', '18', '2', '0,18,40', '删除', 'admin/news/delete', '1', '1541141305', '1541141305');
INSERT INTO `power` VALUES ('41', '18', '2', '0,18,41', '批量删除', 'admin/news/delete_all', '1', '1541141328', '1541141328');
INSERT INTO `power` VALUES ('42', '19', '2', '0,19,42', '查看', 'admin/share/show', '1', '1541141436', '1541141436');
INSERT INTO `power` VALUES ('43', '19', '2', '0,19,43', '新增', 'admin/share/create', '1', '1541141451', '1541141451');
INSERT INTO `power` VALUES ('44', '19', '2', '0,19,44', '修改', 'admin/share/edit', '1', '1541141504', '1541141504');
INSERT INTO `power` VALUES ('45', '19', '2', '0,19,45', '删除', 'admin/share/delete', '1', '1541141521', '1541141521');
INSERT INTO `power` VALUES ('46', '19', '2', '0,19,46', '批量删除', 'admin/share/delete_all', '1', '1541141549', '1541141549');
INSERT INTO `power` VALUES ('47', '20', '2', '0,20,47', '查看', 'admin/withdraw/show', '1', '1541141580', '1541141580');
INSERT INTO `power` VALUES ('48', '20', '2', '0,20,48', '派发红包', 'admin/packet/send', '1', '1541141677', '1541141677');
INSERT INTO `power` VALUES ('49', '20', '2', '0,20,49', '拒绝发放', 'admin/packet/reject', '1', '1541141710', '1541141710');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '是否可用',
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '拥有至高无上的权利!', '1', '1541059018', '1541059018');
INSERT INTO `role` VALUES ('2', '项目经理', '有点小权利哦!', '1', '1541059067', '1541151362');
INSERT INTO `role` VALUES ('3', 'APP编辑', '可亲起爱的小编通知....', '1', '1541144411', '1541150923');
INSERT INTO `role` VALUES ('4', 'APP组长', '编辑小可爱们的头头儿...', '1', '1541144585', '1541144585');

-- ----------------------------
-- Table structure for `role_power`
-- ----------------------------
DROP TABLE IF EXISTS `role_power`;
CREATE TABLE `role_power` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `power_id` int(10) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_power
-- ----------------------------
INSERT INTO `role_power` VALUES ('1', '1', '1');
INSERT INTO `role_power` VALUES ('2', '1', '2');
INSERT INTO `role_power` VALUES ('4', '1', '3');
INSERT INTO `role_power` VALUES ('6', '3', '12');
INSERT INTO `role_power` VALUES ('7', '3', '13');
INSERT INTO `role_power` VALUES ('8', '3', '21');
INSERT INTO `role_power` VALUES ('9', '3', '27');
INSERT INTO `role_power` VALUES ('10', '3', '35');
INSERT INTO `role_power` VALUES ('11', '3', '37');
INSERT INTO `role_power` VALUES ('12', '3', '42');
INSERT INTO `role_power` VALUES ('13', '3', '47');
INSERT INTO `role_power` VALUES ('14', '4', '2');
INSERT INTO `role_power` VALUES ('15', '4', '3');
INSERT INTO `role_power` VALUES ('16', '4', '13');
INSERT INTO `role_power` VALUES ('17', '4', '21');
INSERT INTO `role_power` VALUES ('18', '4', '23');
INSERT INTO `role_power` VALUES ('19', '4', '27');
INSERT INTO `role_power` VALUES ('20', '4', '28');
INSERT INTO `role_power` VALUES ('21', '4', '29');
INSERT INTO `role_power` VALUES ('22', '4', '34');
INSERT INTO `role_power` VALUES ('23', '4', '36');
INSERT INTO `role_power` VALUES ('24', '4', '37');
INSERT INTO `role_power` VALUES ('25', '4', '42');
INSERT INTO `role_power` VALUES ('26', '4', '47');
INSERT INTO `role_power` VALUES ('29', '2', '2');
INSERT INTO `role_power` VALUES ('30', '2', '12');
INSERT INTO `role_power` VALUES ('31', '2', '37');
INSERT INTO `role_power` VALUES ('32', '2', '44');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-启用,2-禁用',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('2', '边玩游戏边赚钱', '快来听玩游戏宝，玩玩游戏就能赚钱，真的可以提现成功，你也来试试吧。', './upload/image/20180802/d2a3c0b2730ad482a440bdf0f936bd3c.png', 'http://www.tingwan.com/download/', '1', '1533195929', '1539845476');

-- ----------------------------
-- Table structure for `sign_log`
-- ----------------------------
DROP TABLE IF EXISTS `sign_log`;
CREATE TABLE `sign_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `coin` int(10) NOT NULL,
  `app_id` varchar(200) NOT NULL,
  `total_num` int(10) DEFAULT '0',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_log
-- ----------------------------
INSERT INTO `sign_log` VALUES ('1', '1244', '50', 'rESQtswdK9wO0cxD', '1', '1534390137', '1534390137');
INSERT INTO `sign_log` VALUES ('2', '1289', '50', 'rESQtswdK9wO0cxD', '0', '1534390355', '1534728707');
INSERT INTO `sign_log` VALUES ('3', '1139', '50', 'rESQtswdK9wO0cxD', '0', '1534403848', '1534559073');
INSERT INTO `sign_log` VALUES ('4', '1252', '50', 'rESQtswdK9wO0cxD', '1', '1534470908', '1534470908');
INSERT INTO `sign_log` VALUES ('5', '15', '50', 'jblRpcEzBBnmXpzq', '1', '1534476767', '1534476767');
INSERT INTO `sign_log` VALUES ('6', '9', '50', 'jblRpcEzBBnmXpzq', '1', '1534485116', '1534485116');
INSERT INTO `sign_log` VALUES ('7', '12', '50', 'jblRpcEzBBnmXpzq', '0', '1534490704', '1537172332');
INSERT INTO `sign_log` VALUES ('8', '16', '50', 'jblRpcEzBBnmXpzq', '0', '1534493897', '1534729767');
INSERT INTO `sign_log` VALUES ('9', '1225', '50', 'rESQtswdK9wO0cxD', '0', '1534557904', '1537012163');
INSERT INTO `sign_log` VALUES ('10', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1534559051', '1536237502');
INSERT INTO `sign_log` VALUES ('11', '1139', '50', 'rESQtswdK9wO0cxD', '0', '1534559073', '1535355963');
INSERT INTO `sign_log` VALUES ('12', '1289', '50', 'rESQtswdK9wO0cxD', '1', '1534728707', '1534728707');
INSERT INTO `sign_log` VALUES ('13', '16', '50', 'jblRpcEzBBnmXpzq', '0', '1534729767', '1534921167');
INSERT INTO `sign_log` VALUES ('14', '6', '50', 'jblRpcEzBBnmXpzq', '1', '1534731426', '1534731426');
INSERT INTO `sign_log` VALUES ('15', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1534733580', '1535509173');
INSERT INTO `sign_log` VALUES ('16', '13', '50', 'jblRpcEzBBnmXpzq', '1', '1534869511', '1534869511');
INSERT INTO `sign_log` VALUES ('17', '16', '50', 'jblRpcEzBBnmXpzq', '1', '1534921167', '1534921167');
INSERT INTO `sign_log` VALUES ('18', '1159', '50', 'rESQtswdK9wO0cxD', '1', '1535017480', '1535017480');
INSERT INTO `sign_log` VALUES ('19', '1153', '50', 'rESQtswdK9wO0cxD', '1', '1535036617', '1535036617');
INSERT INTO `sign_log` VALUES ('20', '1139', '50', 'rESQtswdK9wO0cxD', '1', '1535355963', '1535355963');
INSERT INTO `sign_log` VALUES ('21', '1303', '50', 'rESQtswdK9wO0cxD', '1', '1535433901', '1535433901');
INSERT INTO `sign_log` VALUES ('22', '1303', '100', 'rESQtswdK9wO0cxD', '2', '1535509016', '1535509016');
INSERT INTO `sign_log` VALUES ('23', '1151', '50', 'rESQtswdK9wO0cxD', '1', '1535509173', '1535509173');
INSERT INTO `sign_log` VALUES ('24', '1303', '660', 'rESQtswdK9wO0cxD', '0', '1535621019', '1535788327');
INSERT INTO `sign_log` VALUES ('25', '1151', '100', 'rESQtswdK9wO0cxD', '0', '1535621038', '1535788337');
INSERT INTO `sign_log` VALUES ('26', '1303', '50', 'rESQtswdK9wO0cxD', '0', '1535788327', '1536115341');
INSERT INTO `sign_log` VALUES ('27', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1535788337', '1536285517');
INSERT INTO `sign_log` VALUES ('28', '1303', '50', 'rESQtswdK9wO0cxD', '1', '1536115341', '1536115341');
INSERT INTO `sign_log` VALUES ('29', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1536237502', '1536237502');
INSERT INTO `sign_log` VALUES ('30', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1536285517', '1536543894');
INSERT INTO `sign_log` VALUES ('31', '1310', '50', 'rESQtswdK9wO0cxD', '1', '1536295683', '1536295683');
INSERT INTO `sign_log` VALUES ('32', '1292', '100', 'rESQtswdK9wO0cxD', '0', '1536311041', '1536567317');
INSERT INTO `sign_log` VALUES ('33', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1536543894', '1536717034');
INSERT INTO `sign_log` VALUES ('34', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1536567317', '1536567317');
INSERT INTO `sign_log` VALUES ('35', '1152', '50', 'rESQtswdK9wO0cxD', '1', '1536570854', '1536570854');
INSERT INTO `sign_log` VALUES ('36', '1292', '100', 'rESQtswdK9wO0cxD', '2', '1536630752', '1536630752');
INSERT INTO `sign_log` VALUES ('37', '1292', '660', 'rESQtswdK9wO0cxD', '3', '1536716348', '1536716348');
INSERT INTO `sign_log` VALUES ('38', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1536717034', '1537163780');
INSERT INTO `sign_log` VALUES ('39', '1292', '880', 'rESQtswdK9wO0cxD', '4', '1536825613', '1536825613');
INSERT INTO `sign_log` VALUES ('40', '1292', '150', 'rESQtswdK9wO0cxD', '0', '1536892987', '1537147777');
INSERT INTO `sign_log` VALUES ('41', '1225', '50', 'rESQtswdK9wO0cxD', '0', '1537012163', '1537243313');
INSERT INTO `sign_log` VALUES ('42', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1537147777', '1537147777');
INSERT INTO `sign_log` VALUES ('43', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1537163780', '1540258920');
INSERT INTO `sign_log` VALUES ('44', '12', '50', 'jblRpcEzBBnmXpzq', '0', '1537172332', '1539254438');
INSERT INTO `sign_log` VALUES ('45', '1292', '100', 'rESQtswdK9wO0cxD', '0', '1537233237', '1537500072');
INSERT INTO `sign_log` VALUES ('46', '1225', '50', 'rESQtswdK9wO0cxD', '1', '1537243313', '1537243313');
INSERT INTO `sign_log` VALUES ('47', '1305', '50', 'rESQtswdK9wO0cxD', '1', '1537247801', '1537247801');
INSERT INTO `sign_log` VALUES ('48', '1317', '50', 'rESQtswdK9wO0cxD', '1', '1537263211', '1537263211');
INSERT INTO `sign_log` VALUES ('49', '1225', '100', 'rESQtswdK9wO0cxD', '0', '1537341205', '1537589192');
INSERT INTO `sign_log` VALUES ('50', '1305', '100', 'rESQtswdK9wO0cxD', '2', '1537341246', '1537341246');
INSERT INTO `sign_log` VALUES ('51', '1318', '50', 'rESQtswdK9wO0cxD', '1', '1537358163', '1537358163');
INSERT INTO `sign_log` VALUES ('52', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1537500072', '1537736192');
INSERT INTO `sign_log` VALUES ('53', '1225', '50', 'rESQtswdK9wO0cxD', '0', '1537589192', '1539787187');
INSERT INTO `sign_log` VALUES ('54', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1537736192', '1537955747');
INSERT INTO `sign_log` VALUES ('55', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1537955747', '1538202561');
INSERT INTO `sign_log` VALUES ('56', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1538202561', '1538202561');
INSERT INTO `sign_log` VALUES ('57', '1328', '50', 'rESQtswdK9wO0cxD', '0', '1538284850', '1539157189');
INSERT INTO `sign_log` VALUES ('58', '1292', '100', 'rESQtswdK9wO0cxD', '0', '1538285555', '1538507486');
INSERT INTO `sign_log` VALUES ('59', '1330', '50', 'rESQtswdK9wO0cxD', '1', '1538360110', '1538360110');
INSERT INTO `sign_log` VALUES ('60', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1538507486', '1539054714');
INSERT INTO `sign_log` VALUES ('61', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1539054714', '1539436734');
INSERT INTO `sign_log` VALUES ('62', '1338', '50', 'rESQtswdK9wO0cxD', '1', '1539157077', '1539157077');
INSERT INTO `sign_log` VALUES ('63', '1328', '50', 'rESQtswdK9wO0cxD', '1', '1539157189', '1539157189');
INSERT INTO `sign_log` VALUES ('64', '1338', '100', 'rESQtswdK9wO0cxD', '2', '1539214107', '1539214107');
INSERT INTO `sign_log` VALUES ('65', '12', '50', 'jblRpcEzBBnmXpzq', '1', '1539254438', '1539254438');
INSERT INTO `sign_log` VALUES ('66', '1338', '660', 'rESQtswdK9wO0cxD', '3', '1539324563', '1539324563');
INSERT INTO `sign_log` VALUES ('67', '1344', '50', 'rESQtswdK9wO0cxD', '1', '1539350064', '1539350064');
INSERT INTO `sign_log` VALUES ('68', '1338', '880', 'rESQtswdK9wO0cxD', '4', '1539403450', '1539403450');
INSERT INTO `sign_log` VALUES ('69', '1345', '50', 'rESQtswdK9wO0cxD', '1', '1539424137', '1539424137');
INSERT INTO `sign_log` VALUES ('70', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1539436734', '1539609552');
INSERT INTO `sign_log` VALUES ('71', '1346', '50', 'rESQtswdK9wO0cxD', '1', '1539449842', '1539449842');
INSERT INTO `sign_log` VALUES ('72', '1347', '50', 'rESQtswdK9wO0cxD', '1', '1539488675', '1539488675');
INSERT INTO `sign_log` VALUES ('73', '1338', '150', 'rESQtswdK9wO0cxD', '0', '1539530439', '1539732336');
INSERT INTO `sign_log` VALUES ('74', '1292', '50', 'rESQtswdK9wO0cxD', '0', '1539609552', '1539766444');
INSERT INTO `sign_log` VALUES ('75', '1338', '50', 'rESQtswdK9wO0cxD', '0', '1539732336', '1540286631');
INSERT INTO `sign_log` VALUES ('76', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1539766444', '1539766444');
INSERT INTO `sign_log` VALUES ('77', '1348', '50', 'rESQtswdK9wO0cxD', '1', '1539776361', '1539776361');
INSERT INTO `sign_log` VALUES ('78', '1225', '50', 'rESQtswdK9wO0cxD', '0', '1539787187', '1539927744');
INSERT INTO `sign_log` VALUES ('79', '1292', '100', 'rESQtswdK9wO0cxD', '2', '1539851236', '1539851236');
INSERT INTO `sign_log` VALUES ('80', '1292', '660', 'rESQtswdK9wO0cxD', '0', '1539918332', '1540061832');
INSERT INTO `sign_log` VALUES ('81', '1225', '50', 'rESQtswdK9wO0cxD', '0', '1539927744', '1540189282');
INSERT INTO `sign_log` VALUES ('82', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1540061832', '1540061832');
INSERT INTO `sign_log` VALUES ('83', '1217', '50', 'rESQtswdK9wO0cxD', '1', '1540172182', '1540172182');
INSERT INTO `sign_log` VALUES ('84', '1292', '100', 'rESQtswdK9wO0cxD', '2', '1540175061', '1540175061');
INSERT INTO `sign_log` VALUES ('85', '1225', '50', 'rESQtswdK9wO0cxD', '0', '1540189282', '1540563001');
INSERT INTO `sign_log` VALUES ('86', '1292', '660', 'rESQtswdK9wO0cxD', '3', '1540258727', '1540258727');
INSERT INTO `sign_log` VALUES ('87', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1540258920', '1540679713');
INSERT INTO `sign_log` VALUES ('88', '1254', '50', 'rESQtswdK9wO0cxD', '1', '1540275675', '1540275675');
INSERT INTO `sign_log` VALUES ('89', '1338', '50', 'rESQtswdK9wO0cxD', '0', '1540286631', '1540455218');
INSERT INTO `sign_log` VALUES ('90', '1292', '880', 'rESQtswdK9wO0cxD', '0', '1540341719', '1540646883');
INSERT INTO `sign_log` VALUES ('91', '1237', '50', 'rESQtswdK9wO0cxD', '1', '1540437384', '1540437384');
INSERT INTO `sign_log` VALUES ('92', '1338', '50', 'rESQtswdK9wO0cxD', '0', '1540455218', '1540602882');
INSERT INTO `sign_log` VALUES ('93', '1364', '50', 'rESQtswdK9wO0cxD', '1', '1540497749', '1540497749');
INSERT INTO `sign_log` VALUES ('94', '1225', '50', 'rESQtswdK9wO0cxD', '1', '1540563001', '1540563001');
INSERT INTO `sign_log` VALUES ('95', '1338', '50', 'rESQtswdK9wO0cxD', '1', '1540602882', '1540602882');
INSERT INTO `sign_log` VALUES ('96', '1292', '50', 'rESQtswdK9wO0cxD', '1', '1540646883', '1540646883');
INSERT INTO `sign_log` VALUES ('97', '1151', '50', 'rESQtswdK9wO0cxD', '0', '1540679713', '1540830687');
INSERT INTO `sign_log` VALUES ('98', '1292', '100', 'rESQtswdK9wO0cxD', '2', '1540724754', '1540724754');
INSERT INTO `sign_log` VALUES ('99', '1160', '50', 'rESQtswdK9wO0cxD', '1', '1540729173', '1540729173');
INSERT INTO `sign_log` VALUES ('100', '1292', '660', 'rESQtswdK9wO0cxD', '3', '1540797754', '1540797754');
INSERT INTO `sign_log` VALUES ('101', '1151', '50', 'rESQtswdK9wO0cxD', '1', '1540830687', '1540830687');
INSERT INTO `sign_log` VALUES ('102', '1292', '880', 'rESQtswdK9wO0cxD', '4', '1540864041', '1540864041');
INSERT INTO `sign_log` VALUES ('103', '1292', '150', 'rESQtswdK9wO0cxD', '5', '1540970509', '1540970509');
INSERT INTO `sign_log` VALUES ('104', '1151', '100', 'rESQtswdK9wO0cxD', '2', '1540970513', '1540970513');
INSERT INTO `sign_log` VALUES ('105', '1368', '50', 'rESQtswdK9wO0cxD', '1', '1540978607', '1540978607');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `catid` int(11) NOT NULL COMMENT '任务分类',
  `type` int(1) NOT NULL COMMENT '1-新手,2-每日,3-永久',
  `task_mark` varchar(10) NOT NULL,
  `request_type` varchar(10) NOT NULL,
  `button_title` varchar(100) DEFAULT NULL,
  `start_time` int(10) DEFAULT NULL,
  `end_time` int(10) DEFAULT NULL,
  `reward_coin` int(10) NOT NULL COMMENT 'new-新,hot-热门,3-正常',
  `description` mediumtext,
  `add_admin` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-显示,2-隐藏',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `deleted_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '下载游戏赚金币', '2', '2', 'normal', '10', '下载游戏', '1531106586', '1531192986', '1000', '<p>通过听玩游戏宝下载运行游戏即可获得金币奖励。</p>', '1', '1', '1532661793', '1533717013', null);
INSERT INTO `task` VALUES ('2', '发表评论', '2', '2', 'normal', '10', '发表评论', '1530415410', '1532748212', '1000', '<p>任意游戏下发表你的评论，每日发表五次评论，可领取评论奖励。</p>', '1', '1', '1532661819', '1533090419', null);
INSERT INTO `task` VALUES ('3', '输入邀请码', '3', '1', 'new', '1', '去输入', '1532662724', '1532662727', '3000', '<p>输入好友邀请码即可获得奖励</p>', '4', '1', '1532662811', '1532668798', null);
INSERT INTO `task` VALUES ('4', '首次邀请好友', '3', '1', 'normal', '2', '立即邀请', '1532662994', '1532662996', '10000', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662899', '1532672554', null);
INSERT INTO `task` VALUES ('5', '首次邀请好友', '3', '1', 'normal', '1', '立即邀请', '1532662994', '1532662996', '10000', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662907', '1532662939', '1532662939');
INSERT INTO `task` VALUES ('6', '首次邀请好友', '3', '1', 'normal', '1', '立即邀请', '1532662994', '1532662996', '10000', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662917', '1532662937', '1532662937');
INSERT INTO `task` VALUES ('7', '首次邀请好友', '3', '1', 'normal', '1', '立即邀请', '1532662994', '1532662996', '10000', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662920', '1532662935', '1532662935');
INSERT INTO `task` VALUES ('8', '认证微信', '3', '1', 'normal', '5', '立即认证', '1532663122', '1532663123', '100', '<p>为了保证资金安全，应微信要求需要进行实名认证，通过后才能向您转账付款。</p>', '4', '1', '1532663034', '1532672526', null);
INSERT INTO `task` VALUES ('9', '认证支付宝', '1', '1', 'normal', '4', '立即认证', '1532663189', '1532663190', '100', '<p>为了保证资金安全，应支付宝要求需要进行实名认证，通过后才能向您转账付款。</p>', '4', '2', '1532663088', '1536571161', null);
INSERT INTO `task` VALUES ('10', '开启提现特权', '3', '1', 'normal', '6', '立即开启', '1532668475', '1532668476', '2000', '<p>完成：认证微信任务，在app下载一款游戏，两个任务，将开启提现特权并获得奖励</p>', '4', '1', '1532668395', '1532668395', null);
INSERT INTO `task` VALUES ('11', '每日签到', '2', '2', 'normal', '7', '去签到', '1532668549', '1532668550', '10190', '<p>累计签到天数增加每天赠送的金币，若签到中途中断则从第一天签到开始累计。</p>', '4', '1', '1532668463', '1532672418', null);
INSERT INTO `task` VALUES ('12', '邀请好友', '2', '2', 'normal', '2', '立即邀请', '1532668624', '1532668625', '30000', '<p>每成功邀请1名好友即可获得高额金币奖励，好友下载游戏、完成任务还会向你贡献额外金币。</p>', '4', '1', '1532668581', '1532672376', null);
INSERT INTO `task` VALUES ('13', '分享听玩到朋友圈', '2', '2', 'normal', '9', '立即分享', '1532668757', '1532668759', '1000', '<p>分享听玩到朋友圈，只有发送分享到朋友圈，且被好友认证阅读后才能拿到奖励。</p>', '4', '1', '1532668763', '1532672512', null);
INSERT INTO `task` VALUES ('14', '分享听玩到微信群', '2', '2', 'normal', '8', '立即分享', '1532672389', '1532672391', '1000', '<p>分享听玩到微信群，只有分享到微信群中，且被群好友认真阅读后才能拿到奖励。<br/></p>', '4', '1', '1532672362', '1532672362', null);
INSERT INTO `task` VALUES ('15', '玩游戏赚金币', '2', '2', 'normal', '11', '玩游戏', '1532673657', '1532673659', '10000', '<p>在听玩游戏宝内安装指定游戏创建角色，每天玩游戏五分钟以上。</p>', '4', '2', '1532673608', '1534403917', null);
INSERT INTO `task` VALUES ('17', '首次邀请好友', '10', '1', 'normal', '2', '立即邀请', '0', '0', '10000', '<p>首次成功邀请好友后的额外奖励<br/></p>', '3', '1', '1533634886', '1533634886', null);
INSERT INTO `task` VALUES ('18', '输入邀请码', '10', '2', 'new', '2', '去输入', '0', '0', '3000', '<p>输入好友邀请码即可获得奖励</p>', '3', '1', '1533634891', '1533717598', null);
INSERT INTO `task` VALUES ('19', '认证微信', '10', '1', 'normal', '5', '立即认证', '0', '0', '100', '<p>为了保证资金安全，应微信要求需要进行实名认证，通过后才能向你转账付款</p>', '3', '1', '1533635035', '1533635198', null);
INSERT INTO `task` VALUES ('20', '认证支付宝', '10', '1', 'normal', '4', '立即认证', '0', '0', '100', '<p>为了保证资金安全，应支付宝要求需要进行实名认证，通过后才能向您转账付款。</p>', '3', '1', '1533635858', '1533635858', null);
INSERT INTO `task` VALUES ('21', '邀请好友', '9', '3', 'hot', '11', '立即邀请', '0', '0', '30000', '<p>每邀请一名好友完成7天活跃，累计可获得30000金币。好友阅读文章，完成搜索任务还会向你贡献额外金币</p>', '3', '1', '1533635992', '1534490647', null);
INSERT INTO `task` VALUES ('22', '玩游戏赢金币', '9', '2', 'normal', '11', '玩游戏', '0', '0', '10000', '<p>在游戏宝内安装指定游戏创建角色，每天玩游戏五分钟以上。</p>', '3', '1', '1533636127', '1533637402', null);
INSERT INTO `task` VALUES ('23', '唤醒好友', '9', '2', 'normal', '11', '去唤醒', '0', '0', '3000', '<p>发短信唤醒最近不活跃的好友，好友打开闪电头条阅读1篇文章，你就有奖励</p>', '3', '2', '1533636259', '1533717555', null);
INSERT INTO `task` VALUES ('24', '搜索关键词', '9', '3', 'normal', '10', '立即搜索', '0', '0', '1500', '<p>点击热词完成指定任务，就能获得奖励</p>', '3', '1', '1533636324', '1534490639', null);
INSERT INTO `task` VALUES ('25', '分享到朋友圈', '9', '3', 'normal', '9', '立即分享', '0', '0', '100', '<p>分享闪电头条到朋友圈，只有发送分享到朋友圈，且被好友认证阅读后才能拿到奖励。</p>', '3', '1', '1533636414', '1534490627', null);
INSERT INTO `task` VALUES ('26', '分享到微信群', '9', '3', 'normal', '8', '立即分享', '0', '0', '100', '<p>分享闪电头条到朋友圈，只有发送分享到微信群，且被好友认证阅读后才能拿到奖励。</p>', '3', '1', '1533636478', '1534490621', null);
INSERT INTO `task` VALUES ('27', '分享文章', '9', '3', 'normal', '10', '立即分享', '0', '0', '20', '<p>看到好的内容分享出去，好友每次点击你获得20金币奖励，分享越多金币越多</p>', '3', '1', '1533636552', '1534490609', null);
INSERT INTO `task` VALUES ('28', '阅读文章奖励', '9', '3', 'normal', '10', '立即阅读', '0', '0', '550', '<p>阅读任意文章满5分钟+50金币，满30分钟+200金币，满60分钟+300金币</p>', '3', '1', '1533636771', '1534490599', null);
INSERT INTO `task` VALUES ('29', '精选评论', '9', '3', 'normal', '11', '立即评论', '0', '0', '100', '<p>当你针对文章或社区动态做出一针见血或诙谐幽默的神评论时，小编会给出金币奖励</p>', '3', '1', '1533636862', '1534490669', null);
INSERT INTO `task` VALUES ('30', '精选动态', '9', '3', 'normal', '11', '立即发布', '0', '0', '200', '<p>当你的动态获得好友的一致点赞评论支持，获得精选动态标签时，小编会给出金币奖励</p>', '3', '2', '1533636979', '1534490676', null);
INSERT INTO `task` VALUES ('31', '开启特权', '10', '1', 'new', '6', '立即开启', '0', '0', '10000', '<p>开启特权</p>', '3', '2', '1533637031', '1533717528', null);
INSERT INTO `task` VALUES ('32', '开启提现特权', '10', '1', 'new', '6', '立即开启', '0', '0', '10000', '<p>完成：认证微信任务，在app下载一款游戏，两个任务，将开启提现特权并获得奖励</p>', '3', '1', '1533637081', '1533637081', null);
INSERT INTO `task` VALUES ('33', '每日签到', '9', '2', 'hot', '7', '立即签到', '0', '0', '10000', '<p>累计签到天数增加每天赠送的金币，若签到中途中断则从第一天签到开始累计。</p>', '3', '1', '1533637203', '1533637203', null);
INSERT INTO `task` VALUES ('34', '认证手机', '10', '1', 'normal', '3', '立即认证', '0', '0', '100', '<p>方便提现操作，确保本人信息</p>', '3', '1', '1533786818', '1533786818', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app_id` varchar(50) NOT NULL,
  `coins` int(10) DEFAULT '0',
  `money` varchar(10) DEFAULT '0',
  `invitation_code` char(8) NOT NULL,
  `invited_code` char(8) DEFAULT NULL,
  `invited_time` int(10) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-未认证,2-微信认证,3-支付宝认证',
  `login_time` int(10) DEFAULT NULL,
  `login_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1242', 'rESQtswdK9wO0cxD', '0', '0', '3DE6RRSJ', null, null, '1', '1533091216', '58.208.246.197');
INSERT INTO `user` VALUES ('2', '1226', 'rESQtswdK9wO0cxD', '0', '0', 'LK3QXUDS', '', null, '1', '1533094591', '58.208.246.197');
INSERT INTO `user` VALUES ('3', '1243', 'rESQtswdK9wO0cxD', '0', '0', 'HRUU7M1I', '', null, '2', '1534388670', '222.241.15.103');
INSERT INTO `user` VALUES ('4', '1236', 'rESQtswdK9wO0cxD', '0', '0', 'NHNJPADE', null, null, '1', '1533026668', '220.168.238.231');
INSERT INTO `user` VALUES ('5', '1139', 'rESQtswdK9wO0cxD', '5250', '0', 'XU44VENZ', 'DFZM7WGV', '1534390174', '2', '1536560955', '113.221.13.39');
INSERT INTO `user` VALUES ('6', '629', 'rESQtswdK9wO0cxD', '0', '0', 'KEHR5VIC', '', null, '3', '1534486686', '183.16.192.156');
INSERT INTO `user` VALUES ('7', '1244', 'rESQtswdK9wO0cxD', '3050', '0', 'FB5O1SGF', 'DFZM7WGV', '1534390123', '3', '1534390139', '222.241.15.103');
INSERT INTO `user` VALUES ('8', '1245', 'rESQtswdK9wO0cxD', '0', '0', '6FJYDIQ8', '', null, '1', '1533726402', '119.39.248.20');
INSERT INTO `user` VALUES ('9', '1246', 'rESQtswdK9wO0cxD', '0', '0', 'QWJTYZY4', '', null, '1', '1533111101', '220.202.152.17');
INSERT INTO `user` VALUES ('10', '1225', 'rESQtswdK9wO0cxD', '7700', '0', 'C67ZANWK', 'LEVPAOTX', '1534389825', '2', '1540562988', '117.83.131.160');
INSERT INTO `user` VALUES ('11', '1153', 'rESQtswdK9wO0cxD', '3050', '0', 'IHTMMEFD', 'LEVPAOTX', '1534389617', '2', '1537694691', '112.97.55.64');
INSERT INTO `user` VALUES ('12', '1249', 'rESQtswdK9wO0cxD', '40200', '0', 'LEVPAOTX', 'CRAT2A8Z', '1534389911', '3', '1534473770', '58.208.246.114');
INSERT INTO `user` VALUES ('13', '1252', 'rESQtswdK9wO0cxD', '16350', '0', 'CRAT2A8Z', 'LEVPAOTX', '1534389564', '2', '1534920535', '114.219.57.191');
INSERT INTO `user` VALUES ('14', '1254', 'rESQtswdK9wO0cxD', '50', '0', 'WMI8CPXM', null, null, '1', '1540275925', '106.19.32.130');
INSERT INTO `user` VALUES ('15', '1151', 'rESQtswdK9wO0cxD', '800', '0', '7HPQMV9B', 'DDIHYWNF', '1540175101', '2', '1540970503', '43.250.201.35');
INSERT INTO `user` VALUES ('16', '1152', 'rESQtswdK9wO0cxD', '-67850', '0', 'UJJB4U67', null, null, '2', '1540456428', '119.139.196.85');
INSERT INTO `user` VALUES ('17', '67219', 'rESQtswdK9wO0cxD', '11000', '0', 'JYRGAX4Z', null, null, '3', '1537236118', '114.219.46.53');
INSERT INTO `user` VALUES ('18', '1259', 'rESQtswdK9wO0cxD', '0', '0', 'DWC478OP', '', null, '2', '1534388630', '222.241.15.103');
INSERT INTO `user` VALUES ('19', '1261', 'rESQtswdK9wO0cxD', '0', '0', 'U7GG4SD9', '', null, '1', '1533618195', '222.246.15.9');
INSERT INTO `user` VALUES ('20', '1159', 'rESQtswdK9wO0cxD', '2050', '0', '7EHPC8XF', null, null, '1', '1540889226', '223.150.8.134');
INSERT INTO `user` VALUES ('21', '1', 'jblRpcEzBBnmXpzq', '2700', '0', 'RBBUD7XN', null, null, '1', '1540902566', '47.97.200.99');
INSERT INTO `user` VALUES ('22', '6', 'jblRpcEzBBnmXpzq', '2850', '0', 'HM5RYA8T', null, null, '1', '1534731323', '47.97.200.99');
INSERT INTO `user` VALUES ('23', '8', 'jblRpcEzBBnmXpzq', '0', '0', 'UUSL7MAV', null, null, '1', '1536232472', '47.97.200.99');
INSERT INTO `user` VALUES ('24', '8', 'jblRpcEzBBnmXpzq', '0', '0', 'KFAURLVV', null, null, '1', '1533730345', '47.97.200.99');
INSERT INTO `user` VALUES ('25', '9', 'jblRpcEzBBnmXpzq', '5800', '0', 'IGBKRMQK', null, null, '1', '1534757767', '47.97.200.99');
INSERT INTO `user` VALUES ('26', '9', 'jblRpcEzBBnmXpzq', '5800', '0', 'DXP2WCIE', null, null, '1', '1533779888', '47.97.200.99');
INSERT INTO `user` VALUES ('27', '10', 'jblRpcEzBBnmXpzq', '0', '0', 'BXY2S85D', null, null, '1', '1533889492', '47.97.200.99');
INSERT INTO `user` VALUES ('28', '11', 'jblRpcEzBBnmXpzq', '100', '0', '7V2NTZ2W', null, null, '1', '1534734660', '47.97.200.99');
INSERT INTO `user` VALUES ('29', '1279', 'rESQtswdK9wO0cxD', '0', '0', 'QU7SBTUI', null, null, '1', '1534149884', '222.241.15.1');
INSERT INTO `user` VALUES ('30', '1280', 'rESQtswdK9wO0cxD', '0', '0', 'PJEL1FYX', null, null, '1', '1534142985', '222.241.15.1');
INSERT INTO `user` VALUES ('31', '1237', 'rESQtswdK9wO0cxD', '22050', '0', 'FF5WRYHP', null, null, '1', '1540437513', '106.17.251.242');
INSERT INTO `user` VALUES ('32', '1281', 'rESQtswdK9wO0cxD', '0', '0', 'X4ULQHGZ', null, null, '1', '1534213574', '183.16.195.26');
INSERT INTO `user` VALUES ('33', '1284', 'rESQtswdK9wO0cxD', '0', '0', 'SRA6XIZW', null, null, '2', '1534295414', '113.221.49.48');
INSERT INTO `user` VALUES ('34', '1289', 'rESQtswdK9wO0cxD', '8200', '0', 'DFZM7WGV', null, null, '2', '1534730566', '222.246.23.64');
INSERT INTO `user` VALUES ('35', '12', 'jblRpcEzBBnmXpzq', '3850', '0', '9AJPEQPB', null, null, '1', '1537172302', '47.97.200.99');
INSERT INTO `user` VALUES ('36', '13', 'jblRpcEzBBnmXpzq', '50', '0', 'KQOE7NWP', null, null, '1', '1534869166', '47.97.200.99');
INSERT INTO `user` VALUES ('37', '14', 'jblRpcEzBBnmXpzq', '0', '0', '7FGGASGA', null, null, '1', '1534441998', '47.97.200.99');
INSERT INTO `user` VALUES ('38', '15', 'jblRpcEzBBnmXpzq', '700', '0', 'HT64ERYU', null, null, '3', '1539856003', '47.97.200.99');
INSERT INTO `user` VALUES ('39', '16', 'jblRpcEzBBnmXpzq', '150', '0', 'Z4D6FCIN', null, null, '1', '1539760287', '47.97.200.99');
INSERT INTO `user` VALUES ('40', '17', 'jblRpcEzBBnmXpzq', '550', '0', 'O5XDU2PY', null, null, '1', '1534475079', '47.97.200.99');
INSERT INTO `user` VALUES ('41', '1292', 'rESQtswdK9wO0cxD', '-524770', '0', 'DDIHYWNF', '7HPQMV9B', '1535426776', '2', '1540970506', '223.150.8.134');
INSERT INTO `user` VALUES ('42', '18', 'jblRpcEzBBnmXpzq', '0', '0', 'PKNFFBIL', null, null, '1', '1534862555', '47.97.200.99');
INSERT INTO `user` VALUES ('43', '19', 'jblRpcEzBBnmXpzq', '1200', '0', 'CFL81TBK', null, null, '1', '1534907072', '47.97.200.99');
INSERT INTO `user` VALUES ('44', '1297', 'rESQtswdK9wO0cxD', '0', '0', 'Q8SDKSEU', null, null, '1', '1536670175', '171.111.13.82');
INSERT INTO `user` VALUES ('45', '1298', 'rESQtswdK9wO0cxD', '0', '0', 'DUCNMHUK', null, null, '1', '1534957182', '117.136.89.213');
INSERT INTO `user` VALUES ('46', '1303', 'rESQtswdK9wO0cxD', '9910', '0', '2AQ8ESPD', '7HPQMV9B', '1535426874', '1', '1536115344', '43.250.200.47');
INSERT INTO `user` VALUES ('47', '1304', 'rESQtswdK9wO0cxD', '3000', '0', 'GWDT3N6K', 'JYRGAX4Z', '1535436755', '1', '1537240949', '114.219.46.53');
INSERT INTO `user` VALUES ('48', '1305', 'rESQtswdK9wO0cxD', '4250', '0', 'TAQQB6WJ', 'JYRGAX4Z', '1535436792', '2', '1539760311', '114.219.47.53');
INSERT INTO `user` VALUES ('49', '1160', 'rESQtswdK9wO0cxD', '50', '0', '1IUB4Y9B', null, null, '1', '1540732507', '113.221.12.169');
INSERT INTO `user` VALUES ('50', '1310', 'rESQtswdK9wO0cxD', '50', '0', 'UC18Z7R1', null, null, '1', '1539580593', '124.64.16.56');
INSERT INTO `user` VALUES ('51', '7', 'jblRpcEzBBnmXpzq', '0', '0', 'OIH2NZHZ', null, null, '1', '1536982723', '47.97.200.99');
INSERT INTO `user` VALUES ('52', '1315', 'rESQtswdK9wO0cxD', '0', '0', '7HAUV16E', null, null, '1', '1537170970', '223.104.186.250');
INSERT INTO `user` VALUES ('53', '1316', 'rESQtswdK9wO0cxD', '0', '0', 'CBX4KB28', null, null, '1', '1537200682', '124.160.213.35');
INSERT INTO `user` VALUES ('54', '1317', 'rESQtswdK9wO0cxD', '50', '0', 'C5KE5MKK', null, null, '1', '1537346705', '119.165.170.222');
INSERT INTO `user` VALUES ('55', '1318', 'rESQtswdK9wO0cxD', '50', '0', 'APVDL7VI', null, null, '1', '1537358126', '222.209.37.209');
INSERT INTO `user` VALUES ('56', '1319', 'rESQtswdK9wO0cxD', '0', '0', 'SU98FYKO', null, null, '1', '1537397361', '117.157.217.211');
INSERT INTO `user` VALUES ('57', '1320', 'rESQtswdK9wO0cxD', '0', '0', 'MXCFYIFF', null, null, '1', '1538043397', '49.70.40.220');
INSERT INTO `user` VALUES ('58', '1322', 'rESQtswdK9wO0cxD', '0', '0', 'LODYH79T', null, null, '1', '1537631142', '139.210.20.51');
INSERT INTO `user` VALUES ('59', '1324', 'rESQtswdK9wO0cxD', '0', '0', 'K7SJRPRQ', null, null, '1', '1537709018', '182.42.231.136');
INSERT INTO `user` VALUES ('60', '1325', 'rESQtswdK9wO0cxD', '0', '0', 'UGN86EW2', null, null, '1', '1538037740', '182.133.228.96');
INSERT INTO `user` VALUES ('61', '1326', 'rESQtswdK9wO0cxD', '0', '0', '9UOKMBRJ', null, null, '1', '1538067379', '59.63.225.98');
INSERT INTO `user` VALUES ('62', '1328', 'rESQtswdK9wO0cxD', '2200', '0', 'UXTDYWIA', null, null, '2', '1539353046', '110.52.7.43');
INSERT INTO `user` VALUES ('63', '1329', 'rESQtswdK9wO0cxD', '0', '0', 'A7NJ1FEP', null, null, '1', '1538294430', '1.85.109.11');
INSERT INTO `user` VALUES ('64', '1330', 'rESQtswdK9wO0cxD', '50', '0', 'APJD91NB', null, null, '1', '1538471246', '222.74.29.101');
INSERT INTO `user` VALUES ('65', '1332', 'rESQtswdK9wO0cxD', '0', '0', 'YCLQRDIU', null, null, '1', '1538436779', '112.243.89.14');
INSERT INTO `user` VALUES ('66', '1335', 'rESQtswdK9wO0cxD', '0', '0', 'B6XZ5TJM', null, null, '1', '1538709025', '221.192.178.99');
INSERT INTO `user` VALUES ('67', '1336', 'rESQtswdK9wO0cxD', '0', '0', 'MNV6VRYE', null, null, '1', '1538775816', '183.131.109.116');
INSERT INTO `user` VALUES ('68', '1337', 'rESQtswdK9wO0cxD', '0', '0', '7JJERLWT', null, null, '1', '1538893808', '110.240.106.237');
INSERT INTO `user` VALUES ('69', '1338', 'rESQtswdK9wO0cxD', '18140', '0', '1AY6A5UJ', null, null, '2', '1540602877', '223.151.79.99');
INSERT INTO `user` VALUES ('70', '1339', 'rESQtswdK9wO0cxD', '0', '0', 'RACZ3XKK', null, null, '1', '1539157117', '222.241.15.17');
INSERT INTO `user` VALUES ('71', '1340', 'rESQtswdK9wO0cxD', '0', '0', 'OY13D8FQ', null, null, '1', '1539160545', '180.130.10.27');
INSERT INTO `user` VALUES ('72', '1341', 'rESQtswdK9wO0cxD', '0', '0', 'OZIXPFKK', null, null, '1', '1539516847', '106.119.46.59');
INSERT INTO `user` VALUES ('73', '1342', 'rESQtswdK9wO0cxD', '0', '0', 'OMPY9W8V', null, null, '1', '1539251097', '117.136.73.70');
INSERT INTO `user` VALUES ('74', '1343', 'rESQtswdK9wO0cxD', '0', '0', 'RNRESZKC', null, null, '1', '1539406005', '113.14.88.114');
INSERT INTO `user` VALUES ('75', '1344', 'rESQtswdK9wO0cxD', '50', '0', 'N2YDX61J', null, null, '1', '1539358351', '223.104.21.226');
INSERT INTO `user` VALUES ('76', '1345', 'rESQtswdK9wO0cxD', '50', '0', 'MGJV98RQ', null, null, '1', '1539424056', '182.244.200.158');
INSERT INTO `user` VALUES ('77', '1346', 'rESQtswdK9wO0cxD', '1050', '0', 'E6IKZUHL', null, null, '2', '1539449996', '223.150.41.10');
INSERT INTO `user` VALUES ('78', '1347', 'rESQtswdK9wO0cxD', '50', '0', 'HERCRHLL', null, null, '1', '1539488648', '122.192.14.241');
INSERT INTO `user` VALUES ('79', '1348', 'rESQtswdK9wO0cxD', '50', '0', 'DTUYKEK1', null, null, '1', '1539776347', '117.136.102.250');
INSERT INTO `user` VALUES ('80', '1349', 'rESQtswdK9wO0cxD', '0', '0', 'U2GGT8OP', null, null, '1', '1539761153', '112.224.33.79');
INSERT INTO `user` VALUES ('81', '1350', 'rESQtswdK9wO0cxD', '0', '0', 'PBKEAM1K', null, null, '1', '1539892272', '223.91.13.37');
INSERT INTO `user` VALUES ('82', '1217', 'rESQtswdK9wO0cxD', '30000', '0', '7M9USUTA', null, null, '2', '1540174644', '49.73.171.206');
INSERT INTO `user` VALUES ('83', '1351', 'rESQtswdK9wO0cxD', '0', '0', 'J4BZC9AU', null, null, '1', '1539960852', '182.46.9.12');
INSERT INTO `user` VALUES ('84', '1352', 'rESQtswdK9wO0cxD', '0', '0', '5MUNQUKQ', null, null, '1', '1540031937', '111.19.77.69');
INSERT INTO `user` VALUES ('85', '1353', 'rESQtswdK9wO0cxD', '0', '0', 'XS4VSBK5', null, null, '1', '1540039125', '183.1.88.208');
INSERT INTO `user` VALUES ('86', '1359', 'rESQtswdK9wO0cxD', '0', '0', '2LO956Q4', null, null, '1', '1540176506', '116.233.206.230');
INSERT INTO `user` VALUES ('87', '1362', 'rESQtswdK9wO0cxD', '0', '0', 'HDQ9KTPN', null, null, '1', '1540215655', '59.63.207.104');
INSERT INTO `user` VALUES ('88', '1363', 'rESQtswdK9wO0cxD', '0', '0', 'LP5ZL4P6', null, null, '1', '1540464592', '223.86.192.16');
INSERT INTO `user` VALUES ('89', '1364', 'rESQtswdK9wO0cxD', '5050', '0', 'LGOMWHLW', 'FF5WRYHP', '1540497831', '1', '1540553057', '112.96.106.175');
INSERT INTO `user` VALUES ('90', '1365', 'rESQtswdK9wO0cxD', '0', '0', 'GA4XNB9L', null, null, '1', '1540561698', '113.69.43.200');
INSERT INTO `user` VALUES ('91', '1366', 'rESQtswdK9wO0cxD', '0', '0', 'BQQJ24EU', null, null, '1', '1540601022', '223.90.167.15');
INSERT INTO `user` VALUES ('92', '1367', 'rESQtswdK9wO0cxD', '0', '0', 'B2Q1EQ5L', null, null, '1', '1540979706', '223.150.8.134');
INSERT INTO `user` VALUES ('93', '1368', 'rESQtswdK9wO0cxD', '1350', '0', 'IAQBKOYE', null, null, '2', '1540978580', '106.127.83.151');

-- ----------------------------
-- Table structure for `user_money`
-- ----------------------------
DROP TABLE IF EXISTS `user_money`;
CREATE TABLE `user_money` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `app_id` varchar(200) NOT NULL,
  `order_no` varchar(20) NOT NULL,
  `coins` varchar(10) NOT NULL,
  `money` varchar(10) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-微信,2支付宝',
  `is_send` tinyint(1) NOT NULL DEFAULT '0',
  `is_get` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是未发,1是已领取,2是失败/退款',
  `is_close` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_money
-- ----------------------------
INSERT INTO `user_money` VALUES ('1', '1289', 'rESQtswdK9wO0cxD', 'A816028836984894', '10000', '1', '1', '0', '0', '0', '1534402883', '1534402883');
INSERT INTO `user_money` VALUES ('2', '1252', 'rESQtswdK9wO0cxD', 'A816067053764164', '10000', '1', '1', '1', '1', '0', '1534406705', '1534409862');
INSERT INTO `user_money` VALUES ('3', '1252', 'rESQtswdK9wO0cxD', 'A816103129096942', '10000', '1', '1', '1', '2', '0', '1534410312', '1534500353');
INSERT INTO `user_money` VALUES ('4', '1151', 'rESQtswdK9wO0cxD', 'A917541567808091', '50000', '5', '1', '0', '0', '0', '1537154156', '1537154156');
INSERT INTO `user_money` VALUES ('5', '1152', 'rESQtswdK9wO0cxD', 'AA18457014929848', '10000', '1', '1', '0', '0', '0', '1539845701', '1539845701');
INSERT INTO `user_money` VALUES ('6', '1152', 'rESQtswdK9wO0cxD', 'AA18457063521443', '10000', '1', '1', '0', '0', '0', '1539845706', '1539845706');
INSERT INTO `user_money` VALUES ('7', '1152', 'rESQtswdK9wO0cxD', 'AA18457083369976', '10000', '1', '1', '0', '0', '0', '1539845708', '1539845708');
INSERT INTO `user_money` VALUES ('8', '1152', 'rESQtswdK9wO0cxD', 'AA18457092647424', '10000', '1', '1', '0', '0', '0', '1539845709', '1539845709');
INSERT INTO `user_money` VALUES ('9', '1152', 'rESQtswdK9wO0cxD', 'AA18457140708518', '10000', '1', '1', '0', '0', '0', '1539845714', '1539845714');
INSERT INTO `user_money` VALUES ('10', '1152', 'rESQtswdK9wO0cxD', 'AA18457152307309', '10000', '1', '1', '0', '0', '0', '1539845715', '1539845715');
INSERT INTO `user_money` VALUES ('11', '1152', 'rESQtswdK9wO0cxD', 'AA18457160223098', '10000', '1', '1', '0', '0', '0', '1539845716', '1539845716');
INSERT INTO `user_money` VALUES ('12', '1152', 'rESQtswdK9wO0cxD', 'AA18457169428552', '10000', '1', '1', '0', '0', '0', '1539845716', '1539845716');
INSERT INTO `user_money` VALUES ('13', '1151', 'rESQtswdK9wO0cxD', 'AA20059991654546', '10000', '1', '1', '1', '0', '0', '1540005999', '1540006012');
INSERT INTO `user_money` VALUES ('14', '1292', 'rESQtswdK9wO0cxD', 'AA20066883770074', '10000', '1', '1', '0', '0', '0', '1540006688', '1540006688');
INSERT INTO `user_money` VALUES ('15', '1292', 'rESQtswdK9wO0cxD', 'AA20066884621641', '10000', '1', '1', '0', '0', '0', '1540006688', '1540006688');
INSERT INTO `user_money` VALUES ('16', '1292', 'rESQtswdK9wO0cxD', 'AA20066885219762', '10000', '1', '1', '0', '0', '0', '1540006688', '1540006688');
INSERT INTO `user_money` VALUES ('17', '1292', 'rESQtswdK9wO0cxD', 'AA20066886318942', '10000', '1', '1', '0', '0', '0', '1540006688', '1540006688');
INSERT INTO `user_money` VALUES ('18', '1292', 'rESQtswdK9wO0cxD', 'AA20066887720349', '10000', '1', '1', '0', '0', '0', '1540006688', '1540006688');
INSERT INTO `user_money` VALUES ('19', '1292', 'rESQtswdK9wO0cxD', 'AA20066888997139', '10000', '1', '1', '0', '0', '0', '1540006688', '1540006688');
INSERT INTO `user_money` VALUES ('20', '1292', 'rESQtswdK9wO0cxD', 'AA20066890229818', '10000', '1', '1', '0', '0', '0', '1540006689', '1540006689');
INSERT INTO `user_money` VALUES ('70', '1292', 'rESQtswdK9wO0cxD', 'AA20067146902691', '10000', '1', '1', '0', '0', '0', '1540006714', '1540006714');
INSERT INTO `user_money` VALUES ('73', '1217', 'rESQtswdK9wO0cxD', 'AA22740787687346', '10000', '1', '1', '0', '0', '0', '1540174078', '1540174078');
INSERT INTO `user_money` VALUES ('74', '1151', 'rESQtswdK9wO0cxD', 'AA22753029772972', '10000', '1', '1', '1', '0', '0', '1540175302', '1540553639');

-- ----------------------------
-- Table structure for `user_task`
-- ----------------------------
DROP TABLE IF EXISTS `user_task`;
CREATE TABLE `user_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_task
-- ----------------------------
INSERT INTO `user_task` VALUES ('1', '1252', '3', '1534389564', '1534389564');
INSERT INTO `user_task` VALUES ('2', '1153', '3', '1534389617', '1534389617');
INSERT INTO `user_task` VALUES ('3', '1225', '3', '1534389825', '1534389825');
INSERT INTO `user_task` VALUES ('4', '1249', '3', '1534389911', '1534389911');
INSERT INTO `user_task` VALUES ('5', '1244', '3', '1534390123', '1534390123');
INSERT INTO `user_task` VALUES ('6', '1139', '3', '1534390174', '1534390174');
INSERT INTO `user_task` VALUES ('7', '6', '24', '1534392765', '1534392765');
INSERT INTO `user_task` VALUES ('8', '6', '28', '1534392927', '1534392927');
INSERT INTO `user_task` VALUES ('9', '6', '25', '1534393292', '1534393292');
INSERT INTO `user_task` VALUES ('10', '1289', '8', '1534402871', '1534402871');
INSERT INTO `user_task` VALUES ('11', '1139', '14', '1534403882', '1534403882');
INSERT INTO `user_task` VALUES ('12', '1139', '13', '1534403952', '1534403952');
INSERT INTO `user_task` VALUES ('13', '1139', '8', '1534404014', '1534404014');
INSERT INTO `user_task` VALUES ('14', '1252', '9', '1534404679', '1534404679');
INSERT INTO `user_task` VALUES ('17', '1252', '8', '1534406692', '1534406692');
INSERT INTO `user_task` VALUES ('18', '1252', '8', '1534409103', '1534409103');
INSERT INTO `user_task` VALUES ('19', '11', '25', '1534471587', '1534471587');
INSERT INTO `user_task` VALUES ('20', '15', '28', '1534473701', '1534473701');
INSERT INTO `user_task` VALUES ('21', '17', '28', '1534475198', '1534475198');
INSERT INTO `user_task` VALUES ('22', '1152', '8', '1534478168', '1534478168');
INSERT INTO `user_task` VALUES ('23', '6', '28', '1534481980', '1534481980');
INSERT INTO `user_task` VALUES ('24', '12', '28', '1534484204', '1534484204');
INSERT INTO `user_task` VALUES ('25', '1', '25', '1534485596', '1534485596');
INSERT INTO `user_task` VALUES ('26', '1', '28', '1534485614', '1534485614');
INSERT INTO `user_task` VALUES ('27', '1', '24', '1534485632', '1534485632');
INSERT INTO `user_task` VALUES ('28', '12', '24', '1534486736', '1534486736');
INSERT INTO `user_task` VALUES ('29', '67219', '12', '1534490315', '1534490315');
INSERT INTO `user_task` VALUES ('30', '1', '28', '1534490706', '1534490706');
INSERT INTO `user_task` VALUES ('31', '12', '28', '1534490942', '1534490942');
INSERT INTO `user_task` VALUES ('32', '15', '20', '1534495449', '1534495449');
INSERT INTO `user_task` VALUES ('33', '6', '34', '1534499723', '1534499723');
INSERT INTO `user_task` VALUES ('34', '9', '28', '1534502687', '1534502687');
INSERT INTO `user_task` VALUES ('35', '9', '24', '1534502721', '1534502721');
INSERT INTO `user_task` VALUES ('36', '9', '28', '1534502967', '1534502967');
INSERT INTO `user_task` VALUES ('37', '9', '28', '1534503174', '1534503174');
INSERT INTO `user_task` VALUES ('38', '1225', '8', '1534557850', '1534557850');
INSERT INTO `user_task` VALUES ('39', '1225', '8', '1534557870', '1534557870');
INSERT INTO `user_task` VALUES ('40', '9', '24', '1534648153', '1534648153');
INSERT INTO `user_task` VALUES ('41', '9', '28', '1534661638', '1534661638');
INSERT INTO `user_task` VALUES ('42', '9', '28', '1534667529', '1534667529');
INSERT INTO `user_task` VALUES ('43', '19', '28', '1534907168', '1534907168');
INSERT INTO `user_task` VALUES ('44', '19', '28', '1534907202', '1534907202');
INSERT INTO `user_task` VALUES ('45', '19', '34', '1534907287', '1534907287');
INSERT INTO `user_task` VALUES ('46', '1159', '14', '1535017429', '1535017429');
INSERT INTO `user_task` VALUES ('47', '1159', '13', '1535017444', '1535017444');
INSERT INTO `user_task` VALUES ('48', '1152', '1', '1535115022', '1535115022');
INSERT INTO `user_task` VALUES ('49', '1152', '10', '1535115027', '1535115027');
INSERT INTO `user_task` VALUES ('50', '1152', '2', '1535115103', '1535115103');
INSERT INTO `user_task` VALUES ('51', '1292', '3', '1535426776', '1535426776');
INSERT INTO `user_task` VALUES ('52', '1303', '3', '1535426874', '1535426874');
INSERT INTO `user_task` VALUES ('53', '1304', '3', '1535434071', '1535434071');
INSERT INTO `user_task` VALUES ('54', '1305', '3', '1535434345', '1535434345');
INSERT INTO `user_task` VALUES ('56', '1304', '3', '1535436755', '1535436755');
INSERT INTO `user_task` VALUES ('57', '1305', '3', '1535436792', '1535436792');
INSERT INTO `user_task` VALUES ('58', '1303', '14', '1535509044', '1535509044');
INSERT INTO `user_task` VALUES ('59', '1151', '14', '1535509247', '1535509247');
INSERT INTO `user_task` VALUES ('60', '1303', '13', '1535530587', '1535530587');
INSERT INTO `user_task` VALUES ('61', '1151', '13', '1535530605', '1535530605');
INSERT INTO `user_task` VALUES ('62', '1151', '14', '1535621057', '1535621057');
INSERT INTO `user_task` VALUES ('63', '1303', '13', '1535621077', '1535621077');
INSERT INTO `user_task` VALUES ('64', '1303', '14', '1535623203', '1535623203');
INSERT INTO `user_task` VALUES ('65', '1303', '13', '1535788358', '1535788358');
INSERT INTO `user_task` VALUES ('66', '1303', '14', '1536058378', '1536058378');
INSERT INTO `user_task` VALUES ('67', '1152', '2', '1536060449', '1536060449');
INSERT INTO `user_task` VALUES ('68', '1152', '1', '1536060474', '1536060474');
INSERT INTO `user_task` VALUES ('69', '1152', '2', '1536112587', '1536112587');
INSERT INTO `user_task` VALUES ('70', '1152', '2', '1536202020', '1536202020');
INSERT INTO `user_task` VALUES ('71', '1292', '13', '1536205209', '1536205209');
INSERT INTO `user_task` VALUES ('72', '1292', '14', '1536236621', '1536236621');
INSERT INTO `user_task` VALUES ('73', '1292', '1', '1536237492', '1536237492');
INSERT INTO `user_task` VALUES ('74', '1151', '13', '1536543924', '1536543924');
INSERT INTO `user_task` VALUES ('75', '1292', '13', '1536631048', '1536631048');
INSERT INTO `user_task` VALUES ('76', '1292', '13', '1536825626', '1536825626');
INSERT INTO `user_task` VALUES ('77', '1292', '13', '1536893005', '1536893005');
INSERT INTO `user_task` VALUES ('78', '1151', '8', '1537154148', '1537154148');
INSERT INTO `user_task` VALUES ('79', '1151', '1', '1537154250', '1537154250');
INSERT INTO `user_task` VALUES ('80', '1151', '10', '1537154252', '1537154252');
INSERT INTO `user_task` VALUES ('81', '1305', '8', '1537155121', '1537155121');
INSERT INTO `user_task` VALUES ('82', '12', '28', '1537177729', '1537177729');
INSERT INTO `user_task` VALUES ('83', '1292', '14', '1537198864', '1537198864');
INSERT INTO `user_task` VALUES ('84', '1292', '13', '1537198867', '1537198867');
INSERT INTO `user_task` VALUES ('85', '1292', '1', '1537198878', '1537198878');
INSERT INTO `user_task` VALUES ('86', '1292', '14', '1537233007', '1537233007');
INSERT INTO `user_task` VALUES ('87', '1152', '2', '1537233220', '1537233220');
INSERT INTO `user_task` VALUES ('88', '1152', '14', '1537233273', '1537233273');
INSERT INTO `user_task` VALUES ('89', '1151', '13', '1537233417', '1537233417');
INSERT INTO `user_task` VALUES ('90', '1305', '14', '1537236311', '1537236311');
INSERT INTO `user_task` VALUES ('91', '1292', '13', '1537236627', '1537236627');
INSERT INTO `user_task` VALUES ('92', '1292', '2', '1537236691', '1537236691');
INSERT INTO `user_task` VALUES ('93', '1292', '1', '1537236769', '1537236769');
INSERT INTO `user_task` VALUES ('94', '1225', '14', '1537243375', '1537243375');
INSERT INTO `user_task` VALUES ('95', '1328', '14', '1539157161', '1539157161');
INSERT INTO `user_task` VALUES ('96', '1328', '13', '1539157172', '1539157172');
INSERT INTO `user_task` VALUES ('97', '1328', '8', '1539157737', '1539157737');
INSERT INTO `user_task` VALUES ('98', '12', '28', '1539255715', '1539255715');
INSERT INTO `user_task` VALUES ('99', '1346', '2', '1539450048', '1539450048');
INSERT INTO `user_task` VALUES ('100', '1338', '14', '1539530514', '1539530514');
INSERT INTO `user_task` VALUES ('101', '1338', '14', '1539732354', '1539732354');
INSERT INTO `user_task` VALUES ('102', '1225', '14', '1539787222', '1539787222');
INSERT INTO `user_task` VALUES ('103', '1225', '2', '1539787266', '1539787266');
INSERT INTO `user_task` VALUES ('104', '1152', '14', '1539845678', '1539845678');
INSERT INTO `user_task` VALUES ('105', '1152', '13', '1539845683', '1539845683');
INSERT INTO `user_task` VALUES ('106', '1338', '14', '1539934471', '1539934471');
INSERT INTO `user_task` VALUES ('107', '1338', '2', '1539934534', '1539934534');
INSERT INTO `user_task` VALUES ('108', '1292', '8', '1540006670', '1540006670');
INSERT INTO `user_task` VALUES ('109', '1292', '8', '1540006741', '1540006741');
INSERT INTO `user_task` VALUES ('110', '1217', '8', '1540172848', '1540172848');
INSERT INTO `user_task` VALUES ('111', '1151', '3', '1540175101', '1540175101');
INSERT INTO `user_task` VALUES ('112', '1151', '2', '1540175172', '1540175172');
INSERT INTO `user_task` VALUES ('113', '1151', '1', '1540175296', '1540175296');
INSERT INTO `user_task` VALUES ('114', '1338', '8', '1540286757', '1540286757');
INSERT INTO `user_task` VALUES ('115', '1338', '1', '1540286850', '1540286850');
INSERT INTO `user_task` VALUES ('116', '1338', '14', '1540286869', '1540286869');
INSERT INTO `user_task` VALUES ('117', '1338', '2', '1540286900', '1540286900');
INSERT INTO `user_task` VALUES ('118', '1338', '13', '1540286919', '1540286919');
INSERT INTO `user_task` VALUES ('119', '1338', '14', '1540455250', '1540455250');
INSERT INTO `user_task` VALUES ('120', '1338', '13', '1540455257', '1540455257');
INSERT INTO `user_task` VALUES ('121', '1338', '1', '1540455434', '1540455434');
INSERT INTO `user_task` VALUES ('122', '1338', '10', '1540455447', '1540455447');
INSERT INTO `user_task` VALUES ('123', '1364', '3', '1540497831', '1540497831');
INSERT INTO `user_task` VALUES ('124', '1364', '14', '1540529002', '1540529002');
INSERT INTO `user_task` VALUES ('125', '1364', '13', '1540529016', '1540529016');
INSERT INTO `user_task` VALUES ('126', '1225', '14', '1540563053', '1540563053');
INSERT INTO `user_task` VALUES ('127', '1338', '14', '1540602902', '1540602902');
INSERT INTO `user_task` VALUES ('128', '1338', '13', '1540602911', '1540602911');
INSERT INTO `user_task` VALUES ('129', '1338', '2', '1540602973', '1540602973');
INSERT INTO `user_task` VALUES ('130', '1368', '8', '1540978691', '1540978691');
INSERT INTO `user_task` VALUES ('131', '1368', '8', '1540978704', '1540978704');
INSERT INTO `user_task` VALUES ('132', '1368', '14', '1540978768', '1540978768');
INSERT INTO `user_task` VALUES ('133', '1368', '8', '1540978888', '1540978888');

-- ----------------------------
-- Table structure for `verify_user`
-- ----------------------------
DROP TABLE IF EXISTS `verify_user`;
CREATE TABLE `verify_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `app_id` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `alipay_account` varchar(200) DEFAULT '',
  `wxpay_account` varchar(200) DEFAULT '',
  `unionid` varchar(50) DEFAULT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verify_user
-- ----------------------------
INSERT INTO `verify_user` VALUES ('1', '1152', 'rESQtswdK9wO0cxD', '小哥哥', '421023199106031011', null, 'o-p2twGxp69iEDa-jZgigveSsDj8', 'oDfHd0jdzyNtTzHRxZGU84eX5En0', '1534302965', '1534302975');
INSERT INTO `verify_user` VALUES ('2', '1289', 'rESQtswdK9wO0cxD', '于鑫睿', '654001199206061418', null, 'o-p2twJbzNKpqWoTAO-p4fnKSlaM', 'oDfHd0ni4-7_f9ucf6HyGKMotiqk', '1534402852', '1534402866');
INSERT INTO `verify_user` VALUES ('3', '1139', 'rESQtswdK9wO0cxD', '于鑫睿', '654001199206061418', null, 'o-p2twOsC2Sgg0tH1AOgNWu76Ee4', 'oDfHd0tuPb6_EYP0IIfrvYx-eQ5c', '1534403983', '1534404006');
INSERT INTO `verify_user` VALUES ('4', '1252', 'rESQtswdK9wO0cxD', '李宁', '654001199206061418', '17625340816', 'o-p2twMAt6MsO36Gs8B2gR7QqENU', 'oDfHd0vmmcigKZ14F2rG2awburJs', '1534404679', '1534406687');
INSERT INTO `verify_user` VALUES ('7', '15', 'jblRpcEzBBnmXpzq', '老娘', '654001199206061418', '17625340816', null, null, '1534495449', '1534495449');
INSERT INTO `verify_user` VALUES ('8', '1225', 'rESQtswdK9wO0cxD', '邹菊强', '320586198911070519', null, 'o-p2twLeTJQQ5sGzCGurFQ-R4dvg', 'oDfHd0njD0LqSkqRYbd2FXvW2bHM', '1534557818', '1534557832');
INSERT INTO `verify_user` VALUES ('9', '1151', 'rESQtswdK9wO0cxD', '于鑫睿', '654001199205060720', '', 'o-p2twJbzNKpqWoTAO-p4fnKSlaM', 'oDfHd0ni4-7_f9ucf6HyGKMotiqk', '1537153799', '1537154023');
INSERT INTO `verify_user` VALUES ('10', '1305', 'rESQtswdK9wO0cxD', '狗粮', '320826199809241611', '', 'o-p2twMAt6MsO36Gs8B2gR7QqENU', 'oDfHd0vmmcigKZ14F2rG2awburJs', '1537154720', '1537155112');
INSERT INTO `verify_user` VALUES ('11', '1328', 'rESQtswdK9wO0cxD', '周聂', '430703199512044516', '', 'o-p2twFmJhWQpxKLPRpCfU5KdlkI', 'oDfHd0hZpZ03m_8xn4GxcrIKlcPc', '1539157279', '1539157673');
INSERT INTO `verify_user` VALUES ('12', '1346', 'rESQtswdK9wO0cxD', '秦淼', '430822199403158236', '', '', 'oDfHd0q-qacxYfQZorkcQ-ehtZjc', '1539449903', '1539449903');
INSERT INTO `verify_user` VALUES ('13', '1292', 'rESQtswdK9wO0cxD', '夜魔', '430521199508237333', '', 'o-p2twOsC2Sgg0tH1AOgNWu76Ee4', 'oDfHd0tuPb6_EYP0IIfrvYx-eQ5c', '1540006623', '1540006663');
INSERT INTO `verify_user` VALUES ('16', '1217', 'rESQtswdK9wO0cxD', '露娜', '321302199508168812', '', 'o-p2twMAt6MsO36Gs8B2gR7QqENU', 'oDfHd0vmmcigKZ14F2rG2awburJs', '1540172816', '1540172839');
INSERT INTO `verify_user` VALUES ('17', '1338', 'rESQtswdK9wO0cxD', '向金秋', '433126199707093523', '', 'o-p2twNMCZ-aFFwO6YNqJsEGi0OA', 'oDfHd0narZNijT9WSTgkcVsChM0E', '1540286684', '1540286747');
INSERT INTO `verify_user` VALUES ('18', '1368', 'rESQtswdK9wO0cxD', '王刚豪', '450423200312181012', '', 'o-p2twHmY00BRtWmIac2wHhWVfC0', 'oDfHd0gbiCOdZqy8Ofes-580bpkI', '1540978636', '1540978676');
