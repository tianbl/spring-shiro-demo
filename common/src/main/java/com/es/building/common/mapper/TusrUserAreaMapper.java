package com.es.building.common.mapper;

import com.es.building.common.entity.TusrUserArea;

public interface TusrUserAreaMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrUserArea record);

    int insertSelective(TusrUserArea record);

    TusrUserArea selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrUserArea record);

    int updateByPrimaryKey(TusrUserArea record);
}