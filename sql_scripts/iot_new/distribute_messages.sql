/*
Navicat MySQL Data Transfer

Source Server         : local_iotplatform
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : iotplatform

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-08 18:06:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for distribute_messages
-- ----------------------------
DROP TABLE IF EXISTS `distribute_messages`;
CREATE TABLE `distribute_messages` (
  `DISTRIB_ID` varchar(50) NOT NULL COMMENT '主键ID',
  `DISTRIBUTER` char(2) NOT NULL COMMENT '消息发布者RNPT – 门户RNRE – 规则引擎RNMN – 系统监控(KAMON)',
  `DISTRIBUTER_RULE_ID` bigint(20) DEFAULT NULL COMMENT '用于RE和MN定义的规则ID，默认为空',
  `MSG_UUID` varchar(50) NOT NULL COMMENT '原始消息发布者生成的UUID',
  `MSG_TOTAL_NUM` int(11) NOT NULL COMMENT '原始消息中总共的ACTION个数',
  `MSG_INDEX` int(11) NOT NULL COMMENT '该消息为原消息中ACTION索引',
  `SEND_TYPE` char(4) NOT NULL COMMENT '消息发送方式：RNHTTP – 通过HTTP发送RNMAIL – 通过邮件发送',
  `DESTINATION` varchar(128) NOT NULL COMMENT '如果DEST_TYPE为HTTP， 填写目的地的URLRN如果DEST_TYPE为MAIL， 填写收件人信息',
  `ORIGIN_CONTENT` varchar(1000) NOT NULL COMMENT '消息内容(JSON格式)，为DEST_TYPE方式下对应的HTTPPARAMS或EMAILPARAMS的内容',
  `PRIORITY` int(1) NOT NULL COMMENT '发送优先级：RN1表示系统平台级紧急告警信息RN2表示用户级紧急告警信息RN3表示规则引擎产生的推送信息RN4表示门户产生的推送信息',
  `RETRY_TIME` int(1) NOT NULL DEFAULT '0' COMMENT '消息重发次数，默认为0',
  `DISTRIBUTE_STATUS` char(3) NOT NULL COMMENT '消息发送状态：RNNEW – 新消息RNPRC – 正在队列中等待发送RNCOM – 发送完成RNFAL – 发送失败',
  `DISTRIBUTE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`DISTRIB_ID`),
  UNIQUE KEY `UK_DISTRIBUTE_ID` (`DISTRIB_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for distribute_messages_his
-- ----------------------------
DROP TABLE IF EXISTS `distribute_messages_his`;
CREATE TABLE `distribute_messages_his` (
  `DISTRIB_ID` varchar(50) NOT NULL COMMENT '主键ID',
  `DISTRIBUTER` char(2) NOT NULL COMMENT '消息发布者RNPT – 门户RNRE – 规则引擎RNMN – 系统监控(KAMON)',
  `DISTRIBUTER_RULE_ID` bigint(20) DEFAULT NULL COMMENT '用于RE和MN定义的规则ID，默认为空',
  `MSG_UUID` varchar(50) NOT NULL COMMENT '原始消息发布者生成的UUID',
  `MSG_TOTAL_NUM` int(11) NOT NULL COMMENT '原始消息中总共的ACTION个数',
  `MSG_INDEX` int(11) NOT NULL COMMENT '该消息为原消息中ACTION索引',
  `SEND_TYPE` char(4) NOT NULL COMMENT '消息发送方式：RNHTTP – 通过HTTP发送RNMAIL – 通过邮件发送',
  `DESTINATION` varchar(128) NOT NULL COMMENT '如果DEST_TYPE为HTTP， 填写目的地的URLRN如果DEST_TYPE为MAIL， 填写收件人信息',
  `ORIGIN_CONTENT` varchar(1000) NOT NULL COMMENT '消息内容(JSON格式)，为DEST_TYPE方式下对应的HTTPPARAMS或EMAILPARAMS的内容',
  `PRIORITY` int(1) NOT NULL COMMENT '发送优先级：RN1表示系统平台级紧急告警信息RN2表示用户级紧急告警信息RN3表示规则引擎产生的推送信息RN4表示门户产生的推送信息',
  `RETRY_TIME` int(1) NOT NULL DEFAULT '0' COMMENT '消息重发次数，默认为0',
  `DISTRIBUTE_STATUS` char(3) NOT NULL COMMENT '消息发送状态：RNNEW – 新消息RNPRC – 正在队列中等待发送RNCOM – 发送完成RNFAL – 发送失败',
  `DISTRIBUTE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`DISTRIB_ID`),
  UNIQUE KEY `UK_IOT_DEVICE_CODE` (`DISTRIB_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
