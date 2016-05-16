package com.es.building.common.mapper;

import com.es.building.common.entity.TusrGroupTiming;

public interface TusrGroupTimingMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrGroupTiming record);

    int insertSelective(TusrGroupTiming record);

    TusrGroupTiming selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrGroupTiming record);

    int updateByPrimaryKey(TusrGroupTiming record);
}