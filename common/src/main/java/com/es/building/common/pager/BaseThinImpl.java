package com.es.building.common.pager;

import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;


public abstract class BaseThinImpl<T> implements BaseThin<T> {
    private BaseService<T> baseService;

    public void setBaseService(BaseService<T> baseService) {
        this.baseService = baseService;
    }

    @Override
    public int insert(T record) {
        return baseService.insert(record);
    }

    @Override
    public int insert(List<T> lst) {
        int qty = 0;
        for (T t : lst) {
            qty += insert(t);
        }
        return qty;
    }

    @Override
    public int insertSelective(T record) {
        return baseService.insertSelective(record);
    }

    @Override
    public T selectByPrimaryKey(Object key) {
        return (T) baseService.selectByPrimaryKey(key);
    }

    @Override
    public int delete(T key) {
        return baseService.delete(key);
    }

    @Override
    public int deleteByPrimaryKey(Object key) {
        return baseService.deleteByPrimaryKey(key);
    }

    @Override
    public int updateByPrimaryKey(T record) {
        return baseService.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return baseService.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<T> selectByParams(Map<String, Object> params) {
        return baseService.selectByParams(params);
    }

    @Override
    public PageInfo<T> selectByParams(Map<String, Object> params, int pageNum, int pageSize) {
        return baseService.selectByParams(params, pageNum, pageSize);
    }
}

