package com.es.building.common.pager;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;


public abstract class BaseServiceImpl<T> implements BaseService<T> {
    private BaseMaper<T> baseMaper;

    public void setBaseMaper(BaseMaper<T> baseMaper) {
        this.baseMaper = baseMaper;
    }

    @Override
    public int insert(T record) {
        return baseMaper.insert(record);
    }

    @Override
    public int insertSelective(T record) {
        return baseMaper.insertSelective(record);
    }

    @Override
    public T selectByPrimaryKey(Object key) {
        return (T) baseMaper.selectByPrimaryKey(key);
    }

    @Override
    public int delete(T key) {
        return baseMaper.delete(key);
    }

    @Override
    public int deleteByPrimaryKey(Object key) {
        return baseMaper.deleteByPrimaryKey(key);
    }

    @Override
    public int updateByPrimaryKey(T record) {
        return baseMaper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return baseMaper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<T> selectByParams(Map<String, Object> params) {
        return baseMaper.selectByParams(params);
    }

    @Override
    public PageInfo<T> selectByParams(Map<String, Object> params, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(baseMaper.selectByParams(params));
    }
}

