package com.es.building.common.util;


public class Constants {

    public static final long DEVICE_DUPLICATE = -10;

    public static final String XXX_XXX = "xxx";

    public static final String DEFAULT_GROUP_NAME = "things";

    public static final String PAGE_NUMBER = "pageNum";

    public static final String PAGE_SIZE = "pageSize";

    public static final Integer DEFAULT_PAGE_NUM = 1;

    public static final Integer DEFAULT_PAGE_SIZE = 10;

    public static final Integer DELETE_TENANT_FAILED = -1;

    public static final Integer DELETE_TENANT_SUCCESS = 0;

    public static final Integer NOT_FOUND_PRODUCE = -1;

    public static final Integer STATUS_FORBIDDEN = 0;

    public static final Integer STATUS_NOTFORBIDDEN = 1;

    public static final Integer STATUS_PROJECT_EXPIRE = 2;

    public static final Integer STATUS_EXPIRE = 3;

    public static final Integer OPERATE_FAILED = 0;

    public static final Integer OPERATE_SUCCESS = 1;

    public static final Integer GROUPID_INEXISTENCE = 2;

    public static final Integer GROUPID_INVALID = 3;

    //project不存在
    public static final Integer PROJECTID_INEXISTENCE = 2;

    //单条数据写操作正确返回结果
    public static final Integer RESULT_SUCCESS = 1;

    public static final String TOPIC = "{\"topic\":[";

    public static final String GEOFENCE = "geofence";

    public static final String END = "]}";

    //设备状态 1：启用
    public static final int STATUS = 1;

    //topic分隔符
    public static final String TOPIC_SEPARATOR = "/";

    //设备状态查询时，当设备没有状态信息时，返回"null"

    public static final String BROKER_RESULT = "null";

    public static final String NULL_JSON = "{}";

    public static final String ADMIN = "admin";

    public static final String USER = "user";

    public static final String BROKER_OPERATION_INSERT = "broker插入设备";

    //设备topic层数
    public static final int TOPIC_LAYER_THREE = 3;

    public static final int TOPIC_LAYER_FOUR = 4;
    //为global的角色类型
    public static final String TYPE_GLOBAL = "global";

    public static final int NUM_TWO = 2;

    //MQTT与broker之间的链接服务
    public static final String SERVICE_CODE_CONNECT = "001";

    //引擎服务
    public static final String SERVICE_CODE_ENGINE = "002";

    //大数据服务（数据采集）
    public static final String SERVICE_CODE_DATA_ACQUISITION = "003";

    //收费单位类型
    public static final String TYPE_YEAR_CODE = "001";

    public static final String TYPE_MONTH_CODE = "002";

    public static final String TYPE_DAY_CODE = "003";

    public static final String TYPE_NUM_CODE = "004";

    public static final int Num_Zero = 0;

    public static final int NUM_ONE = 1;

    public static final String STR_OK = "OK";

    public static final Integer BROKER_OPERATE_SUCCESS = 0;

    public static final Integer BROKER_SQL_PARSER_ERROR = 1;

    public static final Integer BROKER_RULE_COUNT_OVERFLOW = 2;

    public static final Integer BROKER_UNDEFINED = 3;


    public static final String STR_FREE = "free";

    public static final String STR_CHARGE = "charge";

    public static final String STR_USED = "used";

    public static final String CONN_OPERATE_ADD = "add";

    public static final String CONN_OPERATE_REDUCE = "reduce";
    //注册
    public static final String MSG_TYPE_CONFIRM = "activation";
    //重置密码
    public static final String MSG_TYPE_RESET_PASSWORD = "resetPassword";

    //重发时间
    public static final Long WAITTIME = 300L;

    public static final Integer TYPE_ACTIVATION = 0;

    public static final Integer TYPE_RETRIEVE = 1;

    //根据thing返回的code判断查询状态是否成功：1成功；0失败
    public static final Integer SELECT_SHADOW_SUCCESS = 1;

    public static final Integer EMAIL_NOT_EXIST = 2;

    public static final Integer EMAIL_ACTIVATED = 3;

    public static final Integer CREDENTIAL_FAILED = 4;

    public static final Long DEFAULT_PRODUCT_QUANTITY = 0L;

    public static final String SYS_GROUP_NAME = "$SYS";

    public static final String CONNECT = "connect";

    public static final String NAME_CONNECT = "$SYS/connect";

    public static final String DISCONNECT = "disconnect";

    public static final String NAME_DISCONNECT = "$SYS/disconnect";

    public static final String LOSTCONNECT = "lostconnect";

    public static final String NAME_LOSTCONNECT = "$SYS/lostconnect";

    public static final String YYYYMMDD = "yyyyMMdd";

    public static final String RESOURCE_NAME = "resource";

    public static final String SERVICE_INSTANCE_NAME = "服务实例";

    public static final String PROJECT_NAME = "project";

    public static final String CONSOLE_LOG = "com.iot.console";

    public static final Integer SELECT_NUM = 1;

    public static final Integer ACTIONS_NUM_ERROR = 6;


    public static final int NAME_LENGTH = 20;

    public static final int NAME_MIN_LENGTH = 3;

    public static final int PASSWORD_LENGTH_MAX = 30;

    public static final int PASSWORD_LENGTH_MIN = 6;

    //tenant status
    //已删除
    public static final int TENANT_STATUS_INIT = 0;
    //已激活
    public static final int TENANT_STATUS_ACTIVATION= 1;
    //审核通过待激活
    public static final int TENANT_STATUS_EXAMINE = 2;
    //未激活
    public static final int TENANT_STATUS_NEW = 3;

    //激活码表 IotActivationCode status
    //可用状态
    public static final int ACTIVATION_STATUS_EXAMINE = 1;

    //激活码表类型
    //0:激活码
    public static final int ACTIVATION_TYPE_ACTIVATE = 0;
    //1:重置码
    public static final int ACTIVATION_TYPE_RESET = 1;

//  public static final Long DEFAULT_PRODUCT_QUANTITY=0L;

    public static final int  DEFAULT_USED_QUANTITY=0;

    //credential status
    //新创建（无效）
    public static final int CREDENTIAL_INIT = 2;
    //删除（无效）
    public static final int CREDENTIAL_INVALID = 0;
    //有效
    public static final int CREDENTIAL_EFFECTIVE = 1;
    //废弃
    public static final int CREDENTIAL_ABANDON = 3;


    //project status
    //删除
    public static final int PROJECT_DELETE = 0;
    //有效
    public static final int PROJECT_EFFECTIVE = 1;
    //过期失效
    public static final int PROJECT_INVALID = 2;
    //新建
    public static final int PROJECT_INIT = 3;

    public static Long defaultOfferId ;

    public static void setDefaultOfferId(Long defaultOfferId) {
        Constants.defaultOfferId = defaultOfferId;
    }
}
