package com.es.building.common.mapper;

import com.es.building.common.entity.TusrTimingEntity;

public interface TusrTimingEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrTimingEntity record);

    int insertSelective(TusrTimingEntity record);

    TusrTimingEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrTimingEntity record);

    int updateByPrimaryKey(TusrTimingEntity record);
}