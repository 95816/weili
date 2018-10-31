/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : weili

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-31 18:03:29
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
INSERT INTO `admin` VALUES ('1', 'lining', '4297f44b13955235245b2497399d7a93', '1366435203@qq.com', '1', '1', '李宁', '127.0.0.1', '1540968499', null, '1540968499', '1528266520');
INSERT INTO `admin` VALUES ('2', 'anzhuo', '4297f44b13955235245b2497399d7a93', '9607852134@163.com', '2', '1', '安卓大哥', '115.10.31.119', '1528352485', null, '1536804364', '1528352120');
INSERT INTO `admin` VALUES ('3', 'xingge', '733d7be2196ff70efaf6913fc8bdcabf', 'laixing@163.com', '1', '1', '潘来星', '127.0.0.1', '1528366401', null, '1533521109', '1528364593');
INSERT INTO `admin` VALUES ('4', 'chenyao', '4297f44b13955235245b2497399d7a93', 'chenyao@qq.com', '1', '0', '陈瑶', '218.75.157.166', '1533519463', null, '1533519463', '1528364907');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES ('1', '听玩游戏宝', '#64CB5F', './upload/image/20180822/b0193be8450fe737519c5ca5d5f704bz.jpg', 'rESQtswdK9wO0cxD', 'c6acdd53ef809736c59af49b8d6b0b70', '1532661580', '1532661580');
INSERT INTO `app_info` VALUES ('2', '斗蟹游戏', '#FF0000', './upload/image/20180822/b0193be8450fe737519c5ca5d5f704bz.jpg', 'rjm2MjPHhQRnGmPV', 'f7a31c5eb82f8b46610791b715f1adbe', '1532661661', '1532661661');
INSERT INTO `app_info` VALUES ('3', '闪电头条', '#FF0000', './upload/image/20180822/d091723fbc8071126aa4769f2433casd.png', 'jblRpcEzBBnmXpzq', 'f0fdf2de00377318aa1ffe88b1c1184d', '1533520344', '1533520344');
INSERT INTO `app_info` VALUES ('4', '今日头条', '#803535', './upload/image/20180822/b0193be8450fe737519c5ca5d5f704bz.jpg', 'lWYmIrj8J2NZgjpo', 'f1b4e17990cfbe07265995967428a2eb', '1534486875', '1534486875');
INSERT INTO `app_info` VALUES ('5', '好特游戏', '#803535', './upload/image/20180822/9a456e31ecb86c99bfc66d51fa34a130.png', '9grz4Fd2ZFcqbtFG', '9b6608ca33b62e396b76d0d09b14b7dd', '1534919232', '1534919232');
INSERT INTO `app_info` VALUES ('6', '百度地图', '#803535', './upload/image/20180822/d091723fbc8071126aa4769f2433ca05.png', '45IT5mU8I4bkYVy1', 'aa7ef0e58c3ef92ab63dcf4244b12b55', '1534920282', '1534920282');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_invite
-- ----------------------------
INSERT INTO `app_invite` VALUES ('1', '1', '1', '10000', '5000,4000,3000,3000,3000,4000,5000');
INSERT INTO `app_invite` VALUES ('2', '1', '2', null, '500,400,300,300,300,400,500');

-- ----------------------------
-- Table structure for `app_sign`
-- ----------------------------
DROP TABLE IF EXISTS `app_sign`;
CREATE TABLE `app_sign` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_id` int(10) NOT NULL,
  `reward_coin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_sign
-- ----------------------------
INSERT INTO `app_sign` VALUES ('1', '1', '50,100,660,880,150,200,2880,100,330,100,660,100,100,3880');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
INSERT INTO `category` VALUES ('11', '4', '0', '今日头条', '0,11', '1', '1534486875', '1534486875');
INSERT INTO `category` VALUES ('12', '5', '0', '好特游戏', '0,12', '1', '1534919232', '1534919232');
INSERT INTO `category` VALUES ('13', '6', '0', '百度地图', '0,13', '1', '1534920282', '1534920282');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coins_log
-- ----------------------------
INSERT INTO `coins_log` VALUES ('1', '50000', '67219', 'rESQtswdK9wO0cxD', '2', '8', '1533887684', '1533887684');
INSERT INTO `coins_log` VALUES ('2', '100', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1535528532', '1535528533');
INSERT INTO `coins_log` VALUES ('3', '200', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1535528534', '1535528536');
INSERT INTO `coins_log` VALUES ('4', '30000', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1535528770', '1535528770');
INSERT INTO `coins_log` VALUES ('5', '4000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535530412', '1535530412');
INSERT INTO `coins_log` VALUES ('6', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535530427', '1535530427');
INSERT INTO `coins_log` VALUES ('8', '1000', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1535622927', '1535622927');
INSERT INTO `coins_log` VALUES ('9', '1000', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1535622995', '1535622995');
INSERT INTO `coins_log` VALUES ('10', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1535622995', '1535622995');
INSERT INTO `coins_log` VALUES ('11', '1000', '67219', 'rESQtswdK9wO0cxD', '1', '5', '1537235990', '1537235990');
INSERT INTO `coins_log` VALUES ('12', '3000', '1151', 'rESQtswdK9wO0cxD', '1', '6', '1537235990', '1537235990');
INSERT INTO `coins_log` VALUES ('13', '50', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539930419', '1539930419');
INSERT INTO `coins_log` VALUES ('14', '100', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539931659', '1539931659');
INSERT INTO `coins_log` VALUES ('15', '660', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539931826', '1539931826');
INSERT INTO `coins_log` VALUES ('16', '50', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539932632', '1539932632');
INSERT INTO `coins_log` VALUES ('17', '50', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539932669', '1539932669');
INSERT INTO `coins_log` VALUES ('18', '100', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539932983', '1539932983');
INSERT INTO `coins_log` VALUES ('19', '50', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539933009', '1539933009');
INSERT INTO `coins_log` VALUES ('20', '100', '67219', 'rESQtswdK9wO0cxD', '1', '7', '1539933383', '1539933383');

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
  `num` int(10) DEFAULT '0' COMMENT '记录邀请的这个人领取第几次奖励',
  `created_at` int(10) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invite_log
-- ----------------------------
INSERT INTO `invite_log` VALUES ('2', '3000', '1151', '67219', 'rESQtswdK9wO0cxD', '1', '4', '1535263992', '1537235990');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of machine_record
-- ----------------------------
INSERT INTO `machine_record` VALUES ('1', '86670003538892389860040101750334714', 'rESQtswdK9wO0cxD', '1533093744', '1533093744', '1');
INSERT INTO `machine_record` VALUES ('2', '38335088074167589860051767790085295', 'rESQtswdK9wO0cxD', '1533103914', '1533103914', '1');

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
INSERT INTO `news` VALUES ('9', '提现帮助', '3', '<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	<b>提现帮助</b> \r\n</h2>\r\n<p class=\"MsoNormal\">\r\n	<b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	今天我们来学习一下如何提现。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	目前听玩支持2<span>种体现方式，有微信、支付宝。现在我们根据不同的提现版块来学习如何成功提现。</span> \r\n</p>\r\n<h3>\r\n	<b><span>提现方式</span>1<span>：微信</span></b> \r\n</h3>\r\n<p class=\"MsoNormal\">\r\n	<b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>首先，点击</span>“去绑定”按钮，进入页面。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/upload/image/20180801/20180801113942_53383.png\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	按照需求填写真实的姓名和身份证号<span>，然后点击</span>“去授权”。“去授权”之前，我们需要关注“<span>听玩手游宝</span>”的微信公众号。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>点击下方的打开微信，戳一下顶部搜索栏，然后选择</span>“公众号”，接着输入“<span>听玩手游宝</span>”，点击查看<span>听完手游宝</span>的主页，点击页面下方的关注就好啦。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>关注成功后，</span>“<span>听玩手游宝</span>”就会给您自动发送一条“授权链接”，直接点击授权即可。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>微信内的操作完成之后，我们回到</span>“听玩”<span>app</span><span>，点击“去授权”按钮。</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>授权完成后，页面会自动回到</span>“听玩”页面，点击下一步。此时弹窗会告知您“授权成功，可以微信提现啦。”\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>提现申请提交之后，微信是以</span>“<span>听玩手游宝</span>”公众号给您发送红包的形式为您转账，过期未领取的红包会退回至您的听玩零钱账户。\r\n</p>\r\n<h3>\r\n	<b><span>提现方式</span>2<span>：支付宝</span></b> \r\n</h3>\r\n<p class=\"MsoNormal\">\r\n	<b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>支付宝的认证流程比较简单，点击</span>“去绑定”按钮。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/upload/image/20180801/20180801114232_30117.png\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	根据页面提示填写真实姓名、身份证号以及支付宝账号。填写完毕之后，确认认证即可。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	此时页面会变更成“已认证”状态，这时您就能提现到支付宝拉。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	支付宝是以直接打款的方式为您转账，您需要自行查看支付宝账单记录。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	注：\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	1.&nbsp;实名认证仅作账户提现使用，信息保密，请您放心；\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	2.&nbsp;以上提现账户，一经绑定，无法自行修改<span>。如有问题，请直接联系</span>“<span>听玩手游宝</span>”微信公众号客服小姐姐。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	3.&nbsp;提现1<span>个工作日</span>内到账，遇国家法定节假日顺延，请大家合理安排提现时间，提现后耐心等待，请勿催促。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'rESQtswdK9wO0cxD', '1533023033', '1533094959');
INSERT INTO `news` VALUES ('10', '如何使用', '3', '<h3>\r\n	邀请码是什么？\r\n</h3>\r\n<p>\r\n	<span>邀请码是您在听玩游戏宝的身份标识。</span> \r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/20180801/20180801111050_55293.png\" alt=\"\" /> \r\n</p>\r\n<h3>\r\n	邀请码怎么用？312\r\n</h3>\r\n<p>\r\n	分享邀请码给微信好友或安装了听玩游戏宝的好友，安装后输入你的邀请码完成邀请。\r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/20180801/20180801113554_96302.png\" alt=\"\" /> \r\n</p>', 'rESQtswdK9wO0cxD', '1533027943', '1537344342');

-- ----------------------------
-- Table structure for `premission`
-- ----------------------------
DROP TABLE IF EXISTS `premission`;
CREATE TABLE `premission` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '权限名称',
  `uris` varchar(255) NOT NULL COMMENT '权限路径',
  `status` char(1) NOT NULL COMMENT '是否有效',
  `create_at` int(10) NOT NULL,
  `update_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of premission
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `status` char(1) DEFAULT NULL COMMENT '是否可用',
  `create_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `permission_id` int(10) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('2', '边玩游戏边赚钱', '快来听玩游戏宝，玩玩游戏就能赚钱，真的可以提现成功，你也来试试吧。', './upload/image/20180802/d2a3c0b2730ad482a440bdf0f936bd3c.png', 'http://newadmin.tingwan.com/api/share/page', '1', '1533195929', '1533197874');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_log
-- ----------------------------
INSERT INTO `sign_log` VALUES ('7', '67219', '50', 'rESQtswdK9wO0cxD', '1', '1539792000', '1539792000');
INSERT INTO `sign_log` VALUES ('8', '67219', '100', 'rESQtswdK9wO0cxD', '2', '1539933383', '1539933383');

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
  `reward_coin` decimal(10,2) NOT NULL COMMENT 'new-新,hot-热门,3-正常',
  `description` mediumtext,
  `add_admin` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-显示,2-隐藏',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `deleted_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '下载游戏赚金币', '2', '2', 'normal', '10', '下载游戏', '1531106586', '1531192986', '1000.00', '<p>通过听玩游戏宝下载运行游戏即可获得金币奖励。</p>', '1', '1', '1532661793', '1532920552', null);
INSERT INTO `task` VALUES ('2', '发表评论', '2', '2', 'normal', '10', '发表评论', '1530415410', '1532748212', '1000.00', '<p>任意游戏下发表你的评论，每日发表五次评论，可领取评论奖励。</p>', '1', '1', '1532661819', '1533090419', null);
INSERT INTO `task` VALUES ('3', '输入邀请码', '3', '1', 'new', '1', '去输入', '1532662724', '1532662727', '3000.00', '<p>输入好友邀请码即可获得奖励</p>', '4', '1', '1532662811', '1532668798', null);
INSERT INTO `task` VALUES ('4', '首次邀请好友', '3', '1', 'normal', '2', '立即邀请', '1532662994', '1532662996', '10000.00', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662899', '1532672554', null);
INSERT INTO `task` VALUES ('5', '首次邀请好友', '3', '1', 'normal', '1', '立即邀请', '1532662994', '1532662996', '10000.00', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662907', '1532662939', '1532662939');
INSERT INTO `task` VALUES ('6', '首次邀请好友', '3', '1', 'normal', '1', '立即邀请', '1532662994', '1532662996', '10000.00', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662917', '1532662937', '1532662937');
INSERT INTO `task` VALUES ('7', '首次邀请好友', '3', '1', 'normal', '1', '立即邀请', '1532662994', '1532662996', '10000.00', '<p>首次成功邀请好友后的额外奖励</p>', '4', '1', '1532662920', '1532662935', '1532662935');
INSERT INTO `task` VALUES ('8', '认证微信', '3', '1', 'normal', '5', '立即认证', '1532663122', '1532663123', '100.00', '<p>为了保证资金安全，应微信要求需要进行实名认证，通过后才能向您转账付款。</p>', '4', '1', '1532663034', '1532672526', null);
INSERT INTO `task` VALUES ('9', '认证支付宝', '1', '1', 'normal', '4', '立即认证', '1532663189', '1532663190', '100.00', '<p>为了保证资金安全，应支付宝要求需要进行实名认证，通过后才能向您转账付款。</p>', '4', '1', '1532663088', '1532672435', null);
INSERT INTO `task` VALUES ('10', '开启提现特权', '3', '1', 'normal', '6', '立即开启', '1532668475', '1532668476', '2000.00', '<p>完成：认证微信任务，在app下载一款游戏，两个任务，将开启提现特权并获得奖励</p>', '4', '1', '1532668395', '1532668395', null);
INSERT INTO `task` VALUES ('11', '每日签到', '2', '2', 'normal', '7', '去签到', '1532668549', '1532668550', '10190.00', '<p>累计签到天数增加每天赠送的金币，若签到中途中断则从第一天签到开始累计。</p>', '4', '1', '1532668463', '1532672418', null);
INSERT INTO `task` VALUES ('12', '邀请好友', '2', '2', 'normal', '2', '立即邀请', '1532668624', '1532668625', '30000.00', '<p>每成功邀请1名好友即可获得高额金币奖励，好友下载游戏、完成任务还会向你贡献额外金币。</p>', '4', '1', '1532668581', '1532672376', null);
INSERT INTO `task` VALUES ('13', '分享听玩到朋友圈', '2', '2', 'normal', '9', '立即分享', '1532668757', '1532668759', '1000.00', '<p>分享听玩到朋友圈，只有发送分享到朋友圈，且被好友认证阅读后才能拿到奖励。</p>', '4', '1', '1532668763', '1532672512', null);
INSERT INTO `task` VALUES ('14', '分享听玩到微信群', '2', '2', 'normal', '8', '立即分享', '1532672389', '1532672391', '1000.00', '<p>分享听玩到微信群，只有分享到微信群中，且被群好友认真阅读后才能拿到奖励。<br/></p>', '4', '1', '1532672362', '1532672362', null);
INSERT INTO `task` VALUES ('15', '玩游戏赚金币', '2', '2', 'normal', '11', '玩游戏', '1532673657', '1532673659', '10000.00', '<p>在听玩游戏宝内安装指定游戏创建角色，每天玩游戏五分钟以上。</p>', '4', '1', '1532673608', '1532673636', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1242', 'rESQtswdK9wO0cxD', '0', '0', '3DE6RRSJ', null, null, '1', '1533091216', '58.208.246.197');
INSERT INTO `user` VALUES ('2', '1226', 'rESQtswdK9wO0cxD', '0', '0', 'LK3QXUDS', '', null, '1', '1533094591', '58.208.246.197');
INSERT INTO `user` VALUES ('3', '1243', 'rESQtswdK9wO0cxD', '0', '0', 'HRUU7M1I', '', null, '1', '1533026902', '220.168.238.231');
INSERT INTO `user` VALUES ('4', '1236', 'rESQtswdK9wO0cxD', '0', '0', 'NHNJPADE', null, null, '1', '1533026668', '220.168.238.231');
INSERT INTO `user` VALUES ('5', '1139', 'rESQtswdK9wO0cxD', '1', '0', 'XU44VENZ', null, null, '1', '1533520003', '222.241.14.79');
INSERT INTO `user` VALUES ('6', '629', 'rESQtswdK9wO0cxD', '0', '0', 'KEHR5VIC', 'CRAT2A8Z', '1533105184', '1', '1533111099', '183.16.188.242');
INSERT INTO `user` VALUES ('7', '1244', 'rESQtswdK9wO0cxD', '0', '0', 'FB5O1SGF', '', null, '1', '1533026903', '220.168.238.231');
INSERT INTO `user` VALUES ('8', '1245', 'rESQtswdK9wO0cxD', '0', '0', '6FJYDIQ8', '', null, '1', '1533095175', '222.246.15.137');
INSERT INTO `user` VALUES ('9', '1246', 'rESQtswdK9wO0cxD', '0', '0', 'QWJTYZY4', '', null, '1', '1533111101', '220.202.152.17');
INSERT INTO `user` VALUES ('10', '1225', 'rESQtswdK9wO0cxD', '0', '0', 'C67ZANWK', null, null, '1', '1533093454', '58.208.246.197');
INSERT INTO `user` VALUES ('11', '1153', 'rESQtswdK9wO0cxD', '0', '0', 'IHTMMEFD', null, null, '1', '1533178864', '112.97.61.200');
INSERT INTO `user` VALUES ('12', '1249', 'rESQtswdK9wO0cxD', '0', '0', 'LEVPAOTX', 'CRAT2A8Z', '1533105171', '1', '1533199013', '58.208.246.197');
INSERT INTO `user` VALUES ('13', '1252', 'rESQtswdK9wO0cxD', '0', '0', 'CRAT2A8Z', null, null, '1', '1533199468', '58.208.246.197');
INSERT INTO `user` VALUES ('14', '1254', 'rESQtswdK9wO0cxD', '0', '0', 'WMI8CPXM', null, null, '1', '1533352821', '218.75.157.166');
INSERT INTO `user` VALUES ('15', '1151', 'rESQtswdK9wO0cxD', '13000', '0', '7HPQMV9B', null, null, '1', '1533199704', '222.246.15.137');
INSERT INTO `user` VALUES ('16', '1152', 'rESQtswdK9wO0cxD', '0', '0', 'UJJB4U67', null, null, '1', '1533521620', '183.16.190.10');
INSERT INTO `user` VALUES ('17', '67219', 'rESQtswdK9wO0cxD', '94360', '0.21', 'JYRGAX4Z', null, null, '2', '1539930042', '127.0.0.1');

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
  `is_get` tinyint(1) NOT NULL DEFAULT '0',
  `is_close` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_money
-- ----------------------------
INSERT INTO `user_money` VALUES ('1', '67219', 'rESQtswdK9wO0cxD', 'A808227946899194', '100000', '10', '2', '0', '0', '0', '1533722794', '1533722794');
INSERT INTO `user_money` VALUES ('2', '67219', 'rESQtswdK9wO0cxD', 'A810683930667231', '50000', '5', '1', '0', '0', '1', '1533868393', '1534315311');
INSERT INTO `user_money` VALUES ('3', '67219', 'rESQtswdK9wO0cxD', 'A810874075365121', '100000', '10', '1', '1', '0', '0', '1533887407', '1533891419');
INSERT INTO `user_money` VALUES ('4', '67219', 'rESQtswdK9wO0cxD', 'A810876832340954', '50000', '5', '1', '1', '0', '0', '1533887683', '1533891176');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_task
-- ----------------------------
INSERT INTO `user_task` VALUES ('1', '67219', '9', '1533713672', '1533713672');
INSERT INTO `user_task` VALUES ('2', '67219', '8', '1534401923', '1534401923');
INSERT INTO `user_task` VALUES ('3', '67219', '12', '1535528770', '1535528770');
INSERT INTO `user_task` VALUES ('4', '67219', '13', '1535622833', '1535622833');
INSERT INTO `user_task` VALUES ('5', '67219', '13', '1535622927', '1535622927');
INSERT INTO `user_task` VALUES ('6', '67219', '13', '1535622995', '1535622995');
INSERT INTO `user_task` VALUES ('7', '67219', '13', '1537235990', '1537235990');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verify_user
-- ----------------------------
INSERT INTO `verify_user` VALUES ('4', '67219', 'rESQtswdK9wO0cxD', '李宁', '321302199508168812', '', 'o-p2twMAt6MsO36Gs8B2gR7QqENU', 'oDfHd0vmmcigKZ14F2rG2awburJs', '1534404679', '1534406687');
