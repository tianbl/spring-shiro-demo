package com.es.building.common.util;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by chenluo on 2015/9/28.
 */
public class PassWordHelper {



    private static final byte[] iotKey = {-121, -17, 126, 85, 2, -34, -69, 0, -96, 68, -16, -36, 72, 89, 85, 99};

    private static final String[] character = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
            , "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

//    private static final Map<String, TokenQueue> tokenCache = new HashMap<String, TokenQueue>();

//    public static final float lastMinute = 15;
//    private static final Long milliPerMin = 60000L;

//    public static void addUserInfo(String userName, String token, Long currentTime) {
//        TokenKit tokenKit = new TokenKit();
//        tokenKit.setToken(token);
//        tokenKit.setTime((long) (currentTime + lastMinute * milliPerMin));
//        TokenQueue queue = new TokenQueue();
//        queue.add(tokenKit);
//        tokenCache.put(userName, queue);
//
//    }
//
//    public static boolean ifHasUser(String userName) {
//        if (tokenCache.containsKey(userName)) {
//            return true;
//        } else {
//            return false;
//        }
//    }
//
//    public static boolean ifHasToken(String userName, String token) {
//        if (tokenCache.containsKey(userName)) {
//            if (tokenCache.get(userName).ifHas(token)) {
//                return true;
//            } else {
//                return false;
//            }
//        } else {
//            return false;
//        }
//    }
//
//
//    public static void updateUserInfo(String userName, String token, Long currentTime) {
//        if (tokenCache.containsKey(userName)) {
//            TokenKit tokenKit = new TokenKit();
//            tokenKit.setToken(token);
//            tokenKit.setTime((long) (currentTime + lastMinute * milliPerMin));
//            tokenCache.get(userName).add(tokenKit);
//        }
//    }
//
//    public static void deleteUserInfo(String userName){
//
//        if (tokenCache.containsKey(userName)){
//            tokenCache.remove(userName);
//        }
//    }
//
//    public static Integer clearExpireTokens() {
//        Long now = new Date().getTime();
//        List<String> expireTokens = new ArrayList<>();
//        synchronized (tokenCache) {
//            for (Map.Entry<String, TokenQueue> entry : tokenCache.entrySet()) {
//                if (entry.getValue().ifExpire(now)) {
//                    expireTokens.add(entry.getKey());
//                }
//            }
//            for (String key : expireTokens) {
//                tokenCache.remove(key);
//            }
//        }
//        return expireTokens.size();
//    }


    /**
     * 加密密码
     *
     * @param password 密码
     * @return 加密后的字符串
     */
    public static String encriptPassword(String password) throws IllegalBlockSizeException, NoSuchPaddingException, BadPaddingException, NoSuchAlgorithmException, InvalidKeyException {
        return AESCoder.encryptPassword(password, iotKey);
    }

    /**
     * 解密密码
     *
     * @param encriptPassword 加密后的密码字符
     * @return 解密后的密码
     */
    public static String decriptPassword(String encriptPassword) throws Exception {
        return AESCoder.decryptPassword(encriptPassword, iotKey);
    }

    /**
     * @param length 密码长度
     * @return
     */
    public static String generatePassword(int length) {
        int intTemp;
        StringBuilder strPassword = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < length; i++) {
            intTemp = rand.nextInt(character.length);
            strPassword.append(character[intTemp]);
        }
        return strPassword.toString();
    }


    public static void main(String args[]) {
        System.out.println(generatePassword(8));

        try {
            String s = encriptPassword("admin"); //将 s 存入数据库
            System.out.println("after ecctiptPassword:" + s);
            System.out.println(decriptPassword(s));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
