

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iot_credential`
-- ----------------------------
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
-- Records of iot_role
-- ----------------------------
INSERT INTO `iot_role`(`id`, `name`, `status`, `description`, `create_time`, `update_time`, `tenant_id`, `type`) VALUES ('7', '读角色', '1', '拥有http读权限的角色', '2015-10-28 08:54:36', null, '0', 'global');
INSERT INTO `iot_role`(`id`, `name`, `status`, `description`, `create_time`, `update_time`, `tenant_id`, `type`) VALUES ('8', '写角色', '1', '拥有http写权限的角色', '2015-10-28 08:55:16', null, '0', 'global');

-- ----------------------------
-- Table structure for `credentials_roles`
-- ----------------------------
DROP TABLE IF EXISTS `credentials_roles`;
CREATE TABLE `credentials_roles` (
  `credential_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `credential_id` (`credential_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `credentials_roles_ibfk_3` FOREIGN KEY (`credential_id`) REFERENCES `iot_credential` (`id`),
  CONSTRAINT `credentials_roles_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `iot_role` (`id`)
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
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `iot_permission` (`id`),
  CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `iot_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`) VALUES ('5', '8', '1');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`) VALUES ('6', '8', '2');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`) VALUES ('7', '8', '3');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`) VALUES ('8', '7', '4');

-- ----------------------------
-- Table structure for `iot_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `iot_tenant`;
CREATE TABLE `iot_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `organization` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 启用，2 禁用',
  `phone` varchar(50) NOT NULL,
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
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `iot_project_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `iot_tenant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `iot_group`
-- ----------------------------
DROP TABLE IF EXISTS `iot_group`;
CREATE TABLE `iot_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(120) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_iot_group_projectId_name` (`project_id`,`name`) USING BTREE,
  KEY `project_id` (`project_id`),
  CONSTRAINT `iot_group_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `iot_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `iot_device`
-- ----------------------------
DROP TABLE IF EXISTS `iot_device`;
CREATE TABLE `iot_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `clientId` varchar(120) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(120) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_iot_device_code` (`code`) USING BTREE,
  KEY `group_id` (`group_id`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `iot_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31118 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `iot_geofences`
-- ----------------------------
DROP TABLE IF EXISTS `iot_geofences`;
CREATE TABLE `iot_geofences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `device_id` bigint(20) NOT NULL,
  `topic` varchar(128) NOT NULL,
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
  `name` varchar(120) NOT NULL,
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
  KEY `project_id` (`project_id`),
  CONSTRAINT `iot_rule_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `iot_project` (`id`)
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
  KEY `account_id` (`account_id`) USING BTREE,
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
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


INSERT INTO `system_unit` (`id`,`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('2', '年', '001', '1', null, null, '2015-12-14 11:23:27', null);
INSERT INTO `system_unit` (`id`,`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('3', '月', '002', '1', null, null, '2015-12-14 11:23:42', null);
INSERT INTO `system_unit` (`id`,`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('4', '日', '003', '1', null, null, '2015-12-14 11:27:01', null);
INSERT INTO `system_unit` (`id`,`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('5', '个', '004', '1', null, null, '2015-12-14 11:27:39', null);


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
  KEY `FK_Relationship_26` (`unit_id`),
  CONSTRAINT `FK_Relationship_26` FOREIGN KEY (`unit_id`) REFERENCES `system_unit` (`id`)
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
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `iot_order_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `iot_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `service`
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL COMMENT '服务名称',
  `status` int(11) DEFAULT NULL COMMENT '0 禁用 1激活',
  `code` varchar(1024) DEFAULT NULL COMMENT '服务代码，001:MQTT与broker之间的链接服务；002:引擎服务；003:大数据服务（数据采集）',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(1024) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;


INSERT INTO `service` (`id`,`name`,`status`,`code`,`create_date`,`create_user`,`update_time`,`update_user`) VALUES ('2', 'MQTT与broker之间的链接服务', '1', '001', '2015-12-14 13:51:42', null, null, null);
INSERT INTO `service` (`id`,`name`,`status`,`code`,`create_date`,`create_user`,`update_time`,`update_user`) VALUES ('3', '引擎服务', '1', '002', '2015-12-14 13:51:56', null, null, null);
INSERT INTO `service` (`id`,`name`,`status`,`code`,`create_date`,`create_user`,`update_time`,`update_user`) VALUES ('4', '大数据服务（数据采集）', '1', '003', '2015-12-14 13:52:41', null, null, null);

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
  `name` varchar(1024) NOT NULL COMMENT '产品名称',
  `price` bigint(20) DEFAULT NULL COMMENT '产品价格',
  `service_id` bigint(20) NOT NULL COMMENT '服务id',
  `status` int(11) DEFAULT NULL COMMENT '0禁用，1激活，2过期',
  `unit_number` int(11) DEFAULT NULL COMMENT '单位数量',
  `charge_type_id` bigint(20) DEFAULT NULL COMMENT '付费类型id',
  `system_unit_id` bigint(20) DEFAULT NULL COMMENT '单位',
  `update_user` varchar(1024) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_24` (`service_id`),
  KEY `FK_Relationship_25` (`system_unit_id`),
  CONSTRAINT `FK_Relationship_24` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_Relationship_25` FOREIGN KEY (`system_unit_id`) REFERENCES `system_unit` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_32` (`order_id`),
  KEY `FK_Relationship_34` (`resource_id`),
  CONSTRAINT `FK_Relationship_32` FOREIGN KEY (`order_id`) REFERENCES `iot_order` (`id`),
  CONSTRAINT `FK_Relationship_34` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_41` (`offer_id`),
  KEY `FK_Relationship_42` (`order_id`),
  CONSTRAINT `FK_Relationship_41` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  CONSTRAINT `FK_Relationship_42` FOREIGN KEY (`order_id`) REFERENCES `iot_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `offer_product`
-- ----------------------------
DROP TABLE IF EXISTS `offer_product`;
CREATE TABLE `offer_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `offer_id` bigint(20) NOT NULL COMMENT '套餐id',
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_37` (`offer_id`),
  KEY `FK_Relationship_38` (`product_id`),
  CONSTRAINT `FK_Relationship_37` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  CONSTRAINT `FK_Relationship_38` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_30` (`preferential_id`),
  KEY `FK_Relationship_36` (`offer_id`),
  CONSTRAINT `FK_Relationship_30` FOREIGN KEY (`preferential_id`) REFERENCES `preferential` (`id`),
  CONSTRAINT `FK_Relationship_36` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_31` (`order_id`),
  CONSTRAINT `FK_Relationship_31` FOREIGN KEY (`order_id`) REFERENCES `iot_order` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_14` (`order_id`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`order_id`) REFERENCES `iot_order` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `iot_activation_code_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `iot_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
