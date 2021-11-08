/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : wms_db

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2021-11-08 20:33:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wms_access_record
-- ----------------------------
DROP TABLE IF EXISTS `wms_access_record`;
CREATE TABLE `wms_access_record` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `ACCESS_TYPE` varchar(30) NOT NULL,
  `ACCESS_TIME` datetime NOT NULL,
  `ACCESS_IP` varchar(45) NOT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_access_record
-- ----------------------------
INSERT INTO `wms_access_record` VALUES ('1', '1001', 'admin', 'login', '2021-11-02 20:14:31', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('2', '1001', 'admin', 'login', '2021-11-02 20:17:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('3', '1001', 'admin', 'login', '2021-11-02 20:20:37', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('4', '1001', 'admin', 'login', '2021-11-02 20:24:44', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('5', '1001', 'admin', 'login', '2021-11-02 20:46:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('6', '1001', 'admin', 'login', '2021-11-02 20:49:12', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('7', '1001', 'admin', 'login', '2021-11-02 20:59:43', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('8', '1001', 'admin', 'login', '2021-11-02 21:11:14', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('9', '1001', 'admin', 'login', '2021-11-02 21:14:02', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('10', '1001', 'admin', 'login', '2021-11-02 21:16:03', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('11', '1001', 'admin', 'logout', '2021-11-02 21:17:25', '-');
INSERT INTO `wms_access_record` VALUES ('12', '1001', 'admin', 'login', '2021-11-02 21:17:46', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('13', '1001', 'admin', 'logout', '2021-11-02 21:18:33', '-');
INSERT INTO `wms_access_record` VALUES ('14', '1001', 'admin', 'login', '2021-11-02 21:19:17', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('15', '1001', 'admin', 'login', '2021-11-02 21:23:13', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('16', '1001', 'admin', 'logout', '2021-11-02 21:23:36', '-');
INSERT INTO `wms_access_record` VALUES ('17', '1001', 'admin', 'login', '2021-11-02 21:24:30', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('18', '1001', 'admin', 'login', '2021-11-02 22:25:45', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('19', '1001', 'admin', 'logout', '2021-11-02 22:56:03', '-');
INSERT INTO `wms_access_record` VALUES ('20', '1001', 'admin', 'login', '2021-11-03 20:23:08', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('21', '1001', 'admin', 'logout', '2021-11-03 20:25:46', '-');
INSERT INTO `wms_access_record` VALUES ('22', '1001', 'admin', 'login', '2021-11-03 20:25:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('23', '1001', 'admin', 'login', '2021-11-03 20:44:02', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('24', '1001', 'admin', 'logout', '2021-11-03 20:44:28', '-');
INSERT INTO `wms_access_record` VALUES ('25', '1001', 'admin', 'login', '2021-11-03 20:44:32', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('26', '1001', 'admin', 'login', '2021-11-03 20:53:27', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('27', '1001', 'admin', 'logout', '2021-11-03 20:53:48', '-');
INSERT INTO `wms_access_record` VALUES ('28', '1001', 'admin', 'login', '2021-11-03 20:54:16', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('29', '1001', 'admin', 'logout', '2021-11-03 20:54:32', '-');
INSERT INTO `wms_access_record` VALUES ('30', '1001', 'admin', 'login', '2021-11-03 20:54:37', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('31', '1001', 'admin', 'logout', '2021-11-03 21:26:22', '-');
INSERT INTO `wms_access_record` VALUES ('32', '1001', 'admin', 'login', '2021-11-03 21:28:55', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('33', '1001', 'admin', 'login', '2021-11-03 22:32:40', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('34', '1001', 'admin', 'login', '2021-11-03 22:43:36', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('35', '1001', 'admin', 'login', '2021-11-03 23:09:52', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('36', '1001', 'admin', 'login', '2021-11-03 23:16:44', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('37', '1001', 'admin', 'login', '2021-11-03 23:23:08', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('38', '1001', 'admin', 'login', '2021-11-03 23:26:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('39', '1001', 'admin', 'login', '2021-11-03 23:28:21', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('40', '1001', 'admin', 'login', '2021-11-03 23:30:15', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('41', '1001', 'admin', 'login', '2021-11-03 23:32:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('42', '1001', 'admin', 'login', '2021-11-03 23:35:19', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('43', '1001', 'admin', 'login', '2021-11-03 23:36:51', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('44', '1001', 'admin', 'login', '2021-11-03 23:38:27', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('45', '1001', 'admin', 'login', '2021-11-03 23:39:32', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('46', '1001', 'admin', 'login', '2021-11-03 23:40:47', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('47', '1001', 'admin', 'login', '2021-11-03 23:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('48', '1001', 'admin', 'login', '2021-11-04 00:08:51', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('49', '1001', 'admin', 'login', '2021-11-04 00:12:15', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('50', '1001', 'admin', 'login', '2021-11-04 00:20:17', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('51', '1001', 'admin', 'login', '2021-11-04 00:32:49', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('52', '1001', 'admin', 'logout', '2021-11-04 01:04:44', '-');
INSERT INTO `wms_access_record` VALUES ('53', '1001', 'admin', 'login', '2021-11-04 01:23:53', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('54', '1001', 'admin', 'login', '2021-11-04 20:10:06', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('55', '1001', 'admin', 'login', '2021-11-04 21:06:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('56', '1001', 'admin', 'login', '2021-11-04 21:09:43', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('57', '1001', 'admin', 'login', '2021-11-04 21:12:34', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('58', '1001', 'admin', 'login', '2021-11-04 21:14:17', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('59', '1001', 'admin', 'login', '2021-11-04 21:18:03', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('60', '1001', 'admin', 'login', '2021-11-04 21:48:57', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('61', '1001', 'admin', 'login', '2021-11-04 22:03:08', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('62', '1001', 'admin', 'login', '2021-11-04 22:07:49', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('63', '1001', 'admin', 'login', '2021-11-04 22:30:45', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('64', '1001', 'admin', 'login', '2021-11-04 22:39:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('65', '1001', 'admin', 'logout', '2021-11-04 23:16:49', '-');
INSERT INTO `wms_access_record` VALUES ('66', '1001', 'admin', 'login', '2021-11-04 23:49:28', '127.0.0.1');
INSERT INTO `wms_access_record` VALUES ('67', '1001', 'admin', 'login', '2021-11-04 23:57:11', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('68', '1001', 'admin', 'logout', '2021-11-05 00:28:06', '-');
INSERT INTO `wms_access_record` VALUES ('69', '1001', 'admin', 'login', '2021-11-05 01:10:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('70', '1001', 'admin', 'login', '2021-11-05 01:17:25', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('71', '1001', 'admin', 'login', '2021-11-05 01:21:08', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('72', '1001', 'admin', 'login', '2021-11-05 19:56:50', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('73', '1001', 'admin', 'logout', '2021-11-05 20:30:29', '-');
INSERT INTO `wms_access_record` VALUES ('74', '1001', 'admin', 'login', '2021-11-05 22:45:53', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('75', '1001', 'admin', 'login', '2021-11-05 23:23:03', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('76', '1001', 'admin', 'login', '2021-11-05 23:42:19', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('77', '1001', 'admin', 'login', '2021-11-06 00:12:12', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('78', '1001', 'admin', 'login', '2021-11-06 00:26:51', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('79', '1001', 'admin', 'login', '2021-11-06 00:38:51', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('80', '1001', 'admin', 'login', '2021-11-06 00:53:16', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('81', '1001', 'admin', 'login', '2021-11-06 01:08:36', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('82', '1001', 'admin', 'logout', '2021-11-06 01:39:25', '-');
INSERT INTO `wms_access_record` VALUES ('83', '1001', 'admin', 'login', '2021-11-06 01:57:24', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('84', '1001', 'admin', 'login', '2021-11-06 02:01:04', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('85', '1001', 'admin', 'login', '2021-11-06 02:02:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('86', '1001', 'admin', 'login', '2021-11-06 02:11:20', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('87', '1001', 'admin', 'login', '2021-11-06 02:16:13', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('88', '1001', 'admin', 'login', '2021-11-06 02:29:36', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('89', '1001', 'admin', 'logout', '2021-11-06 02:31:50', '-');
INSERT INTO `wms_access_record` VALUES ('90', '1001', 'admin', 'login', '2021-11-06 02:32:07', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('91', '1001', 'admin', 'login', '2021-11-06 02:51:45', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('92', '1001', 'admin', 'login', '2021-11-06 02:59:08', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('93', '1001', 'admin', 'login', '2021-11-06 03:01:58', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('94', '1001', 'admin', 'logout', '2021-11-06 03:03:19', '-');
INSERT INTO `wms_access_record` VALUES ('95', '1024', '1', 'login', '2021-11-06 03:03:26', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('96', '1024', '1', 'logout', '2021-11-06 03:03:43', '-');
INSERT INTO `wms_access_record` VALUES ('97', '1001', 'admin', 'login', '2021-11-06 03:03:47', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('98', '1001', 'admin', 'login', '2021-11-06 03:24:29', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('99', '1001', 'admin', 'logout', '2021-11-06 03:28:47', '-');
INSERT INTO `wms_access_record` VALUES ('100', '1030', 'user', 'login', '2021-11-06 03:28:54', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('101', '1030', 'user', 'logout', '2021-11-06 03:28:57', '-');
INSERT INTO `wms_access_record` VALUES ('102', '1001', 'admin', 'login', '2021-11-06 03:29:01', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('103', '1001', 'admin', 'login', '2021-11-06 03:34:15', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('104', '1001', 'admin', 'login', '2021-11-06 03:42:43', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('105', '1001', 'admin', 'login', '2021-11-06 12:43:45', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('106', '1001', 'admin', 'login', '2021-11-06 12:51:34', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('107', '1001', 'admin', 'login', '2021-11-06 12:58:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('108', '1001', 'admin', 'login', '2021-11-06 13:07:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('109', '1001', 'admin', 'login', '2021-11-06 13:11:47', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('110', '1001', 'admin', 'login', '2021-11-06 13:21:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('111', '1001', 'admin', 'login', '2021-11-06 13:33:37', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('112', '1001', 'admin', 'login', '2021-11-06 13:48:22', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('113', '1001', 'admin', 'login', '2021-11-06 13:49:50', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('114', '1001', 'admin', 'login', '2021-11-06 13:52:38', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('115', '1001', 'admin', 'login', '2021-11-06 13:55:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('116', '1001', 'admin', 'login', '2021-11-06 14:01:26', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('117', '1001', 'admin', 'login', '2021-11-06 14:12:05', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('118', '1001', 'admin', 'login', '2021-11-06 14:13:32', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('119', '1001', 'admin', 'login', '2021-11-06 14:19:11', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('120', '1001', 'admin', 'login', '2021-11-06 14:43:54', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('121', '1001', 'admin', 'login', '2021-11-06 15:00:00', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('122', '1001', 'admin', 'login', '2021-11-06 15:05:14', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('123', '1001', 'admin', 'logout', '2021-11-06 15:35:30', '-');
INSERT INTO `wms_access_record` VALUES ('124', '1001', 'admin', 'login', '2021-11-06 19:37:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('125', '1001', 'admin', 'login', '2021-11-06 19:48:51', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('126', '1001', 'admin', 'login', '2021-11-06 19:59:12', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('127', '1001', 'admin', 'logout', '2021-11-06 20:31:02', '-');
INSERT INTO `wms_access_record` VALUES ('128', '1001', 'admin', 'login', '2021-11-06 23:11:32', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('129', '1001', 'admin', 'login', '2021-11-07 00:13:16', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('130', '1001', 'admin', 'logout', '2021-11-07 00:44:02', '-');
INSERT INTO `wms_access_record` VALUES ('131', '1001', 'admin', 'login', '2021-11-07 02:47:10', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('132', '1001', 'admin', 'login', '2021-11-07 02:50:52', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('133', '1001', 'admin', 'login', '2021-11-07 02:52:21', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('134', '1001', 'admin', 'login', '2021-11-07 02:59:04', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('135', '1001', 'admin', 'login', '2021-11-07 03:04:04', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('136', '1001', 'admin', 'login', '2021-11-07 03:07:10', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('137', '1001', 'admin', 'login', '2021-11-07 03:08:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('138', '1001', 'admin', 'login', '2021-11-07 03:11:43', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('139', '1001', 'admin', 'login', '2021-11-07 03:12:49', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('140', '1001', 'admin', 'login', '2021-11-07 03:15:34', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('141', '1001', 'admin', 'login', '2021-11-07 03:17:02', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('142', '1001', 'admin', 'login', '2021-11-07 13:52:06', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('143', '1001', 'admin', 'login', '2021-11-07 14:08:00', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('144', '1001', 'admin', 'login', '2021-11-07 14:17:39', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('145', '1001', 'admin', 'login', '2021-11-07 14:25:19', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('146', '1001', 'admin', 'login', '2021-11-07 14:26:48', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('147', '1001', 'admin', 'login', '2021-11-07 14:30:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('148', '1001', 'admin', 'login', '2021-11-07 14:37:52', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('149', '1001', 'admin', 'login', '2021-11-07 14:41:08', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('150', '1001', 'admin', 'login', '2021-11-07 14:44:22', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('151', '1001', 'admin', 'login', '2021-11-07 14:58:30', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('152', '1001', 'admin', 'login', '2021-11-07 15:09:32', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('153', '1001', 'admin', 'logout', '2021-11-07 15:48:27', '-');
INSERT INTO `wms_access_record` VALUES ('154', '1001', 'admin', 'login', '2021-11-07 15:49:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('155', '1001', 'admin', 'login', '2021-11-07 16:03:26', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('156', '1001', 'admin', 'login', '2021-11-07 16:05:46', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('157', '1001', 'admin', 'login', '2021-11-07 16:18:55', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('158', '1001', 'admin', 'login', '2021-11-07 16:20:00', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('159', '1001', 'admin', 'login', '2021-11-07 16:23:14', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('160', '1001', 'admin', 'login', '2021-11-07 16:30:22', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('161', '1001', 'admin', 'login', '2021-11-07 16:32:28', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('162', '1001', 'admin', 'login', '2021-11-07 16:42:33', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('163', '1001', 'admin', 'login', '2021-11-07 16:53:10', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('164', '1001', 'admin', 'login', '2021-11-07 16:57:37', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('165', '1001', 'admin', 'logout', '2021-11-07 16:59:22', '-');
INSERT INTO `wms_access_record` VALUES ('166', '1001', 'admin', 'login', '2021-11-07 16:59:39', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('167', '1001', 'admin', 'login', '2021-11-07 17:03:32', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('168', '1001', 'admin', 'login', '2021-11-07 17:06:14', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('169', '1001', 'admin', 'login', '2021-11-07 17:08:53', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('170', '1001', 'admin', 'login', '2021-11-07 17:11:21', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('171', '1001', 'admin', 'login', '2021-11-07 17:13:53', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('172', '1001', 'admin', 'login', '2021-11-07 17:16:39', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('173', '1001', 'admin', 'login', '2021-11-07 17:21:12', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('174', '1001', 'admin', 'login', '2021-11-07 17:23:02', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('175', '1001', 'admin', 'login', '2021-11-07 17:28:47', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('176', '1001', 'admin', 'login', '2021-11-07 17:31:26', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('177', '1001', 'admin', 'login', '2021-11-07 17:33:39', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('178', '1001', 'admin', 'login', '2021-11-07 17:43:15', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('179', '1001', 'admin', 'login', '2021-11-07 17:47:04', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('180', '1001', 'admin', 'login', '2021-11-07 17:52:17', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('181', '1001', 'admin', 'login', '2021-11-07 18:03:33', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('182', '1001', 'admin', 'login', '2021-11-07 18:05:02', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('183', '1001', 'admin', 'login', '2021-11-07 18:09:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('184', '1001', 'admin', 'login', '2021-11-07 18:11:45', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('185', '1001', 'admin', 'login', '2021-11-07 18:13:05', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('186', '1001', 'admin', 'login', '2021-11-07 18:17:05', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('187', '1001', 'admin', 'login', '2021-11-07 18:18:05', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('188', '1001', 'admin', 'login', '2021-11-07 18:19:07', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('189', '1001', 'admin', 'login', '2021-11-07 18:20:27', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('190', '1001', 'admin', 'login', '2021-11-07 18:22:54', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('191', '1001', 'admin', 'login', '2021-11-07 18:32:05', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('192', '1001', 'admin', 'login', '2021-11-07 18:36:46', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('193', '1001', 'admin', 'login', '2021-11-07 18:45:49', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('194', '1001', 'admin', 'login', '2021-11-07 18:49:30', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('195', '1001', 'admin', 'login', '2021-11-07 18:51:07', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('196', '1001', 'admin', 'login', '2021-11-07 18:58:06', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('197', '1001', 'admin', 'login', '2021-11-07 18:59:57', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('198', '1001', 'admin', 'login', '2021-11-07 19:02:39', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('199', '1001', 'admin', 'login', '2021-11-07 19:04:15', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('200', '1001', 'admin', 'login', '2021-11-07 19:05:25', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('201', '1001', 'admin', 'login', '2021-11-07 19:06:49', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('202', '1001', 'admin', 'logout', '2021-11-07 19:37:43', '-');
INSERT INTO `wms_access_record` VALUES ('203', '1001', 'admin', 'login', '2021-11-07 21:33:56', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('204', '1001', 'admin', 'login', '2021-11-07 21:43:07', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('205', '1001', 'admin', 'login', '2021-11-07 21:49:20', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('206', '1001', 'admin', 'login', '2021-11-07 21:52:23', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('207', '1001', 'admin', 'login', '2021-11-07 21:58:25', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('208', '1001', 'admin', 'login', '2021-11-07 21:59:45', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('209', '1001', 'admin', 'login', '2021-11-07 22:08:12', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('210', '1001', 'admin', 'login', '2021-11-07 22:10:46', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('211', '1001', 'admin', 'login', '2021-11-07 22:12:14', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('212', '1001', 'admin', 'login', '2021-11-07 22:14:40', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('213', '1001', 'admin', 'login', '2021-11-07 22:17:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('214', '1001', 'admin', 'login', '2021-11-07 22:22:07', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('215', '1001', 'admin', 'login', '2021-11-07 22:39:37', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('216', '1001', 'admin', 'login', '2021-11-07 22:42:05', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('217', '1001', 'admin', 'login', '2021-11-07 22:57:17', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('218', '1001', 'admin', 'login', '2021-11-07 23:00:18', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('219', '1001', 'admin', 'login', '2021-11-07 23:09:00', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('220', '1001', 'admin', 'login', '2021-11-07 23:10:31', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('221', '1001', 'admin', 'login', '2021-11-07 23:12:06', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('222', '1001', 'admin', 'login', '2021-11-07 23:15:30', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('223', '1001', 'admin', 'login', '2021-11-07 23:19:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('224', '1001', 'admin', 'login', '2021-11-07 23:27:43', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('225', '1001', 'admin', 'login', '2021-11-07 23:30:13', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('226', '1001', 'admin', 'login', '2021-11-07 23:34:58', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('227', '1001', 'admin', 'login', '2021-11-07 23:37:19', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('228', '1001', 'admin', 'login', '2021-11-07 23:39:40', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('229', '1001', 'admin', 'logout', '2021-11-08 00:10:36', '-');
INSERT INTO `wms_access_record` VALUES ('230', '1001', 'admin', 'login', '2021-11-08 01:02:27', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('231', '1001', 'admin', 'login', '2021-11-08 01:07:25', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('232', '1001', 'admin', 'login', '2021-11-08 01:10:20', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('233', '1001', 'admin', 'login', '2021-11-08 01:14:04', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('234', '1001', 'admin', 'login', '2021-11-08 01:15:50', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('235', '1001', 'admin', 'login', '2021-11-08 01:22:21', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('236', '1001', 'admin', 'login', '2021-11-08 01:26:35', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('237', '1001', 'admin', 'login', '2021-11-08 20:21:59', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('238', '1001', 'admin', 'logout', '2021-11-08 20:29:53', '-');
INSERT INTO `wms_access_record` VALUES ('239', '1018', 'wanghao', 'login', '2021-11-08 20:31:48', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('240', '1018', 'wanghao', 'logout', '2021-11-08 20:32:14', '-');
INSERT INTO `wms_access_record` VALUES ('241', '1019', 'lifurong', 'login', '2021-11-08 20:32:49', '0:0:0:0:0:0:0:1');
INSERT INTO `wms_access_record` VALUES ('242', '1019', 'lifurong', 'logout', '2021-11-08 20:32:53', '-');
INSERT INTO `wms_access_record` VALUES ('243', '1001', 'admin', 'login', '2021-11-08 20:33:09', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for wms_action
-- ----------------------------
DROP TABLE IF EXISTS `wms_action`;
CREATE TABLE `wms_action` (
  `ACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTION_NAME` varchar(30) NOT NULL,
  `ACTION_DESC` varchar(30) DEFAULT NULL,
  `ACTION_PARAM` varchar(50) NOT NULL,
  PRIMARY KEY (`ACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_action
-- ----------------------------
INSERT INTO `wms_action` VALUES ('1', 'addSupplier', null, '/supplierManage/addSupplier');
INSERT INTO `wms_action` VALUES ('2', 'deleteSupplier', null, '/supplierManage/deleteSupplier');
INSERT INTO `wms_action` VALUES ('3', 'updateSupplier', null, '/supplierManage/updateSupplier');
INSERT INTO `wms_action` VALUES ('4', 'selectSupplier', null, '/supplierManage/getSupplierList');
INSERT INTO `wms_action` VALUES ('5', 'getSupplierInfo', null, '/supplierManage/getSupplierInfo');
INSERT INTO `wms_action` VALUES ('6', 'importSupplier', null, '/supplierManage/importSupplier');
INSERT INTO `wms_action` VALUES ('7', 'exportSupplier', null, '/supplierManage/exportSupplier');
INSERT INTO `wms_action` VALUES ('8', 'selectCustomer', null, '/customerManage/getCustomerList');
INSERT INTO `wms_action` VALUES ('9', 'addCustomer', null, '/customerManage/addCustomer');
INSERT INTO `wms_action` VALUES ('10', 'getCustomerInfo', null, '/customerManage/getCustomerInfo');
INSERT INTO `wms_action` VALUES ('11', 'updateCustomer', null, '/customerManage/updateCustomer');
INSERT INTO `wms_action` VALUES ('12', 'deleteCustomer', null, '/customerManage/deleteCustomer');
INSERT INTO `wms_action` VALUES ('13', 'importCustomer', null, '/customerManage/importCustomer');
INSERT INTO `wms_action` VALUES ('14', 'exportCustomer', null, '/customerManage/exportCustomer');
INSERT INTO `wms_action` VALUES ('15', 'selectGoods', null, '/goodsManage/getGoodsList');
INSERT INTO `wms_action` VALUES ('16', 'addGoods', null, '/goodsManage/addGoods');
INSERT INTO `wms_action` VALUES ('17', 'getGoodsInfo', null, '/goodsManage/getGoodsInfo');
INSERT INTO `wms_action` VALUES ('18', 'updateGoods', null, '/goodsManage/updateGoods');
INSERT INTO `wms_action` VALUES ('19', 'deleteGoods', null, '/goodsManage/deleteGoods');
INSERT INTO `wms_action` VALUES ('20', 'importGoods', null, '/goodsManage/importGoods');
INSERT INTO `wms_action` VALUES ('21', 'exportGoods', null, '/goodsManage/exportGoods');
INSERT INTO `wms_action` VALUES ('22', 'selectRepository', null, '/repositoryManage/getRepositoryList');
INSERT INTO `wms_action` VALUES ('23', 'addRepository', null, '/repositoryManage/addRepository');
INSERT INTO `wms_action` VALUES ('24', 'getRepositoryInfo', null, '/repositoryManage/getRepository');
INSERT INTO `wms_action` VALUES ('25', 'updateRepository', null, '/repositoryManage/updateRepository');
INSERT INTO `wms_action` VALUES ('26', 'deleteRepository', null, '/repositoryManage/deleteRepository');
INSERT INTO `wms_action` VALUES ('27', 'importRepository', null, '/repositoryManage/importRepository');
INSERT INTO `wms_action` VALUES ('28', 'exportRepository', null, '/repositoryManage/exportRepository');
INSERT INTO `wms_action` VALUES ('29', 'selectRepositoryAdmin', null, '/repositoryAdminManage/getRepositoryAdminList');
INSERT INTO `wms_action` VALUES ('30', 'addRepositoryAdmin', null, '/repositoryAdminManage/addRepositoryAdmin');
INSERT INTO `wms_action` VALUES ('31', 'getRepositoryAdminInfo', null, '/repositoryAdminManage/getRepositoryAdminInfo');
INSERT INTO `wms_action` VALUES ('32', 'updateRepositoryAdmin', null, '/repositoryAdminManage/updateRepositoryAdmin');
INSERT INTO `wms_action` VALUES ('33', 'deleteRepositoryAdmin', null, '/repositoryAdminManage/deleteRepositoryAdmin');
INSERT INTO `wms_action` VALUES ('34', 'importRepositoryAd,om', null, '/repositoryAdminManage/importRepositoryAdmin');
INSERT INTO `wms_action` VALUES ('35', 'exportRepository', null, '/repositoryAdminManage/exportRepositoryAdmin');
INSERT INTO `wms_action` VALUES ('36', 'getUnassignRepository', null, '/repositoryManage/getUnassignRepository');
INSERT INTO `wms_action` VALUES ('37', 'getStorageListWithRepository', null, '/storageManage/getStorageListWithRepository');
INSERT INTO `wms_action` VALUES ('38', 'getStorageList', null, '/storageManage/getStorageList');
INSERT INTO `wms_action` VALUES ('39', 'addStorageRecord', null, '/storageManage/addStorageRecord');
INSERT INTO `wms_action` VALUES ('40', 'updateStorageRecord', null, '/storageManage/updateStorageRecord');
INSERT INTO `wms_action` VALUES ('41', 'deleteStorageRecord', null, '/storageManage/deleteStorageRecord');
INSERT INTO `wms_action` VALUES ('42', 'importStorageRecord', null, '/storageManage/importStorageRecord');
INSERT INTO `wms_action` VALUES ('43', 'exportStorageRecord', null, '/storageManage/exportStorageRecord');
INSERT INTO `wms_action` VALUES ('44', ' stockIn', null, '/stockRecordManage/stockIn');
INSERT INTO `wms_action` VALUES ('45', 'stockOut', null, '/stockRecordManage/stockOut');
INSERT INTO `wms_action` VALUES ('46', 'searchStockRecord', null, '/stockRecordManage/searchStockRecord');
INSERT INTO `wms_action` VALUES ('47', 'getAccessRecords', null, '/systemLog/getAccessRecords');
INSERT INTO `wms_action` VALUES ('48', 'selectUserOperationRecords', null, '/systemLog/selectUserOperationRecords');

-- ----------------------------
-- Table structure for wms_customer
-- ----------------------------
DROP TABLE IF EXISTS `wms_customer`;
CREATE TABLE `wms_customer` (
  `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_NAME` varchar(30) NOT NULL,
  `CUSTOMER_PERSON` varchar(10) NOT NULL,
  `CUSTOMER_TEL` varchar(20) NOT NULL,
  `CUSTOMER_EMAIL` varchar(20) NOT NULL,
  `CUSTOMER_ADDRESS` varchar(30) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_customer
-- ----------------------------
INSERT INTO `wms_customer` VALUES ('1214', '醴陵荣旗瓷业有限公司', '陈娟', '17716786888', '23369888@136.com', '中国 湖南 醴陵市 嘉树乡玉茶村柏树组');
INSERT INTO `wms_customer` VALUES ('1215', '深圳市松林达电子有限公司', '刘明', '85263335-820', '85264958@126.com', '中国 广东 深圳市宝安区 深圳市宝安区福永社区桥头村桥塘路育');
INSERT INTO `wms_customer` VALUES ('1216', '郑州绿之源饮品有限公司 ', '赵志敬', '87094196', '87092165@qq.com', '中国 河南 郑州市 郑州市嘉亿东方大厦609');

-- ----------------------------
-- Table structure for wms_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods`;
CREATE TABLE `wms_goods` (
  `GOOD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOOD_CODE` varchar(64) NOT NULL COMMENT '货物编号',
  `GOOD_NAME` varchar(30) NOT NULL COMMENT '货物描述',
  `GOOD_RYPE` varchar(20) DEFAULT NULL COMMENT '货物类型',
  `GOOD_SIZE` varchar(20) DEFAULT NULL COMMENT '货物单位',
  `GOOD_VALUE` double DEFAULT NULL,
  `GOOD_CAR_NUMBER` varchar(64) DEFAULT NULL COMMENT '车号',
  `GOOD_IMPORTANCE` varchar(32) DEFAULT NULL COMMENT '货物重要性',
  `GOOD_IMAGE` varchar(255) DEFAULT NULL COMMENT '物资照片',
  PRIMARY KEY (`GOOD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_goods
-- ----------------------------
INSERT INTO `wms_goods` VALUES ('103', '', '五孔插座西门子墙壁开关', '电器', '86*86', '1.85', null, null, null);
INSERT INTO `wms_goods` VALUES ('104', '', '陶瓷马克杯', '陶瓷', '9*9*11', '3.5', null, null, null);
INSERT INTO `wms_goods` VALUES ('105', '', '精酿苹果醋', '饮料', '312ml', '300', null, null, null);

-- ----------------------------
-- Table structure for wms_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `wms_operation_record`;
CREATE TABLE `wms_operation_record` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `OPERATION_NAME` varchar(30) NOT NULL,
  `OPERATION_TIME` datetime NOT NULL,
  `OPERATION_RESULT` varchar(15) NOT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_operation_record
-- ----------------------------
INSERT INTO `wms_operation_record` VALUES ('1', '1001', 'admin', '添加库存记录', '2021-11-02 21:28:27', '失败');
INSERT INTO `wms_operation_record` VALUES ('2', '1001', 'admin', '添加库存记录', '2021-11-02 21:29:09', '失败');
INSERT INTO `wms_operation_record` VALUES ('3', '1001', 'admin', '添加库存记录', '2021-11-02 21:29:28', '失败');
INSERT INTO `wms_operation_record` VALUES ('4', '1001', 'admin', '添加仓库管理员信息', '2021-11-02 21:33:29', '成功');
INSERT INTO `wms_operation_record` VALUES ('5', '1001', 'admin', '删除仓库管理员信息', '2021-11-02 21:33:35', '成功');
INSERT INTO `wms_operation_record` VALUES ('6', '1001', 'admin', '添加仓库管理员信息', '2021-11-03 20:26:30', '成功');
INSERT INTO `wms_operation_record` VALUES ('7', '1001', 'admin', '删除仓库管理员信息', '2021-11-03 20:26:52', '成功');
INSERT INTO `wms_operation_record` VALUES ('8', '1001', 'admin', '导出货物信息', '2021-11-03 20:46:51', '-');
INSERT INTO `wms_operation_record` VALUES ('9', '1001', 'admin', '删除货物信息', '2021-11-03 21:30:09', '失败');
INSERT INTO `wms_operation_record` VALUES ('10', '1001', 'admin', '删除货物信息', '2021-11-03 21:31:16', '失败');
INSERT INTO `wms_operation_record` VALUES ('11', '1001', 'admin', '添加仓库信息', '2021-11-03 23:10:22', '成功');
INSERT INTO `wms_operation_record` VALUES ('12', '1001', 'admin', '删除仓库信息', '2021-11-03 23:10:30', '成功');
INSERT INTO `wms_operation_record` VALUES ('13', '1001', 'admin', '修改仓库信息', '2021-11-03 23:10:43', '成功');
INSERT INTO `wms_operation_record` VALUES ('14', '1001', 'admin', '修改仓库信息', '2021-11-03 23:10:55', '成功');
INSERT INTO `wms_operation_record` VALUES ('15', '1001', 'admin', '修改仓库信息', '2021-11-03 23:11:03', '成功');
INSERT INTO `wms_operation_record` VALUES ('16', '1001', 'admin', '修改仓库信息', '2021-11-03 23:11:13', '成功');
INSERT INTO `wms_operation_record` VALUES ('17', '1001', 'admin', '添加库存记录', '2021-11-04 20:11:14', '失败');
INSERT INTO `wms_operation_record` VALUES ('18', '1001', 'admin', '添加货物信息', '2021-11-04 21:54:09', '失败');
INSERT INTO `wms_operation_record` VALUES ('19', '1001', 'admin', '添加货物信息', '2021-11-04 22:04:35', '成功');
INSERT INTO `wms_operation_record` VALUES ('20', '1001', 'admin', '修改货物信息', '2021-11-04 22:08:02', '成功');
INSERT INTO `wms_operation_record` VALUES ('21', '1001', 'admin', '导入库存记录', '2021-11-05 19:59:39', '-');
INSERT INTO `wms_operation_record` VALUES ('22', '1001', 'admin', '导出库存记录', '2021-11-05 22:46:20', '-');
INSERT INTO `wms_operation_record` VALUES ('23', '1001', 'admin', '修改库存记录', '2021-11-05 23:23:14', '成功');
INSERT INTO `wms_operation_record` VALUES ('24', '1001', 'admin', '修改库存记录', '2021-11-05 23:23:46', '成功');
INSERT INTO `wms_operation_record` VALUES ('25', '1001', 'admin', '添加库存记录', '2021-11-06 00:27:20', '成功');
INSERT INTO `wms_operation_record` VALUES ('26', '1001', 'admin', '修改库存记录', '2021-11-06 00:27:26', '成功');
INSERT INTO `wms_operation_record` VALUES ('27', '1001', 'admin', '删除库存记录', '2021-11-06 00:27:55', '成功');
INSERT INTO `wms_operation_record` VALUES ('28', '1001', 'admin', '导出仓库管理员信息', '2021-11-06 00:29:59', '-');
INSERT INTO `wms_operation_record` VALUES ('29', '1001', 'admin', '导入库存记录', '2021-11-06 00:41:48', '-');
INSERT INTO `wms_operation_record` VALUES ('30', '1001', 'admin', '导入库存记录', '2021-11-06 00:48:07', '-');
INSERT INTO `wms_operation_record` VALUES ('31', '1001', 'admin', '导入库存记录', '2021-11-06 00:52:39', '-');
INSERT INTO `wms_operation_record` VALUES ('32', '1001', 'admin', '导入库存记录', '2021-11-06 00:54:41', '-');
INSERT INTO `wms_operation_record` VALUES ('33', '1001', 'admin', '添加库存记录', '2021-11-06 00:56:14', '失败');
INSERT INTO `wms_operation_record` VALUES ('34', '1001', 'admin', '添加库存记录', '2021-11-06 00:57:05', '失败');
INSERT INTO `wms_operation_record` VALUES ('35', '1001', 'admin', '添加库存记录', '2021-11-06 00:57:15', '成功');
INSERT INTO `wms_operation_record` VALUES ('36', '1001', 'admin', '删除库存记录', '2021-11-06 00:57:20', '成功');
INSERT INTO `wms_operation_record` VALUES ('37', '1001', 'admin', '添加库存记录', '2021-11-06 00:57:31', '成功');
INSERT INTO `wms_operation_record` VALUES ('38', '1001', 'admin', '删除库存记录', '2021-11-06 00:57:45', '成功');
INSERT INTO `wms_operation_record` VALUES ('39', '1001', 'admin', '添加库存记录', '2021-11-06 00:58:08', '成功');
INSERT INTO `wms_operation_record` VALUES ('40', '1001', 'admin', '导出库存记录', '2021-11-06 00:58:23', '-');
INSERT INTO `wms_operation_record` VALUES ('41', '1001', 'admin', '删除库存记录', '2021-11-06 00:59:21', '成功');
INSERT INTO `wms_operation_record` VALUES ('42', '1001', 'admin', '导入库存记录', '2021-11-06 00:59:33', '-');
INSERT INTO `wms_operation_record` VALUES ('43', '1001', 'admin', '导入库存记录', '2021-11-06 01:00:12', '-');
INSERT INTO `wms_operation_record` VALUES ('44', '1001', 'admin', '导入库存记录', '2021-11-06 02:11:38', '-');
INSERT INTO `wms_operation_record` VALUES ('45', '1001', 'admin', '导入库存记录', '2021-11-06 02:16:30', '-');
INSERT INTO `wms_operation_record` VALUES ('46', '1001', 'admin', '删除库存记录', '2021-11-06 02:16:45', '成功');
INSERT INTO `wms_operation_record` VALUES ('47', '1001', 'admin', '导入库存记录', '2021-11-06 02:18:32', '-');
INSERT INTO `wms_operation_record` VALUES ('48', '1001', 'admin', '删除库存记录', '2021-11-06 02:19:35', '成功');
INSERT INTO `wms_operation_record` VALUES ('49', '1001', 'admin', '导入仓库管理员信息', '2021-11-06 02:30:54', '-');
INSERT INTO `wms_operation_record` VALUES ('50', '1001', 'admin', '导出仓库管理员信息', '2021-11-06 02:31:22', '-');
INSERT INTO `wms_operation_record` VALUES ('51', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 02:52:08', '成功');
INSERT INTO `wms_operation_record` VALUES ('52', '1001', 'admin', '添加仓库管理员信息', '2021-11-06 03:02:05', '成功');
INSERT INTO `wms_operation_record` VALUES ('53', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:04:03', '成功');
INSERT INTO `wms_operation_record` VALUES ('54', '1001', 'admin', '添加仓库管理员信息', '2021-11-06 03:10:06', '成功');
INSERT INTO `wms_operation_record` VALUES ('55', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:24:38', '成功');
INSERT INTO `wms_operation_record` VALUES ('56', '1001', 'admin', '添加仓库管理员信息', '2021-11-06 03:25:20', '成功');
INSERT INTO `wms_operation_record` VALUES ('57', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:25:49', '成功');
INSERT INTO `wms_operation_record` VALUES ('58', '1001', 'admin', '导入仓库管理员信息', '2021-11-06 03:26:29', '-');
INSERT INTO `wms_operation_record` VALUES ('59', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:27:15', '失败');
INSERT INTO `wms_operation_record` VALUES ('60', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:28:29', '成功');
INSERT INTO `wms_operation_record` VALUES ('61', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:28:33', '成功');
INSERT INTO `wms_operation_record` VALUES ('62', '1001', 'admin', '删除仓库管理员信息', '2021-11-06 03:29:18', '成功');
INSERT INTO `wms_operation_record` VALUES ('63', '1001', 'admin', '导出仓库管理员信息', '2021-11-06 03:29:27', '-');
INSERT INTO `wms_operation_record` VALUES ('64', '1001', 'admin', '导出货物信息', '2021-11-06 03:30:39', '-');
INSERT INTO `wms_operation_record` VALUES ('65', '1001', 'admin', '导出仓库信息', '2021-11-06 03:34:33', '-');
INSERT INTO `wms_operation_record` VALUES ('66', '1001', 'admin', '导入货物信息', '2021-11-06 03:37:05', '-');
INSERT INTO `wms_operation_record` VALUES ('67', '1001', 'admin', '导入货物信息', '2021-11-06 03:43:23', '-');
INSERT INTO `wms_operation_record` VALUES ('68', '1001', 'admin', '添加货物信息', '2021-11-06 03:49:39', '成功');
INSERT INTO `wms_operation_record` VALUES ('69', '1001', 'admin', '删除货物信息', '2021-11-06 03:49:42', '成功');
INSERT INTO `wms_operation_record` VALUES ('70', '1001', 'admin', '导入货物信息', '2021-11-06 03:51:40', '-');
INSERT INTO `wms_operation_record` VALUES ('71', '1001', 'admin', '删除货物信息', '2021-11-06 03:51:56', '成功');
INSERT INTO `wms_operation_record` VALUES ('72', '1001', 'admin', '导入货物信息', '2021-11-06 03:53:15', '-');
INSERT INTO `wms_operation_record` VALUES ('73', '1001', 'admin', '删除货物信息', '2021-11-06 03:53:22', '成功');
INSERT INTO `wms_operation_record` VALUES ('74', '1001', 'admin', '添加货物信息', '2021-11-06 13:34:12', '成功');
INSERT INTO `wms_operation_record` VALUES ('75', '1001', 'admin', '删除货物信息', '2021-11-06 13:34:18', '成功');
INSERT INTO `wms_operation_record` VALUES ('76', '1001', 'admin', '添加货物信息', '2021-11-06 15:00:17', '成功');
INSERT INTO `wms_operation_record` VALUES ('77', '1001', 'admin', '添加货物信息', '2021-11-06 19:38:12', '成功');
INSERT INTO `wms_operation_record` VALUES ('78', '1001', 'admin', '删除货物信息', '2021-11-06 19:49:04', '成功');
INSERT INTO `wms_operation_record` VALUES ('79', '1001', 'admin', '删除货物信息', '2021-11-06 19:49:07', '成功');
INSERT INTO `wms_operation_record` VALUES ('80', '1001', 'admin', '添加货物信息', '2021-11-06 19:49:18', '成功');
INSERT INTO `wms_operation_record` VALUES ('81', '1001', 'admin', '删除货物信息', '2021-11-06 19:59:56', '成功');
INSERT INTO `wms_operation_record` VALUES ('82', '1001', 'admin', '添加货物信息', '2021-11-06 20:00:13', '成功');
INSERT INTO `wms_operation_record` VALUES ('83', '1001', 'admin', '添加货物信息', '2021-11-06 23:11:55', '成功');
INSERT INTO `wms_operation_record` VALUES ('84', '1001', 'admin', '删除货物信息', '2021-11-06 23:13:06', '成功');
INSERT INTO `wms_operation_record` VALUES ('85', '1001', 'admin', '删除货物信息', '2021-11-06 23:13:12', '成功');
INSERT INTO `wms_operation_record` VALUES ('86', '1001', 'admin', '添加货物信息', '2021-11-07 00:13:30', '成功');
INSERT INTO `wms_operation_record` VALUES ('87', '1001', 'admin', '删除货物信息', '2021-11-07 02:52:58', '成功');
INSERT INTO `wms_operation_record` VALUES ('88', '1001', 'admin', '添加货物信息', '2021-11-07 02:53:14', '成功');
INSERT INTO `wms_operation_record` VALUES ('89', '1001', 'admin', '修改货物信息', '2021-11-07 14:38:26', '成功');
INSERT INTO `wms_operation_record` VALUES ('90', '1001', 'admin', '修改货物信息', '2021-11-07 14:41:29', '成功');
INSERT INTO `wms_operation_record` VALUES ('91', '1001', 'admin', '修改货物信息', '2021-11-07 14:44:39', '成功');
INSERT INTO `wms_operation_record` VALUES ('92', '1001', 'admin', '删除货物信息', '2021-11-07 14:58:42', '成功');
INSERT INTO `wms_operation_record` VALUES ('93', '1001', 'admin', '添加货物信息', '2021-11-07 14:59:04', '成功');
INSERT INTO `wms_operation_record` VALUES ('94', '1001', 'admin', '删除货物信息', '2021-11-07 14:59:23', '成功');
INSERT INTO `wms_operation_record` VALUES ('95', '1001', 'admin', '修改货物信息', '2021-11-07 14:59:36', '成功');
INSERT INTO `wms_operation_record` VALUES ('96', '1001', 'admin', '修改货物信息', '2021-11-07 14:59:48', '成功');
INSERT INTO `wms_operation_record` VALUES ('97', '1001', 'admin', '修改货物信息', '2021-11-07 15:02:45', '成功');
INSERT INTO `wms_operation_record` VALUES ('98', '1001', 'admin', '修改货物信息', '2021-11-07 15:03:16', '成功');
INSERT INTO `wms_operation_record` VALUES ('99', '1001', 'admin', '修改货物信息', '2021-11-07 15:03:52', '成功');
INSERT INTO `wms_operation_record` VALUES ('100', '1001', 'admin', '修改货物信息', '2021-11-07 15:09:44', '成功');
INSERT INTO `wms_operation_record` VALUES ('101', '1001', 'admin', '修改货物信息', '2021-11-07 15:09:57', '成功');
INSERT INTO `wms_operation_record` VALUES ('102', '1001', 'admin', '删除货物信息', '2021-11-07 15:10:09', '成功');
INSERT INTO `wms_operation_record` VALUES ('103', '1001', 'admin', '添加货物信息', '2021-11-07 15:10:34', '成功');
INSERT INTO `wms_operation_record` VALUES ('104', '1001', 'admin', '修改货物信息', '2021-11-07 15:10:47', '成功');
INSERT INTO `wms_operation_record` VALUES ('105', '1001', 'admin', '删除货物信息', '2021-11-07 15:10:56', '成功');
INSERT INTO `wms_operation_record` VALUES ('106', '1001', 'admin', '添加货物信息', '2021-11-07 15:11:08', '成功');
INSERT INTO `wms_operation_record` VALUES ('107', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:07:57', '失败');
INSERT INTO `wms_operation_record` VALUES ('108', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:16:10', '失败');
INSERT INTO `wms_operation_record` VALUES ('109', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:22:30', '失败');
INSERT INTO `wms_operation_record` VALUES ('110', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:23:45', '失败');
INSERT INTO `wms_operation_record` VALUES ('111', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:26:49', '失败');
INSERT INTO `wms_operation_record` VALUES ('112', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:28:41', '失败');
INSERT INTO `wms_operation_record` VALUES ('113', '1001', 'admin', '添加仓库管理员信息', '2021-11-08 01:31:08', '成功');
INSERT INTO `wms_operation_record` VALUES ('114', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:31:14', '失败');
INSERT INTO `wms_operation_record` VALUES ('115', '1001', 'admin', '修改仓库管理员信息', '2021-11-08 01:33:36', '失败');
INSERT INTO `wms_operation_record` VALUES ('116', '1001', 'admin', '删除仓库管理员信息', '2021-11-08 20:25:40', '成功');
INSERT INTO `wms_operation_record` VALUES ('117', '1001', 'admin', '删除货物信息', '2021-11-08 20:28:49', '成功');

-- ----------------------------
-- Table structure for wms_record_in
-- ----------------------------
DROP TABLE IF EXISTS `wms_record_in`;
CREATE TABLE `wms_record_in` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECORD_SUPPLIERID` int(11) NOT NULL,
  `RECORD_GOODID` int(11) NOT NULL,
  `RECORD_NUMBER` int(11) NOT NULL,
  `RECORD_TIME` datetime NOT NULL,
  `RECORD_PERSON` varchar(10) NOT NULL,
  `RECORD_REPOSITORYID` int(11) NOT NULL,
  PRIMARY KEY (`RECORD_ID`),
  KEY `RECORD_SUPPLIERID` (`RECORD_SUPPLIERID`),
  KEY `RECORD_GOODID` (`RECORD_GOODID`),
  KEY `RECORD_REPOSITORYID` (`RECORD_REPOSITORYID`),
  CONSTRAINT `wms_record_in_ibfk_1` FOREIGN KEY (`RECORD_SUPPLIERID`) REFERENCES `wms_supplier` (`SUPPLIER_ID`),
  CONSTRAINT `wms_record_in_ibfk_2` FOREIGN KEY (`RECORD_GOODID`) REFERENCES `wms_goods` (`GOOD_ID`),
  CONSTRAINT `wms_record_in_ibfk_3` FOREIGN KEY (`RECORD_REPOSITORYID`) REFERENCES `wms_respository` (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_record_in
-- ----------------------------
INSERT INTO `wms_record_in` VALUES ('15', '1015', '105', '1000', '2016-12-31 00:00:00', 'admin', '1004');
INSERT INTO `wms_record_in` VALUES ('16', '1015', '105', '200', '2017-01-02 00:00:00', 'admin', '1004');

-- ----------------------------
-- Table structure for wms_record_out
-- ----------------------------
DROP TABLE IF EXISTS `wms_record_out`;
CREATE TABLE `wms_record_out` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECORD_CUSTOMERID` int(11) NOT NULL,
  `RECORD_GOODID` int(11) NOT NULL,
  `RECORD_NUMBER` int(11) NOT NULL,
  `RECORD_TIME` datetime NOT NULL,
  `RECORD_PERSON` varchar(10) NOT NULL,
  `RECORD_REPOSITORYID` int(11) NOT NULL,
  PRIMARY KEY (`RECORD_ID`),
  KEY `RECORD_CUSTOMERID` (`RECORD_CUSTOMERID`),
  KEY `RECORD_GOODID` (`RECORD_GOODID`),
  KEY `RECORD_REPOSITORYID` (`RECORD_REPOSITORYID`),
  CONSTRAINT `wms_record_out_ibfk_1` FOREIGN KEY (`RECORD_CUSTOMERID`) REFERENCES `wms_customer` (`CUSTOMER_ID`),
  CONSTRAINT `wms_record_out_ibfk_2` FOREIGN KEY (`RECORD_GOODID`) REFERENCES `wms_goods` (`GOOD_ID`),
  CONSTRAINT `wms_record_out_ibfk_3` FOREIGN KEY (`RECORD_REPOSITORYID`) REFERENCES `wms_respository` (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_record_out
-- ----------------------------
INSERT INTO `wms_record_out` VALUES ('7', '1214', '104', '750', '2016-12-31 00:00:00', 'admin', '1003');

-- ----------------------------
-- Table structure for wms_record_storage
-- ----------------------------
DROP TABLE IF EXISTS `wms_record_storage`;
CREATE TABLE `wms_record_storage` (
  `RECORD_GOODID` int(11) NOT NULL AUTO_INCREMENT,
  `RECORD_REPOSITORY` int(11) NOT NULL,
  `RECORD_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`RECORD_GOODID`),
  KEY `RECORD_REPOSITORY` (`RECORD_REPOSITORY`),
  CONSTRAINT `wms_record_storage_ibfk_1` FOREIGN KEY (`RECORD_GOODID`) REFERENCES `wms_goods` (`GOOD_ID`),
  CONSTRAINT `wms_record_storage_ibfk_2` FOREIGN KEY (`RECORD_REPOSITORY`) REFERENCES `wms_respository` (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_record_storage
-- ----------------------------
INSERT INTO `wms_record_storage` VALUES ('103', '1005', '10000');
INSERT INTO `wms_record_storage` VALUES ('104', '1003', '1750');
INSERT INTO `wms_record_storage` VALUES ('105', '1004', '2000');

-- ----------------------------
-- Table structure for wms_repo_admin
-- ----------------------------
DROP TABLE IF EXISTS `wms_repo_admin`;
CREATE TABLE `wms_repo_admin` (
  `REPO_ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPO_ADMIN_USERNAME` varchar(20) NOT NULL COMMENT '仓库管理员用户名（用于账号登录）',
  `REPO_ADMIN_NAME` varchar(10) NOT NULL,
  `REPO_ADMIN_SEX` varchar(10) DEFAULT NULL,
  `REPO_ADMIN_TEL` varchar(20) NOT NULL,
  `REPO_ADMIN_ADDRESS` varchar(30) DEFAULT NULL,
  `REPO_ADMIN_BIRTH` datetime DEFAULT NULL,
  `REPO_ADMIN_REPOID` varchar(255) DEFAULT NULL COMMENT '所属仓库',
  PRIMARY KEY (`REPO_ADMIN_ID`),
  KEY `REPO_ADMIN_REPOID` (`REPO_ADMIN_REPOID`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_repo_admin
-- ----------------------------
INSERT INTO `wms_repo_admin` VALUES ('1018', 'wanghao', '王皓', '女', '12345874526', '中国佛山', '2016-12-09 00:00:00', '1004');
INSERT INTO `wms_repo_admin` VALUES ('1019', 'lifurong', '李富荣', '男', '1234', '广州', '2016-12-07 00:00:00', '1003');

-- ----------------------------
-- Table structure for wms_respository
-- ----------------------------
DROP TABLE IF EXISTS `wms_respository`;
CREATE TABLE `wms_respository` (
  `REPO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPO_NAME` varchar(64) NOT NULL COMMENT '仓库名称',
  `REPO_ADDRESS` varchar(64) NOT NULL,
  `REPO_STATUS` varchar(20) NOT NULL,
  `REPO_AREA` varchar(20) DEFAULT NULL,
  `REPO_DESC` varchar(50) DEFAULT NULL,
  `REPO_ADMIN_ID` int(11) DEFAULT NULL COMMENT '仓库管理员ID',
  PRIMARY KEY (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_respository
-- ----------------------------
INSERT INTO `wms_respository` VALUES ('1003', '北京顺义仓库', '北京顺义南彩工业园区彩祥西路9号', '可用', '11000㎡', '提供服务完整', null);
INSERT INTO `wms_respository` VALUES ('1004', '广州白云仓库', '广州白云石井石潭路大基围工业区', '可用', '1000㎡', '物流极为便利', null);
INSERT INTO `wms_respository` VALUES ('1005', '香港北区仓库', ' 香港北区文锦渡路（红桥新村）', '可用', '5000.00㎡', '', null);

-- ----------------------------
-- Table structure for wms_roles
-- ----------------------------
DROP TABLE IF EXISTS `wms_roles`;
CREATE TABLE `wms_roles` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) NOT NULL,
  `ROLE_DESC` varchar(30) DEFAULT NULL,
  `ROLE_URL_PREFIX` varchar(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_roles
-- ----------------------------
INSERT INTO `wms_roles` VALUES ('1', 'systemAdmin', null, 'systemAdmin');
INSERT INTO `wms_roles` VALUES ('2', 'commonsAdmin', null, 'commonsAdmin');

-- ----------------------------
-- Table structure for wms_role_action
-- ----------------------------
DROP TABLE IF EXISTS `wms_role_action`;
CREATE TABLE `wms_role_action` (
  `ACTION_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ACTION_ID`,`ROLE_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `wms_role_action_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `wms_roles` (`ROLE_ID`),
  CONSTRAINT `wms_role_action_ibfk_2` FOREIGN KEY (`ACTION_ID`) REFERENCES `wms_action` (`ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_role_action
-- ----------------------------
INSERT INTO `wms_role_action` VALUES ('1', '1');
INSERT INTO `wms_role_action` VALUES ('2', '1');
INSERT INTO `wms_role_action` VALUES ('3', '1');
INSERT INTO `wms_role_action` VALUES ('4', '1');
INSERT INTO `wms_role_action` VALUES ('5', '1');
INSERT INTO `wms_role_action` VALUES ('6', '1');
INSERT INTO `wms_role_action` VALUES ('7', '1');
INSERT INTO `wms_role_action` VALUES ('8', '1');
INSERT INTO `wms_role_action` VALUES ('9', '1');
INSERT INTO `wms_role_action` VALUES ('10', '1');
INSERT INTO `wms_role_action` VALUES ('11', '1');
INSERT INTO `wms_role_action` VALUES ('12', '1');
INSERT INTO `wms_role_action` VALUES ('13', '1');
INSERT INTO `wms_role_action` VALUES ('14', '1');
INSERT INTO `wms_role_action` VALUES ('15', '1');
INSERT INTO `wms_role_action` VALUES ('16', '1');
INSERT INTO `wms_role_action` VALUES ('17', '1');
INSERT INTO `wms_role_action` VALUES ('18', '1');
INSERT INTO `wms_role_action` VALUES ('19', '1');
INSERT INTO `wms_role_action` VALUES ('20', '1');
INSERT INTO `wms_role_action` VALUES ('21', '1');
INSERT INTO `wms_role_action` VALUES ('22', '1');
INSERT INTO `wms_role_action` VALUES ('23', '1');
INSERT INTO `wms_role_action` VALUES ('24', '1');
INSERT INTO `wms_role_action` VALUES ('25', '1');
INSERT INTO `wms_role_action` VALUES ('26', '1');
INSERT INTO `wms_role_action` VALUES ('27', '1');
INSERT INTO `wms_role_action` VALUES ('28', '1');
INSERT INTO `wms_role_action` VALUES ('29', '1');
INSERT INTO `wms_role_action` VALUES ('30', '1');
INSERT INTO `wms_role_action` VALUES ('31', '1');
INSERT INTO `wms_role_action` VALUES ('32', '1');
INSERT INTO `wms_role_action` VALUES ('33', '1');
INSERT INTO `wms_role_action` VALUES ('34', '1');
INSERT INTO `wms_role_action` VALUES ('35', '1');
INSERT INTO `wms_role_action` VALUES ('36', '1');
INSERT INTO `wms_role_action` VALUES ('37', '1');
INSERT INTO `wms_role_action` VALUES ('39', '1');
INSERT INTO `wms_role_action` VALUES ('40', '1');
INSERT INTO `wms_role_action` VALUES ('41', '1');
INSERT INTO `wms_role_action` VALUES ('42', '1');
INSERT INTO `wms_role_action` VALUES ('43', '1');
INSERT INTO `wms_role_action` VALUES ('44', '1');
INSERT INTO `wms_role_action` VALUES ('45', '1');
INSERT INTO `wms_role_action` VALUES ('46', '1');
INSERT INTO `wms_role_action` VALUES ('47', '1');
INSERT INTO `wms_role_action` VALUES ('48', '1');
INSERT INTO `wms_role_action` VALUES ('4', '2');
INSERT INTO `wms_role_action` VALUES ('38', '2');
INSERT INTO `wms_role_action` VALUES ('43', '2');

-- ----------------------------
-- Table structure for wms_supplier
-- ----------------------------
DROP TABLE IF EXISTS `wms_supplier`;
CREATE TABLE `wms_supplier` (
  `SUPPLIER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUPPLIER_NAME` varchar(30) NOT NULL,
  `SUPPLIER_PERSON` varchar(10) NOT NULL,
  `SUPPLIER_TEL` varchar(20) NOT NULL,
  `SUPPLIER_EMAIL` varchar(20) NOT NULL,
  `SUPPLIER_ADDRESS` varchar(30) NOT NULL,
  PRIMARY KEY (`SUPPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_supplier
-- ----------------------------
INSERT INTO `wms_supplier` VALUES ('1013', '浙江奇同电器有限公司', '王泽伟', '13777771126', '86827868@126.com', '中国 浙江 温州市龙湾区 龙湾区永强大道1648号');
INSERT INTO `wms_supplier` VALUES ('1014', '醴陵春天陶瓷实业有限公司', '温仙容', '13974167256', '23267999@126.com', '中国 湖南 醴陵市 东正街15号');
INSERT INTO `wms_supplier` VALUES ('1015', '洛阳嘉吉利饮品有限公司', '郑绮云', '26391678', '22390898@qq.com', '中国 广东 佛山市顺德区 北滘镇怡和路2号怡和中心14楼');

-- ----------------------------
-- Table structure for wms_user
-- ----------------------------
DROP TABLE IF EXISTS `wms_user`;
CREATE TABLE `wms_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_USERNAME` varchar(30) NOT NULL,
  `NAME` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `USER_PASSWORD` varchar(40) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_user
-- ----------------------------
INSERT INTO `wms_user` VALUES ('1001', 'admin', '系统管理员', 'c7122a1349c22cb3c009da3613d242ab');
INSERT INTO `wms_user` VALUES ('1018', 'wanghao', '王皓', '76c63ff8380461f4e223b2690ff65cbb');
INSERT INTO `wms_user` VALUES ('1019', 'lifurong', '李富荣', '4d95cdbee390c96b0d8364504c06e634');

-- ----------------------------
-- Table structure for wms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `wms_user_role`;
CREATE TABLE `wms_user_role` (
  `ROLE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `wms_user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `wms_roles` (`ROLE_ID`),
  CONSTRAINT `wms_user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `wms_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wms_user_role
-- ----------------------------
INSERT INTO `wms_user_role` VALUES ('1', '1001');
INSERT INTO `wms_user_role` VALUES ('2', '1018');
INSERT INTO `wms_user_role` VALUES ('2', '1019');
