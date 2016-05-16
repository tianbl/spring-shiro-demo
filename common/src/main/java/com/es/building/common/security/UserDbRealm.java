package com.es.building.common.security;


import com.es.building.common.entity.TsysUser;
import com.es.building.common.thin.TsysUserThin;
import com.es.building.common.util.PassWordHelper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by chen luo jie on 2015/6/3.
 */
public class UserDbRealm extends AuthorizingRealm {

    Logger logger = LoggerFactory.getLogger(UserDbRealm.class);

    @Autowired
    private TsysUserThin tsysUserThin;

//    @Autowired
//    private CredentialService credentialService;


    @Override
    public boolean supports(AuthenticationToken token) {
        //仅支持StatelessToken类型的Token
        return  token instanceof UsernamePasswordToken;
    }


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String userName = token.getPrincipal().toString();
        logger.info("************* doGetAuthorizationInfo userName="+userName);
        TsysUser userEntity= tsysUserThin.selectByUserName(userName);

        if(userEntity != null){
            SimpleAuthenticationInfo simpleAuthenticationInfo = null;
            try {
                simpleAuthenticationInfo = new SimpleAuthenticationInfo(userEntity.getUsername(), PassWordHelper.decriptPassword(userEntity.getPassword()),getName());
            } catch (Exception e) {
               logger.error("",e);
                throw new AuthenticationException(e.getMessage());
            }
            simpleAuthenticationInfo.setCredentialsSalt(null);
            return simpleAuthenticationInfo;
        }
        logger.error("can not found credential by user name"+userName);
        return null;
    }

}
