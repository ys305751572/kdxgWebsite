package com.leoman.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/3/21.
 */
@Entity
@Table(name = "tb_information_ws")
public class InformationWs extends BaseEntity{

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Transient
    private String year;
    @Transient
    private String monthday;

    @ManyToOne
    @JoinColumn(name = "type")
    private ClassifyWs classifyWs;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonthday() {
        return monthday;
    }

    public void setMonthday(String monthday) {
        this.monthday = monthday;
    }

    public ClassifyWs getClassifyWs() {
        return classifyWs;
    }

    public void setClassifyWs(ClassifyWs classifyWs) {
        this.classifyWs = classifyWs;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
