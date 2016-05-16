package com.es.building.common.mapper;

import com.es.building.common.entity.TusrVirtualDevice;

public interface TusrVirtualDeviceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrVirtualDevice record);

    int insertSelective(TusrVirtualDevice record);

    TusrVirtualDevice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrVirtualDevice record);

    int updateByPrimaryKey(TusrVirtualDevice record);
}