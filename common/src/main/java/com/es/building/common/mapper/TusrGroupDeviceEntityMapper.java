package com.es.building.common.mapper;

import com.es.building.common.entity.TusrGroupDeviceEntity;

public interface TusrGroupDeviceEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrGroupDeviceEntity record);

    int insertSelective(TusrGroupDeviceEntity record);

    TusrGroupDeviceEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrGroupDeviceEntity record);

    int updateByPrimaryKey(TusrGroupDeviceEntity record);
}