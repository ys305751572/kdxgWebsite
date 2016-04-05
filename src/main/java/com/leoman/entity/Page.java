package com.leoman.entity;

import java.util.List;

/**
 * Created by Administrator on 2016/4/5.
 */
public class Page {

    private Integer pagenum;

    private Integer pagesize;

    private boolean isHasEnd;

    private List list;

    public Integer getPagenum() {
        return pagenum;
    }

    public void setPagenum(Integer pagenum) {
        this.pagenum = pagenum;
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }

    public boolean isHasEnd() {
        return isHasEnd;
    }

    public void setHasEnd(boolean hasEnd) {
        isHasEnd = hasEnd;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }
}
