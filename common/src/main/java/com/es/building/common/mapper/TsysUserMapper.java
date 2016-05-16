package com.es.building.common.mapper;

import com.es.building.common.entity.TsysUser;
import com.es.building.common.pager.BaseMaper;

public interface TsysUserMapper extends BaseMaper<TsysUser> {
    int deleteByPrimaryKey(Long id);

    int insert(TsysUser record);

    int insertSelective(TsysUser record);

    TsysUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TsysUser record);

    int updateByPrimaryKey(TsysUser record);

    public TsysUser selectByUserName(String userName);
}