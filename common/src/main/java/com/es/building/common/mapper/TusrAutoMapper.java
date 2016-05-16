package com.es.building.common.mapper;

import com.es.building.common.entity.TusrAuto;

public interface TusrAutoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TusrAuto record);

    int insertSelective(TusrAuto record);

    TusrAuto selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TusrAuto record);

    int updateByPrimaryKey(TusrAuto record);
}