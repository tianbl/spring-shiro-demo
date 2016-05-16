package com.es.building.common.mapper;

import com.es.building.common.entity.TusrProfile;

public interface TusrProfileMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrProfile record);

    int insertSelective(TusrProfile record);

    TusrProfile selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrProfile record);

    int updateByPrimaryKey(TusrProfile record);
}