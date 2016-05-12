﻿

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


DROP TABLE IF EXISTS `invitation`;
CREATE TABLE `invitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(22) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `tenant_id` bigint(20) DEFAULT NULL,
  `project_size` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `iot_permission`;
CREATE TABLE `iot_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `wildcard` varchar(120) DEFAULT NULL,
  `type` varchar(120) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `iot_credential`;
CREATE TABLE `iot_credential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) BINARY NOT NULL,
  `password` varchar(120) BINARY NOT NULL,
  `status` int(11) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `alias` varchar(120) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `mqttPermissionLevel` varchar(120) DEFAULT NULL,
  `mqtt_permission` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_iot_cre_un_pwd` (`username`,`password`) USING BTREE,
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `iot_role`
-- ----------------------------
DROP TABLE IF EXISTS `iot_role`;
CREATE TABLE `iot_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0=disable,1=enable',
  `description` varchar(1024) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint(20) DEFAULT NULL,
  `type` varchar(50) NOT NULL COMMENT 'global,tenant两种类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `credentials_roles`
-- ----------------------------
DROP TABLE IF EXISTS `credentials_roles`;
CREATE TABLE `credentials_roles` (
  `credential_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `iot_permission`
-- ----------------------------
DROP TABLE IF EXISTS `iot_permission`;
CREATE TABLE `iot_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `wildcard` varchar(120) DEFAULT NULL,
  `type` varchar(120) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permission_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `iot_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `iot_tenant`;
CREATE TABLE `iot_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) BINARY NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `organization` varchar(50),
  `code` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 启用，2 禁用',
  `phone` varchar(50),
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `iot_project`
-- ----------------------------
DROP TABLE IF EXISTS `iot_project`;
CREATE TABLE `iot_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `partition_policy` varchar(120) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0:未激活,1:激活,2:无效',
  `domain` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `iot_group`
-- ----------------------------
DROP TABLE IF EXISTS `iot_group`;
CREATE TABLE `iot_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(127)  BINARY DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(120) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_iot_group_projectId_name` (`project_id`,`name`) USING BTREE,
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `iot_device`
-- ----------------------------
DROP TABLE IF EXISTS `iot_device`;
CREATE TABLE `iot_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `clientId` varchar(127) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_iot_device_code` (`code`) USING BTREE,
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31118 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `iot_geofences`
-- ----------------------------
DROP TABLE IF EXISTS `iot_geofences`;
CREATE TABLE `iot_geofences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) BINARY NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `device_id` bigint(20) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `longitude` varchar(16) NOT NULL,
  `radius` int(11) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(128) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for `iot_log`
-- ----------------------------
DROP TABLE IF EXISTS `iot_log`;
CREATE TABLE `iot_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(1024) DEFAULT NULL,
  `operator` varchar(1024) DEFAULT NULL,
  `device` varchar(1024) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发起动作的时间',
  `operation` varchar(1024) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30306 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `iot_rule`
-- ----------------------------
DROP TABLE IF EXISTS `iot_rule`;
CREATE TABLE `iot_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) BINARY NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `topic_filter` varchar(1024) NOT NULL,
  `content_filter` varchar(1024) DEFAULT NULL,
  `action` varchar(1024) NOT NULL,
  `create_by` varchar(120) DEFAULT NULL,
  `update_by` varchar(120) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `expiry_time` timestamp NULL DEFAULT NULL,
  `effective_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1激活，0禁用',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext COMMENT '账号名称',
  `amount` bigint(20) DEFAULT NULL COMMENT '余额',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `status` char(10) DEFAULT NULL COMMENT '0禁用 1 激活 2注销',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `payment_info`
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) DEFAULT NULL COMMENT '付款，充值金额',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id',
  `date` datetime DEFAULT NULL COMMENT '付款、充值日期',
  `description` longtext COMMENT '描述',
  `type` int(11) DEFAULT NULL COMMENT '1充值，2支付',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号，充值为空',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `system_unit`
-- ----------------------------
DROP TABLE IF EXISTS `system_unit`;
CREATE TABLE `system_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL COMMENT '单位名称',
  `unit_code` varchar(1024) NOT NULL COMMENT '单位代码,001:年；002:月；003:日；004:个',
  `status` int(11) DEFAULT NULL COMMENT '0禁用1 激活',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(1024) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `charge_type`
-- ----------------------------
DROP TABLE IF EXISTS `charge_type`;
CREATE TABLE `charge_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL COMMENT '付费类型名称',
  `status` int(11) NOT NULL COMMENT '0禁用，1激活',
  `type` int(11) NOT NULL COMMENT '付费类型 0免费，1周期计费',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '单位_id',
  `unit_number` int(11) DEFAULT NULL COMMENT '单位数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` varchar(1024) DEFAULT NULL,
  `update_user` varchar(1024) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_26` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `iot_order`
-- ----------------------------
DROP TABLE IF EXISTS `iot_order`;
CREATE TABLE `iot_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `status` int(11) NOT NULL COMMENT '0等待付款,1已付款,2禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单生成时间',
  `description` varchar(1024) DEFAULT NULL COMMENT '订单描述',
  `create_user` varchar(1024) DEFAULT NULL COMMENT '创建人',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '付款/激活时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `service`
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) BINARY NOT NULL COMMENT '服务名称',
  `status` int(11) DEFAULT NULL COMMENT '0 禁用 1激活',
  `code` varchar(1024) DEFAULT NULL COMMENT '服务代码，001:MQTT与broker之间的链接服务；002:引擎服务；003:大数据服务（数据采集）',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(1024) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `effective_date` date DEFAULT NULL COMMENT '生效时间',
  `expiry_date` date DEFAULT NULL COMMENT '过期时间',
  `create_user` varchar(1024) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(1024) BINARY NOT NULL COMMENT '产品名称',
  `price` bigint(20) DEFAULT NULL COMMENT '产品价格',
  `service_id` bigint(20) NOT NULL COMMENT '服务id',
  `status` int(11) DEFAULT NULL COMMENT '0禁用，1激活，2过期',
  `unit_number` int(11) DEFAULT NULL COMMENT '单位数量',
  `charge_type_id` bigint(20) DEFAULT NULL COMMENT '付费类型id',
  `system_unit_id` bigint(20) DEFAULT NULL COMMENT '单位',
  `update_user` varchar(1024) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `iot_service_instance`
-- ----------------------------
DROP TABLE IF EXISTS `iot_service_instance`;
CREATE TABLE `iot_service_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `effective_date` datetime DEFAULT NULL COMMENT '激活时间',
  `status` int(11) DEFAULT NULL COMMENT '1激活，0禁用，2未激活，3过期',
  `name` varchar(120) NOT NULL COMMENT '套餐名称',
  `end_time` datetime DEFAULT NULL COMMENT '到期时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `resource_id` bigint(20) NOT NULL COMMENT '资源池id',
  `used_quantity` int(11) DEFAULT NULL COMMENT '套餐数量',
  `is_evaluation` int(11) DEFAULT NULL COMMENT '1试用实例，0付费实例',
  `create_user` varchar(120) DEFAULT NULL,
  `update_user` varchar(120) DEFAULT NULL,
  `service_code` varchar(120) DEFAULT NULL COMMENT '服务代码',
  `product_quantity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `offer`
-- ----------------------------
DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `name` varchar(120) NOT NULL COMMENT '套餐名称',
  `description` varchar(250) DEFAULT NULL COMMENT '套餐描述',
  `total_price` bigint(20) DEFAULT NULL COMMENT '套餐价格',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(1024) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT NULL COMMENT '0作废,1激活,2过期',
  `effective_date` timestamp NULL DEFAULT NULL COMMENT '生效时间',
  `expire_date` datetime DEFAULT NULL COMMENT '过期时间',
  `evaluate_days` int(11) DEFAULT NULL COMMENT '试用天数 0，无试用，正整数 可试用',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `order_offer`
-- ----------------------------
DROP TABLE IF EXISTS `order_offer`;
CREATE TABLE `order_offer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `offer_id` bigint(20) NOT NULL COMMENT '套餐id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `offer_number` int(11) DEFAULT NULL COMMENT '套餐数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `offer_product`
-- ----------------------------
DROP TABLE IF EXISTS `offer_product`;
CREATE TABLE `offer_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `offer_id` bigint(20) NOT NULL COMMENT '套餐id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `preferential`
-- ----------------------------
DROP TABLE IF EXISTS `preferential`;
CREATE TABLE `preferential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT NULL COMMENT '优惠名称',
  `description` varchar(1024) DEFAULT NULL COMMENT '优惠描述',
  `formula` varchar(1024) DEFAULT NULL COMMENT '算价公式',
  `status` int(11) DEFAULT NULL COMMENT '0禁用1激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `offer_preferential`
-- ----------------------------
DROP TABLE IF EXISTS `offer_preferential`;
CREATE TABLE `offer_preferential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `offer_id` bigint(20) NOT NULL COMMENT '套餐id',
  `preferential_id` bigint(20) NOT NULL COMMENT '优惠id',
  `preferential_quantity` bigint(20) DEFAULT NULL COMMENT '优惠数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `pay_history`
-- ----------------------------
DROP TABLE IF EXISTS `pay_history`;
CREATE TABLE `pay_history` (
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '付费日期',
  `description` varchar(1024) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `sn` varchar(1024) DEFAULT NULL COMMENT '流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `contract`
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_num` char(10) DEFAULT NULL COMMENT '合同号',
  `contract_content` longblob COMMENT '合同文件',
  `status` int(11) DEFAULT NULL COMMENT '0未签约，1已签约，2合同结束',
  `expiry_date` datetime DEFAULT NULL COMMENT '合同结束时间爱你',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `iot_order_instance`
-- ----------------------------
DROP TABLE IF EXISTS `iot_order_instance`;
CREATE TABLE `iot_order_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `status` int(11) DEFAULT NULL COMMENT '0未激活1激活',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `total_price` bigint(20) DEFAULT NULL COMMENT '订单总价',
  `charge_type_id` bigint(20) DEFAULT NULL COMMENT '付款类型',
  `last_billing_date` datetime DEFAULT NULL COMMENT '上次付款时间',
  `nex_billing_date` datetime DEFAULT NULL COMMENT '下次应付款时间',
  `periodization_number` int(11) DEFAULT NULL COMMENT '已付期数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `iot_notification`
-- ----------------------------
DROP TABLE IF EXISTS `iot_notification`;
CREATE TABLE `iot_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic` varchar(0) DEFAULT NULL,
  `action` varchar(0) DEFAULT NULL,
  `rule_id` bigint(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(0) DEFAULT NULL,
  `target` varchar(0) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 sent ,2 wait for send',
  `quality` int(11) DEFAULT NULL,
  `retry_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `iot_activation_code`
-- ----------------------------
DROP TABLE IF EXISTS `iot_activation_code`;
CREATE TABLE `iot_activation_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `activation_code` varchar(255) DEFAULT NULL COMMENT '激活码或者重置码',
  `type` int(11) DEFAULT NULL COMMENT '类型 0:激活码;1:重置码',
  `status` int(11) DEFAULT NULL COMMENT '状态 0:不可用;1:可用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for alarm_group
-- ----------------------------
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
-- Table structure for alarm_threshold_conf
-- ----------------------------
DROP TABLE IF EXISTS `alarm_threshold_conf`;
CREATE TABLE `alarm_threshold_conf` (
  `alarm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metrics_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `threshold_min` int(11) NOT NULL,
  `threshold_max` int(11) NOT NULL,
  `cp_start_time` varchar(10) NOT NULL,
  `display_text` varchar(1000) NOT NULL,
  `alarm_group` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`alarm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for graphite_metrics_data
-- ----------------------------
DROP TABLE IF EXISTS `graphite_metrics_data`;
CREATE TABLE `graphite_metrics_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metrics_name` varchar(100) NOT NULL,
  `last_metrics_data` decimal(12,6),
  `trigger_alarm` int(11) NOT NULL,
  `trigger_alarm_count` int(11) NOT NULL,
  `last_metrics_time` timestamp NOT NULL DEFAULT '1970-01-01 13:00:00',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

