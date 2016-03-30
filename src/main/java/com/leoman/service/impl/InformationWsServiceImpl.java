package com.leoman.service.impl;

import com.leoman.dao.InformationWsDao;
import com.leoman.entity.Information;
import com.leoman.entity.InformationWs;
import com.leoman.service.InformationWsService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/3/21.
 */
@Service
public class InformationWsServiceImpl implements InformationWsService{

    @Autowired
    private InformationWsDao dao;

    @Override
    public Page<InformationWs> findPage(final String title,final Integer type,Integer status, int pagenum, int pagesize) {

        Specification<InformationWs> spec = new Specification<InformationWs>() {
            @Override
            public Predicate toPredicate(Root<InformationWs> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<Predicate>();
                if(StringUtils.isNotBlank(title)) {
                    list.add(criteriaBuilder.like(root.get("title").as(String.class),"%" + title + "%"));
                }
                if(type != null) {
                    list.add(criteriaBuilder.equal(root.get("type").as(String.class),type));
                }
                return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
            }
        };
        return dao.findAll(spec,new PageRequest(pagenum - 1,pagesize, Sort.Direction.DESC,"id"));
    }

    @Override
    public void publish(Long[] ids) {
        for(Long id : ids) {
            publishInformation(id);
        }
    }

    public void publishInformation(Long id) {
        InformationWs info = dao.findOne(id);
        info.setStatus(1);
        dao.save(info);
    }

    @Override
    public List<InformationWs> findAll() {
        return null;
    }

    @Override
    public Page<InformationWs> find(int pageNum, int pageSize) {
        return null;
    }

    @Override
    public Page<InformationWs> find(int pageNum) {
        return null;
    }

    @Override
    public InformationWs getById(Long id) {
        return dao.findOne(id);
    }

    @Override
    public InformationWs deleteById(Long id) {
        dao.delete(id);
        return null;
    }

    @Override
    public InformationWs create(InformationWs informationWs) {
        return dao.save(informationWs);
    }

    @Override
    public InformationWs update(InformationWs informationWs) {
        return dao.save(informationWs);
    }

    @Override
    public void deleteAll(Long[] ids) {
        for (Long id : ids ) {
            this.deleteById(id);
        }
    }
}
