package com.es.building.common.util;

import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;

/**
 * AES Coder<br/>
 * secret key length:   128bit, default:    128 bit<br/>
 * Created by chenluo on 2015/9/28.
 *
 */
public class AESCoder {



    /**
     * 密钥算法
     */
    private static final String KEY_ALGORITHM = "AES";

    private static final String DEFAULT_CIPHER_ALGORITHM = "AES/ECB/PKCS5Padding";

    /**
     * 初始化密钥
     *
     * @return byte[] 密钥
     * @throws Exception
     */
    public static byte[] initSecretKey() {
        //返回生成指定算法的秘密密钥的 KeyGenerator 对象
        KeyGenerator kg = null;
        try {
            kg = KeyGenerator.getInstance(KEY_ALGORITHM);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return new byte[0];
        }
        //初始化此密钥生成器，使其具有确定的密钥大小
        //AES 要求密钥长度为 128
        kg.init(128);
        //生成一个密钥
        SecretKey  secretKey = kg.generateKey();
        return secretKey.getEncoded();
    }

    /**
     * 转换密钥
     *
     * @param key   二进制密钥
     * @return 密钥
     */
    private static Key toKey(byte[] key){
        //生成密钥
        return new SecretKeySpec(key, KEY_ALGORITHM);
    }

    /**
     * 加密
     *
     * @param data  待加密数据
     * @param key   密钥
     * @return byte[]   加密数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] data,Key key) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        return encrypt(data, key,DEFAULT_CIPHER_ALGORITHM);
    }

    /**
     * 加密
     *
     * @param data  待加密数据
     * @param key   二进制密钥
     * @return byte[]   加密数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] data,byte[] key) throws Exception{
        return encrypt(data, key,DEFAULT_CIPHER_ALGORITHM);
    }


    /**
     * 加密
     *
     * @param data  待加密数据
     * @param key   二进制密钥
     * @param cipherAlgorithm   加密算法/工作模式/填充方式
     * @return byte[]   加密数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] data,byte[] key,String cipherAlgorithm) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        //还原密钥
        Key k = toKey(key);
        return encrypt(data, k, cipherAlgorithm);
    }

    /**
     * 加密
     *
     * @param data  待加密数据
     * @param key   密钥
     * @param cipherAlgorithm   加密算法/工作模式/填充方式
     * @return byte[]   加密数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] data,Key key,String cipherAlgorithm) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        //实例化
        Cipher cipher = Cipher.getInstance(cipherAlgorithm);
        //使用密钥初始化，设置为加密模式
        cipher.init(Cipher.ENCRYPT_MODE, key);
        //执行操作
        return cipher.doFinal(data);
    }



    /**
     * 解密
     *
     * @param data  待解密数据
     * @param key   二进制密钥
     * @return byte[]   解密数据
     * @throws Exception
     */
    public static byte[] decrypt(byte[] data,byte[] key) throws Exception{
        return decrypt(data, key,DEFAULT_CIPHER_ALGORITHM);
    }

    /**
     * 解密
     *
     * @param data  待解密数据
     * @param key   密钥
     * @return byte[]   解密数据
     * @throws Exception
     */
    public static byte[] decrypt(byte[] data,Key key) throws Exception{
        return decrypt(data, key,DEFAULT_CIPHER_ALGORITHM);
    }

    /**
     * 解密
     *
     * @param data  待解密数据
     * @param key   二进制密钥
     * @param cipherAlgorithm   加密算法/工作模式/填充方式
     * @return byte[]   解密数据
     * @throws Exception
     */
    public static byte[] decrypt(byte[] data,byte[] key,String cipherAlgorithm) throws Exception{
        //还原密钥
        Key k = toKey(key);
        return decrypt(data, k, cipherAlgorithm);
    }

    /**
     * 解密
     *
     * @param data  待解密数据
     * @param key   密钥
     * @param cipherAlgorithm   加密算法/工作模式/填充方式
     * @return byte[]   解密数据
     * @throws Exception
     */
    public static byte[] decrypt(byte[] data,Key key,String cipherAlgorithm) throws Exception{
        //实例化
        Cipher cipher = Cipher.getInstance(cipherAlgorithm);
        //使用密钥初始化，设置为解密模式
        cipher.init(Cipher.DECRYPT_MODE, key);
        //执行操作
        return cipher.doFinal(data);
    }

    private static String  showByteArray(byte[] data){
        if(null == data){
            return null;
        }
        StringBuilder sb = new StringBuilder("{");
        for(byte b:data){
            sb.append(b).append(",");
        }
        sb.deleteCharAt(sb.length()-1);
        sb.append("}");
        return sb.toString();
    }



    public static void main(String[] args) throws Exception {
        byte[] key = initSecretKey();
//        byte [] key= {-121,-17,126,85,2,-34,-69,0,-96,68,-16,-36,72,89,85,99};
        System.out.println("key："+showByteArray(key));
        String afterEncrpt ="8bbac9abbe289c3e313fb57535ca72a1";
        Key k = toKey(key);

        String data ="AES数据";
        System.out.println("加密前数据: string:"+data);
        System.out.println("加密前数据: byte[]:"+showByteArray(data.getBytes()));
        System.out.println();
        byte[] encryptData = encrypt(data.getBytes(), k);
        System.out.println("加密后数据: byte[]:"+showByteArray(encryptData));
        System.out.println("加密后数据: hexStr:"+ Hex.encodeHexStr(encryptData));
//        byte[] decryptData = decrypt(encryptData, k);

        byte[] decryptData = decrypt(Hex.decodeHex(afterEncrpt.toCharArray()), k);
        System.out.println("解密后数据: byte[]:"+showByteArray(decryptData));
        System.out.println("解密后数据: string:"+new String(decryptData));
//        System.out.println("解密后数据: string:"+new String(decryptData1));

    }

    public static String encryptPassword(String password,byte [] key) throws InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, IllegalBlockSizeException, NoSuchPaddingException {
        Key k = toKey(key);

        String data =password;
        System.out.println("加密前数据: string:"+data);
        byte[] encryptData = encrypt(data.getBytes(), k);
        return Hex.encodeHexStr(encryptData);
    }

    public static String decryptPassword(String password,byte [] key) throws Exception {
        Key k = toKey(key);
        byte[] decryptData = decrypt(Hex.decodeHex(password.toCharArray()), k);
        return new String(decryptData);
    }
}


