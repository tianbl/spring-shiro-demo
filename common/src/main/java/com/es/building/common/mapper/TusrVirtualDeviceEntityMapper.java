package com.es.building.common.mapper;

import com.es.building.common.entity.TusrVirtualDeviceEntity;

public interface TusrVirtualDeviceEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrVirtualDeviceEntity record);

    int insertSelective(TusrVirtualDeviceEntity record);

    TusrVirtualDeviceEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrVirtualDeviceEntity record);

    int updateByPrimaryKey(TusrVirtualDeviceEntity record);
}