package com.es.building.common.mapper;

import com.es.building.common.entity.TusrAutoDeviceEntity;

public interface TusrAutoDeviceEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrAutoDeviceEntity record);

    int insertSelective(TusrAutoDeviceEntity record);

    TusrAutoDeviceEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrAutoDeviceEntity record);

    int updateByPrimaryKey(TusrAutoDeviceEntity record);
}