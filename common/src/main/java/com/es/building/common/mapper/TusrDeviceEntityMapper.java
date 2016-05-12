package com.es.building.common.mapper;

import com.es.building.common.entity.TusrDeviceEntity;

public interface TusrDeviceEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrDeviceEntity record);

    int insertSelective(TusrDeviceEntity record);

    TusrDeviceEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrDeviceEntity record);

    int updateByPrimaryKey(TusrDeviceEntity record);
}