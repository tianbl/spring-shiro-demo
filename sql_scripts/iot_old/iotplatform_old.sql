/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : iotplatform

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-11-05 17:03:06
*/

SET FOREIGN_KEY_CHECKS=0;



-- ----------------------------
-- Table structure for iot_credential
-- ----------------------------
DROP TABLE IF EXISTS `iot_credential`;
CREATE TABLE `iot_credential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of iot_credential
-- ----------------------------
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('54', 'admin', 'd92be520311b459c51b41c8b1ea5a964', '1', null, 'admin', '2015-10-22 15:31:05', '2015-10-28 09:08:41', null, null, '20', null, null);
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('63', '5efa18e9-9ffd-4018-b5b8-b36e9a560d81', '5ad004d34afc855cf70c97d2da23983d', '1', '89', 'anonymous', '2015-11-05 15:47:12', null, null, null, '20', 'project', 'mqtt:eastsoft:*:*:connection,mqtt:eastsoft:*:*:subscription,mqtt:eastsoft:*:*:publish');
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('64', '8b32ad2f-522b-490a-a19d-8796aaaf4284', 'ec01dfb2f5d907f0615401403a7db0db', '1', '89', 'device', '2015-11-05 15:48:14', null, '工程证书', null, '20', 'project', 'mqtt:eastsoft:*:*:publish,mqtt:eastsoft:*:*:subscription,mqtt:eastsoft:*:*:connection');
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('65', 'd6167c3e-d1d0-4aaf-8cfb-d686ee52f273', '7223d9e7ec4d676be8a93c71126828bb', '1', '89', 'device', '2015-11-05 15:53:25', null, '组证书', null, '20', 'group', 'mqtt:eastsoft:things:*:publish,mqtt:eastsoft:things:*:subscription,mqtt:eastsoft:things:*:connection');
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('66', 'f551c1b3-b8bb-4111-90be-1046c4a0c9f0', 'c07d72e19c62bc0068f3e6b54c31eda9', '1', '89', 'device', '2015-11-05 16:01:43', null, '设备证书', null, '20', 'device', 'mqtt:eastsoft:mycat:mycat001:publish,mqtt:eastsoft:mycat:mycat001:subscription,mqtt:eastsoft:mycat:mycat001:connection');
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('67', 'eastsoft', 'fe100fff83a44295f728962b64c3f07a', '1', '89', 'device', '2015-10-27 17:06:57', NULL, '设备证书', NULL, '20', 'project', 'mqtt:eastsoft:*:*:conn,mqtt:eastsoft:*:*:pub,mqtt:eastsoft:*:*:sub,http:eastsoft:*:*:pub');
INSERT INTO `iot_credential`(`id`, `username`, `password`, `status`, `project_id`, `type`, `create_time`, `update_time`, `alias`, `description`, `tenant_id`, `mqttPermissionLevel`, `mqtt_permission`) VALUES ('68', 'es', 'fe100fff83a44295f728962b64c3f07a', '1', '89', 'device', '2015-10-27 17:06:57', NULL, '设备证书', NULL, '20', 'project', 'mqtt:eastsoft:*:*:conn,mqtt:eastsoft:*:*:pub,mqtt:eastsoft:*:*:sub,http:eastsoft:*:*:pub');

-- ----------------------------
-- Table structure for iot_role
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_role
-- ----------------------------
INSERT INTO `iot_role`(`id`, `name`, `status`, `description`, `create_time`, `update_time`, `tenant_id`, `type`) VALUES ('7', '读角色', '1', '拥有http读权限的角色', '2015-10-28 08:54:36', null, '0', 'global');
INSERT INTO `iot_role`(`id`, `name`, `status`, `description`, `create_time`, `update_time`, `tenant_id`, `type`) VALUES ('8', '写角色', '1', '拥有http写权限的角色', '2015-10-28 08:55:16', null, '0', 'global');


-- ----------------------------
-- Table structure for credentials_roles
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credentials_roles
-- ----------------------------
INSERT INTO `credentials_roles`(`credential_id`, `role_id`, `id`) VALUES ('64', '7', '64');
INSERT INTO `credentials_roles`(`credential_id`, `role_id`, `id`) VALUES ('64', '8', '65');
INSERT INTO `credentials_roles`(`credential_id`, `role_id`, `id`) VALUES ('65', '7', '96');
INSERT INTO `credentials_roles`(`credential_id`, `role_id`, `id`) VALUES ('65', '8', '97');
INSERT INTO `credentials_roles`(`credential_id`, `role_id`, `id`) VALUES ('66', '8', '98');
INSERT INTO `credentials_roles`(`credential_id`, `role_id`, `id`) VALUES ('66', '7', '99');


-- ----------------------------
-- Table structure for iot_permission
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_permission
-- ----------------------------
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('5', 'HTTP删除', 'http:delete:*', 'write', 'HTTP的删除权限', '2015-10-28 08:49:54', null, '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('6', 'HTTP更新', 'http:put:*', 'write', 'HTTP的更新权限', '2015-10-28 08:50:34', null, '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('7', 'HTTP创建', 'http:post:*', 'write', 'HTTP的创建权限', '2015-10-28 08:50:51', null, '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('8', 'HTTP查询', 'http:get:*', 'read', 'HTTP的查询权限', '2015-10-28 08:51:14', null, '1');

INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('20', '新建地理位置', 'api:http:createNewGeofence', '', '/V1/tenantportal/public/geofence:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('21', '更新地理位置', 'api:http:alterExistingGeofence', '', '/V1/tenantportal/public/geofence/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('22', '删除地理位置', 'api:http:dropExistingGeofence', '', '/V1/tenantportal/public/geofence/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-10 10:36:42', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('23', '主键查询单个地理位置', 'api:http:getExistingGeofence', '', '/V1/tenantportal/public/geofence/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('24', '查询所有地理位置', 'api:http:getGeofencesInProject', '', '/V1/tenantportal/public/geofences/{pid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('25', '添加项目', 'api:http:addNewProject', '', '/V1/tenantportal/public/project:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('26', '更新项目', 'api:http:alterExistingProject', '', '/V1/tenantportal/public/project/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('27', '删除单个项目', 'api:http:dropExistingProject', '', '/V1/tenantportal/public/project/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('28', '删除租户下有项目', 'api:http:dropAllProjectsOfTenant', '', '/V1/tenantportal/public/tenant/project/{tenantid}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('29', '关键字查询单个项目', 'api:http:getExistingProject', '', '/V1/tenantportal/public/project/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('30', '管理员查看所有项目', 'api:http:getAllProjectsOfTenant', '', '/V1/tenantportal/public/project:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('31', '新建租户', 'api:http:registerTenant', '', '/V1/tenantportal/public/tenant:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('33', '删除租户', 'api:http:deleteTenant', '', '/V1/tenantportal/public/tenant/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-09 13:58:44', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('34', '查询租户', 'api:http:getTenantById', '', '/V1/tenantportal/public/tenant/{id}:GET', '2015-11-06 17:49:25', '2015-11-09 13:58:51', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('35', '查询租户', 'api:http:getAllTenant', '', '/V1/tenantportal/public/tenant:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('43', '注册新设备（broker）', 'api:http:registerDeviceForBroker', '', '/V1/tenantportal/public/project/group/device/broker:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('44', '删除指定设备', 'api:http:deleteDeviceById', '', '/V1/tenantportal/public/project/group/device/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-09 13:59:17', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('49', '添加规则', 'api:http:createRule', '', '/V1/iotplatform/public/rule:POST', '2015-11-06 17:49:25', '2015-11-11 16:11:07', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('50', '更新规则', 'api:http:updateRule', '', '/V1/iotplatform/public/rule/{id}:PUT', '2015-11-06 17:49:25', '2015-11-11 16:11:20', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('51', '删除规则', 'api:http:deleteRule', '', '/V1/iotplatform/public/rule/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-11 16:11:28', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('52', '查询规则 by id', 'api:http:getRule', '', '/V1/iotplatform/public/rule/{id}:GET', '2015-11-06 17:49:25', '2015-11-11 16:11:35', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('53', '查询规则 by name', 'api:http:getRuleByName', '', '/V1/iotplatform/public/rule/name/{name}:GET', '2015-11-06 17:49:25', '2015-11-11 16:11:42', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('54', '获取所有规则', 'api:http:getAllRules', '', '/V1/iotplatform/public/rule:GET', '2015-11-06 17:49:25', '2015-11-11 16:11:51', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('55', '查询规则 by projectid', 'api:http:getRulesByProjectId', '', '/V1/iotplatform/public/rule/project/{id}:GET', '2015-11-06 17:49:25', '2015-11-11 16:12:07', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('56', '获取Credential权限', 'api:http:getCredentialPermissions', '', '/V1/iotsupport/private/security/permissions/{username}/{password}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('57', '获取Credential权限MQTT （hub 高并发专用）', 'api:http:getCredentialPermissionsWithCustomerDo', '', '/V1/iotsupport/private/security/permissions/mqtt/opt/{username}/{password}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('58', '获取Credential权限WithVo', 'api:http:getCredentialPermissionsWithVo', null, '/V1/iotsupport/private/security/permissions/mqtt/{username}/{password}:GET', '2015-11-11 16:18:10', null, null);
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('59', '更新项目连接数（设备断开连接时发起通知）', '', '', '/V1/iotplatform/private/security/connection/{username}/{password}/{operator}', '2015-11-06 17:49:25', '2015-11-06 18:07:35', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('60', '新建凭证', 'api:http:createCredential', '', '/V1/iotplatform/public/credential:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('61', '更新凭证', 'api:http:updateCredential', '', '/V1/iotplatform/public/credential/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('62', '删除凭证', 'api:http:deleteCredential', '', '/V1/iotplatform/public/credential/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('63', '查询凭证', 'api:http:getCredential', '', '/V1/iotplatform/public/credential/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('64', '查询项目下所有凭证', 'api:http:getIotCredentialByProjectId', '', '/V1/iotplatform/public/credential/pid/{pid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('65', '查询所有凭证', 'api:http:getAllIotCredential', '', '/V1/iotplatform/public/credential:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('66', '新建项目任凭（该凭证仅供MQTT使用）', 'api:http:createCredentialForMqtt', '', '/V1/iotplatform/public/mqtt/credential:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('67', '新建角色', 'api:http:createRole', '', '/V1/iotplatform/public/security/role:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission`(`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('68', '更新角色', 'api:http:updateRole', '', '/V1/iotplatform/public/security/role/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('69', '删除角色', 'api:http:deleteRole', '', '/V1/iotplatform/public/security/role/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('70', '查询角色', 'api:http:getRole', '', '/V1/iotplatform/public/security/role/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('71', '查询凭证拥有的角色', 'api:http:getRolesByCredentialId', '', '/V1/iotplatform/public/security/role/cid/{cid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('72', '查询所有角色', 'api:http:getAllRoles', '', '/V1/iotplatform/public/security/role:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('73', '新建权限', 'api:http:createPermission', '', '/V1/iotplatform/public/security/permission:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('74', '更新权限', 'api:http:updatePermission', '', '/V1/iotplatform/public/security/permission/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('75', '删除权限', 'api:http:deletePermission', '', '/V1/iotplatform/public/security/permission/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('76', '查询权限', 'api:http:selectPermission', '', '/V1/iotplatform/public/security/permission/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('77', '查询角色所拥有的权限', 'api:http:selectPermissionsByRoleId', '', '/V1/iotplatform/public/security/permission/rid/{rid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('78', '查询所有权限', 'api:http:selectAllPermission', '', '/V1/iotplatform/public/security/permission:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('79', '注册新设备', 'api:http:registerDevice', '', '/V1/tenantportal/public/project/group/device:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('80', '注册新设备（broker）', 'api:http:registerDeviceForBroker', '', '/V1/tenantportal/public/project/group/device/broker :POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('81', '删除指定设备', 'api:http:deleteDeviceById', '', '/V1/tenantportal/public/project/group/device/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-09 14:06:47', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('82', '修改设备信息', 'api:http:updateDeviceById', '', '/V1/tenantportal/public/project/group/device/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('83', '获取指定设备的设备信息', 'api:http:getDeviceByDeviceId', '', '/V1/tenantportal/public/project/group/device/{id}:GET', '2015-11-06 17:49:25', '2015-11-09 14:06:58', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('84', '获取指定工程下指定组的所有设备', 'api:http:getDevicesByGroupId', '', '/V1/tenantportal/public/project/group/device/gid/{groupid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('85', '获得指定工程下的所有设备', 'api:http:getDevicesByProjectId', '', '/V1/tenantportal/public/project/device/pid/{projectId}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('86', '根据deviceName查询设备', 'api:http:getDevicesByNameDomain', '', '/V1/tenantportal/public/project/group/device/{domain}/{deviceName}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('87', '新建群组', 'api:http:createGroup', '', '/V1/tenantportal/public/project/group:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('88', '更新群组', 'api:http:updateGroup', '', '/V1/tenantportal/public/project/group/{id}:PUT', '2015-11-06 17:49:25', '2015-11-09 14:07:57', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('89', '删除群组', 'api:http:deleteGroup', '', '/V1/tenantportal/public/project/group/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-10 17:28:26', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('90', '根据群组id获取群组的信息', 'api:http:selectByGroupid', '', '/V1/tenantportal/public/project/group/{id}:GET', '2015-11-06 17:49:25', '2015-11-09 14:08:09', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('91', '获取项目下全部的群组信息', 'api:http:selectByProjectid', '', '/V1/tenantportal/public/project/group/pid/{projectid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`id`, `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`)VALUES ('92', '移除群组中的设备', 'api:http:deleteDeviceByGroup', '', '/V1/tenantportal/public/project/group/devices/{groupid}:DELETE', '2015-11-06 17:49:25', '2015-11-10 17:28:16', '1');


-- ----------------------------
-- Table structure for roles_permissions
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for iot_tenant
-- ----------------------------
DROP TABLE IF EXISTS `iot_tenant`;
CREATE TABLE `iot_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `organization` varchar(50) NOT NULL,
  `code` varchar(50) ,
  `level` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 启用，2 禁用',
  `phone` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_tenant
-- ----------------------------
INSERT INTO `iot_tenant` (`id`, `name`, `description`, `organization`, `code`, `level`, `contact`, `email`, `status`, `phone`, `create_time`, `update_time`)VALUES ('20', 'eastsoft管理员', null, 'organization3', '123003', null, null, 'testuser3@163.com', '1', '13012345680', '2015-10-22 15:31:52', null);


-- ----------------------------
-- Table structure for iot_order
-- ----------------------------
DROP TABLE IF EXISTS `iot_order`;
CREATE TABLE `iot_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` decimal(10,0) DEFAULT NULL,
  `contract` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `iot_order_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `iot_tenant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_order
-- ----------------------------
INSERT INTO `iot_order` (`id`, `tenant_id`, `time`, `price`, `contract`, `status`, `create_time`, `update_time`, `description`)VALUES ('5', '20', '2015-11-05 15:47:12', null, null, '1', '2015-11-05 15:47:12', null, null);

-- ----------------------------
-- Table structure for iot_order_instance
-- ----------------------------
DROP TABLE IF EXISTS `iot_order_instance`;
CREATE TABLE `iot_order_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `iot_order_instance_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `iot_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_order_instance
-- ----------------------------
INSERT INTO `iot_order_instance` (`id`, `order_id`, `time`, `status`, `name`, `create_time`, `update_time`)VALUES ('5', '5', null, '1', null, '2015-11-05 15:47:12', null);


-- ----------------------------
-- Table structure for iot_service_instance
-- ----------------------------
DROP TABLE IF EXISTS `iot_service_instance`;
CREATE TABLE `iot_service_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_instance_id` bigint(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_instance_id` (`order_instance_id`),
  CONSTRAINT `iot_service_instance_ibfk_1` FOREIGN KEY (`order_instance_id`) REFERENCES `iot_order_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_service_instance
-- ----------------------------
INSERT INTO `iot_service_instance` (`id`, `order_instance_id`, `start_time`, `status`, `name`, `end_time`, `create_time`, `update_time`)VALUES ('5', '5', null, '1', null, null, '2015-11-05 15:47:12', null);


-- ----------------------------
-- Table structure for iot_project
-- ----------------------------
DROP TABLE IF EXISTS `iot_project`;
CREATE TABLE `iot_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `service_instance_id` bigint(20) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `partition_policy` varchar(120) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `max` bigint(20) DEFAULT NULL,
  `current` bigint(20) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `service_instance_id` (`service_instance_id`),
  CONSTRAINT `iot_project_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `iot_tenant` (`id`),
  CONSTRAINT `iot_project_ibfk_3` FOREIGN KEY (`service_instance_id`) REFERENCES `iot_service_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_project
-- ----------------------------
INSERT INTO `iot_project` (`id`, `name`, `service_instance_id`, `description`, `partition_policy`, `status`, `max`, `current`, `domain`, `create_time`, `update_time`, `tenant_id`)VALUES ('89', '东软物联平台', '5', null, null, '1', '100', '0', 'eastsoft', '2015-11-05 15:47:12', null, '20');

-- ----------------------------
-- Table structure for iot_group
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_group
-- ----------------------------
INSERT INTO `iot_group` (`id`, `name`, `project_id`, `status`, `code`, `create_time`, `update_time`)VALUES ('94', 'things', '89', '1', null, '2015-11-05 15:47:12', null);
INSERT INTO `iot_group` (`id`, `name`, `project_id`, `status`, `code`, `create_time`, `update_time`)VALUES ('95', 'mydog', '89', '1', null, '2015-11-05 15:47:26', null);
INSERT INTO `iot_group` (`id`, `name`, `project_id`, `status`, `code`, `create_time`, `update_time`)VALUES ('96', 'mycat', '89', '1', null, '2015-11-05 15:47:35', null);
INSERT INTO `iot_group` (`id`, `name`, `project_id`, `status`, `code`, `create_time`, `update_time`)VALUES ('97', '$SYS', '89', '1', null, '2015-11-05 15:47:35', null);


-- ----------------------------
-- Table structure for iot_device
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_device
-- ----------------------------
INSERT INTO `iot_device`(`id`, `name`, `clientId`, `status`, `description`, `group_id`, `create_time`, `update_time`, `code`, `project_id`) VALUES ('1', '$SYS/connect', 'connect', '1', NULL, '97', '2015-11-05 19:16:15', '2015-11-06 13:28:22', 'eastsoft/$SYS/connect', '89');
INSERT INTO `iot_device`(`id`, `name`, `clientId`, `status`, `description`, `group_id`, `create_time`, `update_time`, `code`, `project_id`) VALUES ('2', '$SYS/disconnect', 'disconnect', '1', NULL, '97', '2015-11-05 19:18:01', '2015-11-06 13:27:09', 'eastsoft/$SYS/disconnect', '89');
INSERT INTO `iot_device`(`id`, `name`, `clientId`, `status`, `description`, `group_id`, `create_time`, `update_time`, `code`, `project_id`) VALUES ('3', '$SYS/lostconnect', 'lostconnect', '1', NULL, '97', '2015-11-05 19:18:01', '2015-11-06 13:27:33', 'eastsoft/$SYS/lostconnect', '89');
INSERT INTO `iot_device`(`id`, `name`, `clientId`, `status`, `description`, `group_id`, `create_time`, `update_time`, `code`, `project_id`) VALUES ('24', '宠物狗', 'mydog001', '1', '', '95', '2015-11-05 15:47:26', null, 'eastsoft/mydog/mydog001', '89');
INSERT INTO `iot_device`(`id`, `name`, `clientId`, `status`, `description`, `group_id`, `create_time`, `update_time`, `code`, `project_id`) VALUES ('25', '机器猫', 'mycat001', '1', '', '96', '2015-11-05 15:47:35', null, 'eastsoft/mycat/mycat001', '89');
-- ----------------------------
-- Table structure for iot_geofences
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_geofences
-- ----------------------------
INSERT INTO `iot_geofences` (`id`, `name`, `project_id`, `device_id`, `topic`, `latitude`, `longitude`, `radius`, `address`, `create_time`, `update_time`, `description`, `status`)VALUES ('1', '机器猫位置', '89', '25', 'eastsoft/mycat/mycat001', '36.082', '120.365', '90', null, '2015-11-05 16:58:45', null, '', '1');
INSERT INTO `iot_geofences` (`id`, `name`, `project_id`, `device_id`, `topic`, `latitude`, `longitude`, `radius`, `address`, `create_time`, `update_time`, `description`, `status`)VALUES ('2', '宠物狗位置', '89', '24', 'eastsoft/mydog/mydog001', '36.089', '120.367', '0', null, '2015-11-05 17:01:45', '2015-11-05 17:02:04', '', '1');


-- ----------------------------
-- Table structure for iot_log
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_log
-- ----------------------------
INSERT INTO `iotplatform`.`iot_log` (`id`, `tenant_id`, `operator`, `device`, `time`, `operation`, `description`, `create_time`) VALUES (1, 20, "admin", "mycat", "2015-11-01 12:23:09", "插入设备", NULL, NULL);



-- ----------------------------
-- Table structure for iot_rule
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iot_rule
-- ----------------------------
INSERT INTO `iot_rule` (`id`, `name`, `project_id`, `topic_filter`, `content_filter`, `action`, `create_by`, `update_by`, `create_time`, `update_time`, `status`, `description`, `expiry_time`, `effective_time`)VALUES ('2', '东软工程数据过滤', '89', 'eastsoft/#', '', '[{\"action\":\"email\",\"emailParams\":{\"target\":\"zhangyoumeng@eastsoft.com.cn\",\"title\":\"工程数据过滤\",\"content\":\"工程数据过滤\",\"quality\":2}}]', null, null, '2015-11-05 16:08:31', null, '1', '', '2015-11-05 16:08:35', '2015-11-05 16:08:35');
INSERT INTO `iot_rule` (`id`, `name`, `project_id`, `topic_filter`, `content_filter`, `action`, `create_by`, `update_by`, `create_time`, `update_time`, `status`, `description`, `expiry_time`, `effective_time`)VALUES ('3', '东软组数据过滤', '89', 'eastsoft/mydog/#', '', '[{\"action\":\"http\",\"httpParams\":{\"url\":\"http://127.0.0.1/data\",\"body\":\"{payload:\\\"\\\"]\",\"quality\":2}}]', null, null, '2015-11-05 16:24:26', null, '1', '', '2015-11-05 16:24:31', '2015-11-05 16:24:31');
INSERT INTO `iot_rule` (`id`, `name`, `project_id`, `topic_filter`, `content_filter`, `action`, `create_by`, `update_by`, `create_time`, `update_time`, `status`, `description`, `expiry_time`, `effective_time`)VALUES ('4', '东软设备过滤', '89', 'eastsoft/mydog/mydog001', 'select * from eastsoft_mydog_mydog001 where temperature >= 25', '[{\"action\":\"publish\",\"publishParams\":{\"topic\":\"$sys/publish\",\"payload\":\"{payload:\\\"温度达到设定阈值\\\"}\",\"quality\":2}}]', null, null, '2015-11-05 16:26:33', null, '1', '', '2015-11-05 16:26:39', '2015-11-05 16:26:39');



-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`) VALUES ('8', '7', '4');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`) VALUES ('5', '8', '5');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`)VALUES ('6', '8', '6');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`, `id`)VALUES ('7', '8', '7');
