package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.SingleDao;
import com.leoman.entity.Single;
import com.leoman.service.SingleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/31.
 */
@Service
public class SingleServiceImpl implements SingleService {

    @Autowired
    private SingleDao dao;

    @Override
    public List<Single> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<Single> find(int pageNum, int pageSize) {
        return dao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<Single> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SZIE);
    }

    @Override
    public Single getById(Long id) {
        return dao.findOne(id);
    }

    @Override
    public Single deleteById(Long id) {
        Single single = dao.findOne(id);
        dao.delete(single);
        return null;
    }

    @Override
    public Single create(Single single) {
        return dao.save(single);
    }

    @Override
    public Single update(Single single) {
        return dao.save(single);
    }

    @Override
    public void deleteAll(Long[] ids) {
    }
}
