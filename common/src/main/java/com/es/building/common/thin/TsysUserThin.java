package com.es.building.common.thin;

import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.pager.BaseThin;

/**
 * Created by baolei on 2016/5/12.
 */
public interface TsysUserThin extends BaseThin<TsysUserEntity> {
    public TsysUserEntity selectByUserName(String userName);
}
