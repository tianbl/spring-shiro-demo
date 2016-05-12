package com.es.building.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Created by
 * wangyoupeng
 * 定时任务
 * on 2015/12/24.
 */
@Service
public class ExpiredDataCleaner {
    private final Logger LOGGER = LoggerFactory.getLogger(ExpiredDataCleaner.class);
//    @Autowired
//    private TenantThin tenantThin;
//
//    @Autowired
//    private ServiceInstanceThin serviceInstanceThin;
    public void execute() {
        //清除token
//        Integer blackNum = PermissionManager.cleanBlackList();
//        Integer mapNum = PermissionManager.cleanTokenTimeLimitMap();
//        LOGGER.info("{} black and {} invalid cache has been cleaned", blackNum, mapNum);
//
//        //清除7天内未激活的租户
//        tenantThin.deleteClearTmp();
//        LOGGER.info("quartz job do a clear unactivated tenant");
//
//        //清除过期服务实例和工程 by caosn
//        serviceInstanceThin.deleteExpireServiceInstance();
//        LOGGER.info("clear expire serviceInstance and project");
    }

//    public void setTenantThin(TenantThin tenantThin) {
//        this.tenantThin = tenantThin;
//    }
}
