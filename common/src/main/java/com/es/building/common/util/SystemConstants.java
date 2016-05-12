package com.es.building.common.util;

public class SystemConstants {

    public static final String LOGTAG = "*********** ";

    public static enum ResultCodes {
        R_OPERATE_SUCCESS {
            @Override
            public String toString() {
                return "0";
            }
        },
        R_CREATE_TENANT_FAILED {
            @Override
            public String toString() {
                return "2101";
            }
        },
        R_DELETE_TENANT_FAILED {
            @Override
            public String toString() {
                return "2102";
            }
        },
        R_UPDATE_TENANT_FAILED {
            @Override
            public String toString() {
                return "2103";
            }
        },
        R_SELECT_TENANT_FAILED {
            @Override
            public String toString() {
                return "2104";
            }
        },
        //用户已存在
        R_CREATE_TENANT_EXIST {
            @Override
            public String toString() {
                return "2107";
            }
        },
        //注册太频繁
        R_CREATE_TENANT_TOO_MUCH {
            @Override
            public String toString() {
                return "2108";
            }
        },
        R_EMAIL_EXIST {
            @Override
            public String toString() {
                return "2109";
            }
        },
        R_ACTIVE_TENANT_FAILED {
            @Override
            public String toString() {
                return "2110";
            }
        },
        R_REST_TENANT_FAILED {
            @Override
            public String toString() {
                return "2111";
            }
        },
        R_ERROR_ACTIVATION_CODE {
            @Override
            public String toString() {
                return "2112";
            }
        },
        R_ERROR_REST_CODE {
            @Override
            public String toString() {
                return "2113";
            }
        },
        //用户已经激活
        R_ACTIVE_TENANT_ACTIVATION {
            @Override
            public String toString() {
                return "2114";
            }
        },
        //用户未激活
        R_ACTIVE_TENANT_NOT_ACTIVATION {
            @Override
            public String toString() {
                return "2115";
            }
        },
        R_CREATE_PROJECT_FAILED {
            @Override
            public String toString() {
                return "2201";
            }
        },
        R_DELETE_PROJECT_FAILED {
            @Override
            public String toString() {
                return "2202";
            }
        },
        R_UPDATE_PROJECT_FAILED {
            @Override
            public String toString() {
                return "2203";
            }
        },
        R_SELECT_PROJECT_FAILED {
            @Override
            public String toString() {
                return "2204";
            }
        },
        R_CREATE_GROUP_FAILED {
            @Override
            public String toString() {
                return "2301";
            }
        },
        R_DELETE_GROUP_FAILED {
            @Override
            public String toString() {
                return "2302";
            }
        },
        R_UPDATE_GROUP_FAILED {
            @Override
            public String toString() {
                return "2303";
            }
        },
        R_SELECT_GROUP_FAILED {
            @Override
            public String toString() {
                return "2304";
            }
        },
        R_GROUPNAME_EXIST {
            @Override
            public String toString() {
                return "2305";
            }
        },
        R_CREATE_DEVICE_FAILED {
            @Override
            public String toString() {
                return "2401";
            }
        },
        R_DELETE_DEVICE_FAILED {
            @Override
            public String toString() {
                return "2402";
            }
        },
        R_UPDATE_DEVICE_FAILED {
            @Override
            public String toString() {
                return "2403";
            }
        },
        R_SELECT_DEVICE_FAILED {
            @Override
            public String toString() {
                return "2404";
            }
        },
        R_DEVICE_DUPLICATE {
            @Override
            public String toString() {
                return "2405";
            }
        },
        R_DEVICE_STATE_FAILED {
            @Override
            public String toString() {
                return "2406";
            }
        },
        R_SHADOW_DELETE_FAILED {
            @Override
            public String toString() {
                return "2407";
            }
        },
        R_PARAM_ERROR {
            @Override
            public String toString() {
                return "2501";
            }
        },
        R_PERMISSION_FAILED {
            @Override
            public String toString() {
                return "2502";
            }
        },
        R_RUNTIME_EXCEPTION {
            @Override
            public String toString() {
                return "5000";
            }
        },
        //用户名密码为空
        R_USERNAME_PASSWORD_NULL {
            @Override
            public String toString() {
                return "2105";
            }
        },
        //密码错误
        R_PASSWORD_ERROR {
            @Override
            public String toString() {
                return "2106";
            }
        },
        R_SYMBOL_SLASH {
            @Override
            public String toString() {
                return "/";
            }
        },
        R_CREATE_PERMISSION_FAILED {
            @Override
            public String toString() {
                return "2601";
            }
        },
        R_DELETE_PERMISSION_FAILED {
            @Override
            public String toString() {
                return "2602";
            }
        },
        R_UPDATE_PERMISSION_FAILED {
            @Override
            public String toString() {
                return "2603";
            }
        },
        R_SELECT_PERMISSION_FAILED {
            @Override
            public String toString() {
                return "2604";
            }
        },
        R_CREATE_ROLE_FAILED {
            @Override
            public String toString() {
                return "2701";
            }
        },
        R_DELETE_ROLE_FAILED {
            @Override
            public String toString() {
                return "2702";
            }
        },
        R_UPDATE_ROLE_FAILED {
            @Override
            public String toString() {
                return "2703";
            }
        },
        R_SELECT_ROLE_FAILED {
            @Override
            public String toString() {
                return "2704";
            }
        },
        R_CREATE_CREDENTAIL_FAILED {
            @Override
            public String toString() {
                return "2801";
            }
        },
        R_DELETE_CREDENTAIL_FAILED {
            @Override
            public String toString() {
                return "2802";
            }
        },
        R_UPDATE_CREDENTAIL_FAILED {
            @Override
            public String toString() {
                return "2803";
            }
        },
        R_SELECT_CREDENTAIL_FAILED {
            @Override
            public String toString() {
                return "2804";
            }
        },
        R_PASSWORD_ENCRYPTION_ERROR {
            @Override
            public String toString() {
                return "3001";
            }
        },
        R_SELECT_RULE_FAILED {
            @Override
            public String toString() {
                return "2904";
            }
        },
        R_DELETE_RULE_FAILED {
            @Override
            public String toString() {
                return "2902";
            }
        },
        R_UPDATE_RULE_FAILED {
            @Override
            public String toString() {
                return "2903";
            }
        },
        R_CREATE_RULE_FAILED {
            @Override
            public String toString() {
                return "2901";
            }
        },

        R_PRODUCT_QUANTITY{
            @Override
            public String toString() {
                return "2911";
            }
        },

        R_SQL_PARSER_ERROR{
            @Override
            public String toString() {
                return "2912";
            }
        },

        R_ACTIONS_NUM_ERROR{
            @Override
            public String toString() {
                return "2913";
            }
        },

        R_ACTIONS_DOMAIN_ERROR{
            @Override
            public String toString() {
                return "2914";
            }
        },

        R_RULE_COUNT_OVERFLOW{
            @Override
            public String toString() {
                return "2915";
            }
        },
        R_BROKER_RETURN_NULL{
            @Override
            public String toString() {
                return "2916";
            }
        },

        R_SQL_DOMAIN_ERROR{
            @Override
            public String toString() {
                return "2917";
            }
        },

        R_TOPIC_DOMAIN_ERROR{
            @Override
            public String toString() {
                return "2918";
            }
        },
        R_ACTIONS_LACK_DOMAIN{
            @Override
            public String toString() {
                return "2919";
            }
        },
        R_ACTIONS_REPUBLISH_ERROR{
            @Override
            public String toString() {
                return "2920";
            }
        },
        R_ACTIONS_LACK_HEADERS{
            @Override
            public String toString() {
                return "2921";
            }
        },
        R_CREATE_GEOFENCE_FAILED {
            @Override
            public String toString() {
                return "3101";
            }
        },
        R_UPDATE_GEOFENCE_FAILED {
            @Override
            public String toString() {
                return "3102";
            }
        },
        R_DELETE_GEOFENCE_FAILED {
            @Override
            public String toString() {
                return "3103";
            }
        },
        INVALID_TOKEN {
            @Override
            public String toString() {
                return "4001";
            }
        },
        R_SELECT_LOG_FAILED {
            @Override
            public String toString() {
                return "3204";
            }
        },
        R_CREATE_OFFER_FAILED {
            @Override
            public String toString() {
                return "3301";
            }
        },
        R_SELECT_OFFER_FAILED {
            @Override
            public String toString() {
                return "3302";
            }
        },
        R_DELETE_OFFER_FAILED {
            @Override
            public String toString() {
                return "3303";
            }
        },
        R_SELECT_ORDER_FAILED {
            @Override
            public String toString() {
                return "3304";
            }
        },
        R_INSERT_ORDER_FAILED {
            @Override
            public String toString() {
                return "3305";
            }
        },
        R_DELETE_ORDER_FAILED {
            @Override
            public String toString() {
                return "3306";
            }
        },
        R_UPDATE_ORDER_FAILED {
            @Override
            public String toString() {
                return "3307";
            }
        },
        R_ORDER_CHARGE{
            @Override
            public String toString() { return "3308"; }
        },
        R_ORDER_USED{
            @Override
            public String toString() { return "3309"; }
        },
        R_ACTIVE_ORDER_FAILED{
            @Override
            public String toString() { return "3310"; }
        },
        R_SELECT_SERVICEINSTANCE_FAILED {
            @Override
            public String toString() {
                return "3315";
            }
        },
        R_DELETE_SERVICE_INSTANCE_FAILED {
            /*清除服务实例失败*/
            @Override
            public String toString() {
                return "3316";
            }
        },
        R_OFFER_FORBIDDEN{
            /*有套餐被禁用时给前端返回的结果码*/
            @Override
            public String toString() { return "3311"; }
        },
        R_NO_OFFER_ACTIVE{
            /*无可用套餐被激活时返回的结果码*/
            @Override
            public String toString() { return "3312"; }
        },
        R_NO_INVITATION_CODE{
            /*该用户没有邀请码*/
            @Override
            public String toString() { return "3313"; }
        },
        R_PROJECT_SIZE_LIMITED{
            /*project数量受限，超过projectSize*/
            @Override
            public String toString() { return "3314"; }
        },
        R_CREATE_SERVICE_FAILED {
            @Override
            public String toString() {
                return "3501";
            }
        },
        R_DELETE_SERVICE_FAILED {
            @Override
            public String toString() {
                return "3502";
            }
        },
        R_UPDATE_SERVICE_FAILED {
            @Override
            public String toString() {
                return "3503";
            }
        },
        R_SELECT_SERVICE_FAILED {
            @Override
            public String toString() {
                return "3504";
            }
        },
        R_CREATE_PRODUCT_FAILED {
            @Override
            public String toString() {
                return "3601";
            }
        },
        R_DELETE_PRODUCT_FAILED {
            @Override
            public String toString() {
                return "3602";
            }
        },
        R_UPDATE_PRODUCT_FAILED {
            @Override
            public String toString() {
                return "3603";
            }
        },
        R_SELECT_PRODUCT_FAILED {
            @Override
            public String toString() {
                return "3604";
            }
        }
    }
       
    
}
