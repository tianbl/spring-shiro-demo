package com.es.building.common.mapper;

import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.pager.BaseMaper;

public interface TsysUserEntityMapper extends BaseMaper<TsysUserEntity> {
    int deleteByPrimaryKey(Long id);

    int insert(TsysUserEntity record);

    int insertSelective(TsysUserEntity record);

    TsysUserEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TsysUserEntity record);

    int updateByPrimaryKey(TsysUserEntity record);

    public TsysUserEntity selectByUserName(String userName);
}