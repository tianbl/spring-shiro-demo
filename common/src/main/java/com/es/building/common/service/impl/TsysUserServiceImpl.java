package com.es.building.common.service.impl;

import com.es.building.common.entity.TsysUser;
import com.es.building.common.mapper.TsysUserMapper;
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
public class TsysUserServiceImpl extends BaseServiceImpl<TsysUser> implements TsysUserService {
    private static Logger LOGGER = LoggerFactory.getLogger(TsysUserServiceImpl.class);

    @Autowired
    private TsysUserMapper tsysUserMapper;

    @Override
    public TsysUser selectByUserName(String userName) {
        return tsysUserMapper.selectByUserName(userName);
    }
}
