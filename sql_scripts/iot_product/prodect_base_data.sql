/*
运行脚本前 务必阅读说明。
脚本中以下sql 语句需要特别注意:
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('293', '303');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('294', '303');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('295', '303');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('296', '302');
sql语句中的 permission_id， role_id 两个字段的id需要自己从数据库里手动查询。
permission_id 为iot_permission表中name 为HTTP删除、HTTP更新、HTTP创建、HTTP查询的记录所对应的id（293,294,295 对应删除，更新，创建，296对应查询）
role_id为iot_role表中name为读角色、写角色对应记录的id（303 对应写角色，302对应读角色）。
*/




INSERT INTO `iot_role`(`name`, `status`, `description`, `create_time`, `update_time`, `tenant_id`, `type`) VALUES ('读角色', '1', '拥有http读权限的角色', '2015-10-28 08:54:36', null, '0', 'global');
INSERT INTO `iot_role`(`name`, `status`, `description`, `create_time`, `update_time`, `tenant_id`, `type`) VALUES ('写角色', '1', '拥有http写权限的角色', '2015-10-28 08:55:16', null, '0', 'global');





INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('HTTP删除', '*:http:delete:*', 'write', 'HTTP的删除权限', '2015-10-28 08:49:54', null, '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('HTTP更新', '*:http:put:*', 'write', 'HTTP的更新权限', '2015-10-28 08:50:34', null, '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('HTTP创建', '*:http:post:*', 'write', 'HTTP的创建权限', '2015-10-28 08:50:51', null, '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('HTTP查询', '*:http:get:*', 'read', 'HTTP的查询权限', '2015-10-28 08:51:14', null, '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建地理位置', 'api:http:post:createNewGeofence', '', '/V1/tenantportal/public/geofence:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新地理位置', 'api:http:put:alterExistingGeofence', '', '/V1/tenantportal/public/geofence/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除地理位置', 'api:http:delete:dropExistingGeofence', '', '/V1/tenantportal/public/geofence/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-10 10:36:42', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('主键查询单个地理位置', 'api:http:get:getExistingGeofence', '', '/V1/tenantportal/public/geofence/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有地理位置', 'api:http:get:getGeofencesInProject', '', '/V1/tenantportal/public/geofences/{pid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('添加项目', 'api:http:post:addNewProject', '', '/V1/tenantportal/public/project:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新项目', 'api:http:put:alterExistingProject', '', '/V1/tenantportal/public/project/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除单个项目', 'api:http:delete:dropExistingProject', '', '/V1/tenantportal/public/project/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除租户下有项目', 'api:http:delete:dropAllProjectsOfTenant', '', '/V1/tenantportal/public/tenant/project/{tenantid}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('关键字查询单个项目', 'api:http:get:getExistingProject', '', '/V1/tenantportal/public/project/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('管理员查看所有项目', 'api:http:get:getAllProjectsOfTenant', '', '/V1/tenantportal/public/project:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建租户', 'api:http:post:registerTenant', '', '/V1/tenantportal/public/tenant:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新租户', 'api:http:put:updateTenant', '', '/V1/tenantportal/public/tenant/{id}:PUT', '2015-11-06 17:49:25', '2015-11-09 13:58:36', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除租户', 'api:http:delete:deleteTenant', '', '/V1/tenantportal/public/tenant/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-09 13:58:44', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询租户', 'api:http:get:getTenantById', '', '/V1/tenantportal/public/tenant/{id}:GET', '2015-11-06 17:49:25', '2015-11-09 13:58:51', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询租户', 'api:http:get:getAllTenant', '', '/V1/tenantportal/public/tenant:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('设备当前状态数据查询接口', 'api:http:get:getDevicePresent', '', '/V1/tenantportal/public/project/group/device/{id}/present:GET', '2015-11-06 17:49:25', '2015-11-09 13:59:17', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除指定设备', 'api:http:delete:deleteDeviceById', '', '/V1/tenantportal/public/project/group/device/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-09 13:59:17', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('添加规则', 'api:http:post:createRule', '', '/V1/iotplatform/public/rule:POST', '2015-11-06 17:49:25', '2015-11-11 16:11:07', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新规则', 'api:http:put:updateRule', '', '/V1/iotplatform/public/rule/{id}:PUT', '2015-11-06 17:49:25', '2015-11-11 16:11:20', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除规则', 'api:http:delete:deleteRule', '', '/V1/iotplatform/public/rule/project/{projectId}/id/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-11 16:11:28', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询规则 by id', 'api:http:get:getRule', '', '/V1/iotplatform/public/rule/project/{projectId}/id/{id}:GET', '2015-11-06 17:49:25', '2015-11-11 16:11:35', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询规则 by name', 'api:http:get:getRuleByName', '', '/V1/iotplatform/public/rule/name/{name}:GET', '2015-11-06 17:49:25', '2015-11-11 16:11:42', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('获取所有规则', 'api:http:get:getAllRules', '', '/V1/iotplatform/public/rule:GET', '2015-11-06 17:49:25', '2015-11-11 16:11:51', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询规则 by projectid', 'api:http:get:getRulesByProjectId', '', '/V1/iotplatform/public/rule/project/{id}:GET', '2015-11-06 17:49:25', '2015-11-11 16:12:07', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建凭证', 'api:http:post:createCredential', '', '/V1/iotplatform/public/credential:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新凭证', 'api:http:put:updateCredential', '', '/V1/iotplatform/public/credential/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除凭证', 'api:http:delete:deleteCredential', '', '/V1/iotplatform/public/credential/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询凭证', 'api:http:get:getCredential', '', '/V1/iotplatform/public/credential/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询项目下所有凭证', 'api:http:get:getIotCredentialByProjectId', '', '/V1/iotplatform/public/credential/pid/{pid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有凭证', 'api:http:get:getAllIotCredential', '', '/V1/iotplatform/public/credential:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建项目任凭（该凭证仅供MQTT使用）', 'api:http:post:createCredentialForMqtt', '', '/V1/iotplatform/public/mqtt/credential:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建角色', 'api:http:post:createRole', '', '/V1/iotplatform/public/security/role:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新角色', 'api:http:put:updateRole', '', '/V1/iotplatform/public/security/role/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除角色', 'api:http:delete:deleteRole', '', '/V1/iotplatform/public/security/role/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询角色', 'api:http:get:getRole', '', '/V1/iotplatform/public/security/role/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询凭证拥有的角色', 'api:http:get:getRolesByCredentialId', '', '/V1/iotplatform/public/security/role/cid/{cid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有角色', 'api:http:get:getAllRoles', '', '/V1/iotplatform/public/security/role:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建权限', 'api:http:post:createPermission', '', '/V1/iotplatform/public/security/permission:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新权限', 'api:http:put:updatePermission', '', '/V1/iotplatform/public/security/permission/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除权限', 'api:http:delete:deletePermission', '', '/V1/iotplatform/public/security/permission/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询权限', 'api:http:get:selectPermission', '', '/V1/iotplatform/public/security/permission/{id}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询角色所拥有的权限', 'api:http:get:selectPermissionsByRoleId', '', '/V1/iotplatform/public/security/permission/rid/{rid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有权限', 'api:http:get:selectAllPermission', '', '/V1/iotplatform/public/security/permission:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('注册新设备', 'api:http:post:registerDevice', '', '/V1/tenantportal/public/project/group/device:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除指定设备', 'api:http:delete:deleteDeviceById', '', '/V1/tenantportal/public/project/group/device/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-09 14:06:47', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('修改设备信息', 'api:http:put:updateDeviceById', '', '/V1/tenantportal/public/project/group/device/{id}:PUT', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('获取指定设备的设备信息', 'api:http:get:getDeviceByDeviceId', '', '/V1/tenantportal/public/project/group/device/{id}:GET', '2015-11-06 17:49:25', '2015-11-09 14:06:58', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('获取指定工程下指定组的所有设备', 'api:http:get:getDevicesByGroupId', '', '/V1/tenantportal/public/project/group/device/gid/{groupid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('获得指定工程下的所有设备', 'api:http:get:getDevicesByProjectId', '', '/V1/tenantportal/public/project/device/pid/{projectId}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('根据deviceName查询设备', 'api:http:get:getDevicesByNameDomain', '', '/V1/tenantportal/public/project/group/device/{domain}/{deviceName}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建群组', 'api:http:post:createGroup', '', '/V1/tenantportal/public/project/group:POST', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新群组', 'api:http:put:updateGroup', '', '/V1/tenantportal/public/project/group/{id}:PUT', '2015-11-06 17:49:25', '2015-11-09 14:07:57', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除群组', 'api:http:delete:deleteGroup', '', '/V1/tenantportal/public/project/group/{id}:DELETE', '2015-11-06 17:49:25', '2015-11-10 17:28:26', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('根据群组id获取群组的信息', 'api:http:get:selectByGroupid', '', '/V1/tenantportal/public/project/group/{id}:GET', '2015-11-06 17:49:25', '2015-11-09 14:08:09', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('获取项目下全部的群组信息', 'api:http:get:selectByProjectid', '', '/V1/tenantportal/public/project/group/pid/{projectid}:GET', '2015-11-06 17:49:25', '2015-11-06 17:51:25', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('移除群组中的设备', 'api:http:delete:deleteDeviceByGroup', '', '/V1/tenantportal/public/project/group/devices/{groupid}:DELETE', '2015-11-06 17:49:25', '2015-11-10 17:28:16', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有日志', 'api:http:get:getAllIotLog', '', '/V1/tenantportal/public/query/log/{tenantId}:GET', '2015-11-06 17:49:25', '2015-11-10 17:28:16', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('设备当前状态查询', 'api:http:get:getDevicePresent', '', '/V1/tenantportal/public/project/group/device/shadow/{deviceId}:GET', '2015-11-18 17:49:25', '2015-11-18 17:50:16', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询租户下所有设备', 'api:http:get:getDevicesByTenantId', '', '/V1/tenantportal/public/project/group/device/tid/{tenantId}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除某设备的shadow', 'api:http:delete:deleteDeviceOfShadow', '', '/V1/tenantportal/public/project/group/device/shadow/{deviceId}:DELETE', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('添加服务', 'api:http:post:createService', '', '/V1/tenantportal/public/service:POST', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询服务（查询单个service）', 'api:http:get:getService', '', '/V1/tenantportal/public/service/{id}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询服务（查询所有的service）', 'api:http:get:getAllServices', '', '/V1/tenantportal/public/service:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('更新服务', 'api:http:put:updateService', '', '/V1/tenantportal/public/service/{id}:PUT', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除服务', 'api:http:delete:deleteService', '', '/V1/tenantportal/public/service/{id}:DELETE', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` ( `name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('添加product', 'api:http:post:createProduct', '', '/V1/tenantportal/public/product:POST', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询product', 'api:http:get:getProduct', '', '/V1/tenantportal/public/product/{id}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有的product', 'api:http:get:getAllProducts', '', '/V1/tenantportal/public/product:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除product', 'api:http:delete:deleteProduct', '', '/V1/tenantportal/public/product/{id}:DELETE', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('添加offer', 'api:http:post:insertOffer', '', '/V1/tenantportal/public/offer:POST', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询offer', 'api:http:get:selectOfferById', '', '/V1/tenantportal/public/offer/{id}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有的offer', 'api:http:get:getAllOffer', '', '/V1/tenantportal/public/offer:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('删除offer', 'api:http:delete:deleteOfferById', '', '/V1/tenantportal/public/offer/{id}:DELETE', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('新建订单', 'api:http:post:insertOrder', '', '/V1/tenantportal/public/order:POST', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('激活订单', 'api:http:get:activeOrder', '', '/V1/tenantportal/public/order/act/{id}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询订单', 'api:http:get:selectOrderById', '', '/V1/tenantportal/public/order/{id}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询所有订单', 'api:http:get:getAllOrder', '', '/V1/tenantportal/public/order:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('作废订单', 'api:http:delete:deleteOrder', '', '/V1/tenantportal/public/order/{id}:DELETE', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('验证邀请码', 'api:http:put:validateByCode', '', '/V1/tenantportal/public/invitation/{code}/{tenantId}:PUT', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('修改信息', 'api:http:post:updateInformation', '', '/V1/tenantportal/public/tenant/{id}:POST', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('租户是否已经绑定了邀请码', 'api:http:get:ifBindInvitation', '', '/V1/tenantportal/public/invitation/tenant/{tenantId}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('判断用户可否继续创建工程', 'api:http:get:ifCanCreateProject', '', '/V1/tenantportal/public/invitation/project/{tenantId}/{currentSize}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询租户下所有项目(根据具体状态)', 'api:http:get:getAllProjectsOfTenantWithStatus', '', '/V1/tenantportal/public/project/tenantId/{tenantId}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('查询服务实例', 'api:http:GET:getServiceInstanceByProjectId', '', '/V1/tenantportal/public/serviceInstance/pid/{projectId}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('获取当前tenant下project总数量和已有数量', 'api:http:get:countInvitation', '', '/V1/tenantportal/public/invitation/tenant/project/tid/{tenantId}:GET', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');
INSERT INTO `iot_permission` (`name`, `wildcard`, `type`, `description`, `create_time`, `update_time`, `status`) VALUES ('用户登出', 'api:http:post:quitTenant', '', '/V1/tenantportal/public/tenant/logout:POST', '2015-12-04 12:35:25', '2015-12-04 12:35:45', '1');





INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('104', '101');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('101', '102');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('102', '102');
INSERT INTO `roles_permissions` (`permission_id`, `role_id`) VALUES ('103', '102');



INSERT INTO `system_unit` (`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('年', '001', '1', null, null, '2015-12-14 11:23:27', null);
INSERT INTO `system_unit` (`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('月', '002', '1', null, null, '2015-12-14 11:23:42', null);
INSERT INTO `system_unit` (`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('日', '003', '1', null, null, '2015-12-14 11:27:01', null);
INSERT INTO `system_unit` (`name`, `unit_code`,`status`,`update_time`,`update_user`,`create_time`,`create_user`) VALUES ('个', '004', '1', null, null, '2015-12-14 11:27:39', null);

INSERT INTO `service` (`name`,`status`,`code`,`create_date`,`create_user`,`update_time`,`update_user`) VALUES ('设备连接服务', '1', '001', '2015-12-14 13:51:42', null, null, null);
INSERT INTO `service` (`name`,`status`,`code`,`create_date`,`create_user`,`update_time`,`update_user`) VALUES ('规则引擎服务', '1', '002', '2015-12-14 13:51:56', null, null, null);
INSERT INTO `service` (`name`,`status`,`code`,`create_date`,`create_user`,`update_time`,`update_user`) VALUES ('大数据服务', '1', '003', '2015-12-14 13:52:41', null, null, null);

-- UNIT_ID对应system_unit中的时间单位，UNIT_NUMBER对应时间数量
INSERT INTO `charge_type` (`NAME`, `STATUS`, `TYPE`, `UNIT_ID`, `UNIT_NUMBER`, `CREATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `UPDATE_TIME`) VALUES ( '设备连接服务-chargetype', '1', '0', '101', '1', '2016-01-08 14:22:21', NULL, NULL, NULL);
INSERT INTO `charge_type` (`NAME`, `STATUS`, `TYPE`, `UNIT_ID`, `UNIT_NUMBER`, `CREATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `UPDATE_TIME`) VALUES ( '规则引擎服务-chargetype', '1', '0', '101', '1', '2016-01-08 14:25:29', NULL, NULL, NULL);
INSERT INTO `charge_type` (`NAME`, `STATUS`, `TYPE`, `UNIT_ID`, `UNIT_NUMBER`, `CREATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `UPDATE_TIME`) VALUES ( '大数据服务-chargetype', '1', '0', '101', '1', '2016-01-08 14:26:34', NULL, NULL, NULL);


-- SERVICE_ID对应service表ID,UNIT_NUMBER对应产品数量，SYSTEM_UNIT_ID对应system_unit中的个数单位，CHARGE_TYPE_ID对应相应charge_type表ID
INSERT INTO `product` (`EFFECTIVE_DATE`, `EXPIRY_DATE`, `CREATE_USER`, `CREATE_TIME`, `NAME`, `PRICE`, `SERVICE_ID`, `STATUS`, `UNIT_NUMBER`, `CHARGE_TYPE_ID`, `SYSTEM_UNIT_ID`, `UPDATE_USER`, `UPDATE_TIME`) VALUES ( '2016-01-07', '2020-01-07', NULL, '2016-01-08 14:22:22', '设备连接服务', '1', '101', '1', '1000', '101', '104', NULL, '2016-01-18 11:12:32');
INSERT INTO `product` (`EFFECTIVE_DATE`, `EXPIRY_DATE`, `CREATE_USER`, `CREATE_TIME`, `NAME`, `PRICE`, `SERVICE_ID`, `STATUS`, `UNIT_NUMBER`, `CHARGE_TYPE_ID`, `SYSTEM_UNIT_ID`, `UPDATE_USER`, `UPDATE_TIME`) VALUES ( '2016-01-07', '2020-01-07', NULL, '2016-01-08 14:25:29', '规则引擎服务', '1', '102', '1', '1000', '102', '104', NULL, '2016-01-18 11:12:38');
INSERT INTO `product` (`EFFECTIVE_DATE`, `EXPIRY_DATE`, `CREATE_USER`, `CREATE_TIME`, `NAME`, `PRICE`, `SERVICE_ID`, `STATUS`, `UNIT_NUMBER`, `CHARGE_TYPE_ID`, `SYSTEM_UNIT_ID`, `UPDATE_USER`, `UPDATE_TIME`) VALUES ( '2016-01-07', '2020-01-07', NULL, '2016-01-08 14:26:34', '大数据服务', '1', '103', '1', '10000', '103', '104', NULL, '2016-01-18 11:12:44');



INSERT INTO `offer` (`NAME`, `DESCRIPTION`, `TOTAL_PRICE`, `CREATE_DATE`, `CREATE_USER`, `STATUS`, `EFFECTIVE_DATE`, `EXPIRE_DATE`, `EVALUATE_DAYS`, `UPDATE_TIME`, `UPDATE_USER`) VALUES ( '套餐一', '设备连接服务，规则引擎服务，大数据服务', '0', '2016-01-08 14:32:49', NULL, '1', '2016-01-01 00:00:00', '2017-01-01 00:00:00', '365', NULL, NULL);


INSERT INTO `offer_product` (`PRODUCT_ID`, `OFFER_ID`) VALUES ( '101', '101');
INSERT INTO `offer_product` (`PRODUCT_ID`, `OFFER_ID`) VALUES ( '102', '101');
INSERT INTO `offer_product` (`PRODUCT_ID`, `OFFER_ID`) VALUES ( '103', '101');
