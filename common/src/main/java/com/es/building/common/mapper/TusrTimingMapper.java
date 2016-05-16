package com.es.building.common.mapper;

import com.es.building.common.entity.TusrTiming;

public interface TusrTimingMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrTiming record);

    int insertSelective(TusrTiming record);

    TusrTiming selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrTiming record);

    int updateByPrimaryKey(TusrTiming record);
}