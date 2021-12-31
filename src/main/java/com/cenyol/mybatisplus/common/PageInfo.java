package com.cenyol.mybatisplus.common;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/***
 * @author dqliu
 * @since 2018/2/6
 * Copyright: 2016 www.ctrip.com Inc. All rights reserved.
 */

public class PageInfo<T> {

    /**
     * 每页显示集合
     */
    private List<T> list = new ArrayList<>();

    /**
     * 总条数
     */
    private int total;

    /**
     * 总页数
     */
    private int totalPage;

    /**
     * 当前页
     */
    private int page;

    /**
     * 显示条数
     */
    private int pageSize;

    /**
     * 起始数目
     */
    private int pageFirst = 0;

    public PageInfo(int page, int pageSize, int total) {
        this.page = page;
        this.pageSize = pageSize;

        this.total = total;
    }

    public PageInfo(int page, int pageSize, int total, int totalPage) {
        this.page = page;
        this.pageSize = pageSize;

        this.total = total;
    }

    public PageInfo() {
        this.setList(Collections.emptyList());
        this.total = 0;
    }

    public int getTotalPage() {
        if (total <= 0) {
            return 0;
        }
        totalPage = total / pageSize;
        if (total % pageSize > 0) {
            totalPage++;
        }
        return totalPage;
    }

    public static int getPageFirst(int pageNo, int pageSize) {
        //如果第一页，则从0开始
        if (1 >= pageNo) {
            return 0;
        } else {
            return (pageNo - 1) * pageSize;
        }
    }

    public int getPagefirst() {
        return pageFirst;
    }

    public void setPagefirst(int pageFirst) {
        this.pageFirst = pageFirst;
    }

    public void setTotalPage(int totalpage) {
        this.totalPage = totalpage;
    }

    public List<T> getList() {
        return list;
    }

    public PageInfo setList(List<T> list) {
        this.list = list;
        return this;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getFirst() {
        return (page - 1) * pageSize;
    }

}

