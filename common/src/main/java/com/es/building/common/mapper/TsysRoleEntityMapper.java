package com.es.building.common.mapper;

import com.es.building.common.entity.TsysRoleEntity;
import com.es.building.common.entity.TsysUserEntity;
import com.es.building.common.pager.BaseMaper;

public interface TsysRoleEntityMapper extends BaseMaper<TsysUserEntity>{
    int deleteByPrimaryKey(Long id);

    int insert(TsysRoleEntity record);

    int insertSelective(TsysRoleEntity record);

    TsysRoleEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TsysRoleEntity record);

    int updateByPrimaryKey(TsysRoleEntity record);
}