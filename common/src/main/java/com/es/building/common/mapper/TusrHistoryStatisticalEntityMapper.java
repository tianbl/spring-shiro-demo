package com.es.building.common.mapper;

import com.es.building.common.entity.TusrHistoryStatisticalEntity;

public interface TusrHistoryStatisticalEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrHistoryStatisticalEntity record);

    int insertSelective(TusrHistoryStatisticalEntity record);

    TusrHistoryStatisticalEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrHistoryStatisticalEntity record);

    int updateByPrimaryKey(TusrHistoryStatisticalEntity record);
}