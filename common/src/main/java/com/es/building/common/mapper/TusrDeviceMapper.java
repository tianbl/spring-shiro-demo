package com.es.building.common.mapper;

import com.es.building.common.entity.TusrDevice;

public interface TusrDeviceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrDevice record);

    int insertSelective(TusrDevice record);

    TusrDevice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrDevice record);

    int updateByPrimaryKey(TusrDevice record);
}