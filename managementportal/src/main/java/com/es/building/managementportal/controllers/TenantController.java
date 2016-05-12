package com.es.building.managementportal.controllers;

import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.thin.TsysUserThin;
import com.es.building.common.util.PermissionManager;
import com.es.building.common.util.SystemConstants;
import com.es.building.common.util.TokenUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by liruilong on 2015/9/16.
 */
@RestController
public class TenantController {
    private static Logger LOGGER = LoggerFactory.getLogger(TenantController.class);

    @Autowired
    private TsysUserThin tsysUserThin;

    private static final byte[] iotKey = {-121, -17, 126, 85, 2, -34, -69, 0, -96, 68, -16, -36, 72, 89, 85, 99};

    /**
     * 登录
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/V1/user/login", method = RequestMethod.POST)
    public TsysUserEntity loginTenant(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException {
        LOGGER.info("Request.POST [/V1/user/login]");
        String username = request.getHeader("username");
        String password = request.getHeader("password");
        if (username == null || password == null) {
            response.setHeader("resultCode", SystemConstants.ResultCodes.R_USERNAME_PASSWORD_NULL.toString());
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            LOGGER.info("<=================Response status={},username and password are null ! ", response.getStatus());
        } else {
            TsysUserEntity userEntity = tsysUserThin.selectByUserName(username);
            if (userEntity == null) {
                response.setHeader("resultCode", SystemConstants.ResultCodes.R_SELECT_CREDENTAIL_FAILED.toString());
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                LOGGER.info("<=================Response status={}, tenant is not existing", response.getStatus());
            } else {
                Subject subject = SecurityUtils.getSubject();
                UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
                try {
                    //登录验证
                    subject.login(usernamePasswordToken);
                    String token = TokenUtil.generateToken(username);
                    //将生成的token放入缓存
                    PermissionManager.addToken(username, token);
                    response.addHeader("token", token);
                    response.setHeader("resultCode", SystemConstants.ResultCodes.R_OPERATE_SUCCESS.toString());
                    response.setStatus(HttpServletResponse.SC_OK);
                    LOGGER.info("<=================Response status={},token={}", response.getStatus(), token);
                    return userEntity;
                } catch (Exception e) {
                    LOGGER.error(e.getMessage());
                    response.setHeader("resultCode", SystemConstants.ResultCodes.R_PASSWORD_ERROR.toString());
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    LOGGER.info("<=================Response status={}", response.getStatus());
                }
            }
        }

        return null;
    }

    @RequestMapping(value = "/V1/user/getDate", method = RequestMethod.POST)
    public Date getDate(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException {
        LOGGER.info("Request.POST [/V1/user/login]");
        return new Date();
    }
    /**
     * 用户登出
     * create by caosn
     *
     * @param token
     * @param response
     * @return
     */
//    @RequiresPermissions("api:http:post:quitTenant")
//    @RequestMapping(value = "/V1/tenantportal/public/tenant/logout", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
//    public int quitTenant(@RequestHeader("token") String token, HttpServletResponse response) throws Exception {
//        LOGGER.info("Request.POST [/V1/tenantportal/public/tenant/logout] ");
//        if (token == null) {
//            response.setHeader("resultCode", SystemConstants.ResultCodes.R_PARAM_ERROR.toString());
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            LOGGER.info("<=================Response.POST at status ={} ,token is null !!! ",response.getStatus());
//            return Constants.OPERATE_FAILED;
//        } else {
//            PermissionManager.logout(token);
//            response.setHeader("resultCode", SystemConstants.ResultCodes.R_OPERATE_SUCCESS.toString());
//            response.setStatus(HttpServletResponse.SC_OK);
//            LOGGER.info("<=================Response at status = {} ", response.getStatus());
//
//            return Constants.OPERATE_SUCCESS;
//
//        }
//
//    }


//    /**
//     * 修改信息
//     * create by caosn
//     * modifyType:
//     * 1:激活后更改信息的调用
//     * 2:修改密码的调用
//     * 3:重置密码的调用
//     *
//     * @param tenantVo
//     * @param response
//     * @return IotTenant
//     */
//    @RequiresPermissions("api:http:post:updateInformation")
//    @RequestMapping(value = "/V1/tenantportal/public/tenant/{id}", method = RequestMethod.PUT, produces = {MediaType.APPLICATION_JSON_VALUE})
//    public IotTenant updateInformation(@PathVariable("id") Long id, @RequestBody TenantVo tenantVo, HttpServletResponse response) throws Exception {
//        LOGGER.info("Request.PUT [/V1/tenantportal/public/tenant/retrieve] ");
//        if (tenantVo.getModifyType() == null) {
//            response.setHeader("resultCode", SystemConstants.ResultCodes.R_PARAM_ERROR.toString());
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            LOGGER.info("<=================Response.PUT at status = {} ,modifyType is null!!! ",response.getStatus());
//            return null;
//        }else if(!CheckDescriptionInfo.checkDescription(tenantVo.getDescription())){
//            response.setHeader("resultCode", SystemConstants.ResultCodes.R_PARAM_ERROR.toString());
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            LOGGER.info("<=================Response.PUT at status = {} ,description error!!! ",response.getStatus());
//            return null;
//        }
//        else {
//            tenantVo.setId(id);
//            IotTenant iotTenant = tenantThin.updateUserInformation(tenantVo);
//            int result = iotTenant.getResultcode();
//            if (result == HttpServletResponse.SC_OK) {
//                response.setStatus(HttpServletResponse.SC_OK);
//                LOGGER.info("<=================Response.PUT at status = {} ", response.getStatus());
//                response.setHeader("resultCode", SystemConstants.ResultCodes.R_OPERATE_SUCCESS.toString());
//                return iotTenant;
//            } else if (result == HttpServletResponse.SC_BAD_REQUEST) {
//                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//                LOGGER.info("<=================Response.PUT at status = {} ,BAD REQUEST!!!", response.getStatus());
//                response.setHeader("resultCode", SystemConstants.ResultCodes.R_UPDATE_TENANT_FAILED.toString());
//                return null;
//            } else if (result == HttpServletResponse.SC_NOT_FOUND) {
//                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//                LOGGER.info("<=================Response.PUT at status = {} ,ID = {} NOT FOUND!!!", response.getStatus(), id);
//                response.setHeader("resultCode", SystemConstants.ResultCodes.R_UPDATE_TENANT_FAILED.toString());
//                return null;
//            } else if (result == HttpServletResponse.SC_UNAUTHORIZED) {
//                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//                LOGGER.info("<=================Response.PUT at status = {} ,UNAUTHORIZED!!!", response.getStatus());
//                response.setHeader("resultCode", SystemConstants.ResultCodes.R_UPDATE_TENANT_FAILED.toString());
//                return null;
//            }
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            LOGGER.info("<=================Response.PUT at status = {} ,Wrong modifyType!!!", response.getStatus());
//            response.setHeader("resultCode", SystemConstants.ResultCodes.R_UPDATE_TENANT_FAILED.toString());
//            return null;
//        }
//    }
}

