package com.leoman.dao;

import com.leoman.entity.BaseInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2016/4/11.
 */
public interface BaseInfoDao extends JpaRepository<BaseInfo,Long>{

    @Query(value = "select a from BaseInfo a where a.type = ?1")
    public BaseInfo findByType(Integer type);
}
