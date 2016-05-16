package com.es.building.common.mapper;

import com.es.building.common.entity.TusrGroup;

public interface TusrGroupMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrGroup record);

    int insertSelective(TusrGroup record);

    TusrGroup selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrGroup record);

    int updateByPrimaryKey(TusrGroup record);
}