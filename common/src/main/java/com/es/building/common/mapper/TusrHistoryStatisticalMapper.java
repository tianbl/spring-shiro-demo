package com.es.building.common.mapper;

import com.es.building.common.entity.TusrHistoryStatistical;

public interface TusrHistoryStatisticalMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrHistoryStatistical record);

    int insertSelective(TusrHistoryStatistical record);

    TusrHistoryStatistical selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrHistoryStatistical record);

    int updateByPrimaryKey(TusrHistoryStatistical record);
}