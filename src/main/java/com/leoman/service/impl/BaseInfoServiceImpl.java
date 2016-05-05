package com.leoman.service.impl;

import com.leoman.dao.BaseInfoDao;
import com.leoman.entity.BaseInfo;
import com.leoman.service.BaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/4/11.
 */
@Service
public class BaseInfoServiceImpl implements BaseInfoService{

    @Autowired
    private BaseInfoDao dao;

    @Override
    public BaseInfo findByType(Integer type) {
        return dao.findByType(type);
    }

    @Override
    public List<BaseInfo> findAll() {
        return null;
    }

    @Override
    public Page<BaseInfo> find(int pageNum, int pageSize) {
        return null;
    }

    @Override
    public Page<BaseInfo> find(int pageNum) {
        return null;
    }

    @Override
    public BaseInfo getById(Long id) {
        return null;
    }

    @Override
    public BaseInfo deleteById(Long id) {
        return null;
    }

    @Override
    public BaseInfo create(BaseInfo baseInfo) {
        return null;
    }

    @Override
    public BaseInfo update(BaseInfo baseInfo) {
        return null;
    }

    @Override
    public void deleteAll(Long[] ids) {

    }
}
