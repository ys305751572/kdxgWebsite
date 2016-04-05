package com.leoman.dao;

import com.leoman.entity.ClassifyWs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2016/3/30.
 */
public interface ClassifyWsDao extends JpaRepository<ClassifyWs,Long>,JpaSpecificationExecutor<ClassifyWs> {
}
