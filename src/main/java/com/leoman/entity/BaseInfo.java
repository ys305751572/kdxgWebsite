package com.leoman.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Administrator on 2016/4/11.
 */
@Entity
@Table(name = "tb_single_ws")
public class BaseInfo extends BaseEntity{

    private String content;

    private Integer type;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
