package com.es.building.common.redis;

import org.springframework.cache.interceptor.KeyGenerator;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;

/**
 * Created by chenluo on 2015/9/14.
 */
public class MyKeyGenerator implements KeyGenerator {
    @Override
    public Object generate(Object target, Method method, Object... params) {
        StringBuilder sb = new StringBuilder();
        sb.append(target.getClass().getName());
        sb.append(method.getName());
        for (Object obj : params) {
            sb.append(obj.toString());
        }
        try {
            return new String(sb.toString().getBytes("ISO8859-1"),"utf-8");
        }catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return sb.toString();
        }

    }
}
