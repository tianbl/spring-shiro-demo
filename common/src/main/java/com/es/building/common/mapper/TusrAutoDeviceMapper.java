package com.es.building.common.mapper;

import com.es.building.common.entity.TusrAutoDevice;

public interface TusrAutoDeviceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrAutoDevice record);

    int insertSelective(TusrAutoDevice record);

    TusrAutoDevice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrAutoDevice record);

    int updateByPrimaryKey(TusrAutoDevice record);
}