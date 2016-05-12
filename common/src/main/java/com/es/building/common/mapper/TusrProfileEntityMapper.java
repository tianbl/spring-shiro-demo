package com.es.building.common.mapper;

import com.es.building.common.entity.TusrProfileEntity;

public interface TusrProfileEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrProfileEntity record);

    int insertSelective(TusrProfileEntity record);

    TusrProfileEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrProfileEntity record);

    int updateByPrimaryKey(TusrProfileEntity record);
}