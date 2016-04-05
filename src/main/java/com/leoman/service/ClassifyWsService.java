package com.leoman.service;

import com.leoman.entity.ClassifyWs;
import com.leoman.entity.InformationWs;
import com.leoman.service.common.ICommonService;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * Created by Administrator on 2016/3/30.
 */
public interface ClassifyWsService extends ICommonService<ClassifyWs> {

    public Page<ClassifyWs> findPage(String name, int pagenum, int pagesize);

}
