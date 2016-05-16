package com.es.building.common.service;

import com.es.building.common.entity.TsysUser;
import com.es.building.common.pager.BaseService;

/**
 * Created by baolei on 2016/5/12.
 */
public interface TsysUserService extends BaseService<TsysUser> {
    public TsysUser selectByUserName(String userName);
}
