package com.es.building.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by liruilong on 2015/9/19.
 */
public class ParamsMethod {
    public static  boolean testEmial(String email) {
        boolean flag = false;
        try {
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    public static boolean testPhone(String mobilephone) {

        boolean flag = false;
        try {
            Pattern regex = Pattern.compile("^(((13[0-9])|(14[0-9])|(17[0-9])|(15([0-3]|[5-9]))|(18[0-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
            Matcher matcher = regex.matcher(mobilephone);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
}
