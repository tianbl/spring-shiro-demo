package com.es.building.managementportal.util;

import com.es.building.common.util.SystemConstants;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/**
 * Created by chenluo on 2015/9/23.
 */
@ControllerAdvice
public class GlobleExceptionHandler {

    private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

    @ExceptionHandler(value = {RuntimeException.class,DuplicateKeyException.class})
    @ResponseBody
    public String processUnauthenticatedException(HttpServletRequest request, HttpServletResponse response, Exception e) {
        LOGGER.debug("当前用户 请求 抛出异常");
        if( e instanceof UnauthorizedException){
            UnauthorizedException e1 = (UnauthorizedException)e;
            LOGGER.error("UnauthorizedException {}",e1);
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setHeader("resultCode", "UnauthorizedException");
            return "{\"result\":\"Unauthorized \"}";
        }else if(e instanceof UnauthenticatedException){
            UnauthenticatedException e1 = (UnauthenticatedException)e;
            LOGGER.error("UnauthenticatedException {}",e1);
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setHeader("resultCode", "UnauthenticatedException");
            return "{\"result\":\"Unauthenticated \"}";
        }
        else if(e instanceof DuplicateKeyException){
            DuplicateKeyException e1 = (DuplicateKeyException)e;
            LOGGER.error("DuplicateKeyException {}",e1);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setHeader("resultCode", "DuplicateKeyException");
            return "{\"result\":\"DuplicateKey error\"}";
        }else if(e instanceof NumberFormatException){
            NumberFormatException e1 = (NumberFormatException) e;
            LOGGER.error("NumberFormatException {}",e1);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setHeader("resultCode","NumberFormatException");
            return "{\"result\":\"NumberFormat error\"}";
        }else if(e instanceof HttpMessageNotReadableException){
            HttpMessageNotReadableException e1 = (HttpMessageNotReadableException) e;
            LOGGER.error("HttpMessageNotReadableException {}",e1);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setHeader("resultCode","HttpMessageNotReadableException");
            return "{\"result\":\"HttpMessageNotReadable\"}";
        }
        else {
            RuntimeException e1 = (RuntimeException) e;
            LOGGER.error("RuntimeException {}",e1);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setHeader("resultCode","RuntimeException");
            return "{\"result\":\"RuntimeException\"}";
        }
    }

    @ExceptionHandler(value = {NoSuchAlgorithmException.class, InvalidKeyException.class, BadPaddingException.class, NoSuchPaddingException.class, IllegalBlockSizeException.class})
    @ResponseBody
    public String passwordEncryptionException(HttpServletRequest request, HttpServletResponse response, Exception e) {
        LOGGER.debug(SystemConstants.LOGTAG+"密码加密或解密失败！");
        if( e instanceof RuntimeException){
            RuntimeException e1 = (RuntimeException)e;
            LOGGER.error("RuntimeException {}",e1);
        }else {
            LOGGER.error("OtherException {}",e);
        }
        response.setHeader("resultCode",SystemConstants.ResultCodes.R_PASSWORD_ENCRYPTION_ERROR.toString());
        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        return "{\"result\":\"password encrypt error \"}";
    }
}
