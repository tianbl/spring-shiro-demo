package com.es.building.common.mapper;

import com.es.building.common.entity.TusrDeviceType;

public interface TusrDeviceTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrDeviceType record);

    int insertSelective(TusrDeviceType record);

    TusrDeviceType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrDeviceType record);

    int updateByPrimaryKey(TusrDeviceType record);
}