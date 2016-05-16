package com.es.building.common.util;

import com.es.building.common.entity.TokenKit;

import java.util.*;

/**
 * Created by 王有鹏
 * 时间 : 2015/12/24
 */
public class PermissionManager {

    private static final Map<String, TokenKit> tokenTimeLimitAndNameMap = new HashMap<>();

    private static final Map<String, Long> blackList = new HashMap<>();

    private static final Map<String, List<String>> userNameTokenMap = new HashMap<>();

    public static float tokenLastLimit;

    private static float criticalLimit;

    private static Long milliPerMin = 60000L;


    public static void addToken(String userName, String token) {
        //添加到token和过期时间的映射表
        TokenKit kit = new TokenKit();
        kit.setTime(new Date().getTime());
        kit.setUserName(userName);
        tokenTimeLimitAndNameMap.put(token, kit);
        //添加到userName和token的映射表
        synchronized (userNameTokenMap) {
            if (userNameTokenMap.containsKey(userName)) {
                //该userName的映射记录已经存在
                userNameTokenMap.get(userName).add(token);
            } else {
                //该userName的映射记录还未创建
                List<String> list = new ArrayList<>();
                list.add(token);
                userNameTokenMap.put(userName, list);
            }
        }

    }


    public static boolean needGenerateToken(String token) {
        if (tokenTimeLimitAndNameMap.containsKey(token)) {
            Long passTime = new Date().getTime() - tokenTimeLimitAndNameMap.get(token).getTime();
            if (passTime < (tokenLastLimit - criticalLimit) * milliPerMin) {
                //未过期，且不需要重新生成token
                return false;
            } else {
                if (passTime < (tokenLastLimit * milliPerMin)) {
                    //未过期，但需要重新生成token
                    String userName = tokenTimeLimitAndNameMap.get(token).getUserName();
                    tokenTimeLimitAndNameMap.remove(token);
                    userNameTokenMap.get(userName).remove(token);

                    return true;
                } else {
                    //已过期，不需要生成token ,这段代码应该是走不到的，但是为了逻辑的完整，就先放在这儿吧
                    String userName = tokenTimeLimitAndNameMap.get(token).getUserName();
                    tokenTimeLimitAndNameMap.remove(token);
                    userNameTokenMap.get(userName).remove(token);

                    return false;
                }
            }
        } else {
            //即将过期，需要重新生成token
            return true;
        }
    }

    public static void logout(String token) {
        if (tokenTimeLimitAndNameMap.containsKey(token)) {
            //移出用户表
            String userName = tokenTimeLimitAndNameMap.get(token).getUserName();
            userNameTokenMap.get(userName).remove(token);
            //加入黑名单
            blackList.put(token, tokenTimeLimitAndNameMap.get(token).getTime());
            //移出token表
            tokenTimeLimitAndNameMap.remove(token);
        }
    }


    public static boolean isInvalidToken(String token) {
        return blackList.containsKey(token);
    }


    public static Integer cleanTokenTimeLimitMap() {
        float expireTime = milliPerMin * tokenLastLimit;
        Long now = new Date().getTime();
        List<String> invalidTokens = new ArrayList<>();
        for (Map.Entry<String, TokenKit> entry : tokenTimeLimitAndNameMap.entrySet()) {
            if ((now - entry.getValue().getTime()) > expireTime) {
                String token = entry.getKey();
                invalidTokens.add(token);
                //将token从对应的userNameTokenMap中移除
                String userName = entry.getValue().getUserName();
                userNameTokenMap.get(userName).remove(token);
            }
        }
        for (String token : invalidTokens) {
            tokenTimeLimitAndNameMap.remove(token);
        }
        return invalidTokens.size();
    }

    public static Integer cleanBlackList() {
        float expireTime = milliPerMin * tokenLastLimit;
        Long now = new Date().getTime();
        List<String> invalidBlacks = new ArrayList<>();
        for (Map.Entry<String, Long> entry : blackList.entrySet()) {
            if ((now - entry.getValue()) > expireTime) {
                invalidBlacks.add(entry.getKey());
            }
        }
        for (String token : invalidBlacks) {
            blackList.remove(token);
        }
        return invalidBlacks.size();
    }


    /**
     * 清除该用户所有登录点的登录状态
     *
     * @param userName
     * @return
     */
    public static int kickLoginStatusOf(String userName) {
        int kickNum = 0;
        if (userNameTokenMap.containsKey(userName)) {
            List<String> tokenArray = userNameTokenMap.get(userName);
            kickNum = tokenArray.size();
            for (String token : tokenArray) {
                tokenTimeLimitAndNameMap.remove(token);
            }
            userNameTokenMap.remove(userName);
        }
        return kickNum;
    }


    public static void setTokenLastLimit(float tokenLastLimit) {
        PermissionManager.tokenLastLimit = tokenLastLimit;
    }

    public static void setCriticalLimit(float criticalLimit) {
        PermissionManager.criticalLimit = criticalLimit;
    }


}
