package com.es.building.common.pager;

import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;


public interface BaseService<T> {
    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Object key);

    int delete(T key);

    int deleteByPrimaryKey(Object key);

    int updateByPrimaryKey(T record);

    int updateByPrimaryKeySelective(T record);

    List<T> selectByParams(Map<String, Object> params);

    PageInfo<T> selectByParams(Map<String, Object> params, int pageNum, int pageSize);

}
