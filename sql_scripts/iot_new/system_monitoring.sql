/*
Navicat MySQL Data Transfer

Source Server         : local_iotplatform
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : iotplatform

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-15 13:57:30
*/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `alarm_group`;
CREATE TABLE `alarm_group` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alarm_member` varchar(100) NOT NULL,
  `alarm_method` varchar(4) NOT NULL,
  `alarm_contact` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_group
-- ----------------------------
INSERT INTO `alarm_group` VALUES ('1', '系统管理员', 'MAIL', 'zsk428@126.com', '1', '2016-01-15 14:42:29', null);

-- ----------------------------
-- Table structure for alarm_threshold_conf
-- ----------------------------
DROP TABLE IF EXISTS `alarm_threshold_conf`;
CREATE TABLE `alarm_threshold_conf` (
  `alarm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metrics_name` varchar(300) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `threshold_min` decimal(15,6) NOT NULL,
  `threshold_max` decimal(15,6) NOT NULL,
  `cp_start_time` varchar(10) NOT NULL,
  `display_text` varchar(1000) NOT NULL,
  `alarm_group` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`alarm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_threshold_conf
-- ----------------------------
INSERT INTO `alarm_threshold_conf` VALUES ('1', 'stats.timers.Broker-hub.localhost.system-metric.cpu.cpu-idle.mean', 'HUB主机监控CPU空闲百分比', '0.200000', '1.000000', '-30s', 'HUB主机cpu异常', '1', '0', '2016-01-15 13:51:36', '2016-01-15 22:31:32');
INSERT INTO `alarm_threshold_conf` VALUES ('2', 'stats.timers.Broker-things.localhost.system-metric.cpu.cpu-idle.mean', 'BROKER主机监控CPU空闲百分比', '0.200000', '1.000000', '-30s', 'BROKER主机监控CPU异常', '1', '0', '2016-01-15 13:53:45', '2016-01-15 22:31:43');
INSERT INTO `alarm_threshold_conf` VALUES ('3', 'asPercent(stats.timers.Broker-hub.localhost.system-metric.memory.memory-used.mean,stats.timers.Broker-hub.localhost.system-metric.memory.memory-total.mean)', 'HUB主机监控内存占用百分比', '0.000000', '0.800000', '-10min', 'HUB主机监控内存异常', '1', '0', '2016-01-15 14:24:02', '2016-01-15 22:34:21');
INSERT INTO `alarm_threshold_conf` VALUES ('4', 'asPercent(stats.timers.Broker-things.localhost.system-metric.memory.memory-used.mean,stats.timers.Broker-things.localhost.system-metric.memory.memory-total.mean)', 'BROKER主机监控内存占用百分比', '0.000000', '0.800000', '-10min', 'BROKER主机监控内存异常', '1', '0', '2016-01-15 14:25:16', '2016-01-15 22:31:57');
INSERT INTO `alarm_threshold_conf` VALUES ('5', 'stats.timers.Broker-hub.localhost.min-max-counter.deviceConnection.mean', 'HUB监控设备连接数量', '0.000000', '999999999.000000', '-10min', 'HUB监控设备连接异常(0-999999999)', '1', '0', '2016-01-15 14:29:30', '2016-01-15 22:38:31');
INSERT INTO `alarm_threshold_conf` VALUES ('6', 'stats.Broker-hub.localhost.counter.receivedMsg&format', 'HUB监控收到的消息数', '0.000000', '-1.000000', '-10min', 'HUB监控收到的消息数异常', '1', '1', '2016-01-15 14:35:06', '2016-01-15 22:44:39');
INSERT INTO `alarm_threshold_conf` VALUES ('7', 'stats.Broker-hub.localhost.counter.sentMsg', 'HUB监控发送的消息数', '0.000000', '-1.000000', '-10min', 'HUB监控发送的消息数异常', '1', '0', '2016-01-15 14:36:13', '2016-01-15 22:41:02');
INSERT INTO `alarm_threshold_conf` VALUES ('8', 'stats.Broker-hub.localhost.counter.receivedOctets', 'HUB监控接受包总大小', '-1.000000', '-1.000000', '-10min', 'Hub每个采集间隔接收的消息包总大小异常', '1', '0', '2016-01-15 14:57:26', '2016-01-15 22:44:36');
INSERT INTO `alarm_threshold_conf` VALUES ('9', 'stats.Broker-hub.localhost.counter.sentOctets', 'HUB监控发送包总大小', '-1.000000', '-1.000000', '-10min', 'Hub每个采集间隔发送的消息包总大小异常', '1', '0', '2016-01-15 14:59:09', '2016-01-15 22:33:22');

-- ----------------------------
-- Table structure for graphite_metrics_data
-- ----------------------------
DROP TABLE IF EXISTS `graphite_metrics_data`;
CREATE TABLE `graphite_metrics_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metrics_name` varchar(300) NOT NULL,
  `last_metrics_data` decimal(15,6) DEFAULT NULL,
  `trigger_alarm` int(11) NOT NULL,
  `trigger_alarm_count` int(11) NOT NULL,
  `last_metrics_time` timestamp NOT NULL DEFAULT '1970-01-01 13:00:00',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graphite_metrics_data
-- ----------------------------
INSERT INTO `graphite_metrics_data` VALUES ('10', 'stats.Broker-hub.localhost.counter.receivedMsg&format', '0.000000', '0', '1', '2016-01-15 22:29:45', '2016-01-15 20:10:44', '2016-01-15 21:39:46');
INSERT INTO `graphite_metrics_data` VALUES ('11', 'stats.Broker-hub.localhost.counter.sentMsg', '0.000000', '0', '2', '2016-01-15 22:31:55', '2016-01-15 20:10:44', '2016-01-15 21:39:47');
INSERT INTO `graphite_metrics_data` VALUES ('12', 'stats.timers.Broker-hub.localhost.system-metric.cpu.cpu-idle.mean', '98.500000', '0', '3', '2016-01-15 22:18:55', '2016-01-15 22:00:21', '2016-01-15 22:00:24');
INSERT INTO `graphite_metrics_data` VALUES ('13', 'stats.timers.Broker-things.localhost.system-metric.cpu.cpu-idle.mean', null, '1', '0', '2016-01-15 22:23:38', '2016-01-15 22:22:47', '2016-01-15 22:22:49');
INSERT INTO `graphite_metrics_data` VALUES ('14', 'asPercent(stats.timers.Broker-hub.localhost.system-metric.memory.memory-used.mean,stats.timers.Broker-hub.localhost.system-metric.memory.memory-total.mean)', '44.979920', '0', '1', '2016-01-15 22:22:10', '2016-01-15 22:24:42', '2016-01-15 22:24:44');
INSERT INTO `graphite_metrics_data` VALUES ('15', 'stats.timers.Broker-hub.localhost.min-max-counter.deviceConnection.mean', '9984.000000', '0', '2', '2016-01-15 22:26:50', '2016-01-15 22:35:43', '2016-01-15 22:35:45');
INSERT INTO `graphite_metrics_data` VALUES ('16', 'stats.Broker-hub.localhost.counter.receivedOctets', '0.000000', '0', '1', '2016-01-15 22:32:05', '2016-01-15 22:41:23', '2016-01-15 22:41:25');

