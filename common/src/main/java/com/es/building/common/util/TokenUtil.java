package com.es.building.common.util;

import org.jose4j.jwk.PublicJsonWebKey;
import org.jose4j.jwk.RsaJsonWebKey;
import org.jose4j.jws.AlgorithmIdentifiers;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.consumer.JwtConsumer;
import org.jose4j.jwt.consumer.JwtConsumerBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by chenluo on 2015/10/30.
 */
public class TokenUtil {
    private static Logger logger = LoggerFactory.getLogger(TokenUtil.class);

    public static final byte [] PUBLIC_KEY={48,-126,1,34,48,13,6,9,42,-122,72,-122,-9,13,1,1,1,5,0,3,-126,1,15,0,48,-126,1,10,2,-126,1,1,0,-55,35,-99,-21,55,-59,62,-99,36,-98,70,-125,-77,-120,52,123,-109,-65,-36,-66,-69,127,-95,62,125,-71,-116,124,87,9,-21,-41,99,-126,-27,-71,-108,-51,92,41,84,-27,-60,-61,72,-106,98,126,-104,34,21,22,-57,74,99,-44,20,91,114,-104,-74,-25,-126,-8,-39,-78,-127,-113,7,-14,-5,-62,90,-108,-107,127,81,-43,-69,74,-104,114,-94,75,-99,-21,96,-79,77,115,126,-82,89,-36,-2,-55,69,63,-115,113,37,-117,-104,116,-116,-68,19,93,-3,-67,27,-77,-28,-35,23,-107,124,-7,58,124,-95,100,-28,88,92,125,11,-59,18,-1,25,8,-78,-110,-69,36,90,47,-99,95,89,22,15,41,-15,-7,115,8,104,75,-29,13,-16,68,-44,107,-65,51,119,-5,99,-105,46,-29,103,-84,-2,82,-98,3,39,-103,-103,85,0,104,12,123,-21,-62,-38,-77,28,-79,60,53,107,77,60,-56,31,127,2,98,80,6,123,113,-8,85,-86,-43,-5,-10,-16,-68,43,-6,-8,6,-88,100,-32,80,111,15,-124,-82,-106,69,-71,-117,23,65,7,38,112,-84,118,-74,123,-114,-49,-90,81,34,0,-40,-73,42,120,-99,-76,116,-80,-34,-117,-91,82,-69,-47,-1,-38,60,-46,105,2,3,1,0,1};
    public static final byte [] PRIVATE_KEY={48,-126,4,-67,2,1,0,48,13,6,9,42,-122,72,-122,-9,13,1,1,1,5,0,4,-126,4,-89,48,-126,4,-93,2,1,0,2,-126,1,1,0,-55,35,-99,-21,55,-59,62,-99,36,-98,70,-125,-77,-120,52,123,-109,-65,-36,-66,-69,127,-95,62,125,-71,-116,124,87,9,-21,-41,99,-126,-27,-71,-108,-51,92,41,84,-27,-60,-61,72,-106,98,126,-104,34,21,22,-57,74,99,-44,20,91,114,-104,-74,-25,-126,-8,-39,-78,-127,-113,7,-14,-5,-62,90,-108,-107,127,81,-43,-69,74,-104,114,-94,75,-99,-21,96,-79,77,115,126,-82,89,-36,-2,-55,69,63,-115,113,37,-117,-104,116,-116,-68,19,93,-3,-67,27,-77,-28,-35,23,-107,124,-7,58,124,-95,100,-28,88,92,125,11,-59,18,-1,25,8,-78,-110,-69,36,90,47,-99,95,89,22,15,41,-15,-7,115,8,104,75,-29,13,-16,68,-44,107,-65,51,119,-5,99,-105,46,-29,103,-84,-2,82,-98,3,39,-103,-103,85,0,104,12,123,-21,-62,-38,-77,28,-79,60,53,107,77,60,-56,31,127,2,98,80,6,123,113,-8,85,-86,-43,-5,-10,-16,-68,43,-6,-8,6,-88,100,-32,80,111,15,-124,-82,-106,69,-71,-117,23,65,7,38,112,-84,118,-74,123,-114,-49,-90,81,34,0,-40,-73,42,120,-99,-76,116,-80,-34,-117,-91,82,-69,-47,-1,-38,60,-46,105,2,3,1,0,1,2,-126,1,1,0,-105,2,-6,-87,-126,-15,-64,20,-45,77,81,-69,-57,-86,-41,92,-128,-115,103,-6,123,99,83,120,75,-124,103,-119,98,-1,-69,-27,-74,124,-84,101,44,-25,17,-18,-90,34,-20,27,-126,0,6,106,-19,101,-119,87,-44,-64,113,58,-27,29,-45,103,-4,-54,-52,118,113,91,-88,17,-18,-15,-21,58,-4,46,-38,31,1,29,-22,-60,18,-72,-34,72,-49,-125,-52,-48,-47,73,-119,46,-11,-95,10,89,-86,120,16,-123,-122,-98,-52,19,-107,38,15,-108,93,-47,1,95,-118,-48,-61,-56,36,80,42,45,48,47,67,-111,99,-65,46,121,-83,-114,-114,-100,-36,-79,64,-113,55,-101,61,44,64,-81,-109,-98,-95,65,-17,72,-125,79,35,52,-17,10,-6,31,16,21,-82,18,-16,-2,73,82,-55,-14,-40,-44,107,-14,104,115,81,84,-101,-109,10,-2,116,125,-54,-14,94,83,-65,18,61,64,-83,-31,52,-96,-7,-125,-34,-20,18,-13,50,-63,-11,-97,-116,-109,76,-28,56,-75,23,4,98,-73,-2,-101,-11,-48,17,47,-74,10,15,125,-31,92,-38,-22,-63,88,-127,-54,121,-120,-46,49,-99,-65,-101,127,66,-84,84,-71,-17,116,24,-72,-127,-36,103,-56,11,-127,30,-45,-77,17,2,-127,-127,0,-7,77,-3,118,-33,54,66,97,-119,-36,-32,16,47,-54,51,21,-122,104,20,-99,7,25,63,91,49,-49,-48,29,-76,0,-4,-33,-98,-49,116,-76,120,-102,61,-66,-113,-73,-83,123,17,-3,-4,-99,40,116,-98,-113,-70,-43,117,-58,103,103,28,61,101,-117,99,-69,-111,39,-28,-124,-64,125,-49,59,-118,29,-83,84,113,-30,-61,52,56,69,-16,-105,120,-114,-69,-74,100,-41,4,-56,12,-87,48,-118,-45,81,11,83,102,-3,-122,109,102,-94,114,-46,-41,-75,-37,-82,100,88,-52,35,24,19,-13,22,1,-39,-96,125,35,-41,33,-65,2,-127,-127,0,-50,-118,123,35,98,50,-9,-86,124,6,75,-93,-11,47,-120,-83,102,76,-75,-96,127,90,-16,24,-97,-35,107,-49,74,-107,-88,9,112,82,76,59,71,93,-3,-44,113,39,-104,-93,-10,41,25,-80,23,-36,-103,115,121,-38,102,25,-112,-13,95,66,58,-65,69,16,-82,-56,-97,19,-42,56,105,-84,109,-20,13,-80,73,40,-106,-120,-101,-99,-34,-20,-8,26,-86,-80,-60,27,96,40,-84,-121,104,-65,86,81,-24,-101,-44,31,-54,45,-5,78,84,-30,-65,-128,-7,-60,108,36,-64,-55,-104,15,82,-127,18,-115,36,42,27,73,69,-41,2,-127,-128,109,87,-49,123,123,-101,8,-78,79,13,25,25,0,92,-26,-38,-30,0,116,74,10,-6,-1,-42,-73,-102,53,-27,81,53,-67,-77,54,-84,54,-69,-112,-55,-43,-102,-26,-35,-32,-80,-63,-53,108,40,97,-66,4,109,117,-68,121,-45,115,54,-66,36,15,-115,123,72,-96,-7,-90,56,-77,84,122,-73,-38,115,-7,-71,-73,-39,-123,84,57,-6,50,-13,-68,100,-99,-33,-7,-118,117,6,104,-57,44,11,55,115,-84,76,0,55,-31,-27,-55,-58,38,38,99,-123,-41,-68,61,54,-43,17,-17,85,-112,-96,110,95,77,12,-107,-45,-99,113,2,-127,-128,94,-77,46,12,-90,60,-38,67,-24,3,-10,-16,-95,61,-1,60,10,56,-57,-38,100,42,109,5,-51,94,-9,-52,-98,-43,9,-85,-14,61,57,-56,-64,75,63,84,5,-31,-14,-31,-46,-65,59,-112,-5,15,-31,-88,9,-55,-14,-96,108,78,-70,113,-94,-128,10,-119,-64,-86,42,14,45,93,-58,78,18,68,118,110,74,-52,-6,96,126,-127,-97,50,37,-4,12,33,106,121,102,-40,-97,106,-94,-61,-128,47,-92,40,-74,-43,48,-99,110,-87,-106,-48,52,-96,77,101,27,116,-86,-108,-124,77,26,54,38,44,98,-43,-113,-105,68,23,2,-127,-128,37,89,36,85,106,0,-114,4,3,49,101,-34,102,-41,-58,39,52,90,85,-94,-84,105,47,-94,-2,-35,90,118,-74,-6,-128,-51,-90,117,21,114,-38,127,34,-19,109,32,-34,8,-78,-60,41,-108,-22,75,-57,36,123,106,-36,-15,-106,104,-45,-35,-121,108,1,-5,-14,-33,39,-102,-13,46,-65,-36,89,-88,-88,68,90,-93,95,-3,-49,3,56,78,-15,78,-98,77,27,124,89,-45,-7,63,33,-67,-5,-48,-79,1,-36,89,-119,74,56,47,-56,105,-42,45,111,81,6,-128,-62,-1,-120,-88,-84,-74,-42,0,-12,-11,98,35,71,-77};

    private static RsaJsonWebKey rsaJsonWebKey;

    static {
        try {
            generateJsonWebKey();
        }catch (Exception e){
            logger.error(e.getMessage());
        }

    }

    private static Map<String, Key> generatePublicPrivateKeyPair() throws Exception {
        // 获得公钥的密钥规范 ，publicKey是用X.509编码的
        X509EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(PUBLIC_KEY);

        // 获得私钥的密钥规范，privateKey是用PKCS#8规范编码的
        PKCS8EncodedKeySpec privatePKC8ENcodedKeySpec = new PKCS8EncodedKeySpec(PRIVATE_KEY);
        // 实例化密钥工厂
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        // 生成公钥，它是通过密钥工厂将公钥字节数组转为公钥对象
        Key publicKeyValue = keyFactory.generatePublic(publicKeySpec);
        // 生成私钥，它是通过密钥工厂将私钥字节数组转为私钥对象
        Key privateKeyValue = keyFactory.generatePrivate(privatePKC8ENcodedKeySpec);
        Map<String, Key> finalKeyPair = new HashMap<String, Key>();
        finalKeyPair.put("publicKey", publicKeyValue);
        finalKeyPair.put("privateKey", privateKeyValue);
        return finalKeyPair;
    }

    private static void generateJsonWebKey() throws Exception{
        if(rsaJsonWebKey ==null){
            Map<String, Key> keyMap =generatePublicPrivateKeyPair();
            KeyPair keyPair = new KeyPair((PublicKey) keyMap.get("publicKey"),(PrivateKey)keyMap.get("privateKey"));
            rsaJsonWebKey = (RsaJsonWebKey) PublicJsonWebKey.Factory.newPublicJwk(keyPair.getPublic());
            rsaJsonWebKey.setPrivateKey(keyPair.getPrivate());

            // Give the JWK a Key ID (kid), which is just the polite thing to do
            rsaJsonWebKey.setKeyId(String.valueOf(System.currentTimeMillis()));
        }
    }


    public static String generateToken(String userName) throws Exception {



        // Create the Claims, which will be the content of the JWT
        JwtClaims claims = new JwtClaims();
        claims.setIssuer("EastSoft");
        claims.setAudience("apiclient");
        claims.setExpirationTimeMinutesInTheFuture(PermissionManager.tokenLastLimit);
        claims.setGeneratedJwtId();
        claims.setIssuedAtToNow();
        claims.setNotBeforeMinutesInThePast(1);
        claims.setSubject(userName);
//        claims.setClaim("email","mail@example.com"); // additional claims/attributes about the subject can be added
//        List<String> groups = Arrays.asList("group-one", "other-group", "group-three");
//        claims.setStringListClaim("groups", groups); // multi-valued claims work too and will end up as a JSON array

        // A JWT is a JWS and/or a JWE with JSON claims as the payload.
        // In this example it is a JWS so we create a JsonWebSignature object.
        JsonWebSignature jws = new JsonWebSignature();

        // The payload of the JWS is JSON content of the JWT Claims
        jws.setPayload(claims.toJson());

        // The JWT is signed using the private key
        jws.setKey(rsaJsonWebKey.getPrivateKey());

        // Set the Key ID (kid) header because it's just the polite thing to do.
        // We only have one key in this example but a using a Key ID helps
        // facilitate a smooth key rollover process
        jws.setKeyIdHeaderValue(rsaJsonWebKey.getKeyId());

        // Set the signature algorithm on the JWT/JWS that will integrity protect the claims
        jws.setAlgorithmHeaderValue(AlgorithmIdentifiers.RSA_USING_SHA256);


        String jwt = jws.getCompactSerialization();

        logger.debug("生成成功 token :"+ jwt);
//        System.out.println("生成成功 token :"+ jwt);
        return  jwt;

    }

    public static String verifyToken(String jwt) throws Exception {

        JwtConsumer jwtConsumer = new JwtConsumerBuilder()
                .setRequireExpirationTime()
//                .setAllowedClockSkewInSeconds(30) //允许30秒的过期延长时间
                .setRequireSubject()
                .setExpectedIssuer("EastSoft") // whom the JWT needs to have been issued by
                .setExpectedAudience("apiclient") // to whom the JWT is intended for
                .setVerificationKey(rsaJsonWebKey.getKey()) // verify the signature with the public key
                .build(); // create the JwtConsumer instance
            JwtClaims jwtClaims = jwtConsumer.processToClaims(jwt);


//            System.out.println("token 验证成功，内容为：" + jwtClaims);
            String userName=jwtClaims.getClaimValue("sub").toString();
        return userName;


    }


}
