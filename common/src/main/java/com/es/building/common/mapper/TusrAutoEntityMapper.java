package com.es.building.common.mapper;

import com.es.building.common.entity.TusrAutoEntity;

public interface TusrAutoEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrAutoEntity record);

    int insertSelective(TusrAutoEntity record);

    TusrAutoEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrAutoEntity record);

    int updateByPrimaryKey(TusrAutoEntity record);
}