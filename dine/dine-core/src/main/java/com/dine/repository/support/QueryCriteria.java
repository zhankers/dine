package com.dine.repository.support;

/**
 * @author: yaunde
 * @date: 2020-10-31 00:37
 */
public interface QueryCriteria<T> {

    /**
     * 实体对象（子类实现）
     *
     * @return 泛型 T
     */
    T getEntity();
}
