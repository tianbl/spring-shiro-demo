package com.es.building.common.mapper;

import com.es.building.common.entity.TusrUserAreaEntity;

public interface TusrUserAreaEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrUserAreaEntity record);

    int insertSelective(TusrUserAreaEntity record);

    TusrUserAreaEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrUserAreaEntity record);

    int updateByPrimaryKey(TusrUserAreaEntity record);
}