//package com.es.building.security;
//
//import org.apache.shiro.authc.AuthenticationInfo;
//import org.apache.shiro.authc.AuthenticationToken;
//import org.apache.shiro.authc.SimpleAuthenticationInfo;
//import org.apache.shiro.authz.AuthorizationInfo;
//import org.apache.shiro.authz.SimpleAuthorizationInfo;
//import org.apache.shiro.realm.AuthorizingRealm;
//import org.apache.shiro.subject.PrincipalCollection;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import v1.com.hp.es.iot.common.entity.CredentialsRoles;
//import v1.com.hp.es.iot.common.entity.IotCredential;
//import v1.com.hp.es.iot.common.entity.RolesPermissions;
//import v1.com.hp.es.iot.common.security.StatelessToken;
//import v1.com.hp.es.iot.common.service.CredentialService;
//
//import java.util.List;
//
//
//public class StatelessRealm extends AuthorizingRealm {
//
//    Logger logger = LoggerFactory.getLogger(StatelessRealm.class);
//
//    @Autowired
//    private CredentialService credentialService;
//
//    @Override
//    public boolean supports(AuthenticationToken token) {
//        //仅支持StatelessToken类型的Token
//        return token instanceof StatelessToken;
//    }
//
//    @Override
//    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//        //根据用户名查找角色，请根据需求实现
//        String userName = (String) principals.getPrimaryPrincipal();
//        logger.debug("**************** doGetAuthorizationInfo userId=" + userName);
//        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        IotCredential iotCredential= credentialService.selectCredentialByName(userName);
//        iotCredential= credentialService.findCredentialWithRolesByUserName(iotCredential.getTenantId(),userName,1);
//        List<CredentialsRoles> roles= iotCredential.getRoles();
//        StringBuffer sb = new StringBuffer();
//        for(CredentialsRoles role : roles){
//            authorizationInfo.addRole(role.getIotRole().getName());
//            List<RolesPermissions> permissionses = role.getIotRole().getPermissions();
//            for (RolesPermissions rolesPermission:permissionses){
//                sb.append(rolesPermission.getIotPermission().getWildcard());
//                sb.append(", ");
//                authorizationInfo.addStringPermission(rolesPermission.getIotPermission().getWildcard());
//            }
//        }
//        logger.debug(userName+"has permissions :"+sb.toString());
//        return authorizationInfo;
//    }
//
//    @Override
//    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
//
//        String userName = token.getPrincipal().toString();
//        logger.debug("**************** doGetAuthorizationInfo userId=" + userName);
//        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userName, token.getCredentials(), getName());
//        return simpleAuthenticationInfo;
//    }
//
//    private String getKey(String username) {//得到密钥，此处硬编码一个
//        if ("admin".equals(username)) {
//            return "dadadswdewq2ewdwqdwadsadasd";
//        }
//        return null;
//    }
//}
