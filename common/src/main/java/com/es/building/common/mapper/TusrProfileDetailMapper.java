package com.es.building.common.mapper;

import com.es.building.common.entity.TusrProfileDetail;

public interface TusrProfileDetailMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrProfileDetail record);

    int insertSelective(TusrProfileDetail record);

    TusrProfileDetail selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrProfileDetail record);

    int updateByPrimaryKey(TusrProfileDetail record);
}