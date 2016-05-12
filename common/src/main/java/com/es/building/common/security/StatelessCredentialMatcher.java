//package com.es.building.security;
//
//import org.apache.shiro.authc.AuthenticationInfo;
//import org.apache.shiro.authc.AuthenticationToken;
//import org.apache.shiro.authc.credential.CredentialsMatcher;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import v1.com.hp.es.iot.common.util.PassWordHelper;
//import v1.com.hp.es.iot.common.util.PermissionManager;
//import v1.com.hp.es.iot.common.util.TokenUtil;
//
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * Created by chen luo jie on 2015/6/3.
// */
//public class StatelessCredentialMatcher implements CredentialsMatcher {
//    Logger logger = LoggerFactory.getLogger(StatelessCredentialMatcher.class);
//
////    private StatelessAuthService statelessAuthService;
//
//    @Override
//    public boolean doCredentialsMatch(AuthenticationToken authenticationToken, AuthenticationInfo authenticationInfo) {
//        String token = authenticationToken.getCredentials().toString();
//
//        if (PermissionManager.isInvalidToken(token)){
//            return false;
//        }else {
//            return true;
//        }
///*        try {
//            String userName = TokenUtil.verifyToken(token);
//            if (PassWordHelper.ifHasUser(userName)) {
//                //租户已登录
//                if (PassWordHelper.ifHasToken(userName,token)) {
//                    //token可用
//                    return true;
//                } else {
//                    //token已失效
//                    return false;
//                }
//            } else {
//                //租户未登录或已注销
//                return false;
//            }
//        } catch (Exception e) {
//            logger.error("", e);
//        }
//        return false;*/
//    }
//}
