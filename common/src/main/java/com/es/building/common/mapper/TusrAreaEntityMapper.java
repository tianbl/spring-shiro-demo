package com.es.building.common.mapper;

import com.es.building.common.entity.TusrAreaEntity;

public interface TusrAreaEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrAreaEntity record);

    int insertSelective(TusrAreaEntity record);

    TusrAreaEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrAreaEntity record);

    int updateByPrimaryKey(TusrAreaEntity record);
}