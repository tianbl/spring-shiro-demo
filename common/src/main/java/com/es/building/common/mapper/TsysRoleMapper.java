package com.es.building.common.mapper;

import com.es.building.common.entity.TsysRole;

public interface TsysRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TsysRole record);

    int insertSelective(TsysRole record);

    TsysRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TsysRole record);

    int updateByPrimaryKey(TsysRole record);
}