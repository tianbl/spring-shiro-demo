/*
Navicat MySQL Data Transfer

Source Server         : play
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : iotplantform

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-01-12 15:26:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iot_things`
-- ----------------------------
DROP TABLE IF EXISTS `iot_things`;
CREATE TABLE `iot_things` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(1024) NOT NULL,
  `topic` varchar(1024) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_things
-- ----------------------------
