package com.es.building.common.thin.impl;

import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.pager.BaseThinImpl;
import com.es.building.common.service.TsysUserService;
import com.es.building.common.thin.TsysUserThin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by baolei on 2016/5/12.
 */
@Service
public class TsysUserThinImpl extends BaseThinImpl<TsysUserEntity> implements TsysUserThin {
    private static Logger LOGGER = LoggerFactory.getLogger(TsysUserThinImpl.class);

    @Autowired
    private TsysUserService tsysUserService;

    @Override
    public TsysUserEntity selectByUserName(String userName) {
        return tsysUserService.selectByUserName(userName);
    }
}
