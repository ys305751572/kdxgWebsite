package com.leoman.service.impl;

import com.leoman.dao.ClassifyWsDao;
import com.leoman.entity.ClassifyWs;
import com.leoman.service.ClassifyWsService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/3/30.
 */
@Service
public class ClassifyWsServiceImpl implements ClassifyWsService {

    @Autowired
    private ClassifyWsDao dao;

    @Override
    public Page<ClassifyWs> findPage(final String name, int pagenum, int pagesize) {

        Specification<ClassifyWs> spec = new Specification<ClassifyWs>() {
            @Override
            public Predicate toPredicate(Root<ClassifyWs> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<Predicate>();
                if(StringUtils.isNotBlank(name)) {
                    list.add(criteriaBuilder.like(root.get("name").as(String.class),"%" + name + "%"));
                }
                return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
            }
        };
        return dao.findAll(spec,new PageRequest(pagenum - 1,pagesize, Sort.Direction.DESC,"id"));
    }




    @Override
    public List<ClassifyWs> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<ClassifyWs> find(int pageNum, int pageSize) {
        return null;
    }

    @Override
    public Page<ClassifyWs> find(int pageNum) {
        return null;
    }

    @Override
    public ClassifyWs getById(Long id) {
        return dao.findOne(id);
    }

    @Override
    public ClassifyWs deleteById(Long id) {
        dao.delete(id);
        return null;
    }

    @Override
    public ClassifyWs create(ClassifyWs classifyws) {
        return dao.save(classifyws);
    }

    @Override
    public ClassifyWs update(ClassifyWs classifyws) {
        return dao.save(classifyws);
    }

    @Override
    public void deleteAll(Long[] ids) {
        for (Long id : ids ) {
            this.deleteById(id);
        }
    }

}