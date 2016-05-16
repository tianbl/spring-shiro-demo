package com.es.building.common.mapper;

import com.es.building.common.entity.TusrHistoryDetail;

public interface TusrHistoryDetailMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrHistoryDetail record);

    int insertSelective(TusrHistoryDetail record);

    TusrHistoryDetail selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrHistoryDetail record);

    int updateByPrimaryKey(TusrHistoryDetail record);
}