package com.es.building.common.security;

import org.apache.shiro.authc.AuthenticationToken;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by chen luo jie on 2015/6/3.
 */
public class StatelessToken implements AuthenticationToken {

    private String token;
    private String userName;
    private Calendar expireDate;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public StatelessToken() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Calendar getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Calendar expireDate) {
        this.expireDate = expireDate;
    }

    public StatelessToken(String token, String userName, Date createDate) {
        this.token = token;
        this.userName = userName;

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(createDate);

        calendar.add(Calendar.MINUTE,30);
        this.expireDate = calendar;
    }



    @Override
    public Object getPrincipal() {
        return userName;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
