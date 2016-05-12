package com.es.building.common.service.impl;

import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.mapper.TsysRoleEntityMapper;
import com.es.building.common.mapper.TsysUserEntityMapper;
import com.es.building.common.service.TsysUserService;
import com.es.building.common.pager.BaseServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by baolei on 2016/5/12.
 */
@Service
public class TsysUserServiceImpl extends BaseServiceImpl<TsysUserEntity> implements TsysUserService {
    private static Logger LOGGER = LoggerFactory.getLogger(TsysUserServiceImpl.class);

    @Autowired
    private TsysUserEntityMapper tsysUserEntityMapper;

    @Override
    public TsysUserEntity selectByUserName(String userName) {
        return tsysUserEntityMapper.selectByUserName(userName);
    }
}
