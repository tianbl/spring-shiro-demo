package com.es.building.common.mapper;

import com.es.building.common.entity.TusrArea;

public interface TusrAreaMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrArea record);

    int insertSelective(TusrArea record);

    TusrArea selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrArea record);

    int updateByPrimaryKey(TusrArea record);
}