package com.es.building.common.service;

import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.pager.BaseService;

/**
 * Created by baolei on 2016/5/12.
 */
public interface TsysUserService extends BaseService<TsysUserEntity> {
    public TsysUserEntity selectByUserName(String userName);
}
