package com.es.building.common.mapper;

import com.es.building.common.entity.TusrGroupTimingEntity;

public interface TusrGroupTimingEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrGroupTimingEntity record);

    int insertSelective(TusrGroupTimingEntity record);

    TusrGroupTimingEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrGroupTimingEntity record);

    int updateByPrimaryKey(TusrGroupTimingEntity record);
}