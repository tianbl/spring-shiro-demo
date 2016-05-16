package com.es.building.common.mapper;

import com.es.building.common.entity.TusrGroupDevice;

public interface TusrGroupDeviceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrGroupDevice record);

    int insertSelective(TusrGroupDevice record);

    TusrGroupDevice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrGroupDevice record);

    int updateByPrimaryKey(TusrGroupDevice record);
}