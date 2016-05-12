package com.es.building.common.mapper;

import com.es.building.common.entity.TusrHistoryDetailEntity;

public interface TusrHistoryDetailEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrHistoryDetailEntity record);

    int insertSelective(TusrHistoryDetailEntity record);

    TusrHistoryDetailEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrHistoryDetailEntity record);

    int updateByPrimaryKey(TusrHistoryDetailEntity record);
}