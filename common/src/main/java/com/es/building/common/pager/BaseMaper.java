package com.es.building.common.pager;

import java.util.List;
import java.util.Map;


public interface BaseMaper<T> {

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Object key);

    int delete(T key);

    int deleteByPrimaryKey(Object key);

    int updateByPrimaryKey(T record);

    int updateByPrimaryKeySelective(T record);

    List<T> selectByParams(Map<String, Object> params);
}
