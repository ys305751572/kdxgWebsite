package com.leoman.dao;

import com.leoman.entity.Information;
import com.leoman.entity.InformationWs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface InformationWsDao extends JpaRepository<InformationWs,Long>,JpaSpecificationExecutor<InformationWs>{


}
