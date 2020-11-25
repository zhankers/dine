package com.dine.repository.support.impl;


import com.dine.repository.support.LambdaJpaRepository;
import com.dine.repository.support.Wrapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author yaunde
 * @Description: 2.自定义repository的方法接口实现类,作为Repository代理的自定义类来执行,该类主要提供自定义的公用方法
 * 自定义repository的方法接口实现类,该类主要提供自定义的公用方法
 * @Authr: yaunde
 * @Date: 2020-10-22 00:04
 */
public class SimpleLambdaJpaRepository<T, ID extends Serializable> extends SimpleJpaRepository<T, Serializable>
        implements LambdaJpaRepository<T, Serializable> {
    /**
     * 持久化上下文
     */
    private final EntityManager entityManager;

    public SimpleLambdaJpaRepository(JpaEntityInformation<T, ?> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.entityManager = entityManager;
    }

    public SimpleLambdaJpaRepository(Class<T> domainClass, EntityManager em) {
        super(domainClass, em);
        this.entityManager = em;
    }

    @Transactional
    @Override
    public int insert(T entity) {
        System.out.println("----------------");
        return 0;
    }

    @Transactional
    @Override
    public int deleteByMap(Map<String, Object> columnMap) {
        return 0;
    }
    @Transactional
    @Override
    public int delete(Wrapper<T> wrapper) {
        return 0;
    }
    @Transactional
    @Override
    public int delete(Specification<T> wrapper) {
        return 0;
    }
    @Transactional
    @Override
    public int deleteBatchIds(Collection<? extends Serializable> idList) {
        return 0;
    }
    @Transactional
    @Override
    public int updateById(T entity) {
        return 0;
    }
    @Transactional
    @Override
    public int update(T entity, Wrapper<T> updateWrapper) {
        return 0;
    }

    @Override
    public T selectById(Serializable serializable) {
        return null;
    }

    @Override
    public List<T> selectBatchIds(Collection<? extends Serializable> idList) {
        return null;
    }


    @Override
    public List<T> selectByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public T selectOne(Wrapper<T> queryWrapper) {
        return null;
    }

    @Override
    public Integer selectCount(Wrapper<T> queryWrapper) {
        return null;
    }

    @Override
    public List<T> selectList(Wrapper<T> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> selectMaps(Wrapper<T> queryWrapper) {
        return null;
    }

    @Override
    public List<Object> selectObjs(Wrapper<T> queryWrapper) {
        return null;
    }

    @Override
    public Page<T> selectPage(Pageable page, Wrapper<T> queryWrapper) {
        return null;
    }

    @Override
    public Page<Map<String, Object>> selectMapsPage(Pageable page, Wrapper<T> queryWrapper) {
        return null;
    }
}
