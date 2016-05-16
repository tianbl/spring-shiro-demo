package com.es.building.common.thin;

import com.es.building.common.entity.TsysUser;
import com.es.building.common.pager.BaseThin;

/**
 * Created by baolei on 2016/5/12.
 */
public interface TsysUserThin extends BaseThin<TsysUser> {
    public TsysUser selectByUserName(String userName);
}
