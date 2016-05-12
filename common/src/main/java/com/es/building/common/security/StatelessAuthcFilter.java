package com.es.building.common.security;


import com.es.building.common.util.PermissionManager;
import com.es.building.common.util.SystemConstants;
import com.es.building.common.util.TokenUtil;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class StatelessAuthcFilter extends AccessControlFilter {

    Logger logger = LoggerFactory.getLogger(StatelessAuthcFilter.class);


    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if (request instanceof HttpServletRequest) {
            HttpServletRequest httpServletRequest = (HttpServletRequest) request;
            String token = httpServletRequest.getHeader("token");
            logger.debug("前端传入token:"+token);
            try {

                String userName = TokenUtil.verifyToken(token);
                StatelessToken statelessToken = new StatelessToken();
                statelessToken.setToken(token);
                statelessToken.setUserName(userName);
//                getSubject(request, response).login(statelessToken);
                HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                if (PermissionManager.needGenerateToken(token)) {
                    //生成新的token
                    String newToken = TokenUtil.generateToken(userName);
                    PermissionManager.addToken(userName,newToken);
                    httpServletResponse.addHeader("token", newToken);
                }else {
                    httpServletResponse.addHeader("token",token);
                }
//                PassWordHelper.updateUserInfo(userName,newToken,new Date().getTime());
                return true;
            } catch (AuthenticationException e) {
                logger.error("验证token失败："+e.getMessage());
                return false;
            } catch (Exception e) {
                logger.error("验证token失败："+e.getMessage());
                return false;
            }
        }


        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("resultCode", SystemConstants.ResultCodes.INVALID_TOKEN.toString());
        httpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        httpServletResponse.setContentType("text/json");
        response.getWriter().write("{\"result\":\"invalid token\"}");
        return false;
    }


    //登录失败时默认返回401状态码
    private void onLoginFail(ServletResponse response) throws IOException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        httpResponse.getWriter().write("login error");
    }
}
