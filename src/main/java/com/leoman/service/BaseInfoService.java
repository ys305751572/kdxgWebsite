package com.leoman.service;

import com.leoman.entity.BaseInfo;
import com.leoman.service.common.ICommonService;

/**
 * Created by Administrator on 2016/4/11.
 */
public interface BaseInfoService extends ICommonService<BaseInfo>{

    public BaseInfo findByType(Integer type);
}
