package com.es.building.common.security;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * this matcher is use to limit the password retry times.
 */
public class RetryLimitCredentialsMatcher extends SimpleCredentialsMatcher {
    Logger logger = LoggerFactory.getLogger(RetryLimitCredentialsMatcher.class);
    private Cache<String, AtomicInteger> passwordRetryCache;

    public RetryLimitCredentialsMatcher(CacheManager cacheManager) {
        passwordRetryCache = cacheManager.getCache("authenticationCache");
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String)token.getPrincipal();
        logger.debug("开始登录用户名密码验证, 用户名:"+username+" 密码:"+token.getCredentials());
//        AtomicInteger retryCount = passwordRetryCache.get(username);

//        if(retryCount == null) {
//            retryCount = new AtomicInteger(0);
//            passwordRetryCache.put(username, retryCount);
//        }
//        if(retryCount.incrementAndGet() > 5) {
//            //if retry count > 5 throw
//            throw new ExcessiveAttemptsException();
//        }

        boolean matches = super.doCredentialsMatch(token, info);
        if(matches) {
            //clear retry count
        	logger.debug("登录用户名密码验证成功");
//            passwordRetryCache.remove(username);
        }else{
        	logger.debug("登录用户名密码验证失败");
        }
        
        return matches;
    }
}
