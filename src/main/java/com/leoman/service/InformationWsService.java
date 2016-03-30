package com.leoman.service;

import com.leoman.entity.InformationWs;
import com.leoman.service.common.ICommonService;
import org.springframework.data.domain.Page;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface InformationWsService extends ICommonService<InformationWs>{

    public Page<InformationWs> findPage(String title,Integer type,Integer status,int pagenum,int pagesize);

    public void publish(Long[] ids);

}
