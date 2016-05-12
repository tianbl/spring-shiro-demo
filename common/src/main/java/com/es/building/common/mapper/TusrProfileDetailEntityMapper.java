package com.es.building.common.mapper;

import com.es.building.common.entity.TusrProfileDetailEntity;

public interface TusrProfileDetailEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrProfileDetailEntity record);

    int insertSelective(TusrProfileDetailEntity record);

    TusrProfileDetailEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrProfileDetailEntity record);

    int updateByPrimaryKey(TusrProfileDetailEntity record);
}