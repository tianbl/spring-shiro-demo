package com.es.building.common.util;

import com.github.pagehelper.PageInfo;

/**
 * Created by
 * wangyoupeng
 * on 2016/1/21.
 */
public class PageInfoUtil {

    public static void transformPageInfo(PageInfo target,PageInfo original){

        target.setPageNum(original.getPageNum());
        target.setPageSize(original.getPageSize());
        target.setSize(original.getSize());
        target.setStartRow(original.getStartRow());
        target.setEndRow(original.getEndRow());
        target.setTotal(original.getTotal());
        target.setPages(original.getPages());
        target.setFirstPage(original.getFirstPage());
        target.setPrePage(original.getPrePage());
        target.setNextPage(original.getNextPage());
        target.setLastPage(original.getLastPage());
        target.setIsFirstPage(original.isIsFirstPage());
        target.setIsLastPage(original.isIsLastPage());
        target.setHasPreviousPage(original.isHasPreviousPage());
        target.setHasNextPage(original.isHasNextPage());
        target.setNavigatePages(original.getNavigatePages());
        target.setNavigatepageNums(original.getNavigatepageNums());
    }
}
