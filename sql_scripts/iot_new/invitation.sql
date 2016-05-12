/*
Navicat MySQL Data Transfer

Source Server         : 129.1.99.4:3306
Source Server Version : 50505
Source Host           : 129.1.99.4:3306
Source Database       : iotplatform

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2015-12-17 09:55:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `invitation`
-- ----------------------------
DROP TABLE IF EXISTS `invitation`;
CREATE TABLE `invitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(22) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `tenant_id` bigint(20) DEFAULT NULL,
  `project_size` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invitation
-- ----------------------------
